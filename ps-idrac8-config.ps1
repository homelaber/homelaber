############################################################################
# CONFIGURAÇÃO iDRAC SERVIDORES DELL
# VERSÃO 0.1  || VALDECIR CARVALHO || 11/01/2017
# iDRAC VERSÃO 8
# É NECESSÁRIO BAIXAR E INSTALAR O RACADM DA URL >> http://downloads.dell.com/FOLDER02867225M/1/OM-DRAC-Dell-Web-WINX64-8.1.0-1518_A00.exe
# ESSE SCRIPT ATUALIZA/CONFIGURA OS SEGUINTES PARAMETROS DO iDRAC:
# --- TIME ZONE
# --- NTP SERVER 1
# --- NTP SERVER 2
#
#
# USO:
# 1. CONFIGURAR AS VARIAVEIS:
#    $exe        - caminho do programa racadm.exe
#    $user       - usuário para acessar o iDRAC
#    $pass       - senha para acessar o iDRAC
#    $servidores - lista de servidores para configurar
# 2. EXECUTAR O SCRIP
###########################################################################


clear-host
#DEFININDO VARIAVEIS
$exe = "C:\Program Files\Dell\SysMgt\rac5\racadm.exe"
$user = "root"
$pass = "Master1000"
$servidores = @("10.153.221.1", "10.153.221.2", "10.153.221.3", "10.153.221.4", "10.153.221.5")

foreach ($servidor in $servidores) {

   write-host "EXECUTANDO MUDANÇAS NO SERVIDOR: " $servidor -backgroundcolor Red
   & $exe -r $servidor -u $user -p $pass  --nocertwarn set iDRAC.Tuning.DefaultCredentialWarning Disabled
   & $exe -r $servidor -u $user -p $pass  --nocertwarn set iDRAC.time.timezone Brazil/East
   & $exe -r $servidor -u $user -p $pass  --nocertwarn set iDRAC.NTPConfigGroup.ntp1 10.153.239.240
   & $exe -r $servidor -u $user -p $pass  --nocertwarn set iDRAC.NTPConfigGroup.ntp2 10.153.239.240

   
    }

write-host "FIM DO PROCESSAMENTO" -backgroundcolor Red
