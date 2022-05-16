Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C94527F7D
	for <lists+alsa-devel@lfdr.de>; Mon, 16 May 2022 10:20:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4557016DB;
	Mon, 16 May 2022 10:20:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4557016DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652689251;
	bh=4fIJaAvl5C4Ha6JkgJ/MnucYZhedZ9rPW7iO3TW4p1E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hvslUeLmFZQ4a+m8biJ8qOdMJVFNvsuMSvA/P3bsHagpBJUmhGUMO91BSbnGB+YWo
	 gnxS9pD/difRtClSUBS3Fo83JZcc2Z/VxzHOe5pWHwVb+seXL4dod6DZ/vsHDJ+R+R
	 iEI/kCI59xw1va4dQvzfd6HQyeURYc+W7GrqCPyc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10EF7F80528;
	Mon, 16 May 2022 10:18:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85F34F80527; Mon, 16 May 2022 10:18:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D15BF80171
 for <alsa-devel@alsa-project.org>; Mon, 16 May 2022 10:18:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D15BF80171
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 6B8A4200513;
 Mon, 16 May 2022 10:18:46 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 33F5820050C;
 Mon, 16 May 2022 10:18:46 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id B6ECD180031D;
 Mon, 16 May 2022 16:18:44 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org
Subject: [PATCH 3/3] ASoC: fsl_sai: Add support for i.MX8ULP
Date: Mon, 16 May 2022 16:06:12 +0800
Message-Id: <1652688372-10274-4-git-send-email-shengjiu.wang@nxp.com>
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

Add i.MX8ULP specific soc data, the max register is FSL_SAI_RTCAP
the IP version is also 0x0301, So version can't be used for the
condition of register FSL_SAI_MCTL setting.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index b528722acd65..fa950dde5310 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1147,7 +1147,7 @@ static int fsl_sai_probe(struct platform_device *pdev)
 
 	/* Select MCLK direction */
 	if (of_find_property(np, "fsl,sai-mclk-direction-output", NULL) &&
-	    sai->verid.version >= 0x0301) {
+	    sai->soc_data->max_register >= FSL_SAI_MCTL) {
 		regmap_update_bits(sai->regmap, FSL_SAI_MCTL,
 				   FSL_SAI_MCTL_MCLK_EN, FSL_SAI_MCTL_MCLK_EN);
 	}
@@ -1272,6 +1272,17 @@ static const struct fsl_sai_soc_data fsl_sai_imx8mp_data = {
 	.max_register = FSL_SAI_MDIV,
 };
 
+static const struct fsl_sai_soc_data fsl_sai_imx8ulp_data = {
+	.use_imx_pcm = true,
+	.use_edma = true,
+	.fifo_depth = 16,
+	.reg_offset = 8,
+	.mclk0_is_mclk1 = false,
+	.pins = 4,
+	.flags = PMQOS_CPU_LATENCY,
+	.max_register = FSL_SAI_RTCAP,
+};
+
 static const struct of_device_id fsl_sai_ids[] = {
 	{ .compatible = "fsl,vf610-sai", .data = &fsl_sai_vf610_data },
 	{ .compatible = "fsl,imx6sx-sai", .data = &fsl_sai_imx6sx_data },
@@ -1281,6 +1292,7 @@ static const struct of_device_id fsl_sai_ids[] = {
 	{ .compatible = "fsl,imx8qm-sai", .data = &fsl_sai_imx8qm_data },
 	{ .compatible = "fsl,imx8mm-sai", .data = &fsl_sai_imx8mm_data },
 	{ .compatible = "fsl,imx8mp-sai", .data = &fsl_sai_imx8mp_data },
+	{ .compatible = "fsl,imx8ulp-sai", .data = &fsl_sai_imx8ulp_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, fsl_sai_ids);
-- 
2.17.1

