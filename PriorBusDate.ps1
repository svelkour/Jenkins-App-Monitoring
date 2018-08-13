 Function Get-LastWeekday{

    Param(
        [datetime]$today
    )

    Begin {

        $weekdays = @(
            'Monday'
            'Tuesday'
            'Wednesday'
            'Thursday'
            'Friday'
        )

    }

    Process {
        ForEach ($date in $today) {

            $assert = $date.addDays(-1)

            While ($weekdays -notcontains $assert.DayOfWeek) {

                $assert = $assert.addDays(-1)

            }

            $assert
        }
    }

}

$yesterday = Get-LastWeekday -today (get-date)

$filePriorDt = "$($yesterday.ToString('yyyy-MM-dd'))"
$filePriorDt
$fileName = "Report for Brad_S1AM-Discretionary Agg_$filePriorDt.xlsx"
$fileName
$filePath = "\\fcbancorp.ent\data\SQ1 Folders\Departments\Services\Technology\upload\S1AM\Archive\$fileName"
$filePath
if (Test-Path $filePath)
        {
            Write-Host ("File {0} exists" -f $filePath)
            
            exit 0   
        }

       else
        {
            Write-Host ("File {0} does not exist" -f $filePath)

            exit 1             
        }


