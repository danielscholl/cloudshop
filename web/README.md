ICACLS /grant WINDOWS\"IIS AppPool\DefaultAppPool":F

ICACLS . /grant "IIS AppPool\DefaultAppPool":F /t /c


ICACLS "C:\Users\degno\source\cloudshop" /grant "IIS AppPool\CloudShop":M /t