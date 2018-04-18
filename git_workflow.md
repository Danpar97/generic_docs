
## Typical Git Workflow

This is a guide to a typical Git workflow with monsters. It covers forking from the main repository, creating a branch, keeping your branch up to date with the main repository, resolving conflicts, and merging back into the main repository. It’s not meant to be a hard-and-fast set of rules. However, if you follow something along these lines, you’ll be less likely to piss people off.
It’s appreciated if every single commit in a branch on its own compiles on all supported platforms (Windows, Linux, and OS X) and doesn’t cause any regressions if the commits after it were left unmerged. We understand that with early development, sometimes it’s easier to commit early-and-often, and sometimes you may unintentionally break things (and then later fix them in your branch). If this is part of your workflow, we expect appropriate use of Git rebase to squash broken commits and resolve merge conflicts. If you don’t know how Git rebase works, please read [this article](https://git-scm.com/book/en/v2/Git-Branching-Rebasing) before developing for monsters.

### Terminology
* `upstream`: [Main project repository](https://github.com/danpar97/monsters)
* `origin`: [Your GitHub forked project repository] (e.g. https://github.com/<github_username>/monsters)

### Before you begin
* GitHub fork the project
* Clone your GitHub fork locally
```sh
git clone https://github.com/your-username/monsters.git
```

* Set your upstream to the main project repository
```sh
git remote add upstream https://github.com/danpar97/monsters.git
```

* Set your Git identity configuration
```sh
git config --global user.name "your-username";
git config --global user.email your-email@example.com
```

### Create a new branch

* Create your branch from the latest upstream/master (Note: please `format_branch_names_like_this`)
```sh
git fetch upstream && git checkout -b new-branch-name upstream/master
```

__Scenario A: You did some work in your branch… Then, someone committed something to upstream/master that you want!__

* Make sure you’re on your branch

```sh
git checkout new-branch-name
```

* Rebase upstream/master onto it. With the rebase, move all of your changes to the top, and put all of the new master changes immediately after where you branched from. The goal should be that the branch now appears as though you just created it from upstream/master, and then committed all of your new stuff.

```sh
git rebase upstream/master
```

__Scenario B: You did some more work in your branch… Then, someone committed something to upstream/master that will cause conflicts when trying to get the branch merged back to upstream/master!__

* From your branch, rebase upstream/master
```sh
git checkout new-branch-name
git rebase -i upstream/master
```
Your branch is getting near completion, now you’re ready for a pull request!

* From your branch, rebase upstream/master
```sh
git checkout new-branch-name
git rebase -i upstream/master
```

* Update origin/new-branch-name
```sh
git push origin new-branch-name
```

* Create the pull request on GitHub to merge origin/new-branch-name into upstream/master

Gracefully receive feedback

* Address each comment with a commit as needed

Once your pull request is ready to be merged…

* From your branch, interactive rebase to squash all of the new commits (as a result of the pull request feedback) into the commits that they were addressing
```sh
git checkout new-branch-name
git rebase -i HEAD~n
```

* Rebase upstream/master onto your branch to ensure that you have any changes made since your pull request was created
```sh
git rebase -i upstream/master
```

* Update origin/new-branch-name

```sh
git push origin new-branch-name --force
```

* Merge your branch in
* Always merge using the >merge< button in the GitHub pull request
If GitHub says the branch cannot be merged automatically, you’ve likely done something incorrectly (e.g. you did not fully rebase changes from upstream/master into your branch). If things don’t work for you, don’t hesitate to ask us for help @temp-name #monsters on slack. Mastering Git is not as easy as it might sound, but we’ll happily help you get started.


# Credits
Thanks to [citra-emu/citra](https://github.com/citra-emu/citra) -> Wiki for such a great git workflow guide
