Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB83527F75
	for <lists+alsa-devel@lfdr.de>; Mon, 16 May 2022 10:19:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE7C316B2;
	Mon, 16 May 2022 10:19:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE7C316B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652689192;
	bh=JYXJea9kmf5hom3ebnTMWmS15Cyj2ArATnXpo5WBNGA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dOvPkVRen2Vouhnk2bUCNnFX768uy7GvoESyk0AaQ7RqaWz3KtYV74Yjz1fHZ4C4l
	 A6D6PHWXMEeXvXeT4NcOGeGexKfp/BxSJbJPgi28hm7FPBR3TtKyNpWoew+QL6oxmE
	 fT07lBWTYNrL7d39K2b/gMFG6bK1w0Wr6214ov9M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E324F8027D;
	Mon, 16 May 2022 10:18:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58392F8012F; Mon, 16 May 2022 10:18:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E4CBF8012F
 for <alsa-devel@alsa-project.org>; Mon, 16 May 2022 10:18:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E4CBF8012F
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6FCD01A0475;
 Mon, 16 May 2022 10:18:44 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 38D331A0474;
 Mon, 16 May 2022 10:18:44 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id B841F180031D;
 Mon, 16 May 2022 16:18:42 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org
Subject: [PATCH 1/3] ASoC: fsl_sai: Add support for i.MX8MM
Date: Mon, 16 May 2022 16:06:10 +0800
Message-Id: <1652688372-10274-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1652688372-10274-1-git-send-email-shengjiu.wang@nxp.com>
References: <1652688372-10274-1-git-send-email-shengjiu.wang@nxp.com>
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

On i.MX8MM the max register is FSL_SAI_MCTL, which is
different with previous platform, so add max_register in
soc data to distinguish platforms.
And add specific soc data for i.MX8MM

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 17 +++++++++++++++++
 sound/soc/fsl/fsl_sai.h |  1 +
 2 files changed, 18 insertions(+)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index ffc24afb5a7a..1ac65de094b9 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1203,6 +1203,7 @@ static const struct fsl_sai_soc_data fsl_sai_vf610_data = {
 	.reg_offset = 0,
 	.mclk0_is_mclk1 = false,
 	.flags = 0,
+	.max_register = FSL_SAI_RMR,
 };
 
 static const struct fsl_sai_soc_data fsl_sai_imx6sx_data = {
@@ -1213,6 +1214,7 @@ static const struct fsl_sai_soc_data fsl_sai_imx6sx_data = {
 	.reg_offset = 0,
 	.mclk0_is_mclk1 = true,
 	.flags = 0,
+	.max_register = FSL_SAI_RMR,
 };
 
 static const struct fsl_sai_soc_data fsl_sai_imx7ulp_data = {
@@ -1223,6 +1225,7 @@ static const struct fsl_sai_soc_data fsl_sai_imx7ulp_data = {
 	.reg_offset = 8,
 	.mclk0_is_mclk1 = false,
 	.flags = PMQOS_CPU_LATENCY,
+	.max_register = FSL_SAI_RMR,
 };
 
 static const struct fsl_sai_soc_data fsl_sai_imx8mq_data = {
@@ -1233,6 +1236,7 @@ static const struct fsl_sai_soc_data fsl_sai_imx8mq_data = {
 	.reg_offset = 8,
 	.mclk0_is_mclk1 = false,
 	.flags = 0,
+	.max_register = FSL_SAI_RMR,
 };
 
 static const struct fsl_sai_soc_data fsl_sai_imx8qm_data = {
@@ -1243,6 +1247,18 @@ static const struct fsl_sai_soc_data fsl_sai_imx8qm_data = {
 	.reg_offset = 0,
 	.mclk0_is_mclk1 = false,
 	.flags = 0,
+	.max_register = FSL_SAI_RMR,
+};
+
+static const struct fsl_sai_soc_data fsl_sai_imx8mm_data = {
+	.use_imx_pcm = true,
+	.use_edma = false,
+	.fifo_depth = 128,
+	.reg_offset = 8,
+	.mclk0_is_mclk1 = false,
+	.pins = 8,
+	.flags = 0,
+	.max_register = FSL_SAI_MCTL,
 };
 
 static const struct of_device_id fsl_sai_ids[] = {
@@ -1252,6 +1268,7 @@ static const struct of_device_id fsl_sai_ids[] = {
 	{ .compatible = "fsl,imx7ulp-sai", .data = &fsl_sai_imx7ulp_data },
 	{ .compatible = "fsl,imx8mq-sai", .data = &fsl_sai_imx8mq_data },
 	{ .compatible = "fsl,imx8qm-sai", .data = &fsl_sai_imx8qm_data },
+	{ .compatible = "fsl,imx8mm-sai", .data = &fsl_sai_imx8mm_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, fsl_sai_ids);
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index 7310fd02cc3c..e4965efe6102 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -223,6 +223,7 @@ struct fsl_sai_soc_data {
 	unsigned int pins;
 	unsigned int reg_offset;
 	unsigned int flags;
+	unsigned int max_register;
 };
 
 /**
-- 
2.17.1

