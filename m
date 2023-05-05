Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF806F7EFC
	for <lists+alsa-devel@lfdr.de>; Fri,  5 May 2023 10:26:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C63892C01;
	Fri,  5 May 2023 10:25:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C63892C01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683275180;
	bh=+UuqxZzgAtanOdRd5MNSqKRKcwWAaSkJ99TO6l1GxOA=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=e82u7rxYTV3/0wJBFDKZWMao5ctcddUiTe0QS0c9HCXk9+zNjTNwD/IhQftl6hCZ1
	 Vy7FIM/3jhigRQu0QV45AJJ0V5wmlDcr4ZI38aV5sTAZ5Fd9QyIAn10spL6P7iFow8
	 FJOXEaCGNnV2f81Y0rJfCAS8wN52NUPa1P4jxu7w=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B662F80529;
	Fri,  5 May 2023 10:25:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C58B9F8052D; Fri,  5 May 2023 10:25:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D71F2F80087
	for <alsa-devel@alsa-project.org>; Fri,  5 May 2023 10:25:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D71F2F80087
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 2BB0F201466;
	Fri,  5 May 2023 10:25:19 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B092520106C;
	Fri,  5 May 2023 10:25:18 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 25315181D0E3;
	Fri,  5 May 2023 16:25:17 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: fsl_sai: MCLK bind with TX/RX enable bit
Date: Fri,  5 May 2023 15:55:22 +0800
Message-Id: <1683273322-2525-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: NLM2MNGJL6IM6PXSL6H2EX3FMRQ5HFKD
X-Message-ID-Hash: NLM2MNGJL6IM6PXSL6H2EX3FMRQ5HFKD
X-MailFrom: shengjiu.wang@nxp.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NLM2MNGJL6IM6PXSL6H2EX3FMRQ5HFKD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On i.MX8MP, the sai MCLK is bound with TX/RX enable bit,
which means the TX/RE enable bit need to be enabled then
MCLK can be output on PAD.

Some codec (for example: WM8962) needs the MCLK output
earlier, otherwise there will be issue for codec
configuration.

Add new soc data "mclk_with_tere" for this platform and
enable the MCLK output in startup stage.

As "mclk_with_tere" only applied to i.MX8MP, currently
The soc data is shared with i.MX8MN, so need to add
an i.MX8MN own soc data with "mclk_with_tere" disabled.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 24 +++++++++++++++++++++---
 sound/soc/fsl/fsl_sai.h |  2 ++
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index abdaffb00fbd..d9344025dc16 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1400,7 +1400,9 @@ static int fsl_sai_probe(struct platform_device *pdev)
 		sai->cpu_dai_drv.symmetric_sample_bits = 0;
 	}
 
-	if (of_property_read_bool(np, "fsl,sai-mclk-direction-output") &&
+	sai->mclk_direction_output = of_property_read_bool(np, "fsl,sai-mclk-direction-output");
+
+	if (sai->mclk_direction_output &&
 	    of_device_is_compatible(np, "fsl,imx6ul-sai")) {
 		gpr = syscon_regmap_lookup_by_compatible("fsl,imx6ul-iomuxc-gpr");
 		if (IS_ERR(gpr)) {
@@ -1443,7 +1445,7 @@ static int fsl_sai_probe(struct platform_device *pdev)
 		dev_warn(dev, "Error reading SAI version: %d\n", ret);
 
 	/* Select MCLK direction */
-	if (of_property_read_bool(np, "fsl,sai-mclk-direction-output") &&
+	if (sai->mclk_direction_output &&
 	    sai->soc_data->max_register >= FSL_SAI_MCTL) {
 		regmap_update_bits(sai->regmap, FSL_SAI_MCTL,
 				   FSL_SAI_MCTL_MCLK_EN, FSL_SAI_MCTL_MCLK_EN);
@@ -1562,6 +1564,17 @@ static const struct fsl_sai_soc_data fsl_sai_imx8mm_data = {
 	.max_register = FSL_SAI_MCTL,
 };
 
+static const struct fsl_sai_soc_data fsl_sai_imx8mn_data = {
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
 static const struct fsl_sai_soc_data fsl_sai_imx8mp_data = {
 	.use_imx_pcm = true,
 	.use_edma = false,
@@ -1571,6 +1584,7 @@ static const struct fsl_sai_soc_data fsl_sai_imx8mp_data = {
 	.pins = 8,
 	.flags = 0,
 	.max_register = FSL_SAI_MDIV,
+	.mclk_with_tere = true,
 };
 
 static const struct fsl_sai_soc_data fsl_sai_imx8ulp_data = {
@@ -1606,7 +1620,7 @@ static const struct of_device_id fsl_sai_ids[] = {
 	{ .compatible = "fsl,imx8mm-sai", .data = &fsl_sai_imx8mm_data },
 	{ .compatible = "fsl,imx8mp-sai", .data = &fsl_sai_imx8mp_data },
 	{ .compatible = "fsl,imx8ulp-sai", .data = &fsl_sai_imx8ulp_data },
-	{ .compatible = "fsl,imx8mn-sai", .data = &fsl_sai_imx8mp_data },
+	{ .compatible = "fsl,imx8mn-sai", .data = &fsl_sai_imx8mn_data },
 	{ .compatible = "fsl,imx93-sai", .data = &fsl_sai_imx93_data },
 	{ /* sentinel */ }
 };
@@ -1671,6 +1685,10 @@ static int fsl_sai_runtime_resume(struct device *dev)
 	if (ret)
 		goto disable_rx_clk;
 
+	if (sai->soc_data->mclk_with_tere && sai->mclk_direction_output)
+		regmap_update_bits(sai->regmap, FSL_SAI_TCSR(ofs),
+				   FSL_SAI_CSR_TERE, FSL_SAI_CSR_TERE);
+
 	return 0;
 
 disable_rx_clk:
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index 197748a888d5..3eb994aef36a 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -230,6 +230,7 @@ struct fsl_sai_soc_data {
 	bool use_imx_pcm;
 	bool use_edma;
 	bool mclk0_is_mclk1;
+	bool mclk_with_tere;
 	unsigned int fifo_depth;
 	unsigned int pins;
 	unsigned int reg_offset;
@@ -287,6 +288,7 @@ struct fsl_sai {
 	bool synchronous[2];
 	struct fsl_sai_dl_cfg *dl_cfg;
 	unsigned int dl_cfg_cnt;
+	bool mclk_direction_output;
 
 	unsigned int mclk_id[2];
 	unsigned int mclk_streams;
-- 
2.34.1

