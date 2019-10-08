Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82080CFAF8
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 15:10:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AC0A1614;
	Tue,  8 Oct 2019 15:09:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AC0A1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570540249;
	bh=Zhd8JlefHx2VeaVEjNA6yV3PJpSRyrbItW7y/F+3N6A=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Kkq33VlyHEtWsAKtXiMbLeYbFGgZz28hdPK2T4F3WkKunin+kRauNsz1ZC1F/wKK7
	 2UwJm/bPmYrI+bm8UTBX34Vjey3OIzw4VB4fla+qoH/Dykkt/FSTbAqfWi1NyFOAEG
	 tXhhWLwVbteKy5Dpz3xcGVkNRCxfgZwiLz8kWpvA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0B18F80859;
	Tue,  8 Oct 2019 14:54:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA8C2F80722; Tue,  8 Oct 2019 14:53:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4CF1F80635
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 14:53:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4CF1F80635
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="asRhdJYL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=PuBIvfpyxuWGb1BNRyoLEdyZ5isyPvKjKz3Kev/BaSw=; b=asRhdJYLUi5Z
 nPoEXY+/tcpa7WvpEMACvKB+JT7AxTCeyDaAQS+RnQq0XhNtkdlabDhzy2kzlWLX4xOYozw+rV6oC
 VgDU4Z9r0Gqqwf40UndsL0rVKRovgxrgwNOlsKg+gmtr/iN7EAwWwV4DM36DN9nipSvqCTVvJ7ldG
 exhKE=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHoza-0008Ns-Bz; Tue, 08 Oct 2019 12:53:30 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id CBEE42740D48; Tue,  8 Oct 2019 13:53:29 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87y2y390fc.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191008125329.CBEE42740D48@ypsilon.sirena.org.uk>
Date: Tue,  8 Oct 2019 13:53:29 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: sh: dma-sh7760: remove snd_pcm_ops" to
	the asoc tree
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

   ASoC: sh: dma-sh7760: remove snd_pcm_ops

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

From db5b4ee95238d2c5e9a97f53257f6b7ea7e1caa0 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 2 Oct 2019 14:33:11 +0900
Subject: [PATCH] ASoC: sh: dma-sh7760: remove snd_pcm_ops

snd_pcm_ops is no longer needed.
Let's use component driver callback.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87y2y390fc.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sh/dma-sh7760.c | 46 +++++++++++++++++++++------------------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/sound/soc/sh/dma-sh7760.c b/sound/soc/sh/dma-sh7760.c
index 5aee11c94f2a..93bb80d089be 100644
--- a/sound/soc/sh/dma-sh7760.c
+++ b/sound/soc/sh/dma-sh7760.c
@@ -115,7 +115,8 @@ static void camelot_rxdma(void *data)
 	snd_pcm_period_elapsed(cam->rx_ss);
 }
 
-static int camelot_pcm_open(struct snd_pcm_substream *substream)
+static int camelot_pcm_open(struct snd_soc_component *component,
+			    struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct camelot_pcm *cam = &cam_pcm_data[rtd->cpu_dai->id];
@@ -148,7 +149,8 @@ static int camelot_pcm_open(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int camelot_pcm_close(struct snd_pcm_substream *substream)
+static int camelot_pcm_close(struct snd_soc_component *component,
+			     struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct camelot_pcm *cam = &cam_pcm_data[rtd->cpu_dai->id];
@@ -168,7 +170,8 @@ static int camelot_pcm_close(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int camelot_hw_params(struct snd_pcm_substream *substream,
+static int camelot_hw_params(struct snd_soc_component *component,
+			     struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *hw_params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
@@ -191,12 +194,14 @@ static int camelot_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int camelot_hw_free(struct snd_pcm_substream *substream)
+static int camelot_hw_free(struct snd_soc_component *component,
+			   struct snd_pcm_substream *substream)
 {
 	return snd_pcm_lib_free_pages(substream);
 }
 
-static int camelot_prepare(struct snd_pcm_substream *substream)
+static int camelot_prepare(struct snd_soc_component *component,
+			   struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
@@ -244,7 +249,8 @@ static inline void dmabrg_rec_dma_stop(struct camelot_pcm *cam)
 	BRGREG(BRGACR) = acr | ACR_RDS;
 }
 
-static int camelot_trigger(struct snd_pcm_substream *substream, int cmd)
+static int camelot_trigger(struct snd_soc_component *component,
+			   struct snd_pcm_substream *substream, int cmd)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct camelot_pcm *cam = &cam_pcm_data[rtd->cpu_dai->id];
@@ -270,7 +276,8 @@ static int camelot_trigger(struct snd_pcm_substream *substream, int cmd)
 	return 0;
 }
 
-static snd_pcm_uframes_t camelot_pos(struct snd_pcm_substream *substream)
+static snd_pcm_uframes_t camelot_pos(struct snd_soc_component *component,
+				     struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
@@ -292,18 +299,8 @@ static snd_pcm_uframes_t camelot_pos(struct snd_pcm_substream *substream)
 	return bytes_to_frames(runtime, pos);
 }
 
-static const struct snd_pcm_ops camelot_pcm_ops = {
-	.open		= camelot_pcm_open,
-	.close		= camelot_pcm_close,
-	.ioctl		= snd_pcm_lib_ioctl,
-	.hw_params	= camelot_hw_params,
-	.hw_free	= camelot_hw_free,
-	.prepare	= camelot_prepare,
-	.trigger	= camelot_trigger,
-	.pointer	= camelot_pos,
-};
-
-static int camelot_pcm_new(struct snd_soc_pcm_runtime *rtd)
+static int camelot_pcm_new(struct snd_soc_component *component,
+			   struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_pcm *pcm = rtd->pcm;
 
@@ -319,8 +316,15 @@ static int camelot_pcm_new(struct snd_soc_pcm_runtime *rtd)
 }
 
 static const struct snd_soc_component_driver sh7760_soc_component = {
-	.ops		= &camelot_pcm_ops,
-	.pcm_new	= camelot_pcm_new,
+	.open		= camelot_pcm_open,
+	.close		= camelot_pcm_close,
+	.ioctl		= snd_soc_pcm_lib_ioctl,
+	.hw_params	= camelot_hw_params,
+	.hw_free	= camelot_hw_free,
+	.prepare	= camelot_prepare,
+	.trigger	= camelot_trigger,
+	.pointer	= camelot_pos,
+	.pcm_construct	= camelot_pcm_new,
 };
 
 static int sh7760_soc_platform_probe(struct platform_device *pdev)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
