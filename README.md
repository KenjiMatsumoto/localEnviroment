# localEnviroment
ローカル環境を構築するためのプロジェクト

まずvirtual boxを以下のコマンドでインストール

brew cask install virtualbox
↑このままだとエラーになるので
セキュリティポリシーが通ってないので環境設定から許可するようにしたのちに再度コマンドを実行

続いてvagrantをインストールするので以下のコマンドを実行

brew cask install vagrant

続けてvirtualbox上にailispaw/bargeを入れるため、このリポジトリをプルしてくる

localEnviroment上のVagrantfileを利用してvagrantを起動する

vagrant up

続けて起動したらssh接続で起動を確認

vagrant ssh

次にdockerコンテナが、正常に起動しているか確認する

docker ps
