Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9094CFB3E
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 15:23:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43D7B16BE;
	Tue,  8 Oct 2019 15:22:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43D7B16BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570540994;
	bh=jmuMgFxR/m18VwFc3cBYZ279W4i2TEo2YBfIF5/oBCE=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=G19x4WeZxj0DH9bohVvkfDOGrVhLPQflhaDoFjv8wsWD9WJ+uEi4VPZwXbes+vTbx
	 6yZiSQZxJdKpNIjp9oMdwl5rHOVKU3S3RinGZ+yF53EP3w/B7BvHLTsTsHLAdyWRE7
	 Y1MoANM+e+Q5TktzYnkpkPTGQIzOhcj0V817kig0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F11EF8968A;
	Tue,  8 Oct 2019 14:54:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7621F8065E; Tue,  8 Oct 2019 14:54:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E7301F8060E
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 14:53:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7301F8060E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Y9dL+p+B"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=xgRWM9xrlmdhF3OGC24NQcIq3SfampgL3+Zr2ac0ubw=; b=Y9dL+p+BUmCF
 ev7tWxQ364BGxdeUdRZoGwAzkQRJ8vPo0b9NNeRaHmVZ7tmoZmdKKeVupVAPRc/yIEZJBwbtjUQzq
 jY/LIWy9pakQ/3Z2e+Om948QCmJDU32ZSFQX+9H21oY9O8HRQdlIl/YvQRAbS7qZ7lEJRQhfV/0FC
 dl77E=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHoze-0008Pa-IF; Tue, 08 Oct 2019 12:53:34 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 104A52740D48; Tue,  8 Oct 2019 13:53:34 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87pnjfaf2u.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191008125334.104A52740D48@ypsilon.sirena.org.uk>
Date: Tue,  8 Oct 2019 13:53:34 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: intel: sst-haswell-pcm: remove
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

   ASoC: intel: sst-haswell-pcm: remove snd_pcm_ops

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

From 86c05f3446ec4d8772e9d34b428d2e70c7f68e7a Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 2 Oct 2019 14:31:21 +0900
Subject: [PATCH] ASoC: intel: sst-haswell-pcm: remove snd_pcm_ops

snd_pcm_ops is no longer needed.
Let's use component driver callback.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87pnjfaf2u.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/haswell/sst-haswell-pcm.c | 62 +++++++++++++----------
 1 file changed, 35 insertions(+), 27 deletions(-)

diff --git a/sound/soc/intel/haswell/sst-haswell-pcm.c b/sound/soc/intel/haswell/sst-haswell-pcm.c
index 7f4f6b755760..6e498a581d20 100644
--- a/sound/soc/intel/haswell/sst-haswell-pcm.c
+++ b/sound/soc/intel/haswell/sst-haswell-pcm.c
@@ -458,12 +458,12 @@ static int create_adsp_page_table(struct snd_pcm_substream *substream,
 }
 
 /* this may get called several times by oss emulation */
-static int hsw_pcm_hw_params(struct snd_pcm_substream *substream,
-			      struct snd_pcm_hw_params *params)
+static int hsw_pcm_hw_params(struct snd_soc_component *component,
+			     struct snd_pcm_substream *substream,
+			     struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	struct hsw_priv_data *pdata = snd_soc_component_get_drvdata(component);
 	struct hsw_pcm_data *pcm_data;
 	struct sst_hsw *hsw = pdata->hsw;
@@ -656,16 +656,17 @@ static int hsw_pcm_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int hsw_pcm_hw_free(struct snd_pcm_substream *substream)
+static int hsw_pcm_hw_free(struct snd_soc_component *component,
+			   struct snd_pcm_substream *substream)
 {
 	snd_pcm_lib_free_pages(substream);
 	return 0;
 }
 
-static int hsw_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
+static int hsw_pcm_trigger(struct snd_soc_component *component,
+			   struct snd_pcm_substream *substream, int cmd)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	struct hsw_priv_data *pdata = snd_soc_component_get_drvdata(component);
 	struct hsw_pcm_data *pcm_data;
 	struct sst_hsw_stream *sst_stream;
@@ -770,11 +771,11 @@ static u32 hsw_notify_pointer(struct sst_hsw_stream *stream, void *data)
 	return pos;
 }
 
-static snd_pcm_uframes_t hsw_pcm_pointer(struct snd_pcm_substream *substream)
+static snd_pcm_uframes_t hsw_pcm_pointer(struct snd_soc_component *component,
+					 struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	struct hsw_priv_data *pdata = snd_soc_component_get_drvdata(component);
 	struct hsw_pcm_data *pcm_data;
 	struct sst_hsw *hsw = pdata->hsw;
@@ -795,10 +796,21 @@ static snd_pcm_uframes_t hsw_pcm_pointer(struct snd_pcm_substream *substream)
 	return offset;
 }
 
-static int hsw_pcm_open(struct snd_pcm_substream *substream)
+#ifdef CONFIG_SND_DMA_SGBUF
+static struct page *hsw_pcm_page(struct snd_soc_component *component,
+				 struct snd_pcm_substream *substream,
+				 unsigned long offset)
+{
+	return snd_pcm_sgbuf_ops_page(substream, offset);
+}
+#else
+#define hsw_pcm_page NULL
+#endif /* CONFIG_SND_DMA_SGBUF */
+
+static int hsw_pcm_open(struct snd_soc_component *component,
+			struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	struct hsw_priv_data *pdata = snd_soc_component_get_drvdata(component);
 	struct hsw_pcm_data *pcm_data;
 	struct sst_hsw *hsw = pdata->hsw;
@@ -828,10 +840,10 @@ static int hsw_pcm_open(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int hsw_pcm_close(struct snd_pcm_substream *substream)
+static int hsw_pcm_close(struct snd_soc_component *component,
+			 struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	struct hsw_priv_data *pdata = snd_soc_component_get_drvdata(component);
 	struct hsw_pcm_data *pcm_data;
 	struct sst_hsw *hsw = pdata->hsw;
@@ -862,17 +874,6 @@ static int hsw_pcm_close(struct snd_pcm_substream *substream)
 	return ret;
 }
 
-static const struct snd_pcm_ops hsw_pcm_ops = {
-	.open		= hsw_pcm_open,
-	.close		= hsw_pcm_close,
-	.ioctl		= snd_pcm_lib_ioctl,
-	.hw_params	= hsw_pcm_hw_params,
-	.hw_free	= hsw_pcm_hw_free,
-	.trigger	= hsw_pcm_trigger,
-	.pointer	= hsw_pcm_pointer,
-	.page		= snd_pcm_sgbuf_ops_page,
-};
-
 static int hsw_pcm_create_modules(struct hsw_priv_data *pdata)
 {
 	struct sst_hsw *hsw = pdata->hsw;
@@ -930,10 +931,10 @@ static void hsw_pcm_free_modules(struct hsw_priv_data *pdata)
 	}
 }
 
-static int hsw_pcm_new(struct snd_soc_pcm_runtime *rtd)
+static int hsw_pcm_new(struct snd_soc_component *component,
+		       struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_pcm *pcm = rtd->pcm;
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	struct sst_pdata *pdata = dev_get_platdata(component->dev);
 	struct hsw_priv_data *priv_data = dev_get_drvdata(component->dev);
 	struct device *dev = pdata->dma_dev;
@@ -1121,8 +1122,15 @@ static const struct snd_soc_component_driver hsw_dai_component = {
 	.name		= DRV_NAME,
 	.probe		= hsw_pcm_probe,
 	.remove		= hsw_pcm_remove,
-	.ops		= &hsw_pcm_ops,
-	.pcm_new	= hsw_pcm_new,
+	.open		= hsw_pcm_open,
+	.close		= hsw_pcm_close,
+	.hw_params	= hsw_pcm_hw_params,
+	.hw_free	= hsw_pcm_hw_free,
+	.trigger	= hsw_pcm_trigger,
+	.pointer	= hsw_pcm_pointer,
+	.page		= hsw_pcm_page,
+	.ioctl		= snd_soc_pcm_lib_ioctl,
+	.pcm_construct	= hsw_pcm_new,
 	.controls	= hsw_volume_controls,
 	.num_controls	= ARRAY_SIZE(hsw_volume_controls),
 	.dapm_widgets	= widgets,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
