function fish_title
    set -q argv[1]; or set argv $(prompt_pwd --full-length-dirs=3)
    echo $argv
end
