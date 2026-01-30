import java.io.*;
import java.util.*;

public class UTF8PropertiesReader {
  private static void doesntWorkWithUTF8() throws Exception {
        Properties props = new Properties();
        try (InputStream in = new FileInputStream("messages.properties")) {
            props.load(in);
        }
        System.out.println("Fails: " + props.getProperty("greeting"));
  }

  private static void worksWithUTF8() throws Exception {
        Properties props = new Properties();
        try (Reader in = new InputStreamReader(new FileInputStream("messages.properties"), "UTF-8")) {
            props.load(in);
        }
        System.out.println("Works: " + props.getProperty("greeting"));
  }

  private static void worksWithUTF8Legacy() throws Exception {
        Properties props = new Properties();
        try (InputStream in = new FileInputStream("messages.properties")) {
            props.load(in);
        }

        String greeting = "";
        String value = props.getProperty("greeting");
        if (value != null) {
          greeting = new String(value.getBytes("ISO-8859-1"), "UTF-8");
        }

        System.out.println("Works with all Java versions: " + greeting);
  }

  public static void main(String... args) throws Exception {
    doesntWorkWithUTF8();
    worksWithUTF8();
    worksWithUTF8Legacy();
  }
}

