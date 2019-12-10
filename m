Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D13118B32
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 15:39:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0702A16B8;
	Tue, 10 Dec 2019 15:38:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0702A16B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575988741;
	bh=BFIiXBo9Mt3q6FVJVeyCijR4GOKPxp7Fp5XwZQ334II=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JIsqCElUysLLEhR8c7LIgQYkrZPru5QwSPfq/0UWTxQhBoNIfIXPdAjyu2Zs5uoJv
	 /NVDrpS7/BP4PU0KJLZv2H1FdFarV1ANYj+cLH+cOXJVkdGkQ8OU/uLBemMvo3MDBH
	 jztiCNI3b0lZD4235mD6k4appAJ78gv0YEhUHnYo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AB74F80329;
	Tue, 10 Dec 2019 15:27:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A56BAF802A0; Tue, 10 Dec 2019 15:26:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 570E8F80260
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 15:26:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 570E8F80260
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 691A2B208;
 Tue, 10 Dec 2019 14:26:26 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Date: Tue, 10 Dec 2019 15:26:05 +0100
Message-Id: <20191210142614.19405-15-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210142614.19405-1-tiwai@suse.de>
References: <20191210142614.19405-1-tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.de>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH for-5.6 14/23] ASoC: uniphier: Use managed
	buffer allocation
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

Clean up the driver with the new managed buffer allocation API.
The hw_params and hw_free callbacks became superfluous and got
dropped, as well as the pcm_destruct callback just containing the
superfluous snd_pcm_lib_preallocate_free_for_all() call.

Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/uniphier/aio-dma.c | 30 +-----------------------------
 1 file changed, 1 insertion(+), 29 deletions(-)

diff --git a/sound/soc/uniphier/aio-dma.c b/sound/soc/uniphier/aio-dma.c
index 700d936ed94e..388f4785d93a 100644
--- a/sound/soc/uniphier/aio-dma.c
+++ b/sound/soc/uniphier/aio-dma.c
@@ -104,25 +104,6 @@ static int uniphier_aiodma_open(struct snd_soc_component *component,
 		SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 256);
 }
 
-static int uniphier_aiodma_hw_params(struct snd_soc_component *component,
-				     struct snd_pcm_substream *substream,
-				     struct snd_pcm_hw_params *params)
-{
-	snd_pcm_set_runtime_buffer(substream, &substream->dma_buffer);
-	substream->runtime->dma_bytes = params_buffer_bytes(params);
-
-	return 0;
-}
-
-static int uniphier_aiodma_hw_free(struct snd_soc_component *component,
-				   struct snd_pcm_substream *substream)
-{
-	snd_pcm_set_runtime_buffer(substream, NULL);
-	substream->runtime->dma_bytes = 0;
-
-	return 0;
-}
-
 static int uniphier_aiodma_prepare(struct snd_soc_component *component,
 				   struct snd_pcm_substream *substream)
 {
@@ -232,30 +213,21 @@ static int uniphier_aiodma_new(struct snd_soc_component *component,
 	if (ret)
 		return ret;
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm,
+	snd_pcm_set_managed_buffer_all(pcm,
 		SNDRV_DMA_TYPE_DEV, dev,
 		uniphier_aiodma_hw.buffer_bytes_max,
 		uniphier_aiodma_hw.buffer_bytes_max);
 	return 0;
 }
 
-static void uniphier_aiodma_free(struct snd_soc_component *component,
-				 struct snd_pcm *pcm)
-{
-	snd_pcm_lib_preallocate_free_for_all(pcm);
-}
-
 static const struct snd_soc_component_driver uniphier_soc_platform = {
 	.open		= uniphier_aiodma_open,
 	.ioctl		= snd_soc_pcm_lib_ioctl,
-	.hw_params	= uniphier_aiodma_hw_params,
-	.hw_free	= uniphier_aiodma_hw_free,
 	.prepare	= uniphier_aiodma_prepare,
 	.trigger	= uniphier_aiodma_trigger,
 	.pointer	= uniphier_aiodma_pointer,
 	.mmap		= uniphier_aiodma_mmap,
 	.pcm_construct	= uniphier_aiodma_new,
-	.pcm_destruct	= uniphier_aiodma_free,
 	.compr_ops	= &uniphier_aio_compr_ops,
 };
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
