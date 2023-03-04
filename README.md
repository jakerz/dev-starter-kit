# Developer Environment Starter Kit (DESK)

This is a reference guide (starter kit) for software development environment configurations.

## Example Bash+Git configs

https://github.com/jakerz/dev-starter-kit/tree/bash-config/examples/git_branch_conda_env_combo

## Bash

### bashrc vs. bash_profile

https://www.golinuxcloud.com/bashrc-vs-bash-profile/

```
~/.bashrc
~/.bash_profile
```

## Conda

### Install conda (miniconda)

https://docs.conda.io/en/latest/miniconda.html

### Create new environment

```
conda create --name <name> python=<version>
```

```
conda create --name dev python=3.8.10
```

### Activate environment

```
conda activate <environment_name>
```

```
conda activate dev
```

### Export requirements (dependencies)

#### As text list

```
conda list -e > requirements.txt
```

#### As YAML environment

```
conda env export --name <environment_name> > environment.yml
```

```
conda env export --name dev > environment.yml
```

## Git

### SSH Keys

https://docs.gitlab.com/ee/user/ssh.html

https://docs.gitlab.com/ee/user/ssh.html#ed25519-ssh-keys

https://www.w3docs.com/snippets/git/how-to-generate-ssh-key-for-git.html

gitlab-ssh-config.md:

https://gist.github.com/projected1/305cb570f09103d7d4c741627eaf1891

https://www.cyberciti.biz/faq/create-ssh-config-file-on-linux-unix/

### Branching

https://www.flagship.io/git-branching-strategies/

### Merge/Pull Requests

https://opensource.com/article/19/7/create-pull-request-github

https://www.geeksforgeeks.org/merge-strategies-in-git/

### Housekeeping - Branch removal/clean-up

https://railsware.com/blog/git-housekeeping-tutorial-clean-up-outdated-branches-in-local-and-remote-repositories/

## IDE - VS Code

https://code.visualstudio.com/
