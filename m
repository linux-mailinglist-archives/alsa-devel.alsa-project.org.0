Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4E814EBEB
	for <lists+alsa-devel@lfdr.de>; Fri, 31 Jan 2020 12:47:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2035D1683;
	Fri, 31 Jan 2020 12:46:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2035D1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580471223;
	bh=JB54L+DZP+gYl61l3VDPyuxO/P8GksVeaOjFXqQNseU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k8i9pDbHtKgq96Kk2IHydYHShUIZRgH9MF1MQsfJ5IDeLE8BJXmEiCg/HzRmy0p6d
	 Qs6jMammzCc9PyA0Pb4l4P1D9mVc1zgtj/aaGHCP/utMBlL6Jv6mKOYjId12b3R/En
	 8FhH2l2TndWXri8eqIyH704wgrUlFkLmRtNEpnJ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B50B0F80279;
	Fri, 31 Jan 2020 12:44:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 030FBF80249; Fri, 31 Jan 2020 12:44:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCB40F80218;
 Fri, 31 Jan 2020 12:44:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCB40F80218
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jan 2020 03:43:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,385,1574150400"; d="scan'208";a="430343387"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO
 ubuntu.ger.corp.intel.com) ([10.249.38.16])
 by fmsmga006.fm.intel.com with ESMTP; 31 Jan 2020 03:43:58 -0800
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 31 Jan 2020 12:43:54 +0100
Message-Id: <20200131114355.17301-3-guennadi.liakhovetski@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200131114355.17301-1-guennadi.liakhovetski@linux.intel.com>
References: <20200131114355.17301-1-guennadi.liakhovetski@linux.intel.com>
MIME-Version: 1.0
Cc: sound-open-firmware@alsa-project.org
Subject: [alsa-devel] [PATCH 2/3] ASoC: add function parameters to enable
	forced path pruning
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This is a preparation for the host part of a virtualised VirtIO audio
host-guest driver pair. It adds a "mode" parameter to
soc_dpcm_runtime_update() to allow it to be used when stopping
streaming in a virtual machine, which requires forced DPCM audio path
pruning.

For audio virtualisation the host side driver will be using the vhost
API, i.e. it will run completely in the kernel. When a guest begins to
stream audio, the vhost calls snd_soc_runtime_activate() and
soc_dpcm_runtime_update() to activate an audio path and update audio
routing. When streaming is stopped, the vhost driver calls
soc_dpcm_runtime_update() and snd_soc_runtime_deactivate(). The latter
doesn't work at the moment, because the DPCM doesn't recognise the
path as inactive. We address this by adding a "mode" parameter to
soc_dpcm_runtime_update(). If virtualisation isn't used, the current
behaviour isn't affected.

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 include/sound/soc-dpcm.h | 28 ++++++++++++++---
 sound/soc/soc-compress.c |  2 +-
 sound/soc/soc-dapm.c     |  8 ++---
 sound/soc/soc-pcm.c      | 80 +++++++++++++++++++++++++++++++++---------------
 4 files changed, 83 insertions(+), 35 deletions(-)

diff --git a/include/sound/soc-dpcm.h b/include/sound/soc-dpcm.h
index b654ebf..d2ffe3e 100644
--- a/include/sound/soc-dpcm.h
+++ b/include/sound/soc-dpcm.h
@@ -61,6 +61,23 @@ enum snd_soc_dpcm_trigger {
 	SND_SOC_DPCM_TRIGGER_BESPOKE,
 };
 
+/**
+ * enum snd_soc_dpcm_update_mode - mode for calling soc_dpcm_runtime_update()
+ *
+ * @SND_SOC_DPCM_UPDATE_FULL:		default mode, used for mux, mixer, and
+ *					volume widgets
+ * @SND_SOC_DPCM_UPDATE_NEW_ONLY:	a pipeline is starting. Skip checking
+ *					for old paths.
+ * @SND_SOC_DPCM_UPDATE_OLD_ONLY:	a pipeline is shutting down. Skip
+ *					checking for new paths, force old path
+ *					pruning.
+ */
+enum snd_soc_dpcm_update_mode {
+	SND_SOC_DPCM_UPDATE_FULL,
+	SND_SOC_DPCM_UPDATE_NEW_ONLY,
+	SND_SOC_DPCM_UPDATE_OLD_ONLY,
+};
+
 /*
  * Dynamic PCM link
  * This links together a FE and BE DAI at runtime and stores the link
@@ -142,7 +159,8 @@ void snd_soc_dpcm_be_set_state(struct snd_soc_pcm_runtime *be, int stream,
 
 /* internal use only */
 int soc_dpcm_be_digital_mute(struct snd_soc_pcm_runtime *fe, int mute);
-int soc_dpcm_runtime_update(struct snd_soc_card *);
+int soc_dpcm_runtime_update(struct snd_soc_card *card,
+			    enum snd_soc_dpcm_update_mode mode);
 
 #ifdef CONFIG_DEBUG_FS
 void soc_dpcm_debugfs_add(struct snd_soc_pcm_runtime *rtd);
@@ -152,10 +170,10 @@ static inline void soc_dpcm_debugfs_add(struct snd_soc_pcm_runtime *rtd)
 }
 #endif
 
-int dpcm_path_get(struct snd_soc_pcm_runtime *fe,
-	int stream, struct snd_soc_dapm_widget_list **list_);
-int dpcm_process_paths(struct snd_soc_pcm_runtime *fe,
-	int stream, struct snd_soc_dapm_widget_list **list, int new);
+int dpcm_path_get(struct snd_soc_pcm_runtime *fe, int stream,
+	struct snd_soc_dapm_widget_list **list_);
+int dpcm_process_paths(struct snd_soc_pcm_runtime *fe, int stream,
+	struct snd_soc_dapm_widget_list **list, bool new, bool force_prune);
 int dpcm_be_dai_startup(struct snd_soc_pcm_runtime *fe, int stream);
 int dpcm_be_dai_shutdown(struct snd_soc_pcm_runtime *fe, int stream);
 void dpcm_be_disconnect(struct snd_soc_pcm_runtime *fe, int stream);
diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index 223cd04..a92720a 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -162,7 +162,7 @@ static int soc_compr_open_fe(struct snd_compr_stream *cstream)
 		dev_dbg(fe->dev, "Compress ASoC: %s no valid %s route\n",
 			fe->dai_link->name, stream ? "capture" : "playback");
 	/* calculate valid and active FE <-> BE dpcms */
-	dpcm_process_paths(fe, stream, &list, 1);
+	dpcm_process_paths(fe, stream, &list, true, false);
 	fe->dpcm[stream].runtime = fe_substream->runtime;
 
 	fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_FE;
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index bc20ad9..41543a4a 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -2286,7 +2286,7 @@ int snd_soc_dapm_mux_update_power(struct snd_soc_dapm_context *dapm,
 	card->update = NULL;
 	mutex_unlock(&card->dapm_mutex);
 	if (ret > 0)
-		soc_dpcm_runtime_update(card);
+		soc_dpcm_runtime_update(card, SND_SOC_DPCM_UPDATE_FULL);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_mux_update_power);
@@ -2351,7 +2351,7 @@ int snd_soc_dapm_mixer_update_power(struct snd_soc_dapm_context *dapm,
 	card->update = NULL;
 	mutex_unlock(&card->dapm_mutex);
 	if (ret > 0)
-		soc_dpcm_runtime_update(card);
+		soc_dpcm_runtime_update(card, SND_SOC_DPCM_UPDATE_FULL);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_mixer_update_power);
@@ -3394,7 +3394,7 @@ int snd_soc_dapm_put_volsw(struct snd_kcontrol *kcontrol,
 	mutex_unlock(&card->dapm_mutex);
 
 	if (ret > 0)
-		soc_dpcm_runtime_update(card);
+		soc_dpcm_runtime_update(card, SND_SOC_DPCM_UPDATE_FULL);
 
 	return change;
 }
@@ -3493,7 +3493,7 @@ static int __snd_soc_dapm_put_enum_double(struct snd_kcontrol *kcontrol,
 		mutex_unlock(&card->dapm_mutex);
 
 	if (ret > 0)
-		soc_dpcm_runtime_update(card);
+		soc_dpcm_runtime_update(card, SND_SOC_DPCM_UPDATE_FULL);
 
 	return change;
 }
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 9b51f45..afe7c16 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1422,14 +1422,14 @@ static bool dpcm_be_is_active(struct snd_soc_dpcm *dpcm, int stream,
 }
 
 static int dpcm_prune_paths(struct snd_soc_pcm_runtime *fe, int stream,
-	struct snd_soc_dapm_widget_list **list_)
+			    struct snd_soc_dapm_widget_list **list_, bool force)
 {
 	struct snd_soc_dpcm *dpcm;
 	int prune = 0;
 
 	/* Destroy any old FE <--> BE connections */
 	for_each_dpcm_be(fe, stream, dpcm) {
-		if (dpcm_be_is_active(dpcm, stream, *list_))
+		if (!force && dpcm_be_is_active(dpcm, stream, *list_))
 			continue;
 
 		dev_dbg(fe->dev, "ASoC: pruning %s BE %s for %s\n",
@@ -1507,12 +1507,13 @@ static int dpcm_add_paths(struct snd_soc_pcm_runtime *fe, int stream,
  * FE substream.
  */
 int dpcm_process_paths(struct snd_soc_pcm_runtime *fe,
-	int stream, struct snd_soc_dapm_widget_list **list, int new)
+		       int stream, struct snd_soc_dapm_widget_list **list,
+		       bool new, bool force_prune)
 {
 	if (new)
 		return dpcm_add_paths(fe, stream, list);
 	else
-		return dpcm_prune_paths(fe, stream, list);
+		return dpcm_prune_paths(fe, stream, list, force_prune);
 }
 
 void dpcm_clear_pending_state(struct snd_soc_pcm_runtime *fe, int stream)
@@ -2527,11 +2528,13 @@ static int dpcm_fe_dai_prepare(struct snd_pcm_substream *substream)
 	return ret;
 }
 
-static int dpcm_run_update_shutdown(struct snd_soc_pcm_runtime *fe, int stream)
+static int dpcm_run_update_shutdown(struct snd_soc_pcm_runtime *fe, int stream,
+				    bool force)
 {
 	struct snd_pcm_substream *substream =
 		snd_soc_dpcm_get_substream(fe, stream);
 	enum snd_soc_dpcm_trigger trigger = fe->dai_link->trigger[stream];
+	int event = force ? SND_SOC_DAPM_STREAM_STOP : SND_SOC_DAPM_STREAM_NOP;
 	int err;
 
 	dev_dbg(fe->dev, "ASoC: runtime %s close on FE %s\n",
@@ -2563,7 +2566,7 @@ static int dpcm_run_update_shutdown(struct snd_soc_pcm_runtime *fe, int stream)
 		dev_err(fe->dev,"ASoC: shutdown FE failed %d\n", err);
 
 	/* run the stream event for each BE */
-	dpcm_dapm_stream_event(fe, stream, SND_SOC_DAPM_STREAM_NOP);
+	dpcm_dapm_stream_event(fe, stream, event);
 
 	return 0;
 }
@@ -2669,12 +2672,13 @@ static int dpcm_run_new_update(struct snd_soc_pcm_runtime *fe, int stream)
 	return ret;
 }
 
-static int dpcm_run_old_update(struct snd_soc_pcm_runtime *fe, int stream)
+static int dpcm_run_old_update(struct snd_soc_pcm_runtime *fe, int stream,
+			       bool force)
 {
 	int ret;
 
 	dpcm_set_fe_update_state(fe, stream, SND_SOC_DPCM_UPDATE_BE);
-	ret = dpcm_run_update_shutdown(fe, stream);
+	ret = dpcm_run_update_shutdown(fe, stream, force);
 	if (ret < 0)
 		dev_err(fe->dev, "ASoC: failed to shutdown some BEs\n");
 	dpcm_set_fe_update_state(fe, stream, SND_SOC_DPCM_UPDATE_NO);
@@ -2682,7 +2686,8 @@ static int dpcm_run_old_update(struct snd_soc_pcm_runtime *fe, int stream)
 	return ret;
 }
 
-static int soc_dpcm_fe_runtime_update(struct snd_soc_pcm_runtime *fe, int new)
+static int soc_dpcm_fe_runtime_update(struct snd_soc_pcm_runtime *fe, bool new,
+				      bool force_prune)
 {
 	struct snd_soc_dapm_widget_list *list;
 	int count, paths;
@@ -2715,12 +2720,14 @@ static int soc_dpcm_fe_runtime_update(struct snd_soc_pcm_runtime *fe, int new)
 	}
 
 	/* update any playback paths */
-	count = dpcm_process_paths(fe, SNDRV_PCM_STREAM_PLAYBACK, &list, new);
+	count = dpcm_process_paths(fe, SNDRV_PCM_STREAM_PLAYBACK, &list, new,
+				   force_prune);
 	if (count) {
 		if (new)
 			dpcm_run_new_update(fe, SNDRV_PCM_STREAM_PLAYBACK);
 		else
-			dpcm_run_old_update(fe, SNDRV_PCM_STREAM_PLAYBACK);
+			dpcm_run_old_update(fe, SNDRV_PCM_STREAM_PLAYBACK,
+					    force_prune);
 
 		dpcm_clear_pending_state(fe, SNDRV_PCM_STREAM_PLAYBACK);
 		dpcm_be_disconnect(fe, SNDRV_PCM_STREAM_PLAYBACK);
@@ -2746,12 +2753,14 @@ static int soc_dpcm_fe_runtime_update(struct snd_soc_pcm_runtime *fe, int new)
 	}
 
 	/* update any old capture paths */
-	count = dpcm_process_paths(fe, SNDRV_PCM_STREAM_CAPTURE, &list, new);
+	count = dpcm_process_paths(fe, SNDRV_PCM_STREAM_CAPTURE, &list, new,
+				   force_prune);
 	if (count) {
 		if (new)
 			dpcm_run_new_update(fe, SNDRV_PCM_STREAM_CAPTURE);
 		else
-			dpcm_run_old_update(fe, SNDRV_PCM_STREAM_CAPTURE);
+			dpcm_run_old_update(fe, SNDRV_PCM_STREAM_CAPTURE,
+					    force_prune);
 
 		dpcm_clear_pending_state(fe, SNDRV_PCM_STREAM_CAPTURE);
 		dpcm_be_disconnect(fe, SNDRV_PCM_STREAM_CAPTURE);
@@ -2765,25 +2774,46 @@ static int soc_dpcm_fe_runtime_update(struct snd_soc_pcm_runtime *fe, int new)
 /* Called by DAPM mixer/mux changes to update audio routing between PCMs and
  * any DAI links.
  */
-int soc_dpcm_runtime_update(struct snd_soc_card *card)
+int soc_dpcm_runtime_update(struct snd_soc_card *card,
+			    enum snd_soc_dpcm_update_mode mode)
 {
 	struct snd_soc_pcm_runtime *fe;
 	int ret = 0;
 
 	mutex_lock_nested(&card->mutex, SND_SOC_CARD_CLASS_RUNTIME);
+
 	/* shutdown all old paths first */
-	for_each_card_rtds(card, fe) {
-		ret = soc_dpcm_fe_runtime_update(fe, 0);
-		if (ret)
-			goto out;
-	}
+	if (mode != SND_SOC_DPCM_UPDATE_NEW_ONLY)
+		/*
+		 * This is entered if mode == FULL or OLD_ONLY. In both cases we
+		 * have to call soc_dpcm_fe_runtime_update() but only in the
+		 * OLD_ONLY case we have to set the "force" (last) parameter to
+		 * "true."
+		 */
+		for_each_card_rtds(card, fe) {
+			/*
+			 * check "old" paths (new = false), only force for
+			 * shutting down.
+			 */
+			ret = soc_dpcm_fe_runtime_update(fe, false,
+					mode == SND_SOC_DPCM_UPDATE_OLD_ONLY);
+			if (ret)
+				goto out;
+		}
 
 	/* bring new paths up */
-	for_each_card_rtds(card, fe) {
-		ret = soc_dpcm_fe_runtime_update(fe, 1);
-		if (ret)
-			goto out;
-	}
+	if (mode != SND_SOC_DPCM_UPDATE_OLD_ONLY)
+		/*
+		 * This is entered if mode == FULL or NEW_ONLY. In both cases we
+		 * have to call soc_dpcm_fe_runtime_update() with the "force"
+		 * (last) parameter set to "false"
+		 */
+		for_each_card_rtds(card, fe) {
+			/* check "new" paths (new = true), no forcing */
+			ret = soc_dpcm_fe_runtime_update(fe, true, false);
+			if (ret)
+				goto out;
+		}
 
 out:
 	mutex_unlock(&card->mutex);
@@ -2838,7 +2868,7 @@ static int dpcm_fe_dai_open(struct snd_pcm_substream *fe_substream)
 	}
 
 	/* calculate valid and active FE <-> BE dpcms */
-	dpcm_process_paths(fe, stream, &list, 1);
+	dpcm_process_paths(fe, stream, &list, true, false);
 
 	ret = dpcm_fe_dai_startup(fe_substream);
 	if (ret < 0) {
-- 
1.9.3

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
