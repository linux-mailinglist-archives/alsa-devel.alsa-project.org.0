Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C00CFB11
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 15:14:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A143167F;
	Tue,  8 Oct 2019 15:13:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A143167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570540445;
	bh=MmCXSCGxC1U+kQjKkyVBfXJZFLJrenlNnVwJi3I9dY4=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=dSyPuzmdpJNAYvcVkyXYjsEEBQWF4XnfCK2rFRXlBT2BhD9rWpgkcsCoZrCL3eMYV
	 dJwhXddT/LStB4vthKlu6I4BD+hCNXLw5v9+aMXjnZgpduxqC2jlQ1FqW25BJ85pYO
	 ic4EwMqicvkTitGYraKUo465dRmvXy+pkCsnPkgs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24509F80BF3;
	Tue,  8 Oct 2019 14:54:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 153A9F8075B; Tue,  8 Oct 2019 14:54:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C29DF8063C
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 14:53:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C29DF8063C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="BxE/F4Gd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=7puKZiu81VlBdB6A/XNF8MLuv1fbPvZitb/FZF2m+aE=; b=BxE/F4GdAIhz
 0ud+xmxKIemWWNew9UW9nLSJfmTY3mTlTVqKe6a2nmlcTOF+/2AmEZkKQGiJD0nbYzNFKO+WZzu68
 P10dg6vdC6slGk8be4i8Vv2eb7L3jyfMmZ7NSTnF0WCrwMbImCPa+/EGv1aT2W/XTenXjjB9LvgtS
 pnPtU=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHozb-0008OR-NK; Tue, 08 Oct 2019 12:53:31 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 348702740D48; Tue,  8 Oct 2019 13:53:31 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <877e5naf0m.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191008125331.348702740D48@ypsilon.sirena.org.uk>
Date: Tue,  8 Oct 2019 13:53:31 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: txx9: txx9aclc: remove snd_pcm_ops" to
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

   ASoC: txx9: txx9aclc: remove snd_pcm_ops

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

From a857e073ffc67f95ddd6f3f427d0a62edd633d7d Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 2 Oct 2019 14:32:41 +0900
Subject: [PATCH] ASoC: txx9: txx9aclc: remove snd_pcm_ops

snd_pcm_ops is no longer needed.
Let's use component driver callback.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/877e5naf0m.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/txx9/txx9aclc.c | 48 ++++++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 23 deletions(-)

diff --git a/sound/soc/txx9/txx9aclc.c b/sound/soc/txx9/txx9aclc.c
index 66044559f70f..33c78d33e5a1 100644
--- a/sound/soc/txx9/txx9aclc.c
+++ b/sound/soc/txx9/txx9aclc.c
@@ -47,12 +47,12 @@ static const struct snd_pcm_hardware txx9aclc_pcm_hardware = {
 	.buffer_bytes_max = 32 * 1024,
 };
 
-static int txx9aclc_pcm_hw_params(struct snd_pcm_substream *substream,
+static int txx9aclc_pcm_hw_params(struct snd_soc_component *component,
+				  struct snd_pcm_substream *substream,
 				  struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	struct txx9aclc_dmadata *dmadata = runtime->private_data;
 	int ret;
 
@@ -76,12 +76,14 @@ static int txx9aclc_pcm_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int txx9aclc_pcm_hw_free(struct snd_pcm_substream *substream)
+static int txx9aclc_pcm_hw_free(struct snd_soc_component *component,
+				struct snd_pcm_substream *substream)
 {
 	return snd_pcm_lib_free_pages(substream);
 }
 
-static int txx9aclc_pcm_prepare(struct snd_pcm_substream *substream)
+static int txx9aclc_pcm_prepare(struct snd_soc_component *component,
+				struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct txx9aclc_dmadata *dmadata = runtime->private_data;
@@ -203,7 +205,8 @@ static void txx9aclc_dma_tasklet(unsigned long data)
 	spin_unlock_irqrestore(&dmadata->dma_lock, flags);
 }
 
-static int txx9aclc_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
+static int txx9aclc_pcm_trigger(struct snd_soc_component *component,
+				struct snd_pcm_substream *substream, int cmd)
 {
 	struct txx9aclc_dmadata *dmadata = substream->runtime->private_data;
 	struct txx9aclc_plat_drvdata *drvdata = txx9aclc_drvdata;
@@ -236,14 +239,16 @@ static int txx9aclc_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 }
 
 static snd_pcm_uframes_t
-txx9aclc_pcm_pointer(struct snd_pcm_substream *substream)
+txx9aclc_pcm_pointer(struct snd_soc_component *component,
+		     struct snd_pcm_substream *substream)
 {
 	struct txx9aclc_dmadata *dmadata = substream->runtime->private_data;
 
 	return bytes_to_frames(substream->runtime, dmadata->pos);
 }
 
-static int txx9aclc_pcm_open(struct snd_pcm_substream *substream)
+static int txx9aclc_pcm_open(struct snd_soc_component *component,
+			     struct snd_pcm_substream *substream)
 {
 	struct txx9aclc_soc_device *dev = &txx9aclc_soc_device;
 	struct txx9aclc_dmadata *dmadata = &dev->dmadata[substream->stream];
@@ -261,7 +266,8 @@ static int txx9aclc_pcm_open(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int txx9aclc_pcm_close(struct snd_pcm_substream *substream)
+static int txx9aclc_pcm_close(struct snd_soc_component *component,
+			      struct snd_pcm_substream *substream)
 {
 	struct txx9aclc_dmadata *dmadata = substream->runtime->private_data;
 	struct dma_chan *chan = dmadata->dma_chan;
@@ -271,23 +277,12 @@ static int txx9aclc_pcm_close(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static const struct snd_pcm_ops txx9aclc_pcm_ops = {
-	.open		= txx9aclc_pcm_open,
-	.close		= txx9aclc_pcm_close,
-	.ioctl		= snd_pcm_lib_ioctl,
-	.hw_params	= txx9aclc_pcm_hw_params,
-	.hw_free	= txx9aclc_pcm_hw_free,
-	.prepare	= txx9aclc_pcm_prepare,
-	.trigger	= txx9aclc_pcm_trigger,
-	.pointer	= txx9aclc_pcm_pointer,
-};
-
-static int txx9aclc_pcm_new(struct snd_soc_pcm_runtime *rtd)
+static int txx9aclc_pcm_new(struct snd_soc_component *component,
+			    struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_card *card = rtd->card->snd_card;
 	struct snd_soc_dai *dai = rtd->cpu_dai;
 	struct snd_pcm *pcm = rtd->pcm;
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	struct platform_device *pdev = to_platform_device(component->dev);
 	struct txx9aclc_soc_device *dev;
 	struct resource *r;
@@ -409,8 +404,15 @@ static const struct snd_soc_component_driver txx9aclc_soc_component = {
 	.name		= DRV_NAME,
 	.probe		= txx9aclc_pcm_probe,
 	.remove		= txx9aclc_pcm_remove,
-	.ops		= &txx9aclc_pcm_ops,
-	.pcm_new	= txx9aclc_pcm_new,
+	.open		= txx9aclc_pcm_open,
+	.close		= txx9aclc_pcm_close,
+	.ioctl		= snd_soc_pcm_lib_ioctl,
+	.hw_params	= txx9aclc_pcm_hw_params,
+	.hw_free	= txx9aclc_pcm_hw_free,
+	.prepare	= txx9aclc_pcm_prepare,
+	.trigger	= txx9aclc_pcm_trigger,
+	.pointer	= txx9aclc_pcm_pointer,
+	.pcm_construct	= txx9aclc_pcm_new,
 };
 
 static int txx9aclc_soc_platform_probe(struct platform_device *pdev)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
