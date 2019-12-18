Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC27125307
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 21:18:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B78E585D;
	Wed, 18 Dec 2019 21:17:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B78E585D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576700286;
	bh=4jIB+6uONmml9wW3sRLCngTfwEUwiDK0alItRnzZ/+M=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Jpzg17YSEXocIz/6ObpM5eJgENM46TZ7JXSsOO2d7CYmu5uSBv5++u5SD2TISZOsO
	 Gu4KIExrtYnqUZS/R6sEwhh6U+kMD496oxyWG+X4IO+JArA3069YrweajdUVPmAFQ+
	 vH5fVzinJDbP9zrMmbVZCWxSt17AvddacA6DBqz4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59D91F8034A;
	Wed, 18 Dec 2019 21:06:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6644F8033D; Wed, 18 Dec 2019 21:06:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id DD0DCF80323
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 21:06:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD0DCF80323
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1773D1FB;
 Wed, 18 Dec 2019 12:06:08 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 68D363F67D;
 Wed, 18 Dec 2019 12:06:07 -0800 (PST)
Date: Wed, 18 Dec 2019 20:06:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
In-Reply-To: <20191218002616.7652-2-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20191218002616.7652-2-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Curtis Malainey <cujomalainey@chromium.org>,
 Daniel Baluta <daniel.baluta@nxp.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Introduce state machine for FW
	boot" to the asoc tree
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

   ASoC: SOF: Introduce state machine for FW boot

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

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

From 6ca5cecbd1c1758666ab79446f19e0e61ed11444 Mon Sep 17 00:00:00 2001
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Date: Tue, 17 Dec 2019 18:26:09 -0600
Subject: [PATCH] ASoC: SOF: Introduce state machine for FW boot

Add a state machine for FW boot to track the
different stages of FW boot and replace the boot_complete
field with fw_state field in struct snd_sof_dev.
This will be used to determine the actions to be performed
during system suspend.

One of the main motivations for adding this change is the
fact that errors during the top-level SOF device probe cannot
be propagated and therefore suspending the SOF device normally
during system suspend could potentially run into errors.
For example, with the current flow, if the FW boot failed
for some reason and the system suspends, the SOF device
suspend could fail because the CTX_SAVE IPC would be attempted
even though the FW never really booted successfully causing it
to time out. Another scenario that the state machine fixes
is when the runtime suspend for the SOF device fails and
the DSP is powered down nevertheless, the CTX_SAVE IPC during
system suspend would timeout because the DSP is already
powered down.

Reviewed-by: Curtis Malainey <cujomalainey@chromium.org>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191218002616.7652-2-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/core.c             | 50 +++++++++++++++++++++++++++++++-
 sound/soc/sof/intel/hda-loader.c |  1 -
 sound/soc/sof/intel/hda.c        |  4 +--
 sound/soc/sof/ipc.c              | 17 ++++-------
 sound/soc/sof/loader.c           | 19 ++++++++----
 sound/soc/sof/pm.c               | 21 +++++++++++++-
 sound/soc/sof/sof-priv.h         | 11 ++++++-
 7 files changed, 99 insertions(+), 24 deletions(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index e258f6a8e7a5..44f9c04d54aa 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -92,6 +92,46 @@ void snd_sof_get_status(struct snd_sof_dev *sdev, u32 panic_code,
 }
 EXPORT_SYMBOL(snd_sof_get_status);
 
+/*
+ *			FW Boot State Transition Diagram
+ *
+ *    +-----------------------------------------------------------------------+
+ *    |									      |
+ * ------------------	     ------------------				      |
+ * |		    |	     |		      |				      |
+ * |   BOOT_FAILED  |	     |  READY_FAILED  |-------------------------+     |
+ * |		    |	     |	              |				|     |
+ * ------------------	     ------------------				|     |
+ *	^			    ^					|     |
+ *	|			    |					|     |
+ * (FW Boot Timeout)		(FW_READY FAIL)				|     |
+ *	|			    |					|     |
+ *	|			    |					|     |
+ * ------------------		    |		   ------------------	|     |
+ * |		    |		    |		   |		    |	|     |
+ * |   IN_PROGRESS  |---------------+------------->|    COMPLETE    |	|     |
+ * |		    | (FW Boot OK)   (FW_READY OK) |		    |	|     |
+ * ------------------				   ------------------	|     |
+ *	^						|		|     |
+ *	|						|		|     |
+ * (FW Loading OK)			       (System Suspend/Runtime Suspend)
+ *	|						|		|     |
+ *	|						|		|     |
+ * ------------------		------------------	|		|     |
+ * |		    |		|		 |<-----+		|     |
+ * |   PREPARE	    |		|   NOT_STARTED  |<---------------------+     |
+ * |		    |		|		 |<---------------------------+
+ * ------------------		------------------
+ *    |	    ^			    |	   ^
+ *    |	    |			    |	   |
+ *    |	    +-----------------------+	   |
+ *    |		(DSP Probe OK)		   |
+ *    |					   |
+ *    |					   |
+ *    +------------------------------------+
+ *	(System Suspend/Runtime Suspend)
+ */
+
 static int sof_probe_continue(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_pdata *plat_data = sdev->pdata;
@@ -104,6 +144,8 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
 		return ret;
 	}
 
+	sdev->fw_state = SOF_FW_BOOT_PREPARE;
+
 	/* check machine info */
 	ret = sof_machine_check(sdev);
 	if (ret < 0) {
@@ -143,7 +185,12 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
 		goto fw_load_err;
 	}
 
-	/* boot the firmware */
+	sdev->fw_state = SOF_FW_BOOT_IN_PROGRESS;
+
+	/*
+	 * Boot the firmware. The FW boot status will be modified
+	 * in snd_sof_run_firmware() depending on the outcome.
+	 */
 	ret = snd_sof_run_firmware(sdev);
 	if (ret < 0) {
 		dev_err(sdev->dev, "error: failed to boot DSP firmware %d\n",
@@ -254,6 +301,7 @@ int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data)
 
 	sdev->pdata = plat_data;
 	sdev->first_boot = true;
+	sdev->fw_state = SOF_FW_BOOT_NOT_STARTED;
 	dev_set_drvdata(dev, sdev);
 
 	/* check all mandatory ops */
diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index b1783360fe10..1782f5092639 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -295,7 +295,6 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 
 	/* init for booting wait */
 	init_waitqueue_head(&sdev->boot_wait);
-	sdev->boot_complete = false;
 
 	/* prepare DMA for code loader stream */
 	tag = cl_stream_prepare(sdev, 0x40, stripped_firmware.size,
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 8d27846d9048..3335e0076180 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -168,7 +168,7 @@ void hda_dsp_dump_skl(struct snd_sof_dev *sdev, u32 flags)
 	panic = snd_sof_dsp_read(sdev, HDA_DSP_BAR,
 				 HDA_ADSP_ERROR_CODE_SKL + 0x4);
 
-	if (sdev->boot_complete) {
+	if (sdev->fw_state == SOF_FW_BOOT_COMPLETE) {
 		hda_dsp_get_registers(sdev, &xoops, &panic_info, stack,
 				      HDA_DSP_STACK_DUMP_SIZE);
 		snd_sof_get_status(sdev, status, panic, &xoops, &panic_info,
@@ -195,7 +195,7 @@ void hda_dsp_dump(struct snd_sof_dev *sdev, u32 flags)
 				  HDA_DSP_SRAM_REG_FW_STATUS);
 	panic = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_SRAM_REG_FW_TRACEP);
 
-	if (sdev->boot_complete) {
+	if (sdev->fw_state == SOF_FW_BOOT_COMPLETE) {
 		hda_dsp_get_registers(sdev, &xoops, &panic_info, stack,
 				      HDA_DSP_STACK_DUMP_SIZE);
 		snd_sof_get_status(sdev, status, panic, &xoops, &panic_info,
diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 293c5ae8e882..6186c7ff0447 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -347,19 +347,12 @@ void snd_sof_ipc_msgs_rx(struct snd_sof_dev *sdev)
 		break;
 	case SOF_IPC_FW_READY:
 		/* check for FW boot completion */
-		if (!sdev->boot_complete) {
+		if (sdev->fw_state == SOF_FW_BOOT_IN_PROGRESS) {
 			err = sof_ops(sdev)->fw_ready(sdev, cmd);
-			if (err < 0) {
-				/*
-				 * this indicates a mismatch in ABI
-				 * between the driver and fw
-				 */
-				dev_err(sdev->dev, "error: ABI mismatch %d\n",
-					err);
-			} else {
-				/* firmware boot completed OK */
-				sdev->boot_complete = true;
-			}
+			if (err < 0)
+				sdev->fw_state = SOF_FW_BOOT_READY_FAILED;
+			else
+				sdev->fw_state = SOF_FW_BOOT_COMPLETE;
 
 			/* wake up firmware loader */
 			wake_up(&sdev->boot_wait);
diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index 432d12bd4937..31847aa3975d 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -512,7 +512,6 @@ int snd_sof_run_firmware(struct snd_sof_dev *sdev)
 	int init_core_mask;
 
 	init_waitqueue_head(&sdev->boot_wait);
-	sdev->boot_complete = false;
 
 	/* create read-only fw_version debugfs to store boot version info */
 	if (sdev->first_boot) {
@@ -544,19 +543,27 @@ int snd_sof_run_firmware(struct snd_sof_dev *sdev)
 
 	init_core_mask = ret;
 
-	/* now wait for the DSP to boot */
-	ret = wait_event_timeout(sdev->boot_wait, sdev->boot_complete,
+	/*
+	 * now wait for the DSP to boot. There are 3 possible outcomes:
+	 * 1. Boot wait times out indicating FW boot failure.
+	 * 2. FW boots successfully and fw_ready op succeeds.
+	 * 3. FW boots but fw_ready op fails.
+	 */
+	ret = wait_event_timeout(sdev->boot_wait,
+				 sdev->fw_state > SOF_FW_BOOT_IN_PROGRESS,
 				 msecs_to_jiffies(sdev->boot_timeout));
 	if (ret == 0) {
 		dev_err(sdev->dev, "error: firmware boot failure\n");
 		snd_sof_dsp_dbg_dump(sdev, SOF_DBG_REGS | SOF_DBG_MBOX |
 			SOF_DBG_TEXT | SOF_DBG_PCI);
-		/* after this point FW_READY msg should be ignored */
-		sdev->boot_complete = true;
+		sdev->fw_state = SOF_FW_BOOT_FAILED;
 		return -EIO;
 	}
 
-	dev_info(sdev->dev, "firmware boot complete\n");
+	if (sdev->fw_state == SOF_FW_BOOT_COMPLETE)
+		dev_info(sdev->dev, "firmware boot complete\n");
+	else
+		return -EIO; /* FW boots but fw_ready op failed */
 
 	/* perform post fw run operations */
 	ret = snd_sof_dsp_post_fw_run(sdev);
diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index d1a7b98886d1..84290bbeebdd 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -70,6 +70,8 @@ static int sof_resume(struct device *dev, bool runtime_resume)
 		return ret;
 	}
 
+	sdev->fw_state = SOF_FW_BOOT_PREPARE;
+
 	/* load the firmware */
 	ret = snd_sof_load_firmware(sdev);
 	if (ret < 0) {
@@ -79,7 +81,12 @@ static int sof_resume(struct device *dev, bool runtime_resume)
 		return ret;
 	}
 
-	/* boot the firmware */
+	sdev->fw_state = SOF_FW_BOOT_IN_PROGRESS;
+
+	/*
+	 * Boot the firmware. The FW boot status will be modified
+	 * in snd_sof_run_firmware() depending on the outcome.
+	 */
 	ret = snd_sof_run_firmware(sdev);
 	if (ret < 0) {
 		dev_err(sdev->dev,
@@ -128,6 +135,9 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 	if (!sof_ops(sdev)->suspend)
 		return 0;
 
+	if (sdev->fw_state != SOF_FW_BOOT_COMPLETE)
+		goto power_down;
+
 	/* release trace */
 	snd_sof_release_trace(sdev);
 
@@ -165,6 +175,12 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 			 ret);
 	}
 
+power_down:
+
+	/* return if the DSP was not probed successfully */
+	if (sdev->fw_state == SOF_FW_BOOT_NOT_STARTED)
+		return 0;
+
 	/* power down all DSP cores */
 	if (runtime_suspend)
 		ret = snd_sof_dsp_runtime_suspend(sdev);
@@ -175,6 +191,9 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 			"error: failed to power down DSP during suspend %d\n",
 			ret);
 
+	/* reset FW state */
+	sdev->fw_state = SOF_FW_BOOT_NOT_STARTED;
+
 	return ret;
 }
 
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 54dd6d4b4c12..220b35141c34 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -298,6 +298,15 @@ struct snd_sof_ipc_msg {
 	bool ipc_complete;
 };
 
+enum snd_sof_fw_state {
+	SOF_FW_BOOT_NOT_STARTED = 0,
+	SOF_FW_BOOT_PREPARE,
+	SOF_FW_BOOT_IN_PROGRESS,
+	SOF_FW_BOOT_FAILED,
+	SOF_FW_BOOT_READY_FAILED, /* firmware booted but fw_ready op failed */
+	SOF_FW_BOOT_COMPLETE,
+};
+
 /*
  * SOF Device Level.
  */
@@ -319,7 +328,7 @@ struct snd_sof_dev {
 
 	/* DSP firmware boot */
 	wait_queue_head_t boot_wait;
-	u32 boot_complete;
+	enum snd_sof_fw_state fw_state;
 	u32 first_boot;
 
 	/* work queue in case the probe is implemented in two steps */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
