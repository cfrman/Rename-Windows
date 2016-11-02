 param(
       [parameter(Mandatory=$True)]
       $Computer,
       [parameter(Mandatory=$True)]
       $LNumber,
       [parameter(Mandatory=$True)]
       $OSType
)

#$AdComputer = Get-ADComputer -identity nuuuninu9128l3l
#$code = "IT"

$System = Get-WMIObject -ComputerName $Computer win32_computersystem 
$Serial = Get-WMIObject -ComputerName $Computer win32_bios | Select -Expand Serialnumber 

#$PCType = $System.PCSystemType
#$PCType = Switch ($PCType) {
#1 {"D"} #Desktop
#2 {"L"} #Laptop 

#}

$GeneratedName = "NUUCIT-LOAN$LNumber$OSType"
$GeneratedName

Rename-Computer -NewName $GeneratedName -ComputerName $Computer -DomainCredential TFAYD\$env:UserName -restart -Confirm

