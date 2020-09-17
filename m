Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C123226D389
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 08:20:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64529168C;
	Thu, 17 Sep 2020 08:20:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64529168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600323654;
	bh=dT0yJKwlZq/beqk9S4KSGuDF1zAzQUnMuMURx1my+Dk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=riruw1TglTkg6P2sivM52vm19q70DwQXIUDaa19CS5C8dcu9zShyUtVhpsvqy8rox
	 AdVlnGGHXxYxh8IUiK1IbKIh6usrqP7YJ3180NvWVqfkRhSBoIZHW6lt3HP0s/+LqS
	 Bz0/JkPueSWbOnVEe46MnH62oyWkuapozSMVDNDI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 083D6F8027C;
	Thu, 17 Sep 2020 08:18:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7375EF80276; Thu, 17 Sep 2020 08:18:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41894F80212
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 08:18:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41894F80212
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 104402000FF;
 Thu, 17 Sep 2020 08:18:12 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 6279D2000F5;
 Thu, 17 Sep 2020 08:18:07 +0200 (CEST)
Received: from 10.192.242.69 (shlinux2.ap.freescale.net [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 5DD4040310;
 Thu, 17 Sep 2020 08:18:01 +0200 (CEST)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com
Subject: [PATCH v2 1/3] ASoC: fsl_sai: Add new added registers and new bit
 definition
Date: Thu, 17 Sep 2020 14:11:17 +0800
Message-Id: <1600323079-5317-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600323079-5317-1-git-send-email-shengjiu.wang@nxp.com>
References: <1600323079-5317-1-git-send-email-shengjiu.wang@nxp.com>
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

On i.MX8MQ/i.MX8MN/i.MX8MM platform, the sai IP is upgraded.
There are some new registers and new bit definition. This
patch is to complete the register list.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 sound/soc/fsl/fsl_sai.c | 23 ++++++++++++++++
 sound/soc/fsl/fsl_sai.h | 59 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 82 insertions(+)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index b2d65e53dbc4..24ca528ca2be 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -796,6 +796,8 @@ static struct reg_default fsl_sai_reg_defaults_ofs8[] = {
 	{FSL_SAI_RCR4(8), 0},
 	{FSL_SAI_RCR5(8), 0},
 	{FSL_SAI_RMR, 0},
+	{FSL_SAI_MCTL, 0},
+	{FSL_SAI_MDIV, 0},
 };
 
 static bool fsl_sai_readable_reg(struct device *dev, unsigned int reg)
@@ -836,6 +838,18 @@ static bool fsl_sai_readable_reg(struct device *dev, unsigned int reg)
 	case FSL_SAI_RFR6:
 	case FSL_SAI_RFR7:
 	case FSL_SAI_RMR:
+	case FSL_SAI_MCTL:
+	case FSL_SAI_MDIV:
+	case FSL_SAI_VERID:
+	case FSL_SAI_PARAM:
+	case FSL_SAI_TTCTN:
+	case FSL_SAI_RTCTN:
+	case FSL_SAI_TTCTL:
+	case FSL_SAI_TBCTN:
+	case FSL_SAI_TTCAP:
+	case FSL_SAI_RTCTL:
+	case FSL_SAI_RBCTN:
+	case FSL_SAI_RTCAP:
 		return true;
 	default:
 		return false;
@@ -850,6 +864,10 @@ static bool fsl_sai_volatile_reg(struct device *dev, unsigned int reg)
 	if (reg == FSL_SAI_TCSR(ofs) || reg == FSL_SAI_RCSR(ofs))
 		return true;
 
+	/* Set VERID and PARAM be volatile for reading value in probe */
+	if (ofs == 8 && (reg == FSL_SAI_VERID || reg == FSL_SAI_PARAM))
+		return true;
+
 	switch (reg) {
 	case FSL_SAI_TFR0:
 	case FSL_SAI_TFR1:
@@ -903,6 +921,10 @@ static bool fsl_sai_writeable_reg(struct device *dev, unsigned int reg)
 	case FSL_SAI_TDR7:
 	case FSL_SAI_TMR:
 	case FSL_SAI_RMR:
+	case FSL_SAI_MCTL:
+	case FSL_SAI_MDIV:
+	case FSL_SAI_TTCTL:
+	case FSL_SAI_RTCTL:
 		return true;
 	default:
 		return false;
@@ -951,6 +973,7 @@ static int fsl_sai_probe(struct platform_device *pdev)
 
 	if (sai->soc_data->reg_offset == 8) {
 		fsl_sai_regmap_config.reg_defaults = fsl_sai_reg_defaults_ofs8;
+		fsl_sai_regmap_config.max_register = FSL_SAI_MDIV;
 		fsl_sai_regmap_config.num_reg_defaults =
 			ARRAY_SIZE(fsl_sai_reg_defaults_ofs8);
 	}
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index 736a437450c8..d16fc4241f41 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -14,6 +14,8 @@
 			 SNDRV_PCM_FMTBIT_S32_LE)
 
 /* SAI Register Map Register */
+#define FSL_SAI_VERID	0x00 /* SAI Version ID Register */
+#define FSL_SAI_PARAM	0x04 /* SAI Parameter Register */
 #define FSL_SAI_TCSR(ofs)	(0x00 + ofs) /* SAI Transmit Control */
 #define FSL_SAI_TCR1(ofs)	(0x04 + ofs) /* SAI Transmit Configuration 1 */
 #define FSL_SAI_TCR2(ofs)	(0x08 + ofs) /* SAI Transmit Configuration 2 */
@@ -37,6 +39,10 @@
 #define FSL_SAI_TFR6	0x58 /* SAI Transmit FIFO 6 */
 #define FSL_SAI_TFR7	0x5C /* SAI Transmit FIFO 7 */
 #define FSL_SAI_TMR	0x60 /* SAI Transmit Mask */
+#define FSL_SAI_TTCTL	0x70 /* SAI Transmit Timestamp Control Register */
+#define FSL_SAI_TTCTN	0x74 /* SAI Transmit Timestamp Counter Register */
+#define FSL_SAI_TBCTN	0x78 /* SAI Transmit Bit Counter Register */
+#define FSL_SAI_TTCAP	0x7C /* SAI Transmit Timestamp Capture */
 #define FSL_SAI_RCSR(ofs)	(0x80 + ofs) /* SAI Receive Control */
 #define FSL_SAI_RCR1(ofs)	(0x84 + ofs)/* SAI Receive Configuration 1 */
 #define FSL_SAI_RCR2(ofs)	(0x88 + ofs) /* SAI Receive Configuration 2 */
@@ -60,6 +66,13 @@
 #define FSL_SAI_RFR6	0xd8 /* SAI Receive FIFO 6 */
 #define FSL_SAI_RFR7	0xdc /* SAI Receive FIFO 7 */
 #define FSL_SAI_RMR	0xe0 /* SAI Receive Mask */
+#define FSL_SAI_RTCTL	0xf0 /* SAI Receive Timestamp Control Register */
+#define FSL_SAI_RTCTN	0xf4 /* SAI Receive Timestamp Counter Register */
+#define FSL_SAI_RBCTN	0xf8 /* SAI Receive Bit Counter Register */
+#define FSL_SAI_RTCAP	0xfc /* SAI Receive Timestamp Capture */
+
+#define FSL_SAI_MCTL	0x100 /* SAI MCLK Control Register */
+#define FSL_SAI_MDIV	0x104 /* SAI MCLK Divide Register */
 
 #define FSL_SAI_xCSR(tx, ofs)	(tx ? FSL_SAI_TCSR(ofs) : FSL_SAI_RCSR(ofs))
 #define FSL_SAI_xCR1(tx, ofs)	(tx ? FSL_SAI_TCR1(ofs) : FSL_SAI_RCR1(ofs))
@@ -73,6 +86,7 @@
 
 /* SAI Transmit/Receive Control Register */
 #define FSL_SAI_CSR_TERE	BIT(31)
+#define FSL_SAI_CSR_SE		BIT(30)
 #define FSL_SAI_CSR_FR		BIT(25)
 #define FSL_SAI_CSR_SR		BIT(24)
 #define FSL_SAI_CSR_xF_SHIFT	16
@@ -106,6 +120,7 @@
 #define FSL_SAI_CR2_MSEL(ID)	((ID) << 26)
 #define FSL_SAI_CR2_BCP		BIT(25)
 #define FSL_SAI_CR2_BCD_MSTR	BIT(24)
+#define FSL_SAI_CR2_BYP		BIT(23) /* BCLK bypass */
 #define FSL_SAI_CR2_DIV_MASK	0xff
 
 /* SAI Transmit and Receive Configuration 3 Register */
@@ -115,6 +130,13 @@
 #define FSL_SAI_CR3_WDFL_MASK	0x1f
 
 /* SAI Transmit and Receive Configuration 4 Register */
+
+#define FSL_SAI_CR4_FCONT	BIT(28)
+#define FSL_SAI_CR4_FCOMB_SHIFT BIT(26)
+#define FSL_SAI_CR4_FCOMB_SOFT  BIT(27)
+#define FSL_SAI_CR4_FCOMB_MASK  (0x3 << 26)
+#define FSL_SAI_CR4_FPACK_8     (0x2 << 24)
+#define FSL_SAI_CR4_FPACK_16    (0x3 << 24)
 #define FSL_SAI_CR4_FRSZ(x)	(((x) - 1) << 16)
 #define FSL_SAI_CR4_FRSZ_MASK	(0x1f << 16)
 #define FSL_SAI_CR4_SYWD(x)	(((x) - 1) << 8)
@@ -134,6 +156,43 @@
 #define FSL_SAI_CR5_FBT(x)	((x) << 8)
 #define FSL_SAI_CR5_FBT_MASK	(0x1f << 8)
 
+/* SAI MCLK Control Register */
+#define FSL_SAI_MCTL_MCLK_EN	BIT(30)	/* MCLK Enable */
+#define FSL_SAI_MCTL_MSEL_MASK	(0x3 << 24)
+#define FSL_SAI_MCTL_MSEL(ID)   ((ID) << 24)
+#define FSL_SAI_MCTL_MSEL_BUS	0
+#define FSL_SAI_MCTL_MSEL_MCLK1	BIT(24)
+#define FSL_SAI_MCTL_MSEL_MCLK2	BIT(25)
+#define FSL_SAI_MCTL_MSEL_MCLK3	(BIT(24) | BIT(25))
+#define FSL_SAI_MCTL_DIV_EN	BIT(23)
+#define FSL_SAI_MCTL_DIV_MASK	0xFF
+
+/* SAI VERID Register */
+#define FSL_SAI_VERID_MAJOR_SHIFT   24
+#define FSL_SAI_VERID_MAJOR_MASK    GENMASK(31, 24)
+#define FSL_SAI_VERID_MINOR_SHIFT   16
+#define FSL_SAI_VERID_MINOR_MASK    GENMASK(23, 16)
+#define FSL_SAI_VERID_FEATURE_SHIFT 0
+#define FSL_SAI_VERID_FEATURE_MASK  GENMASK(15, 0)
+#define FSL_SAI_VERID_EFIFO_EN	    BIT(0)
+#define FSL_SAI_VERID_TSTMP_EN	    BIT(1)
+
+/* SAI PARAM Register */
+#define FSL_SAI_PARAM_SPF_SHIFT	    16
+#define FSL_SAI_PARAM_SPF_MASK	    GENMASK(19, 16)
+#define FSL_SAI_PARAM_WPF_SHIFT	    8
+#define FSL_SAI_PARAM_WPF_MASK	    GENMASK(11, 8)
+#define FSL_SAI_PARAM_DLN_MASK	    GENMASK(3, 0)
+
+/* SAI MCLK Divide Register */
+#define FSL_SAI_MDIV_MASK	    0xFFFFF
+
+/* SAI timestamp and bitcounter */
+#define FSL_SAI_xTCTL_TSEN         BIT(0)
+#define FSL_SAI_xTCTL_TSINC        BIT(1)
+#define FSL_SAI_xTCTL_RTSC         BIT(8)
+#define FSL_SAI_xTCTL_RBC          BIT(9)
+
 /* SAI type */
 #define FSL_SAI_DMA		BIT(0)
 #define FSL_SAI_USE_AC97	BIT(1)
-- 
2.27.0

