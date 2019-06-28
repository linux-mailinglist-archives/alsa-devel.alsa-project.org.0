Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5979E5A24D
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2019 19:29:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB85116FF;
	Fri, 28 Jun 2019 19:28:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB85116FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561742956;
	bh=XPbYbFyA0svsigybOpUtQa6lvBbMopUHSpl+NKAAf38=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=lZp6GkXVmc/5Aeg4jphAB2i3ssPRSugknZdCuMEMd6ysyr6OqqSXU3jcJ4dxh4B9e
	 obSUEEbx95A1INbxLMWp9D7XmgLVvEUXRYrNWNdatjl6IGlsLZp6WvvvoEnNUmezyu
	 JUNF92j267g2jikUOHltFEEYBMvZPiO1EcXSteh0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEA02F8981E;
	Fri, 28 Jun 2019 18:58:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE477F89784; Fri, 28 Jun 2019 18:57:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 059B3F89755
 for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2019 18:56:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 059B3F89755
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="I+0D1q8L"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=aaoW5czKvJTlSwTBmPCnc4DPGaGvNfNyzw/TZOTw9yA=; b=I+0D1q8LEHHm
 WCWPhSO5R7NxfDqYR4DViSbgjb5noTBEP1qqx4snKD7ZxPm1KmNf8SWIiZwQBzA9dgF7C7Ve8eYp9
 J9fJF+hLFt1M/iMJBylmfgVXE/C1qC5f2DcQrOhFufQaqIwcIuI5kejmwsNRz3JgGp+il9yD+6Irh
 pFlbw=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hguAm-0007BP-Ha; Fri, 28 Jun 2019 16:56:28 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id E4D91440050; Fri, 28 Jun 2019 17:56:27 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87a7e2tkx5.wl-kuninori.morimoto.gx@renesas.com>
X-Patchwork-Hint: ignore
Message-Id: <20190628165627.E4D91440050@finisterre.sirena.org.uk>
Date: Fri, 28 Jun 2019 17:56:27 +0100 (BST)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: atmel: atmel-pcm-dma.c: use
	devm_snd_dmaengine_pcm_register()" to the asoc tree
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

   ASoC: atmel: atmel-pcm-dma.c: use devm_snd_dmaengine_pcm_register()

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From 8af26493c03581ad476a77630502de6152cf013d Mon Sep 17 00:00:00 2001
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Date: Fri, 28 Jun 2019 13:07:05 +0900
Subject: [PATCH] ASoC: atmel: atmel-pcm-dma.c: use
 devm_snd_dmaengine_pcm_register()

We have devm_xxx version of snd_dmaengine_pcm_register,
let's use it.

This patch also removes related empty functions

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/atmel/atmel-pcm-dma.c |  9 ++-------
 sound/soc/atmel/atmel-pcm-pdc.c |  5 -----
 sound/soc/atmel/atmel-pcm.h     |  8 --------
 sound/soc/atmel/atmel_ssc_dai.c | 11 -----------
 4 files changed, 2 insertions(+), 31 deletions(-)

diff --git a/sound/soc/atmel/atmel-pcm-dma.c b/sound/soc/atmel/atmel-pcm-dma.c
index 042e59309bcd..db67f5ba1e9a 100644
--- a/sound/soc/atmel/atmel-pcm-dma.c
+++ b/sound/soc/atmel/atmel-pcm-dma.c
@@ -111,16 +111,11 @@ static const struct snd_dmaengine_pcm_config atmel_dmaengine_pcm_config = {
 
 int atmel_pcm_dma_platform_register(struct device *dev)
 {
-	return snd_dmaengine_pcm_register(dev, &atmel_dmaengine_pcm_config, 0);
+	return devm_snd_dmaengine_pcm_register(dev,
+					&atmel_dmaengine_pcm_config, 0);
 }
 EXPORT_SYMBOL(atmel_pcm_dma_platform_register);
 
-void atmel_pcm_dma_platform_unregister(struct device *dev)
-{
-	snd_dmaengine_pcm_unregister(dev);
-}
-EXPORT_SYMBOL(atmel_pcm_dma_platform_unregister);
-
 MODULE_AUTHOR("Bo Shen <voice.shen@atmel.com>");
 MODULE_DESCRIPTION("Atmel DMA based PCM module");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/atmel/atmel-pcm-pdc.c b/sound/soc/atmel/atmel-pcm-pdc.c
index 7e9aa7003305..ed095af866db 100644
--- a/sound/soc/atmel/atmel-pcm-pdc.c
+++ b/sound/soc/atmel/atmel-pcm-pdc.c
@@ -393,11 +393,6 @@ int atmel_pcm_pdc_platform_register(struct device *dev)
 }
 EXPORT_SYMBOL(atmel_pcm_pdc_platform_register);
 
-void atmel_pcm_pdc_platform_unregister(struct device *dev)
-{
-}
-EXPORT_SYMBOL(atmel_pcm_pdc_platform_unregister);
-
 MODULE_AUTHOR("Sedji Gaouaou <sedji.gaouaou@atmel.com>");
 MODULE_DESCRIPTION("Atmel PCM module");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/atmel/atmel-pcm.h b/sound/soc/atmel/atmel-pcm.h
index 5173c9b529ba..2e648748e5cb 100644
--- a/sound/soc/atmel/atmel-pcm.h
+++ b/sound/soc/atmel/atmel-pcm.h
@@ -72,28 +72,20 @@ struct atmel_pcm_dma_params {
 
 #if IS_ENABLED(CONFIG_SND_ATMEL_SOC_PDC)
 int atmel_pcm_pdc_platform_register(struct device *dev);
-void atmel_pcm_pdc_platform_unregister(struct device *dev);
 #else
 static inline int atmel_pcm_pdc_platform_register(struct device *dev)
 {
 	return 0;
 }
-static inline void atmel_pcm_pdc_platform_unregister(struct device *dev)
-{
-}
 #endif
 
 #if IS_ENABLED(CONFIG_SND_ATMEL_SOC_DMA)
 int atmel_pcm_dma_platform_register(struct device *dev);
-void atmel_pcm_dma_platform_unregister(struct device *dev);
 #else
 static inline int atmel_pcm_dma_platform_register(struct device *dev)
 {
 	return 0;
 }
-static inline void atmel_pcm_dma_platform_unregister(struct device *dev)
-{
-}
 #endif
 
 #endif /* _ATMEL_PCM_H */
diff --git a/sound/soc/atmel/atmel_ssc_dai.c b/sound/soc/atmel/atmel_ssc_dai.c
index b66c7789d096..6f89483ac88c 100644
--- a/sound/soc/atmel/atmel_ssc_dai.c
+++ b/sound/soc/atmel/atmel_ssc_dai.c
@@ -1012,16 +1012,6 @@ static int asoc_ssc_init(struct device *dev)
 	return 0;
 }
 
-static void asoc_ssc_exit(struct device *dev)
-{
-	struct ssc_device *ssc = dev_get_drvdata(dev);
-
-	if (ssc->pdata->use_dma)
-		atmel_pcm_dma_platform_unregister(dev);
-	else
-		atmel_pcm_pdc_platform_unregister(dev);
-}
-
 /**
  * atmel_ssc_set_audio - Allocate the specified SSC for audio use.
  */
@@ -1050,7 +1040,6 @@ void atmel_ssc_put_audio(int ssc_id)
 {
 	struct ssc_device *ssc = ssc_info[ssc_id].ssc;
 
-	asoc_ssc_exit(&ssc->pdev->dev);
 	ssc_free(ssc);
 }
 EXPORT_SYMBOL_GPL(atmel_ssc_put_audio);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
