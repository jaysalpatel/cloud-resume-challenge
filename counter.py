from boto3 import resource

connection = resource('dynamodb', region='us-east-1')
table = connection.Table('visitorcounter')

def lambda_handler(event, context):
    update = table.get_item(Key={'counter': '1'})
    update.get('Item') or table.put_item(Item={'counter': '1', 'visitorcount': '0'})
    
    item = table.get_item(Key={'counter': '1'}).get('Item')
    
    count = item.get('visitorcount') + 1
    table.put_item('counter': '1'. 'visitorcount' : count})
    return {
        'statusCode': 200,
        'body': count,
        'headers': {
            'Access-Control-Allow-Origin': '*'
        }
 }
