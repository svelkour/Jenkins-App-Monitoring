$lastModifiedDate = (Get-Item "\\ab-depts.capitalsource.com\departments\TraderDesk\My Documents\Live Rate Download.xls").LastWriteTime.ToString("MM-dd-yyyy")

$curDate = (get-date).ToString("MM-dd-yyyy")
if ($lastModifiedDate -lt $curDate)
        {
            Write-Host ("The latest Standard Index Rate Source File is NOT YET available")
            
            exit 1   
        }

else
        {
            Write-Host ("The latest Standard Index Rate Source File is now available")
            exit 0             
        }
        
