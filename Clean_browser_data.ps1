# Function to clear Chrome cookies and cache
function Clear-ChromeCookiesCache {
    # Get the current user's profile path
    $userProfile = [System.Environment]::GetFolderPath('UserProfile')
    # Define paths for Chrome cache and cookies
    $cachePath = "$userProfile\AppData\Local\Google\Chrome\User Data\Default\Cache"
    $cookiesPath = "$userProfile\AppData\Local\Google\Chrome\User Data\Default\Cookies"
    $storagePath = "$userProfile\AppData\Local\Google\Chrome\User Data\Default\Service Worker\CacheStorage"
    # Check if Chrome is running and prompt the user to close it
    $chromeProcess = Get-Process -Name chrome -ErrorAction SilentlyContinue
    if ($chromeProcess) {
        Write-Output "Chrome is currently running. Please close all Chrome windows and tabs before proceeding."
        return
    }
    # Delete cache files
    if (Test-Path $cachePath) {
        Write-Output "Clearing Chrome cache..."
        Remove-Item "$cachePath\*" -Recurse -Force
    } else {
        Write-Output "Chrome cache folder not found."
    }
    # Delete cookies file
    if (Test-Path $cookiesPath) {
        Write-Output "Deleting Chrome cookies..."
        Remove-Item $cookiesPath -Force
    } else {
        Write-Output "Chrome cookies file not found."
    }
    # Delete storage files
    if (Test-Path $storagePath) {
        Write-Output "Clearing Chrome storage..."
        Remove-Item "$storagePath\*" -Recurse -Force
    } else {
        Write-Output "Chrome storage folder not found."
    }    

    Write-Output "Chrome cookies, cache, and storage have been cleared."
}

# Execute the function to clear Chrome cookies and cache
Clear-ChromeCookiesCache