# MANAGED BY ANSIBLE, DO NOT TOUCH

function ex --description 'Extracts any given archive'
    for arg in $argv
        if test -f $arg
            switch $arg
                case '*.tar'
                    tar -xf $arg
                case '*.tar.gz' '*.tgz'
                    tar -xzf $arg
                case '*.tar.bz2' '*.tbz' '*.tbz2'
                    tar -xjf $arg
                case '*.tar.xz' '*.txz'
                    tar -xJf $arg
                case '*.tar.zst'
                    tar --zstd -xf $arg
                case '*.gz'
                    gunzip -k $arg
                case '*.bz2'
                    bunzip2 -k $arg
                case '*.xz'
                    xz -k --decompress $arg
                case '*.zip' '*.war' '*.jar'
                    unzip $arg
                case '*.rar'
                    unrar x $arg
                case '*.7z'
                    7za x $arg
                case '*.zst'
                    zstd -d $arg
                case '*'
                    echo "ex: '$arg' cannot be extracted." >&2
            end
        else
            echo "ex: '$arg' is not a valid file." >&2
        end
    end
end
