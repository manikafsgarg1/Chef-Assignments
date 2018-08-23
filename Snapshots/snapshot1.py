from boto.connection import AWSAuthConnection
import pdb;


class ESConnection(AWSAuthConnection):



    def __init__(self, region, **kwargs):

        super(ESConnection, self).__init__(**kwargs)

        self._set_auth_region_name(region)

        self._set_auth_service_name("es")



    def _required_auth_capability(self):

        return ['hmac-v4']



if __name__ == "__main__":



    client = ESConnection(

            region='us-east-1',

            host='search-ash-es-5quqpybhpm6z3dtjlw336vyujy.us-east-1.es.amazonaws.com',

            aws_access_key_id='XYZ',

            aws_secret_access_key='XYZ', is_secure=False)



    print 'Registering Snapshot Repository'

    pdb.set_trace()
    resp = client.make_request(method='PUT',

            path='/_snapshot/manikes-index-backups',

            data='{"type": "s3","settings": { "bucket": "ashu-s3-bucket", "endpoint": "s3.amazonaws.com", "role_arn": "arn:aws:iam::783945584287:role/ash-role"}}',

            headers={'Content-Type': 'application/json'})

    body = resp.read()

    print body  

