Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6437DC76
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2019 15:23:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC7D816AC;
	Thu,  1 Aug 2019 15:23:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC7D816AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564665832;
	bh=V8hxF9cDdKz7G5nykvj+0K9SqwBWaV8FDPyJKNS6HBg=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=uQTJb+h8zFsf7PH97vMUF7vgcp/y3ajL62aTAR0w4a4QgppSVW/zFSM/79AWg10Sw
	 +buB3tGxuxZWBCYMr0SZMe89de8jDb5N8mDiXnzXT64QY11yHjXrLbPVqvcdd7hQVY
	 LBXt7YAFtY99FHzjzocj6ay3NE1zFBtAzjR06llI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58416F80519;
	Thu,  1 Aug 2019 15:22:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6240FF804CC; Thu,  1 Aug 2019 15:20:54 +0200 (CEST)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 227A1F804FD
 for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2019 15:10:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 227A1F804FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="mxq8KTw4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=3Y1PSNe5WA/A7Imne+0J5CrQXjZMJXjUC58p+OnEpUQ=; b=mxq8KTw4UpF9
 usuWDYw5xLrigbTXwPztP7hFfbOrBtCoSo97o2x8A44d9LX7eqiuKK+XUBgd9t+7KAl5VKpIxf2gA
 9BMu0ZEvIncojBKhXS0OoKvh7sqWaHWvzHi5cjfyWtOow4ME0K93bA3OVQkHM0XKv8h0WYsKfd8J7
 CO3aI=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1htAqu-0004in-BN; Thu, 01 Aug 2019 13:10:40 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 724622742CFC; Thu,  1 Aug 2019 14:10:39 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
In-Reply-To: <20190731131716.9764-3-gregkh@linuxfoundation.org>
X-Patchwork-Hint: ignore
Message-Id: <20190801131039.724622742CFC@ypsilon.sirena.org.uk>
Date: Thu,  1 Aug 2019 14:10:39 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: no need to check return value of
	debugfs_create functions" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: SOF: no need to check return value of debugfs_create functions

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 3ff3a4f657b3fab2d56247983c2ebed180ef2fbb Mon Sep 17 00:00:00 2001
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed, 31 Jul 2019 15:17:16 +0200
Subject: [PATCH] ASoC: SOF: no need to check return value of debugfs_create
 functions

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
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Link: https://lore.kernel.org/r/20190731131716.9764-3-gregkh@linuxfoundation.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
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
index 983eadef4b30..1cec3f23f9cd 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -230,7 +230,6 @@ enum sof_debugfs_access_type {
 
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
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
