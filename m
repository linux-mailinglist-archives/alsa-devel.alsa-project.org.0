Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EA884D6E
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2019 15:34:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3D7C85D;
	Wed,  7 Aug 2019 15:33:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3D7C85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565184881;
	bh=oMZoqn5SU0zovP/znKwjmWV/sTs+FnatTfjYCa1wbTE=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=KfdExjoGVZ9VGYkf4tIzKKbTq20NAOFxueb5ib18mo0/aK7R2E1dE8vXqnVnM9Tsm
	 FxIql/bOVrITK3/qRwqXOhBY1+FyOOY9Xz+V2ZqWCRKBCmd559miLAkVbS24QazZaq
	 3Be+DOaAUFh5P8yG5VzyDmtKJhGKUaqyQqfsmjjM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F12EF805F7;
	Wed,  7 Aug 2019 15:31:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1370CF805FB; Wed,  7 Aug 2019 15:30:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44AE2F80529
 for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2019 15:30:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44AE2F80529
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="rwRWB8D+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=2EbYTAqI4zLOFVUYBUHF/BE1UcTYirfxLUj8k3Q4Nh8=; b=rwRWB8D+EP/r
 y2l2Zf6wdcIIFVMHu5VxN3NvzqClPMRV9k8tlI75E6a/+E6KdhGWSVLRHi8wFfR3UNcGD9PtNf/mX
 649w19tiNe6iuBQ2IbRGAQfi0et1MFjpj99a+uxVnIqRR/Y/c5XhRhLk4QwPb4jpvlR7niSkKK5CU
 vRi78=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hvM1f-0007fA-LY; Wed, 07 Aug 2019 13:30:47 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 05EA42742B9E; Wed,  7 Aug 2019 14:30:46 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
In-Reply-To: <20190806151214.6783-3-daniel.baluta@nxp.com>
X-Patchwork-Hint: ignore
Message-Id: <20190807133047.05EA42742B9E@ypsilon.sirena.org.uk>
Date: Wed,  7 Aug 2019 14:30:46 +0100 (BST)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, timur@kernel.org,
 robh@kernel.org, shengjiu.wang@nxp.com, angus@akkea.ca,
 linux-kernel@vger.kernel.org, tiwai@suse.com,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-imx@nxp.com, kernel@pengutronix.de, festevam@gmail.com,
 mihai.serban@gmail.com, l.stach@pengutronix.de
Subject: [alsa-devel] Applied "ASoC: fsl_sai: Update Tx/Rx channel enable
	mask" to the asoc tree
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

   ASoC: fsl_sai: Update Tx/Rx channel enable mask

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From b84f50b0fcb497a62068926fca793d2d213c7dbd Mon Sep 17 00:00:00 2001
From: Daniel Baluta <daniel.baluta@nxp.com>
Date: Tue, 6 Aug 2019 18:12:11 +0300
Subject: [PATCH] ASoC: fsl_sai: Update Tx/Rx channel enable mask

Tx channel enable (TCE) / Rx channel enable (RCE) bits
enable corresponding data channel for Tx/Rx operation.

Because SAI supports up the 8 channels TCE/RCE occupy
up the 8 bits inside TCR3/RCR3 registers we need to extend
the mask to reflect this.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
Link: https://lore.kernel.org/r/20190806151214.6783-3-daniel.baluta@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl_sai.c | 6 ++++--
 sound/soc/fsl/fsl_sai.h | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index e4221f2a5ee3..f2698c94c9fe 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -599,7 +599,8 @@ static int fsl_sai_startup(struct snd_pcm_substream *substream,
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 	int ret;
 
-	regmap_update_bits(sai->regmap, FSL_SAI_xCR3(tx), FSL_SAI_CR3_TRCE,
+	regmap_update_bits(sai->regmap, FSL_SAI_xCR3(tx),
+			   FSL_SAI_CR3_TRCE_MASK,
 			   FSL_SAI_CR3_TRCE);
 
 	ret = snd_pcm_hw_constraint_list(substream->runtime, 0,
@@ -614,7 +615,8 @@ static void fsl_sai_shutdown(struct snd_pcm_substream *substream,
 	struct fsl_sai *sai = snd_soc_dai_get_drvdata(cpu_dai);
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 
-	regmap_update_bits(sai->regmap, FSL_SAI_xCR3(tx), FSL_SAI_CR3_TRCE, 0);
+	regmap_update_bits(sai->regmap, FSL_SAI_xCR3(tx),
+			   FSL_SAI_CR3_TRCE_MASK, 0);
 }
 
 static const struct snd_soc_dai_ops fsl_sai_pcm_dai_ops = {
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index 4bb478041d67..20c5b9b1e8bc 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -110,6 +110,7 @@
 
 /* SAI Transmit and Receive Configuration 3 Register */
 #define FSL_SAI_CR3_TRCE	BIT(16)
+#define FSL_SAI_CR3_TRCE_MASK	GENMASK(23, 16)
 #define FSL_SAI_CR3_WDFL(x)	(x)
 #define FSL_SAI_CR3_WDFL_MASK	0x1f
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
