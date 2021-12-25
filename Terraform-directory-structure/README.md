# Terraform 파일 구조

1. main.tf - 기본 진입점이 되는 파일
2. variables.tf - 변수 정의 및 선언
3. outputs.tf - 출력 선언
4. provider.tf - provider 구성
5. resource.tf - 리소스 정의

`main.tf`, `variables.tf`, `outputs.tf` 이 세 가지 파일은 비어있더라도 최소 모듈에 권장되는 파일이다.

Terraform에서는 폴더 하나가 **모듈** 단위이다.
그래서 공통으로 사용하는 인프라 구성은 모듈화한 뒤 환경별로 변수 값만 바꿔서 재사용하면 개발(Dev)환경과 운영(Prod)환경에서 쉽게 동일한 인프라를 구성할 수 있다.
