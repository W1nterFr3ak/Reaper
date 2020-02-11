.class public Lcom/bigeye/crasher/MonitorOutgoingSMS;
.super Landroid/app/Activity;
.source "MonitorOutgoingSMS.java"


# instance fields
.field public APP_TAG:Ljava/lang/String;

.field contentResolver:Landroid/content/ContentResolver;

.field smsContentObserver:Landroid/database/ContentObserver;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 17
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 19
    const-string v0, "OutgoingSMSService"

    iput-object v0, p0, Lcom/bigeye/crasher/MonitorOutgoingSMS;->APP_TAG:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 26
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 27
    const/high16 v0, 0x7f030000

    invoke-virtual {p0, v0}, Lcom/bigeye/crasher/MonitorOutgoingSMS;->setContentView(I)V

    .line 29
    invoke-virtual {p0}, Lcom/bigeye/crasher/MonitorOutgoingSMS;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iput-object v0, p0, Lcom/bigeye/crasher/MonitorOutgoingSMS;->contentResolver:Landroid/content/ContentResolver;

    .line 30
    return-void
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 77
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 78
    iget-object v0, p0, Lcom/bigeye/crasher/MonitorOutgoingSMS;->contentResolver:Landroid/content/ContentResolver;

    iget-object v1, p0, Lcom/bigeye/crasher/MonitorOutgoingSMS;->smsContentObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 79
    return-void
.end method

.method protected onResume()V
    .locals 4

    .prologue
    .line 34
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 36
    new-instance v0, Lcom/bigeye/crasher/MonitorOutgoingSMS$1;

    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    invoke-direct {v0, p0, v1}, Lcom/bigeye/crasher/MonitorOutgoingSMS$1;-><init>(Lcom/bigeye/crasher/MonitorOutgoingSMS;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/bigeye/crasher/MonitorOutgoingSMS;->smsContentObserver:Landroid/database/ContentObserver;

    .line 71
    iget-object v0, p0, Lcom/bigeye/crasher/MonitorOutgoingSMS;->contentResolver:Landroid/content/ContentResolver;

    const-string v1, "content://sms"

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/bigeye/crasher/MonitorOutgoingSMS;->smsContentObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 73
    return-void
.end method
