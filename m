Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B805B5256
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Sep 2019 18:04:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 253E01670;
	Tue, 17 Sep 2019 18:03:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 253E01670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568736283;
	bh=VE3NWhwyHjvYnIvEOgGHNdwEQF19IEoL5YK4pqMjyy0=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=O2tf/IDGTO5+5/S4CnhXHYf2qmoNJKOy8hpdS/epx5K8vcedTtjAVwTzdPghpkYcA
	 FsLy5VqS75pHf77wyqGfkdBYQLjDr5zo/Pc3bvEl93Lhz6NvZUuaNuXXM2paU7Z0SG
	 RLC5DO7yzloYMlzXbsV3jqmnok9vLeC9yCp8Y/vk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E545F80361;
	Tue, 17 Sep 2019 18:02:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8037F803D6; Tue, 17 Sep 2019 18:02:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1007F802BD
 for <alsa-devel@alsa-project.org>; Tue, 17 Sep 2019 18:02:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1007F802BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Mz17ytn/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=vaCvTr8Faen7PvXlxXOwvkyQjeDJvGKNYb4c/ee5Xm8=; b=Mz17ytn/Ahg6
 Y/QaIOxdq3D2Nbni7N3IVAxkvZEguVp+G4zD/hI84aVgabyrm9tJToQNYLjyGW2TRQZJwuaHPRIXM
 TXoWQHoDMfQJGxHzZpo6jC3IoBkY1JOR5u/gGx1zxxSnabRHWlYVLGVoWC+bMn8ibL2SwQi8STfEC
 l+osY=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iAFwH-0008O9-9x; Tue, 17 Sep 2019 16:02:49 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id B319D27428FE; Tue, 17 Sep 2019 17:02:48 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Mihai Serban <mihai.serban@nxp.com>
In-Reply-To: <20190913192807.8423-2-daniel.baluta@nxp.com>
X-Patchwork-Hint: ignore
Message-Id: <20190917160248.B319D27428FE@ypsilon.sirena.org.uk>
Date: Tue, 17 Sep 2019 17:02:48 +0100 (BST)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 Daniel Baluta <daniel.baluta@nxp.com>, tiwai@suse.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, festevam@gmail.com
Subject: [alsa-devel] Applied "ASoC: fsl_sai: Fix noise when using EDMA" to
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

   ASoC: fsl_sai: Fix noise when using EDMA

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

From e75f4940e8ad0dd76527302a10c06b58bf7eb590 Mon Sep 17 00:00:00 2001
From: Mihai Serban <mihai.serban@nxp.com>
Date: Fri, 13 Sep 2019 22:28:05 +0300
Subject: [PATCH] ASoC: fsl_sai: Fix noise when using EDMA

EDMA requires the period size to be multiple of maxburst. Otherwise the
remaining bytes are not transferred and thus noise is produced.

We can handle this issue by adding a constraint on
SNDRV_PCM_HW_PARAM_PERIOD_SIZE to be multiple of tx/rx maxburst value.

Signed-off-by: Mihai Serban <mihai.serban@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
Link: https://lore.kernel.org/r/20190913192807.8423-2-daniel.baluta@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl_sai.c | 15 +++++++++++++++
 sound/soc/fsl/fsl_sai.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index ef0b74693093..b517e4bc1b87 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -628,6 +628,16 @@ static int fsl_sai_startup(struct snd_pcm_substream *substream,
 			   FSL_SAI_CR3_TRCE_MASK,
 			   FSL_SAI_CR3_TRCE);
 
+	/*
+	 * EDMA controller needs period size to be a multiple of
+	 * tx/rx maxburst
+	 */
+	if (sai->soc_data->use_edma)
+		snd_pcm_hw_constraint_step(substream->runtime, 0,
+					   SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
+					   tx ? sai->dma_params_tx.maxburst :
+					   sai->dma_params_rx.maxburst);
+
 	ret = snd_pcm_hw_constraint_list(substream->runtime, 0,
 			SNDRV_PCM_HW_PARAM_RATE, &fsl_sai_rate_constraints);
 
@@ -1026,30 +1036,35 @@ static int fsl_sai_remove(struct platform_device *pdev)
 
 static const struct fsl_sai_soc_data fsl_sai_vf610_data = {
 	.use_imx_pcm = false,
+	.use_edma = false,
 	.fifo_depth = 32,
 	.reg_offset = 0,
 };
 
 static const struct fsl_sai_soc_data fsl_sai_imx6sx_data = {
 	.use_imx_pcm = true,
+	.use_edma = false,
 	.fifo_depth = 32,
 	.reg_offset = 0,
 };
 
 static const struct fsl_sai_soc_data fsl_sai_imx7ulp_data = {
 	.use_imx_pcm = true,
+	.use_edma = false,
 	.fifo_depth = 16,
 	.reg_offset = 8,
 };
 
 static const struct fsl_sai_soc_data fsl_sai_imx8mq_data = {
 	.use_imx_pcm = true,
+	.use_edma = false,
 	.fifo_depth = 128,
 	.reg_offset = 8,
 };
 
 static const struct fsl_sai_soc_data fsl_sai_imx8qm_data = {
 	.use_imx_pcm = true,
+	.use_edma = true,
 	.fifo_depth = 64,
 	.reg_offset = 0,
 };
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index b12cb578f6d0..76b15deea80c 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -157,6 +157,7 @@
 
 struct fsl_sai_soc_data {
 	bool use_imx_pcm;
+	bool use_edma;
 	unsigned int fifo_depth;
 	unsigned int reg_offset;
 };
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
