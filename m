Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9839533796
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 20:11:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D6021688;
	Mon,  3 Jun 2019 20:10:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D6021688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559585508;
	bh=O3yaKwvEP1NonTATQxUQlOjJEnp85B6jW3RStQ5NsPM=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=RB2UXIMpl6zP5nR7l1ZhYuC9BUhJZUwJ+vdeYqvlddcLbJucvPW9sVd1+l/3SGN8G
	 VTTTDzoSPf9idB67Tj6ry+RL31VUpAvuyppuxu149u/MXvp23lYS2DgZvuqKPduXpm
	 66+EzMdGTcM0RmHne6VgtDDIcKR3EEkeUtvaIW5Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06466F89777;
	Mon,  3 Jun 2019 20:02:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91A87F89748; Mon,  3 Jun 2019 20:02:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89A8DF89735
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 20:02:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89A8DF89735
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="UJ6uTVVJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=8yQRWlh3Xl1FFPk6l7h4e1Dq3jngM9rY6tuJFJmjdzU=; b=UJ6uTVVJvzQQ
 HDYQHmSlLwfnOjRSbfI8DC2T9uGQPKGXXCJ/JX2s+bIy1C4kc4MUDGBe7Aj6d/mG5bu1fOEhi9JJh
 Rv2awVMGndTMX6Ta0dmwKdcJTXKsfAWOBBdwCL3wUebKfJrn8wuDoxYkC181j+hPcVkbUkWU8MdfF
 7DYI8=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hXrHV-0003Z3-KW; Mon, 03 Jun 2019 18:02:01 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id D90AB440049; Mon,  3 Jun 2019 19:02:00 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
In-Reply-To: <20190603161821.7486-7-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190603180200.D90AB440049@finisterre.sirena.org.uk>
Date: Mon,  3 Jun 2019 19:02:00 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: add mode parameter for
	snd_sof_debugfs_buf_item" to the asoc tree
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

   ASoC: SOF: add mode parameter for snd_sof_debugfs_buf_item

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From 5c9714f637365a84e05f0532cd9ae00c65b70dc1 Mon Sep 17 00:00:00 2001
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Date: Mon, 3 Jun 2019 11:18:18 -0500
Subject: [PATCH] ASoC: SOF: add mode parameter for snd_sof_debugfs_buf_item

Add mode parameter for snd_sof_debugfs_buf_item() to specify
the mode while creating debugfs entries.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
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
index 01a6219c326b..ce22240cd93a 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -546,7 +546,7 @@ int snd_sof_debugfs_io_item(struct snd_sof_dev *sdev,
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
