# Path additions
for i in \
        (stack path --local-bin) \
        "Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin" \
        "/Users/neilvyas/code/personal/latex" \
        "$HOME/.cargo/bin" \
        "$HOME/nvimbin"
    if not contains $i $PATH
        set -gx PATH $i $PATH
    end
end
