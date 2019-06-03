Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0153334E7
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 18:26:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 612C41696;
	Mon,  3 Jun 2019 18:25:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 612C41696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559579170;
	bh=dfCtgiwta/buHhlrqDhOL1ymsg4OfhucD3lm0KbZxLE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DO0cJJpxsf4wxuMgFGbYZdKJR5neQJMBcutjjbi9187BDCVcZ90JMDmYwmvoIs8gc
	 E7k2xS/r8U5AL0ZBz3LjocrGDfOg2Jl0wZVNXOsP7/7cirTPCKGpCHLxhHGyWHzMBa
	 u/Lr5oyi+lbThmvzHtRflfJ3Nu2ubQF9oZHGMWlU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AA93F89756;
	Mon,  3 Jun 2019 18:18:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A92F0F80CC4; Mon,  3 Jun 2019 18:18:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 721D6F8971F
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 18:18:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 721D6F8971F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jun 2019 09:18:31 -0700
X-ExtLoop1: 1
Received: from chiannaa-mobl6.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.97.98])
 by orsmga008.jf.intel.com with ESMTP; 03 Jun 2019 09:18:30 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon,  3 Jun 2019 11:18:18 -0500
Message-Id: <20190603161821.7486-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190603161821.7486-1-pierre-louis.bossart@linux.intel.com>
References: <20190603161821.7486-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 6/9] ASoC: SOF: add mode parameter for
	snd_sof_debugfs_buf_item
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Add mode parameter for snd_sof_debugfs_buf_item() to specify
the mode while creating debugfs entries.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/debug.c    | 4 ++--
 sound/soc/sof/loader.c   | 4 ++--
 sound/soc/sof/sof-priv.h | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index 55f1d808dba0..219c3becf670 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -161,7 +161,7 @@ EXPORT_SYMBOL_GPL(snd_sof_debugfs_io_item);
 /* create FS entry for debug files to expose kernel memory */
 int snd_sof_debugfs_buf_item(struct snd_sof_dev *sdev,
 			     void *base, size_t size,
-			     const char *name)
+			     const char *name, mode_t mode)
 {
 	struct snd_sof_dfsentry *dfse;
 
@@ -177,7 +177,7 @@ int snd_sof_debugfs_buf_item(struct snd_sof_dev *sdev,
 	dfse->size = size;
 	dfse->sdev = sdev;
 
-	dfse->dfsentry = debugfs_create_file(name, 0444, sdev->debugfs_root,
+	dfse->dfsentry = debugfs_create_file(name, mode, sdev->debugfs_root,
 					     dfse, &sof_dfs_fops);
 	if (!dfse->dfsentry) {
 		/* can't rely on debugfs, only log error and keep going */
diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index 16b016b76fd8..952a19091c58 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -335,11 +335,11 @@ int snd_sof_run_firmware(struct snd_sof_dev *sdev)
 	init_waitqueue_head(&sdev->boot_wait);
 	sdev->boot_complete = false;
 
-	/* create fw_version debugfs to store boot version info */
+	/* create read-only fw_version debugfs to store boot version info */
 	if (sdev->first_boot) {
 		ret = snd_sof_debugfs_buf_item(sdev, &sdev->fw_version,
 					       sizeof(sdev->fw_version),
-					       "fw_version");
+					       "fw_version", 0444);
 		/* errors are only due to memory allocation, not debugfs */
 		if (ret < 0) {
 			dev_err(sdev->dev, "error: snd_sof_debugfs_buf_item failed\n");
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 03d852293d27..14faf3c4550e 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -547,7 +547,7 @@ int snd_sof_debugfs_io_item(struct snd_sof_dev *sdev,
 			    enum sof_debugfs_access_type access_type);
 int snd_sof_debugfs_buf_item(struct snd_sof_dev *sdev,
 			     void *base, size_t size,
-			     const char *name);
+			     const char *name, mode_t mode);
 int snd_sof_trace_update_pos(struct snd_sof_dev *sdev,
 			     struct sof_ipc_dma_trace_posn *posn);
 void snd_sof_trace_notify_for_error(struct snd_sof_dev *sdev);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
