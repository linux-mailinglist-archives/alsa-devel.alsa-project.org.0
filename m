Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C904D8DF6
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 21:12:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D84217E6;
	Mon, 14 Mar 2022 21:11:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D84217E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647288734;
	bh=o9mAhem1fMAhHakxRbYGaHAwvOG4JLgvwqq9NzfK0zE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e2loMKjwSvXwrVikIYYnjwsToHzF2DUTwVfYwm3aTB0laAgycfyr5RAnCKry4XOLs
	 nd+jXXgYTdIf+YoULwfoxWQ4LLAbq5umMDo0IImSZe24PeneiqfEPj6U+g2WHzOAy1
	 Cnvp8TBwe5mjxd8CsTRyV4YvcyhEWLgU5+wCTzEY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1ED5F805BF;
	Mon, 14 Mar 2022 21:06:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07437F8056F; Mon, 14 Mar 2022 21:06:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4F19F80529
 for <alsa-devel@alsa-project.org>; Mon, 14 Mar 2022 21:05:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4F19F80529
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="PYEjsOzm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647288352; x=1678824352;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o9mAhem1fMAhHakxRbYGaHAwvOG4JLgvwqq9NzfK0zE=;
 b=PYEjsOzmz5+KXRfz5HjxGJFOMmStVUQiUeh9pEb7DvOl6wg/Z2Cp4Tf5
 uAhwF4ne7hPTp+Ouzr+IC1h/TqhUbL1EBnHNuQoMuGWjsbdJjYDhaipbh
 lbqj4RLm+QxxxBzt5jhpDVl0yTYUy1BSRo8TmfEJV06IRlOW3Uz3KyH/P
 Nee3cns3aH8flzHrKRY1OvLTwL/Mu3lSTP1JbmdSj3j+ivQIVXzMxji2/
 x6TWIAsLH1YL72T0KaBatH2gyvEJsTQmGE2SlA8LraDuZHu450BezomK8
 RBlYDIGWDmE4nNagNAIcVmLTt119HXhKZu0YOAAmftrcURzFwxVU5kPvl Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="342563488"
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="342563488"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 13:05:34 -0700
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="634339913"
Received: from pmishr1-mobl1.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.25.117])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 13:05:34 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 17/18] ASoC: SOF: topology: Make widget binding IPC agnostic
Date: Mon, 14 Mar 2022 13:05:19 -0700
Message-Id: <20220314200520.1233427-19-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220314200520.1233427-1-ranjani.sridharan@linux.intel.com>
References: <20220314200520.1233427-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: =tiwai@suse.com,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

Make widget binding in the topology parser IPC agnostic by introducing a
new op, bind_event, in struct ipc_tplg_widget_ops. Also set the op
for all widget types in the IPC3 topology ops.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc3-topology.c | 192 +++++++++++++++++++++++++++++-
 sound/soc/sof/topology.c      | 217 ++--------------------------------
 2 files changed, 202 insertions(+), 207 deletions(-)

diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index 96553d103c85..ea1311192877 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -8,6 +8,7 @@
 //
 
 #include <uapi/sound/sof/tokens.h>
+#include <sound/pcm_params.h>
 #include "sof-priv.h"
 #include "sof-audio.h"
 #include "ops.h"
@@ -1698,6 +1699,194 @@ static int sof_ipc3_control_free(struct snd_sof_dev *sdev, struct snd_sof_contro
 	return sof_ipc_tx_message(sdev->ipc, fcomp.hdr.cmd, &fcomp, sizeof(fcomp), NULL, 0);
 }
 
+/* send pcm params ipc */
+static int sof_ipc3_keyword_detect_pcm_params(struct snd_sof_widget *swidget, int dir)
+{
+	struct snd_soc_component *scomp = swidget->scomp;
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	struct sof_ipc_pcm_params_reply ipc_params_reply;
+	struct snd_pcm_hw_params *params;
+	struct sof_ipc_pcm_params pcm;
+	struct snd_sof_pcm *spcm;
+	int ret;
+
+	/* get runtime PCM params using widget's stream name */
+	spcm = snd_sof_find_spcm_name(scomp, swidget->widget->sname);
+	if (!spcm) {
+		dev_err(scomp->dev, "Cannot find PCM for %s\n", swidget->widget->name);
+		return -EINVAL;
+	}
+
+	params = &spcm->params[dir];
+
+	/* set IPC PCM params */
+	memset(&pcm, 0, sizeof(pcm));
+	pcm.hdr.size = sizeof(pcm);
+	pcm.hdr.cmd = SOF_IPC_GLB_STREAM_MSG | SOF_IPC_STREAM_PCM_PARAMS;
+	pcm.comp_id = swidget->comp_id;
+	pcm.params.hdr.size = sizeof(pcm.params);
+	pcm.params.direction = dir;
+	pcm.params.sample_valid_bytes = params_width(params) >> 3;
+	pcm.params.buffer_fmt = SOF_IPC_BUFFER_INTERLEAVED;
+	pcm.params.rate = params_rate(params);
+	pcm.params.channels = params_channels(params);
+	pcm.params.host_period_bytes = params_period_bytes(params);
+
+	/* set format */
+	switch (params_format(params)) {
+	case SNDRV_PCM_FORMAT_S16:
+		pcm.params.frame_fmt = SOF_IPC_FRAME_S16_LE;
+		break;
+	case SNDRV_PCM_FORMAT_S24:
+		pcm.params.frame_fmt = SOF_IPC_FRAME_S24_4LE;
+		break;
+	case SNDRV_PCM_FORMAT_S32:
+		pcm.params.frame_fmt = SOF_IPC_FRAME_S32_LE;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* send IPC to the DSP */
+	ret = sof_ipc_tx_message(sdev->ipc, pcm.hdr.cmd, &pcm, sizeof(pcm),
+				 &ipc_params_reply, sizeof(ipc_params_reply));
+	if (ret < 0)
+		dev_err(scomp->dev, "%s: PCM params failed for %s\n", __func__,
+			swidget->widget->name);
+
+	return ret;
+}
+
+ /* send stream trigger ipc */
+static int sof_ipc3_keyword_detect_trigger(struct snd_sof_widget *swidget, int cmd)
+{
+	struct snd_soc_component *scomp = swidget->scomp;
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	struct sof_ipc_stream stream;
+	struct sof_ipc_reply reply;
+	int ret;
+
+	/* set IPC stream params */
+	stream.hdr.size = sizeof(stream);
+	stream.hdr.cmd = SOF_IPC_GLB_STREAM_MSG | cmd;
+	stream.comp_id = swidget->comp_id;
+
+	/* send IPC to the DSP */
+	ret = sof_ipc_tx_message(sdev->ipc, stream.hdr.cmd, &stream,
+				 sizeof(stream), &reply, sizeof(reply));
+	if (ret < 0)
+		dev_err(scomp->dev, "%s: Failed to trigger %s\n", __func__, swidget->widget->name);
+
+	return ret;
+}
+
+static int sof_ipc3_keyword_dapm_event(struct snd_soc_dapm_widget *w,
+				       struct snd_kcontrol *k, int event)
+{
+	struct snd_sof_widget *swidget = w->dobj.private;
+	struct snd_soc_component *scomp;
+	int stream = SNDRV_PCM_STREAM_CAPTURE;
+	struct snd_sof_pcm *spcm;
+	int ret = 0;
+
+	if (!swidget)
+		return 0;
+
+	scomp = swidget->scomp;
+
+	dev_dbg(scomp->dev, "received event %d for widget %s\n",
+		event, w->name);
+
+	/* get runtime PCM params using widget's stream name */
+	spcm = snd_sof_find_spcm_name(scomp, swidget->widget->sname);
+	if (!spcm) {
+		dev_err(scomp->dev, "%s: Cannot find PCM for %s\n", __func__,
+			swidget->widget->name);
+		return -EINVAL;
+	}
+
+	/* process events */
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		if (spcm->stream[stream].suspend_ignored) {
+			dev_dbg(scomp->dev, "PRE_PMU event ignored, KWD pipeline is already RUNNING\n");
+			return 0;
+		}
+
+		/* set pcm params */
+		ret = sof_ipc3_keyword_detect_pcm_params(swidget, stream);
+		if (ret < 0) {
+			dev_err(scomp->dev, "%s: Failed to set pcm params for widget %s\n",
+				__func__, swidget->widget->name);
+			break;
+		}
+
+		/* start trigger */
+		ret = sof_ipc3_keyword_detect_trigger(swidget, SOF_IPC_STREAM_TRIG_START);
+		if (ret < 0)
+			dev_err(scomp->dev, "%s: Failed to trigger widget %s\n", __func__,
+				swidget->widget->name);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		if (spcm->stream[stream].suspend_ignored) {
+			dev_dbg(scomp->dev,
+				"POST_PMD event ignored, KWD pipeline will remain RUNNING\n");
+			return 0;
+		}
+
+		/* stop trigger */
+		ret = sof_ipc3_keyword_detect_trigger(swidget, SOF_IPC_STREAM_TRIG_STOP);
+		if (ret < 0)
+			dev_err(scomp->dev, "%s: Failed to trigger widget %s\n", __func__,
+				swidget->widget->name);
+
+		/* pcm free */
+		ret = sof_ipc3_keyword_detect_trigger(swidget, SOF_IPC_STREAM_PCM_FREE);
+		if (ret < 0)
+			dev_err(scomp->dev, "%s: Failed to free PCM for widget %s\n", __func__,
+				swidget->widget->name);
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+}
+
+/* event handlers for keyword detect component */
+static const struct snd_soc_tplg_widget_events sof_kwd_events[] = {
+	{SOF_KEYWORD_DETECT_DAPM_EVENT, sof_ipc3_keyword_dapm_event},
+};
+
+static int sof_ipc3_widget_bind_event(struct snd_soc_component *scomp,
+				      struct snd_sof_widget *swidget, u16 event_type)
+{
+	struct sof_ipc_comp *ipc_comp;
+
+	/* validate widget event type */
+	switch (event_type) {
+	case SOF_KEYWORD_DETECT_DAPM_EVENT:
+		/* only KEYWORD_DETECT comps should handle this */
+		if (swidget->id != snd_soc_dapm_effect)
+			break;
+
+		ipc_comp = swidget->private;
+		if (ipc_comp && ipc_comp->type != SOF_COMP_KEYWORD_DETECT)
+			break;
+
+		/* bind event to keyword detect comp */
+		return snd_soc_tplg_widget_bind_event(swidget->widget, sof_kwd_events,
+						      ARRAY_SIZE(sof_kwd_events), event_type);
+	default:
+		break;
+	}
+
+	dev_err(scomp->dev, "Invalid event type %d for widget %s\n", event_type,
+		swidget->widget->name);
+
+	return -EINVAL;
+}
+
 /* token list for each topology object */
 static enum sof_tokens host_token_list[] = {
 	SOF_CORE_TOKENS,
@@ -1790,7 +1979,8 @@ static const struct sof_ipc_tplg_widget_ops tplg_ipc3_widget_ops[SND_SOC_DAPM_TY
 				 comp_generic_token_list, ARRAY_SIZE(comp_generic_token_list),
 				 NULL},
 	[snd_soc_dapm_effect] = {sof_widget_update_ipc_comp_process, sof_ipc3_widget_free_comp,
-				 process_token_list, ARRAY_SIZE(process_token_list), NULL},
+				 process_token_list, ARRAY_SIZE(process_token_list),
+				 sof_ipc3_widget_bind_event},
 };
 
 static const struct sof_ipc_tplg_ops ipc3_tplg_ops = {
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index f7adf058a768..70677a36c304 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -14,7 +14,6 @@
 #include <linux/firmware.h>
 #include <linux/workqueue.h>
 #include <sound/tlv.h>
-#include <sound/pcm_params.h>
 #include <uapi/sound/sof/tokens.h>
 #include "sof-priv.h"
 #include "sof-audio.h"
@@ -135,171 +134,6 @@ int sof_update_ipc_object(struct snd_soc_component *scomp, void *object, enum so
 	return 0;
 }
 
-/* send pcm params ipc */
-static int ipc_pcm_params(struct snd_sof_widget *swidget, int dir)
-{
-	struct sof_ipc_pcm_params_reply ipc_params_reply;
-	struct snd_soc_component *scomp = swidget->scomp;
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
-	struct sof_ipc_pcm_params pcm;
-	struct snd_pcm_hw_params *params;
-	struct snd_sof_pcm *spcm;
-	int ret;
-
-	memset(&pcm, 0, sizeof(pcm));
-
-	/* get runtime PCM params using widget's stream name */
-	spcm = snd_sof_find_spcm_name(scomp, swidget->widget->sname);
-	if (!spcm) {
-		dev_err(scomp->dev, "error: cannot find PCM for %s\n",
-			swidget->widget->name);
-		return -EINVAL;
-	}
-
-	params = &spcm->params[dir];
-
-	/* set IPC PCM params */
-	pcm.hdr.size = sizeof(pcm);
-	pcm.hdr.cmd = SOF_IPC_GLB_STREAM_MSG | SOF_IPC_STREAM_PCM_PARAMS;
-	pcm.comp_id = swidget->comp_id;
-	pcm.params.hdr.size = sizeof(pcm.params);
-	pcm.params.direction = dir;
-	pcm.params.sample_valid_bytes = params_width(params) >> 3;
-	pcm.params.buffer_fmt = SOF_IPC_BUFFER_INTERLEAVED;
-	pcm.params.rate = params_rate(params);
-	pcm.params.channels = params_channels(params);
-	pcm.params.host_period_bytes = params_period_bytes(params);
-
-	/* set format */
-	switch (params_format(params)) {
-	case SNDRV_PCM_FORMAT_S16:
-		pcm.params.frame_fmt = SOF_IPC_FRAME_S16_LE;
-		break;
-	case SNDRV_PCM_FORMAT_S24:
-		pcm.params.frame_fmt = SOF_IPC_FRAME_S24_4LE;
-		break;
-	case SNDRV_PCM_FORMAT_S32:
-		pcm.params.frame_fmt = SOF_IPC_FRAME_S32_LE;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	/* send IPC to the DSP */
-	ret = sof_ipc_tx_message(sdev->ipc, pcm.hdr.cmd, &pcm, sizeof(pcm),
-				 &ipc_params_reply, sizeof(ipc_params_reply));
-	if (ret < 0)
-		dev_err(scomp->dev, "error: pcm params failed for %s\n",
-			swidget->widget->name);
-
-	return ret;
-}
-
- /* send stream trigger ipc */
-static int ipc_trigger(struct snd_sof_widget *swidget, int cmd)
-{
-	struct snd_soc_component *scomp = swidget->scomp;
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
-	struct sof_ipc_stream stream;
-	struct sof_ipc_reply reply;
-	int ret;
-
-	/* set IPC stream params */
-	stream.hdr.size = sizeof(stream);
-	stream.hdr.cmd = SOF_IPC_GLB_STREAM_MSG | cmd;
-	stream.comp_id = swidget->comp_id;
-
-	/* send IPC to the DSP */
-	ret = sof_ipc_tx_message(sdev->ipc, stream.hdr.cmd, &stream,
-				 sizeof(stream), &reply, sizeof(reply));
-	if (ret < 0)
-		dev_err(scomp->dev, "error: failed to trigger %s\n",
-			swidget->widget->name);
-
-	return ret;
-}
-
-static int sof_keyword_dapm_event(struct snd_soc_dapm_widget *w,
-				  struct snd_kcontrol *k, int event)
-{
-	struct snd_sof_widget *swidget = w->dobj.private;
-	struct snd_soc_component *scomp;
-	int stream = SNDRV_PCM_STREAM_CAPTURE;
-	struct snd_sof_pcm *spcm;
-	int ret = 0;
-
-	if (!swidget)
-		return 0;
-
-	scomp = swidget->scomp;
-
-	dev_dbg(scomp->dev, "received event %d for widget %s\n",
-		event, w->name);
-
-	/* get runtime PCM params using widget's stream name */
-	spcm = snd_sof_find_spcm_name(scomp, swidget->widget->sname);
-	if (!spcm) {
-		dev_err(scomp->dev, "error: cannot find PCM for %s\n",
-			swidget->widget->name);
-		return -EINVAL;
-	}
-
-	/* process events */
-	switch (event) {
-	case SND_SOC_DAPM_PRE_PMU:
-		if (spcm->stream[stream].suspend_ignored) {
-			dev_dbg(scomp->dev, "PRE_PMU event ignored, KWD pipeline is already RUNNING\n");
-			return 0;
-		}
-
-		/* set pcm params */
-		ret = ipc_pcm_params(swidget, stream);
-		if (ret < 0) {
-			dev_err(scomp->dev,
-				"error: failed to set pcm params for widget %s\n",
-				swidget->widget->name);
-			break;
-		}
-
-		/* start trigger */
-		ret = ipc_trigger(swidget, SOF_IPC_STREAM_TRIG_START);
-		if (ret < 0)
-			dev_err(scomp->dev,
-				"error: failed to trigger widget %s\n",
-				swidget->widget->name);
-		break;
-	case SND_SOC_DAPM_POST_PMD:
-		if (spcm->stream[stream].suspend_ignored) {
-			dev_dbg(scomp->dev, "POST_PMD even ignored, KWD pipeline will remain RUNNING\n");
-			return 0;
-		}
-
-		/* stop trigger */
-		ret = ipc_trigger(swidget, SOF_IPC_STREAM_TRIG_STOP);
-		if (ret < 0)
-			dev_err(scomp->dev,
-				"error: failed to trigger widget %s\n",
-				swidget->widget->name);
-
-		/* pcm free */
-		ret = ipc_trigger(swidget, SOF_IPC_STREAM_PCM_FREE);
-		if (ret < 0)
-			dev_err(scomp->dev,
-				"error: failed to trigger widget %s\n",
-				swidget->widget->name);
-		break;
-	default:
-		break;
-	}
-
-	return ret;
-}
-
-/* event handlers for keyword detect component */
-static const struct snd_soc_tplg_widget_events sof_kwd_events[] = {
-	{SOF_KEYWORD_DETECT_DAPM_EVENT, sof_keyword_dapm_event},
-};
-
 static inline int get_tlv_data(const int *p, int tlv[TLV_ITEMS])
 {
 	/* we only support dB scale TLV type at the moment */
@@ -1323,38 +1157,6 @@ static int sof_widget_parse_tokens(struct snd_soc_component *scomp, struct snd_s
 	return ret;
 }
 
-static int sof_widget_bind_event(struct snd_soc_component *scomp,
-				 struct snd_sof_widget *swidget,
-				 u16 event_type)
-{
-	struct sof_ipc_comp *ipc_comp;
-
-	/* validate widget event type */
-	switch (event_type) {
-	case SOF_KEYWORD_DETECT_DAPM_EVENT:
-		/* only KEYWORD_DETECT comps should handle this */
-		if (swidget->id != snd_soc_dapm_effect)
-			break;
-
-		ipc_comp = swidget->private;
-		if (ipc_comp && ipc_comp->type != SOF_COMP_KEYWORD_DETECT)
-			break;
-
-		/* bind event to keyword detect comp */
-		return snd_soc_tplg_widget_bind_event(swidget->widget,
-						      sof_kwd_events,
-						      ARRAY_SIZE(sof_kwd_events),
-						      event_type);
-	default:
-		break;
-	}
-
-	dev_err(scomp->dev,
-		"error: invalid event type %d for widget %s\n",
-		event_type, swidget->widget->name);
-	return -EINVAL;
-}
-
 static int sof_get_token_value(u32 token_id, struct snd_sof_tuple *tuples, int num_tuples)
 {
 	int i;
@@ -1486,14 +1288,17 @@ static int sof_widget_ready(struct snd_soc_component *scomp, int index,
 
 	/* bind widget to external event */
 	if (tw->event_type) {
-		ret = sof_widget_bind_event(scomp, swidget,
-					    le16_to_cpu(tw->event_type));
-		if (ret) {
-			dev_err(scomp->dev, "error: widget event binding failed\n");
-			kfree(swidget->private);
-			kfree(swidget->tuples);
-			kfree(swidget);
-			return ret;
+		if (widget_ops[w->id].bind_event) {
+			ret = widget_ops[w->id].bind_event(scomp, swidget,
+							   le16_to_cpu(tw->event_type));
+			if (ret) {
+				dev_err(scomp->dev, "widget event binding failed for %s\n",
+					swidget->widget->name);
+				kfree(swidget->private);
+				kfree(swidget->tuples);
+				kfree(swidget);
+				return ret;
+			}
 		}
 	}
 
-- 
2.25.1

