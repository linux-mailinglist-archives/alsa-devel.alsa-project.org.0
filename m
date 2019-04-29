Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A90E3D3
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Apr 2019 15:33:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCCCB857;
	Mon, 29 Apr 2019 15:32:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCCCB857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556544829;
	bh=rPw91l/SJw8PBTzfaFAG52M3hioW0lFvxaYPoBEw4ec=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KgxEzIjhR3veE9eLXD9KA+uFcsmuqWwPCDMLV20UK3LCGnrbXeJ9IhUUHE6+yNOXT
	 aDGFY+oOL7sZTptsPngfFq0NHhYrpzzhXzoDsasw5L6p6roO/tH4hjuy1P82R8XpvP
	 MiOkzO1QZw6NhivHGSHSCbHlMoWBzVcKlu/DCIsA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87C86F8972E;
	Mon, 29 Apr 2019 15:30:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B487FF896CB; Mon, 29 Apr 2019 15:29:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C1DBF80641
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 15:29:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C1DBF80641
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="C4SN6Sjb"
Received: by mail-wm1-x344.google.com with SMTP id j13so14195394wmh.2
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 06:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hd6mJetFt+bYMfDoxeUlaN2SLCfgBvFwtxKuQlMcFOY=;
 b=C4SN6SjbEVh9brvwWa9I0k53I0+eUkzThi7Z4tRSiWcMVwsyOZkS2Ri2zTPFrRU1hA
 EX/Qwh90q+DdtDX5XD3rlaN050hOPFVqbmNEVbyos3JbwA6mzccSmjWIaZPBUpywAIPb
 +n0lfVLB+RwIP/HVA+qrZJlAooCK1oDs9FWOJ/UH1ymIGBpoFQJcmHKkt34UQ6B/S5M1
 qakEvdkdQC1+yhn3HOWd4JlDgMDcPRolzMqRbMQzZhlFoFyM2+m045V8Tze+YtdDT7hQ
 RH8eFWekONdGWfyo9zvBOhVFQmPyzzQt+1SuV6+7hosSTQVBEy+lVvumrFEhB2BWSJvV
 AbTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hd6mJetFt+bYMfDoxeUlaN2SLCfgBvFwtxKuQlMcFOY=;
 b=Kd1Jju3NYwDr9uQLlHVdUApiX4Xi2qj9pszRKWn9D7RQyDnZKuOpvryXmauc/6Waco
 hotHmnjLetpibiH0LWpDEbs1LWu+7f+gJF2oeetqrXg+d224ZSruF7GMuL2bQxnyo3X9
 b4S9idsqcd62+rE1jrlICG4shwMxftv11el/4IQ2Q5xbK50Q8UzU1ifCgCczjAlYvihP
 qtun4YB/Bcb0htRnjYSwmI0K0fJEXvXBD8YCK9jcFv4kdfrhr8yrNiwun35TZVSvQmqR
 nCX3cEaSv3d8IeJkMWQYaVwZA5j9UIAUavWSakolbHguM0CUVduENd7uZ2D2Cxq0R41F
 xgng==
X-Gm-Message-State: APjAAAWsnsqckawoMPlyfWz059/SKK7dzWXgkx15edJ26Eg8f1xiRdK8
 0Lr8UQ9LwsFpoCYu2lMBucvSWg==
X-Google-Smtp-Source: APXvYqxbSL2cfvOi7tkjEEW2XPKHTx8LzMHgfHwDAxQTBNK2aCvrCQgBr3M74UAUFrHy88HSqn8nCA==
X-Received: by 2002:a1c:3845:: with SMTP id f66mr16599583wma.97.1556544592685; 
 Mon, 29 Apr 2019 06:29:52 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id s17sm2857593wra.94.2019.04.29.06.29.51
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Apr 2019 06:29:52 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Mon, 29 Apr 2019 15:29:41 +0200
Message-Id: <20190429132943.16269-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190429132943.16269-1-jbrunet@baylibre.com>
References: <20190429132943.16269-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Cc: patchwork-bot+notify@kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 4/6] ASoC: hdmi-codec: remove reference to the
	current substream
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

If the hdmi-codec is on a codec-to-codec link, the substream pointer
it receives is completely made up by snd_soc_dai_link_event().
The pointer will be different between startup() and shutdown().

The hdmi-codec complains when this happens even if it is not really a
problem. The current_substream pointer is not used for anything useful
apart from getting the exclusive ownership of the device.

Remove current_substream pointer and replace the exclusive locking
mechanism with a simple variable and some atomic operations.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/codecs/hdmi-codec.c | 58 ++++++++++-------------------------
 1 file changed, 16 insertions(+), 42 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 780f2008b271..717d0949f8b4 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -280,11 +280,10 @@ struct hdmi_codec_priv {
 	struct hdmi_codec_pdata hcd;
 	struct snd_soc_dai_driver *daidrv;
 	struct hdmi_codec_daifmt daifmt[2];
-	struct mutex current_stream_lock;
-	struct snd_pcm_substream *current_stream;
 	uint8_t eld[MAX_ELD_BYTES];
 	struct snd_pcm_chmap *chmap_info;
 	unsigned int chmap_idx;
+	unsigned long busy;
 };
 
 static const struct snd_soc_dapm_widget hdmi_widgets[] = {
@@ -392,42 +391,22 @@ static int hdmi_codec_chmap_ctl_get(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
-static int hdmi_codec_new_stream(struct snd_pcm_substream *substream,
-				 struct snd_soc_dai *dai)
-{
-	struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
-	int ret = 0;
-
-	mutex_lock(&hcp->current_stream_lock);
-	if (!hcp->current_stream) {
-		hcp->current_stream = substream;
-	} else if (hcp->current_stream != substream) {
-		dev_err(dai->dev, "Only one simultaneous stream supported!\n");
-		ret = -EINVAL;
-	}
-	mutex_unlock(&hcp->current_stream_lock);
-
-	return ret;
-}
-
 static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 			      struct snd_soc_dai *dai)
 {
 	struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
 	int ret = 0;
 
-	ret = hdmi_codec_new_stream(substream, dai);
-	if (ret)
-		return ret;
+	ret = test_and_set_bit(0, &hcp->busy);
+	if (ret) {
+		dev_err(dai->dev, "Only one simultaneous stream supported!\n");
+		return -EINVAL;
+	}
 
 	if (hcp->hcd.ops->audio_startup) {
 		ret = hcp->hcd.ops->audio_startup(dai->dev->parent, hcp->hcd.data);
-		if (ret) {
-			mutex_lock(&hcp->current_stream_lock);
-			hcp->current_stream = NULL;
-			mutex_unlock(&hcp->current_stream_lock);
-			return ret;
-		}
+		if (ret)
+			goto err;
 	}
 
 	if (hcp->hcd.ops->get_eld) {
@@ -437,17 +416,18 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 		if (!ret) {
 			ret = snd_pcm_hw_constraint_eld(substream->runtime,
 							hcp->eld);
-			if (ret) {
-				mutex_lock(&hcp->current_stream_lock);
-				hcp->current_stream = NULL;
-				mutex_unlock(&hcp->current_stream_lock);
-				return ret;
-			}
+			if (ret)
+				goto err;
 		}
 		/* Select chmap supported */
 		hdmi_codec_eld_chmap(hcp);
 	}
 	return 0;
+
+err:
+	/* Release the exclusive lock on error */
+	clear_bit(0, &hcp->busy);
+	return ret;
 }
 
 static void hdmi_codec_shutdown(struct snd_pcm_substream *substream,
@@ -455,14 +435,10 @@ static void hdmi_codec_shutdown(struct snd_pcm_substream *substream,
 {
 	struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
 
-	WARN_ON(hcp->current_stream != substream);
-
 	hcp->chmap_idx = HDMI_CODEC_CHMAP_IDX_UNKNOWN;
 	hcp->hcd.ops->audio_shutdown(dai->dev->parent, hcp->hcd.data);
 
-	mutex_lock(&hcp->current_stream_lock);
-	hcp->current_stream = NULL;
-	mutex_unlock(&hcp->current_stream_lock);
+	clear_bit(0, &hcp->busy);
 }
 
 static int hdmi_codec_hw_params(struct snd_pcm_substream *substream,
@@ -766,8 +742,6 @@ static int hdmi_codec_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	hcp->hcd = *hcd;
-	mutex_init(&hcp->current_stream_lock);
-
 	hcp->daidrv = devm_kcalloc(dev, dai_count, sizeof(*hcp->daidrv),
 				   GFP_KERNEL);
 	if (!hcp->daidrv)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
