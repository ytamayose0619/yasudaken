#!/usr/bin/perl

$fm = 598;
$pi = 3.1415926535897932385;

sub accum {
    my ($n,$sum,$esq) = @_;
    my $ave = 0.0;
    my $err = 0.0;

    $ave=$sum/$n;
    $err=($esq/$n)-($ave*$ave);
    if ($n>1) {
        if ($err>0.0) {
            $err=sqrt($err/($n-1));
        } else {
            $err=0.0;
        }
    } else {
        $err=0.0;
    }

    $_[1]=$ave;
    $_[2]=$err;
}

sub corr {
    my ($len,$d0,$d1) = @_;

    $_[3] = ($len/(2.0*$pi))*sqrt($d0/$d1-1.0);
}

sub corr4 {
    my ($len,$d0,$d1,$d2) = @_;	

    $_[4] = ($len/(4.0*$pi))*sqrt(3.0*($d0-$d1)/($d1-$d2)-1.0);
}

sub hcap {
    my ($d0,$d1,$d2,$d3) = @_;

    $_[4] = $d0*$d0*($d3-($1+$2)**2);
}

while (<>) {
    chomp;
    s/D/E/g;
    @lst = split(/\s+/);

    if (@lst[1] eq $fm) {
        $spin=@lst[2];
        $lx=@lst[3];
        $alpha=@lst[6];
        $jperp=@lst[7];
        $temp=@lst[8];
        $ncalc{($spin,$lx,$alpha,$jperp,$temp)} ++;
        $spin{($spin,$lx,$alpha,$jperp,$temp)} = $spin;
        $lx{($spin,$lx,$alpha,$jperp,$temp)} = $lx;
        $alpha{($spin,$lx,$alpha,$jperp,$temp)} = $alpha;
        $jperp{($spin,$lx,$alpha,$jperp,$temp)} = $jperp;
        $temp{($spin,$lx,$alpha,$jperp,$temp)} = $temp;
        $beta=1.0/$temp;

        if (@lst[9] gt $maxindx{($spin,$lx,$alpha,$jperp,$temp)}) {
            $maxindx{($spin,$lx,$alpha,$jperp,$temp)} = @lst[9];
        }

        $cpu{($spin,$lx,$alpha,$jperp,$temp)} += @lst[11];

        $ene_1{($spin,$lx,$alpha,$jperp,$temp)} += @lst[13]+@lst[14];
        $ene_2{($spin,$lx,$alpha,$jperp,$temp)} += (@lst[13]+@lst[14])**2;

        $usus_1{($spin,$lx,$alpha,$jperp,$temp)} += @lst[16];
        $usus_2{($spin,$lx,$alpha,$jperp,$temp)} += @lst[16]**2;

        $ssus_1{($spin,$lx,$alpha,$jperp,$temp)} += @lst[18];
        $ssus_2{($spin,$lx,$alpha,$jperp,$temp)} += @lst[18]**2;

        $dstr_1{($spin,$lx,$alpha,$jperp,$temp)} += @lst[23];
        $dstr_2{($spin,$lx,$alpha,$jperp,$temp)} += @lst[23]**2;

        $sstr_1{($spin,$lx,$alpha,$jperp,$temp)} += @lst[24];
        $sstr_2{($spin,$lx,$alpha,$jperp,$temp)} += @lst[24]**2;

        $m4_1{($spin,$lx,$alpha,$jperp,$temp)} += @lst[25];
        $m4_2{($spin,$lx,$alpha,$jperp,$temp)} += @lst[25]**2;

        $sstrx_1{($spin,$lx,$alpha,$jperp,$temp)} += @lst[26];
        $sstrx_2{($spin,$lx,$alpha,$jperp,$temp)} += @lst[26]**2;

        $sstry_1{($spin,$lx,$alpha,$jperp,$temp)} += @lst[27];
        $sstry_2{($spin,$lx,$alpha,$jperp,$temp)} += @lst[27]**2;

        &hcap($beta,@lst[13],@lst[14],@lst[15],$hc);
        $hcap_1{($spin,$lx,$alpha,$jperp,$temp)} += $hc;
        $hcap_2{($spin,$lx,$alpha,$jperp,$temp)} += $hc**2;

        &corr($beta,@lst[18],@lst[23],$xi);
        $corrb_1{($spin,$lx,$alpha,$jperp,$temp)} += $xi;
        $corrb_2{($spin,$lx,$alpha,$jperp,$temp)} += $xi**2;

        &corr($lx,@lst[24],@lst[26],$xi);
        $corrx_1{($spin,$lx,$alpha,$jperp,$temp)} += $xi;
        $corrx_2{($spin,$lx,$alpha,$jperp,$temp)} += $xi**2;

        &corr($ly/2,@lst[24],@lst[27],$xi);
        $corry_1{($spin,$lx,$alpha,$jperp,$temp)} += $xi;
        $corry_2{($spin,$lx,$alpha,$jperp,$temp)} += $xi**2;
    }
}

foreach (keys(%ncalc)) {
    &accum($ncalc{$_},$ene_1{$_},$ene_2{$_});
    &accum($ncalc{$_},$usus_1{$_},$usus_2{$_});
    &accum($ncalc{$_},$ssus_1{$_},$ssus_2{$_});
    &accum($ncalc{$_},$dstr_1{$_},$dstr_2{$_});
    &accum($ncalc{$_},$sstr_1{$_},$sstr_2{$_});
    &accum($ncalc{$_},$m4_1{$_},$m4_2{$_});
    &accum($ncalc{$_},$sstrx_1{$_},$sstrx_2{$_});
    &accum($ncalc{$_},$sstry_1{$_},$sstry_2{$_});
    &accum($ncalc{$_},$hcap_1{$_},$hcap_2{$_});

    &accum($ncalc{$_},$corrb_1{$_},$corrb_2{$_});
    &corr(1.0/$temp{$_},$ssus_1{$_},$dstr_1{$_},$corrb_1{$_});

    &accum($ncalc{$_},$corrx_1{$_},$corrx_2{$_});
    &corr($lx{$_},$sstr_1{$_},$sstrx_1{$_},$corrx_1{$_});

    &accum($ncalc{$_},$corry_1{$_},$corry_2{$_});
    &corr($lx{$_}/2,$sstr_1{$_},$sstry_1{$_},$corry_1{$_});
}

foreach (keys(%ncalc)) {
    printf "%4d %5d %13.7f %13.7f %13.7f %5d %12d %13.6e   %13.6e %13.6e  %13.6e %13.6e  %13.6e %13.6e  %13.6e %13.6e  %13.6e %13.6e  %13.6e %13.6e  %13.6e %13.6e  %13.6e %13.6e %13.6e %13.6e %13.6e %13.6e %13.6e %13.6e %13.6e %13.6e\n",
    $spin{$_},$lx{$_},$alpha{$_},$jperp{$_},$temp{$_},$ncalc{$_},$maxindx{$_},$cpu{$_}/$ncalc{$_},
    $ene_1{$_},$ene_2{$_},
    $usus_1{$_},$usus_2{$_},
    $ssus_1{$_},$ssus_2{$_},
    $dstr_1{$_},$dstr_2{$_},
    $sstr_1{$_},$sstr_2{$_},
    $m4_1{$_},$m4_2{$_},
    $sstrx_1{$_},$sstrx_2{$_},
    $sstry_1{$_},$sstry_2{$_},
    $corrb_1{$_},$corrb_2{$_},
    $corrx_1{$_},$corrx_2{$_},
    $corry_1{$_},$corry_2{$_},
    $hcap_1{$_},$hcap_2{$_}
}
