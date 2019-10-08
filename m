Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8D0CFB2A
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 15:19:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3EA3E1691;
	Tue,  8 Oct 2019 15:19:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3EA3E1691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570540799;
	bh=ukOO20GGOA3SYZ2Q+81pr9pvIaditfeoziF+1xdnTRk=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=EjshCo6t5ntJ9Zx3c2aThhMvrAkFp28RBhaQhZ0Y8VlkQEdrYzvJsLmy+9GtFzIxF
	 iK+IYZRRywIz3oOz2H5Nq6j3Us4TPh9/RmHZqFqH5C1hhy8IeBF+JzKOg2o1GzesNl
	 DpqxB2kVbdzZrB5VkNrTzyGAvCc0YozQ8LVyfE0M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F718F8961D;
	Tue,  8 Oct 2019 14:54:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 733F2F80797; Tue,  8 Oct 2019 14:54:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42815F8065D
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 14:53:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42815F8065D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="c4ws42UY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=2ZtHyFpSilZK8LAkRzbw8lnhFW5BBkmHWOUt7GKQGCg=; b=c4ws42UYLDHl
 EmyeUXBf80tScYTrNWzSjOHBZJ7r17NjnJcNFjyleAKU0RbWMq2LfmQzpswXcjkqbULFA21jY1Mga
 D3hzzzZ6hZwxkYjTot5N/he+8QinREoYCTZXf0iR/ZTu2PKKYoI9J7dJ0ga8t8LKQYzTp99MhHE7b
 LX51I=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iHozd-0008PI-SS; Tue, 08 Oct 2019 12:53:33 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 5B0CA2740D48; Tue,  8 Oct 2019 13:53:33 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87lfu3af24.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20191008125333.5B0CA2740D48@ypsilon.sirena.org.uk>
Date: Tue,  8 Oct 2019 13:53:33 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: intel: sst-baytrail-pcm: remove
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

   ASoC: intel: sst-baytrail-pcm: remove snd_pcm_ops

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

From bb3613515e96d02f665190091e7a0209d7985f8b Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Wed, 2 Oct 2019 14:31:47 +0900
Subject: [PATCH] ASoC: intel: sst-baytrail-pcm: remove snd_pcm_ops

snd_pcm_ops is no longer needed.
Let's use component driver callback.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Link: https://lore.kernel.org/r/87lfu3af24.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/baytrail/sst-baytrail-pcm.c | 52 ++++++++++-----------
 1 file changed, 25 insertions(+), 27 deletions(-)

diff --git a/sound/soc/intel/baytrail/sst-baytrail-pcm.c b/sound/soc/intel/baytrail/sst-baytrail-pcm.c
index 54f2ee3010ee..1d780fcc448c 100644
--- a/sound/soc/intel/baytrail/sst-baytrail-pcm.c
+++ b/sound/soc/intel/baytrail/sst-baytrail-pcm.c
@@ -58,11 +58,11 @@ struct sst_byt_priv_data {
 };
 
 /* this may get called several times by oss emulation */
-static int sst_byt_pcm_hw_params(struct snd_pcm_substream *substream,
+static int sst_byt_pcm_hw_params(struct snd_soc_component *component,
+				 struct snd_pcm_substream *substream,
 				 struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	struct sst_byt_priv_data *pdata = snd_soc_component_get_drvdata(component);
 	struct sst_byt_pcm_data *pcm_data = &pdata->pcm[substream->stream];
 	struct sst_byt *byt = pdata->byt;
@@ -121,7 +121,8 @@ static int sst_byt_pcm_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int sst_byt_pcm_hw_free(struct snd_pcm_substream *substream)
+static int sst_byt_pcm_hw_free(struct snd_soc_component *component,
+			       struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 
@@ -164,10 +165,10 @@ static void sst_byt_pcm_work(struct work_struct *work)
 		sst_byt_pcm_restore_stream_context(pcm_data->substream);
 }
 
-static int sst_byt_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
+static int sst_byt_pcm_trigger(struct snd_soc_component *component,
+			       struct snd_pcm_substream *substream, int cmd)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	struct sst_byt_priv_data *pdata = snd_soc_component_get_drvdata(component);
 	struct sst_byt_pcm_data *pcm_data = &pdata->pcm[substream->stream];
 	struct sst_byt *byt = pdata->byt;
@@ -228,11 +229,11 @@ static u32 byt_notify_pointer(struct sst_byt_stream *stream, void *data)
 	return pos;
 }
 
-static snd_pcm_uframes_t sst_byt_pcm_pointer(struct snd_pcm_substream *substream)
+static snd_pcm_uframes_t sst_byt_pcm_pointer(struct snd_soc_component *component,
+					     struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	struct sst_byt_priv_data *pdata = snd_soc_component_get_drvdata(component);
 	struct sst_byt_pcm_data *pcm_data = &pdata->pcm[substream->stream];
 
@@ -241,10 +242,10 @@ static snd_pcm_uframes_t sst_byt_pcm_pointer(struct snd_pcm_substream *substream
 	return bytes_to_frames(runtime, pcm_data->hw_ptr);
 }
 
-static int sst_byt_pcm_open(struct snd_pcm_substream *substream)
+static int sst_byt_pcm_open(struct snd_soc_component *component,
+			    struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	struct sst_byt_priv_data *pdata = snd_soc_component_get_drvdata(component);
 	struct sst_byt_pcm_data *pcm_data = &pdata->pcm[substream->stream];
 	struct sst_byt *byt = pdata->byt;
@@ -269,10 +270,10 @@ static int sst_byt_pcm_open(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int sst_byt_pcm_close(struct snd_pcm_substream *substream)
+static int sst_byt_pcm_close(struct snd_soc_component *component,
+			     struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	struct sst_byt_priv_data *pdata = snd_soc_component_get_drvdata(component);
 	struct sst_byt_pcm_data *pcm_data = &pdata->pcm[substream->stream];
 	struct sst_byt *byt = pdata->byt;
@@ -294,7 +295,8 @@ static int sst_byt_pcm_close(struct snd_pcm_substream *substream)
 	return ret;
 }
 
-static int sst_byt_pcm_mmap(struct snd_pcm_substream *substream,
+static int sst_byt_pcm_mmap(struct snd_soc_component *component,
+			    struct snd_pcm_substream *substream,
 			    struct vm_area_struct *vma)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
@@ -303,22 +305,11 @@ static int sst_byt_pcm_mmap(struct snd_pcm_substream *substream,
 	return snd_pcm_lib_default_mmap(substream, vma);
 }
 
-static const struct snd_pcm_ops sst_byt_pcm_ops = {
-	.open		= sst_byt_pcm_open,
-	.close		= sst_byt_pcm_close,
-	.ioctl		= snd_pcm_lib_ioctl,
-	.hw_params	= sst_byt_pcm_hw_params,
-	.hw_free	= sst_byt_pcm_hw_free,
-	.trigger	= sst_byt_pcm_trigger,
-	.pointer	= sst_byt_pcm_pointer,
-	.mmap		= sst_byt_pcm_mmap,
-};
-
-static int sst_byt_pcm_new(struct snd_soc_pcm_runtime *rtd)
+static int sst_byt_pcm_new(struct snd_soc_component *component,
+			   struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_pcm *pcm = rtd->pcm;
 	size_t size;
-	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	struct sst_pdata *pdata = dev_get_platdata(component->dev);
 
 	if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream ||
@@ -380,8 +371,15 @@ static int sst_byt_pcm_probe(struct snd_soc_component *component)
 static const struct snd_soc_component_driver byt_dai_component = {
 	.name		= DRV_NAME,
 	.probe		= sst_byt_pcm_probe,
-	.ops		= &sst_byt_pcm_ops,
-	.pcm_new	= sst_byt_pcm_new,
+	.open		= sst_byt_pcm_open,
+	.close		= sst_byt_pcm_close,
+	.ioctl		= snd_soc_pcm_lib_ioctl,
+	.hw_params	= sst_byt_pcm_hw_params,
+	.hw_free	= sst_byt_pcm_hw_free,
+	.trigger	= sst_byt_pcm_trigger,
+	.pointer	= sst_byt_pcm_pointer,
+	.mmap		= sst_byt_pcm_mmap,
+	.pcm_construct	= sst_byt_pcm_new,
 };
 
 #ifdef CONFIG_PM
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
