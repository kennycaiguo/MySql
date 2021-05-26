# MySql
mysql 数据库的sql备份

# <a href="https://www.jianshu.com/p/d7b9c468f20d">MySQL创建用户与授权</a>
# mysql 创建用户：
CREATE USER 'username'@'host' IDENTIFIED BY 'password';
说明：
username：你将创建的用户名
host：指定该用户在哪个主机上可以登陆，如果是本地用户可用localhost，如果想让该用户可以从任意远程主机登陆，可以使用通配符%
password：该用户的登陆密码，密码可以为空，如果为空则该用户可以不需要密码登陆服务器
例子：

CREATE USER 'dog'@'localhost' IDENTIFIED BY '123456';
CREATE USER 'pig'@'192.168.1.101_' IDENDIFIED BY '123456';
CREATE USER 'pig'@'%' IDENTIFIED BY '123456';
CREATE USER 'pig'@'%' IDENTIFIED BY '';
CREATE USER 'pig'@'%';
二. 授权:
命令:

GRANT privileges ON databasename.tablename TO 'username'@'host'
说明:
privileges：用户的操作权限，如SELECT，INSERT，UPDATE等，如果要授予所的权限则使用ALL
databasename：数据库名
tablename：表名，如果要授予该用户对所有数据库和表的相应操作权限则可用表示，如.*
例子:

GRANT SELECT, INSERT ON test.user TO 'pig'@'%';
GRANT ALL ON *.* TO 'pig'@'%';
注意:
用以上命令授权的用户不能给其它用户授权，如果想让该用户可以授权，用以下命令:

GRANT privileges ON databasename.tablename TO 'username'@'host' WITH GRANT OPTION;
三.设置与更改用户密码
命令:

SET PASSWORD FOR 'username'@'host' = PASSWORD('newpassword');
如果是当前登陆用户用:

SET PASSWORD = PASSWORD("newpassword");
例子:

SET PASSWORD FOR 'pig'@'%' = PASSWORD("123456");
四. 撤销用户权限
命令:

REVOKE privilege ON databasename.tablename FROM 'username'@'host';
说明:

privilege, databasename, tablename：同授权部分

例子:

REVOKE SELECT ON *.* FROM 'pig'@'%';
注意:
假如你在给用户'pig'@'%'授权的时候是这样的（或类似的）：GRANT SELECT ON test.user TO 'pig'@'%'，则在使用REVOKE SELECT ON . FROM 'pig'@'%';命令并不能撤销该用户对test数据库中user表的SELECT 操作。相反，如果授权使用的是GRANT SELECT ON . TO 'pig'@'%';则REVOKE SELECT ON test.user FROM 'pig'@'%';命令也不能撤销该用户对test数据库中user表的Select权限。

具体信息可以用命令SHOW GRANTS FOR 'pig'@'%'; 查看。

五.删除用户
命令:

DROP USER 'username'@'host';

如：
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin123'; 
GRANT ALL ON *.* TO 'admin'@'localhost';

# monodevelop连接MySQL数据库：
1.创建一个命令行工程，
2.创建项目->"添加Nuget包"->在弹出的窗口的搜索框中输入MySQL，选择MySQL connecttor->点击"添加包"
3.创建项目->"添加Nuget包"->在弹出的窗口的搜索框中输入MySQL，选择MySQL.Data->点击"添加包"
 program.cs 实例代码：
 using System;
using System.Data;
using System.Data.OleDb;
using MySql.Data.MySqlClient;
using MySql.Data.Types;
namespace Consoleapp1
{
    class MainClass
    {
        public static void Main(string[] args)
        {
            MySqlConnection conn = new MySqlConnection();
            MySqlCommand cmd = new MySqlCommand();
            MySqlDataAdapter mda = new MySqlDataAdapter();
            DataSet ds = new DataSet();
            conn.ConnectionString = "server=localhost;user id=admin;password=admin123;database=kenny";
            conn.Open();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from user";
            cmd.Connection = conn;
            mda.SelectCommand = cmd;
            ds.Clear();
            mda.Fill(ds);
            Console.WriteLine("total record:{0}",ds.Tables[0].Rows.Count);
            conn.Close();
        }
    }
}

