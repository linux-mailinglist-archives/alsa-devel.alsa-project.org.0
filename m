Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EF2184C75
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Mar 2020 17:27:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D9601827;
	Fri, 13 Mar 2020 17:26:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D9601827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584116835;
	bh=W4lJkzslL3uitk/6I4we1LNi5Evcsn95o2kXswNNpqE=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=GL1cOe2TMiaQ1nz2ggCLCwwwhjxsGQuleh1pR8vOl0F5a9JfwsBSOVGcQSehwXzTm
	 C+zGxh484BIWw+NTkpsa7LS52wzlkOwhEfm3paCVzfWv0CiaaKsZ5hPzpT4QGO8tRZ
	 NBjLvUfGYROopaPraNeAw4Jc0pjlvvMjDZ2srv/E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CB62F80332;
	Fri, 13 Mar 2020 17:19:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 862BBF802FF; Fri, 13 Mar 2020 17:18:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 32CFCF802F8
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 17:18:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32CFCF802F8
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55D56FEC;
 Fri, 13 Mar 2020 09:18:15 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD1213F6CF;
 Fri, 13 Mar 2020 09:18:14 -0700 (PDT)
Date: Fri, 13 Mar 2020 16:18:13 +0000
From: Mark Brown <broonie@kernel.org>
To: Amery Song <chao.song@intel.com>
Subject: Applied "ASoC: SOF: Intel: remove unnecessary waitq before loading
 firmware" to the asoc tree
In-Reply-To: <20200312200622.24477-6-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200312200622.24477-6-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 tiwai@suse.de, Keyon Jie <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: SOF: Intel: remove unnecessary waitq before loading firmware

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From 828c2f7871d8f8051c7f412c74115ef2c583b1ce Mon Sep 17 00:00:00 2001
From: Amery Song <chao.song@intel.com>
Date: Thu, 12 Mar 2020 15:06:21 -0500
Subject: [PATCH] ASoC: SOF: Intel: remove unnecessary waitq before loading
 firmware

The HDA_DSP_IPC_PURGE_FW IPC from ROM is already handled in
cl_dsp_init(), and it will never be received in the IRQ thread,
so the wait condition on this IPC will never be satisfied. The
wait before loading firmware is redundant and can be removed safely.

Signed-off-by: Amery Song <chao.song@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Keyon Jie <yang.jie@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Link: https://lore.kernel.org/r/20200312200622.24477-6-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/cnl.c        | 5 -----
 sound/soc/sof/intel/hda-ipc.c    | 6 ------
 sound/soc/sof/intel/hda-loader.c | 3 ---
 sound/soc/sof/intel/hda.c        | 3 ---
 sound/soc/sof/intel/hda.h        | 1 -
 sound/soc/sof/loader.c           | 3 ---
 sound/soc/sof/sof-priv.h         | 4 ----
 7 files changed, 25 deletions(-)

diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 05125cb0be6e..e427d00eca71 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -65,11 +65,6 @@ static irqreturn_t cnl_ipc_irq_thread(int irq, void *context)
 		hda_dsp_ipc_get_reply(sdev);
 		snd_sof_ipc_reply(sdev, msg);
 
-		if (sdev->code_loading)	{
-			sdev->code_loading = 0;
-			wake_up(&sdev->waitq);
-		}
-
 		cnl_ipc_dsp_done(sdev);
 
 		spin_unlock_irq(&sdev->ipc_lock);
diff --git a/sound/soc/sof/intel/hda-ipc.c b/sound/soc/sof/intel/hda-ipc.c
index a60528495551..6062bb6011fb 100644
--- a/sound/soc/sof/intel/hda-ipc.c
+++ b/sound/soc/sof/intel/hda-ipc.c
@@ -174,12 +174,6 @@ irqreturn_t hda_dsp_ipc_irq_thread(int irq, void *context)
 		hda_dsp_ipc_get_reply(sdev);
 		snd_sof_ipc_reply(sdev, msg);
 
-		/* wake up sleeper if we are loading code */
-		if (sdev->code_loading)	{
-			sdev->code_loading = 0;
-			wake_up(&sdev->waitq);
-		}
-
 		/* set the done bit */
 		hda_dsp_ipc_dsp_done(sdev);
 
diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 03b05d7f66da..0633b76dab49 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -179,9 +179,6 @@ static int cl_trigger(struct snd_sof_dev *sdev,
 	/* code loader is special case that reuses stream ops */
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
-		wait_event_timeout(sdev->waitq, !sdev->code_loading,
-				   HDA_DSP_CL_TRIGGER_TIMEOUT);
-
 		snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, SOF_HDA_INTCTL,
 					1 << hstream->index,
 					1 << hstream->index);
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 7ca887041a34..b2681245daaf 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -585,9 +585,6 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 	hda_dsp_ctrl_ppcap_enable(sdev, true);
 	hda_dsp_ctrl_ppcap_int_enable(sdev, true);
 
-	/* initialize waitq for code loading */
-	init_waitqueue_head(&sdev->waitq);
-
 	/* set default mailbox offset for FW ready message */
 	sdev->dsp_box.offset = HDA_DSP_MBOX_UPLINK_OFFSET;
 
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 537c0a930a15..2a57fc9f3e58 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -175,7 +175,6 @@
  * value cannot be read back within the specified time.
  */
 #define HDA_DSP_STREAM_RUN_TIMEOUT		300
-#define HDA_DSP_CL_TRIGGER_TIMEOUT		300
 
 #define HDA_DSP_SPIB_ENABLE			1
 #define HDA_DSP_SPIB_DISABLE			0
diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index 67fc95ace42b..1f2e0be812bd 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -466,9 +466,6 @@ int snd_sof_load_firmware_raw(struct snd_sof_dev *sdev)
 	const char *fw_filename;
 	int ret;
 
-	/* set code loading condition to true */
-	sdev->code_loading = 1;
-
 	/* Don't request firmware again if firmware is already requested */
 	if (plat_data->fw)
 		return 0;
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 38dce54755a6..a4b297c842df 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -421,10 +421,6 @@ struct snd_sof_dev {
 	int ipc_timeout;
 	int boot_timeout;
 
-	/* Wait queue for code loading */
-	wait_queue_head_t waitq;
-	int code_loading;
-
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_PROBES)
 	unsigned int extractor_stream_tag;
 #endif
-- 
2.20.1

