repository=$1 # eg: git@bitbucket.org:xxxfe/slider.git"
branch=$2 # eg: origin/beta-slider   should start with origin/*
tag=$3

tempName=${repository##*/} # eg: slider.git
packageName=${tempName%.*} # eg: slider

# packageRoot=/srv/knpm-lerna-publish
# packagePath=$packageRoot/$packageName # /srv/knpm-publish/slider

# if [ "$branch" == "" ]; then
#     branch=origin/master
# fi

# echo "repository: $repository \\npackageName: $packageName \\n branch: $branch"

# if [ ! -d "$packageRoot" ]; then
#     mkdir -p $packageRoot
# fi

# cd $packageRoot

# if [ ! -d "$packageName" ]; then
#     git clone $repository
#     if [ "$?" = "1" ]; then
#         echo "clone $repository failed"
#         exit 1;
#     fi
# fi

# cd $packageName

# git checkout -- .
# git fetch --all
# if [ "$?" = "1" ]; then
#     echo "git fetch out $repository failed"
#     exit 1;
# fi

# echo "git checkout out branch($branch)..."
# git checkout $branch
# if [ "$?" = "1" ]; then
#     echo "git checkout out $branch failed"
#     exit 1;
# fi

# echo "------ Last Commit: -------"
# git status | head -1
# git show -s --date=relative | head -5
# echo "-------------------------------"


if [ "$tag" ]; then 
    echo 'beta' $tag
    echo 'lerna publish from-package --yes --registry https://www.npmjs.com --dist-tag' $tag
else 
    echo "no tag"
    echo 'lerna publish from-package --yes --registry https://www.npmjs.com'
fi