function time = timeStamp()
    timeStamp = now;
    yy = str2num(datestr(timeStamp,'yy'));
    mm = str2num(datestr(timeStamp,'mm'));
    dd = str2num(datestr(timeStamp,'dd'));
    hh = str2num(datestr(timeStamp,'HH'));
    MM = str2num(datestr(timeStamp,'MM'));
    ss = str2num(datestr(timeStamp,'SS'));
    fff = str2num(datestr(timeStamp,'FFF'));
    time.year = yy;
    time.month = mm;
    time.day = dd;
    time.hours = hh;
    time.minutes = MM;
    time.seconds = ss;
    time.milliseconds = fff;
end
