$global:isHoliday = 0


#Function to determine if it's a Bank Holiday
Function isBankHoliday
{
  $DOY = (Get-Date).DayOfYear #DayOfYear
  $NYD = (Get-Date 1/1).DayOfYear #New Year Day (will need to be modified every couple years because of observed on date)
  $ID = (Get-Date 7/4).DayOfYear #Fourth of July is always on the 4th of July except when it isn't
  $VD = (Get-Date 11/11).DayOfYear #Veterans day is always on 11/11
  $XD = (Get-Date 12/25).DayOfYear #Xmas day (will need to be modified every couple years because of observed on date)

  If ($DOY -eq $NYD -or $DOY -eq $ID -or $DOY -eq $VD -or $DOY -eq $XD)
    {
      $global:isHoliday = 1
    }
#$MLKD calculated by finding the Monday between Jan14 and Jan22 (MLK is always 3rd Mon in Jan)
  if($DOY -gt 14 -and $DOY -lt 22 -and ((Get-Date).DayOfWeek) -like 'Monday')
  {
    $global:isHoliday = 1
  }

  #$PD calculated by finding the Monday between Feb14 and Feb22 (Presidents Day is always 3rd Mon in Feb)
  if($DOY -gt 45 -and $DOY -lt 53 -and ((Get-Date).DayOfWeek) -like 'Monday')
  {
    $global:isHoliday = 1
  }

  #$MD calculated by finding the Monday between May24 and June01 (Memorial Day is always last Mon in May)
  if($DOY -gt 144 -and $DOY -lt 152 -and ((Get-Date).DayOfWeek) -like 'Monday')
  {
    $global:isHoliday = 1
  }
#$LD calculated by finding the Monday between Aug31 and Sep8 (Labor Day is always first Mon in September)
  if($DOY -gt 243 -and $DOY -lt 251 -and (Get-Date).DayOfWeek -like 'Monday')
  {
    $global:isHoliday = 1
  }

  #$CD calculated by finding the Monday between Oct7 and Oct15 (Columbus Day is always second Mon in October)
  if($DOY -gt 280 -and $DOY -lt 288 -and ((Get-Date).DayOfWeek) -like 'Monday')
  {
    $global:isHoliday = 1
  }

  #$TD calculated by finding the Thursday between Nov21 and Nov29 (Thanksgiving Day is always fourth Thur in November)
  if($DOY -gt 325 -and $DOY -lt 333 -and ((Get-Date).DayOfWeek) -like 'Thursday')
  {
    $global:isHoliday = 1
  }
}

isBankHoliday

if($global:isHoliday -eq 1)
{
  echo "`$global:isHoliday = $global:isHoliday, therefore it must be a holiday."
  exit 1
}
else
{
  echo "`$global:isHoliday = $global:isHoliday, therefore it's not a holiday."
  exit 0
}