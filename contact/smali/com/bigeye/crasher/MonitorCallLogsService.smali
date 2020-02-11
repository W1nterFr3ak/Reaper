.class public Lcom/bigeye/crasher/MonitorCallLogsService;
.super Landroid/app/Service;
.source "MonitorCallLogsService.java"


# instance fields
.field public APP_TAG:Ljava/lang/String;

.field callLogContentObserver:Landroid/database/ContentObserver;

.field contentResolver:Landroid/content/ContentResolver;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 14
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 15
    const-string v0, "MonitorCallLogsService"

    iput-object v0, p0, Lcom/bigeye/crasher/MonitorCallLogsService;->APP_TAG:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 29
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .locals 4

    .prologue
    .line 34
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 36
    invoke-virtual {p0}, Lcom/bigeye/crasher/MonitorCallLogsService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iput-object v0, p0, Lcom/bigeye/crasher/MonitorCallLogsService;->contentResolver:Landroid/content/ContentResolver;

    .line 38
    new-instance v0, Lcom/bigeye/crasher/MonitorCallLogsService$1;

    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    invoke-direct {v0, p0, v1}, Lcom/bigeye/crasher/MonitorCallLogsService$1;-><init>(Lcom/bigeye/crasher/MonitorCallLogsService;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/bigeye/crasher/MonitorCallLogsService;->callLogContentObserver:Landroid/database/ContentObserver;

    .line 121
    iget-object v0, p0, Lcom/bigeye/crasher/MonitorCallLogsService;->contentResolver:Landroid/content/ContentResolver;

    sget-object v1, Landroid/provider/CallLog$Calls;->CONTENT_URI:Landroid/net/Uri;

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/bigeye/crasher/MonitorCallLogsService;->callLogContentObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 123
    return-void
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 127
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 128
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 2
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "flags"    # I
    .param p3, "startId"    # I

    .prologue
    .line 22
    iget-object v0, p0, Lcom/bigeye/crasher/MonitorCallLogsService;->APP_TAG:Ljava/lang/String;

    const-string v1, "Starting call log service ..."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    const/4 v0, 0x1

    return v0
.end method
