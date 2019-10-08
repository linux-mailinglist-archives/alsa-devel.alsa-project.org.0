Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93510CFADF
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 15:03:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26C4A166C;
	Tue,  8 Oct 2019 15:02:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26C4A166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570539818;
	bh=JBWm/HSInQYjJDSjnJwWdRQSAIJ3gbTHbnqoDBD9UN4=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=pTxBXymyhJiiWJQWYJebHPlTjQXye0solb1O55GGs+qH+Z9AHDAOvp8Oo7Z7U2NWH
	 3N5vIWDZUxCd6LjlHsEzCU4G8mrCpovMDP10aCe2Ol3wWy9DgUtaHYFtRm24Cu/ZuM
	 4wCTK0nrppVkfOaDx0PLMtByYIKb1Bp0DFcZxwmE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19F70F80759;
	Tue,  8 Oct 2019 14:54:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15075F806E9; Tue,  8 Oct 2019 14:53:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 433DDF8059F
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 14:53:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 433DDF8059F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="qXzj0ZZt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Zc566HcLCLWCypL0YrFoKQT/cG67w9tUNgam/vrW0f8=; b=qXzj0ZZt0u5m
 /8XMO/8TSLlOL6tvJ3Zkz82YVYLOgaEpQqAvaf7PnPuW2orYsMlbzI3TdjPAFrA1XF7fMIYSNtser
 zaDWUCkKvpsYS8AttAT+35CSdU5ghla4zKswu3kJmf0AuHDcpYj5F3HKPwm212j8U3MekH/ZZ1wE0
 3oBL0=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHozW-0008MN-Kw; Tue, 08 Oct 2019 12:53:26 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 2A6E02740D48; Tue,  8 Oct 2019 13:53:26 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87d0ff90d6.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191008125326.2A6E02740D48@ypsilon.sirena.org.uk>
Date: Tue,  8 Oct 2019 13:53:26 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: fsl: imx-pcm-fiq: remove snd_pcm_ops"
	to the asoc tree
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

   ASoC: fsl: imx-pcm-fiq: remove snd_pcm_ops

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

From 2adc3fcc4a1f50e614cff67d8de5dcbb4a3b553d Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 2 Oct 2019 14:34:29 +0900
Subject: [PATCH] ASoC: fsl: imx-pcm-fiq: remove snd_pcm_ops

snd_pcm_ops is no longer needed.
Let's use component driver callback.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87d0ff90d6.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/imx-pcm-fiq.c | 56 ++++++++++++++++++++-----------------
 1 file changed, 31 insertions(+), 25 deletions(-)

diff --git a/sound/soc/fsl/imx-pcm-fiq.c b/sound/soc/fsl/imx-pcm-fiq.c
index c49aea4fba56..08131d147983 100644
--- a/sound/soc/fsl/imx-pcm-fiq.c
+++ b/sound/soc/fsl/imx-pcm-fiq.c
@@ -69,8 +69,9 @@ static struct fiq_handler fh = {
 	.name		= DRV_NAME,
 };
 
-static int snd_imx_pcm_hw_params(struct snd_pcm_substream *substream,
-				struct snd_pcm_hw_params *params)
+static int snd_imx_pcm_hw_params(struct snd_soc_component *component,
+				 struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *params)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct imx_pcm_runtime_data *iprtd = runtime->private_data;
@@ -85,7 +86,8 @@ static int snd_imx_pcm_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int snd_imx_pcm_prepare(struct snd_pcm_substream *substream)
+static int snd_imx_pcm_prepare(struct snd_soc_component *component,
+			       struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct imx_pcm_runtime_data *iprtd = runtime->private_data;
@@ -104,7 +106,8 @@ static int snd_imx_pcm_prepare(struct snd_pcm_substream *substream)
 
 static int imx_pcm_fiq;
 
-static int snd_imx_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
+static int snd_imx_pcm_trigger(struct snd_soc_component *component,
+			       struct snd_pcm_substream *substream, int cmd)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct imx_pcm_runtime_data *iprtd = runtime->private_data;
@@ -141,7 +144,9 @@ static int snd_imx_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 	return 0;
 }
 
-static snd_pcm_uframes_t snd_imx_pcm_pointer(struct snd_pcm_substream *substream)
+static snd_pcm_uframes_t
+snd_imx_pcm_pointer(struct snd_soc_component *component,
+		    struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct imx_pcm_runtime_data *iprtd = runtime->private_data;
@@ -165,7 +170,8 @@ static const struct snd_pcm_hardware snd_imx_hardware = {
 	.fifo_size = 0,
 };
 
-static int snd_imx_open(struct snd_pcm_substream *substream)
+static int snd_imx_open(struct snd_soc_component *component,
+			struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct imx_pcm_runtime_data *iprtd;
@@ -194,7 +200,8 @@ static int snd_imx_open(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int snd_imx_close(struct snd_pcm_substream *substream)
+static int snd_imx_close(struct snd_soc_component *component,
+			 struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct imx_pcm_runtime_data *iprtd = runtime->private_data;
@@ -206,8 +213,9 @@ static int snd_imx_close(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int snd_imx_pcm_mmap(struct snd_pcm_substream *substream,
-		struct vm_area_struct *vma)
+static int snd_imx_pcm_mmap(struct snd_soc_component *component,
+			    struct snd_pcm_substream *substream,
+			    struct vm_area_struct *vma)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int ret;
@@ -222,17 +230,6 @@ static int snd_imx_pcm_mmap(struct snd_pcm_substream *substream,
 	return ret;
 }
 
-static const struct snd_pcm_ops imx_pcm_ops = {
-	.open		= snd_imx_open,
-	.close		= snd_imx_close,
-	.ioctl		= snd_pcm_lib_ioctl,
-	.hw_params	= snd_imx_pcm_hw_params,
-	.prepare	= snd_imx_pcm_prepare,
-	.trigger	= snd_imx_pcm_trigger,
-	.pointer	= snd_imx_pcm_pointer,
-	.mmap		= snd_imx_pcm_mmap,
-};
-
 static int imx_pcm_preallocate_dma_buffer(struct snd_pcm *pcm, int stream)
 {
 	struct snd_pcm_substream *substream = pcm->streams[stream].substream;
@@ -279,7 +276,8 @@ static int imx_pcm_new(struct snd_soc_pcm_runtime *rtd)
 
 static int ssi_irq;
 
-static int imx_pcm_fiq_new(struct snd_soc_pcm_runtime *rtd)
+static int snd_imx_pcm_new(struct snd_soc_component *component,
+			   struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_pcm *pcm = rtd->pcm;
 	struct snd_pcm_substream *substream;
@@ -329,7 +327,8 @@ static void imx_pcm_free(struct snd_pcm *pcm)
 	}
 }
 
-static void imx_pcm_fiq_free(struct snd_pcm *pcm)
+static void snd_imx_pcm_free(struct snd_soc_component *component,
+			     struct snd_pcm *pcm)
 {
 	mxc_set_irq_fiq(ssi_irq, 0);
 	release_fiq(&fh);
@@ -337,9 +336,16 @@ static void imx_pcm_fiq_free(struct snd_pcm *pcm)
 }
 
 static const struct snd_soc_component_driver imx_soc_component_fiq = {
-	.ops		= &imx_pcm_ops,
-	.pcm_new	= imx_pcm_fiq_new,
-	.pcm_free	= imx_pcm_fiq_free,
+	.open		= snd_imx_open,
+	.close		= snd_imx_close,
+	.ioctl		= snd_soc_pcm_lib_ioctl,
+	.hw_params	= snd_imx_pcm_hw_params,
+	.prepare	= snd_imx_pcm_prepare,
+	.trigger	= snd_imx_pcm_trigger,
+	.pointer	= snd_imx_pcm_pointer,
+	.mmap		= snd_imx_pcm_mmap,
+	.pcm_construct	= snd_imx_pcm_new,
+	.pcm_destruct	= snd_imx_pcm_free,
 };
 
 int imx_pcm_fiq_init(struct platform_device *pdev,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
