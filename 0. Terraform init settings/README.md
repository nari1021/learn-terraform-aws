# AWS Provider 사용 시 IAM User 설정

## 1. IAM User를 생성한 뒤, profile 설정

[AWS CLI에 사용되는 명명된 프로파일](https://docs.aws.amazon.com/ko_kr/cli/latest/userguide/cli-configure-profiles.html)을 설정하여 사용하면 여러개의 IAM User를 미리 등록해 두고 `--profile` 옵션으로 사용할 수 있어서 간편합니다.

처음 등록하는 사용자라면 사용할 user의 이름을 넣어서 아래와 같이 등록할 수 있습니다.

user를 생성하면서 발급 받은 access key 와 secret key를 입력해주면 됩니다.

```
# --profile 뒤에 정의할 user 이름을 넣어주면 된다
$ aws configure --profile test-user
AWS Access Key ID [None]:
AWS Secret Access Key [None]:
Default region name [None]:ap-northeast-2 # 
Default output format [None]:json
```

- region : 기본 region 설정
- output : 이 profile을 사용하여 요청된 명령의 기본 출력 형식을 지정


또한, 생성된 profile configure 는 아래와 같이 확인 가능합니다.

```
$ cat ~/.aws/credentials
[test-user]
aws_access_key_id = 
aws_secret_access_key = 

$ cat ~/.aws/config
[profile test-user]
region = ap-northeast-2
output = json
```

여러 profile을 설정해뒀다면, 어떤 profile들이 있는지 확인할 수 있다.

```
$ aws configure list-profiles
default
test-user
nari1021
```

예를들어 profile을 사용하여 s3 bucket 목록을 조회한다면,

```
$ aws s3 ls --profile test-user
```

이런식으로 AWS CLI 뒤에 `--profile [user name]` 을 넣어서 입력하면 된다. 


## 2. terraform provider에서 AWS Profile 사용하는 법

미리 설정한 profile 의 이름을 넣어서 설정하면 보안도 관리하면서 Git에 코드를 올릴 때 실수를 줄일 수 있다.

```
terraform {
  required_version = ">= 1.1.5"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 4.14.0"
    }
  }
}

provider "aws" {
  profile                  = "test-user"
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
}
```
