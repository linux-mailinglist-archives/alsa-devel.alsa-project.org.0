Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C37FF11B9A6
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2019 18:09:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 501551669;
	Wed, 11 Dec 2019 18:08:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 501551669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576084153;
	bh=3uj7sY7BBxmr3I3qDbelB2syB1YByuK1CZzhyJbFGCg=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=eIVNbcPUxiu1GzRFp7fVjuyJR+qr4pLavY9FaRVi6Q2qlDuEDJHxPfpr3b2Rs0pDA
	 BAaUVPm7TgSq6dmCJ39m60Bb2Zv38VVap/hsJkv9mkGL+9cotuPoI7HSgB9OC13wA3
	 +SfPlhMjFwOrt/g6y2DGgfoBXEemGhkYBLiyCayE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3CFBF8034E;
	Wed, 11 Dec 2019 17:54:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBF4AF80345; Wed, 11 Dec 2019 17:54:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 77911F80338
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 17:53:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77911F80338
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C74B330E;
 Wed, 11 Dec 2019 08:53:58 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 427593F52E;
 Wed, 11 Dec 2019 08:53:58 -0800 (PST)
Date: Wed, 11 Dec 2019 16:53:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <20191210142614.19405-3-tiwai@suse.de>
Message-Id: <applied-20191210142614.19405-3-tiwai@suse.de>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: au1x: Use managed buffer allocation" to
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

   ASoC: au1x: Use managed buffer allocation

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

From fe9912ac58e4fa205faabcccc980eb834cc5f1aa Mon Sep 17 00:00:00 2001
From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 10 Dec 2019 15:25:53 +0100
Subject: [PATCH] ASoC: au1x: Use managed buffer allocation

Clean up the drivers with the new managed buffer allocation API.
The superfluous snd_pcm_lib_malloc_pages() and
snd_pcm_lib_free_pages() calls are dropped.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/r/20191210142614.19405-3-tiwai@suse.de
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/au1x/dbdma2.c | 14 +-------------
 sound/soc/au1x/dma.c    | 21 ++++++---------------
 2 files changed, 7 insertions(+), 28 deletions(-)

diff --git a/sound/soc/au1x/dbdma2.c b/sound/soc/au1x/dbdma2.c
index 4c74698d31b3..8f855644c6b4 100644
--- a/sound/soc/au1x/dbdma2.c
+++ b/sound/soc/au1x/dbdma2.c
@@ -197,10 +197,6 @@ static int au1xpsc_pcm_hw_params(struct snd_soc_component *component,
 	struct au1xpsc_audio_dmadata *pcd;
 	int stype, ret;
 
-	ret = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(params));
-	if (ret < 0)
-		goto out;
-
 	stype = substream->stream;
 	pcd = to_dmadata(substream, component);
 
@@ -232,13 +228,6 @@ static int au1xpsc_pcm_hw_params(struct snd_soc_component *component,
 	return ret;
 }
 
-static int au1xpsc_pcm_hw_free(struct snd_soc_component *component,
-			       struct snd_pcm_substream *substream)
-{
-	snd_pcm_lib_free_pages(substream);
-	return 0;
-}
-
 static int au1xpsc_pcm_prepare(struct snd_soc_component *component,
 			       struct snd_pcm_substream *substream)
 {
@@ -315,7 +304,7 @@ static int au1xpsc_pcm_new(struct snd_soc_component *component,
 	struct snd_card *card = rtd->card->snd_card;
 	struct snd_pcm *pcm = rtd->pcm;
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
 		card->dev, AU1XPSC_BUFFER_MIN_BYTES, (4096 * 1024) - 1);
 
 	return 0;
@@ -327,7 +316,6 @@ static struct snd_soc_component_driver au1xpsc_soc_component = {
 	.open		= au1xpsc_pcm_open,
 	.close		= au1xpsc_pcm_close,
 	.hw_params	= au1xpsc_pcm_hw_params,
-	.hw_free	= au1xpsc_pcm_hw_free,
 	.prepare	= au1xpsc_pcm_prepare,
 	.trigger	= au1xpsc_pcm_trigger,
 	.pointer	= au1xpsc_pcm_pointer,
diff --git a/sound/soc/au1x/dma.c b/sound/soc/au1x/dma.c
index 520eb7b24a92..c9a038a5e2d3 100644
--- a/sound/soc/au1x/dma.c
+++ b/sound/soc/au1x/dma.c
@@ -231,19 +231,10 @@ static int alchemy_pcm_hw_params(struct snd_soc_component *component,
 				 struct snd_pcm_hw_params *hw_params)
 {
 	struct audio_stream *stream = ss_to_as(substream, component);
-	int err;
-
-	err = snd_pcm_lib_malloc_pages(substream,
-				       params_buffer_bytes(hw_params));
-	if (err < 0)
-		return err;
-	err = au1000_setup_dma_link(stream,
-				    params_period_bytes(hw_params),
-				    params_periods(hw_params));
-	if (err)
-		snd_pcm_lib_free_pages(substream);
 
-	return err;
+	return au1000_setup_dma_link(stream,
+				     params_period_bytes(hw_params),
+				     params_periods(hw_params));
 }
 
 static int alchemy_pcm_hw_free(struct snd_soc_component *component,
@@ -251,7 +242,7 @@ static int alchemy_pcm_hw_free(struct snd_soc_component *component,
 {
 	struct audio_stream *stream = ss_to_as(substream, component);
 	au1000_release_dma_link(stream);
-	return snd_pcm_lib_free_pages(substream);
+	return 0;
 }
 
 static int alchemy_pcm_trigger(struct snd_soc_component *component,
@@ -292,8 +283,8 @@ static int alchemy_pcm_new(struct snd_soc_component *component,
 {
 	struct snd_pcm *pcm = rtd->pcm;
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_CONTINUOUS,
-					      NULL, 65536, (4096 * 1024) - 1);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_CONTINUOUS,
+				       NULL, 65536, (4096 * 1024) - 1);
 
 	return 0;
 }
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
