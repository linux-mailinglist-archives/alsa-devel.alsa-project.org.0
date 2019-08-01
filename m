Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 089627DC77
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2019 15:24:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F34E16AF;
	Thu,  1 Aug 2019 15:23:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F34E16AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564665882;
	bh=tZVc5g95HJHveTY6mjk6KJiwEuC4W9ZWdoQbD4izCq0=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=UezGwosB0aJoVpQvbrwE9tpxjevIb42PJyUtxIS/p4dmdzUFClQVbRt+S6tYNKrlg
	 SjEEKeQW1b3z22gSlgeLnb9ZMKEmRL8WBcLxxs65TqEYfNW3ZlV/AYJqOyPURXRrpA
	 HiQ+M8BipC0KIlSfFkiP35N059OAZ0BDKXCIQBdg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89648F80527;
	Thu,  1 Aug 2019 15:23:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 121FEF804FD; Thu,  1 Aug 2019 15:20:54 +0200 (CEST)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 228D8F80527
 for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2019 15:10:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 228D8F80527
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="D0wRGNLx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=yt/S/eLXPax0RaHMCPV+686Z6HNMhsr3yQ9vBPcPgRo=; b=D0wRGNLxuXnX
 n9HAo7KYFVQBuuRAVNuG4B98UAwKz7LqJGBZnf5oHCQtCSPER8xvB1dfpyiQV1yTz6U/LbAOed1hg
 8nt8YQB7wix7Szfx6U7xaaX5nK2UqMbBJwcu9NsHBAZtLZi3lgzBVqHM6+peU559y0FVSwvfZNMVW
 0eVDE=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1htAqv-0004iv-1Z; Thu, 01 Aug 2019 13:10:41 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 6D0F12742D9A; Thu,  1 Aug 2019 14:10:40 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20190725165949.29699-6-jbrunet@baylibre.com>
X-Patchwork-Hint: ignore
Message-Id: <20190801131040.6D0F12742D9A@ypsilon.sirena.org.uk>
Date: Thu,  1 Aug 2019 14:10:40 +0100 (BST)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-amlogic@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: codec2codec: remove ephemeral
	variables" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: codec2codec: remove ephemeral variables

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From a72706ed8208ac3f72d1c3ebbc6509e368b0dcb0 Mon Sep 17 00:00:00 2001
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 25 Jul 2019 18:59:48 +0200
Subject: [PATCH] ASoC: codec2codec: remove ephemeral variables

Now that codec to codec links struct snd_soc_pcm_runtime have lasting pcm
and substreams, let's use them. Alsa allocate and keep the
struct snd_pcm_runtime as long as the link is powered.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Link: https://lore.kernel.org/r/20190725165949.29699-6-jbrunet@baylibre.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-dapm.c | 72 ++++++++++++++++++++++++++------------------
 1 file changed, 42 insertions(+), 30 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 2d183e2d23de..1c953a1b46ce 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -3775,6 +3775,7 @@ snd_soc_dai_link_event_pre_pmu(struct snd_soc_dapm_widget *w,
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_pcm_hw_params *params = NULL;
 	const struct snd_soc_pcm_stream *config = NULL;
+	struct snd_pcm_runtime *runtime = NULL;
 	unsigned int fmt;
 	int ret = 0;
 
@@ -3782,6 +3783,14 @@ snd_soc_dai_link_event_pre_pmu(struct snd_soc_dapm_widget *w,
 	if (!params)
 		return -ENOMEM;
 
+	runtime = kzalloc(sizeof(*runtime), GFP_KERNEL);
+	if (!runtime) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	substream->runtime = runtime;
+
 	substream->stream = SNDRV_PCM_STREAM_CAPTURE;
 	snd_soc_dapm_widget_for_each_source_path(w, path) {
 		source = path->source->priv;
@@ -3808,6 +3817,8 @@ snd_soc_dai_link_event_pre_pmu(struct snd_soc_dapm_widget *w,
 		sink->active++;
 	}
 
+	substream->hw_opened = 1;
+
 	/*
 	 * Note: getting the config after .startup() gives a chance to
 	 * either party on the link to alter the configuration if
@@ -3864,6 +3875,9 @@ snd_soc_dai_link_event_pre_pmu(struct snd_soc_dapm_widget *w,
 	}
 
 out:
+	if (ret < 0)
+		kfree(runtime);
+
 	kfree(params);
 	return ret;
 }
@@ -3873,29 +3887,16 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_dapm_path *path;
 	struct snd_soc_dai *source, *sink;
-	struct snd_soc_pcm_runtime *rtd = w->priv;
-	struct snd_pcm_substream substream;
-	struct snd_pcm_runtime *runtime = NULL;
-	int ret = 0;
+	struct snd_pcm_substream *substream = w->priv;
+	int ret = 0, saved_stream = substream->stream;
 
 	if (WARN_ON(list_empty(&w->edges[SND_SOC_DAPM_DIR_OUT]) ||
 		    list_empty(&w->edges[SND_SOC_DAPM_DIR_IN])))
 		return -EINVAL;
 
-	memset(&substream, 0, sizeof(substream));
-
-	/* Allocate a dummy snd_pcm_runtime for startup() and other ops() */
-	runtime = kzalloc(sizeof(*runtime), GFP_KERNEL);
-	if (!runtime) {
-		ret = -ENOMEM;
-		goto out;
-	}
-	substream.runtime = runtime;
-	substream.private_data = rtd;
-
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		ret = snd_soc_dai_link_event_pre_pmu(w, &substream);
+		ret = snd_soc_dai_link_event_pre_pmu(w, substream);
 		if (ret < 0)
 			goto out;
 
@@ -3926,40 +3927,45 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 			ret = 0;
 		}
 
-		substream.stream = SNDRV_PCM_STREAM_CAPTURE;
+		substream->stream = SNDRV_PCM_STREAM_CAPTURE;
 		snd_soc_dapm_widget_for_each_source_path(w, path) {
 			source = path->source->priv;
-			snd_soc_dai_hw_free(source, &substream);
+			snd_soc_dai_hw_free(source, substream);
 		}
 
-		substream.stream = SNDRV_PCM_STREAM_PLAYBACK;
+		substream->stream = SNDRV_PCM_STREAM_PLAYBACK;
 		snd_soc_dapm_widget_for_each_sink_path(w, path) {
 			sink = path->sink->priv;
-			snd_soc_dai_hw_free(sink, &substream);
+			snd_soc_dai_hw_free(sink, substream);
 		}
 
-		substream.stream = SNDRV_PCM_STREAM_CAPTURE;
+		substream->stream = SNDRV_PCM_STREAM_CAPTURE;
 		snd_soc_dapm_widget_for_each_source_path(w, path) {
 			source = path->source->priv;
 			source->active--;
-			snd_soc_dai_shutdown(source, &substream);
+			snd_soc_dai_shutdown(source, substream);
 		}
 
-		substream.stream = SNDRV_PCM_STREAM_PLAYBACK;
+		substream->stream = SNDRV_PCM_STREAM_PLAYBACK;
 		snd_soc_dapm_widget_for_each_sink_path(w, path) {
 			sink = path->sink->priv;
 			sink->active--;
-			snd_soc_dai_shutdown(sink, &substream);
+			snd_soc_dai_shutdown(sink, substream);
 		}
 		break;
 
+	case SND_SOC_DAPM_POST_PMD:
+		kfree(substream->runtime);
+		break;
+
 	default:
 		WARN(1, "Unknown event %d\n", event);
 		ret = -EINVAL;
 	}
 
 out:
-	kfree(runtime);
+	/* Restore the substream direction */
+	substream->stream = saved_stream;
 	return ret;
 }
 
@@ -4082,9 +4088,11 @@ snd_soc_dapm_alloc_kcontrol(struct snd_soc_card *card,
 }
 
 static struct snd_soc_dapm_widget *
-snd_soc_dapm_new_dai(struct snd_soc_card *card, struct snd_soc_pcm_runtime *rtd,
+snd_soc_dapm_new_dai(struct snd_soc_card *card,
+		     struct snd_pcm_substream *substream,
 		     char *id)
 {
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_dapm_widget template;
 	struct snd_soc_dapm_widget *w;
 	const char **w_param_text;
@@ -4103,7 +4111,7 @@ snd_soc_dapm_new_dai(struct snd_soc_card *card, struct snd_soc_pcm_runtime *rtd,
 	template.name = link_name;
 	template.event = snd_soc_dai_link_event;
 	template.event_flags = SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
-		SND_SOC_DAPM_PRE_PMD;
+		SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD;
 	template.kcontrol_news = NULL;
 
 	/* allocate memory for control, only in case of multiple configs */
@@ -4138,7 +4146,7 @@ snd_soc_dapm_new_dai(struct snd_soc_card *card, struct snd_soc_pcm_runtime *rtd,
 		goto outfree_kcontrol_news;
 	}
 
-	w->priv = rtd;
+	w->priv = substream;
 
 	return w;
 
@@ -4260,6 +4268,8 @@ static void dapm_connect_dai_link_widgets(struct snd_soc_card *card,
 	struct snd_soc_dai *codec_dai;
 	struct snd_soc_dapm_widget *playback = NULL, *capture = NULL;
 	struct snd_soc_dapm_widget *codec, *playback_cpu, *capture_cpu;
+	struct snd_pcm_substream *substream;
+	struct snd_pcm_str *streams = rtd->pcm->streams;
 	int i;
 
 	if (rtd->dai_link->params) {
@@ -4278,7 +4288,8 @@ static void dapm_connect_dai_link_widgets(struct snd_soc_card *card,
 
 		if (playback_cpu && codec) {
 			if (!playback) {
-				playback = snd_soc_dapm_new_dai(card, rtd,
+				substream = streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
+				playback = snd_soc_dapm_new_dai(card, substream,
 								"playback");
 				if (IS_ERR(playback)) {
 					dev_err(rtd->dev,
@@ -4307,7 +4318,8 @@ static void dapm_connect_dai_link_widgets(struct snd_soc_card *card,
 
 		if (codec && capture_cpu) {
 			if (!capture) {
-				capture = snd_soc_dapm_new_dai(card, rtd,
+				substream = streams[SNDRV_PCM_STREAM_CAPTURE].substream;
+				capture = snd_soc_dapm_new_dai(card, substream,
 							       "capture");
 				if (IS_ERR(capture)) {
 					dev_err(rtd->dev,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
