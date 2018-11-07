#!/bin/bash
source /home/jason/sas/xmmsas_20180620_1732/setsas.sh
export DATAPATH=/home/jason/sas/data/fb1


export SAS_CCFPATH=/home/jason/sas/ccf
test="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo $test

export SAS_ODF=$test"/odf"
cifbuild
export SAS_CCF=$test"/ccf.cif"
odfingest
name=`find $test -name "*.SAS"`
export SAS_ODF=$name



epchain
epchain withoutoftime=true
emchain
pn-filter
mos-filter
echo "finish pre-processing"


a=`find $test -name "*mos1S*"|head -n 1`
a=${a##*/}
a=`echo $a|cut -d- -f1`
a=${a/mos/}
b=`find $test -name "*mos2S*"|head -n 1`
b=${b##*/}
b=`echo $b|cut -d- -f1`
b=${b/mos/}
c=`find $test -name "*pn*"|head -n 1`
c=${c##*/}
c=`echo $c|cut -d- -f1`
c=${c/pn/}

temp=$a" "$b
cheese prefixm="$temp" prefixp="$c" scale=0.8 rate=1.0 dist=0.0 clobber=1 elow=400 ehigh=10000

mos-spectra prefix="$a" caldb=/home/jason/sas/esas/esas_caldb mask=0 elow=400 ehigh=750 ccd1=1 ccd2=1 ccd3=1 ccd4=1 ccd5=1 ccd6=0 ccd7=1
mos-spectra prefix="$a" caldb=/home/jason/sas/esas/esas_caldb mask=0 elow=750 ehigh=1250 ccd1=1 ccd2=1 ccd3=1 ccd4=1 ccd5=1 ccd6=0 ccd7=1
mos-spectra prefix="$a" caldb=/home/jason/sas/esas/esas_caldb mask=0 elow=2000 ehigh=7200 ccd1=1 ccd2=1 ccd3=1 ccd4=1 ccd5=1 ccd6=0 ccd7=1
mos-spectra prefix="$b" caldb=/home/jason/sas/esas/esas_caldb mask=0 elow=400 ehigh=750 ccd1=1 ccd2=1 ccd3=1 ccd4=1 ccd5=1 ccd6=1 ccd7=1
mos-spectra prefix="$b" caldb=/home/jason/sas/esas/esas_caldb mask=0 elow=750 ehigh=1250 ccd1=1 ccd2=1 ccd3=1 ccd4=1 ccd5=1 ccd6=1 ccd7=1
mos-spectra prefix="$b" caldb=/home/jason/sas/esas/esas_caldb mask=0 elow=2000 ehigh=7200 ccd1=1 ccd2=1 ccd3=1 ccd4=1 ccd5=1 ccd6=1 ccd7=1
pn-spectra prefix="$c" caldb=/home/jason/sas/esas/esas_caldb mask=0 elow=400 ehigh=750 quad1=1 quad2=1 quad3=1 quad4=1
pn-spectra prefix="$c" caldb=/home/jason/sas/esas/esas_caldb mask=0 elow=750 ehigh=1250 quad1=1 quad2=1 quad3=1 quad4=1
pn-spectra prefix="$c" caldb=/home/jason/sas/esas/esas_caldb mask=0 elow=2000 ehigh=7200 quad1=1 quad2=1 quad3=1 quad4=1

mos_back prefix="$a" caldb=/home/jason/sas/esas/esas_caldb diag=0 elow=400 ehigh=750 ccd1=1 ccd2=1 ccd3=1 ccd4=1 ccd5=1 ccd6=0 ccd7=1
mos_back prefix="$a" caldb=/home/jason/sas/esas/esas_caldb diag=0 elow=750 ehigh=1250 ccd1=1 ccd2=1 ccd3=1 ccd4=1 ccd5=1 ccd6=0 ccd7=1
mos_back prefix="$a" caldb=/home/jason/sas/esas/esas_caldb diag=0 elow=2000 ehigh=7200 ccd1=1 ccd2=1 ccd3=1 ccd4=1 ccd5=1 ccd6=0 ccd7=1
mos_back prefix="$b" caldb=/home/jason/sas/esas/esas_caldb diag=0 elow=400 ehigh=750 ccd1=1 ccd2=1 ccd3=1 ccd4=1 ccd5=1 ccd6=1 ccd7=1
mos_back prefix="$b" caldb=/home/jason/sas/esas/esas_caldb diag=0 elow=750 ehigh=1250 ccd1=1 ccd2=1 ccd3=1 ccd4=1 ccd5=1 ccd6=1 ccd7=1
mos_back prefix="$b" caldb=/home/jason/sas/esas/esas_caldb diag=0 elow=2000 ehigh=7200 ccd1=1 ccd2=1 ccd3=1 ccd4=1 ccd5=1 ccd6=1 ccd7=1
pn_back prefix="$c" caldb=/home/jason/sas/esas/esas_caldb diag=0 elow=400 ehigh=750 quad1=1 quad2=1 quad3=1 quad4=1
pn_back prefix="$c" caldb=/home/jason/sas/esas/esas_caldb diag=0 elow=750 ehigh=1250 quad1=1 quad2=1 quad3=1 quad4=1
pn_back prefix="$c" caldb=/home/jason/sas/esas/esas_caldb diag=0 elow=2000 ehigh=7200 quad1=1 quad2=1 quad3=1 quad4=1
echo "Finish ps mos"

rot-im-det-sky prefix="$a" mask=0 elow=400 ehigh=750 mode=1
rot-im-det-sky prefix="$a" mask=0 elow=750 ehigh=1250 mode=1
rot-im-det-sky prefix="$a" mask=0 elow=2000 ehigh=7200 mode=1
rot-im-det-sky prefix="$b" mask=0 elow=400 ehigh=750 mode=1
rot-im-det-sky prefix="$b" mask=0 elow=750 ehigh=1250 mode=1
rot-im-det-sky prefix="$b" mask=0 elow=2000 ehigh=7200 mode=1
rot-im-det-sky prefix="$c" mask=0 elow=400 ehigh=750 mode=1
rot-im-det-sky prefix="$c" mask=0 elow=750 ehigh=1250 mode=1
rot-im-det-sky prefix="$c" mask=0 elow=2000 ehigh=7200 mode=1

mv "mos"$a"-obj.pi" "mos"$a"-obj-ps.pi"
mv "mos"$a".rmf" "mos"$a"-ps.rmf"
mv "mos"$a".arf" "mos"$a"-ps.arf"
mv "mos"$a"-back.pi" "mos"$a"-back-ps.pi"
mv "mos"$a"-obj-im-sp-det.fits" "mos"$a"-sp-ps.fits"
mv "mos"$b"-obj.pi" "mos"$b"-obj-ps.pi"
mv "mos"$b".rmf" "mos"$b"-ps.rmf"
mv "mos"$b".arf" "mos"$b"-ps.arf"
mv "mos"$b"-back.pi" "mos"$b"-back-ps.pi"
mv "mos"$b"-obj-im-sp-det.fits" "mos"$b"-sp-ps.fits"
mv "pn"$c"-obj-os.pi" "pn"$c"-obj-os-ps.pi"
mv "pn"$c"-obj.pi" "pn"$c"-obj-ps.pi"
mv "pn"$c"-obj-oot.pi" "pn"$c"-obj-oot-ps.pi"
mv "pn"$c".rmf" "pn"$c"-ps.rmf"
mv "pn"$c".arf" "pn"$c"-ps.arf"
mv "pn"$c"-back.pi" "pn"$c"-back-ps.pi"
mv "pn"$c"-obj-im-sp-det.fits" "pn"$c"-sp-ps.fits"

echo "finish pn mos rot"


grppha "mos"$a"-obj-ps.pi" "mos"$a"-obj-ps-grp.pi" "chkey BACKFILE mos"$a"-back-ps.pi & chkey RESPFILE mos"$a"-ps.rmf & chkey ANCRFILE mos"$a"-ps.arf & group min 100 & exit"
grppha "mos"$b"-obj-ps.pi" "mos"$b"-obj-ps-grp.pi" "chkey BACKFILE mos"$b"-back-ps.pi & chkey RESPFILE mos$b-ps.rmf & chkey ANCRFILE mos"$b"-ps.arf & group min 100 & exit"
grppha "pn"$c"-obj-os-ps.pi" "pn"$c"-obj-os-ps-grp.pi" "chkey BACKFILE pn"$c"-back-ps.pi & chkey RESPFILE pn"$c"-ps.rmf & chkey ANCRFILE pn"$c"-ps.arf & group min 100 & exit"

echo "finish groupedset"



proton_scale caldb=/home/jason/sas/esas/esas_caldb mode=1 detector=1 maskfile="mos"$a"-sp-ps.fits" specfile="mos"$a"-obj-ps.pi"
proton_scale caldb=/home/jason/sas/esas/esas_caldb mode=1 detector=2 maskfile="mos"$b"-sp-ps.fits" specfile="mos"$b"-obj-ps.pi"
proton_scale caldb=/home/jason/sas/esas/esas_caldb mode=1 detector=3 maskfile="pn"$c"-sp-ps.fits" specfile="pn"$c"-obj-ps.pi"

mos-spectra prefix="$a" caldb=/home/jason/sas/esas/esas_caldb mask=0 elow=0 ehigh=0 ccd1=1 ccd2=1 ccd3=1 ccd4=1 ccd5=1 ccd6=0 ccd7=1
mos-spectra prefix="$b" caldb=/home/jason/sas/esas/esas_caldb mask=0 elow=0 ehigh=0 ccd1=1 ccd2=1 ccd3=1 ccd4=1 ccd5=1 ccd6=1 ccd7=1
pn-spectra prefix="$c" caldb=/home/jason/sas/esas/esas_caldb mask=0 elow=0 ehigh=0 quad1=1 quad2=1 quad3=1 quad4=1
mos_back prefix="$a" caldb=/home/jason/sas/esas/esas_caldb diag=0 elow=0 ehigh=0 ccd1=1 ccd2=1 ccd3=1 ccd4=1 ccd5=1 ccd6=0 ccd7=1
mos_back prefix="$b" caldb=/home/jason/sas/esas/esas_caldb diag=0 elow=0 ehigh=0 ccd1=1 ccd2=1 ccd3=1 ccd4=1 ccd5=1 ccd6=1 ccd7=1
pn_back prefix="$c" caldb=/home/jason/sas/esas/esas_caldb diag=0 elow=0 ehigh=0 quad1=1 quad2=1 quad3=1 quad4=1


mv "mos"$a"-obj.pi" "mos"$a"-obj-nps.pi"
mv "mos"$a".rmf" "mos"$a"-nps.rmf"
mv "mos"$a".arf" "mos"$a"-nps.arf"
mv "mos"$a"-back.pi" "mos"$a"-back-nps.pi"
mv "mos"$a"-obj-im-sp-det.fits" "mos"$a"-sp-nps.fits"
mv "mos"$b"-obj.pi" "mos"$b"-obj-nps.pi"
mv "mos"$b".rmf" "mos"$b"-nps.rmf"
mv "mos"$b".arf" "mos"$b"-nps.arf"
mv "mos"$b"-back.pi" "mos"$b"-back-nps.pi"
mv "mos"$b"-obj-im-sp-det.fits" "mos"$b"-sp-nps.fits"
mv "pn"$c"-obj-os.pi" "pn"$c"-obj-os-nps.pi"
mv "pn"$c"-obj.pi" "pn"$c"-obj-nps.pi"
mv "pn"$c"-obj-oot.pi" "pn"$c"-obj-oot-nps.pi"
mv "pn"$c".rmf" "pn"$c"-nps.rmf"
mv "pn"$c".arf" "pn"$c"-nps.arf"
mv "pn"$c"-back.pi" "pn"$c"-back-nps.pi"
mv "pn"$c"-obj-im-sp-det.fits" "pn"$c"-sp-nps.fits"

grppha "mos"$a"-obj-nps.pi" "mos"$a"-obj-nps-grp.pi" "chkey BACKFILE mos"$a"-back-nps.pi & chkey RESPFILE mos"$a"-nps.rmf & chkey ANCRFILE mos"$a"-nps.arf & group min 100 & exit"
grppha "mos"$b"-obj-nps.pi" "mos"$b"-obj-nps-grp.pi" "chkey BACKFILE mos"$b"-back-nps.pi & chkey RESPFILE mos$b-nps.rmf & chkey ANCRFILE mos"$b"-nps.arf & group min 100 & exit"
grppha "pn"$c"-obj-os-nps.pi" "pn"$c"-obj-os-nps-grp.pi" "chkey BACKFILE pn"$c"-back-nps.pi & chkey RESPFILE pn"$c"-nps.rmf & chkey ANCRFILE pn"$c"-nps.arf & group min 100 & exit"

proton_scale caldb=/home/jason/sas/esas/esas_caldb mode=1 detector=1 maskfile="mos"$a"-sp-nps.fits" specfile="mos"$a"-obj-nps.pi"
proton_scale caldb=/home/jason/sas/esas/esas_caldb mode=1 detector=2 maskfile="mos"$b"-sp-nps.fits" specfile="mos"$b"-obj-nps.pi"
proton_scale caldb=/home/jason/sas/esas/esas_caldb mode=1 detector=3 maskfile="pn"$c"-sp-nps.fits" specfile="pn"$c"-obj-nps.pi"

rm savexspec.xcm
xspec - savexspec-full.xcm
index=`sed '165q;d' savexspec.xcm`
index=`echo $index|cut -d' ' -f1`
indexh=`sed '167q;d' savexspec.xcm`
indexh=`echo $index|cut -d' ' -f1`
norm=`sed '168q;d' savexspec.xcm`
norm=`echo $norm|cut -d' ' -f1`
indexhh=`sed '172q;d' savexspec.xcm`
indexhh=`echo $indexhh|cut -d' ' -f1`
normm=`sed '173q;d' savexspec.xcm`
normm=`echo $normm|cut -d' ' -f1`
indexpn=`sed '175q;d' savexspec.xcm`
indexpn=`echo $indexpn|cut -d' ' -f1`
indexpnh=`sed '177q;d' savexspec.xcm`
indexpnh=`echo $indexpnh|cut -d' ' -f1`
normpn=`sed '178q;d' savexspec.xcm`
normpn=`echo $normpn|cut -d' ' -f1`

proton prefix="$a" caldb=/home/jason/sas/esas/esas_caldb specname="mos"$a"-obj-ps-grp.pi" ccd1=1 ccd2=1 ccd3=1 ccd4=1 ccd5=1 ccd6=0 ccd7=1 elow=400 ehigh=750 spectrumcontrol=2 bbreak=3.0 bindl="$index" bindh="$indexh" bnorm="$norm"
proton prefix="$a" caldb=/home/jason/sas/esas/esas_caldb specname="mos"$a"-obj-ps-grp.pi" ccd1=1 ccd2=1 ccd3=1 ccd4=1 ccd5=1 ccd6=0 ccd7=1 elow=750 ehigh=1250 spectrumcontrol=2 bbreak=3.0 bindl="$index" bindh="$indexh" bnorm="$norm"
proton prefix="$a" caldb=/home/jason/sas/esas/esas_caldb specname="mos"$a"-obj-ps-grp.pi" ccd1=1 ccd2=1 ccd3=1 ccd4=1 ccd5=1 ccd6=0 ccd7=1 elow=2000 ehigh=7200 spectrumcontrol=2 bbreak=3.0 bindl="$index" bindh="$indexh" bnorm="$norm"
proton prefix="$b" caldb=/home/jason/sas/esas/esas_caldb specname="mos"$b"-obj-ps-grp.pi" ccd1=1 ccd2=0 ccd3=1 ccd4=1 ccd5=1 ccd6=1 ccd7=1 elow=400 ehigh=750 spectrumcontrol=2 bbreak=3.0 bindl="$index" bindh="$indexhh" bnorm="$normm"
proton prefix="$b" caldb=/home/jason/sas/esas/esas_caldb specname="mos"$b"-obj-ps-grp.pi" ccd1=1 ccd2=0 ccd3=1 ccd4=1 ccd5=1 ccd6=1 ccd7=1 elow=750 ehigh=1250 spectrumcontrol=2 bbreak=3.0 bindl="$index" bindh="$indexhh" bnorm="$normm"
proton prefix="$b" caldb=/home/jason/sas/esas/esas_caldb specname="mos"$b"-obj-ps-grp.pi" ccd1=1 ccd2=0 ccd3=1 ccd4=1 ccd5=1 ccd6=1 ccd7=1 elow=2000 ehigh=7200 spectrumcontrol=2 bbreak=3.0 bindl="$index" bindh="$indexhh" bnorm="$normm"
proton prefix="$c" caldb=/home/jason/sas/esas/esas_caldb specname="pn"$c"-obj-os-ps-grp.pi" ccd1=1 ccd2=1 ccd3=1 ccd4=1 elow=400 ehigh=750 spectrumcontrol=2 bbreak=3.0 bindl="$indexpn" bindh="$indexpnh" bnorm="$normpn"
proton prefix="$c" caldb=/home/jason/sas/esas/esas_caldb specname="pn"$c"-obj-os-ps-grp.pi" ccd1=1 ccd2=1 ccd3=1 ccd4=1 elow=750 ehigh=1250 spectrumcontrol=2 bbreak=3.0 bindl="$indexpn" bindh="$indexpnh" bnorm="$normpn"
proton prefix="$c" caldb=/home/jason/sas/esas/esas_caldb specname="pn"$c"-obj-os-ps-grp.pi" ccd1=1 ccd2=1 ccd3=1 ccd4=1 elow=2000 ehigh=7200 spectrumcontrol=2 bbreak=3.0 bindl="$indexpn" bindh="$indexpnh" bnorm="$normpn"

: '
proton prefix="$a" caldb=/home/jason/sas/esas/esas_caldb specname=mos"$a"-obj-ps-grp.pi ccd1=1 ccd2=1 ccd3=1 ccd4=1 ccd5=1 ccd6=0 ccd7=1 elow=400 ehigh=750 spectrumcontrol=2 bindl=0.100000 bindh=9.00000E-02 bnorm=2.3980867E-03
proton prefix="$a" caldb=/home/jason/sas/esas/esas_caldb specname=mos"$a"-obj-ps-grp.pi ccd1=1 ccd2=1 ccd3=1 ccd4=1 ccd5=1 ccd6=0 ccd7=1 elow=750 ehigh=1250 spectrumcontrol=2 bindl=0.100000 bindh=9.00000E-02 bnorm=2.3980867E-03
proton prefix="$a" caldb=/home/jason/sas/esas/esas_caldb specname=mos"$a"-obj-ps-grp.pi ccd1=1 ccd2=1 ccd3=1 ccd4=1 ccd5=1 ccd6=0 ccd7=1 elow=2000 ehigh=7200 spectrumcontrol=2 bindl=0.100000 bindh=9.00000E-02 bnorm=2.3980867E-03
proton prefix="$b" caldb=/home/jason/sas/esas/esas_caldb specname=mos"$b"-obj-ps-grp.pi ccd1=1 ccd2=0 ccd3=1 ccd4=1 ccd5=1 ccd6=1 ccd7=1 elow=400 ehigh=750 spectrumcontrol=2 bindl=0.100000 bindh=9.00000E-02 bnorm=5.2704220E-03
proton prefix="$b" caldb=/home/jason/sas/esas/esas_caldb specname=mos"$b"-obj-ps-grp.pi ccd1=1 ccd2=0 ccd3=1 ccd4=1 ccd5=1 ccd6=1 ccd7=1 elow=750 ehigh=1250 spectrumcontrol=2 bindl=0.100000 bindh=9.00000E-02 bnorm=5.2704220E-03
proton prefix="$b" caldb=/home/jason/sas/esas/esas_caldb specname=mos"$b"-obj-ps-grp.pi ccd1=1 ccd2=0 ccd3=1 ccd4=1 ccd5=1 ccd6=1 ccd7=1 elow=2000 ehigh=7200 spectrumcontrol=2 bindl=0.100000 bindh=9.00000E-02 bnorm=5.2704220E-03
proton prefix="$c" caldb=/home/jason/sas/esas/esas_caldb specname=pn"$c"-obj-os-ps-grp.pi ccd1=1 ccd2=1 ccd3=1 ccd4=1 elow=400 ehigh=750 spectrumcontrol=2 bindl=0.100000 bindh=0.10000 bnorm=0.0000000
proton prefix="$c" caldb=/home/jason/sas/esas/esas_caldb specname=pn"$c"-obj-os-ps-grp.pi ccd1=1 ccd2=1 ccd3=1 ccd4=1 elow=750 ehigh=1250 spectrumcontrol=2 bindl=0.100000 bindh=0.10000 bnorm=0.0000000
proton prefix="$c" caldb=/home/jason/sas/esas/esas_caldb specname=pn"$c"-obj-os-ps-grp.pi ccd1=1 ccd2=1 ccd3=1 ccd4=1 elow=2000 ehigh=7200 spectrumcontrol=2 bindl=0.100000 bindh=0.10000 bnorm=0.0000000
'
echo "finish proton"

rot-im-det-sky prefix="$a" mask=0 elow=400 ehigh=750 mode=2
rot-im-det-sky prefix="$a" mask=0 elow=750 ehigh=1250 mode=2
rot-im-det-sky prefix="$a" mask=0 elow=2000 ehigh=7200 mode=2
rot-im-det-sky prefix="$b" mask=0 elow=400 ehigh=750 mode=2
rot-im-det-sky prefix="$b" mask=0 elow=750 ehigh=1250 mode=2
rot-im-det-sky prefix="$b" mask=0 elow=2000 ehigh=7200 mode=2
rot-im-det-sky prefix="$c" mask=0 elow=400 ehigh=750 mode=2
rot-im-det-sky prefix="$c" mask=0 elow=750 ehigh=1250 mode=2
rot-im-det-sky prefix="$c" mask=0 elow=2000 ehigh=7200 mode=2

comb caldb=/home/jason/sas/esas/esas_caldb withpartcontrol=1 withsoftcontrol=1 withswcxcontrol=0 elowlist=400 ehighlist=750 mask=1 prefixlist=""$a" "$b" "$c""
comb caldb=/home/jason/sas/esas/esas_caldb withpartcontrol=1 withsoftcontrol=1 withswcxcontrol=0 elowlist=750 ehighlist=1250 mask=1 prefixlist=""$a" "$b" "$c""
comb caldb=/home/jason/sas/esas/esas_caldb withpartcontrol=1 withsoftcontrol=1 withswcxcontrol=0 elowlist=2000 ehighlist=7200 mask=1 prefixlist=""$a" "$b" "$c""

adapt smoothingcounts=50 thresholdmasking=0.02 detector=0 binning=2 elow=400 ehigh=750 withmaskcontrol=no withpartcontrol=yes withsoftcontrol=yes withswcxcontrol=0
adapt smoothingcounts=50 thresholdmasking=0.02 detector=0 binning=2 elow=750 ehigh=1250 withmaskcontrol=no withpartcontrol=yes withsoftcontrol=yes withswcxcontrol=0
adapt smoothingcounts=50 thresholdmasking=0.02 detector=0 binning=2 elow=2000 ehigh=7200 withmaskcontrol=no withpartcontrol=yes withsoftcontrol=yes withswcxcontrol=0

mv adapt-400-750.fits adapt-400-750-ps.fits
mv adapt-750-1250.fits adapt-750-1250-ps.fits
mv adapt-2000-7200.fits adapt-2000-7200-ps.fits

mkdir proc
find . -maxdepth 1 -type f -print0|xargs -0 mv -t proc
