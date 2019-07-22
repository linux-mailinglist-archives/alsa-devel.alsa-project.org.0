Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D37BF6FFA4
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 14:29:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6CE351775;
	Mon, 22 Jul 2019 14:28:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6CE351775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563798565;
	bh=Hcmvyqjn66ATN+09hcFnHbJZ5trPIr2s63Bgr5SDQmY=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=vjojBdDJRC7hsqJfIirW/dbf67W1/8/hnRAtLAKHTEX5Xb0mRVXhFwDms/UBGJdwW
	 Rf+NvZSDtS0c3LPUOuJnq+CkRgrN8k4SsIBr66gl0gFbZVo0xY1NEgMx8mvKMiRQ6b
	 8Zvm49H1ZiMhP+0AuwVgT3Mv2v7RyY7ajRDFIkuw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 383C7F805A8;
	Mon, 22 Jul 2019 14:22:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CA1AF804CA; Mon, 22 Jul 2019 14:22:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2658F80481
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 14:22:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2658F80481
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="e47z/BqT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=ZNvKwA7gi1pMZ0/ZI3953m9jtIODwJEBnzyMrCs8Q4U=; b=e47z/BqTaVjv
 3bJZfreEsvZQAprl6uO4NBRebzfvXnUdTWQ+s6R40dqE2hDnYmMEv72g0c5yN2GQ+uvm9kHmP2Fn8
 M8ZGv0A4c/H64mlyTXeDtIwYEBIXCDwb38K0oWLhp29bY40lzE/S+u/5b6TxYMoQWKI7Jm8Zh3JNM
 rloqY=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpXKS-0007ci-3w; Mon, 22 Jul 2019 12:22:08 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 727672740463; Mon, 22 Jul 2019 13:22:07 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Lucas Stach <l.stach@pengutronix.de>
In-Reply-To: <20190717105635.18514-3-l.stach@pengutronix.de>
X-Patchwork-Hint: ignore
Message-Id: <20190722122207.727672740463@ypsilon.sirena.org.uk>
Date: Mon, 22 Jul 2019 13:22:07 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Angus Ainslie <angus@akkea.ca>,
 Liam Girdwood <lgirdwood@gmail.com>, patchwork-lst@pengutronix.de,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de,
 Fabio Estevam <festevam@gmail.com>
Subject: [alsa-devel] Applied "ASoC: fsl_sai: derive TX FIFO watermark from
	FIFO depth" to the asoc tree
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

   ASoC: fsl_sai: derive TX FIFO watermark from FIFO depth

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

From 8decc2428f4684ae35afec7c9aed92fba9fc4696 Mon Sep 17 00:00:00 2001
From: Lucas Stach <l.stach@pengutronix.de>
Date: Wed, 17 Jul 2019 12:56:34 +0200
Subject: [PATCH] ASoC: fsl_sai: derive TX FIFO watermark from FIFO depth

The DMA request schould be triggered as soon as the FIFO has space
for another burst. As different versions of the SAI block have
different FIFO sizes, the watrmark level needs to be derived from
version specific data.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Tested-by: Angus Ainslie <angus@akkea.ca>
Reviewed-by: Angus Ainslie <angus@akkea.ca>
Link: https://lore.kernel.org/r/20190717105635.18514-3-l.stach@pengutronix.de
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl_sai.c | 4 +++-
 sound/soc/fsl/fsl_sai.h | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index ed0432e7327a..1d1a447163e3 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -640,7 +640,7 @@ static int fsl_sai_dai_probe(struct snd_soc_dai *cpu_dai)
 	regmap_write(sai->regmap, FSL_SAI_RCSR, 0);
 
 	regmap_update_bits(sai->regmap, FSL_SAI_TCR1, FSL_SAI_CR1_RFW_MASK,
-			   FSL_SAI_MAXBURST_TX * 2);
+			   sai->soc_data->fifo_depth - FSL_SAI_MAXBURST_TX);
 	regmap_update_bits(sai->regmap, FSL_SAI_RCR1, FSL_SAI_CR1_RFW_MASK,
 			   FSL_SAI_MAXBURST_RX - 1);
 
@@ -913,10 +913,12 @@ static int fsl_sai_remove(struct platform_device *pdev)
 
 static const struct fsl_sai_soc_data fsl_sai_vf610_data = {
 	.use_imx_pcm = false,
+	.fifo_depth = 32,
 };
 
 static const struct fsl_sai_soc_data fsl_sai_imx6sx_data = {
 	.use_imx_pcm = true,
+	.fifo_depth = 32,
 };
 
 static const struct of_device_id fsl_sai_ids[] = {
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index 83e2bfe05b1b..7c1ef671da28 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -128,6 +128,7 @@
 
 struct fsl_sai_soc_data {
 	bool use_imx_pcm;
+	unsigned int fifo_depth;
 };
 
 struct fsl_sai {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
