param(
    [string]$Config = (Join-Path $PSScriptRoot "screenshots.json"),
    [string]$Only   = "",
    [string]$Lang   = ""
)

$cfg = Get-Content $Config -Raw -Encoding UTF8 | ConvertFrom-Json
$baseUrl   = $cfg.baseUrl
$outputDir = Join-Path (Split-Path $Config -Parent) $cfg.outputDir

function Call-Api([string]$method, [string]$path, [string]$jsonBody) {
    $url = $baseUrl + $path
    try {
        $wc = New-Object System.Net.WebClient
        $wc.Proxy = [System.Net.GlobalProxySelection]::GetEmptyWebProxy()
        $wc.Encoding = [System.Text.Encoding]::UTF8
        $wc.Headers["Content-Type"] = "application/json; charset=utf-8"
        if ($method -eq "GET") {
            $raw = $wc.DownloadString($url)
        } else {
            if (-not $jsonBody) { $jsonBody = "{}" }
            $raw = $wc.UploadString($url, $method, $jsonBody)
        }
        if ($raw) { return ($raw | ConvertFrom-Json) }
    } catch {
        Write-Warning ("API error: " + $method + " " + $path + " - " + $_.Exception.Message)
    }
    return $null
}

function Post-Tool([string]$tool, [hashtable]$toolArgs) {
    $body = @{ args = $toolArgs } | ConvertTo-Json -Compress -Depth 5
    return Call-Api "POST" ("/api/" + $tool) $body
}

function Run-Step($step) {
    switch ($step.action) {
        "navigate" {
            Write-Host ("    navigate -> " + $step.formId) -ForegroundColor DarkCyan
            Post-Tool "navigate_to_record" @{ formId = $step.formId } | Out-Null
            Start-Sleep -Milliseconds 800
        }
        "select_tree" {
            $a = @{}
            if ($step.signature) { $a["signature"] = $step.signature }
            if ($step.formId)    { $a["formId"]    = $step.formId }
            Write-Host ("    select_tree -> " + $step.signature + $step.formId) -ForegroundColor DarkCyan
            Post-Tool "select_tree_node" $a | Out-Null
            Start-Sleep -Milliseconds 500
        }
        "expand_all" {
            Write-Host "    expand_all" -ForegroundColor DarkCyan
            Post-Tool "expand_collapse_tree" @{ expand = $true } | Out-Null
            Start-Sleep -Milliseconds 500
        }
        "collapse_all" {
            Write-Host "    collapse_all" -ForegroundColor DarkCyan
            Post-Tool "expand_collapse_tree" @{ expand = $false } | Out-Null
            Start-Sleep -Milliseconds 500
        }
        "click_menu" {
            Write-Host ("    click_menu -> " + $step.menuPath) -ForegroundColor DarkCyan
            Post-Tool "click_menu" @{ menuPath = $step.menuPath } | Out-Null
            Start-Sleep -Milliseconds 500
        }
        "wait" {
            $ms = [int]$step.ms
            Start-Sleep -Milliseconds $ms
        }
    }
}

function Take-Capture($capture, [string]$langCode) {
    if ($capture.annotations) {
        $annList = @()
        foreach ($ann in $capture.annotations) {
            $item = @{ controlName = $ann.control }
            if ($ann.label) {
                if ($ann.label.PSObject -and $ann.label.$langCode) {
                    $item["label"] = $ann.label.$langCode
                } else {
                    $item["label"] = [string]$ann.label
                }
            }
            if ($ann.color)     { $item["color"]     = $ann.color }
            if ($ann.showArrow) { $item["showArrow"] = $true }
            $annList += $item
        }
        $annJson = $annList | ConvertTo-Json -Compress -Depth 3
        if ($annList.Count -eq 1) { $annJson = "[" + $annJson + "]" }
        $body = @{ args = @{ annotations = $annJson } } | ConvertTo-Json -Compress -Depth 5
        $r = Call-Api "POST" "/api/take_annotated_screenshot" $body
    }
    elseif ($capture.target -and $capture.target -ne "form") {
        $r = Post-Tool "take_screenshot" @{ controlName = $capture.target }
    }
    else {
        $r = Post-Tool "take_screenshot" @{}
    }
    if ($r -and $r.success -and $r.imagePath) { return $r.imagePath }
    return $null
}

Write-Host ("[" + $cfg.project + "] Doc Screenshots") -ForegroundColor White
Write-Host ("Output: " + $outputDir) -ForegroundColor Gray

$health = Call-Api "GET" "/health" $null
if (-not ($health -and $health.success)) {
    Write-Host "ERROR: Cannot connect to automation server" -ForegroundColor Red
    exit 1
}
Write-Host "OK" -ForegroundColor Green

$langList = @{}
if ($Lang) {
    $match = $cfg.languages.PSObject.Properties | Where-Object { $_.Name -eq $Lang }
    if ($match) { $langList[$match.Name] = $match.Value }
    else { Write-Host ("Unknown lang: " + $Lang); exit 1 }
} else {
    foreach ($p in $cfg.languages.PSObject.Properties) { $langList[$p.Name] = $p.Value }
}

$shots = $cfg.screenshots
if ($Only) {
    $shots = @($shots | Where-Object { $_.id -eq $Only })
    if ($shots.Count -eq 0) { Write-Host ("Not found: " + $Only); exit 1 }
}

$n = 0
foreach ($langCode in $langList.Keys) {
    $langName = $langList[$langCode]
    $langDir  = Join-Path $outputDir $langCode
    Write-Host ("=== " + $langName + " (" + $langCode + ") ===") -ForegroundColor Yellow
    Post-Tool "switch_language" @{ language = $langName } | Out-Null
    Start-Sleep -Milliseconds 500
    if (-not (Test-Path $langDir)) { New-Item -ItemType Directory -Path $langDir -Force | Out-Null }

    foreach ($shot in $shots) {
        Write-Host ("  [" + $shot.id + "] " + $shot.description) -ForegroundColor Magenta
        foreach ($step in $shot.steps) { Run-Step $step }
        $srcPath = Take-Capture $shot.capture $langCode
        if ($srcPath) {
            $destPath = Join-Path $langDir ($shot.id + ".png")
            Copy-Item -Path $srcPath -Destination $destPath -Force
            Write-Host ("    => " + $destPath) -ForegroundColor Green
            $n++
        } else {
            Write-Host "    => FAILED" -ForegroundColor Red
        }
    }
}

if ($cfg.defaultLanguage) {
    $defName = ($cfg.languages.PSObject.Properties | Where-Object { $_.Name -eq $cfg.defaultLanguage }).Value
    if ($defName) { Post-Tool "switch_language" @{ language = $defName } | Out-Null }
}
Write-Host ("Done! " + $n + " screenshots.") -ForegroundColor Green
