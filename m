Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3366DCFB1F
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 15:16:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFD931698;
	Tue,  8 Oct 2019 15:15:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFD931698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570540562;
	bh=St/WEsuKj/STXUWRaoMIx9oGCF5eny2MTgHosxnPkPc=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=JWzWS79X8QrHlG7p15LeJzlLXioOmKsIZc1KUAVR7o9g05EA3j8LTXh1S1jZqPRtB
	 ltWzhq0XIw/A8Gsn9PNdz7xBHc4QbhHEzxcWbCnmZcytuBCOodEogT52ecL3T1wF9y
	 gTcxjCN5mlNNg99MO5bKqSvsVeACQjNTYeQCKGyE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 590B4F80C43;
	Tue,  8 Oct 2019 14:54:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B7CCF80768; Tue,  8 Oct 2019 14:54:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DF42F8063E
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 14:53:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DF42F8063E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Q8Y7z5jU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=pyJwQPNeUg6F+7kALEXH9Db+rGAlH7TTG4e1AFY5jWw=; b=Q8Y7z5jU1KVo
 isZ7ixLA0TBMsrVqyPZ0N7Fsvgd3/V5rsfzvmcjpUWJIJNFSKVqkNRY61+DOJtXRm5GKCgAy/NHRz
 R1Yqya33Zjlpzw3epeslYGZDdtgPgPpsY8CzGQxRmEBgqO5dKPEq0jvKid/KVD4vly2sHkZeXM43B
 eWnh4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHozc-0008Ob-5Y; Tue, 08 Oct 2019 12:53:32 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id A8DF62740D4B; Tue,  8 Oct 2019 13:53:31 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87bluzaf0y.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191008125331.A8DF62740D4B@ypsilon.sirena.org.uk>
Date: Tue,  8 Oct 2019 13:53:31 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: xilinx: xlnx_formatter_pcm: remove
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

   ASoC: xilinx: xlnx_formatter_pcm: remove snd_pcm_ops

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

From 2bcba42492bf9579c5804692828c56d55b95c1ad Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 2 Oct 2019 14:32:29 +0900
Subject: [PATCH] ASoC: xilinx: xlnx_formatter_pcm: remove snd_pcm_ops

snd_pcm_ops is no longer needed.
Let's use component driver callback.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87bluzaf0y.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/xilinx/xlnx_formatter_pcm.c | 54 ++++++++++++---------------
 1 file changed, 23 insertions(+), 31 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index fb652e73abeb..296c4caf96a0 100644
--- a/sound/soc/xilinx/xlnx_formatter_pcm.c
+++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
@@ -313,16 +313,14 @@ static irqreturn_t xlnx_s2mm_irq_handler(int irq, void *arg)
 	return IRQ_NONE;
 }
 
-static int xlnx_formatter_pcm_open(struct snd_pcm_substream *substream)
+static int xlnx_formatter_pcm_open(struct snd_soc_component *component,
+				   struct snd_pcm_substream *substream)
 {
 	int err;
 	u32 val, data_format_mode;
 	u32 ch_count_mask, ch_count_shift, data_xfer_mode, data_xfer_shift;
 	struct xlnx_pcm_stream_param *stream_data;
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *prtd = substream->private_data;
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(prtd,
-								    DRV_NAME);
 	struct xlnx_pcm_drv_data *adata = dev_get_drvdata(component->dev);
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
@@ -387,14 +385,12 @@ static int xlnx_formatter_pcm_open(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int xlnx_formatter_pcm_close(struct snd_pcm_substream *substream)
+static int xlnx_formatter_pcm_close(struct snd_soc_component *component,
+				    struct snd_pcm_substream *substream)
 {
 	int ret;
 	struct xlnx_pcm_stream_param *stream_data =
 			substream->runtime->private_data;
-	struct snd_soc_pcm_runtime *prtd = substream->private_data;
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(prtd,
-								    DRV_NAME);
 
 	ret = xlnx_formatter_pcm_reset(stream_data->mmio);
 	if (ret) {
@@ -409,7 +405,8 @@ static int xlnx_formatter_pcm_close(struct snd_pcm_substream *substream)
 }
 
 static snd_pcm_uframes_t
-xlnx_formatter_pcm_pointer(struct snd_pcm_substream *substream)
+xlnx_formatter_pcm_pointer(struct snd_soc_component *component,
+			   struct snd_pcm_substream *substream)
 {
 	u32 pos;
 	struct snd_pcm_runtime *runtime = substream->runtime;
@@ -423,16 +420,14 @@ xlnx_formatter_pcm_pointer(struct snd_pcm_substream *substream)
 	return bytes_to_frames(runtime, pos);
 }
 
-static int xlnx_formatter_pcm_hw_params(struct snd_pcm_substream *substream,
+static int xlnx_formatter_pcm_hw_params(struct snd_soc_component *component,
+					struct snd_pcm_substream *substream,
 					struct snd_pcm_hw_params *params)
 {
 	u32 low, high, active_ch, val, bytes_per_ch, bits_per_sample;
 	u32 aes_reg1_val, aes_reg2_val;
 	int status;
 	u64 size;
-	struct snd_soc_pcm_runtime *prtd = substream->private_data;
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(prtd,
-								    DRV_NAME);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct xlnx_pcm_stream_param *stream_data = runtime->private_data;
 
@@ -500,12 +495,14 @@ static int xlnx_formatter_pcm_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int xlnx_formatter_pcm_hw_free(struct snd_pcm_substream *substream)
+static int xlnx_formatter_pcm_hw_free(struct snd_soc_component *component,
+				      struct snd_pcm_substream *substream)
 {
 	return snd_pcm_lib_free_pages(substream);
 }
 
-static int xlnx_formatter_pcm_trigger(struct snd_pcm_substream *substream,
+static int xlnx_formatter_pcm_trigger(struct snd_soc_component *component,
+				      struct snd_pcm_substream *substream,
 				      int cmd)
 {
 	u32 val;
@@ -532,10 +529,9 @@ static int xlnx_formatter_pcm_trigger(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int xlnx_formatter_pcm_new(struct snd_soc_pcm_runtime *rtd)
+static int xlnx_formatter_pcm_new(struct snd_soc_component *component,
+				  struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd,
-								    DRV_NAME);
 	snd_pcm_lib_preallocate_pages_for_all(rtd->pcm,
 			SNDRV_DMA_TYPE_DEV, component->dev,
 			xlnx_pcm_hardware.buffer_bytes_max,
@@ -543,20 +539,16 @@ static int xlnx_formatter_pcm_new(struct snd_soc_pcm_runtime *rtd)
 	return 0;
 }
 
-static const struct snd_pcm_ops xlnx_formatter_pcm_ops = {
-	.open = xlnx_formatter_pcm_open,
-	.close = xlnx_formatter_pcm_close,
-	.ioctl = snd_pcm_lib_ioctl,
-	.hw_params = xlnx_formatter_pcm_hw_params,
-	.hw_free = xlnx_formatter_pcm_hw_free,
-	.trigger = xlnx_formatter_pcm_trigger,
-	.pointer = xlnx_formatter_pcm_pointer,
-};
-
 static const struct snd_soc_component_driver xlnx_asoc_component = {
-	.name = DRV_NAME,
-	.ops = &xlnx_formatter_pcm_ops,
-	.pcm_new = xlnx_formatter_pcm_new,
+	.name		= DRV_NAME,
+	.open		= xlnx_formatter_pcm_open,
+	.close		= xlnx_formatter_pcm_close,
+	.ioctl		= snd_soc_pcm_lib_ioctl,
+	.hw_params	= xlnx_formatter_pcm_hw_params,
+	.hw_free	= xlnx_formatter_pcm_hw_free,
+	.trigger	= xlnx_formatter_pcm_trigger,
+	.pointer	= xlnx_formatter_pcm_pointer,
+	.pcm_construct	= xlnx_formatter_pcm_new,
 };
 
 static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
