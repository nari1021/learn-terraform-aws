# Modify RDS Instance Class using Systems Manager

AWS Systems Manager Automation을 이용한 RDS Instance Class 변경

1. provider.tf 파일에 AWS Profile setting 부분 변경하기

2. SSM Automation 동작 방법
   아래의 절차를 차례로 수행 후 완료 메세지를 MS Teams 채널로 전달함.
   1. **DescribeRDSCluster** : 입력 받은 DBClusterId 와 일치하는 RDS Cluster의 정보를 검색
   2. **StartSendMessage** : 동작 시작 시 MS Teams로 알림 메시지를 보내고, 변경 시킬 Target DB instance Id를 반환
   3. **ModifyDBInstance** : Target DB instance Id와 일치하는 instance들의 class를 미리 입력 받은 InstanceClass로 변경
   4. **WaitUntilInstanceStateModifying** : Target DB Instance의 Status가 **_`Modifying`_**이 될 때까지 기다림
   5. **WaitUntilInstanceStateAvailable** : Target DB Instance의 Status가 _**`Available`**_ 이 될 때까지 기다림
   6. **FinishSendMessage** : 모든 동작이 완료 된 후 알림 메세지 전송
   7. **SendFailMessage** : 단계별 절차 수행 중 오류가 발생 했을 경우 알림 메세지 전송
   8. **SendCancelMessage** : 단계별 절차 수행 중 취소했을 경우 알림 메세지 전송
