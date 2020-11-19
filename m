Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 558502B8A25
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Nov 2020 03:37:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF54C16C7;
	Thu, 19 Nov 2020 03:37:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF54C16C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605753477;
	bh=Z2ZJXVC80KQB87QlPYsIL+O345hoBgvvoTO1dEB6vPE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=S4O8iAUVEvAAa+gKQd7qdue/jGjvLoi20DqjjiRAhvJGkaITvIc/RtJMNmAgae8cw
	 +MwBtCR2CFZL+ynvT+u8HwlTWuSNTk+pyLy0uEAAxNReBO+kj0QlZ8wcYyHtA8+sRv
	 XGmm+gr87TVsg8tLkC+AZqMDyE3kHpoAXSZm4rog=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C2C7F801F5;
	Thu, 19 Nov 2020 03:36:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E9D6F801ED; Thu, 19 Nov 2020 03:36:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14A67F800C5
 for <alsa-devel@alsa-project.org>; Thu, 19 Nov 2020 03:36:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14A67F800C5
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B5FD21A04EF;
 Thu, 19 Nov 2020 03:36:03 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A58311A0526;
 Thu, 19 Nov 2020 03:35:59 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 5694C4031E;
 Thu, 19 Nov 2020 03:35:54 +0100 (CET)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: fsl_sai: Correct the clock source for mclk0
Date: Thu, 19 Nov 2020 10:29:16 +0800
Message-Id: <1605752956-17397-1-git-send-email-shengjiu.wang@nxp.com>
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

So add variable mclk0_mclk1_match in fsl_sai_soc_data to
distinguish these platforms.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 11 ++++++++++-
 sound/soc/fsl/fsl_sai.h |  1 +
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 3e5c1eaccd5e..479fd27ace35 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1040,7 +1040,6 @@ static int fsl_sai_probe(struct platform_device *pdev)
 		sai->bus_clk = NULL;
 	}
 
-	sai->mclk_clk[0] = sai->bus_clk;
 	for (i = 1; i < FSL_SAI_MCLK_MAX; i++) {
 		sprintf(tmp, "mclk%d", i);
 		sai->mclk_clk[i] = devm_clk_get(&pdev->dev, tmp);
@@ -1051,6 +1050,11 @@ static int fsl_sai_probe(struct platform_device *pdev)
 		}
 	}
 
+	if (sai->soc_data->mclk0_mclk1_match)
+		sai->mclk_clk[0] = sai->mclk_clk[1];
+	else
+		sai->mclk_clk[0] = sai->bus_clk;
+
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
@@ -1165,6 +1169,7 @@ static const struct fsl_sai_soc_data fsl_sai_vf610_data = {
 	.use_edma = false,
 	.fifo_depth = 32,
 	.reg_offset = 0,
+	.mclk0_mclk1_match = false,
 };
 
 static const struct fsl_sai_soc_data fsl_sai_imx6sx_data = {
@@ -1172,6 +1177,7 @@ static const struct fsl_sai_soc_data fsl_sai_imx6sx_data = {
 	.use_edma = false,
 	.fifo_depth = 32,
 	.reg_offset = 0,
+	.mclk0_mclk1_match = true,
 };
 
 static const struct fsl_sai_soc_data fsl_sai_imx7ulp_data = {
@@ -1179,6 +1185,7 @@ static const struct fsl_sai_soc_data fsl_sai_imx7ulp_data = {
 	.use_edma = false,
 	.fifo_depth = 16,
 	.reg_offset = 8,
+	.mclk0_mclk1_match = false,
 };
 
 static const struct fsl_sai_soc_data fsl_sai_imx8mq_data = {
@@ -1186,6 +1193,7 @@ static const struct fsl_sai_soc_data fsl_sai_imx8mq_data = {
 	.use_edma = false,
 	.fifo_depth = 128,
 	.reg_offset = 8,
+	.mclk0_mclk1_match = false,
 };
 
 static const struct fsl_sai_soc_data fsl_sai_imx8qm_data = {
@@ -1193,6 +1201,7 @@ static const struct fsl_sai_soc_data fsl_sai_imx8qm_data = {
 	.use_edma = true,
 	.fifo_depth = 64,
 	.reg_offset = 0,
+	.mclk0_mclk1_match = false,
 };
 
 static const struct of_device_id fsl_sai_ids[] = {
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index 4bbcd0dbe8f1..390a9ca3b531 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -219,6 +219,7 @@
 struct fsl_sai_soc_data {
 	bool use_imx_pcm;
 	bool use_edma;
+	bool mclk0_mclk1_match;
 	unsigned int fifo_depth;
 	unsigned int reg_offset;
 };
-- 
2.27.0

