# 强制删除传递的参数文件夹，然后逐层创建文件夹
function mkDirAbsolutely {
    rm -rf $1
    mkdir -p $1
}

# 从云端下载代码块
function downloadCodesnippetsFromGit {
    git clone $1
}

# 先给 Xcode 的代码块的文件夹设置权限；
function moveCodeSnippetsToXcodeSnippetsFolder {
    chmod 775 ~/Library/Developer/Xcode/UserData/CodeSnippets/
    mv -f ./snippets/* ~/Library/Developer/Xcode/UserData/CodeSnippets/
}

# 强制删除文件夹
function deleteTheFolderAbsolutely {
    rm -fr $1 
}

:<<EOF
从云端同步 codesnippets 到 Xcode 的 codesnippets 文件夹
EOF

function syncXcodesnippetsFromOnlinestorage {
    #1
    mkDirAbsolutely CodeSinppets
    #2
    cd CodeSinppets
    #3
    downloadCodesnippetsFromGit git@github.com:HongdiSmart/CodeSnippets.git
    #4
    cd codesnippets
    #5
    mkDirAbsolutely ~/Library/Developer/Xcode/UserData/CodeSnippets/
    #6
    moveCodeSnippetsToXcodeSnippetsFolder
    #7
    cd ..
    #8
    cd ..
    #9
    deleteTheFolderAbsolutely CodeSinppets
}

syncXcodesnippetsFromOnlinestorage
