#E2S部署文档#

##环境
    git、ruby 2.0+、rails 4.1+、nginx 1.2+、mysql 5.0+

##下载代码##
    
    git clone https://github.com/E2S2015/rails.git e2s

##安装ruby依赖类库##

    bundle install

##配置文件##

    cd e2s

    cp config/database.yml.example config/database.yml 修改数据库配置信息

    cp config/secrets.yml.example config/secrets.yml 修改密钥
 
    cp config/e2s.yml.example config/e2s.yml 修改好e2s配置信息

    cp config/unicorn.rb.example config/unicorn.rb 修改unicorn配置文件，配置应用目录等信息

##执行数据脚本##

    RAILS_ENV=production bundle exec rake db:create  创建数据库
   
    RAILS_ENV=production bundle exec rake db:migrate 创建表及索引

    RAILS_ENV=production bundle exec rake db:seed 创建默认分类和管理员账号，编辑 db/seeds.rb可以修改默认分类和管理员账号密码，然后再执行

##预编译前端资源##

    RAILS_ENV=production bundle exec rake assets:clean
    
    RAILS_ENV=production bundle exec rake assets:precompile

##启动##

###创建服务用到的文件夹###
    mkdir -p tmp/pids

    mkdir -p log 

###拷贝启动服务文件###

    sudo cp deployment/init.d/e2s /etc/init.d 编辑文件中的app目录和sudo user的配置

###启动e2s服务###
    
    sudo service e2s start
    
    sudo service e2s stop/restart 停止或者重启服务

###nginx配置###

    以下列出部分配置，完整配置见 deployment/nginx/nginx.conf文件

    upstream blog {
        server unix:/home/the/e2s/tmp/sockets/e2s.socket;
    }
    server {
        listen 80;
        server_name e2s.com;
        root /home/the/e2s/public;
        try_files $uri/index.html $uri.html $uri @user1;
        location @user1 {
            proxy_redirect off;
            proxy_set_header Host $host;
            proxy_set_header X-Forwarded-Host $host;
            proxy_set_header X-Forwarded-Server $host;
            proxy_set_header X-Real-Ip $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_buffering on;
            proxy_pass http://e2s;
        }
        location ~ ^(/assets) {
            access_log off;
            expires max;
        }

    }

###重启nginx###
    
    sudo service nginx restart
###绑定hosts
   
    127.0.0.1  e2s.com 

###访问###

    http://e2s.com

