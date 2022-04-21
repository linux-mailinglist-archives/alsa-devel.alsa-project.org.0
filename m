Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A38A50AA03
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 22:34:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13D6716CC;
	Thu, 21 Apr 2022 22:34:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13D6716CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650573290;
	bh=hfeTTXYzka8o+ST9SNTz3ATDmXhEHOA7ZXGlKn5D1NQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=givz4AWq6KtvzCv+VEwwqtIoC4hbkf4MJDLe5c1wCLK1t2Tip3Pa8hDc6egY0+SoP
	 AO9C2e9lJD6CIPqpszZTPA8zFslqIk71QvPPMMwYFBiHHLetMTbWr4dHEp6+pV59zc
	 wRhDC3av65RNPiGnm4lB7e2Kxy17bQBaJsieYh6c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC70EF8053A;
	Thu, 21 Apr 2022 22:32:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F08E4F80535; Thu, 21 Apr 2022 22:32:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_65,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6ECC9F804FB
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 22:32:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6ECC9F804FB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="hZ0xVGVG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650573162; x=1682109162;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hfeTTXYzka8o+ST9SNTz3ATDmXhEHOA7ZXGlKn5D1NQ=;
 b=hZ0xVGVGlZYU82qsxPuNVMKVNVA8l7i7RcBRSXi6ZDQ64u4Q29cL9VkD
 KcHv4omb/Wy3f8HCTT3igsJD5ip/5RtLXcApQqSaIo5/m4S4nWHtufnHe
 izu7G9g1kVGjGH9I0KQPlR3+ck2YPRlyOq+YxnCpjMueJrAL/S1bRtJ0j
 1P9czox0Wn3TbbSzHGY6bwsXSHf3waUAcOgZwaPs1HUdUJfoloQKFAu/y
 4RwUuoIWWdpQFhE+RMVOKlxmss3nf09KkBWL2BPlYG/PD+PMAFFn0xBAD
 OLKT3SGI4GHgXR9p5Lj929ziICcxnoA+Z8d+lfPB90YBrWMfzdt55HHBE w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="245047599"
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="245047599"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 13:32:12 -0700
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="577455757"
Received: from qingsu-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.148.250])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 13:32:11 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 02/14] ASoC: SOF: Intel: Add IPC-specific dai ops for IPC3
Date: Thu, 21 Apr 2022 15:31:49 -0500
Message-Id: <20220421203201.1550328-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220421203201.1550328-1-pierre-louis.bossart@linux.intel.com>
References: <20220421203201.1550328-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

The BE DAI driver ops involve operations that are IPC-specific. For ex:
for the HDA DAI, the trigger op involves sending the DAI_CONFIG IPC to
the DSP to stop the DMA for the stop/pause commands. This sequence is
different for IPC3 and IPC4. So, make the dai driver ops IPC-specific
and set the IPC3-specific ops during the ops_init() callback.

Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/apl.c     |  3 ++
 sound/soc/sof/intel/cnl.c     |  3 ++
 sound/soc/sof/intel/hda-dai.c | 53 +++++++++++++++++++++--------------
 sound/soc/sof/intel/hda.h     |  2 ++
 sound/soc/sof/intel/icl.c     |  3 ++
 sound/soc/sof/intel/tgl.c     |  3 ++
 6 files changed, 46 insertions(+), 21 deletions(-)

diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index cb499f3905cec..b7839fd04dfb7 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -43,6 +43,9 @@ int sof_apl_ops_init(struct snd_sof_dev *sdev)
 	/* ipc */
 	sof_apl_ops.send_msg	= hda_dsp_ipc_send_msg;
 
+	/* set DAI driver ops */
+	hda_set_dai_drv_ops(sdev, &sof_apl_ops);
+
 	/* debug */
 	sof_apl_ops.debug_map	= apl_dsp_debugfs;
 	sof_apl_ops.debug_map_count	= ARRAY_SIZE(apl_dsp_debugfs);
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index f5bac91c335ba..98c4e4f61e7c4 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -261,6 +261,9 @@ int sof_cnl_ops_init(struct snd_sof_dev *sdev)
 	/* ipc */
 	sof_cnl_ops.send_msg	= cnl_ipc_send_msg;
 
+	/* set DAI driver ops */
+	hda_set_dai_drv_ops(sdev, &sof_cnl_ops);
+
 	/* debug */
 	sof_cnl_ops.debug_map	= cnl_dsp_debugfs;
 	sof_cnl_ops.debug_map_count	= ARRAY_SIZE(cnl_dsp_debugfs);
diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index f9cb9f1f0237b..8891077d8d8c3 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -276,8 +276,8 @@ static int hda_link_dai_config_pause_push_ipc(struct snd_soc_dapm_widget *w)
 	return ret;
 }
 
-static int hda_link_pcm_trigger(struct snd_pcm_substream *substream,
-				int cmd, struct snd_soc_dai *dai)
+static int ipc3_hda_link_pcm_trigger(struct snd_pcm_substream *substream,
+				     int cmd, struct snd_soc_dai *dai)
 {
 	struct hdac_ext_stream *hext_stream =
 				snd_soc_dai_get_dma_data(dai, substream);
@@ -395,10 +395,10 @@ static int hda_link_hw_free(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static const struct snd_soc_dai_ops hda_link_dai_ops = {
+static const struct snd_soc_dai_ops ipc3_hda_link_dai_ops = {
 	.hw_params = hda_link_hw_params,
 	.hw_free = hda_link_hw_free,
-	.trigger = hda_link_pcm_trigger,
+	.trigger = ipc3_hda_link_pcm_trigger,
 	.prepare = hda_link_pcm_prepare,
 };
 
@@ -478,8 +478,8 @@ static int ssp_dai_prepare(struct snd_pcm_substream *substream,
 	return ssp_dai_setup(substream, dai, true);
 }
 
-static int ssp_dai_trigger(struct snd_pcm_substream *substream,
-			   int cmd, struct snd_soc_dai *dai)
+static int ipc3_ssp_dai_trigger(struct snd_pcm_substream *substream,
+				int cmd, struct snd_soc_dai *dai)
 {
 	if (cmd != SNDRV_PCM_TRIGGER_SUSPEND)
 		return 0;
@@ -507,15 +507,39 @@ static void ssp_dai_shutdown(struct snd_pcm_substream *substream,
 	kfree(dma_data);
 }
 
-static const struct snd_soc_dai_ops ssp_dai_ops = {
+static const struct snd_soc_dai_ops ipc3_ssp_dai_ops = {
 	.startup = ssp_dai_startup,
 	.hw_params = ssp_dai_hw_params,
 	.prepare = ssp_dai_prepare,
-	.trigger = ssp_dai_trigger,
+	.trigger = ipc3_ssp_dai_trigger,
 	.hw_free = ssp_dai_hw_free,
 	.shutdown = ssp_dai_shutdown,
 };
 
+void hda_set_dai_drv_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *ops)
+{
+	int i;
+
+	switch (sdev->pdata->ipc_type) {
+	case SOF_IPC:
+		for (i = 0; i < ops->num_drv; i++) {
+			if (strstr(ops->drv[i].name, "SSP")) {
+				ops->drv[i].ops = &ipc3_ssp_dai_ops;
+				continue;
+			}
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+			if (strstr(ops->drv[i].name, "iDisp") ||
+			    strstr(ops->drv[i].name, "Analog") ||
+			    strstr(ops->drv[i].name, "Digital"))
+				ops->drv[i].ops = &ipc3_hda_link_dai_ops;
+#endif
+		}
+		break;
+	default:
+		break;
+	}
+}
+
 /*
  * common dai driver for skl+ platforms.
  * some products who use this DAI array only physically have a subset of
@@ -524,7 +548,6 @@ static const struct snd_soc_dai_ops ssp_dai_ops = {
 struct snd_soc_dai_driver skl_dai[] = {
 {
 	.name = "SSP0 Pin",
-	.ops = &ssp_dai_ops,
 	.playback = {
 		.channels_min = 1,
 		.channels_max = 8,
@@ -536,7 +559,6 @@ struct snd_soc_dai_driver skl_dai[] = {
 },
 {
 	.name = "SSP1 Pin",
-	.ops = &ssp_dai_ops,
 	.playback = {
 		.channels_min = 1,
 		.channels_max = 8,
@@ -548,7 +570,6 @@ struct snd_soc_dai_driver skl_dai[] = {
 },
 {
 	.name = "SSP2 Pin",
-	.ops = &ssp_dai_ops,
 	.playback = {
 		.channels_min = 1,
 		.channels_max = 8,
@@ -560,7 +581,6 @@ struct snd_soc_dai_driver skl_dai[] = {
 },
 {
 	.name = "SSP3 Pin",
-	.ops = &ssp_dai_ops,
 	.playback = {
 		.channels_min = 1,
 		.channels_max = 8,
@@ -572,7 +592,6 @@ struct snd_soc_dai_driver skl_dai[] = {
 },
 {
 	.name = "SSP4 Pin",
-	.ops = &ssp_dai_ops,
 	.playback = {
 		.channels_min = 1,
 		.channels_max = 8,
@@ -584,7 +603,6 @@ struct snd_soc_dai_driver skl_dai[] = {
 },
 {
 	.name = "SSP5 Pin",
-	.ops = &ssp_dai_ops,
 	.playback = {
 		.channels_min = 1,
 		.channels_max = 8,
@@ -611,7 +629,6 @@ struct snd_soc_dai_driver skl_dai[] = {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 {
 	.name = "iDisp1 Pin",
-	.ops = &hda_link_dai_ops,
 	.playback = {
 		.channels_min = 1,
 		.channels_max = 8,
@@ -619,7 +636,6 @@ struct snd_soc_dai_driver skl_dai[] = {
 },
 {
 	.name = "iDisp2 Pin",
-	.ops = &hda_link_dai_ops,
 	.playback = {
 		.channels_min = 1,
 		.channels_max = 8,
@@ -627,7 +643,6 @@ struct snd_soc_dai_driver skl_dai[] = {
 },
 {
 	.name = "iDisp3 Pin",
-	.ops = &hda_link_dai_ops,
 	.playback = {
 		.channels_min = 1,
 		.channels_max = 8,
@@ -635,7 +650,6 @@ struct snd_soc_dai_driver skl_dai[] = {
 },
 {
 	.name = "iDisp4 Pin",
-	.ops = &hda_link_dai_ops,
 	.playback = {
 		.channels_min = 1,
 		.channels_max = 8,
@@ -643,7 +657,6 @@ struct snd_soc_dai_driver skl_dai[] = {
 },
 {
 	.name = "Analog CPU DAI",
-	.ops = &hda_link_dai_ops,
 	.playback = {
 		.channels_min = 1,
 		.channels_max = 16,
@@ -655,7 +668,6 @@ struct snd_soc_dai_driver skl_dai[] = {
 },
 {
 	.name = "Digital CPU DAI",
-	.ops = &hda_link_dai_ops,
 	.playback = {
 		.channels_min = 1,
 		.channels_max = 16,
@@ -667,7 +679,6 @@ struct snd_soc_dai_driver skl_dai[] = {
 },
 {
 	.name = "Alt Analog CPU DAI",
-	.ops = &hda_link_dai_ops,
 	.playback = {
 		.channels_min = 1,
 		.channels_max = 16,
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 6e05c77594809..f520d1cf70c90 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -761,4 +761,6 @@ int hda_ctrl_dai_widget_free(struct snd_soc_dapm_widget *w, unsigned int quirk_f
 
 extern int sof_hda_position_quirk;
 
+void hda_set_dai_drv_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *ops);
+
 #endif
diff --git a/sound/soc/sof/intel/icl.c b/sound/soc/sof/intel/icl.c
index f845064c3589a..f19517dffd624 100644
--- a/sound/soc/sof/intel/icl.c
+++ b/sound/soc/sof/intel/icl.c
@@ -127,6 +127,9 @@ int sof_icl_ops_init(struct snd_sof_dev *sdev)
 	/* dsp core get/put */
 	sof_icl_ops.core_get = hda_dsp_core_get;
 
+	/* set DAI driver ops */
+	hda_set_dai_drv_ops(sdev, &sof_icl_ops);
+
 	return 0;
 };
 EXPORT_SYMBOL_NS(sof_icl_ops_init, SND_SOC_SOF_INTEL_HDA_COMMON);
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index 816571305f247..ed76f736afb46 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -76,6 +76,9 @@ int sof_tgl_ops_init(struct snd_sof_dev *sdev)
 	/* ipc */
 	sof_tgl_ops.send_msg	= cnl_ipc_send_msg;
 
+	/* set DAI driver ops */
+	hda_set_dai_drv_ops(sdev, &sof_tgl_ops);
+
 	/* debug */
 	sof_tgl_ops.debug_map	= tgl_dsp_debugfs;
 	sof_tgl_ops.debug_map_count	= ARRAY_SIZE(tgl_dsp_debugfs);
-- 
2.30.2

