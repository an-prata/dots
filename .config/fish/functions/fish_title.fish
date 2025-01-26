function fish_title
    set -q argv[1]; or set argv $(prompt_pwd --full-length-dirs=6)
    echo $argv
end
