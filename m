Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD5D118ADB
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 15:30:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32DBE16B3;
	Tue, 10 Dec 2019 15:29:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32DBE16B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575988201;
	bh=7+oD27s4Rt2Xbwq8CPTf/bKqm2Hn8cGkoUzn033vv20=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DJq0KRieI8rDOpkATfyvN07OYCrVJtd5vS8SzR9XfgEsRKoj1m0/sS9Zx33esm1am
	 maqTLlr01OxCfQluu3VFdFgkrvXkunzyItcrUd0t0q0dnJseDKsJkq1qrmJxAm3X6s
	 0InNHfYkL0KRz/qCbbNYjdgmJeA+KJSnzdEvoE7U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B443F80279;
	Tue, 10 Dec 2019 15:26:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5678CF80248; Tue, 10 Dec 2019 15:26:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16F51F80248
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 15:26:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16F51F80248
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D0C5EB1FE;
 Tue, 10 Dec 2019 14:26:25 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Date: Tue, 10 Dec 2019 15:25:56 +0100
Message-Id: <20191210142614.19405-6-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210142614.19405-1-tiwai@suse.de>
References: <20191210142614.19405-1-tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.de>, Kevin Hilman <khilman@baylibre.com>,
 alsa-devel@alsa-project.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH for-5.6 05/23] ASoC: meson: Use managed buffer
	allocation
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
The superfluous snd_pcm_lib_malloc_pages() and
snd_pcm_lib_free_pages() calls are dropped.

Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/meson/axg-fifo.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index d6f3eefb8f09..772eda857019 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -115,11 +115,6 @@ int axg_fifo_pcm_hw_params(struct snd_soc_component *component,
 	struct axg_fifo *fifo = axg_fifo_data(ss);
 	dma_addr_t end_ptr;
 	unsigned int burst_num;
-	int ret;
-
-	ret = snd_pcm_lib_malloc_pages(ss, params_buffer_bytes(params));
-	if (ret < 0)
-		return ret;
 
 	/* Setup dma memory pointers */
 	end_ptr = runtime->dma_addr + runtime->dma_bytes - AXG_FIFO_BURST;
@@ -167,7 +162,7 @@ int axg_fifo_pcm_hw_free(struct snd_soc_component *component,
 	regmap_update_bits(fifo->map, FIFO_CTRL0,
 			   CTRL0_INT_EN(FIFO_INT_COUNT_REPEAT), 0);
 
-	return snd_pcm_lib_free_pages(ss);
+	return 0;
 }
 EXPORT_SYMBOL_GPL(axg_fifo_pcm_hw_free);
 
@@ -287,9 +282,9 @@ int axg_fifo_pcm_new(struct snd_soc_pcm_runtime *rtd, unsigned int type)
 	struct snd_card *card = rtd->card->snd_card;
 	size_t size = axg_fifo_hw.buffer_bytes_max;
 
-	snd_pcm_lib_preallocate_pages(rtd->pcm->streams[type].substream,
-				      SNDRV_DMA_TYPE_DEV, card->dev,
-				      size, size);
+	snd_pcm_set_managed_buffer(rtd->pcm->streams[type].substream,
+				   SNDRV_DMA_TYPE_DEV, card->dev,
+				   size, size);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(axg_fifo_pcm_new);
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
