Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C80C5CFAE0
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 15:04:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A05F167F;
	Tue,  8 Oct 2019 15:03:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A05F167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570539850;
	bh=nj+pf+NPtDTo0XCcBw6V6l9w2rgvS0/v50b43RHAFN8=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=DxaEW6snCQBPywE6k9Ss203t0ZS7TyW30BYsd7XDO/EEMttqKJ1gSCsKbfM+b8taZ
	 DisMqcLJCRPH126zO6v2uH3KL0fftrDQfbajZdZKN2istPy3Ew9rjSwVNNaq+UMjEG
	 Qg6bFh/MRaPNNnx/9rLL0xNmiR7zFQijpW79SUrM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9F50F80760;
	Tue,  8 Oct 2019 14:54:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CAB89F806F0; Tue,  8 Oct 2019 14:53:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 681F5F805FD
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 14:53:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 681F5F805FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="RlyzX8PU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=+CjykeA6nO1DsNqnXC8+jQ7MGAxJsoJ+BgYxJJLp5NY=; b=RlyzX8PU1WVC
 GxJvOefRZRXMmpBq4IruZSmuJGgEtpVk2mLBR2v2VIzREjWMLGxWIdtAZugdx6UH0f5/BXAmBifml
 E0B3E6v7ByK7p09HJh17sKQd7yt12Um43Z6pUlNLyp5mfHlLb8MVtowZ2meaQwtm0kI3QcV/HNykJ
 nDx9o=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHozY-0008Mz-3h; Tue, 08 Oct 2019 12:53:28 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 9D9172740D48; Tue,  8 Oct 2019 13:53:27 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87lfu390dz.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191008125327.9D9172740D48@ypsilon.sirena.org.uk>
Date: Tue,  8 Oct 2019 13:53:27 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: mediatek: mtk-btcvsd: remove
	snd_pcm_ops" to the asoc tree
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

   ASoC: mediatek: mtk-btcvsd: remove snd_pcm_ops

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

From 9a0b72b71da0d50fe6e4fee2abaced10e61c48cc Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 2 Oct 2019 14:34:00 +0900
Subject: [PATCH] ASoC: mediatek: mtk-btcvsd: remove snd_pcm_ops

snd_pcm_ops is no longer needed.
Let's use component driver callback.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87lfu390dz.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/mediatek/common/mtk-btcvsd.c | 76 ++++++++++----------------
 1 file changed, 28 insertions(+), 48 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-btcvsd.c b/sound/soc/mediatek/common/mtk-btcvsd.c
index d00608c73c6e..2b490ae2e642 100644
--- a/sound/soc/mediatek/common/mtk-btcvsd.c
+++ b/sound/soc/mediatek/common/mtk-btcvsd.c
@@ -875,11 +875,9 @@ static const struct snd_pcm_hardware mtk_btcvsd_hardware = {
 	.fifo_size = 0,
 };
 
-static int mtk_pcm_btcvsd_open(struct snd_pcm_substream *substream)
+static int mtk_pcm_btcvsd_open(struct snd_soc_component *component,
+			       struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *component =
-		snd_soc_rtdcom_lookup(rtd, BTCVSD_SND_NAME);
 	struct mtk_btcvsd_snd *bt = snd_soc_component_get_drvdata(component);
 	int ret;
 
@@ -899,11 +897,9 @@ static int mtk_pcm_btcvsd_open(struct snd_pcm_substream *substream)
 	return ret;
 }
 
-static int mtk_pcm_btcvsd_close(struct snd_pcm_substream *substream)
+static int mtk_pcm_btcvsd_close(struct snd_soc_component *component,
+				struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *component =
-		snd_soc_rtdcom_lookup(rtd, BTCVSD_SND_NAME);
 	struct mtk_btcvsd_snd *bt = snd_soc_component_get_drvdata(component);
 	struct mtk_btcvsd_snd_stream *bt_stream = get_bt_stream(bt, substream);
 
@@ -914,12 +910,10 @@ static int mtk_pcm_btcvsd_close(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int mtk_pcm_btcvsd_hw_params(struct snd_pcm_substream *substream,
+static int mtk_pcm_btcvsd_hw_params(struct snd_soc_component *component,
+				    struct snd_pcm_substream *substream,
 				    struct snd_pcm_hw_params *hw_params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *component =
-		snd_soc_rtdcom_lookup(rtd, BTCVSD_SND_NAME);
 	struct mtk_btcvsd_snd *bt = snd_soc_component_get_drvdata(component);
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
@@ -934,11 +928,9 @@ static int mtk_pcm_btcvsd_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int mtk_pcm_btcvsd_hw_free(struct snd_pcm_substream *substream)
+static int mtk_pcm_btcvsd_hw_free(struct snd_soc_component *component,
+				  struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *component =
-		snd_soc_rtdcom_lookup(rtd, BTCVSD_SND_NAME);
 	struct mtk_btcvsd_snd *bt = snd_soc_component_get_drvdata(component);
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
@@ -947,11 +939,9 @@ static int mtk_pcm_btcvsd_hw_free(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int mtk_pcm_btcvsd_prepare(struct snd_pcm_substream *substream)
+static int mtk_pcm_btcvsd_prepare(struct snd_soc_component *component,
+				  struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *component =
-		snd_soc_rtdcom_lookup(rtd, BTCVSD_SND_NAME);
 	struct mtk_btcvsd_snd *bt = snd_soc_component_get_drvdata(component);
 	struct mtk_btcvsd_snd_stream *bt_stream = get_bt_stream(bt, substream);
 
@@ -961,11 +951,9 @@ static int mtk_pcm_btcvsd_prepare(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int mtk_pcm_btcvsd_trigger(struct snd_pcm_substream *substream, int cmd)
+static int mtk_pcm_btcvsd_trigger(struct snd_soc_component *component,
+				  struct snd_pcm_substream *substream, int cmd)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *component =
-		snd_soc_rtdcom_lookup(rtd, BTCVSD_SND_NAME);
 	struct mtk_btcvsd_snd *bt = snd_soc_component_get_drvdata(component);
 	struct mtk_btcvsd_snd_stream *bt_stream = get_bt_stream(bt, substream);
 	int stream = substream->stream;
@@ -993,12 +981,10 @@ static int mtk_pcm_btcvsd_trigger(struct snd_pcm_substream *substream, int cmd)
 	}
 }
 
-static snd_pcm_uframes_t mtk_pcm_btcvsd_pointer
-	(struct snd_pcm_substream *substream)
+static snd_pcm_uframes_t mtk_pcm_btcvsd_pointer(
+	struct snd_soc_component *component,
+	struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *component =
-		snd_soc_rtdcom_lookup(rtd, BTCVSD_SND_NAME);
 	struct mtk_btcvsd_snd *bt = snd_soc_component_get_drvdata(component);
 	struct mtk_btcvsd_snd_stream *bt_stream;
 	snd_pcm_uframes_t frame = 0;
@@ -1044,13 +1030,11 @@ static snd_pcm_uframes_t mtk_pcm_btcvsd_pointer
 	return frame;
 }
 
-static int mtk_pcm_btcvsd_copy(struct snd_pcm_substream *substream,
+static int mtk_pcm_btcvsd_copy(struct snd_soc_component *component,
+			       struct snd_pcm_substream *substream,
 			       int channel, unsigned long pos,
 			       void __user *buf, unsigned long count)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *component =
-		snd_soc_rtdcom_lookup(rtd, BTCVSD_SND_NAME);
 	struct mtk_btcvsd_snd *bt = snd_soc_component_get_drvdata(component);
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
@@ -1061,18 +1045,6 @@ static int mtk_pcm_btcvsd_copy(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static struct snd_pcm_ops mtk_btcvsd_ops = {
-	.open = mtk_pcm_btcvsd_open,
-	.close = mtk_pcm_btcvsd_close,
-	.ioctl = snd_pcm_lib_ioctl,
-	.hw_params = mtk_pcm_btcvsd_hw_params,
-	.hw_free = mtk_pcm_btcvsd_hw_free,
-	.prepare = mtk_pcm_btcvsd_prepare,
-	.trigger = mtk_pcm_btcvsd_trigger,
-	.pointer = mtk_pcm_btcvsd_pointer,
-	.copy_user = mtk_pcm_btcvsd_copy,
-};
-
 /* kcontrol */
 static const char *const btsco_band_str[] = {"NB", "WB"};
 
@@ -1295,9 +1267,17 @@ static int mtk_btcvsd_snd_component_probe(struct snd_soc_component *component)
 }
 
 static const struct snd_soc_component_driver mtk_btcvsd_snd_platform = {
-	.name = BTCVSD_SND_NAME,
-	.ops = &mtk_btcvsd_ops,
-	.probe = mtk_btcvsd_snd_component_probe,
+	.name		= BTCVSD_SND_NAME,
+	.probe		= mtk_btcvsd_snd_component_probe,
+	.open		= mtk_pcm_btcvsd_open,
+	.close		= mtk_pcm_btcvsd_close,
+	.ioctl		= snd_soc_pcm_lib_ioctl,
+	.hw_params	= mtk_pcm_btcvsd_hw_params,
+	.hw_free	= mtk_pcm_btcvsd_hw_free,
+	.prepare	= mtk_pcm_btcvsd_prepare,
+	.trigger	= mtk_pcm_btcvsd_trigger,
+	.pointer	= mtk_pcm_btcvsd_pointer,
+	.copy_user	= mtk_pcm_btcvsd_copy,
 };
 
 static int mtk_btcvsd_snd_probe(struct platform_device *pdev)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
