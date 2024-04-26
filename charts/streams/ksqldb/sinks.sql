-- DROP CONNECTOR IF EXISTS SINK_SLAVE_TEAMS;
-- DROP CONNECTOR IF EXISTS SINK_SLAVE_USERS;
-- DROP CONNECTOR IF EXISTS SINK_SLAVE_AUTHS;
-- DROP CONNECTOR IF EXISTS SINK_SLAVE_CHANNELS;
-- DROP CONNECTOR IF EXISTS SINK_SLAVE_CHANNEL_MEMBERS;
-- DROP CONNECTOR IF EXISTS SINK_SLAVE_USER_PROFILES;

-- OFFSET
SET 'auto.offset.reset' = 'earliest';

-- SINK CONNECTORS
CREATE SINK CONNECTOR IF NOT EXISTS sink_slave_auths WITH (
    'connector.class' = 'io.confluent.connect.jdbc.JdbcSinkConnector',
    'topics' = 'auth.public.auths',
    'tasks.max' = '1',
    'connection.url' = 'jdbc:postgresql://postgres-slave/client',
    'connection.user' = 'postgres',
    'connection.password' = 'password',
    'auto.create' = 'true',
    'auto.evolve' = 'true',
    'insert.mode' = 'upsert',
    'delete.enabled' = 'true',
    'pk.mode' = 'record_key',
    'transforms' = 'dropPrefix',
    'transforms.dropPrefix.type' = 'org.apache.kafka.connect.transforms.RegexRouter',
    'transforms.dropPrefix.regex' = '(\\w+)\\.(\\w+)\\.(\\w+)',
    'transforms.dropPrefix.replacement' = '$3'
);

CREATE SINK CONNECTOR IF NOT EXISTS sink_slave_teams WITH (
    'connector.class' = 'io.confluent.connect.jdbc.JdbcSinkConnector',
    'topics' = 'teams.public.teams',
    'tasks.max' = '1',
    'connection.url' = 'jdbc:postgresql://postgres-slave/client',
    'connection.user' = 'postgres',
    'connection.password' = 'password',
    'auto.create' = 'true',
    'auto.evolve' = 'true',
    'insert.mode' = 'upsert',
    'delete.enabled' = 'true',
    'pk.mode' = 'record_key',
    'transforms' = 'dropPrefix',
    'transforms.dropPrefix.type' = 'org.apache.kafka.connect.transforms.RegexRouter',
    'transforms.dropPrefix.regex' = '(\\w+)\\.(\\w+)\\.(\\w+)',
    'transforms.dropPrefix.replacement' = '$3'
);

CREATE SINK CONNECTOR IF NOT EXISTS sink_slave_users WITH (
    'connector.class' = 'io.confluent.connect.jdbc.JdbcSinkConnector',
    'topics' = 'users.public.users',
    'tasks.max' = '1',
    'connection.url' = 'jdbc:postgresql://postgres-slave/client',
    'connection.user' = 'postgres',
    'connection.password' = 'password',
    'auto.create' = 'true',
    'auto.evolve' = 'true',
    'insert.mode' = 'upsert',
    'delete.enabled' = 'true',
    'pk.mode' = 'record_key',
    'transforms' = 'dropPrefix',
    'transforms.dropPrefix.type' = 'org.apache.kafka.connect.transforms.RegexRouter',
    'transforms.dropPrefix.regex' = '(\\w+)\\.(\\w+)\\.(\\w+)',
    'transforms.dropPrefix.replacement' = '$3'
);

CREATE SINK CONNECTOR IF NOT EXISTS sink_slave_user_profiles WITH (
    'connector.class' = 'io.confluent.connect.jdbc.JdbcSinkConnector',
    'topics' = 'users.public.user_profiles',
    'tasks.max' = '1',
    'connection.url' = 'jdbc:postgresql://postgres-slave/client',
    'connection.user' = 'postgres',
    'connection.password' = 'password',
    'auto.create' = 'true',
    'auto.evolve' = 'true',
    'insert.mode' = 'upsert',
    'delete.enabled' = 'true',
    'pk.mode' = 'record_key',
    'transforms' = 'dropPrefix',
    'transforms.dropPrefix.type' = 'org.apache.kafka.connect.transforms.RegexRouter',
    'transforms.dropPrefix.regex' = '(\\w+)\\.(\\w+)\\.(\\w+)',
    'transforms.dropPrefix.replacement' = '$3'
);

CREATE SINK CONNECTOR IF NOT EXISTS sink_slave_channels WITH (
    'connector.class' = 'io.confluent.connect.jdbc.JdbcSinkConnector',
    'topics' = 'channels.public.channels',
    'tasks.max' = '1',
    'connection.url' = 'jdbc:postgresql://postgres-slave/client',
    'connection.user' = 'postgres',
    'connection.password' = 'password',
    'auto.create' = 'true',
    'auto.evolve' = 'true',
    'insert.mode' = 'upsert',
    'delete.enabled' = 'true',
    'pk.mode' = 'record_key',
    'transforms' = 'dropPrefix',
    'transforms.dropPrefix.type' = 'org.apache.kafka.connect.transforms.RegexRouter',
    'transforms.dropPrefix.regex' = '(\\w+)\\.(\\w+)\\.(\\w+)',
    'transforms.dropPrefix.replacement' = '$3'
);

CREATE SINK CONNECTOR IF NOT EXISTS sink_slave_channel_members WITH (
    'connector.class' = 'io.confluent.connect.jdbc.JdbcSinkConnector',
    'topics' = 'channels.public.channel_members',
    'tasks.max' = '1',
    'connection.url' = 'jdbc:postgresql://postgres-slave/client',
    'connection.user' = 'postgres',
    'connection.password' = 'password',
    'auto.create' = 'true',
    'auto.evolve' = 'true',
    'insert.mode' = 'upsert',
    'delete.enabled' = 'true',
    'pk.mode' = 'record_key',
    'transforms' = 'dropPrefix',
    'transforms.dropPrefix.type' = 'org.apache.kafka.connect.transforms.RegexRouter',
    'transforms.dropPrefix.regex' = '(\\w+)\\.(\\w+)\\.(\\w+)',
    'transforms.dropPrefix.replacement' = '$3'
);
