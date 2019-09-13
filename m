Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67337B260B
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2019 21:30:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF4001676;
	Fri, 13 Sep 2019 21:29:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF4001676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568403006;
	bh=hRfAmclYqfyYUE08KGiWGqQBoLcYleMsAFssuq7IiYg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IEJh+4hrPyMvmGt9z5CnNFah4mJdF6gGzJlvF962fnU6Zg/0X1jZXFZv+PXEfaLtg
	 rkyws9lXQm+JbgBdendp7EXuuGRBTQPsYOvj+gM1QA4gl111uOWJWyBO9WBeegTVAb
	 crCoidy1G0Hmg3j/6jCLm2pN07U5/I4QPaKQ5K5E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B990F80323;
	Fri, 13 Sep 2019 21:28:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 480C5F8044B; Fri, 13 Sep 2019 21:28:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49585F80323
 for <alsa-devel@alsa-project.org>; Fri, 13 Sep 2019 21:28:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49585F80323
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 2D3CB1A0189;
 Fri, 13 Sep 2019 21:28:11 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 204D41A00D0;
 Fri, 13 Sep 2019 21:28:11 +0200 (CEST)
Received: from fsr-ub1864-103.ea.freescale.net
 (fsr-ub1864-103.ea.freescale.net [10.171.82.17])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 93EEE205DB;
 Fri, 13 Sep 2019 21:28:10 +0200 (CEST)
From: Daniel Baluta <daniel.baluta@nxp.com>
To: broonie@kernel.org
Date: Fri, 13 Sep 2019 22:28:05 +0300
Message-Id: <20190913192807.8423-2-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190913192807.8423-1-daniel.baluta@nxp.com>
References: <20190913192807.8423-1-daniel.baluta@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Daniel Baluta <daniel.baluta@nxp.com>, alsa-devel@alsa-project.org,
 timur@kernel.org, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, nicoleotsuka@gmail.com,
 Mihai Serban <mihai.serban@nxp.com>, festevam@gmail.com
Subject: [alsa-devel] [PATCH v2 1/3] ASoC: fsl_sai: Fix noise when using EDMA
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

From: Mihai Serban <mihai.serban@nxp.com>

EDMA requires the period size to be multiple of maxburst. Otherwise the
remaining bytes are not transferred and thus noise is produced.

We can handle this issue by adding a constraint on
SNDRV_PCM_HW_PARAM_PERIOD_SIZE to be multiple of tx/rx maxburst value.

Signed-off-by: Mihai Serban <mihai.serban@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
Changes since v1:
* rename variable to use_edma as per Nicolin's suggestion.

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
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
