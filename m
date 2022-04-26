Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 263AD510544
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 19:21:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B09DD18DD;
	Tue, 26 Apr 2022 19:20:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B09DD18DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650993691;
	bh=ZWj92bdb4zMfAcb+3LaHhfZcnr/9xF/S5JvqhBe56AM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rS9JxA5S+R3JQnG8vdGWgDiJiCmHjBhJmoS4GcbeTra69RzAmPvesusG3IYNnl68d
	 cngX9BlsEZiy+6tQjjSX8h4CTd3hSulto0Hc6y+Rtwyp/eYVo07Dhwv34EdhiuR9sB
	 jd9A5BoGRdb+P8DaZ+SfdRdYzQgoX1X/NtX7E4zE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7274F80536;
	Tue, 26 Apr 2022 19:18:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EF69F80536; Tue, 26 Apr 2022 19:18:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70914F80508
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 19:17:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70914F80508
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="FJrPMoyp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650993476; x=1682529476;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZWj92bdb4zMfAcb+3LaHhfZcnr/9xF/S5JvqhBe56AM=;
 b=FJrPMoypSdkWB2Avd8XoX7qj+gMvu0VR62cVbJQ/8aMegWN/b+hJaCaw
 21F7ApsRLNh7pqCpld96iKHirK1E3UyE4awmxBLqHZOy1n2U/SL4Hwjg5
 +wTpeHbmd/u5bpzbSmxkbV1TibO9bXctwx/ZCUWDCqGYZJeybsXqHQrrs
 jfgwppKjupqZW1YRK3OjMIhEtzmVNK/ni5eZaAPrRpss1DeSfiktrV1Tn
 5/5W0IKxKSAy06xJrHqOK6Dkr7wNpTWFkVhdkepKE7IhMHs85PxKrCpyh
 Uad79tENbp73IwJzzV38ECDa5M2ZvpVYKg3TM8uWpvqddTVVjo1e/+LMe g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="326150594"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="326150594"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 10:17:49 -0700
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="558431190"
Received: from shashinx-mobl.gar.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.0.53])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 10:17:49 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 03/11] ASoC: SOF: sof-audio: Set up widgets from source to sink
Date: Tue, 26 Apr 2022 10:17:35 -0700
Message-Id: <20220426171743.171061-4-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426171743.171061-1-ranjani.sridharan@linux.intel.com>
References: <20220426171743.171061-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.com,
 broonie@kernel.org, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
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

For IPC3, the order of setting up the widgets associated with a PCM
doesn't matter. But for IPC4, widgets must be set up from the source to
the sink in order. In order to accommodate this, change the
sof_widget_list_setup/free() functions to set up/free widgets starting
with the source widget all the way to the sink widget for all pipelines.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/sof-audio.c | 170 +++++++++++++++++++++++++++-----------
 sound/soc/sof/sof-audio.h |   7 ++
 2 files changed, 130 insertions(+), 47 deletions(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 1180d6bab33e..0bc6c3ef0cd4 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -253,29 +253,135 @@ static int sof_setup_pipeline_connections(struct snd_sof_dev *sdev,
 	return 0;
 }
 
+/*
+ * free all widgets in the sink path starting from the source widget
+ * (DAI type for capture, AIF type for playback)
+ */
+static int sof_free_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget *widget,
+				    int dir)
+{
+	struct snd_soc_dapm_path *p;
+	int err;
+	int ret = 0;
+
+	/* free all widgets even in case of error to keep use counts balanced */
+	snd_soc_dapm_widget_for_each_sink_path(widget, p) {
+		if (!p->walking && p->sink->dobj.private && widget->dobj.private) {
+			p->walking = true;
+			if (WIDGET_IS_AIF_OR_DAI(widget->id)) {
+				err = sof_widget_free(sdev, widget->dobj.private);
+				if (err < 0)
+					ret = err;
+			}
+
+			err = sof_widget_free(sdev, p->sink->dobj.private);
+			if (err < 0)
+				ret = err;
+
+			err = sof_free_widgets_in_path(sdev, p->sink, dir);
+			if (err < 0)
+				ret = err;
+			p->walking = false;
+		}
+	}
+
+	return ret;
+}
+
+/*
+ * set up all widgets in the sink path starting from the source widget
+ * (DAI type for capture, AIF type for playback).
+ * The error path in this function ensures that all successfully set up widgets getting freed.
+ */
+static int sof_set_up_widgets_in_path(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget *widget,
+				      int dir)
+{
+	struct snd_soc_dapm_path *p;
+	int ret;
+
+	snd_soc_dapm_widget_for_each_sink_path(widget, p) {
+		if (!p->walking && p->sink->dobj.private && widget->dobj.private) {
+			p->walking = true;
+			if (WIDGET_IS_AIF_OR_DAI(widget->id)) {
+				ret = sof_widget_setup(sdev, widget->dobj.private);
+				if (ret < 0)
+					goto out;
+			}
+
+			ret = sof_widget_setup(sdev, p->sink->dobj.private);
+			if (ret < 0) {
+				if (WIDGET_IS_AIF_OR_DAI(widget->id))
+					sof_widget_free(sdev, widget->dobj.private);
+				goto out;
+			}
+
+			ret = sof_set_up_widgets_in_path(sdev, p->sink, dir);
+			if (ret < 0) {
+				if (WIDGET_IS_AIF_OR_DAI(widget->id))
+					sof_widget_free(sdev, widget->dobj.private);
+				sof_widget_free(sdev, p->sink->dobj.private);
+			}
+out:
+			p->walking = false;
+			if (ret < 0)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int
+sof_setup_or_free_widgets_in_order(struct snd_sof_dev *sdev, struct snd_soc_dapm_widget_list *list,
+				   bool dir, enum sof_widget_op op)
+{
+	struct snd_soc_dapm_widget *widget;
+	int ret, i;
+
+	for_each_dapm_widgets(list, i, widget) {
+		/* starting widget for playback is AIF type */
+		if (dir == SNDRV_PCM_STREAM_PLAYBACK && !WIDGET_IS_AIF(widget->id))
+			continue;
+
+		/* starting widget for capture is DAI type */
+		if (dir == SNDRV_PCM_STREAM_CAPTURE && !WIDGET_IS_DAI(widget->id))
+			continue;
+
+		switch (op) {
+		case SOF_WIDGET_SETUP:
+			ret = sof_set_up_widgets_in_path(sdev, widget, dir);
+			break;
+		case SOF_WIDGET_FREE:
+			ret = sof_free_widgets_in_path(sdev, widget, dir);
+			break;
+		default:
+			dev_err(sdev->dev, "Invalid widget op %d\n", op);
+			return -EINVAL;
+		}
+		if (ret < 0) {
+			dev_err(sdev->dev, "Failed to %s connected widgets\n",
+				op == SOF_WIDGET_SETUP ? "set up" : "free");
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
 int sof_widget_list_setup(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm, int dir)
 {
 	const struct sof_ipc_tplg_ops *ipc_tplg_ops = sdev->ipc->ops->tplg;
 	struct snd_soc_dapm_widget_list *list = spcm->stream[dir].list;
 	struct snd_soc_dapm_widget *widget;
-	int i, ret, num_widgets;
+	int i, ret;
 
 	/* nothing to set up */
 	if (!list)
 		return 0;
 
-	/* set up widgets in the list */
-	for_each_dapm_widgets(list, num_widgets, widget) {
-		struct snd_sof_widget *swidget = widget->dobj.private;
-
-		if (!swidget)
-			continue;
-
-		/* set up the widget */
-		ret = sof_widget_setup(sdev, swidget);
-		if (ret < 0)
-			goto widget_free;
-	}
+	ret = sof_setup_or_free_widgets_in_order(sdev, list, dir, SOF_WIDGET_SETUP);
+	if (ret < 0)
+		return ret;
 
 	/*
 	 * error in setting pipeline connections will result in route status being reset for
@@ -316,18 +422,7 @@ int sof_widget_list_setup(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm, in
 	return 0;
 
 widget_free:
-	/* free all widgets that have been set up successfully */
-	for_each_dapm_widgets(list, i, widget) {
-		struct snd_sof_widget *swidget = widget->dobj.private;
-
-		if (!swidget)
-			continue;
-
-		if (!num_widgets--)
-			break;
-
-		sof_widget_free(sdev, swidget);
-	}
+	sof_setup_or_free_widgets_in_order(sdev, list, dir, SOF_WIDGET_FREE);
 
 	return ret;
 }
@@ -335,37 +430,18 @@ int sof_widget_list_setup(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm, in
 int sof_widget_list_free(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm, int dir)
 {
 	struct snd_soc_dapm_widget_list *list = spcm->stream[dir].list;
-	struct snd_soc_dapm_widget *widget;
-	int i, ret;
-	int ret1 = 0;
+	int ret;
 
 	/* nothing to free */
 	if (!list)
 		return 0;
 
-	/*
-	 * Free widgets in the list. This can fail but continue freeing other widgets to keep
-	 * use_counts balanced.
-	 */
-	for_each_dapm_widgets(list, i, widget) {
-		struct snd_sof_widget *swidget = widget->dobj.private;
-
-		if (!swidget)
-			continue;
-
-		/*
-		 * free widget and its pipe_widget. Either of these can fail, but free as many as
-		 * possible before freeing the list and returning the error.
-		 */
-		ret = sof_widget_free(sdev, swidget);
-		if (ret < 0)
-			ret1 = ret;
-	}
+	ret = sof_setup_or_free_widgets_in_order(sdev, list, dir, SOF_WIDGET_FREE);
 
 	snd_soc_dapm_dai_free_widgets(&list);
 	spcm->stream[dir].list = NULL;
 
-	return ret1;
+	return ret;
 }
 
 /*
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index e254b22ea8a9..eb882ed7d0e4 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -29,10 +29,17 @@
 #define DMA_CHAN_INVALID	0xFFFFFFFF
 
 #define WIDGET_IS_DAI(id) ((id) == snd_soc_dapm_dai_in || (id) == snd_soc_dapm_dai_out)
+#define WIDGET_IS_AIF(id) ((id) == snd_soc_dapm_aif_in || (id) == snd_soc_dapm_aif_out)
+#define WIDGET_IS_AIF_OR_DAI(id) (WIDGET_IS_DAI(id) || WIDGET_IS_AIF(id))
 
 #define SOF_DAI_CLK_INTEL_SSP_MCLK	0
 #define SOF_DAI_CLK_INTEL_SSP_BCLK	1
 
+enum sof_widget_op {
+	SOF_WIDGET_FREE,
+	SOF_WIDGET_SETUP,
+};
+
 /*
  * Volume fractional word length define to 16 sets
  * the volume linear gain value to use Qx.16 format
-- 
2.25.1

