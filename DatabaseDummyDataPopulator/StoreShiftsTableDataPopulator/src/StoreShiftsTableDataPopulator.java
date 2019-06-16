import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

public class StoreShiftsTableDataPopulator {

    private static final int numberOfRecords = 100;
    private static final int startOfShift = 10;
    private static final int endOfShift = 20;
    private static final int maxStoreDuration = endOfShift - startOfShift;
    private static final int maxShiftDateOffset = 7;

    public static void main(String args[]) throws SQLException {
        Connection connection = createDBConnection();
        createDB(connection);
        populateDB(connection);

    }

    private static Connection createDBConnection() {
        Connection connection = null;
        Statement stmt = null;

        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager
                    .getConnection("jdbc:postgresql://localhost:5432/postgres",
                            "postgres", "postgres");

        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }

    private static void createDB(Connection connection) throws SQLException {
        Statement stmt = null;
        stmt = connection.createStatement();
        String sql = "CREATE TABLE \"RetailStoreScheduleSystem\".store_shifts " +
                "(ID INT PRIMARY KEY     NOT NULL," +
                " start           timestamp    NOT NULL, " +
                " finish            timestamp     NOT NULL, " +
                " duration        real, " +
                " store_routine_id         CHAR(10) NOT NULL)";
        stmt.executeUpdate(sql);
        stmt.close();
    }

    private static void populateDB(Connection connection) throws SQLException {
        Statement statement = null;
        statement = connection.createStatement();
        List<String> storeRoutineList = Arrays.asList("gsr", "gor", "grr", "cscr", "cor", "cftcr");
        Map<String, Integer> storeRoutineCountMap = new LinkedHashMap<String, Integer>() {
            {
                put("gsr", 1);
                put("gor", 1);
                put("grr", 1);
                put("cscr", 1);
                put("cor", 1);
                put("cftcr", 1);
            }
        };
        Random random = new Random();

        for (int shift_id = 0; shift_id < numberOfRecords; shift_id++) {
            StoreShift storeShift = getRandomShift();
            String store_routine = storeRoutineList.get(random.nextInt(storeRoutineList.size()));
            String store_routine_id = store_routine + '_' + storeRoutineCountMap.get(store_routine);
            storeRoutineCountMap.put(store_routine, storeRoutineCountMap.get(store_routine) + 1);
            String sql = "INSERT INTO \"RetailStoreScheduleSystem\".store_shifts (ID,start,finish,duration,store_routine_id) "
                    + "VALUES (" + shift_id + ",'" + storeShift.startTime + "','" + storeShift.endTime + "'," + storeShift.duration + ",\'" + store_routine_id + "' );";
            System.out.println(sql);
            statement.executeUpdate(sql);
        }
    }

    private static StoreShift getRandomShift() {
        Random random = new Random();
        int shiftStart = random.nextInt(maxStoreDuration) + startOfShift;
        int shiftDuration = random.nextInt(maxStoreDuration) + 1;
        int shiftEnd = shiftStart + shiftDuration;
        while (shiftStart + shiftDuration > endOfShift) {
            shiftStart = random.nextInt(maxStoreDuration) + startOfShift;
            shiftDuration = random.nextInt(maxStoreDuration) + 1;
            shiftEnd = shiftStart + shiftDuration;
        }

        StoreShift storeShift = new StoreShift();
        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Date currentDate = new Date();
        System.out.println(currentDate);
        Calendar c = Calendar.getInstance();
        c.setTime(currentDate);

        c.add(Calendar.DATE, random.nextInt(maxShiftDateOffset));
        c.set(Calendar.HOUR_OF_DAY, shiftStart);
        storeShift.startTime = dateFormat.format(c.getTime());
        c.set(Calendar.HOUR_OF_DAY, shiftEnd);
        storeShift.endTime = dateFormat.format(c.getTime());
        storeShift.duration = shiftDuration;
        return storeShift;
    }

    private static class StoreShift {
        String startTime;
        String endTime;
        Integer duration;
    }
}