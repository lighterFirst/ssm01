package SSM01.util;

import java.util.UUID;

public class UuidGeneter {
    public static String uuidGenerator(){
        return UUID.randomUUID().toString().replace("-","");
    }

}
