Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC2F733E2
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jul 2019 18:28:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D62EA1937;
	Wed, 24 Jul 2019 18:27:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D62EA1937
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563985693;
	bh=FEwyRLFYgLKGJ+NujzFC47ZA9QHItK8zzmY5O34E4ss=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ltRub4e7J7ybuf3AmXHqqhmebvxNYszmjDGUe23cDR02fOycaBx6VrpwnE6I77bUp
	 vjE2+B4Y/P0g6at4xrOxOQUDTWnUnMg3U+T356KjkXhtcMJIOiYbsHXcYygQ4wSFAh
	 Y5lkg2LCRKjdId1YMaxEPtjGmbA5hPfQb4nGoaio=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A231F804FF;
	Wed, 24 Jul 2019 18:24:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5540F804CF; Wed, 24 Jul 2019 18:24:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94052F8048E
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 18:24:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94052F8048E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="kumEAPUx"
Received: by mail-wr1-x442.google.com with SMTP id x1so32670359wrr.9
 for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2019 09:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NYbwqma1m9jqmdyH3lyO6cWket2bF1VkY/YuX/cmnIM=;
 b=kumEAPUx7B49kM8BuP59c5fzHEqI89ld6/bXZ9wclNMrmminy+PGmddOmTANEISf/U
 mW0bJLHMrDbnth3oX9Og7HTFcbiDi73QRyYxCu5r3QHVKXc53nxgAOudarnTjjJs2fHe
 LnUt1GR8wHA/aaEGQb7Xvx28Jb352PPcZUBhKcnLBjo+BugP50E+I7aZg75y7y3YJyHS
 BzzvfZpaGurdnxhCp0AcFvLMZIBBI8ob8aIK4KJ/+FlZ8p8tKSovSjTzBcIJVDPlhLEj
 c/fx/W6do9q7Q9UCgrxOqIArBTbdLqubwtgGlXXROGKKX7WjiL64SsHP+XlVPkrML96X
 dLJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NYbwqma1m9jqmdyH3lyO6cWket2bF1VkY/YuX/cmnIM=;
 b=tq4z8zd0xS48PL0IYZBG3B2OlluY5PK8u/SWzZVFmpxOD1Nq/r/i+wICdxsJfDXw2X
 g/EaVw89q3wAMIXNRa+y7AMz37RtIV6QBK3NRJHs7g6mrd/wGWB9FYTQz62bn1VhqRSm
 4LsQ8VJgdF0X/kzos95t3lMHCFz0gDxxHp+f+cfjCIEIXlISrkqMDyYV1hbdLOXvdFbf
 UFLeuaIEM/XUsdWey1yGWAEVLuCC3Yt4qi3gz1dZgWozAooCWfTaqPlIpid42OYV4//3
 F52bLrBbERwk7fNILh+3MaCVjMjppp+XHMYCyUyYZmbFXF8aKWNxjqXKGyhFM6zyQ3bv
 0KGg==
X-Gm-Message-State: APjAAAUH6AQoaGoJCyAAlim1Rrr3exrH5ppqNjf8hoJIOi75K5UD/IR5
 oJ7K2Eb7yk9wVXVN8Aw32RrF5g==
X-Google-Smtp-Source: APXvYqx9Mc3Q8VY1dWRoHo7J46SnH4zpSFciHtF/nlFovtGxl1DJgfQUB5i7Xs03xKhQXhwPkPfqdw==
X-Received: by 2002:adf:edd1:: with SMTP id v17mr4837090wro.348.1563985452644; 
 Wed, 24 Jul 2019 09:24:12 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id f70sm55688960wme.22.2019.07.24.09.24.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 09:24:12 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>
Date: Wed, 24 Jul 2019 18:24:02 +0200
Message-Id: <20190724162405.6574-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190724162405.6574-1-jbrunet@baylibre.com>
References: <20190724162405.6574-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 3/6] ASoC: codec2codec: deal with params when
	necessary
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

When there is an event on codec to codec dai_link, we only need to deal
with params if the event is SND_SOC_DAPM_PRE_PMU, when .hw_params() is
called. For the other events, it is useless.

Also, params does not need to be dynamically allocated as it does not
need to survive the event.

Last, dealing with the codec to codec params just before calling
.hw_params() callbacks give change to either party on the link to alter
params content in .startup(), which might be useful in some cases

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/soc-dapm.c | 81 ++++++++++++++++++++++++++++----------------
 1 file changed, 51 insertions(+), 30 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index d20cd89513a4..aa6e47beaec3 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -3764,25 +3764,12 @@ int snd_soc_dapm_new_controls(struct snd_soc_dapm_context *dapm,
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_new_controls);
 
-static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
-				  struct snd_kcontrol *kcontrol, int event)
+static int
+snd_soc_dai_link_prepare_params(struct snd_soc_dapm_widget *w,
+				struct snd_pcm_hw_params *params,
+				const struct snd_soc_pcm_stream *config)
 {
-	struct snd_soc_dapm_path *path;
-	struct snd_soc_dai *source, *sink;
-	struct snd_soc_pcm_runtime *rtd = w->priv;
-	const struct snd_soc_pcm_stream *config;
-	struct snd_pcm_substream substream;
-	struct snd_pcm_hw_params *params = NULL;
-	struct snd_pcm_runtime *runtime = NULL;
 	unsigned int fmt;
-	int ret = 0;
-
-	config = rtd->dai_link->params + rtd->params_select;
-
-	if (WARN_ON(!config) ||
-	    WARN_ON(list_empty(&w->edges[SND_SOC_DAPM_DIR_OUT]) ||
-		    list_empty(&w->edges[SND_SOC_DAPM_DIR_IN])))
-		return -EINVAL;
 
 	/* Be a little careful as we don't want to overflow the mask array */
 	if (config->formats) {
@@ -3791,26 +3778,41 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 		dev_warn(w->dapm->dev, "ASoC: Invalid format %llx specified\n",
 			 config->formats);
 		fmt = 0;
-	}
 
-	/* Currently very limited parameter selection */
-	params = kzalloc(sizeof(*params), GFP_KERNEL);
-	if (!params) {
-		ret = -ENOMEM;
-		goto out;
+		return -EINVAL;
 	}
-	snd_mask_set(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT), fmt);
 
+	memset(params, 0, sizeof(*params));
+
+	snd_mask_set(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT), fmt);
 	hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE)->min =
 		config->rate_min;
 	hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE)->max =
 		config->rate_max;
-
 	hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS)->min
 		= config->channels_min;
 	hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS)->max
 		= config->channels_max;
 
+	return 0;
+}
+
+static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
+				  struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_dapm_path *path;
+	struct snd_soc_dai *source, *sink;
+	struct snd_soc_pcm_runtime *rtd = w->priv;
+	const struct snd_soc_pcm_stream *config;
+	struct snd_pcm_substream substream;
+	struct snd_pcm_hw_params params;
+	struct snd_pcm_runtime *runtime = NULL;
+	int ret = 0;
+
+	if (WARN_ON(list_empty(&w->edges[SND_SOC_DAPM_DIR_OUT]) ||
+		    list_empty(&w->edges[SND_SOC_DAPM_DIR_IN])))
+		return -EINVAL;
+
 	memset(&substream, 0, sizeof(substream));
 
 	/* Allocate a dummy snd_pcm_runtime for startup() and other ops() */
@@ -3850,27 +3852,47 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 			sink->active++;
 		}
 
+		/*
+		 * Note: getting the config after .startup() gives a chance to
+		 * either party on the link to alter the configuration if
+		 * necessary
+		 */
+		config = rtd->dai_link->params + rtd->params_select;
+		if (WARN_ON(!config)) {
+			dev_err(w->dapm->dev, "ASoC: link config missing\n");
+			ret = -EINVAL;
+			goto out;
+		}
+
+		ret = snd_soc_dai_link_prepare_params(w, &params, config);
+		if (ret < 0) {
+			dev_err(w->dapm->dev, "ASoC: link params prepare failed: %d\n",
+				ret);
+			goto out;
+		}
+
 		substream.stream = SNDRV_PCM_STREAM_CAPTURE;
 		snd_soc_dapm_widget_for_each_source_path(w, path) {
 			source = path->source->priv;
 
-			ret = soc_dai_hw_params(&substream, params, source);
+			ret = soc_dai_hw_params(&substream, &params, source);
 			if (ret < 0)
 				goto out;
 
-			dapm_update_dai_unlocked(&substream, params, source);
+			dapm_update_dai_unlocked(&substream, &params, source);
 		}
 
 		substream.stream = SNDRV_PCM_STREAM_PLAYBACK;
 		snd_soc_dapm_widget_for_each_sink_path(w, path) {
 			sink = path->sink->priv;
 
-			ret = soc_dai_hw_params(&substream, params, sink);
+			ret = soc_dai_hw_params(&substream, &params, sink);
 			if (ret < 0)
 				goto out;
 
-			dapm_update_dai_unlocked(&substream, params, sink);
+			dapm_update_dai_unlocked(&substream, &params, sink);
 		}
+
 		break;
 
 	case SND_SOC_DAPM_POST_PMU:
@@ -3932,7 +3954,6 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 
 out:
 	kfree(runtime);
-	kfree(params);
 	return ret;
 }
 
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
