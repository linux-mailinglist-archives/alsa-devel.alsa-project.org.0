Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF2A19D355
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Apr 2020 11:16:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5DA9167E;
	Fri,  3 Apr 2020 11:16:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5DA9167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585905415;
	bh=18cmdcsavEJu+y3krSDuICuSEtd8l5Sqd3zMcblpaiM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KAjxis7TXggXu5zMgBJEgpHKMgfq+9WM5kT8Q6FrxrafD4X1at6wMRYYdAEx+U89e
	 iLJkzQWuslEXOoG2AUBoU4004FPf4pOBKFCF/o15mDGMG0F/fSNuk1WqerzYz0qNaP
	 ZhQcfU6/uXpJ0RTW4v+vgpW0fKR+psx6tIvNJtKQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06870F8029B;
	Fri,  3 Apr 2020 11:14:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B150DF8022D; Fri,  3 Apr 2020 11:14:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12BBAF8014B;
 Fri,  3 Apr 2020 11:14:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12BBAF8014B
IronPort-SDR: 1yHZ4/dduQu7AQ1oBtmyVSWX6QtHXB5OuRtL74h9NJrBaCQtSnQQAeol5BQ2VuCyuogU2Jh2dd
 dt1NYFSB0P0Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2020 02:14:11 -0700
IronPort-SDR: dGfpVXh1xMKrFFFUX5859hqKK68SVzcYKkk8vDaYme1fnl6lg8MIJqPJ45QmsTHCm4cEZ7vwu9
 dhDR8XyR2MZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,339,1580803200"; d="scan'208";a="451234928"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO
 ubuntu.ger.corp.intel.com) ([10.249.36.113])
 by fmsmga006.fm.intel.com with ESMTP; 03 Apr 2020 02:14:09 -0700
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 01/12] [RESEND] ASoC: add function parameters to enable
 forced path pruning
Date: Fri,  3 Apr 2020 11:13:55 +0200
Message-Id: <20200403091406.22381-2-guennadi.liakhovetski@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200403091406.22381-1-guennadi.liakhovetski@linux.intel.com>
References: <20200403091406.22381-1-guennadi.liakhovetski@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 sound-open-firmware@alsa-project.org
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
 include/sound/soc-dpcm.h | 28 ++++++++++++++++----
 sound/soc/soc-compress.c |  2 +-
 sound/soc/soc-dapm.c     |  8 +++---
 sound/soc/soc-pcm.c      | 67 +++++++++++++++++++++++++++++++++---------------
 4 files changed, 74 insertions(+), 31 deletions(-)

diff --git a/include/sound/soc-dpcm.h b/include/sound/soc-dpcm.h
index 0f6c50b..b961c06 100644
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
@@ -133,7 +150,8 @@ struct snd_pcm_substream *
 	snd_soc_dpcm_get_substream(struct snd_soc_pcm_runtime *be, int stream);
 
 /* update audio routing between PCMs and any DAI links */
-int snd_soc_dpcm_runtime_update(struct snd_soc_card *card);
+int snd_soc_dpcm_runtime_update(struct snd_soc_card *card,
+				enum snd_soc_dpcm_update_mode mode);
 
 #ifdef CONFIG_DEBUG_FS
 void soc_dpcm_debugfs_add(struct snd_soc_pcm_runtime *rtd);
@@ -143,11 +161,11 @@ static inline void soc_dpcm_debugfs_add(struct snd_soc_pcm_runtime *rtd)
 }
 #endif
 
-int dpcm_path_get(struct snd_soc_pcm_runtime *fe,
-	int stream, struct snd_soc_dapm_widget_list **list_);
+int dpcm_path_get(struct snd_soc_pcm_runtime *fe, int stream,
+	struct snd_soc_dapm_widget_list **list_);
 void dpcm_path_put(struct snd_soc_dapm_widget_list **list);
-int dpcm_process_paths(struct snd_soc_pcm_runtime *fe,
-	int stream, struct snd_soc_dapm_widget_list **list, int new);
+int dpcm_process_paths(struct snd_soc_pcm_runtime *fe, int stream,
+	struct snd_soc_dapm_widget_list **list, bool new, bool force_prune);
 int dpcm_be_dai_startup(struct snd_soc_pcm_runtime *fe, int stream);
 int dpcm_be_dai_shutdown(struct snd_soc_pcm_runtime *fe, int stream);
 void dpcm_be_disconnect(struct snd_soc_pcm_runtime *fe, int stream);
diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index 50062eb..66d7e78 100644
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
index 679ed60..a6dd99e 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -2297,7 +2297,7 @@ int snd_soc_dapm_mux_update_power(struct snd_soc_dapm_context *dapm,
 	card->update = NULL;
 	mutex_unlock(&card->dapm_mutex);
 	if (ret > 0)
-		snd_soc_dpcm_runtime_update(card);
+		snd_soc_dpcm_runtime_update(card, SND_SOC_DPCM_UPDATE_FULL);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_mux_update_power);
@@ -2362,7 +2362,7 @@ int snd_soc_dapm_mixer_update_power(struct snd_soc_dapm_context *dapm,
 	card->update = NULL;
 	mutex_unlock(&card->dapm_mutex);
 	if (ret > 0)
-		snd_soc_dpcm_runtime_update(card);
+		snd_soc_dpcm_runtime_update(card, SND_SOC_DPCM_UPDATE_FULL);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_mixer_update_power);
@@ -3402,7 +3402,7 @@ int snd_soc_dapm_put_volsw(struct snd_kcontrol *kcontrol,
 	mutex_unlock(&card->dapm_mutex);
 
 	if (ret > 0)
-		snd_soc_dpcm_runtime_update(card);
+		snd_soc_dpcm_runtime_update(card, SND_SOC_DPCM_UPDATE_FULL);
 
 	return change;
 }
@@ -3507,7 +3507,7 @@ int snd_soc_dapm_put_enum_double(struct snd_kcontrol *kcontrol,
 	mutex_unlock(&card->dapm_mutex);
 
 	if (ret > 0)
-		snd_soc_dpcm_runtime_update(card);
+		snd_soc_dpcm_runtime_update(card, SND_SOC_DPCM_UPDATE_FULL);
 
 	return change;
 }
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 289aebc..1a841e8 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1530,14 +1530,14 @@ static bool dpcm_be_is_active(struct snd_soc_dpcm *dpcm, int stream,
 }
 
 static int dpcm_prune_paths(struct snd_soc_pcm_runtime *fe, int stream,
-			    struct snd_soc_dapm_widget_list **list_)
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
@@ -1612,12 +1612,13 @@ static int dpcm_add_paths(struct snd_soc_pcm_runtime *fe, int stream,
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
@@ -2613,11 +2614,13 @@ static int dpcm_fe_dai_prepare(struct snd_pcm_substream *substream)
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
@@ -2649,7 +2652,7 @@ static int dpcm_run_update_shutdown(struct snd_soc_pcm_runtime *fe, int stream)
 		dev_err(fe->dev,"ASoC: shutdown FE failed %d\n", err);
 
 	/* run the stream event for each BE */
-	dpcm_dapm_stream_event(fe, stream, SND_SOC_DAPM_STREAM_NOP);
+	dpcm_dapm_stream_event(fe, stream, event);
 
 	return 0;
 }
@@ -2742,7 +2745,8 @@ static int dpcm_run_update_startup(struct snd_soc_pcm_runtime *fe, int stream)
 	return ret;
 }
 
-static int soc_dpcm_fe_runtime_update(struct snd_soc_pcm_runtime *fe, int new)
+static int soc_dpcm_fe_runtime_update(struct snd_soc_pcm_runtime *fe, bool new,
+				      bool force_prune)
 {
 	struct snd_soc_dapm_widget_list *list;
 	int stream;
@@ -2788,13 +2792,13 @@ static int soc_dpcm_fe_runtime_update(struct snd_soc_pcm_runtime *fe, int new)
 		}
 
 		/* update any playback/capture paths */
-		count = dpcm_process_paths(fe, stream, &list, new);
+		count = dpcm_process_paths(fe, stream, &list, new, force_prune);
 		if (count) {
 			dpcm_set_fe_update_state(fe, stream, SND_SOC_DPCM_UPDATE_BE);
 			if (new)
 				ret = dpcm_run_update_startup(fe, stream);
 			else
-				ret = dpcm_run_update_shutdown(fe, stream);
+				ret = dpcm_run_update_shutdown(fe, stream, force_prune);
 			if (ret < 0)
 				dev_err(fe->dev, "ASoC: failed to shutdown some BEs\n");
 			dpcm_set_fe_update_state(fe, stream, SND_SOC_DPCM_UPDATE_NO);
@@ -2812,25 +2816,46 @@ static int soc_dpcm_fe_runtime_update(struct snd_soc_pcm_runtime *fe, int new)
 /* Called by DAPM mixer/mux changes to update audio routing between PCMs and
  * any DAI links.
  */
-int snd_soc_dpcm_runtime_update(struct snd_soc_card *card)
+int snd_soc_dpcm_runtime_update(struct snd_soc_card *card,
+				enum snd_soc_dpcm_update_mode mode)
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
@@ -2886,7 +2911,7 @@ static int dpcm_fe_dai_open(struct snd_pcm_substream *fe_substream)
 	}
 
 	/* calculate valid and active FE <-> BE dpcms */
-	dpcm_process_paths(fe, stream, &list, 1);
+	dpcm_process_paths(fe, stream, &list, true, false);
 
 	ret = dpcm_fe_dai_startup(fe_substream);
 	if (ret < 0)
-- 
1.9.3

