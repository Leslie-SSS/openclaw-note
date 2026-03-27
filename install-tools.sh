#!/bin/bash

# ============================================
# macOS 必备工具一键安装脚本
# ============================================

echo "🚀 开始安装 Homebrew 和必备工具..."

# 1. 安装 Homebrew（如果未安装）
if ! command -v brew &> /dev/null; then
    echo "📦 安装 Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # 添加到 PATH (Apple Silicon)
    if [[ $(uname -m) == 'arm64' ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    echo "✅ Homebrew 已安装"
fi

# 2. 更新 Homebrew
echo "🔄 更新 Homebrew..."
brew update

# 3. 安装必备工具
echo "📦 安装必备工具..."

# 系统工具
brew install htop ncdu tree neofetch

# 开发工具
brew install git jq yq ripgrep fd

# 网络工具
brew install wget curl

# 文档工具
brew install pandoc wkhtmltopdf

# 多媒体工具
brew install ffmpeg yt-dlp

# 其他实用工具
brew install tldr bat exa zoxide fzf

# Python 工具
brew install python3
pip3 install markdown weasyprint 2>/dev/null || true

echo ""
echo "✅ 安装完成！"
echo ""
echo "📋 已安装的工具："
echo "   系统工具: htop, ncdu, tree, neofetch"
echo "   开发工具: git, jq, yq, ripgrep (rg), fd"
echo "   网络工具: wget, curl"
echo "   文档工具: pandoc, wkhtmltopdf"
echo "   多媒体: ffmpeg, yt-dlp"
echo "   其他: tldr, bat, exa, zoxide, fzf"
echo ""
echo "🎉 现在可以用 pandoc 把 Markdown 转成 PDF 了！"
