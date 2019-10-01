Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A9AC3360
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2019 13:53:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F31DB1698;
	Tue,  1 Oct 2019 13:52:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F31DB1698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569930823;
	bh=NvNU8pCRedRtZjbQx98PPg0AquA0Phq5JUd5DuK/RPM=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=SwE1ssgttY+3LnQuEr8pKNmXF+4rRS5F4uwdYUfIs/GsDHLrKRgMOS0HvfV6HjHS4
	 rEA8n5eBcEg+vi1JIyZ47S5+OZbHw2Xtw+cHtOt0lSFTkL8A3+WXHkg9hSin6ds+qg
	 1b4GpVD3e2vzWohgFYS8LOAoEn3qB1WXw09OkRrA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDBC2F80766;
	Tue,  1 Oct 2019 13:41:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C15B0F806E5; Tue,  1 Oct 2019 13:41:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B16FF80600
 for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2019 13:40:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B16FF80600
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="OnMtgzO+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=P6JtDuJLa/12jrP40ToxtPVrL7xnoHrr121brbW4oak=; b=OnMtgzO+DPHg
 +3cHI2tr5SjdgXQ0w67lTJRasrcfng2vBeLpC5JRNJUq29jmGFhYhgH5II/DfluZSaVGkDn160Wfs
 TT676km01QVFopZNMjFsjoLTw/1Gn8W8pzTpZEcNaYyqOyJ/iqiBZMkxuAPyoGtorADXfllQ4xHAm
 R7j+s=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iFGWP-0004Tr-O3; Tue, 01 Oct 2019 11:40:49 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 2D2F02742A10; Tue,  1 Oct 2019 12:40:49 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87a7baf7pz.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191001114049.2D2F02742A10@ypsilon.sirena.org.uk>
Date: Tue,  1 Oct 2019 12:40:49 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: soc-core: merge soc_new_pcm_runtime()
	and soc_rtd_init()" to the asoc tree
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

   ASoC: soc-core: merge soc_new_pcm_runtime() and soc_rtd_init()

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

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

From 6e864344873f19120f742c19d15a8c53e7247c6a Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Thu, 12 Sep 2019 13:40:08 +0900
Subject: [PATCH] ASoC: soc-core: merge soc_new_pcm_runtime() and
 soc_rtd_init()

"rtd"      is handled by soc_xxx_pcm_runtime(), and
"rtd->dev" is handled by soc_rtd_xxx().

There is no reason to separate these, and it makes code complex.
We can create these in the same time.

This patch merges soc_rtd_init() into soc_new_pcm_runtime().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87a7baf7pz.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-core.c | 95 ++++++++++++++++++++++++--------------------
 1 file changed, 53 insertions(+), 42 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index bc45b0db05ab..6abc1bc9a236 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -355,8 +355,17 @@ EXPORT_SYMBOL_GPL(snd_soc_get_dai_substream);
 
 static const struct snd_soc_ops null_snd_soc_ops;
 
+static void soc_release_rtd_dev(struct device *dev)
+{
+	/* "dev" means "rtd->dev" */
+	kfree(dev);
+}
+
 static void soc_free_pcm_runtime(struct snd_soc_pcm_runtime *rtd)
 {
+	if (!rtd)
+		return;
+
 	kfree(rtd->codec_dais);
 	snd_soc_rtdcom_del_all(rtd);
 	list_del(&rtd->list);
@@ -367,20 +376,54 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 	struct snd_soc_card *card, struct snd_soc_dai_link *dai_link)
 {
 	struct snd_soc_pcm_runtime *rtd;
+	int ret;
 
+	/*
+	 * for rtd
+	 */
 	rtd = kzalloc(sizeof(struct snd_soc_pcm_runtime), GFP_KERNEL);
 	if (!rtd)
-		return NULL;
+		goto free_rtd;
 
+	/*
+	 * for rtd->codec_dais
+	 */
 	rtd->codec_dais = kcalloc(dai_link->num_codecs,
 					sizeof(struct snd_soc_dai *),
 					GFP_KERNEL);
-	if (!rtd->codec_dais) {
-		kfree(rtd);
-		return NULL;
+	if (!rtd->codec_dais)
+		goto free_rtd;
+
+	/*
+	 * for rtd->dev
+	 */
+	rtd->dev = kzalloc(sizeof(struct device), GFP_KERNEL);
+	if (!rtd->dev)
+		goto free_rtd;
+
+	rtd->dev->parent = card->dev;
+	rtd->dev->release = soc_release_rtd_dev;
+	rtd->dev->groups = soc_dev_attr_groups;
+
+	dev_set_name(rtd->dev, "%s", dai_link->name);
+	dev_set_drvdata(rtd->dev, rtd);
+
+	ret = device_register(rtd->dev);
+	if (ret < 0) {
+		put_device(rtd->dev); /* soc_release_rtd_dev */
+		rtd->dev = NULL;
+		goto free_rtd;
 	}
 
+	/*
+	 * rtd remaining settings
+	 */
 	INIT_LIST_HEAD(&rtd->component_list);
+	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_PLAYBACK].be_clients);
+	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_CAPTURE].be_clients);
+	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_PLAYBACK].fe_clients);
+	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_CAPTURE].fe_clients);
+
 	rtd->card = card;
 	rtd->dai_link = dai_link;
 	if (!rtd->dai_link->ops)
@@ -391,7 +434,13 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
 	rtd->num = card->num_rtd;
 	card->num_rtd++;
 
+	rtd->dev_registered = 1;
+
 	return rtd;
+
+free_rtd:
+	soc_free_pcm_runtime(rtd);
+	return NULL;
 }
 
 static void soc_remove_pcm_runtimes(struct snd_soc_card *card)
@@ -1420,40 +1469,6 @@ static void soc_rtd_free(struct snd_soc_pcm_runtime *rtd)
 	}
 }
 
-static void soc_rtd_release(struct device *dev)
-{
-	kfree(dev);
-}
-
-static int soc_rtd_init(struct snd_soc_pcm_runtime *rtd, const char *name)
-{
-	int ret = 0;
-
-	/* register the rtd device */
-	rtd->dev = kzalloc(sizeof(struct device), GFP_KERNEL);
-	if (!rtd->dev)
-		return -ENOMEM;
-	rtd->dev->parent = rtd->card->dev;
-	rtd->dev->release = soc_rtd_release;
-	rtd->dev->groups = soc_dev_attr_groups;
-	dev_set_name(rtd->dev, "%s", name);
-	dev_set_drvdata(rtd->dev, rtd);
-	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_PLAYBACK].be_clients);
-	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_CAPTURE].be_clients);
-	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_PLAYBACK].fe_clients);
-	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_CAPTURE].fe_clients);
-	ret = device_register(rtd->dev);
-	if (ret < 0) {
-		/* calling put_device() here to free the rtd->dev */
-		put_device(rtd->dev);
-		dev_err(rtd->card->dev,
-			"ASoC: failed to register runtime device: %d\n", ret);
-		return ret;
-	}
-	rtd->dev_registered = 1;
-	return 0;
-}
-
 static int soc_link_dai_pcm_new(struct snd_soc_dai **dais, int num_dais,
 				struct snd_soc_pcm_runtime *rtd)
 {
@@ -1503,10 +1518,6 @@ static int soc_link_init(struct snd_soc_card *card,
 			return ret;
 	}
 
-	ret = soc_rtd_init(rtd, dai_link->name);
-	if (ret)
-		return ret;
-
 	/* add DPCM sysfs entries */
 	soc_dpcm_debugfs_add(rtd);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
