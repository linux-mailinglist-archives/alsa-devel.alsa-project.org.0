Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 723887C336
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 15:20:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0990416EA;
	Wed, 31 Jul 2019 15:20:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0990416EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564579253;
	bh=UkeMYzu4FqAYTA7tIBUu9ozov3v8yifD1Bav3gekar0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uZ6SLqxzYAmEa+rLWGPZfHCtdE0IrZn1EMSRmt0VfhWVyVCXjt1mnY6h/Gz7UJbzq
	 w1JkiePi8dX7h6kz2vVGQr8zGiR+C9gW7WooKntSv9S6OkazsPzGz7/aqLACGUa91J
	 U3i4KUN+ZydRapGC3z+6PksCAaOAq4dzKo2iE49Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 940CEF80528;
	Wed, 31 Jul 2019 15:17:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E946F80519; Wed, 31 Jul 2019 15:17:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B9D4F800C0
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 15:17:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B9D4F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="b9bLULyI"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 66BBF208E4;
 Wed, 31 Jul 2019 13:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564579057;
 bh=/fJuh2BrCm/YkwllLX3B/FXV1b9lACjnAv5WC6FPK+c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=b9bLULyIq0w4zRzwoxokLmLMtFCUbQqTppHGARqd5WmRlXJMZxHnw3Hrq2u9QO3rI
 8mVV0M0FQVsIsib1EBQLDF6JDhRmWEjalOXaZyYTdmkLYNnecT/112VTrNtt509wF+
 fhsT4y4utwlZrasPf3Y8AxQh8JYhVzP7OQcrarFI=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Date: Wed, 31 Jul 2019 15:17:16 +0200
Message-Id: <20190731131716.9764-3-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190731131716.9764-1-gregkh@linuxfoundation.org>
References: <20190731131716.9764-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH v2 3/3] ASoC: SOF: no need to check return
	value of debugfs_create functions
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

When calling debugfs functions, there is no need to ever check the
return value.  The function can work or not, but the code logic should
never do something different based on this.

Also, if a debugfs call fails, userspace is notified with an error in
the log, so no need to log the error again.

Because we no longer need to check the return value, there's no need to
save the dentry returned by debugfs.  Just use the dentry in the file
pointer if we really need to figure out the "name" of the file being
opened.

Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v2: rebase on 5.3-rc1
    change Subject line to match the subsystem better
    rework based on debugfs core now reporting errors.

 sound/soc/sof/debug.c    | 49 +++++++++++++++-------------------------
 sound/soc/sof/sof-priv.h |  1 -
 sound/soc/sof/trace.c    |  9 ++------
 3 files changed, 20 insertions(+), 39 deletions(-)

diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index 2388477a965e..40940b2fe9d5 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -128,6 +128,7 @@ static ssize_t sof_dfsentry_write(struct file *file, const char __user *buffer,
 	unsigned long ipc_duration_ms = 0;
 	bool flood_duration_test = false;
 	unsigned long ipc_count = 0;
+	struct dentry *dentry;
 	int err;
 #endif
 	size_t size;
@@ -149,11 +150,12 @@ static ssize_t sof_dfsentry_write(struct file *file, const char __user *buffer,
 	 * ipc_duration_ms test floods the DSP for the time specified
 	 * in the debugfs entry.
 	 */
-	if (strcmp(dfse->dfsentry->d_name.name, "ipc_flood_count") &&
-	    strcmp(dfse->dfsentry->d_name.name, "ipc_flood_duration_ms"))
+	dentry = file->f_path.dentry;
+	if (strcmp(dentry->d_name.name, "ipc_flood_count") &&
+	    strcmp(dentry->d_name.name, "ipc_flood_duration_ms"))
 		return -EINVAL;
 
-	if (!strcmp(dfse->dfsentry->d_name.name, "ipc_flood_duration_ms"))
+	if (!strcmp(dentry->d_name.name, "ipc_flood_duration_ms"))
 		flood_duration_test = true;
 
 	/* test completion criterion */
@@ -219,6 +221,7 @@ static ssize_t sof_dfsentry_read(struct file *file, char __user *buffer,
 {
 	struct snd_sof_dfsentry *dfse = file->private_data;
 	struct snd_sof_dev *sdev = dfse->sdev;
+	struct dentry *dentry;
 	loff_t pos = *ppos;
 	size_t size_ret;
 	int skip = 0;
@@ -226,8 +229,9 @@ static ssize_t sof_dfsentry_read(struct file *file, char __user *buffer,
 	u8 *buf;
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST)
-	if ((!strcmp(dfse->dfsentry->d_name.name, "ipc_flood_count") ||
-	     !strcmp(dfse->dfsentry->d_name.name, "ipc_flood_duration_ms")) &&
+	dentry = file->f_path.dentry;
+	if ((!strcmp(dentry->d_name.name, "ipc_flood_count") ||
+	     !strcmp(dentry->d_name.name, "ipc_flood_duration_ms")) &&
 	    dfse->cache_buf) {
 		if (*ppos)
 			return 0;
@@ -290,8 +294,7 @@ static ssize_t sof_dfsentry_read(struct file *file, char __user *buffer,
 		if (!pm_runtime_active(sdev->dev) &&
 		    dfse->access_type == SOF_DEBUGFS_ACCESS_D0_ONLY) {
 			dev_err(sdev->dev,
-				"error: debugfs entry %s cannot be read in DSP D3\n",
-				dfse->dfsentry->d_name.name);
+				"error: debugfs entry cannot be read in DSP D3\n");
 			kfree(buf);
 			return -EINVAL;
 		}
@@ -356,17 +359,11 @@ int snd_sof_debugfs_io_item(struct snd_sof_dev *sdev,
 	}
 #endif
 
-	dfse->dfsentry = debugfs_create_file(name, 0444, sdev->debugfs_root,
-					     dfse, &sof_dfs_fops);
-	if (!dfse->dfsentry) {
-		/* can't rely on debugfs, only log error and keep going */
-		dev_err(sdev->dev, "error: cannot create debugfs entry %s\n",
-			name);
-	} else {
-		/* add to dfsentry list */
-		list_add(&dfse->list, &sdev->dfsentry_list);
+	debugfs_create_file(name, 0444, sdev->debugfs_root, dfse,
+			    &sof_dfs_fops);
 
-	}
+	/* add to dfsentry list */
+	list_add(&dfse->list, &sdev->dfsentry_list);
 
 	return 0;
 }
@@ -402,16 +399,10 @@ int snd_sof_debugfs_buf_item(struct snd_sof_dev *sdev,
 		return -ENOMEM;
 #endif
 
-	dfse->dfsentry = debugfs_create_file(name, mode, sdev->debugfs_root,
-					     dfse, &sof_dfs_fops);
-	if (!dfse->dfsentry) {
-		/* can't rely on debugfs, only log error and keep going */
-		dev_err(sdev->dev, "error: cannot create debugfs entry %s\n",
-			name);
-	} else {
-		/* add to dfsentry list */
-		list_add(&dfse->list, &sdev->dfsentry_list);
-	}
+	debugfs_create_file(name, mode, sdev->debugfs_root, dfse,
+			    &sof_dfs_fops);
+	/* add to dfsentry list */
+	list_add(&dfse->list, &sdev->dfsentry_list);
 
 	return 0;
 }
@@ -426,10 +417,6 @@ int snd_sof_dbg_init(struct snd_sof_dev *sdev)
 
 	/* use "sof" as top level debugFS dir */
 	sdev->debugfs_root = debugfs_create_dir("sof", NULL);
-	if (IS_ERR_OR_NULL(sdev->debugfs_root)) {
-		dev_err(sdev->dev, "error: failed to create debugfs directory\n");
-		return 0;
-	}
 
 	/* init dfsentry list */
 	INIT_LIST_HEAD(&sdev->dfsentry_list);
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index b8c0b2a22684..79b6709d1874 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -228,7 +228,6 @@ enum sof_debugfs_access_type {
 
 /* FS entry for debug files that can expose DSP memories, registers */
 struct snd_sof_dfsentry {
-	struct dentry *dfsentry;
 	size_t size;
 	enum sof_dfsentry_type type;
 	/*
diff --git a/sound/soc/sof/trace.c b/sound/soc/sof/trace.c
index befed975161c..4c3cff031fd6 100644
--- a/sound/soc/sof/trace.c
+++ b/sound/soc/sof/trace.c
@@ -148,13 +148,8 @@ static int trace_debugfs_create(struct snd_sof_dev *sdev)
 	dfse->size = sdev->dmatb.bytes;
 	dfse->sdev = sdev;
 
-	dfse->dfsentry = debugfs_create_file("trace", 0444, sdev->debugfs_root,
-					     dfse, &sof_dfs_trace_fops);
-	if (!dfse->dfsentry) {
-		/* can't rely on debugfs, only log error and keep going */
-		dev_err(sdev->dev,
-			"error: cannot create debugfs entry for trace\n");
-	}
+	debugfs_create_file("trace", 0444, sdev->debugfs_root, dfse,
+			    &sof_dfs_trace_fops);
 
 	return 0;
 }
-- 
2.22.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
