Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B352733EB
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jul 2019 18:29:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A99561A94;
	Wed, 24 Jul 2019 18:28:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A99561A94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563985770;
	bh=YQuyREemAW5L2wZEsmlSIZXwh3qd/fGhb7ISzTpLV2o=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hgw2CKqjFBhfeXrqCCYaHIbUJ62g3ovY5Mwadjno51xhzFAWScGIsjIB48ZfWYjH3
	 c/J1hTnXGkRR5SYSa4JjDWNShxg5C1DX7CdXolNJez3znr9SSmH1R4ujXl8bM07yw0
	 RWcEiJ0padBCYFliJ/cz5FltsoiXHF3M6gwdbXWk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23B39F8053A;
	Wed, 24 Jul 2019 18:24:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27467F804FF; Wed, 24 Jul 2019 18:24:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD47FF8049A
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 18:24:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD47FF8049A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="rlHioeG5"
Received: by mail-wm1-x341.google.com with SMTP id v19so42200974wmj.5
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 09:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fEqbgC4ffyUrLuttzgUt5FRl7sGgCywNMcNCDLVp0IE=;
 b=rlHioeG5qyt3yeoOQxhVWAqMVyPP0n2aMILs+ua+NsbJkQeFpxaNCtsES2nnR1WgcL
 u1dWYguZGuirOq5oqOQ20cGCnv3YHT98dSsztpl90vskstO72I7GdzdsiaT4Ji3EnNVo
 AVjULroRg0dNK9ZU5nAtvBiziiO8Mgn3AxNB1UCLKArUeTvi/99lA4FgHqtxoO25kK+l
 LJYrbc3Rzc5mm5C4EDSAcqBQ5lPLeluJ9uTv+tEtZePrPS3oT1ZjURDImzU3qi6GUM13
 XTuW56+4SQx01QA1Qs0DgZe7vftG5O8TkpUBFlUnfhT45c5EkUpf/EMeGEUSWxe+aMmK
 +a9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fEqbgC4ffyUrLuttzgUt5FRl7sGgCywNMcNCDLVp0IE=;
 b=CvXmjzdItLfIO9jMVr2TGUeoETsxNCZ9f6kQU7u7ILNqwDUmPAUvSmFjky1GZMw8fh
 fC4JS7K8TSu6EH8zTUbwG6+qQkz5kwTKm2Q7V/dv+LKkCjuewpLSYzyZSqNhLSLWyWJU
 /dKn1egjbLQMKQanOGKPHyMCzjCUf+he9wiS2V6kONRHIVdw+0rgiOJjsh/c9Z3YepQg
 kjrhI+zT1di6vtvN2s6SqTOGYvilttpkNZsF4rVt1XUmOnuIwEQJiP92+ppya3Imo2bU
 m3ovlcWoeBhG44p33Z/FWtrYPhlexbcQMld0TfvxSGMZeaPXZX7wkuhkOLooTOBIIVAL
 sEYA==
X-Gm-Message-State: APjAAAUxDx7+dcu8ApViUF39Q9Gl853ju1dV2hmB6f7hyv9mB1cYHdBo
 X9OtWIgo2hvm5g5FYaKXLuYo1g==
X-Google-Smtp-Source: APXvYqxSy9x4/yh9m90aKp+X1IKThgfUDZfuujmcY54Z1t8ubh/f8nflpp3+bKvgTzgHbRuawy6wJg==
X-Received: by 2002:a7b:cc09:: with SMTP id f9mr77497784wmh.68.1563985454615; 
 Wed, 24 Jul 2019 09:24:14 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id f70sm55688960wme.22.2019.07.24.09.24.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 09:24:13 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Date: Wed, 24 Jul 2019 18:24:04 +0200
Message-Id: <20190724162405.6574-6-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190724162405.6574-1-jbrunet@baylibre.com>
References: <20190724162405.6574-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 5/6] ASoC: codec2codec: remove ephemeral
	variables
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

Now that codec to codec links struct snd_soc_pcm_runtime have lasting pcm
and substreams, let's use them. Alsa allocate and keep the
struct snd_pcm_runtime as long as the link is powered.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/soc-dapm.c | 86 ++++++++++++++++++++++++--------------------
 1 file changed, 48 insertions(+), 38 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index aa6e47beaec3..e0eedff5fe94 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -3802,48 +3802,45 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_dapm_path *path;
 	struct snd_soc_dai *source, *sink;
-	struct snd_soc_pcm_runtime *rtd = w->priv;
 	const struct snd_soc_pcm_stream *config;
-	struct snd_pcm_substream substream;
+	struct snd_pcm_substream *substream = w->priv;
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_pcm_hw_params params;
 	struct snd_pcm_runtime *runtime = NULL;
-	int ret = 0;
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
-		substream.stream = SNDRV_PCM_STREAM_CAPTURE;
+		runtime = kzalloc(sizeof(*runtime), GFP_KERNEL);
+		if (!runtime) {
+			ret = -ENOMEM;
+			goto out;
+		}
+		substream->runtime = runtime;
+
+		substream->stream = SNDRV_PCM_STREAM_CAPTURE;
 		snd_soc_dapm_widget_for_each_source_path(w, path) {
 			source = path->source->priv;
 
-			ret = snd_soc_dai_startup(source, &substream);
+			ret = snd_soc_dai_startup(source, substream);
 			if (ret < 0) {
 				dev_err(source->dev,
 					"ASoC: startup() failed: %d\n", ret);
 				goto out;
+
 			}
 			source->active++;
 		}
 
-		substream.stream = SNDRV_PCM_STREAM_PLAYBACK;
+		substream->stream = SNDRV_PCM_STREAM_PLAYBACK;
 		snd_soc_dapm_widget_for_each_sink_path(w, path) {
 			sink = path->sink->priv;
 
-			ret = snd_soc_dai_startup(sink, &substream);
+			ret = snd_soc_dai_startup(sink, substream);
 			if (ret < 0) {
 				dev_err(sink->dev,
 					"ASoC: startup() failed: %d\n", ret);
@@ -3852,6 +3849,8 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 			sink->active++;
 		}
 
+		substream->hw_opened = 1;
+
 		/*
 		 * Note: getting the config after .startup() gives a chance to
 		 * either party on the link to alter the configuration if
@@ -3871,26 +3870,26 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 			goto out;
 		}
 
-		substream.stream = SNDRV_PCM_STREAM_CAPTURE;
+		substream->stream = SNDRV_PCM_STREAM_CAPTURE;
 		snd_soc_dapm_widget_for_each_source_path(w, path) {
 			source = path->source->priv;
 
-			ret = soc_dai_hw_params(&substream, &params, source);
+			ret = soc_dai_hw_params(substream, &params, source);
 			if (ret < 0)
 				goto out;
 
-			dapm_update_dai_unlocked(&substream, &params, source);
+			dapm_update_dai_unlocked(substream, &params, source);
 		}
 
-		substream.stream = SNDRV_PCM_STREAM_PLAYBACK;
+		substream->stream = SNDRV_PCM_STREAM_PLAYBACK;
 		snd_soc_dapm_widget_for_each_sink_path(w, path) {
 			sink = path->sink->priv;
 
-			ret = soc_dai_hw_params(&substream, &params, sink);
+			ret = soc_dai_hw_params(substream, &params, sink);
 			if (ret < 0)
 				goto out;
 
-			dapm_update_dai_unlocked(&substream, &params, sink);
+			dapm_update_dai_unlocked(substream, &params, sink);
 		}
 
 		break;
@@ -3920,40 +3919,45 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
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
 
@@ -4076,9 +4080,11 @@ snd_soc_dapm_alloc_kcontrol(struct snd_soc_card *card,
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
@@ -4097,7 +4103,7 @@ snd_soc_dapm_new_dai(struct snd_soc_card *card, struct snd_soc_pcm_runtime *rtd,
 	template.name = link_name;
 	template.event = snd_soc_dai_link_event;
 	template.event_flags = SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
-		SND_SOC_DAPM_PRE_PMD;
+		SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD;
 	template.kcontrol_news = NULL;
 
 	/* allocate memory for control, only in case of multiple configs */
@@ -4132,7 +4138,7 @@ snd_soc_dapm_new_dai(struct snd_soc_card *card, struct snd_soc_pcm_runtime *rtd,
 		goto outfree_kcontrol_news;
 	}
 
-	w->priv = rtd;
+	w->priv = substream;
 
 	return w;
 
@@ -4254,6 +4260,8 @@ static void dapm_connect_dai_link_widgets(struct snd_soc_card *card,
 	struct snd_soc_dai *codec_dai;
 	struct snd_soc_dapm_widget *playback = NULL, *capture = NULL;
 	struct snd_soc_dapm_widget *codec, *playback_cpu, *capture_cpu;
+	struct snd_pcm_substream *substream;
+	struct snd_pcm_str *streams = rtd->pcm->streams;
 	int i;
 
 	if (rtd->dai_link->params) {
@@ -4272,7 +4280,8 @@ static void dapm_connect_dai_link_widgets(struct snd_soc_card *card,
 
 		if (playback_cpu && codec) {
 			if (!playback) {
-				playback = snd_soc_dapm_new_dai(card, rtd,
+				substream = streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
+				playback = snd_soc_dapm_new_dai(card, substream,
 								"playback");
 				if (IS_ERR(playback)) {
 					dev_err(rtd->dev,
@@ -4301,7 +4310,8 @@ static void dapm_connect_dai_link_widgets(struct snd_soc_card *card,
 
 		if (codec && capture_cpu) {
 			if (!capture) {
-				capture = snd_soc_dapm_new_dai(card, rtd,
+				substream = streams[SNDRV_PCM_STREAM_CAPTURE].substream;
+				capture = snd_soc_dapm_new_dai(card, substream,
 							       "capture");
 				if (IS_ERR(capture)) {
 					dev_err(rtd->dev,
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
