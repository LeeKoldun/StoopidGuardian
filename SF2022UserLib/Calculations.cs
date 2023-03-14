namespace SF2022UserLib;

public static class Calculations
{
    public static string[] AvailablePeriods(TimeSpan[] startTimes, int[] durations, TimeSpan beginWorkingTime, TimeSpan endWorkingTime, int consultationTime)
    {
        if (startTimes.Length != durations.Length)
        {
            throw new InvalidDataException("startTimes and durations are not the same length");
        }

        if (beginWorkingTime > endWorkingTime)
        {
            throw new InvalidDataException("beginWorkingTime is greater than endWorkingTime");
        }

        if (consultationTime < 1)
        {
            throw new InvalidDataException("consultationTime is invalid");
        }

        List<string> result = new List<string>();
        var curTime = beginWorkingTime;

        int i = 0;
        while (curTime < endWorkingTime)
        {
            if (NextTime(curTime, consultationTime) > endWorkingTime)
            {
                result.Add($"{curTime} - {endWorkingTime}");
                break;
            }

            if (i != startTimes.Length)
            {
                if (NextTime(curTime, consultationTime) >= startTimes[i])
                {
                    if (curTime < startTimes[i] && NextTime(curTime, consultationTime) <= startTimes[i])
                        result.Add($"{curTime} - {startTimes[i]}");
                    curTime = NextTime(startTimes[i], durations[i]);
                    i++;
                    continue;
                }
            }
            
            result.Add($"{curTime} - {NextTime(curTime, consultationTime)}");
            curTime = NextTime(curTime, consultationTime);
        }

        return result.ToArray();
    }

    private static TimeSpan NextTime(TimeSpan time, int delay) => 
        time.Add(new TimeSpan(0, delay, 0));
}