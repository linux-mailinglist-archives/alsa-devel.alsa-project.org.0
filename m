Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D925F2B8BCF
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Nov 2020 07:49:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 733BA16FC;
	Thu, 19 Nov 2020 07:48:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 733BA16FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605768559;
	bh=xlMDvyuJZmqqHSqC3GxdywG2nmgIJ7ckgH4H7jGlHds=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=scvVHw5bIcvz81aK+WpTWKfkNO+rg/9QhbvNe0MFlh9kwKgreKSnpE8ZJ9MgoPvO3
	 R3P/VIak8zmE+mqaLcfyZk5QjteW0S+LhXaWFhEin4IxXyWrVZNws+BgPQddqElZIJ
	 SQDtvkNbpEO6ORsodg8p7ClQX3tbFwUIx01vEwWE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE106F800EE;
	Thu, 19 Nov 2020 07:47:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C024BF801ED; Thu, 19 Nov 2020 07:47:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7D65F800EE
 for <alsa-devel@alsa-project.org>; Thu, 19 Nov 2020 07:47:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7D65F800EE
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 4D3481A197F;
 Thu, 19 Nov 2020 07:47:30 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 1531E1A1962;
 Thu, 19 Nov 2020 07:47:26 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id BBEB34024F;
 Thu, 19 Nov 2020 07:47:20 +0100 (CET)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org
Subject: [PATCH v2] ASoC: fsl_sai: Correct the clock source for mclk0
Date: Thu, 19 Nov 2020 14:40:38 +0800
Message-Id: <1605768038-4582-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On VF610, mclk0 = bus_clk;
On i.MX6SX/6UL/6ULL/7D, mclk0 = mclk1;
On i.MX7ULP, mclk0 = bus_clk;
On i.MX8QM/8QXP, mclk0 = bus_clk;
On i.MX8MQ/8MN/8MM/8MP, mclk0 = bus_clk;

So add variable mclk0_is_mclk1 in fsl_sai_soc_data to
distinguish these platforms.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
changes in v2:
- rename mclk0_mclk1_match to mclk0_is_mclk1
- skip MCLK0 when it is same as MCLK1 on master clock scanning

 sound/soc/fsl/fsl_sai.c | 20 ++++++++++++++++++--
 sound/soc/fsl/fsl_sai.h |  1 +
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 3e5c1eaccd5e..f3d3d20d35d7 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -359,7 +359,14 @@ static int fsl_sai_set_bclk(struct snd_soc_dai *dai, bool tx, u32 freq)
 	if (sai->is_slave_mode)
 		return 0;
 
-	for (id = 0; id < FSL_SAI_MCLK_MAX; id++) {
+	/*
+	 * There is no point in polling MCLK0 if it is identical to MCLK1.
+	 * And given that MQS use case has to use MCLK1 though two clocks
+	 * are the same, we simply skip MCLK0 and start to find from MCLK1.
+	 */
+	id = sai->soc_data->mclk0_is_mclk1 ? 1 : 0;
+
+	for (; id < FSL_SAI_MCLK_MAX; id++) {
 		clk_rate = clk_get_rate(sai->mclk_clk[id]);
 		if (!clk_rate)
 			continue;
@@ -1040,7 +1047,6 @@ static int fsl_sai_probe(struct platform_device *pdev)
 		sai->bus_clk = NULL;
 	}
 
-	sai->mclk_clk[0] = sai->bus_clk;
 	for (i = 1; i < FSL_SAI_MCLK_MAX; i++) {
 		sprintf(tmp, "mclk%d", i);
 		sai->mclk_clk[i] = devm_clk_get(&pdev->dev, tmp);
@@ -1051,6 +1057,11 @@ static int fsl_sai_probe(struct platform_device *pdev)
 		}
 	}
 
+	if (sai->soc_data->mclk0_is_mclk1)
+		sai->mclk_clk[0] = sai->mclk_clk[1];
+	else
+		sai->mclk_clk[0] = sai->bus_clk;
+
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
@@ -1165,6 +1176,7 @@ static const struct fsl_sai_soc_data fsl_sai_vf610_data = {
 	.use_edma = false,
 	.fifo_depth = 32,
 	.reg_offset = 0,
+	.mclk0_is_mclk1 = false,
 };
 
 static const struct fsl_sai_soc_data fsl_sai_imx6sx_data = {
@@ -1172,6 +1184,7 @@ static const struct fsl_sai_soc_data fsl_sai_imx6sx_data = {
 	.use_edma = false,
 	.fifo_depth = 32,
 	.reg_offset = 0,
+	.mclk0_is_mclk1 = true,
 };
 
 static const struct fsl_sai_soc_data fsl_sai_imx7ulp_data = {
@@ -1179,6 +1192,7 @@ static const struct fsl_sai_soc_data fsl_sai_imx7ulp_data = {
 	.use_edma = false,
 	.fifo_depth = 16,
 	.reg_offset = 8,
+	.mclk0_is_mclk1 = false,
 };
 
 static const struct fsl_sai_soc_data fsl_sai_imx8mq_data = {
@@ -1186,6 +1200,7 @@ static const struct fsl_sai_soc_data fsl_sai_imx8mq_data = {
 	.use_edma = false,
 	.fifo_depth = 128,
 	.reg_offset = 8,
+	.mclk0_is_mclk1 = false,
 };
 
 static const struct fsl_sai_soc_data fsl_sai_imx8qm_data = {
@@ -1193,6 +1208,7 @@ static const struct fsl_sai_soc_data fsl_sai_imx8qm_data = {
 	.use_edma = true,
 	.fifo_depth = 64,
 	.reg_offset = 0,
+	.mclk0_is_mclk1 = false,
 };
 
 static const struct of_device_id fsl_sai_ids[] = {
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index 4bbcd0dbe8f1..ff2619f1b214 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -219,6 +219,7 @@
 struct fsl_sai_soc_data {
 	bool use_imx_pcm;
 	bool use_edma;
+	bool mclk0_is_mclk1;
 	unsigned int fifo_depth;
 	unsigned int reg_offset;
 };
-- 
2.27.0

