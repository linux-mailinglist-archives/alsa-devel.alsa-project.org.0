Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 203B017490
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 11:06:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC8BD1A3C;
	Wed,  8 May 2019 11:05:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC8BD1A3C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557306408;
	bh=2qyklbFdULa0Lk8H8pmwWTRzh7Iw5h1E7z7zykqxBxM=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=EUQzcS1pnWf32WIiuXMaGLENABOJLmpp6h94s4YwtgWS/YEkzbHgE5/Df8WRZnRAp
	 o81xGKIErXjAjh+ckrPQyhIGz9+wpfQBJrK+K7G2mmJ3AdrDsea+ahqq6e6fv4ECM/
	 FYazpwzSkuUk8b5gg4lBsNfJ07kAUaiIinL7amME=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B867F89745;
	Wed,  8 May 2019 11:01:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D38F3F8973F; Wed,  8 May 2019 11:01:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E99D5F8973B
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 11:01:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E99D5F8973B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="NWfk1/ac"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=3foX1zSexcdw1h20N2CRNYxzqyizoRUKVKuHebbDRjs=; b=NWfk1/acOYOZ
 pIdhn6VeUkyEZc5NYPylKzP+4+ecyftkJTtEhcSc+cOWOOBr2+KI/V2OMd9+LfycVWfnjaB7++5QK
 +wwRAQ1Rdcqd5LLPfgg+FgGl5gQ/OpisQPbtm9i+BQGAOizlHvbV3YWwzkMaVVbkcsm69t20YBhcq
 aY8v4=;
Received: from [61.199.190.11] (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hOISN-0007dX-P0; Wed, 08 May 2019 09:01:49 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 00B9A440035; Wed,  8 May 2019 10:01:28 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20190506095815.24578-3-jbrunet@baylibre.com>
X-Patchwork-Hint: ignore
Message-Id: <20190508090129.00B9A440035@finisterre.sirena.org.uk>
Date: Wed,  8 May 2019 10:01:28 +0100 (BST)
Cc: patchwork-bot+notify@kernel.org, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] Applied "ASoC: hdmi-codec: remove reference to the
	current substream" to the asoc tree
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

   ASoC: hdmi-codec: remove reference to the current substream

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From 3fcf94ef4d418668fa66e33ce9aabb05689b55f6 Mon Sep 17 00:00:00 2001
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 6 May 2019 11:58:13 +0200
Subject: [PATCH] ASoC: hdmi-codec: remove reference to the current substream

If the hdmi-codec is on a codec-to-codec link, the substream pointer
it receives is completely made up by snd_soc_dai_link_event().
The pointer will be different between startup() and shutdown().

The hdmi-codec complains when this happens even if it is not really a
problem. The current_substream pointer is not used for anything useful
apart from getting the exclusive ownership of the device.

Remove current_substream pointer and replace the exclusive locking
mechanism with a simple variable and some atomic operations.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
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
