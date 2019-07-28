# Ansible playbook of Hyperledger Fabric
このプロジェクトはHyperledger Fabricを複数のインスタンスに展開する為のAnsible Playbookとrolesが含まれてします。すべてdocker-containerにより実行され、docker-composeによって管理されています。

## Instructions
### install fabric
対象のnodeに対してfabricを実行する為のdocker imageをインストールします。

```
$ sh scripts/fabric.sh install
```

### setting fabric
inventoriesファイル内の`node_roles`に従って各nodeに対し、fabricコンポーネントの設定を行います。
settingは起動まで行います。

※ 既存のdockerコンテナはすべて再作成されます。

#### node_roles 設定

- **orderer** - ordererを実行します
- **root_orderer** - 他のordererの為の設定(crypto-config)を生成する為に使用されます
- **root_peer** - チャネルを作成してチェーンコードをインスタンス化するために使用されます
- **peer** - organizationのpeerとAPIコンテナをホストします。
- **explorer** - ブロックチェーンを可視化する為のexporterを起動します

```
$ sh scripts/fabric.sh setting
```

### start fabric
各nodeでfabricコンポーネントを起動します。
※ 既存のdockerコンテナはすべて再作成されます。

```
$ sh scripts/fabric.sh start
```
