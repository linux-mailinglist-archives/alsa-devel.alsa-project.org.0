Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A090311B9A0
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2019 18:08:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36E1A1681;
	Wed, 11 Dec 2019 18:07:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36E1A1681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576084113;
	bh=2vrEHgUsT39fnimR1CGAvxppB6jtNXps/emP6gro4s4=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=kaW3vQydfaC8Wz/qWh8ss1CfqhVJp3oSBeRTGj+w8Y8R4Mi6zmyt2YUExrcE1jHmQ
	 tb7j89Asua3c/feAzTNXalCxePs+puNmqFGQJeAPy8ey+VtmB/V4/spJ/Y01PNehAw
	 /LWb76y2AEO8eRqN3MShw2gzHkqajkHQdrHjINLE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A444BF80350;
	Wed, 11 Dec 2019 17:54:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3EABDF801F4; Wed, 11 Dec 2019 17:54:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 74CB8F801F4
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 17:53:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74CB8F801F4
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E284231B;
 Wed, 11 Dec 2019 08:53:53 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6260C3F52E;
 Wed, 11 Dec 2019 08:53:53 -0800 (PST)
Date: Wed, 11 Dec 2019 16:53:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <20191210142614.19405-6-tiwai@suse.de>
Message-Id: <applied-20191210142614.19405-6-tiwai@suse.de>
X-Patchwork-Hint: ignore
Cc: Kevin Hilman <khilman@baylibre.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] Applied "ASoC: meson: Use managed buffer allocation"
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

   ASoC: meson: Use managed buffer allocation

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

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

From bace3caa82e1f0b5b667e35b532534b9cbdc4338 Mon Sep 17 00:00:00 2001
From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 10 Dec 2019 15:25:56 +0100
Subject: [PATCH] ASoC: meson: Use managed buffer allocation

Clean up the driver with the new managed buffer allocation API.
The superfluous snd_pcm_lib_malloc_pages() and
snd_pcm_lib_free_pages() calls are dropped.

Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Acked-by: Jerome Brunet <jbrunet@baylibre.com>
Link: https://lore.kernel.org/r/20191210142614.19405-6-tiwai@suse.de
Signed-off-by: Mark Brown <broonie@kernel.org>
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
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
