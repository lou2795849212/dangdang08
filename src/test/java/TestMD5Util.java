import com.oracle.book.util.MD5Util;

public class TestMD5Util {
    public static  void main(String[] args) throws  Exception{
       /* String pwd = getMD5("99991");
        System.out.println(pwd);*/
        String sdr=MD5Util.getEncryptedPwd("admin");
        System.out.println(sdr);

    }
}
