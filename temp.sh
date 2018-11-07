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
