Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFC7CFAD2
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 15:02:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29FE3165D;
	Tue,  8 Oct 2019 15:01:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29FE3165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570539722;
	bh=8mQ54Wtw4Z2bBoAYqT78QY5eFnUD4Li/8bJqKNhhKlw=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=P13NYvNXcbYCKPBllPjsGsXLwmh8gApW/5VLBISvTKnDVljZJqF5WyLcPZhRisuiM
	 pXSnk3CzE/JsN2VNMCstbyl37WmwOO218r1Tta7d+mdO/0+6/Y0Zm8gjpnTk4Qv368
	 MjPo7k3XvA/FNfTr7XT0HUK+ib61xyLFYegJzUkQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D92E1F80722;
	Tue,  8 Oct 2019 14:53:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 693E6F805A8; Tue,  8 Oct 2019 14:53:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2680F805FA
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 14:53:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2680F805FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="FPsFQnLi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=r5Ob18DxiDDLA/jXHifyGMdb/h2qh8Hn/lal44QNPNE=; b=FPsFQnLi8Q0b
 ZYa0JhLdx7Z/wyq0i4zk37Au+SrAHZIU08dqojy8F/Nyy1UVJIvjsUg12lzqDqRGWAlciwr0GV4gj
 /1B+6H0mPDF/GCyG4Pe4fPQBso4RrLljYF91pho0u52qeYUiyre2uuCvPMfcwP53SCh8mIeN23X3q
 4Qvsg=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHozX-0008Mg-Cv; Tue, 08 Oct 2019 12:53:27 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id D5FC62740D48; Tue,  8 Oct 2019 13:53:26 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87h84r90dk.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191008125326.D5FC62740D48@ypsilon.sirena.org.uk>
Date: Tue,  8 Oct 2019 13:53:26 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: dwc: dwc-pcm: remove snd_pcm_ops" to
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

   ASoC: dwc: dwc-pcm: remove snd_pcm_ops

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

From dfd00af5e801d42ee5cdbd0e2f486da0e733b1e3 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 2 Oct 2019 14:34:15 +0900
Subject: [PATCH] ASoC: dwc: dwc-pcm: remove snd_pcm_ops

snd_pcm_ops is no longer needed.
Let's use component driver callback.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87h84r90dk.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/dwc/dwc-pcm.c | 48 ++++++++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 22 deletions(-)

diff --git a/sound/soc/dwc/dwc-pcm.c b/sound/soc/dwc/dwc-pcm.c
index a9ae91c4597f..de6fcc808832 100644
--- a/sound/soc/dwc/dwc-pcm.c
+++ b/sound/soc/dwc/dwc-pcm.c
@@ -135,7 +135,8 @@ void dw_pcm_pop_rx(struct dw_i2s_dev *dev)
 	dw_pcm_transfer(dev, false);
 }
 
-static int dw_pcm_open(struct snd_pcm_substream *substream)
+static int dw_pcm_open(struct snd_soc_component *component,
+		       struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
@@ -148,14 +149,16 @@ static int dw_pcm_open(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int dw_pcm_close(struct snd_pcm_substream *substream)
+static int dw_pcm_close(struct snd_soc_component *component,
+			struct snd_pcm_substream *substream)
 {
 	synchronize_rcu();
 	return 0;
 }
 
-static int dw_pcm_hw_params(struct snd_pcm_substream *substream,
-		struct snd_pcm_hw_params *hw_params)
+static int dw_pcm_hw_params(struct snd_soc_component *component,
+			    struct snd_pcm_substream *substream,
+			    struct snd_pcm_hw_params *hw_params)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct dw_i2s_dev *dev = runtime->private_data;
@@ -192,12 +195,14 @@ static int dw_pcm_hw_params(struct snd_pcm_substream *substream,
 		return 0;
 }
 
-static int dw_pcm_hw_free(struct snd_pcm_substream *substream)
+static int dw_pcm_hw_free(struct snd_soc_component *component,
+			  struct snd_pcm_substream *substream)
 {
 	return snd_pcm_lib_free_pages(substream);
 }
 
-static int dw_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
+static int dw_pcm_trigger(struct snd_soc_component *component,
+			  struct snd_pcm_substream *substream, int cmd)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct dw_i2s_dev *dev = runtime->private_data;
@@ -231,7 +236,8 @@ static int dw_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 	return ret;
 }
 
-static snd_pcm_uframes_t dw_pcm_pointer(struct snd_pcm_substream *substream)
+static snd_pcm_uframes_t dw_pcm_pointer(struct snd_soc_component *component,
+					struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct dw_i2s_dev *dev = runtime->private_data;
@@ -245,7 +251,8 @@ static snd_pcm_uframes_t dw_pcm_pointer(struct snd_pcm_substream *substream)
 	return pos < runtime->buffer_size ? pos : 0;
 }
 
-static int dw_pcm_new(struct snd_soc_pcm_runtime *rtd)
+static int dw_pcm_new(struct snd_soc_component *component,
+		      struct snd_soc_pcm_runtime *rtd)
 {
 	size_t size = dw_pcm_hardware.buffer_bytes_max;
 
@@ -255,25 +262,22 @@ static int dw_pcm_new(struct snd_soc_pcm_runtime *rtd)
 	return 0;
 }
 
-static void dw_pcm_free(struct snd_pcm *pcm)
+static void dw_pcm_free(struct snd_soc_component *component,
+			struct snd_pcm *pcm)
 {
 	snd_pcm_lib_preallocate_free_for_all(pcm);
 }
 
-static const struct snd_pcm_ops dw_pcm_ops = {
-	.open = dw_pcm_open,
-	.close = dw_pcm_close,
-	.ioctl = snd_pcm_lib_ioctl,
-	.hw_params = dw_pcm_hw_params,
-	.hw_free = dw_pcm_hw_free,
-	.trigger = dw_pcm_trigger,
-	.pointer = dw_pcm_pointer,
-};
-
 static const struct snd_soc_component_driver dw_pcm_component = {
-	.pcm_new = dw_pcm_new,
-	.pcm_free = dw_pcm_free,
-	.ops = &dw_pcm_ops,
+	.open		= dw_pcm_open,
+	.close		= dw_pcm_close,
+	.ioctl		= snd_soc_pcm_lib_ioctl,
+	.hw_params	= dw_pcm_hw_params,
+	.hw_free	= dw_pcm_hw_free,
+	.trigger	= dw_pcm_trigger,
+	.pointer	= dw_pcm_pointer,
+	.pcm_construct	= dw_pcm_new,
+	.pcm_destruct	= dw_pcm_free,
 };
 
 int dw_pcm_register(struct platform_device *pdev)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
