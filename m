Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DECA6144381
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jan 2020 18:43:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85BAF16B9;
	Tue, 21 Jan 2020 18:43:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85BAF16B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579628631;
	bh=ZTxjlAt4huK23/81dKgwEjv6hTxFmSOdS3hQAo2ZV8s=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=d9Vp9vPPrwSdlYS6K5HNzLBqezRgECTPbl4zS/gm9WenKCswJt26+1sBcnNBtww/z
	 xMuQWDLOkZkCeGRwu3UrOCmsSIkL4t+8JEFDWdu8rI6HZfB1zfxcR/dfQGvxQ9BcrQ
	 3MdDsqs00OCitDNMPjbfIEXO86vIae9BlsMAtU1c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09F01F80384;
	Tue, 21 Jan 2020 18:29:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EE39F8034A; Tue, 21 Jan 2020 18:29:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 661B6F80333
 for <alsa-devel@alsa-project.org>; Tue, 21 Jan 2020 18:28:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 661B6F80333
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2A5130E;
 Tue, 21 Jan 2020 09:28:58 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 52D533F6C4;
 Tue, 21 Jan 2020 09:28:58 -0800 (PST)
Date: Tue, 21 Jan 2020 17:28:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
In-Reply-To: <1579505286-32085-1-git-send-email-shengjiu.wang@nxp.com>
Message-Id: <applied-1579505286-32085-1-git-send-email-shengjiu.wang@nxp.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, tiwai@suse.com,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 Mark Brown <broonie@kernel.org>, john.stultz@linaro.org
Subject: [alsa-devel] Applied "ASoC: soc-generic-dmaengine-pcm: Fix error
	handling" to the asoc tree
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

   ASoC: soc-generic-dmaengine-pcm: Fix error handling

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

From 130128098a4e5ce9a0dfbdf9a7e27a43579901fd Mon Sep 17 00:00:00 2001
From: Shengjiu Wang <shengjiu.wang@nxp.com>
Date: Mon, 20 Jan 2020 15:28:06 +0800
Subject: [PATCH] ASoC: soc-generic-dmaengine-pcm: Fix error handling

Remove the return value checking, that is to align with the code
before adding snd_dmaengine_pcm_refine_runtime_hwparams function.

Otherwise it causes a regression on the HiKey board:

[   17.721424] hi6210_i2s f7118000.i2s: ASoC: can't open component f7118000.i2s: -6

Fixes: e957204e732b ("ASoC: pcm_dmaengine: Extract snd_dmaengine_pcm_refine_runtime_hwparams")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reported-by: John Stultz <john.stultz@linaro.org>
Link: https://lore.kernel.org/r/1579505286-32085-1-git-send-email-shengjiu.wang@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-generic-dmaengine-pcm.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index a428ff393ea2..2b5f3b1b062b 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -117,7 +117,6 @@ dmaengine_pcm_set_runtime_hwparams(struct snd_soc_component *component,
 	struct dma_chan *chan = pcm->chan[substream->stream];
 	struct snd_dmaengine_dai_dma_data *dma_data;
 	struct snd_pcm_hardware hw;
-	int ret;
 
 	if (pcm->config && pcm->config->pcm_hardware)
 		return snd_soc_set_runtime_hwparams(substream,
@@ -138,12 +137,15 @@ dmaengine_pcm_set_runtime_hwparams(struct snd_soc_component *component,
 	if (pcm->flags & SND_DMAENGINE_PCM_FLAG_NO_RESIDUE)
 		hw.info |= SNDRV_PCM_INFO_BATCH;
 
-	ret = snd_dmaengine_pcm_refine_runtime_hwparams(substream,
-							dma_data,
-							&hw,
-							chan);
-	if (ret)
-		return ret;
+	/**
+	 * FIXME: Remove the return value check to align with the code
+	 * before adding snd_dmaengine_pcm_refine_runtime_hwparams
+	 * function.
+	 */
+	snd_dmaengine_pcm_refine_runtime_hwparams(substream,
+						  dma_data,
+						  &hw,
+						  chan);
 
 	return snd_soc_set_runtime_hwparams(substream, &hw);
 }
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
