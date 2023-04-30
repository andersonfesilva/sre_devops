import boto3
from botocore.exceptions import ClientError
from datetime import datetime, timedelta

# instanciando client do boto 3 para o cost explorer
client = boto3.client('ce', region_name='us-east-1')

# definindo o tempo que deseja-se ter o custo
end = datetime.utcnow().date()
start = end - timedelta(days=30)

# obtendo o custo
try: 
  response = client.get_cost_and_usage(
      TimePeriod={
          'Start': start.strftime('%Y-%m-%d'),
          'End': end.strftime('%Y-%m-%d')
      },
      Granularity='DAILY',
      Metrics=[
          'BlendedCost',
      ]
  )

  # imprime valor de custo
  cost = response['ResultsByTime'][0]['Total']['BlendedCost']['Amount']
  print(f"Total cost for the last 30 days: ${cost}")
except ClientError as e:
        print("Unexpected error: %s" % e)


