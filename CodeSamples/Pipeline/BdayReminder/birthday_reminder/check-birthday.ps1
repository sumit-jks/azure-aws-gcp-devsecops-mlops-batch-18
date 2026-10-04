# ==========================================
# Birthday CSV -> Slack Notification
# ==========================================

$csvPath = "friends-bdays.csv"

# IMPORTANT:
# Yahan apna NEW Slack webhook URL paste karo
$webhookUrl = "https://hooks.slack.com/services/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"


# Today's date
$today = Get-Date


# Read CSV and find today's birthdays
$birthdaysToday = Import-Csv $csvPath | Where-Object {

    try {
        $dob = [datetime]::ParseExact(
            $_.DOB,
            "dd-MM-yyyy",
            [System.Globalization.CultureInfo]::InvariantCulture
        )

        ($dob.Day -eq $today.Day) -and
        ($dob.Month -eq $today.Month)
    }
    catch {
        $false
    }
}


# If birthday found
if ($birthdaysToday) {

    $message = "*Today's Birthdays*`n`n"

    foreach ($person in $birthdaysToday) {

        $message += "*Name:* $($person.Name)`n"
        $message += "*DOB:* $($person.DOB)`n"
        $message += "`n"
    }

    $message += "Have a great day!"


    # Create Slack request
    $body = @{
        text = $message
    } | ConvertTo-Json


    # Send to Slack
    try {

        Invoke-RestMethod `
            -Uri $webhookUrl `
            -Method Post `
            -ContentType "application/json" `
            -Body $body

        Write-Host "SUCCESS: Birthday notification sent to Slack." -ForegroundColor Green
    }
    catch {

        Write-Host "ERROR: Could not send Slack notification." -ForegroundColor Red
        Write-Host $_.Exception.Message -ForegroundColor Red
    }
}
else {

    Write-Host "No birthday today." -ForegroundColor Cyan
}
