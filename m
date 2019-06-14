Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D1C45A17
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jun 2019 12:11:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 994FB187A;
	Fri, 14 Jun 2019 12:10:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 994FB187A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560507107;
	bh=BJC1kZT4cosJMYKeflYaw3v60CsLY1pHWLBBIU+6Ih0=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FySMOjMpYGMk9MCjddKPfQiiAOuMH5jQfYe7qRNQKS9cc3s1iFIjFF8376S5uryVq
	 R9Z8F2nSy3+KPwAhcUuqXlj2MMMZcMUxChMd3ii/9aECt43rmYfi6VT2d11pGObiwQ
	 4ZYMvr56YI3tSqmuK6q48zFfzpYv4p+jogmNlnGw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A73A4F8973D;
	Fri, 14 Jun 2019 12:07:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC960F89717; Fri, 14 Jun 2019 12:07:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C67C3F896E0
 for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2019 12:07:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C67C3F896E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="p19G8Dr0"
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9405E2084E;
 Fri, 14 Jun 2019 09:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560505686;
 bh=+JuO7rbGtBItUPYUXdkrV0s6EZC0A2MF9+RHJLfZ6VM=;
 h=From:To:Cc:Subject:Date:From;
 b=p19G8Dr0ruWHXXYYLSszwrguRDp2xp3kE4beZ8ZfdO1zcGaSdDtUwpjjWH8AzVm2Y
 dNWvLPxX+IRkdajv7fetqUMGGEm9VnkDJ1t5XaoUJnP0yu1/j5PORWaNpm/5duRVGA
 Yc3RE/CJdakTe5RV+UpslBOWGPrinFOvd/uBcawg=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Date: Fri, 14 Jun 2019 11:47:52 +0200
Message-Id: <20190614094756.2965-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [alsa-devel] [PATCH 1/5] sound: SoC: sof: no need to check return
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

Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 sound/soc/sof/debug.c    | 32 ++++++++++----------------------
 sound/soc/sof/sof-priv.h |  1 -
 sound/soc/sof/trace.c    |  9 ++-------
 3 files changed, 12 insertions(+), 30 deletions(-)

diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index 55f1d808dba0..429daa0dc9bf 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -77,8 +77,7 @@ static ssize_t sof_dfsentry_read(struct file *file, char __user *buffer,
 		if (!pm_runtime_active(sdev->dev) &&
 		    dfse->access_type == SOF_DEBUGFS_ACCESS_D0_ONLY) {
 			dev_err(sdev->dev,
-				"error: debugfs entry %s cannot be read in DSP D3\n",
-				dfse->dfsentry->d_name.name);
+				"error: debugfs entry cannot be read in DSP D3\n");
 			kfree(buf);
 			return -EINVAL;
 		}
@@ -142,17 +141,11 @@ int snd_sof_debugfs_io_item(struct snd_sof_dev *sdev,
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
@@ -177,16 +170,11 @@ int snd_sof_debugfs_buf_item(struct snd_sof_dev *sdev,
 	dfse->size = size;
 	dfse->sdev = sdev;
 
-	dfse->dfsentry = debugfs_create_file(name, 0444, sdev->debugfs_root,
-					     dfse, &sof_dfs_fops);
-	if (!dfse->dfsentry) {
-		/* can't rely on debugfs, only log error and keep going */
-		dev_err(sdev->dev, "error: cannot create debugfs entry %s\n",
-			name);
-	} else {
-		/* add to dfsentry list */
-		list_add(&dfse->list, &sdev->dfsentry_list);
-	}
+	debugfs_create_file(name, 0444, sdev->debugfs_root, dfse,
+			    &sof_dfs_fops);
+
+	/* add to dfsentry list */
+	list_add(&dfse->list, &sdev->dfsentry_list);
 
 	return 0;
 }
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 1e85d6f9c5c3..d0f7cc3ddcbf 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -217,7 +217,6 @@ enum sof_debugfs_access_type {
 
 /* FS entry for debug files that can expose DSP memories, registers */
 struct snd_sof_dfsentry {
-	struct dentry *dfsentry;
 	size_t size;
 	enum sof_dfsentry_type type;
 	/*
diff --git a/sound/soc/sof/trace.c b/sound/soc/sof/trace.c
index d588e4b70fad..2986d9a563b0 100644
--- a/sound/soc/sof/trace.c
+++ b/sound/soc/sof/trace.c
@@ -119,13 +119,8 @@ static int trace_debugfs_create(struct snd_sof_dev *sdev)
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
