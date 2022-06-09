Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 701145441F9
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 05:33:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCC1A2066;
	Thu,  9 Jun 2022 05:32:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCC1A2066
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654745583;
	bh=Z5bQQZMvYNftESw73zkKwskprlgBpLYLchcGwj/y4EI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AtpNXKjUHyYhI7Ms12CX5nUNETijVBBll5Jc+94S5Bl5L18/V224YKEbmYvU1XrI8
	 hPs3tvQbPYsEtD0ceyXw+jnj6MRydXs5eTdZk34nPgRxrqImz3u8QCwFIdQibqkT7q
	 el2/UNpcUJCI5Da2XdUmWRn5Wma1PndTqC9HKZ4A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F1E8F805C8;
	Thu,  9 Jun 2022 05:27:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9909EF805B5; Thu,  9 Jun 2022 05:27:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18E40F804BD
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 05:27:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18E40F804BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="inBm5onq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654745242; x=1686281242;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z5bQQZMvYNftESw73zkKwskprlgBpLYLchcGwj/y4EI=;
 b=inBm5onqJduT2Yu5w72UqvHf6XjRIWTyPX80ODnbSsYniQRWxyU/06IK
 IWVAWoigtwvFWtnxGYqOedagjhvU4H5rb1F0a6RLYMTyAUa3CEW6od2M0
 mbCYBijxfP6HGk3tvO+CzXYdFDJEPpBNrEIp96ipwTRBHuXHG1vqpQ9tg
 JxErsrtyAf0prfQYo/JMICbzJssQ/Lr8Bj7vWrJwJNetCAyIfs4ksxRtK
 3CPE6dxwZxxRsX8K/2YhmrHZtzAaPBuA/5OrJR7prW2e2oBBUGucbX9X7
 9KIMC5fdo+hhtLHzi5M9b49zXX6GCzRVv45mzs0HXfpngz0E623SDfLCN w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="341219566"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="341219566"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 20:27:00 -0700
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="585260249"
Received: from mandalag-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.38.40])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 20:27:00 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 16/23] ASoC: SOF: IPC4: set the BE DAI ops
Date: Wed,  8 Jun 2022 20:26:36 -0700
Message-Id: <20220609032643.916882-17-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609032643.916882-1-ranjani.sridharan@linux.intel.com>
References: <20220609032643.916882-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>
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

Add BE DAI drv ops for IPC4 for DMIC, SSP and HDA type DAI's.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 173 +++++++++++++++++++++++++++++++++-
 1 file changed, 170 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 9823230d2ef4..5423667002e5 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -10,6 +10,10 @@
 
 #include <sound/pcm_params.h>
 #include <sound/hdaudio_ext.h>
+#include <sound/sof/ipc4/header.h>
+#include <uapi/sound/sof/header.h>
+#include "../ipc4-priv.h"
+#include "../ipc4-topology.h"
 #include "../sof-priv.h"
 #include "../sof-audio.h"
 #include "hda.h"
@@ -369,8 +373,7 @@ static int hda_dai_config_pause_push_ipc(struct snd_soc_dapm_widget *w)
 	return ret;
 }
 
-static int ipc3_hda_dai_prepare(struct snd_pcm_substream *substream,
-				struct snd_soc_dai *dai)
+static int hda_dai_prepare(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
 	struct hdac_ext_stream *hext_stream =
 				snd_soc_dai_get_dma_data(dai, substream);
@@ -438,6 +441,91 @@ static int ipc3_hda_dai_trigger(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+/*
+ * In contrast to IPC3, the dai trigger in IPC4 mixes pipeline state changes
+ * (over IPC channel) and DMA state change (direct host register changes).
+ */
+static int ipc4_hda_dai_trigger(struct snd_pcm_substream *substream,
+				int cmd, struct snd_soc_dai *dai)
+{
+	struct hdac_ext_stream *hext_stream = snd_soc_dai_get_dma_data(dai, substream);
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(dai->component);
+	struct snd_soc_pcm_runtime *rtd;
+	struct snd_sof_widget *swidget;
+	struct snd_soc_dapm_widget *w;
+	struct snd_soc_dai *codec_dai;
+	struct hdac_stream *hstream;
+	struct snd_soc_dai *cpu_dai;
+	int ret;
+
+	dev_dbg(dai->dev, "%s: cmd=%d dai %s direction %d\n", __func__, cmd,
+		dai->name, substream->stream);
+
+	hstream = substream->runtime->private_data;
+	rtd = asoc_substream_to_rtd(substream);
+	cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	codec_dai = asoc_rtd_to_codec(rtd, 0);
+
+	w = snd_soc_dai_get_widget(dai, substream->stream);
+	swidget = w->dobj.private;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		snd_hdac_ext_link_stream_start(hext_stream);
+		break;
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_STOP:
+	{
+		struct snd_sof_widget *pipe_widget = swidget->pipe_widget;
+		struct sof_ipc4_pipeline *pipeline = pipe_widget->private;
+
+		ret = sof_ipc4_set_pipeline_state(sdev, swidget->pipeline_id,
+						  SOF_IPC4_PIPE_PAUSED);
+		if (ret < 0)
+			return ret;
+
+		pipeline->state = SOF_IPC4_PIPE_PAUSED;
+
+		snd_hdac_ext_link_stream_clear(hext_stream);
+
+		ret = sof_ipc4_set_pipeline_state(sdev, swidget->pipeline_id,
+						  SOF_IPC4_PIPE_RESET);
+		if (ret < 0)
+			return ret;
+
+		pipeline->state = SOF_IPC4_PIPE_RESET;
+
+		ret = hda_link_dma_cleanup(substream, hstream, cpu_dai, codec_dai, false);
+		if (ret < 0) {
+			dev_err(sdev->dev, "%s: failed to clean up link DMA\n", __func__);
+			return ret;
+		}
+		break;
+	}
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+	{
+		struct snd_sof_widget *pipe_widget = swidget->pipe_widget;
+		struct sof_ipc4_pipeline *pipeline = pipe_widget->private;
+
+		ret = sof_ipc4_set_pipeline_state(sdev, swidget->pipeline_id,
+						  SOF_IPC4_PIPE_PAUSED);
+		if (ret < 0)
+			return ret;
+
+		pipeline->state = SOF_IPC4_PIPE_PAUSED;
+
+		snd_hdac_ext_link_stream_clear(hext_stream);
+		break;
+	}
+	default:
+		dev_err(sdev->dev, "%s: unknown trigger command %d\n", __func__, cmd);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int hda_dai_hw_free(struct snd_pcm_substream *substream,
 			   struct snd_soc_dai *dai)
 {
@@ -454,7 +542,7 @@ static const struct snd_soc_dai_ops ipc3_hda_dai_ops = {
 	.hw_params = hda_dai_hw_params,
 	.hw_free = hda_dai_hw_free,
 	.trigger = ipc3_hda_dai_trigger,
-	.prepare = ipc3_hda_dai_prepare,
+	.prepare = hda_dai_prepare,
 };
 
 static int hda_dai_suspend(struct hdac_bus *bus)
@@ -497,6 +585,14 @@ static int hda_dai_suspend(struct hdac_bus *bus)
 
 	return 0;
 }
+
+static const struct snd_soc_dai_ops ipc4_hda_dai_ops = {
+	.hw_params = hda_dai_hw_params,
+	.hw_free = hda_dai_hw_free,
+	.trigger = ipc4_hda_dai_trigger,
+	.prepare = hda_dai_prepare,
+};
+
 #endif
 
 /* only one flag used so far to harden hw_params/hw_free/trigger/prepare */
@@ -608,6 +704,59 @@ static const struct snd_soc_dai_ops ipc3_ssp_dai_ops = {
 	.shutdown = ssp_dai_shutdown,
 };
 
+static int ipc4_be_dai_trigger(struct snd_pcm_substream *substream,
+			       int cmd, struct snd_soc_dai *dai)
+{
+	struct snd_sof_widget *pipe_widget;
+	struct sof_ipc4_pipeline *pipeline;
+	struct snd_sof_widget *swidget;
+	struct snd_soc_dapm_widget *w;
+	struct snd_sof_dev *sdev;
+	int ret;
+
+	w = snd_soc_dai_get_widget(dai, substream->stream);
+	swidget = w->dobj.private;
+	pipe_widget = swidget->pipe_widget;
+	pipeline = pipe_widget->private;
+	sdev = snd_soc_component_get_drvdata(swidget->scomp);
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_STOP:
+		ret = sof_ipc4_set_pipeline_state(sdev, swidget->pipeline_id,
+						  SOF_IPC4_PIPE_PAUSED);
+		if (ret < 0)
+			return ret;
+		pipeline->state = SOF_IPC4_PIPE_PAUSED;
+
+		ret = sof_ipc4_set_pipeline_state(sdev, swidget->pipeline_id,
+						  SOF_IPC4_PIPE_RESET);
+		if (ret < 0)
+			return ret;
+		pipeline->state = SOF_IPC4_PIPE_RESET;
+		break;
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		ret = sof_ipc4_set_pipeline_state(sdev, swidget->pipeline_id,
+						  SOF_IPC4_PIPE_PAUSED);
+		if (ret < 0)
+			return ret;
+		pipeline->state = SOF_IPC4_PIPE_PAUSED;
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops ipc4_dmic_dai_ops = {
+	.trigger = ipc4_be_dai_trigger,
+};
+
+static const struct snd_soc_dai_ops ipc4_ssp_dai_ops = {
+	.trigger = ipc4_be_dai_trigger,
+};
+
 void hda_set_dai_drv_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *ops)
 {
 	int i;
@@ -624,6 +773,24 @@ void hda_set_dai_drv_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *ops)
 			    strstr(ops->drv[i].name, "Analog") ||
 			    strstr(ops->drv[i].name, "Digital"))
 				ops->drv[i].ops = &ipc3_hda_dai_ops;
+#endif
+		}
+		break;
+	case SOF_INTEL_IPC4:
+		for (i = 0; i < ops->num_drv; i++) {
+			if (strstr(ops->drv[i].name, "DMIC")) {
+				ops->drv[i].ops = &ipc4_dmic_dai_ops;
+				continue;
+			}
+			if (strstr(ops->drv[i].name, "SSP")) {
+				ops->drv[i].ops = &ipc4_ssp_dai_ops;
+				continue;
+			}
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+			if (strstr(ops->drv[i].name, "iDisp") ||
+			    strstr(ops->drv[i].name, "Analog") ||
+			    strstr(ops->drv[i].name, "Digital"))
+				ops->drv[i].ops = &ipc4_hda_dai_ops;
 #endif
 		}
 		break;
-- 
2.25.1

