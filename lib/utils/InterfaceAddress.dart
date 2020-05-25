// 服务器接口地址
class StaticVariablePage {
  static String IP = "172.22.181.25"; // 服务器ip
  static String HOST = "http://$IP:8090"; // 服务器访问地址

  static void reloadURL(String ip){
    IP = ip;
    HOST = "http://$IP:8090";
  }
}
