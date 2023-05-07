# HashiCorp Certified: Terraform Associate (003)

## 1. 시험 관련

### 1.1. 기본 조건

- 기본적인 Terraform CLI 사용
- 온프레미스 및 클라우드 아키텍처에 대한 기본적인 이해

## 2. 시험 목표

1. IaC 개념 이해하기
   - IaC가 무엇인지 설명
   - IaC 패턴의 장점 설명
2. Terraform의 목적 이해하기 (다른 IaC와 비교)
   - 멀티 클라우드와 공급자에 구애받지 않는 이점 설명
   - terraform state 이점에 대한 설명
3. Terraform 기본 이해하기
   - Terraform provider 버전 및 설치
   - 플러그인 기반의 아키텍처 설명
   - 멀티 providers를 사용한 Terraform 구성 작성
   - Terraform provider을 찾고 적용하는 것에 대한 설명
4. 핵심 워크플로우 외부에서 Terraform 사용하기
   - `terraform import` 를 사용하여 기존에 존재하는 인프라 구성을 terraform state로 가져오는 것을 설명
   - `terraform state` 를 사용하여 Terraform 상태 확인하기
   - 긴 로깅을 활성화 했을 때와 결과/값이 무엇인지 설명하기
5. Terraform modules과 상호 작용하기
   - 공용 Terraform 모듈 레지스트리를 포함한 다양한 모듈 소스 옵션을 대조하고 사용하기
   - 모듈 입쳑 및 출력과 상호 작용하기
   - 모듈/자식 모듈 내의 가변 범위 설명하기
   - 모듈 버전 설정하기
6. 핵심 Terraform 워크플로우를 사용하기
   - Terraform 워크플로우 설명하기 (write > plan > create)
   - Terraform 작업 디렉토리 초기화 (`terraform init`)
   - Terraform 구성 검증하기 (`terraform validate`)
   - Terraform에 대한 실행 계획을 생성하고 검토하기 (`terraform plan`)
   - Terraform으로 인프라 변경 실행 (`terraform apply`)
   - Terraform 관리 인프라 파괴 (`terraform destroy`)
   - 구성에 서식 및 스타일 조정을 적용하기 (`terraform fmt`)
7. state 구현하고 유지하기
   - 기본 `local` 백엔드 설명하기
   - 상태 잠금 설명하기
   - 백엔드 및 클라우드 통합 인증 방법 처리하기
   - 원격 상태 백엔드 옵션을 차별화하기
   - 자원 드리프트와 테라폼 상태를 관리하기
   - 구성에서 `backend` 블록과 클라우드 통합 설명하기
   - 상태 파일의 비밀 관리 이해하기
8. 구성을 읽고, 생성하고, 수정하기
   - 변수와 출력의 사용을 시연하기
   - 안전한 비밀 주입 모범 사례를 설명하기
   - 수집 및 구조적 유형의 사용을 이해하기
   - `resource` 와 `data` 구성을 만들고 차이점 알기
   - 리소스 주소 지정과 리소스 매개 변수를 사용하여 리소스를 함께 연결하기
   - HCL과 Terraform 함수를 사용하여 구성을 작성하기
   - 내장된 종속성 관리 설명하기 (실행 순서 기반)
9. 테라폼 클라우드 기능 이해하기
   - 테라폼 클라우드가 인프라를 관리하는 데 어떻게 도움이 되는지 설명하기
   - 테라폼 클라우드가 어떻게 협업과 거버넌스를 가능하게 하는지 설명하기
     [ 참고 ] [Terraform Certification](https://www.hashicorp.com/certification/terraform-associate)

## 99. 예상 기출 문제

[Terraform Associate Exam](https://www.examtopics.com/exams/hashicorp/terraform-associate/view/)
