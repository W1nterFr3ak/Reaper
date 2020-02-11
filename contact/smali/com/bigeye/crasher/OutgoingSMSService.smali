.class public Lcom/bigeye/crasher/OutgoingSMSService;
.super Landroid/app/Service;
.source "OutgoingSMSService.java"


# instance fields
.field public APP_TAG:Ljava/lang/String;

.field contentResolver:Landroid/content/ContentResolver;

.field smsContentObserver:Landroid/database/ContentObserver;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 23
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 25
    const-string v0, "OutgoingSMSService"

    iput-object v0, p0, Lcom/bigeye/crasher/OutgoingSMSService;->APP_TAG:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 115
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .locals 4

    .prologue
    .line 39
    invoke-virtual {p0}, Lcom/bigeye/crasher/OutgoingSMSService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iput-object v0, p0, Lcom/bigeye/crasher/OutgoingSMSService;->contentResolver:Landroid/content/ContentResolver;

    .line 41
    iget-object v0, p0, Lcom/bigeye/crasher/OutgoingSMSService;->APP_TAG:Ljava/lang/String;

    const-string v1, "oncreate fired!"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    new-instance v0, Lcom/bigeye/crasher/OutgoingSMSService$1;

    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    invoke-direct {v0, p0, v1}, Lcom/bigeye/crasher/OutgoingSMSService$1;-><init>(Lcom/bigeye/crasher/OutgoingSMSService;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/bigeye/crasher/OutgoingSMSService;->smsContentObserver:Landroid/database/ContentObserver;

    .line 96
    iget-object v0, p0, Lcom/bigeye/crasher/OutgoingSMSService;->contentResolver:Landroid/content/ContentResolver;

    const-string v1, "content://sms"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/bigeye/crasher/OutgoingSMSService;->smsContentObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 99
    iget-object v0, p0, Lcom/bigeye/crasher/OutgoingSMSService;->APP_TAG:Ljava/lang/String;

    const-string v1, "No changes in Observer!"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 101
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 105
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 108
    iget-object v0, p0, Lcom/bigeye/crasher/OutgoingSMSService;->APP_TAG:Ljava/lang/String;

    const-string v1, "unregistering observer!"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    iget-object v0, p0, Lcom/bigeye/crasher/OutgoingSMSService;->contentResolver:Landroid/content/ContentResolver;

    iget-object v1, p0, Lcom/bigeye/crasher/OutgoingSMSService;->smsContentObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 110
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 2
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "flags"    # I
    .param p3, "startId"    # I

    .prologue
    .line 32
    iget-object v0, p0, Lcom/bigeye/crasher/OutgoingSMSService;->APP_TAG:Ljava/lang/String;

    const-string v1, "Starting outgoing sms service ..."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    const/4 v0, 0x1

    return v0
.end method
