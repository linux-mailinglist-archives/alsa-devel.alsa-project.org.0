Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2E054D6F0
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 03:20:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD8E01AB4;
	Thu, 16 Jun 2022 03:19:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD8E01AB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655342409;
	bh=WlF6IGDNKcYwGntMGB2JVx7A5/2QpCifsZSxNNBMeqc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k+EWAW4fBJc+E1DuSzp1PvZd40ribeifvwajgiI1JV6WccqQ5yTlgn+PSmE3xCxlj
	 286IHkUM6D4ap4I6HTlV+du5iuyrhdZuFS6xLoNUxR3W7PZB5p7tA/6P61AXkfAQcW
	 Hg/XuelUoS489ksko2H1p1+LTKy/lKMVlW/EM0w8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D3E2F80529;
	Thu, 16 Jun 2022 03:18:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C09C9F8028D; Thu, 16 Jun 2022 03:18:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4351BF80162
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 03:18:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4351BF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="UeJ6OUZb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655342303; x=1686878303;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=WlF6IGDNKcYwGntMGB2JVx7A5/2QpCifsZSxNNBMeqc=;
 b=UeJ6OUZbZgA51OPxUInkEkt6PLZli3+uFa8NhhSPPhPSwWCSnWJlQ1FL
 xehMWk14ycvWVEonAkqlZUQ4lK9c+lXLQYdMHQ1QSMXJwCwM4ZqiU1GXl
 PzB4yR45V/z7qYTiEiOaCCO7GM/T4ad2saWybuzJYokIxQjIhJatrqDRv
 wDkeQBwbTsl1pUIXmKgZV1AKY/uf0An8obUpJHPXpbzYwWJvNBjVMIo7o
 duVEZ31ju/wSCoqeVGqpQz/8fDQwr80WAk8I0U08ZOco+PuTq6vohWBHO
 g1kMK5AouRiG3l3VW1S/nlmBA/+A7R/IX1I6aSubJ9kybZOJUpb0zPSqY A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="279195966"
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; d="scan'208";a="279195966"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 18:18:15 -0700
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; d="scan'208";a="911939339"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 18:18:12 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 2/2] ASoC: SOF: Intel: add trigger callback into
 sdw_callback
Date: Thu, 16 Jun 2022 09:17:58 +0800
Message-Id: <20220616011758.21155-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220616011758.21155-1-yung-chuan.liao@linux.intel.com>
References: <20220616011758.21155-1-yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org, srinivas.kandagatla@linaro.org,
 ranjani.sridharan@linux.intel.com, sanyog.r.kale@intel.com,
 peter.ujfalusi@linux.intel.com, bard.liao@intel.com
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
 sound/soc/sof/intel/hda-dai.c | 14 +++++++++++---
 sound/soc/sof/intel/hda.c     |  2 +-
 sound/soc/sof/intel/hda.h     |  1 +
 3 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 70721defca46..97632ca4b7a7 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -714,8 +714,7 @@ static const struct snd_soc_dai_ops ipc3_ssp_dai_ops = {
 	.shutdown = ssp_dai_shutdown,
 };
 
-static int ipc4_be_dai_trigger(struct snd_pcm_substream *substream,
-			       int cmd, struct snd_soc_dai *dai)
+static int ipc4_be_dai_common_trigger(struct snd_soc_dai *dai, int cmd, int stream)
 {
 	struct snd_sof_widget *pipe_widget;
 	struct sof_ipc4_pipeline *pipeline;
@@ -724,7 +723,7 @@ static int ipc4_be_dai_trigger(struct snd_pcm_substream *substream,
 	struct snd_sof_dev *sdev;
 	int ret;
 
-	w = snd_soc_dai_get_widget(dai, substream->stream);
+	w = snd_soc_dai_get_widget(dai, stream);
 	swidget = w->dobj.private;
 	pipe_widget = swidget->pipe_widget;
 	pipeline = pipe_widget->private;
@@ -759,6 +758,12 @@ static int ipc4_be_dai_trigger(struct snd_pcm_substream *substream,
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
@@ -810,6 +815,9 @@ void hda_set_dai_drv_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *ops)
 		if (!hda_use_tplg_nhlt)
 			ipc4_data->nhlt = intel_nhlt_init(sdev->dev);
 
+		if (IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE))
+			sdw_callback.trigger = ipc4_be_dai_common_trigger;
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
index a3118499e34f..99545ab492d7 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -775,5 +775,6 @@ irqreturn_t cnl_ipc4_irq_thread(int irq, void *context);
 int cnl_ipc4_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg);
 irqreturn_t hda_dsp_ipc4_irq_thread(int irq, void *context);
 int hda_dsp_ipc4_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg);
+extern struct sdw_intel_ops sdw_callback;
 
 #endif
-- 
2.17.1

