Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 566AECFAD0
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 15:01:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E62CB166B;
	Tue,  8 Oct 2019 15:00:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E62CB166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570539676;
	bh=NQ6pyjfqn9bYm3syvVaigYB4F1frgDIAUSSiBej8+vE=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Vnhb1ds00SqwNgxC5VHI/mNEQ3il+iuhY7TBW5PyaQD9212C4kW0o82PxYV2ecJV5
	 Zo8SCh1/fkt3lcdKALLhAHwSe9264L8cGEoMGPbuAD7WTHZKiwkWephSud9wNgeIUh
	 9TYr3qPqIAfoKxhtheM2tqMi7OJvIPdM1aSLxwTY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AA10F80717;
	Tue,  8 Oct 2019 14:53:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1C25F8045E; Tue,  8 Oct 2019 14:53:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94575F805A8
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 14:53:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94575F805A8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="d/Z0a+E+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=CWUxvXXG5AeD+4FfKO6kH5qkXqP+zzV1+82RSmHPfro=; b=d/Z0a+E+HJuN
 e2BAkvysp81jqjnGXvW/ipd0HwU9cp1SYHKBqxCUdwxjYtcj5w9SjternwRX+vQ4TOYy4AIJRfgC/
 7UjPwYqdB6FoO1kZ4OIdRyYR2VWkya0JUPPG5ui0ihvlTtKVglBnousnPL8z5127z8Cnc2I5cthcw
 0CB2Y=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHozW-0008MV-TF; Tue, 08 Oct 2019 12:53:26 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 69AC62740D4A; Tue,  8 Oct 2019 13:53:26 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87eezv90db.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191008125326.69AC62740D4A@ypsilon.sirena.org.uk>
Date: Tue,  8 Oct 2019 13:53:26 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: bcm: cygnus-pcm: remove snd_pcm_ops" to
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

   ASoC: bcm: cygnus-pcm: remove snd_pcm_ops

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

From dc06bd0fc480417784bae62537f287f2d0d70089 Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 2 Oct 2019 14:34:24 +0900
Subject: [PATCH] ASoC: bcm: cygnus-pcm: remove snd_pcm_ops

snd_pcm_ops is no longer needed.
Let's use component driver callback.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87eezv90db.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/bcm/cygnus-pcm.c | 56 ++++++++++++++++++++------------------
 1 file changed, 30 insertions(+), 26 deletions(-)

diff --git a/sound/soc/bcm/cygnus-pcm.c b/sound/soc/bcm/cygnus-pcm.c
index 8966b02844dc..c65408085c1d 100644
--- a/sound/soc/bcm/cygnus-pcm.c
+++ b/sound/soc/bcm/cygnus-pcm.c
@@ -376,7 +376,8 @@ static void disable_intr(struct snd_pcm_substream *substream)
 
 }
 
-static int cygnus_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
+static int cygnus_pcm_trigger(struct snd_soc_component *component,
+			      struct snd_pcm_substream *substream, int cmd)
 {
 	int ret = 0;
 
@@ -577,7 +578,8 @@ static irqreturn_t cygnus_dma_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static int cygnus_pcm_open(struct snd_pcm_substream *substream)
+static int cygnus_pcm_open(struct snd_soc_component *component,
+			   struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_pcm_runtime *runtime = substream->runtime;
@@ -613,7 +615,8 @@ static int cygnus_pcm_open(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int cygnus_pcm_close(struct snd_pcm_substream *substream)
+static int cygnus_pcm_close(struct snd_soc_component *component,
+			    struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct cygnus_aio_port *aio;
@@ -633,8 +636,9 @@ static int cygnus_pcm_close(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int cygnus_pcm_hw_params(struct snd_pcm_substream *substream,
-	struct snd_pcm_hw_params *params)
+static int cygnus_pcm_hw_params(struct snd_soc_component *component,
+				struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_pcm_runtime *runtime = substream->runtime;
@@ -649,7 +653,8 @@ static int cygnus_pcm_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int cygnus_pcm_hw_free(struct snd_pcm_substream *substream)
+static int cygnus_pcm_hw_free(struct snd_soc_component *component,
+			      struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct cygnus_aio_port *aio;
@@ -661,7 +666,8 @@ static int cygnus_pcm_hw_free(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int cygnus_pcm_prepare(struct snd_pcm_substream *substream)
+static int cygnus_pcm_prepare(struct snd_soc_component *component,
+			      struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_pcm_runtime *runtime = substream->runtime;
@@ -694,7 +700,8 @@ static int cygnus_pcm_prepare(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static snd_pcm_uframes_t cygnus_pcm_pointer(struct snd_pcm_substream *substream)
+static snd_pcm_uframes_t cygnus_pcm_pointer(struct snd_soc_component *component,
+					    struct snd_pcm_substream *substream)
 {
 	struct cygnus_aio_port *aio;
 	unsigned int res = 0, cur = 0, base = 0;
@@ -750,19 +757,8 @@ static int cygnus_pcm_preallocate_dma_buffer(struct snd_pcm *pcm, int stream)
 	return 0;
 }
 
-
-static const struct snd_pcm_ops cygnus_pcm_ops = {
-	.open		= cygnus_pcm_open,
-	.close		= cygnus_pcm_close,
-	.ioctl		= snd_pcm_lib_ioctl,
-	.hw_params	= cygnus_pcm_hw_params,
-	.hw_free	= cygnus_pcm_hw_free,
-	.prepare	= cygnus_pcm_prepare,
-	.trigger	= cygnus_pcm_trigger,
-	.pointer	= cygnus_pcm_pointer,
-};
-
-static void cygnus_dma_free_dma_buffers(struct snd_pcm *pcm)
+static void cygnus_dma_free_dma_buffers(struct snd_soc_component *component,
+					struct snd_pcm *pcm)
 {
 	struct snd_pcm_substream *substream;
 	struct snd_dma_buffer *buf;
@@ -788,7 +784,8 @@ static void cygnus_dma_free_dma_buffers(struct snd_pcm *pcm)
 	}
 }
 
-static int cygnus_dma_new(struct snd_soc_pcm_runtime *rtd)
+static int cygnus_dma_new(struct snd_soc_component *component,
+			  struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_card *card = rtd->card->snd_card;
 	struct snd_pcm *pcm = rtd->pcm;
@@ -810,7 +807,7 @@ static int cygnus_dma_new(struct snd_soc_pcm_runtime *rtd)
 		ret = cygnus_pcm_preallocate_dma_buffer(pcm,
 				SNDRV_PCM_STREAM_CAPTURE);
 		if (ret) {
-			cygnus_dma_free_dma_buffers(pcm);
+			cygnus_dma_free_dma_buffers(component, pcm);
 			return ret;
 		}
 	}
@@ -819,9 +816,16 @@ static int cygnus_dma_new(struct snd_soc_pcm_runtime *rtd)
 }
 
 static struct snd_soc_component_driver cygnus_soc_platform = {
-	.ops		= &cygnus_pcm_ops,
-	.pcm_new	= cygnus_dma_new,
-	.pcm_free	= cygnus_dma_free_dma_buffers,
+	.open		= cygnus_pcm_open,
+	.close		= cygnus_pcm_close,
+	.ioctl		= snd_soc_pcm_lib_ioctl,
+	.hw_params	= cygnus_pcm_hw_params,
+	.hw_free	= cygnus_pcm_hw_free,
+	.prepare	= cygnus_pcm_prepare,
+	.trigger	= cygnus_pcm_trigger,
+	.pointer	= cygnus_pcm_pointer,
+	.pcm_construct	= cygnus_dma_new,
+	.pcm_destruct	= cygnus_dma_free_dma_buffers,
 };
 
 int cygnus_soc_platform_register(struct device *dev,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
