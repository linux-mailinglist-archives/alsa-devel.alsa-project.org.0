Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FFD14809
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 12:01:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D2AA1863;
	Mon,  6 May 2019 12:00:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D2AA1863
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557136894;
	bh=vMotRJXZ7dPOCtlzU2iglbyQnGVVRnEngVHW/6QQC24=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XmL9H1jB5fqyZRcjKYkCxsf5UpY/KfSbEhFkCykv++7di265+2UyEMecOrGiW1ViQ
	 TsL3kzLZgUwEfmJ88IenWohN1HbnK13WuPARF/lo75BBXs7aDn++bu78W3tz3lS3Nh
	 TA9C6ELiaH7wdrCAT3n8ECr0QVC2AiNn77RGW36I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6362F8972C;
	Mon,  6 May 2019 11:58:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 829BCF89705; Mon,  6 May 2019 11:58:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93AC5F8963C
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 11:58:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93AC5F8963C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="WouC9aTp"
Received: by mail-wm1-x342.google.com with SMTP id m20so5063123wmg.1
 for <alsa-devel@alsa-project.org>; Mon, 06 May 2019 02:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jFAZLM2HXuFCxb/qpIKx/Zvd6z+9jBXknwydcf65Gow=;
 b=WouC9aTpP+JbWnMYvxrFG/C6chBDo+e5JZjiNsYqbm1PNvq2E6DI/tdFgRaefTjk7i
 dNjc79J6JQivuiOzumg4tKN6nqc9pthH/ZXoBubgM1z73EO/P6ZuoANyqjt8AFGtzrox
 Vql+EhiR33zOisnT0IV4X/4e/92L5bH6IDmnx+zE3q6H5MoMovyn0VzUkQNR0OE90imA
 eT4RaWKVBYJJ80/h7P2uUdpWyPEvjwJ/iuM/hwMegTQpfDHfRPtK0uzeM1OoO9aVsaLZ
 trtYy11H5oiseOjLJjgK+D80szm9pmKtydFxdC4+PqhUTs3pbDpBur1EV1ejfQ49DpP6
 S0BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jFAZLM2HXuFCxb/qpIKx/Zvd6z+9jBXknwydcf65Gow=;
 b=QIzy64MI43kjaeVJrr1Vyd607WvIt7NerNKqhqeiaOjEoub0Axmp5I1Jrq91erhp+l
 J9BCHisRH8V3V+YyF+U9//exJ9E6yBQ4QuKiM/Fet32U5m0zYuRIZ1NqD1aI6YgUqst2
 Rybh5qMevndhN/uNLRImCWuUu2ZibsyPxSBjFUL3qbN5S4kzNtABuMATSeuI/Qrby0ed
 CF6PBL9vF2MPdYikR9ApTGGkB2ccHCPW4cQ0DCIw4PFKZJJ1mAwDhhTo4Afe/lQW6+xj
 X3oJHeEbmbrrUQLC1+ZFja4h48yEvJC999xaGIUSfS6IUXcmOK0MKYS0KiGcjN/QwZBz
 h6Fw==
X-Gm-Message-State: APjAAAXTtPyNiXnEgS3lKG5NeGAuL14DDu68pO1m9GVhcggGLnY1qTDh
 m3Q4ALbeV+kUyobjnaWDLls/Uw==
X-Google-Smtp-Source: APXvYqwMyYmowFoyRxcASiMYF+mzRuRWL8uRd4dpCJhtQaVbJecrErQbWHTZ6vSNWIk7d0OmBHTuZQ==
X-Received: by 2002:a1c:67c1:: with SMTP id b184mr15691569wmc.12.1557136704663; 
 Mon, 06 May 2019 02:58:24 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id c10sm23409791wrd.69.2019.05.06.02.58.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 06 May 2019 02:58:24 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Mon,  6 May 2019 11:58:13 +0200
Message-Id: <20190506095815.24578-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190506095815.24578-1-jbrunet@baylibre.com>
References: <20190506095815.24578-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Cc: patchwork-bot+notify@kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH v2 2/4] ASoC: hdmi-codec: remove reference to
	the current substream
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
index eb31d7eddcbf..4d32f93f6be6 100644
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
@@ -761,8 +737,6 @@ static int hdmi_codec_probe(struct platform_device *pdev)
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
