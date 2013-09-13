#
sub fix_js_escape {
    my ($input, $type) = @_;
    my %special = (
        '\\ua4' => '¤',
        '\\ua7' => '§',
        '\\ua8' => '¨',
        '\\u2c9' => 'ˉ',
        '\\ub0' => '°',
        '\\ub1' => '±',
        '\\u3bc' => 'μ',
        '\\ub7' => '·',
        '\\ue0' => 'à',
        '\\ue1' => 'á',
        '\\ue8' => 'è',
        '\\ue9' => 'é',
        '\\uea' => 'ê',
        '\\uec' => 'ì',
        '\\ued' => 'í',
        '\\uf2' => 'ò',
        '\\uf3' => 'ó',
        '\\ud7' => '×',
        '\\uf9' => 'ù',
        '\\ufa' => 'ú',
        '\\ufc' => 'ü',
        '\\ue0' => 'à',
        '\\ue1' => 'á',
        '\\ue8' => 'è',
        '\\ue9' => 'é',
        '\\uea' => 'ê',
        '\\uec' => 'ì',
        '\\ued' => 'í',
        '\\uf2' => 'ò',
        '\\uf3' => 'ó',
        '\\uf7' => '÷',
        '\\uf9' => 'ù',
        '\\ufa' => 'ú',
        '\\ufc' => 'ü',
        '\\u101' => 'ā',
        '\\u101' => 'ā',
        '\\u113' => 'ē',
        '\\u113' => 'ē',
        '\\u11b' => 'ě',
        '\\u11b' => 'ě',
        '\\u12b' => 'ī',
        '\\u12b' => 'ī',
        '\\u144' => 'ń',
        '\\u148' => 'ň',
        '\\u14d' => 'ō',
        '\\u14d' => 'ō',
        '\\u16b' => 'ū',
        '\\u16b' => 'ū',
        '\\u1ce' => 'ǎ',
        '\\u1ce' => 'ǎ',
        '\\u1d0' => 'ǐ',
        '\\u1d0' => 'ǐ',
        '\\u1d2' => 'ǒ',
        '\\u1d2' => 'ǒ',
        '\\u1d4' => 'ǔ',
        '\\u1d4' => 'ǔ',
        '\\u1d6' => 'ǖ',
        '\\u1d6' => 'ǖ',
        '\\u1d8' => 'ǘ',
        '\\u1d8' => 'ǘ',
        '\\u1da' => 'ǚ',
        '\\u1da' => 'ǚ',
        '\\u1dc' => 'ǜ',
        '\\u1dc' => 'ǜ',
        '\\u251' => 'ɑ',
        '\\u261' => 'ɡ',
        '\\u2c7' => 'ˇ',
        '\\u2c9' => 'ˉ',
        '\\u2ca' => 'ˊ',
        '\\u2cb' => 'ˋ',
        '\\u2d9' => '˙',
        '\\u391' => 'Α',
        '\\u392' => 'Β',
        '\\u393' => 'Γ',
        '\\u394' => 'Δ',
        '\\u395' => 'Ε',
        '\\u396' => 'Ζ',
        '\\u397' => 'Η',
        '\\u398' => 'Θ',
        '\\u399' => 'Ι',
        '\\u39a' => 'Κ',
        '\\u39b' => 'Λ',
        '\\u39c' => 'Μ',
        '\\u39d' => 'Ν',
        '\\u39e' => 'Ξ',
        '\\u39f' => 'Ο',
        '\\u3a0' => 'Π',
        '\\u3a1' => 'Ρ',
        '\\u3a3' => 'Σ',
        '\\u3a4' => 'Τ',
        '\\u3a5' => 'Υ',
        '\\u3a6' => 'Φ',
        '\\u3a7' => 'Χ',
        '\\u3a8' => 'Ψ',
        '\\u3a9' => 'Ω',
        '\\u3b1' => 'α',
        '\\u3b2' => 'β',
        '\\u3b3' => 'γ',
        '\\u3b4' => 'δ',
        '\\u3b5' => 'ε',
        '\\u3b6' => 'ζ',
        '\\u3b7' => 'η',
        '\\u3b8' => 'θ',
        '\\u3b9' => 'ι',
        '\\u3ba' => 'κ',
        '\\u3bb' => 'λ',
        '\\u3bc' => 'μ',
        '\\u3bd' => 'ν',
        '\\u3be' => 'ξ',
        '\\u3bf' => 'ο',
        '\\u3c0' => 'π',
        '\\u3c1' => 'ρ',
        '\\u3c3' => 'σ',
        '\\u3c4' => 'τ',
        '\\u3c5' => 'υ',
        '\\u3c6' => 'φ',
        '\\u3c7' => 'χ',
        '\\u3c8' => 'ψ',
        '\\u3c9' => 'ω',
        '\\u401' => 'Ё',
        '\\u410' => 'А',
        '\\u411' => 'Б',
        '\\u412' => 'В',
        '\\u413' => 'Г',
        '\\u414' => 'Д',
        '\\u415' => 'Е',
        '\\u416' => 'Ж',
        '\\u417' => 'З',
        '\\u418' => 'И',
        '\\u419' => 'Й',
        '\\u41a' => 'К',
        '\\u41b' => 'Л',
        '\\u41c' => 'М',
        '\\u41d' => 'Н',
        '\\u41e' => 'О',
        '\\u41f' => 'П',
        '\\u420' => 'Р',
        '\\u421' => 'С',
        '\\u422' => 'Т',
        '\\u423' => 'У',
        '\\u424' => 'Ф',
        '\\u425' => 'Х',
        '\\u426' => 'Ц',
        '\\u427' => 'Ч',
        '\\u428' => 'Ш',
        '\\u429' => 'Щ',
        '\\u42a' => 'Ъ',
        '\\u42b' => 'Ы',
        '\\u42c' => 'Ь',
        '\\u42d' => 'Э',
        '\\u42e' => 'Ю',
        '\\u42f' => 'Я',
        '\\u430' => 'а',
        '\\u431' => 'б',
        '\\u432' => 'в',
        '\\u433' => 'г',
        '\\u434' => 'д',
        '\\u435' => 'е',
        '\\u436' => 'ж',
        '\\u437' => 'з',
        '\\u438' => 'и',
        '\\u439' => 'й',
        '\\u43a' => 'к',
        '\\u43b' => 'л',
        '\\u43c' => 'м',
        '\\u43d' => 'н',
        '\\u43e' => 'о',
        '\\u43f' => 'п',
        '\\u440' => 'р',
        '\\u441' => 'с',
        '\\u442' => 'т',
        '\\u443' => 'у',
        '\\u444' => 'ф',
        '\\u445' => 'х',
        '\\u446' => 'ц',
        '\\u447' => 'ч',
        '\\u448' => 'ш',
        '\\u449' => 'щ',
        '\\u44a' => 'ъ',
        '\\u44b' => 'ы',
        '\\u44c' => 'ь',
        '\\u44d' => 'э',
        '\\u44e' => 'ю',
        '\\u44f' => 'я',
        '\\u451' => 'ё',
        '\\ub0' => '°'
    );
    if ($type eq 'replace') {
        foreach my $key (keys(%special)) {
            $input =~ s/$key/$special{$key}/g; 
        }
    } elsif ($type eq 'kill') {
        $input =~ s/\\u\S{1,3}//g; 
    }
    return $input;
}
