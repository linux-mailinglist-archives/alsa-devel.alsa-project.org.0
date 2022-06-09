Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD395441EF
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 05:30:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D8631FF6;
	Thu,  9 Jun 2022 05:29:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D8631FF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654745435;
	bh=Fe9/sdIZlBX9WRfeu6H3/svHftYk8QUcBTaxc1q5eIk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=smX0Rx+8MmhTLTMit6ww4ngogRDY22y6Z2aP1eitES5ofbtX4RcXfMdOwzN4vsBZU
	 30O22tPpcqK2j6NxiElsapAZWxGZTB/2Hnwe1f59Q+FplcKu2kZKeVWuXLJcmSDovt
	 g/hwxzxBfQ5pRbOC7K/LKScqZOtfK7Xg/88uBp78=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D378F80588;
	Thu,  9 Jun 2022 05:27:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 044FAF80588; Thu,  9 Jun 2022 05:27:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5726CF8052F
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 05:27:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5726CF8052F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="eEzIisxJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654745238; x=1686281238;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Fe9/sdIZlBX9WRfeu6H3/svHftYk8QUcBTaxc1q5eIk=;
 b=eEzIisxJIHYRjDzMsgpS3cmcmU6rtxC9JiwjfNTg06URQJoc8Pl6axWr
 LV3LI19B2Q75WfOBUe3po0FIsREov7bWpIwQ8yX7FCLicne5GsbwBMsOV
 ms0ykg3UPTgT+SQowjqEh/bCj+6gRtj8ZumaOp33KzvOv+5KpW7hv82Fl
 okDe/nbSd/LkHLliZivbdCDqN/NT4qiHW5ZKHNFe40tXtWSbOSAO7OVM8
 8Gdd3Hemv26PXbt79Um2d3VieMsGb3hHnhRvzWbkeJp444SxTDWgwPpI+
 gB0dwaNtpe/1x7/E0clIG9Lc7D2UaGjhRWNnen8Ds2oMapCdv6juIJwLz w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="341219560"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="341219560"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 20:26:59 -0700
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="585260243"
Received: from mandalag-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.38.40])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 20:26:59 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 11/23] ASoC: SOF: IPC4: Add pcm ops
Date: Wed,  8 Jun 2022 20:26:31 -0700
Message-Id: <20220609032643.916882-12-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609032643.916882-1-ranjani.sridharan@linux.intel.com>
References: <20220609032643.916882-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Yaochun Hung <yc.hung@mediatek.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

Define and set the PCM ops for IPC4.

Co-developed-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Rander Wang <rander.wang@linux.intel.com>
Co-developed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Yaochun Hung <yc.hung@mediatek.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/Makefile    |   2 +-
 sound/soc/sof/ipc4-pcm.c  | 229 ++++++++++++++++++++++++++++++++++++++
 sound/soc/sof/ipc4-priv.h |   1 +
 sound/soc/sof/ipc4.c      |   1 +
 4 files changed, 232 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/sof/ipc4-pcm.c

diff --git a/sound/soc/sof/Makefile b/sound/soc/sof/Makefile
index 1e15937f2bde..2fa8088707a8 100644
--- a/sound/soc/sof/Makefile
+++ b/sound/soc/sof/Makefile
@@ -4,7 +4,7 @@ snd-sof-objs := core.o ops.o loader.o ipc.o pcm.o pm.o debug.o topology.o\
 		control.o trace.o iomem-utils.o sof-audio.o stream-ipc.o\
 		ipc3-topology.o ipc3-control.o ipc3.o ipc3-pcm.o ipc3-loader.o\
 		ipc3-dtrace.o\
-		ipc4.o ipc4-loader.o ipc4-topology.o ipc4-control.o
+		ipc4.o ipc4-loader.o ipc4-topology.o ipc4-control.o ipc4-pcm.o
 ifneq ($(CONFIG_SND_SOC_SOF_CLIENT),)
 snd-sof-objs += sof-client.o
 endif
diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
new file mode 100644
index 000000000000..7a56fba8f1d9
--- /dev/null
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -0,0 +1,229 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license.  When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2022 Intel Corporation. All rights reserved.
+//
+
+#include <sound/pcm_params.h>
+#include <sound/sof/ipc4/header.h>
+#include "sof-audio.h"
+#include "sof-priv.h"
+#include "ipc4-priv.h"
+#include "ipc4-topology.h"
+
+static int sof_ipc4_set_pipeline_state(struct snd_sof_dev *sdev, u32 id, u32 state)
+{
+	struct sof_ipc4_msg msg = {{ 0 }};
+	u32 primary;
+
+	dev_dbg(sdev->dev, "ipc4 set pipeline %d state %d", id, state);
+
+	primary = state;
+	primary |= SOF_IPC4_GLB_PIPE_STATE_ID(id);
+	primary |= SOF_IPC4_MSG_TYPE_SET(SOF_IPC4_GLB_SET_PIPELINE_STATE);
+	primary |= SOF_IPC4_MSG_DIR(SOF_IPC4_MSG_REQUEST);
+	primary |= SOF_IPC4_MSG_TARGET(SOF_IPC4_FW_GEN_MSG);
+
+	msg.primary = primary;
+
+	return sof_ipc_tx_message(sdev->ipc, &msg, 0, NULL, 0);
+}
+
+static int sof_ipc4_trigger_pipelines(struct snd_soc_component *component,
+				      struct snd_pcm_substream *substream, int state)
+{
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_sof_widget *pipeline_widget;
+	struct snd_soc_dapm_widget_list *list;
+	struct snd_soc_dapm_widget *widget;
+	struct sof_ipc4_pipeline *pipeline;
+	struct snd_sof_widget *swidget;
+	struct snd_sof_pcm *spcm;
+	int ret = 0;
+	int num_widgets;
+
+	spcm = snd_sof_find_spcm_dai(component, rtd);
+	if (!spcm)
+		return -EINVAL;
+
+	list = spcm->stream[substream->stream].list;
+
+	for_each_dapm_widgets(list, num_widgets, widget) {
+		swidget = widget->dobj.private;
+
+		if (!swidget)
+			continue;
+
+		/*
+		 * set pipeline state for both FE and BE pipelines for RUNNING state.
+		 * For PAUSE/RESET, set the pipeline state only for the FE pipeline.
+		 */
+		switch (state) {
+		case SOF_IPC4_PIPE_PAUSED:
+		case SOF_IPC4_PIPE_RESET:
+			if (!WIDGET_IS_AIF(swidget->id))
+				continue;
+			break;
+		default:
+			break;
+		}
+
+		/* find pipeline widget for the pipeline that this widget belongs to */
+		pipeline_widget = swidget->pipe_widget;
+		pipeline = (struct sof_ipc4_pipeline *)pipeline_widget->private;
+
+		if (pipeline->state == state)
+			continue;
+
+		/* first set the pipeline to PAUSED state */
+		if (pipeline->state != SOF_IPC4_PIPE_PAUSED) {
+			ret = sof_ipc4_set_pipeline_state(sdev, swidget->pipeline_id,
+							  SOF_IPC4_PIPE_PAUSED);
+			if (ret < 0) {
+				dev_err(sdev->dev, "failed to pause pipeline %d\n",
+					swidget->pipeline_id);
+				return ret;
+			}
+		}
+
+		pipeline->state = SOF_IPC4_PIPE_PAUSED;
+
+		if (pipeline->state == state)
+			continue;
+
+		/* then set the final state */
+		ret = sof_ipc4_set_pipeline_state(sdev, swidget->pipeline_id, state);
+		if (ret < 0) {
+			dev_err(sdev->dev, "failed to set state %d for pipeline %d\n",
+				state, swidget->pipeline_id);
+			break;
+		}
+
+		pipeline->state = state;
+	}
+
+	return ret;
+}
+
+static int sof_ipc4_pcm_trigger(struct snd_soc_component *component,
+				struct snd_pcm_substream *substream, int cmd)
+{
+	int state;
+
+	/* determine the pipeline state */
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		state = SOF_IPC4_PIPE_PAUSED;
+		break;
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_START:
+		state = SOF_IPC4_PIPE_RUNNING;
+		break;
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_STOP:
+		state = SOF_IPC4_PIPE_PAUSED;
+		break;
+	default:
+		dev_err(component->dev, "%s: unhandled trigger cmd %d\n", __func__, cmd);
+		return -EINVAL;
+	}
+
+	/* set the pipeline state */
+	return sof_ipc4_trigger_pipelines(component, substream, state);
+}
+
+static int sof_ipc4_pcm_hw_free(struct snd_soc_component *component,
+				struct snd_pcm_substream *substream)
+{
+	return sof_ipc4_trigger_pipelines(component, substream, SOF_IPC4_PIPE_RESET);
+}
+
+static void ipc4_ssp_dai_config_pcm_params_match(struct snd_sof_dev *sdev, const char *link_name,
+						 struct snd_pcm_hw_params *params)
+{
+	struct snd_sof_dai_link *slink;
+	struct snd_sof_dai *dai;
+	bool dai_link_found = false;
+	int i;
+
+	list_for_each_entry(slink, &sdev->dai_link_list, list) {
+		if (!strcmp(slink->link->name, link_name)) {
+			dai_link_found = true;
+			break;
+		}
+	}
+
+	if (!dai_link_found)
+		return;
+
+	for (i = 0; i < slink->num_hw_configs; i++) {
+		struct snd_soc_tplg_hw_config *hw_config = &slink->hw_configs[i];
+
+		if (params_rate(params) == le32_to_cpu(hw_config->fsync_rate)) {
+			/* set current config for all DAI's with matching name */
+			list_for_each_entry(dai, &sdev->dai_list, list)
+				if (!strcmp(slink->link->name, dai->name))
+					dai->current_config = le32_to_cpu(hw_config->id);
+			break;
+		}
+	}
+}
+
+static int sof_ipc4_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
+				       struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, SOF_AUDIO_PCM_DRV_NAME);
+	struct snd_sof_dai *dai = snd_sof_find_dai(component, rtd->dai_link->name);
+	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
+	struct sof_ipc4_copier *ipc4_copier;
+	struct snd_soc_dpcm *dpcm;
+
+	if (!dai) {
+		dev_err(component->dev, "%s: No DAI found with name %s\n", __func__,
+			rtd->dai_link->name);
+		return -EINVAL;
+	}
+
+	ipc4_copier = dai->private;
+	if (!ipc4_copier) {
+		dev_err(component->dev, "%s: No private data found for DAI %s\n",
+			__func__, rtd->dai_link->name);
+		return -EINVAL;
+	}
+
+	/* always set BE format to 32-bits for both playback and capture */
+	snd_mask_none(fmt);
+	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S32_LE);
+
+	/*
+	 * Set trigger order for capture to SND_SOC_DPCM_TRIGGER_PRE. This is required
+	 * to ensure that the BE DAI pipeline gets stopped/suspended before the FE DAI
+	 * pipeline gets triggered and the pipeline widgets are freed.
+	 */
+	for_each_dpcm_fe(rtd, SNDRV_PCM_STREAM_CAPTURE, dpcm) {
+		struct snd_soc_pcm_runtime *fe = dpcm->fe;
+
+		fe->dai_link->trigger[SNDRV_PCM_STREAM_CAPTURE] = SND_SOC_DPCM_TRIGGER_PRE;
+	}
+
+	switch (ipc4_copier->dai_type) {
+	case SOF_DAI_INTEL_SSP:
+		ipc4_ssp_dai_config_pcm_params_match(sdev, (char *)rtd->dai_link->name, params);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+const struct sof_ipc_pcm_ops ipc4_pcm_ops = {
+	.trigger = sof_ipc4_pcm_trigger,
+	.hw_free = sof_ipc4_pcm_hw_free,
+	.dai_link_fixup = sof_ipc4_pcm_dai_link_fixup,
+};
diff --git a/sound/soc/sof/ipc4-priv.h b/sound/soc/sof/ipc4-priv.h
index d0b110811aeb..e4381a74516c 100644
--- a/sound/soc/sof/ipc4-priv.h
+++ b/sound/soc/sof/ipc4-priv.h
@@ -42,5 +42,6 @@ struct sof_ipc4_fw_module {
 extern const struct sof_ipc_fw_loader_ops ipc4_loader_ops;
 extern const struct sof_ipc_tplg_ops ipc4_tplg_ops;
 extern const struct sof_ipc_tplg_control_ops tplg_ipc4_control_ops;
+extern const struct sof_ipc_pcm_ops ipc4_pcm_ops;
 
 #endif
diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
index be677a33882d..700069e759c4 100644
--- a/sound/soc/sof/ipc4.c
+++ b/sound/soc/sof/ipc4.c
@@ -604,4 +604,5 @@ const struct sof_ipc_ops ipc4_ops = {
 	.get_reply = sof_ipc4_get_reply,
 	.fw_loader = &ipc4_loader_ops,
 	.tplg = &ipc4_tplg_ops,
+	.pcm = &ipc4_pcm_ops,
 };
-- 
2.25.1

