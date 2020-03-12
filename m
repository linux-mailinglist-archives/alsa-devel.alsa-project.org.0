Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9149183A66
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Mar 2020 21:11:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66C521752;
	Thu, 12 Mar 2020 21:11:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66C521752
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584043912;
	bh=F+xa4KByaZrTZJ0qMDFkb4yzQ2y2pSkNmvOMF3oiX4c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qy8AJVJwxxTM/6T/DqkK9XG+dC9iY3T8OSGwa1EjdnY5CWPBk/TV1XPtBueiORL8f
	 8DtgUhP+JNex+CdPGv//sR7Xi1qB/JIly1hUBIK8mWtLtZqGvqWONIQfqJTJoIOyVq
	 pL9RJOvhn1qYtRkT6i6b3E+jTM9hJINQOicmjXOQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33DCDF802C2;
	Thu, 12 Mar 2020 21:06:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 791F2F8028C; Thu, 12 Mar 2020 21:06:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17EF6F8023F
 for <alsa-devel@alsa-project.org>; Thu, 12 Mar 2020 21:06:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17EF6F8023F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Mar 2020 13:06:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,545,1574150400"; d="scan'208";a="444063070"
Received: from unknown (HELO pbossart-mobl3.amr.corp.intel.com)
 ([10.251.241.169])
 by fmsmga006.fm.intel.com with ESMTP; 12 Mar 2020 13:06:36 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/6] ASoC: SOF: Intel: remove unnecessary waitq before loading
 firmware
Date: Thu, 12 Mar 2020 15:06:21 -0500
Message-Id: <20200312200622.24477-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312200622.24477-1-pierre-louis.bossart@linux.intel.com>
References: <20200312200622.24477-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Keyon Jie <yang.jie@linux.intel.com>,
 Pierre Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Amery Song <chao.song@intel.com>
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

From: Amery Song <chao.song@intel.com>

The HDA_DSP_IPC_PURGE_FW IPC from ROM is already handled in
cl_dsp_init(), and it will never be received in the IRQ thread,
so the wait condition on this IPC will never be satisfied. The
wait before loading firmware is redundant and can be removed safely.

Signed-off-by: Amery Song <chao.song@intel.com>
Reviewed-by: Keyon Jie <yang.jie@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

