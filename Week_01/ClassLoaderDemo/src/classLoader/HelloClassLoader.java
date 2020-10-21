package classLoader;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

public class HelloClassLoader extends ClassLoader {

    protected Class<?> findClass(String className, String loadClassFilePath) {

        byte[] bytes = toBytes(loadClassFilePath);
        return this.defineClass(className, bytes, 0, bytes.length);
    }

    /**
     * 返回处理后的字节数组
     * @param filePath class文件的路径
     */
    private byte[] toBytes(String filePath) {

        byte[] buffer = null;
        FileInputStream fis = null;
        ByteArrayOutputStream bos = null;
        try {
            fis = new FileInputStream(new File(filePath));
            bos = new ByteArrayOutputStream(1024);
            byte[] b = new byte[1];
            byte[] restoreBytes = new byte[1];
            byte b255 = (byte) 255;
            int n;
            while ((n = fis.read(b)) != -1) {

                // 255-x 获取处理后的值
                restoreBytes[0] = (byte) (b255 - b[0]);

                bos.write(restoreBytes, 0, n);
            }
            buffer = bos.toByteArray();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (fis != null) {
                try {
                    fis.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if (bos != null) {
                try {
                    bos.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return buffer;
    }

    public static void main(String[] args) {

        // 要加载的类文件
        String loadClassFilePath = HelloClassLoader.class
                .getResource("../file/Hello.xlass").getPath();

        System.out.println(loadClassFilePath);

        try {

            // 获取要加载的类对象
            Class<?> clz = new HelloClassLoader().findClass("Hello", loadClassFilePath);

            // 获取要调用的方法
            Method hello = clz.getDeclaredMethod("hello");
            hello.setAccessible(true);

            // 调用指定实例的方法
            hello.invoke(clz.newInstance());

        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
    }
}
