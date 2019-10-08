Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0158CFAF1
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 15:09:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A0A91677;
	Tue,  8 Oct 2019 15:08:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A0A91677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570540168;
	bh=rMu+i1D/ejPEEm2HkQsyHC5nTlZg+m6AIge/dzySni8=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=lth5AESubpcsCBGTtAvUGxLAYJmuT1efxsydy/LE4YaGVWfHcNrozVUtAtZ7Ho5dj
	 TMlavWDv/kOOGZ+Rud4CRfiA3ujyMxvw4lE/jwty/quj0iG8ntfWrH5kVZt2WLV6X0
	 DyqvUnjGFUtToO/LAHnPxHSk3SrAclCcv00MfBV8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D923F807A2;
	Tue,  8 Oct 2019 14:54:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 703D1F80717; Tue,  8 Oct 2019 14:53:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E886DF80610
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 14:53:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E886DF80610
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="rx5bvuJk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=NhCCM+4pu/QndAzaPFqQBjWWWouYCzdMCSCpA+WeKU8=; b=rx5bvuJkbYAp
 wpgR3H+XQABDJOd1N68enStrUNXhEK49Nuw0Y8ilI2TEGZkXyGA3ICaTmU7NDFOobCirlg+2+ZP4y
 0wX313aBuRgmJHlZHADv4KnjzlapPl5kqayvANiXeRu3HwDA7xgyjlg23fcg2C7YbsWvo4J0lOWwq
 uLEkI=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHozZ-0008Nd-LU; Tue, 08 Oct 2019 12:53:29 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 28A212740D48; Tue,  8 Oct 2019 13:53:29 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87tv8r90eu.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191008125329.28A212740D48@ypsilon.sirena.org.uk>
Date: Tue,  8 Oct 2019 13:53:29 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: qcom: lpass-platform: remove
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

   ASoC: qcom: lpass-platform: remove snd_pcm_ops

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

From 8b83c90dbac79ae873d3099d03d9a98c0bf9ed15 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 2 Oct 2019 14:33:29 +0900
Subject: [PATCH] ASoC: qcom: lpass-platform: remove snd_pcm_ops

snd_pcm_ops is no longer needed.
Let's use component driver callback.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87tv8r90eu.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/qcom/lpass-platform.c | 70 ++++++++++++++++-----------------
 1 file changed, 34 insertions(+), 36 deletions(-)

diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index 4c745baa39f7..2e8892316423 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -50,12 +50,12 @@ static const struct snd_pcm_hardware lpass_platform_pcm_hardware = {
 	.fifo_size		=	0,
 };
 
-static int lpass_platform_pcmops_open(struct snd_pcm_substream *substream)
+static int lpass_platform_pcmops_open(struct snd_soc_component *component,
+				      struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_pcm_runtime *soc_runtime = substream->private_data;
 	struct snd_soc_dai *cpu_dai = soc_runtime->cpu_dai;
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(soc_runtime, DRV_NAME);
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct lpass_variant *v = drvdata->variant;
 	int ret, dma_ch, dir = substream->stream;
@@ -105,11 +105,10 @@ static int lpass_platform_pcmops_open(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int lpass_platform_pcmops_close(struct snd_pcm_substream *substream)
+static int lpass_platform_pcmops_close(struct snd_soc_component *component,
+				       struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *soc_runtime = substream->private_data;
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(soc_runtime, DRV_NAME);
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct lpass_variant *v = drvdata->variant;
 	struct lpass_pcm_data *data;
@@ -122,11 +121,11 @@ static int lpass_platform_pcmops_close(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int lpass_platform_pcmops_hw_params(struct snd_pcm_substream *substream,
-		struct snd_pcm_hw_params *params)
+static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
+					   struct snd_pcm_substream *substream,
+					   struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *soc_runtime = substream->private_data;
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(soc_runtime, DRV_NAME);
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct snd_pcm_runtime *rt = substream->runtime;
 	struct lpass_pcm_data *pcm_data = rt->private_data;
@@ -216,10 +215,10 @@ static int lpass_platform_pcmops_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int lpass_platform_pcmops_hw_free(struct snd_pcm_substream *substream)
+static int lpass_platform_pcmops_hw_free(struct snd_soc_component *component,
+					 struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *soc_runtime = substream->private_data;
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(soc_runtime, DRV_NAME);
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct snd_pcm_runtime *rt = substream->runtime;
 	struct lpass_pcm_data *pcm_data = rt->private_data;
@@ -236,11 +235,11 @@ static int lpass_platform_pcmops_hw_free(struct snd_pcm_substream *substream)
 	return ret;
 }
 
-static int lpass_platform_pcmops_prepare(struct snd_pcm_substream *substream)
+static int lpass_platform_pcmops_prepare(struct snd_soc_component *component,
+					 struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_pcm_runtime *soc_runtime = substream->private_data;
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(soc_runtime, DRV_NAME);
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct snd_pcm_runtime *rt = substream->runtime;
 	struct lpass_pcm_data *pcm_data = rt->private_data;
@@ -288,11 +287,11 @@ static int lpass_platform_pcmops_prepare(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int lpass_platform_pcmops_trigger(struct snd_pcm_substream *substream,
-		int cmd)
+static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
+					 struct snd_pcm_substream *substream,
+					 int cmd)
 {
 	struct snd_soc_pcm_runtime *soc_runtime = substream->private_data;
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(soc_runtime, DRV_NAME);
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct snd_pcm_runtime *rt = substream->runtime;
 	struct lpass_pcm_data *pcm_data = rt->private_data;
@@ -363,10 +362,10 @@ static int lpass_platform_pcmops_trigger(struct snd_pcm_substream *substream,
 }
 
 static snd_pcm_uframes_t lpass_platform_pcmops_pointer(
+		struct snd_soc_component *component,
 		struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *soc_runtime = substream->private_data;
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(soc_runtime, DRV_NAME);
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct snd_pcm_runtime *rt = substream->runtime;
 	struct lpass_pcm_data *pcm_data = rt->private_data;
@@ -395,8 +394,9 @@ static snd_pcm_uframes_t lpass_platform_pcmops_pointer(
 	return bytes_to_frames(substream->runtime, curr_addr - base_addr);
 }
 
-static int lpass_platform_pcmops_mmap(struct snd_pcm_substream *substream,
-		struct vm_area_struct *vma)
+static int lpass_platform_pcmops_mmap(struct snd_soc_component *component,
+				      struct snd_pcm_substream *substream,
+				      struct vm_area_struct *vma)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
@@ -405,18 +405,6 @@ static int lpass_platform_pcmops_mmap(struct snd_pcm_substream *substream,
 			runtime->dma_bytes);
 }
 
-static const struct snd_pcm_ops lpass_platform_pcm_ops = {
-	.open		= lpass_platform_pcmops_open,
-	.close		= lpass_platform_pcmops_close,
-	.ioctl		= snd_pcm_lib_ioctl,
-	.hw_params	= lpass_platform_pcmops_hw_params,
-	.hw_free	= lpass_platform_pcmops_hw_free,
-	.prepare	= lpass_platform_pcmops_prepare,
-	.trigger	= lpass_platform_pcmops_trigger,
-	.pointer	= lpass_platform_pcmops_pointer,
-	.mmap		= lpass_platform_pcmops_mmap,
-};
-
 static irqreturn_t lpass_dma_interrupt_handler(
 			struct snd_pcm_substream *substream,
 			struct lpass_data *drvdata,
@@ -499,11 +487,11 @@ static irqreturn_t lpass_platform_lpaif_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static int lpass_platform_pcm_new(struct snd_soc_pcm_runtime *soc_runtime)
+static int lpass_platform_pcm_new(struct snd_soc_component *component,
+				  struct snd_soc_pcm_runtime *soc_runtime)
 {
 	struct snd_pcm *pcm = soc_runtime->pcm;
 	struct snd_pcm_substream *psubstream, *csubstream;
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(soc_runtime, DRV_NAME);
 	int ret = -EINVAL;
 	size_t size = lpass_platform_pcm_hardware.buffer_bytes_max;
 
@@ -535,7 +523,8 @@ static int lpass_platform_pcm_new(struct snd_soc_pcm_runtime *soc_runtime)
 	return 0;
 }
 
-static void lpass_platform_pcm_free(struct snd_pcm *pcm)
+static void lpass_platform_pcm_free(struct snd_soc_component *component,
+				    struct snd_pcm *pcm)
 {
 	struct snd_pcm_substream *substream;
 	int i;
@@ -552,9 +541,18 @@ static void lpass_platform_pcm_free(struct snd_pcm *pcm)
 
 static const struct snd_soc_component_driver lpass_component_driver = {
 	.name		= DRV_NAME,
-	.pcm_new	= lpass_platform_pcm_new,
-	.pcm_free	= lpass_platform_pcm_free,
-	.ops		= &lpass_platform_pcm_ops,
+	.open		= lpass_platform_pcmops_open,
+	.close		= lpass_platform_pcmops_close,
+	.ioctl		= snd_soc_pcm_lib_ioctl,
+	.hw_params	= lpass_platform_pcmops_hw_params,
+	.hw_free	= lpass_platform_pcmops_hw_free,
+	.prepare	= lpass_platform_pcmops_prepare,
+	.trigger	= lpass_platform_pcmops_trigger,
+	.pointer	= lpass_platform_pcmops_pointer,
+	.mmap		= lpass_platform_pcmops_mmap,
+	.pcm_construct	= lpass_platform_pcm_new,
+	.pcm_destruct	= lpass_platform_pcm_free,
+
 };
 
 int asoc_qcom_lpass_platform_register(struct platform_device *pdev)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
