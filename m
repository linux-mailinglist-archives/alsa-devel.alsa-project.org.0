Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8234DCCEE
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 18:53:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D19418A9;
	Thu, 17 Mar 2022 18:52:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D19418A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647539609;
	bh=Px5WUh7+GYyzaDBhCLmS0KV1WQ96drJzbOBM7gBMx2w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MxtobaopJ+1Ngu9/3EFaoYkSgVFZpgaqqwFYTCCuxOrKkVF9RHablChQ2j6A6hCEN
	 wTh75fceuVtBZ2R43SVBIvgPcy3f+//7U+JRXwfYwcB+1XUwsxVjVL6njZ/WkkPHtA
	 CnXwezhn68Sdy0FkOjesicr1GIejnrx1MN66xhiM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7B96F8051E;
	Thu, 17 Mar 2022 18:51:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1617DF80516; Thu, 17 Mar 2022 18:51:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25EABF80132
 for <alsa-devel@alsa-project.org>; Thu, 17 Mar 2022 18:51:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25EABF80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="b2vHk6Dg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647539504; x=1679075504;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Px5WUh7+GYyzaDBhCLmS0KV1WQ96drJzbOBM7gBMx2w=;
 b=b2vHk6DgszM5nOVij/4tVVOEg1epxHmStxCl9rE01G5jDbIMiwoQ1nLb
 LhLBIvt8OykT7v19WosWvWzU8aH60fFTlkRxvgW93lFLQHIfUFR0SN5Ln
 n7r7fl1LAZ1lzI+hm6XLz+bdYeXPavKp/PLIfWqZXCdVCFgNF0gqmy2N2
 ySbjlLxHhJPgiz38yRl6a4HQ+7zgWwXKPL7iMpz4J3Kx+9GyaaXTSLVHV
 NwjCR0F+0+qRqnGFzqKkmB7wjNeBksjxgN0edxqOCBu9qoOqqp+029B3d
 NUYx6zB9ffgMUJvvBmRcDNmCSxICNwE/mVUKD1O7ADC7vsOHz/XmWpx0X Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="254492896"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="254492896"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 10:51:21 -0700
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="550431106"
Received: from jfbonin1-mobl6.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.255.92.163])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 10:51:21 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 01/19] ASoC: SOF: set up scheduler widget before all other
 widgets in the pipeline
Date: Thu, 17 Mar 2022 10:50:26 -0700
Message-Id: <20220317175044.1752400-2-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317175044.1752400-1-ranjani.sridharan@linux.intel.com>
References: <20220317175044.1752400-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

For dynamic pipelines, We set up the DAI widget during BE DAI hw_params
and this results in it getting set up before the scheduler widget for the
pipeline it belongs to is set up. Move the scheduler widget set up into
sof_widget_setup() to ensure that the scheduler widget is always the first
widget in a pipeline to be set up and the last one to get freed after all
the other widgets have been freed.

Fixes: 5fcdbb2d45df ('ASoC: SOF: Add support for dynamic pipelines')

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/sof-audio.c | 82 +++++++++++++++++++++------------------
 1 file changed, 44 insertions(+), 38 deletions(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 683c290bb69a..cc0d647a2d0d 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -104,7 +104,7 @@ int sof_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 		.id = swidget->comp_id,
 	};
 	struct sof_ipc_reply reply;
-	int ret, ret1;
+	int ret, err;
 
 	if (!swidget->private)
 		return 0;
@@ -136,31 +136,41 @@ int sof_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 	}
 
 	/* continue to disable core even if IPC fails */
-	ret = sof_ipc_tx_message(sdev->ipc, ipc_free.hdr.cmd, &ipc_free, sizeof(ipc_free),
+	err = sof_ipc_tx_message(sdev->ipc, ipc_free.hdr.cmd, &ipc_free, sizeof(ipc_free),
 				 &reply, sizeof(reply));
-	if (ret < 0)
+	if (err < 0)
 		dev_err(sdev->dev, "error: failed to free widget %s\n", swidget->widget->name);
 
 	/*
 	 * disable widget core. continue to route setup status and complete flag
 	 * even if this fails and return the appropriate error
 	 */
-	ret1 = snd_sof_dsp_core_put(sdev, swidget->core);
-	if (ret1 < 0) {
+	ret = snd_sof_dsp_core_put(sdev, swidget->core);
+	if (ret < 0) {
 		dev_err(sdev->dev, "error: failed to disable target core: %d for widget %s\n",
 			swidget->core, swidget->widget->name);
-		if (!ret)
-			ret = ret1;
+		if (!err)
+			err = ret;
 	}
 
 	/* reset route setup status for all routes that contain this widget */
 	sof_reset_route_setup_status(sdev, swidget);
 	swidget->complete = 0;
 
-	if (!ret)
+	/*
+	 * free the scheduler widget (same as pipe_widget) associated with the current swidget.
+	 * skip for static pipelines
+	 */
+	if (swidget->dynamic_pipeline_widget && swidget->id != snd_soc_dapm_scheduler) {
+		ret = sof_widget_free(sdev, swidget->pipe_widget);
+		if (ret < 0 && !err)
+			err = ret;
+	}
+
+	if (!err)
 		dev_dbg(sdev->dev, "widget %s freed\n", swidget->widget->name);
 
-	return ret;
+	return err;
 }
 EXPORT_SYMBOL(sof_widget_free);
 
@@ -181,12 +191,32 @@ int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 	if (++swidget->use_count > 1)
 		return 0;
 
+	/*
+	 * The scheduler widget for a pipeline is not part of the connected DAPM
+	 * widget list and it needs to be set up before the widgets in the pipeline
+	 * are set up. The use_count for the scheduler widget is incremented for every
+	 * widget in a given pipeline to ensure that it is freed only after the last
+	 * widget in the pipeline is freed. Skip setting up scheduler widget for static pipelines.
+	 */
+	if (swidget->dynamic_pipeline_widget && swidget->id != snd_soc_dapm_scheduler) {
+		if (!swidget->pipe_widget) {
+			dev_err(sdev->dev, "No scheduler widget set for %s\n",
+				swidget->widget->name);
+			ret = -EINVAL;
+			goto use_count_dec;
+		}
+
+		ret = sof_widget_setup(sdev, swidget->pipe_widget);
+		if (ret < 0)
+			goto use_count_dec;
+	}
+
 	/* enable widget core */
 	ret = snd_sof_dsp_core_get(sdev, swidget->core);
 	if (ret < 0) {
 		dev_err(sdev->dev, "error: failed to enable target core for widget %s\n",
 			swidget->widget->name);
-		goto use_count_dec;
+		goto pipe_widget_free;
 	}
 
 	switch (swidget->id) {
@@ -257,6 +287,9 @@ int sof_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 
 core_put:
 	snd_sof_dsp_core_put(sdev, swidget->core);
+pipe_widget_free:
+	if (swidget->id != snd_soc_dapm_scheduler)
+		sof_widget_free(sdev, swidget->pipe_widget);
 use_count_dec:
 	swidget->use_count--;
 	return ret;
@@ -374,36 +407,14 @@ int sof_widget_list_setup(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm, in
 	/* set up widgets in the list */
 	for_each_dapm_widgets(list, num_widgets, widget) {
 		struct snd_sof_widget *swidget = widget->dobj.private;
-		struct snd_sof_widget *pipe_widget;
 
 		if (!swidget)
 			continue;
 
-		/*
-		 * The scheduler widget for a pipeline is not part of the connected DAPM
-		 * widget list and it needs to be set up before the widgets in the pipeline
-		 * are set up. The use_count for the scheduler widget is incremented for every
-		 * widget in a given pipeline to ensure that it is freed only after the last
-		 * widget in the pipeline is freed.
-		 */
-		pipe_widget = swidget->pipe_widget;
-		if (!pipe_widget) {
-			dev_err(sdev->dev, "error: no pipeline widget found for %s\n",
-				swidget->widget->name);
-			ret = -EINVAL;
-			goto widget_free;
-		}
-
-		ret = sof_widget_setup(sdev, pipe_widget);
-		if (ret < 0)
-			goto widget_free;
-
 		/* set up the widget */
 		ret = sof_widget_setup(sdev, swidget);
-		if (ret < 0) {
-			sof_widget_free(sdev, pipe_widget);
+		if (ret < 0)
 			goto widget_free;
-		}
 	}
 
 	/*
@@ -456,7 +467,6 @@ int sof_widget_list_setup(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm, in
 			break;
 
 		sof_widget_free(sdev, swidget);
-		sof_widget_free(sdev, swidget->pipe_widget);
 	}
 
 	return ret;
@@ -490,10 +500,6 @@ int sof_widget_list_free(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm, int
 		ret = sof_widget_free(sdev, swidget);
 		if (ret < 0)
 			ret1 = ret;
-
-		ret = sof_widget_free(sdev, swidget->pipe_widget);
-		if (ret < 0)
-			ret1 = ret;
 	}
 
 	snd_soc_dapm_dai_free_widgets(&list);
-- 
2.25.1

