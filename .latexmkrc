use File::Basename;
my $ROOT = dirname(__FILE__);

@default_files=('main.tex');

# $jobname = "TCC";
# $out_dir = ".";
# $aux_dir = "build";


if (defined $ENV{WORKSPACE_FOLDER} && length $ENV{WORKSPACE_FOLDER}) {
    my $proot = $ENV{WORKSPACE_FOLDER};
    ensure_path("BIBINPUTS", "$proot/bib//");
} else {
    ensure_path("BIBINPUTS", "$ROOT/bib//");
}


# set_tex_cmds("--shell-escape --synctex=1 %O %S");
# set_tex_cmds("--synctex=1 %O %S");


# 0: no pdf | 1: $pdflatex | 2: $ps2pdf | 3: $dvipdf | 4: $lualatex | 5: $xelatex + $xdvipdfmx
$pdf_mode = 1;
# $pdf_mode = 4;

$show_time = 1; # Prints execution time
$clean_full_ext .= " pdf";


# >>> BIBLIOGRAPHY <<<

# $bibtex_use = 1: keep bbl-file on cleanup (`latexmk -c`).
# $bibtex_use = 2: delete bbl-file on cleanup
$bibtex_use = 2;



# >>> LISTINGS <<<

push @generated_exts, 'lolisting';
$clean_ext .= " minted";


# >>> GLOSSARIES <<<

# >>> bib2gls <<<
# Arquivos auxiliares a limpar
add_cus_dep('aux', 'glstex', 0, 'bib2gls');

push @generated_exts, 'ist', 'lol', 'glg', 'glstex', 'gls', 'glo', 'acr', 'acn', 'alg', 'upa', 'upb';
$clean_ext .= " %R-*.glstex";

sub bib2gls {
    my ($base_name, $path) = fileparse( $_[0] );
    $ENV{JAVA_TOOL_OPTIONS} = "-Dfile.encoding=UTF8";

    # Se .glstex já existir e for mais novo que o .bbl, não faz nada
    return 0 if -e "$path/$base.glstex" && -M "$path/$base.glstex" < -M "$path/$base.bbl";

    return system "bib2gls", "--tex-encoding", "UTF-8", "-d", $path, $base_name;
}
