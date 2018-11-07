#!/bin/bash
source /home/jason/sas/xmmsas_20180620_1732/setsas.sh
export DATAPATH=/home/jason/sas/data/fb1


export SAS_CCFPATH=/home/jason/sas/ccf
dir=`find $DATAPATH -name "0*" -type d |head -n 1`

export SAS_CCF=$dir"/proc/ccf.cif"

merge_comp_xmm caldb=/home/jason/sas/esas/esas_caldb dirfile=dir.dat coord=2 crvaln1=266.99 crvaln2=-13.383 pixelsize=0.05 component=1 elow=400 ehigh=750 maskcontrol=0 xdim=1500 ydim=1500
merge_comp_xmm caldb=/home/jason/sas/esas/esas_caldb dirfile=dir.dat coord=2 crvaln1=266.99 crvaln2=-13.383 pixelsize=0.05 component=2 elow=400 ehigh=750 maskcontrol=0 xdim=1500 ydim=1500
merge_comp_xmm caldb=/home/jason/sas/esas/esas_caldb dirfile=dir.dat coord=2 crvaln1=266.99 crvaln2=-13.383 pixelsize=0.05 component=3 elow=400 ehigh=750 maskcontrol=0 xdim=1500 ydim=1500
merge_comp_xmm caldb=/home/jason/sas/esas/esas_caldb dirfile=dir.dat coord=2 crvaln1=266.99 crvaln2=-13.383 pixelsize=0.05 component=4 elow=400 ehigh=750 maskcontrol=0 xdim=1500 ydim=1500
merge_comp_xmm caldb=/home/jason/sas/esas/esas_caldb dirfile=dir.dat coord=2 crvaln1=266.99 crvaln2=-13.383 pixelsize=0.05 component=1 elow=750 ehigh=1250 maskcontrol=0 xdim=1500 ydim=1500
merge_comp_xmm caldb=/home/jason/sas/esas/esas_caldb dirfile=dir.dat coord=2 crvaln1=266.99 crvaln2=-13.383 pixelsize=0.05 component=2 elow=750 ehigh=1250 maskcontrol=0 xdim=1500 ydim=1500
merge_comp_xmm caldb=/home/jason/sas/esas/esas_caldb dirfile=dir.dat coord=2 crvaln1=266.99 crvaln2=-13.383 pixelsize=0.05 component=3 elow=750 ehigh=1250 maskcontrol=0 xdim=1500 ydim=1500
merge_comp_xmm caldb=/home/jason/sas/esas/esas_caldb dirfile=dir.dat coord=2 crvaln1=266.99 crvaln2=-13.383 pixelsize=0.05 component=4 elow=750 ehigh=1250 maskcontrol=0 xdim=1500 ydim=1500
merge_comp_xmm caldb=/home/jason/sas/esas/esas_caldb dirfile=dir.dat coord=2 crvaln1=266.99 crvaln2=-13.383 pixelsize=0.05 component=1 elow=2000 ehigh=7200 maskcontrol=0 xdim=1500 ydim=1500
merge_comp_xmm caldb=/home/jason/sas/esas/esas_caldb dirfile=dir.dat coord=2 crvaln1=266.99 crvaln2=-13.383 pixelsize=0.05 component=2 elow=2000 ehigh=7200 maskcontrol=0 xdim=1500 ydim=1500
merge_comp_xmm caldb=/home/jason/sas/esas/esas_caldb dirfile=dir.dat coord=2 crvaln1=266.99 crvaln2=-13.383 pixelsize=0.05 component=3 elow=2000 ehigh=7200 maskcontrol=0 xdim=1500 ydim=1500
merge_comp_xmm caldb=/home/jason/sas/esas/esas_caldb dirfile=dir.dat coord=2 crvaln1=266.99 crvaln2=-13.383 pixelsize=0.05 component=4 elow=2000 ehigh=7200 maskcontrol=0 xdim=1500 ydim=1500

adapt_merge smoothingcounts=50 thresholdmasking=0.02 elowlist=400 ehighlist=750 binning=2 withpartcontrol=yes withsoftcontrol=yes  withmaskcontrol=no
adapt_merge smoothingcounts=50 thresholdmasking=0.02 elowlist=750 ehighlist=1250 binning=2 withpartcontrol=yes withsoftcontrol=yes  withmaskcontrol=no
adapt_merge smoothingcounts=50 thresholdmasking=0.02 elowlist='400 750' ehighlist='750 1250' binning=2 withpartcontrol=yes withsoftcontrol=yes  withmaskcontrol=no
adapt_merge smoothingcounts=50 thresholdmasking=0.02 elowlist=2000 ehighlist=7200 binning=2 withpartcontrol=yes withsoftcontrol=yes  withmaskcontrol=no

mv adapt-400-750.fits adapt-400-750-ps.fits
mv adapt-750-1250.fits adapt-750-1250-ps.fits
mv adapt-400-1250.fits adapt-400-1250-ps.fits
mv adapt-2000-7200.fits adapt-2000-7200-ps.fits


merge_comp_xmm caldb=/home/jason/sas/esas/esas_caldb dirfile=dir.dat coord=2 crvaln1=266.99 crvaln2=-13.383 pixelsize=0.05 component=1 elow=400 ehigh=750 maskcontrol=1 xdim=1500 ydim=1500
merge_comp_xmm caldb=/home/jason/sas/esas/esas_caldb dirfile=dir.dat coord=2 crvaln1=266.99 crvaln2=-13.383 pixelsize=0.05 component=2 elow=400 ehigh=750 maskcontrol=1 xdim=1500 ydim=1500
merge_comp_xmm caldb=/home/jason/sas/esas/esas_caldb dirfile=dir.dat coord=2 crvaln1=266.99 crvaln2=-13.383 pixelsize=0.05 component=3 elow=400 ehigh=750 maskcontrol=1 xdim=1500 ydim=1500
merge_comp_xmm caldb=/home/jason/sas/esas/esas_caldb dirfile=dir.dat coord=2 crvaln1=266.99 crvaln2=-13.383 pixelsize=0.05 component=4 elow=400 ehigh=750 maskcontrol=1 xdim=1500 ydim=1500
merge_comp_xmm caldb=/home/jason/sas/esas/esas_caldb dirfile=dir.dat coord=2 crvaln1=266.99 crvaln2=-13.383 pixelsize=0.05 component=1 elow=750 ehigh=1250 maskcontrol=1 xdim=1500 ydim=1500
merge_comp_xmm caldb=/home/jason/sas/esas/esas_caldb dirfile=dir.dat coord=2 crvaln1=266.99 crvaln2=-13.383 pixelsize=0.05 component=2 elow=750 ehigh=1250 maskcontrol=1 xdim=1500 ydim=1500
merge_comp_xmm caldb=/home/jason/sas/esas/esas_caldb dirfile=dir.dat coord=2 crvaln1=266.99 crvaln2=-13.383 pixelsize=0.05 component=3 elow=750 ehigh=1250 maskcontrol=1 xdim=1500 ydim=1500
merge_comp_xmm caldb=/home/jason/sas/esas/esas_caldb dirfile=dir.dat coord=2 crvaln1=266.99 crvaln2=-13.383 pixelsize=0.05 component=4 elow=750 ehigh=1250 maskcontrol=1 xdim=1500 ydim=1500
merge_comp_xmm caldb=/home/jason/sas/esas/esas_caldb dirfile=dir.dat coord=2 crvaln1=266.99 crvaln2=-13.383 pixelsize=0.05 component=1 elow=2000 ehigh=7200 maskcontrol=1 xdim=1500 ydim=1500
merge_comp_xmm caldb=/home/jason/sas/esas/esas_caldb dirfile=dir.dat coord=2 crvaln1=266.99 crvaln2=-13.383 pixelsize=0.05 component=2 elow=2000 ehigh=7200 maskcontrol=1 xdim=1500 ydim=1500
merge_comp_xmm caldb=/home/jason/sas/esas/esas_caldb dirfile=dir.dat coord=2 crvaln1=266.99 crvaln2=-13.383 pixelsize=0.05 component=3 elow=2000 ehigh=7200 maskcontrol=1 xdim=1500 ydim=1500
merge_comp_xmm caldb=/home/jason/sas/esas/esas_caldb dirfile=dir.dat coord=2 crvaln1=266.99 crvaln2=-13.383 pixelsize=0.05 component=4 elow=2000 ehigh=7200 maskcontrol=1 xdim=1500 ydim=1500

adapt_merge smoothingcounts=50 thresholdmasking=0.02 elowlist=400 ehighlist=750 binning=2 withpartcontrol=yes withsoftcontrol=yes  withmaskcontrol=no
adapt_merge smoothingcounts=50 thresholdmasking=0.02 elowlist=750 ehighlist=1250 binning=2 withpartcontrol=yes withsoftcontrol=yes  withmaskcontrol=no
adapt_merge smoothingcounts=50 thresholdmasking=0.02 elowlist='400 750' ehighlist='750 1250' binning=2 withpartcontrol=yes withsoftcontrol=yes  withmaskcontrol=no
adapt_merge smoothingcounts=50 thresholdmasking=0.02 elowlist=2000 ehighlist=7200 binning=2 withpartcontrol=yes withsoftcontrol=yes  withmaskcontrol=no

mv adapt-400-750.fits adapt-400-750-nps.fits
mv adapt-750-1250.fits adapt-750-1250-nps.fits
mv adapt-400-1250.fits adapt-400-1250-nps.fits
mv adapt-2000-7200.fits adapt-2000-7200-nps.fits


bin_image_merge thresholdmasking=0.02 elowlist='400 750' ehighlist='750 1250' binning=8 withpartcontrol=yes withsoftcontrol=yes withswcxcontrol=no withmaskcontrol=no
bin_image_merge thresholdmasking=0.02 elowlist=400 ehighlist=750 binning=8 withpartcontrol=yes withsoftcontrol=yes withswcxcontrol=no   withmaskcontrol=no
bin_image_merge thresholdmasking=0.02 elowlist=750 ehighlist=1250 binning=8 withpartcontrol=yes withsoftcontrol=yes withswcxcontrol=no   withmaskcontrol=no
bin_image_merge thresholdmasking=0.02 elowlist=2000 ehighlist=7200 binning=8  withpartcontrol=yes withsoftcontrol=yes withswcxcontrol=no   withmaskcontrol=no

merge_source_list dirfile=dir-only.dat maxlikelim=15
current=`pwd`
for i in `find  $DATAPATH -name "proc" -type d`
do
cd $i
a=`find . -name "*mos1S*"|head -n 1`
a=${a##*/}
a=`echo $a|cut -d- -f1`
a=${a/mos/}
b=`find . -name "*mos2S*"|head -n 1`
b=${b##*/}
b=`echo $b|cut -d- -f1`
b=${b/mos/}
c=`find . -name "*pn*"|head -n 1`
c=${c##*/}
c=`echo $c|cut -d- -f1`
c=${c/pn/}

make_mask_merge prefix="$a" inmask="mos"$a"-mask-im-750-1250.fits" srclist=../../merge/merged-source-list.fits flimtot=0.5 flimsoft=0.0 flimhard=0.0 scale=0.5 seper=20 maxlikelim=15.0
make_mask_merge prefix="$b" inmask="mos"$b"-mask-im-750-1250.fits" srclist=../../merge/merged-source-list.fits flimtot=0.5 flimsoft=0.0 flimhard=0.0 scale=0.5 seper=20 maxlikelim=15.0
make_mask_merge prefix="$c" inmask="pn"$c"-mask-im-750-1250.fits" srclist=../../merge/merged-source-list.fits flimtot=0.5 flimsoft=0.0 flimhard=0.0 scale=0.5 seper=20 maxlikelim=15.0
cd $current
done
merge_comp_xmm caldb=/home/jason/sas/esas/esas_caldb dirfile=dir.dat coord=2 crvaln1=266.99 crvaln2=-13.383 pixelsize=0.05 component=1 elow=400 ehigh=750 maskcontrol=3 xdim=1500 ydim=1500
merge_comp_xmm caldb=/home/jason/sas/esas/esas_caldb dirfile=dir.dat coord=2 crvaln1=266.99 crvaln2=-13.383 pixelsize=0.05 component=2 elow=400 ehigh=750 maskcontrol=3 xdim=1500 ydim=1500
merge_comp_xmm caldb=/home/jason/sas/esas/esas_caldb dirfile=dir.dat coord=2 crvaln1=266.99 crvaln2=-13.383 pixelsize=0.05 component=3 elow=400 ehigh=750 maskcontrol=3 xdim=1500 ydim=1500
merge_comp_xmm caldb=/home/jason/sas/esas/esas_caldb dirfile=dir.dat coord=2 crvaln1=266.99 crvaln2=-13.383 pixelsize=0.05 component=4 elow=400 ehigh=750 maskcontrol=3 xdim=1500 ydim=1500
merge_comp_xmm caldb=/home/jason/sas/esas/esas_caldb dirfile=dir.dat coord=2 crvaln1=266.99 crvaln2=-13.383 pixelsize=0.05 component=1 elow=750 ehigh=1250 maskcontrol=3 xdim=1500 ydim=1500
merge_comp_xmm caldb=/home/jason/sas/esas/esas_caldb dirfile=dir.dat coord=2 crvaln1=266.99 crvaln2=-13.383 pixelsize=0.05 component=2 elow=750 ehigh=1250 maskcontrol=3 xdim=1500 ydim=1500
merge_comp_xmm caldb=/home/jason/sas/esas/esas_caldb dirfile=dir.dat coord=2 crvaln1=266.99 crvaln2=-13.383 pixelsize=0.05 component=3 elow=750 ehigh=1250 maskcontrol=3 xdim=1500 ydim=1500
merge_comp_xmm caldb=/home/jason/sas/esas/esas_caldb dirfile=dir.dat coord=2 crvaln1=266.99 crvaln2=-13.383 pixelsize=0.05 component=4 elow=750 ehigh=1250 maskcontrol=3 xdim=1500 ydim=1500
merge_comp_xmm caldb=/home/jason/sas/esas/esas_caldb dirfile=dir.dat coord=2 crvaln1=266.99 crvaln2=-13.383 pixelsize=0.05 component=1 elow=2000 ehigh=7200 maskcontrol=3 xdim=1500 ydim=1500
merge_comp_xmm caldb=/home/jason/sas/esas/esas_caldb dirfile=dir.dat coord=2 crvaln1=266.99 crvaln2=-13.383 pixelsize=0.05 component=2 elow=2000 ehigh=7200 maskcontrol=3 xdim=1500 ydim=1500
merge_comp_xmm caldb=/home/jason/sas/esas/esas_caldb dirfile=dir.dat coord=2 crvaln1=266.99 crvaln2=-13.383 pixelsize=0.05 component=3 elow=2000 ehigh=7200 maskcontrol=3 xdim=1500 ydim=1500
merge_comp_xmm caldb=/home/jason/sas/esas/esas_caldb dirfile=dir.dat coord=2 crvaln1=266.99 crvaln2=-13.383 pixelsize=0.05 component=4 elow=2000 ehigh=7200 maskcontrol=3 xdim=1500 ydim=1500

adapt_merge smoothingcounts=50 thresholdmasking=0.02 elowlist=400 ehighlist=750 binning=2 withpartcontrol=yes withsoftcontrol=yes  withmaskcontrol=no
adapt_merge smoothingcounts=50 thresholdmasking=0.02 elowlist=750 ehighlist=1250 binning=2 withpartcontrol=yes withsoftcontrol=yes  withmaskcontrol=no
adapt_merge smoothingcounts=50 thresholdmasking=0.02 elowlist='400 750' ehighlist='750 1250' binning=2 withpartcontrol=yes withsoftcontrol=yes  withmaskcontrol=no
adapt_merge smoothingcounts=50 thresholdmasking=0.02 elowlist=2000 ehighlist=7200 binning=2 withpartcontrol=yes withsoftcontrol=yes  withmaskcontrol=no

mv adapt-400-750.fits adapt-400-750-mnps.fits
mv adapt-750-1250.fits adapt-750-1250-mnps.fits
mv adapt-400-1250.fits adapt-400-1250-mnps.fits
mv adapt-2000-7200.fits adapt-2000-7200-mnps.fits
