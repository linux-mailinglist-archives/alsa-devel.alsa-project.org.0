Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA4F527F7B
	for <lists+alsa-devel@lfdr.de>; Mon, 16 May 2022 10:20:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 042D816D1;
	Mon, 16 May 2022 10:19:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 042D816D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652689234;
	bh=FnNFm23XlqlBvhswPonUrqGCYZyY6blySUkGMyAl5pk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cUEy2Rjyirn8OPUaBINkrS3isguZuLaLoCUfBH4Su77Tc5zhV1l0JUN4b11OQtiyR
	 Kt1S82Q2h1TB8EqX4xn4gwKTbCrTTTZTK5O2cQtD7VtHG+tam0WBB1Q2F73JEgfv48
	 DuwJoJv5h+UXwj8GWeT99jAOY5IWJ+forP0Ppwn4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E419F80525;
	Mon, 16 May 2022 10:18:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B05BF800F8; Mon, 16 May 2022 10:18:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0B4AF800F8
 for <alsa-devel@alsa-project.org>; Mon, 16 May 2022 10:18:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0B4AF800F8
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6F68F1A0490;
 Mon, 16 May 2022 10:18:45 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 37F1D1A0474;
 Mon, 16 May 2022 10:18:45 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id B7995180219B;
 Mon, 16 May 2022 16:18:43 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org
Subject: [PATCH 2/3] ASoC: fsl_sai: Add support for i.MX8M Plus
Date: Mon, 16 May 2022 16:06:11 +0800
Message-Id: <1652688372-10274-3-git-send-email-shengjiu.wang@nxp.com>
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

Add i.MX8M Plus specific soc data, the max register is FSL_SAI_MDIV.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 1ac65de094b9..b528722acd65 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1261,6 +1261,17 @@ static const struct fsl_sai_soc_data fsl_sai_imx8mm_data = {
 	.max_register = FSL_SAI_MCTL,
 };
 
+static const struct fsl_sai_soc_data fsl_sai_imx8mp_data = {
+	.use_imx_pcm = true,
+	.use_edma = false,
+	.fifo_depth = 128,
+	.reg_offset = 8,
+	.mclk0_is_mclk1 = false,
+	.pins = 8,
+	.flags = 0,
+	.max_register = FSL_SAI_MDIV,
+};
+
 static const struct of_device_id fsl_sai_ids[] = {
 	{ .compatible = "fsl,vf610-sai", .data = &fsl_sai_vf610_data },
 	{ .compatible = "fsl,imx6sx-sai", .data = &fsl_sai_imx6sx_data },
@@ -1269,6 +1280,7 @@ static const struct of_device_id fsl_sai_ids[] = {
 	{ .compatible = "fsl,imx8mq-sai", .data = &fsl_sai_imx8mq_data },
 	{ .compatible = "fsl,imx8qm-sai", .data = &fsl_sai_imx8qm_data },
 	{ .compatible = "fsl,imx8mm-sai", .data = &fsl_sai_imx8mm_data },
+	{ .compatible = "fsl,imx8mp-sai", .data = &fsl_sai_imx8mp_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, fsl_sai_ids);
-- 
2.17.1

