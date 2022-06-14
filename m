Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 652D954AA15
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 09:10:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00E8A187A;
	Tue, 14 Jun 2022 09:09:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00E8A187A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655190616;
	bh=89fJyn3HdQE4qrmLLsHd0B83txiGpBAciNGBYfvWWjY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B7KmfqqU35lSDoVHxaB0Uoi+FoW1bIGA0VeZioKBHrfnHfAVtUpnWXRolfcgyjPcc
	 SAo7UUdXLmWuiDOcpVUNE5hRO1jp3bWEjTZsAlLFHnzMsN0hsirsG1DPJrPzRTBQyq
	 2qwOIA2BAntrbmoExLrvaMkPlqNQ4U5gJCBBiFtI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A208AF8012B;
	Tue, 14 Jun 2022 09:08:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32DD7F8016E; Tue, 14 Jun 2022 09:08:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E904EF8016E
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 09:08:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E904EF8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Rh3Bka+S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655190528; x=1686726528;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=89fJyn3HdQE4qrmLLsHd0B83txiGpBAciNGBYfvWWjY=;
 b=Rh3Bka+S38Ok8LFjhXxbaatimqpTAHNZtArni5/JhBj/aOC3d/x0d83y
 /q3ZV2Ta7IIpyerEsRzDO4amdtkmAk3b2q64iKVR24fuiyfE2d6x+fvFH
 QbKYVsgt8gqjpp/zoDJnXPObTXPgakpSb/552Tk4KsV40I13ChJD5vdFW
 gaBS/Q5S0AnnyYBnBg6QtiyPmwNTqxlEUzmbEKi8dC+Gd86mQb+y+2qJh
 aq0YZAWOdcQB8uRGnxFGYvuvCEFkpy7Aj0FRxeZPV+8m4FrEAhU9yRBCA
 wxws0NAjNk9RYq+OsB5NskQZ+qjjHZS8JxIVHSkWYh0n9xXgbL6DsXARj g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="279250062"
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; d="scan'208";a="279250062"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 00:08:34 -0700
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; d="scan'208";a="640185952"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 00:08:32 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 2/2] ASoC: SOF: Intel: add trigger callback into sdw_callback
Date: Tue, 14 Jun 2022 15:08:17 +0800
Message-Id: <20220614070817.2508-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220614070817.2508-1-yung-chuan.liao@linux.intel.com>
References: <20220614070817.2508-1-yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, sanyog.r.kale@intel.com,
 bard.liao@intel.com
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

For IPC4, we need to set pipeline state in BE DAI trigger.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 15 ++++++++++++---
 sound/soc/sof/intel/hda.c     |  2 +-
 sound/soc/sof/intel/hda.h     |  1 +
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 228079a52c3d..6ed99fdc5793 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -713,8 +713,7 @@ static const struct snd_soc_dai_ops ipc3_ssp_dai_ops = {
 	.shutdown = ssp_dai_shutdown,
 };
 
-static int ipc4_be_dai_trigger(struct snd_pcm_substream *substream,
-			       int cmd, struct snd_soc_dai *dai)
+static int ipc4_be_dai_common_trigger(struct snd_soc_dai *dai, int cmd, int stream)
 {
 	struct snd_sof_widget *pipe_widget;
 	struct sof_ipc4_pipeline *pipeline;
@@ -723,7 +722,7 @@ static int ipc4_be_dai_trigger(struct snd_pcm_substream *substream,
 	struct snd_sof_dev *sdev;
 	int ret;
 
-	w = snd_soc_dai_get_widget(dai, substream->stream);
+	w = snd_soc_dai_get_widget(dai, stream);
 	swidget = w->dobj.private;
 	pipe_widget = swidget->pipe_widget;
 	pipeline = pipe_widget->private;
@@ -758,6 +757,12 @@ static int ipc4_be_dai_trigger(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static int ipc4_be_dai_trigger(struct snd_pcm_substream *substream,
+			       int cmd, struct snd_soc_dai *dai)
+{
+	return ipc4_be_dai_common_trigger(dai, cmd, substream->stream);
+}
+
 static const struct snd_soc_dai_ops ipc4_dmic_dai_ops = {
 	.trigger = ipc4_be_dai_trigger,
 };
@@ -809,6 +814,10 @@ void hda_set_dai_drv_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *ops)
 		if (!hda_use_tplg_nhlt)
 			ipc4_data->nhlt = intel_nhlt_init(sdev->dev);
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
+		sdw_callback.trigger = ipc4_be_dai_common_trigger;
+#endif
+
 		break;
 	}
 	default:
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index bc07df1fc39f..cdd3601e84f5 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -147,7 +147,7 @@ static int sdw_free_stream(struct device *dev,
 	return hda_ctrl_dai_widget_free(w, SOF_DAI_CONFIG_FLAGS_NONE, &data);
 }
 
-static const struct sdw_intel_ops sdw_callback = {
+struct sdw_intel_ops sdw_callback = {
 	.params_stream = sdw_params_stream,
 	.free_stream = sdw_free_stream,
 };
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index f4e4cd7d7406..ec7a2d947eb6 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -771,5 +771,6 @@ irqreturn_t cnl_ipc4_irq_thread(int irq, void *context);
 int cnl_ipc4_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg);
 irqreturn_t hda_dsp_ipc4_irq_thread(int irq, void *context);
 int hda_dsp_ipc4_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg);
+extern struct sdw_intel_ops sdw_callback;
 
 #endif
-- 
2.17.1

