Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F165B702B53
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 13:21:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D0CD7827;
	Mon, 15 May 2023 13:20:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D0CD7827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684149679;
	bh=/w1fTlkl+wLpsOSV/Zz2ppbghLyPLPX/FDTtMFUfHEE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h7c376G5t2MpCl5/wNWUVBzqr6tL5ryCp6YOh9MI7w5pP0HeJy83VSKWUUcOIDUfw
	 FVxphAObfBtNq4MDaUyf35gPUOVIM0VYrLD09rhN7QN42Yc2o+xR+b80bDcZXn64t8
	 y3SoCqp5JufD9X5PT2+cYEAA53/QiCqC8poHwHAs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36A96F8055A; Mon, 15 May 2023 13:19:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F0EFF80551;
	Mon, 15 May 2023 13:19:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17E11F80544; Mon, 15 May 2023 13:19:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DDC07F8016A
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 13:19:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDC07F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KlRZ/nNx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684149576; x=1715685576;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/w1fTlkl+wLpsOSV/Zz2ppbghLyPLPX/FDTtMFUfHEE=;
  b=KlRZ/nNxXYRed/dQqrQek5WH/L5KFPdw4FS28tW+DN+ex80oVtJoRWAX
   jjyaHTHBwogIIFNwpOPKqSiv9XHxl5UxUMcJ7tL1mqX1ibnZQqyb1UXhe
   ZXEeLgH9MCaDPsPcFp8/KNWe21N4zNyhZmFjtjC21b2PvqneYGVRmWK0B
   r/HAfkVf0fp/uQCF3Z9/SxC3yJzpXrz5ZnXGh8mrCxGiPeUgh261lOx6k
   CzxTF8xm9DwVPNIkNmFYWLHqDmaH84PGsEUiFQDEx+t/8+Sqk4lc0vGmC
   xfc5LfNq7jRlWgTPeLc4K5JynjlwHaBdyMFFQTYBsD4KprxQzyrV4cHbO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="379336190"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200";
   d="scan'208";a="379336190"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 04:19:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="875142101"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200";
   d="scan'208";a="875142101"
Received: from lpilolli-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.48.230])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2023 04:19:32 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH 2/2] ASoC: SOF: ipc4-pcm: reset all pipelines during FE DAI
 hw_free
Date: Mon, 15 May 2023 14:20:22 +0300
Message-Id: <20230515112022.30297-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515112022.30297-1-peter.ujfalusi@linux.intel.com>
References: <20230515112022.30297-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AUSZZH7E5TINWIBEEV6MWOYSFM63FXDC
X-Message-ID-Hash: AUSZZH7E5TINWIBEEV6MWOYSFM63FXDC
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AUSZZH7E5TINWIBEEV6MWOYSFM63FXDC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Do not reset pipelines during the stop/suspend triggers in the BE DAI
ops as the BE DAI pipeline needs to be left in the PAUSED state. It should
only be reset during hw_free. This simplification is already done for
the FE pipelines and the DAI trigger only toggles the states between
PAUSED and RUNNING.

But because the FE DAI hw_free is invoked first and all the pipelines are
freed during this op, we need to make sure that the BE DAI pipeline also
gets reset before it is freed. So do not skip the pipelines that have the
skip_during_fe_trigger flag set when resetting pipelines.

Also, because the pipeline state changes are split between the FE and BE
DAI ops now, protect the BE DAI pipeline state changes with the
pipeline_state_mutex as well.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai-ops.c | 47 ++++++++++++++++++++-----------
 sound/soc/sof/ipc4-pcm.c          |  4 +--
 2 files changed, 32 insertions(+), 19 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai-ops.c b/sound/soc/sof/intel/hda-dai-ops.c
index 4c04adff4c45..f121b9e31708 100644
--- a/sound/soc/sof/intel/hda-dai-ops.c
+++ b/sound/soc/sof/intel/hda-dai-ops.c
@@ -178,6 +178,7 @@ static void hda_reset_hext_stream(struct snd_sof_dev *sdev, struct hdac_ext_stre
 static int hda_ipc4_pre_trigger(struct snd_sof_dev *sdev, struct snd_soc_dai *cpu_dai,
 				struct snd_pcm_substream *substream, int cmd)
 {
+	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
 	struct snd_sof_widget *pipe_widget;
 	struct sof_ipc4_pipeline *pipeline;
 	struct snd_sof_widget *swidget;
@@ -189,6 +190,8 @@ static int hda_ipc4_pre_trigger(struct snd_sof_dev *sdev, struct snd_soc_dai *cp
 	pipe_widget = swidget->spipe->pipe_widget;
 	pipeline = pipe_widget->private;
 
+	mutex_lock(&ipc4_data->pipeline_state_mutex);
+
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
@@ -199,7 +202,7 @@ static int hda_ipc4_pre_trigger(struct snd_sof_dev *sdev, struct snd_soc_dai *cp
 		ret = sof_ipc4_set_pipeline_state(sdev, pipe_widget->instance_id,
 						  SOF_IPC4_PIPE_PAUSED);
 		if (ret < 0)
-			return ret;
+			goto out;
 
 		pipeline->state = SOF_IPC4_PIPE_PAUSED;
 		break;
@@ -207,7 +210,8 @@ static int hda_ipc4_pre_trigger(struct snd_sof_dev *sdev, struct snd_soc_dai *cp
 		dev_err(sdev->dev, "unknown trigger command %d\n", cmd);
 		return -EINVAL;
 	}
-
+out:
+	mutex_unlock(&ipc4_data->pipeline_state_mutex);
 	return 0;
 }
 
@@ -237,53 +241,62 @@ static int hda_trigger(struct snd_sof_dev *sdev, struct snd_soc_dai *cpu_dai,
 static int hda_ipc4_post_trigger(struct snd_sof_dev *sdev, struct snd_soc_dai *cpu_dai,
 				 struct snd_pcm_substream *substream, int cmd)
 {
+	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
 	struct snd_sof_widget *pipe_widget;
 	struct sof_ipc4_pipeline *pipeline;
 	struct snd_sof_widget *swidget;
 	struct snd_soc_dapm_widget *w;
-	int ret;
+	int ret = 0;
 
 	w = snd_soc_dai_get_widget(cpu_dai, substream->stream);
 	swidget = w->dobj.private;
 	pipe_widget = swidget->spipe->pipe_widget;
 	pipeline = pipe_widget->private;
 
+	mutex_lock(&ipc4_data->pipeline_state_mutex);
+
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
-	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		if (pipeline->state != SOF_IPC4_PIPE_PAUSED) {
 			ret = sof_ipc4_set_pipeline_state(sdev, pipe_widget->instance_id,
 							  SOF_IPC4_PIPE_PAUSED);
 			if (ret < 0)
-				return ret;
+				goto out;
 			pipeline->state = SOF_IPC4_PIPE_PAUSED;
 		}
 
 		ret = sof_ipc4_set_pipeline_state(sdev, pipe_widget->instance_id,
 						  SOF_IPC4_PIPE_RUNNING);
 		if (ret < 0)
-			return ret;
+			goto out;
 		pipeline->state = SOF_IPC4_PIPE_RUNNING;
+		swidget->spipe->started_count++;
 		break;
-	case SNDRV_PCM_TRIGGER_SUSPEND:
-	case SNDRV_PCM_TRIGGER_STOP:
-	{
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		ret = sof_ipc4_set_pipeline_state(sdev, pipe_widget->instance_id,
-						  SOF_IPC4_PIPE_RESET);
+						  SOF_IPC4_PIPE_RUNNING);
 		if (ret < 0)
-			return ret;
-
-		pipeline->state = SOF_IPC4_PIPE_RESET;
+			goto out;
+		pipeline->state = SOF_IPC4_PIPE_RUNNING;
+		break;
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_STOP:
+		/*
+		 * STOP/SUSPEND trigger is invoked only once when all users of this pipeline have
+		 * been stopped. So, clear the started_count so that the pipeline can be reset
+		 */
+		swidget->spipe->started_count = 0;
 		break;
-	}
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		break;
 	default:
 		dev_err(sdev->dev, "unknown trigger command %d\n", cmd);
-		return -EINVAL;
+		ret = -EINVAL;
+		break;
 	}
-
-	return 0;
+out:
+	mutex_unlock(&ipc4_data->pipeline_state_mutex);
+	return ret;
 }
 
 static const struct hda_dai_widget_dma_ops hda_ipc4_dma_ops = {
diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index 9e2b6c45080d..0c905bd0fab4 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -69,7 +69,7 @@ sof_ipc4_add_pipeline_to_trigger_list(struct snd_sof_dev *sdev, int state,
 	struct snd_sof_widget *pipe_widget = spipe->pipe_widget;
 	struct sof_ipc4_pipeline *pipeline = pipe_widget->private;
 
-	if (pipeline->skip_during_fe_trigger)
+	if (pipeline->skip_during_fe_trigger && state != SOF_IPC4_PIPE_RESET)
 		return;
 
 	switch (state) {
@@ -108,7 +108,7 @@ sof_ipc4_update_pipeline_state(struct snd_sof_dev *sdev, int state, int cmd,
 	struct sof_ipc4_pipeline *pipeline = pipe_widget->private;
 	int i;
 
-	if (pipeline->skip_during_fe_trigger)
+	if (pipeline->skip_during_fe_trigger && state != SOF_IPC4_PIPE_RESET)
 		return;
 
 	/* set state for pipeline if it was just triggered */
-- 
2.40.1

