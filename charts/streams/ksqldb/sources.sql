-- OFFSET
SET 'auto.offset.reset' = 'earliest';

-- SOURCE CONNECTORS
CREATE SOURCE CONNECTOR IF NOT EXISTS source_master_auth WITH (
    'connector.class' = 'io.debezium.connector.postgresql.PostgresConnector',
    'plugin.name' = 'pgoutput',
    'slot.name' = 'auth',
    'topic.prefix' = 'auth', -- globally unique
    'database.server.name' = 'auth',
    'database.hostname' = 'postgres-master',
    'database.port' = '5432',
    'database.user' = 'postgres',
    'database.password' = 'password',
    'database.dbname' = 'auth',
    'table.include.list' = 'public.auths',
    'column.include.list' = 'public.auths.id,public.auths.uuid,public.auths.email',
    'transforms' = 'unwrap',
    'transforms.unwrap.type' = 'io.debezium.transforms.ExtractNewRecordState'
);

CREATE SOURCE CONNECTOR IF NOT EXISTS source_master_teams WITH (
    'connector.class' = 'io.debezium.connector.postgresql.PostgresConnector',
    'plugin.name' = 'pgoutput',
    'slot.name' = 'teams',
    'topic.prefix' = 'teams', -- globally unique
    'database.server.name' = 'teams',
    'database.hostname' = 'postgres-master',
    'database.port' = '5432',
    'database.user' = 'postgres',
    'database.password' = 'password',
    'database.dbname' = 'teams',
    'table.include.list' = 'public.teams',
    'transforms' = 'unwrap',
    'transforms.unwrap.type' = 'io.debezium.transforms.ExtractNewRecordState'
);

CREATE SOURCE CONNECTOR IF NOT EXISTS source_master_users WITH (
    'connector.class' = 'io.debezium.connector.postgresql.PostgresConnector',
    'plugin.name' = 'pgoutput',
    'slot.name' = 'users',
    'topic.prefix' = 'users', -- globally unique
    'database.server.name' = 'users',
    'database.hostname' = 'postgres-master',
    'database.port' = '5432',
    'database.user' = 'postgres',
    'database.password' = 'password',
    'database.dbname' = 'users',
    'table.include.list' = 'public.users,public.user_profiles',
    'transforms' = 'unwrap',
    'transforms.unwrap.type' = 'io.debezium.transforms.ExtractNewRecordState'
);

CREATE SOURCE CONNECTOR IF NOT EXISTS source_master_channels WITH (
    'connector.class' = 'io.debezium.connector.postgresql.PostgresConnector',
    'plugin.name' = 'pgoutput',
    'slot.name' = 'channels',
    'topic.prefix' = 'channels', -- globally unique
    'database.server.name' = 'channels',
    'database.hostname' = 'postgres-master',
    'database.port' = '5432',
    'database.user' = 'postgres',
    'database.password' = 'password',
    'database.dbname' = 'conversations',
    'table.include.list' = 'public.channels,public.channel_members',
    'transforms' = 'unwrap',
    'transforms.unwrap.type' = 'io.debezium.transforms.ExtractNewRecordState'
);
