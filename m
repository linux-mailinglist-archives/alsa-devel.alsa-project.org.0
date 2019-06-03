Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5070D32A9E
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 10:18:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D93AF1688;
	Mon,  3 Jun 2019 10:17:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D93AF1688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559549912;
	bh=moXfK9SkVklRFoeDoxb4ScQGF7KqHbYKhS3shocoKkI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=H4jyNbPRlbynRDQVA/4GnNCZVuh5VaW46MAA6h/hxArMdn6n99+OVepxlsJiV2WU3
	 FkHXgcIo5RcC0OyKv5zlulDLlqlmIQlWLc4OQRscc+4ehy9JYOzefWMHIeyNjk2kD7
	 cArKTlNaAFwcnW5hvsnYnyKh92caBuKDtS78PBgk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E1E5F896ED;
	Mon,  3 Jun 2019 10:16:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8376F896DD; Mon,  3 Jun 2019 10:16:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14889F80774
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 10:16:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14889F80774
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="tCByvdYs"
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x538GSkA019279; Mon, 3 Jun 2019 10:16:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=nJJR92I5ibVaH2yVpxa8sBGMNjPbjpb7V7G3xIRyUhE=;
 b=tCByvdYsqRDPa8blOzVu31JMEuWi4EHrVKY8o2bNne9PsClKlfMiwa3c1Xt2cKV6elMm
 QwBRJWCoOYUnxB6solkDSEFRTsKW+ipZGIp0ReYQBbxoSL6IbLdEgIUhUGvaUc2H4uFo
 nIzM5Xkf/AXz+R7hFSYmMU03Grirw26kTSfq6NT2S7ZSiK5X2nLA+jBhBhC4INtB16Zb
 Doodo/qISSSjJ4atFgjyjWfRIfgX5VDpoNF+3/zk/FUmAkRz9KD/yoNHlLcaJ0+mSYHk
 Y0Y1rWdmoc2eI0IcWwujNp+AjZwYGEf6KTBQj29eNO68yiyNY7vanjUQDb1Edjh6GL7i qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sunme9150-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 03 Jun 2019 10:16:39 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D937A34;
 Mon,  3 Jun 2019 08:16:37 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6BB7E2489;
 Mon,  3 Jun 2019 08:16:37 +0000 (GMT)
Received: from SAFEX1HUBCAS24.st.com (10.75.90.95) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 3 Jun 2019
 10:16:37 +0200
Received: from localhost (10.201.23.16) by webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 3 Jun 2019 10:16:36
 +0200
From: Olivier Moysan <olivier.moysan@st.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <mcoquelin.stm32@gmail.com>,
 <alexandre.torgue@st.com>, <alsa-devel@alsa-project.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-kernel@vger.kernel.org>, <olivier.moysan@st.com>,
 <arnaud.pouliquen@st.com>
Date: Mon, 3 Jun 2019 10:16:34 +0200
Message-ID: <1559549794-7246-1-git-send-email-olivier.moysan@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.201.23.16]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-03_06:, , signatures=0
Cc: benjamin.gaignard@st.com
Subject: [alsa-devel] [PATCH] ASoC: stm32: sai: manage identification
	registers
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add support of identification registers in STM32 SAI.

Signed-off-by: Olivier Moysan <olivier.moysan@st.com>
---
 sound/soc/stm/stm32_sai.c     | 44 +++++++++++++++++++++++++++++++----
 sound/soc/stm/stm32_sai.h     | 54 ++++++++++++++++++++++++++++++++-----------
 sound/soc/stm/stm32_sai_sub.c | 14 ++++++-----
 3 files changed, 88 insertions(+), 24 deletions(-)

diff --git a/sound/soc/stm/stm32_sai.c b/sound/soc/stm/stm32_sai.c
index 7550d5f08be3..98b29f712831 100644
--- a/sound/soc/stm/stm32_sai.c
+++ b/sound/soc/stm/stm32_sai.c
@@ -30,13 +30,20 @@
 #include "stm32_sai.h"
 
 static const struct stm32_sai_conf stm32_sai_conf_f4 = {
-	.version = SAI_STM32F4,
-	.has_spdif = false,
+	.version = STM_SAI_STM32F4,
+	.fifo_size = 8,
+	.has_spdif_pdm = false,
 };
 
+/*
+ * Default settings for stm32 H7 socs and next.
+ * These default settings will be overridden if the soc provides
+ * support of hardware configuration registers.
+ */
 static const struct stm32_sai_conf stm32_sai_conf_h7 = {
-	.version = SAI_STM32H7,
-	.has_spdif = true,
+	.version = STM_SAI_STM32H7,
+	.fifo_size = 8,
+	.has_spdif_pdm = true,
 };
 
 static const struct of_device_id stm32_sai_ids[] = {
@@ -157,6 +164,8 @@ static int stm32_sai_probe(struct platform_device *pdev)
 	struct reset_control *rst;
 	struct resource *res;
 	const struct of_device_id *of_id;
+	u32 val;
+	int ret;
 
 	sai = devm_kzalloc(&pdev->dev, sizeof(*sai), GFP_KERNEL);
 	if (!sai)
@@ -169,7 +178,8 @@ static int stm32_sai_probe(struct platform_device *pdev)
 
 	of_id = of_match_device(stm32_sai_ids, &pdev->dev);
 	if (of_id)
-		sai->conf = (struct stm32_sai_conf *)of_id->data;
+		memcpy(&sai->conf, (const struct stm32_sai_conf *)of_id->data,
+		       sizeof(struct stm32_sai_conf));
 	else
 		return -EINVAL;
 
@@ -208,6 +218,30 @@ static int stm32_sai_probe(struct platform_device *pdev)
 		reset_control_deassert(rst);
 	}
 
+	/* Enable peripheral clock to allow register access */
+	ret = clk_prepare_enable(sai->pclk);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to enable clock: %d\n", ret);
+		return ret;
+	}
+
+	val = FIELD_GET(SAI_IDR_ID_MASK,
+			readl_relaxed(sai->base + STM_SAI_IDR));
+	if (val == SAI_IPIDR_NUMBER) {
+		val = readl_relaxed(sai->base + STM_SAI_HWCFGR);
+		sai->conf.fifo_size = FIELD_GET(SAI_HWCFGR_FIFO_SIZE, val);
+		sai->conf.has_spdif_pdm = !!FIELD_GET(SAI_HWCFGR_SPDIF_PDM,
+						      val);
+
+		val = readl_relaxed(sai->base + STM_SAI_VERR);
+		sai->conf.version = val;
+
+		dev_dbg(&pdev->dev, "SAI version: %lu.%lu registered\n",
+			FIELD_GET(SAI_VERR_MAJ_MASK, val),
+			FIELD_GET(SAI_VERR_MIN_MASK, val));
+	}
+	clk_disable_unprepare(sai->pclk);
+
 	sai->pdev = pdev;
 	sai->set_sync = &stm32_sai_set_sync;
 	platform_set_drvdata(pdev, sai);
diff --git a/sound/soc/stm/stm32_sai.h b/sound/soc/stm/stm32_sai.h
index 9c36a393ab7b..158c73f557f7 100644
--- a/sound/soc/stm/stm32_sai.h
+++ b/sound/soc/stm/stm32_sai.h
@@ -37,6 +37,12 @@
 #define STM_SAI_PDMCR_REGX	0x40
 #define STM_SAI_PDMLY_REGX	0x44
 
+/* Hardware configuration registers */
+#define STM_SAI_HWCFGR		0x3F0
+#define STM_SAI_VERR		0x3F4
+#define STM_SAI_IDR		0x3F8
+#define STM_SAI_SIDR		0x3FC
+
 /******************** Bit definition for SAI_GCR register *******************/
 #define SAI_GCR_SYNCIN_SHIFT	0
 #define SAI_GCR_SYNCIN_WDTH	2
@@ -82,7 +88,7 @@
 #define SAI_XCR1_NODIV		BIT(SAI_XCR1_NODIV_SHIFT)
 
 #define SAI_XCR1_MCKDIV_SHIFT	20
-#define SAI_XCR1_MCKDIV_WIDTH(x)	(((x) == SAI_STM32F4) ? 4 : 6)
+#define SAI_XCR1_MCKDIV_WIDTH(x)	(((x) == STM_SAI_STM32F4) ? 4 : 6)
 #define SAI_XCR1_MCKDIV_MASK(x) GENMASK((SAI_XCR1_MCKDIV_SHIFT + (x) - 1),\
 				SAI_XCR1_MCKDIV_SHIFT)
 #define SAI_XCR1_MCKDIV_SET(x)	((x) << SAI_XCR1_MCKDIV_SHIFT)
@@ -234,8 +240,33 @@
 #define SAI_PDMDLY_4R_MASK	GENMASK(30, SAI_PDMDLY_4R_SHIFT)
 #define SAI_PDMDLY_4R_WIDTH	3
 
-#define STM_SAI_IS_F4(ip)	((ip)->conf->version == SAI_STM32F4)
-#define STM_SAI_IS_H7(ip)	((ip)->conf->version == SAI_STM32H7)
+/* Registers below apply to SAI version 2.1 and more */
+
+/* Bit definition for SAI_HWCFGR register */
+#define SAI_HWCFGR_FIFO_SIZE	GENMASK(7, 0)
+#define SAI_HWCFGR_SPDIF_PDM	GENMASK(11, 8)
+#define SAI_HWCFGR_REGOUT	GENMASK(19, 12)
+
+/* Bit definition for SAI_VERR register */
+#define SAI_VERR_MIN_MASK	GENMASK(3, 0)
+#define SAI_VERR_MAJ_MASK	GENMASK(7, 4)
+
+/* Bit definition for SAI_IDR register */
+#define SAI_IDR_ID_MASK		GENMASK(31, 0)
+
+/* Bit definition for SAI_SIDR register */
+#define SAI_SIDR_ID_MASK	GENMASK(31, 0)
+
+#define SAI_IPIDR_NUMBER	0x00130031
+
+/* SAI version numbers are 1.x for F4. Major version number set to 1 for F4 */
+#define STM_SAI_STM32F4		BIT(4)
+/* Dummy version number for H7 socs and next */
+#define STM_SAI_STM32H7		0x0
+
+#define STM_SAI_IS_F4(ip)	((ip)->conf.version == STM_SAI_STM32F4)
+#define STM_SAI_HAS_SPDIF_PDM(ip)\
+				((ip)->pdata->conf.has_spdif_pdm)
 
 enum stm32_sai_syncout {
 	STM_SAI_SYNC_OUT_NONE,
@@ -243,19 +274,16 @@ enum stm32_sai_syncout {
 	STM_SAI_SYNC_OUT_B,
 };
 
-enum stm32_sai_version {
-	SAI_STM32F4,
-	SAI_STM32H7
-};
-
 /**
  * struct stm32_sai_conf - SAI configuration
  * @version: SAI version
- * @has_spdif: SAI S/PDIF support flag
+ * @fifo_size: SAI fifo size as words number
+ * @has_spdif_pdm: SAI S/PDIF and PDM features support flag
  */
 struct stm32_sai_conf {
-	int version;
-	bool has_spdif;
+	u32 version;
+	u32 fifo_size;
+	bool has_spdif_pdm;
 };
 
 /**
@@ -265,7 +293,7 @@ struct stm32_sai_conf {
  * @pclk: SAI bus clock
  * @clk_x8k: SAI parent clock for sampling frequencies multiple of 8kHz
  * @clk_x11k: SAI parent clock for sampling frequencies multiple of 11kHz
- * @version: SOC version
+ * @conf: SAI hardware capabitilites
  * @irq: SAI interrupt line
  * @set_sync: pointer to synchro mode configuration callback
  * @gcr: SAI Global Configuration Register
@@ -276,7 +304,7 @@ struct stm32_sai_data {
 	struct clk *pclk;
 	struct clk *clk_x8k;
 	struct clk *clk_x11k;
-	struct stm32_sai_conf *conf;
+	struct stm32_sai_conf conf;
 	int irq;
 	int (*set_sync)(struct stm32_sai_data *sai,
 			struct device_node *np_provider, int synco, int synci);
diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index 2a74ce7c9440..7d27efb19380 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -45,7 +45,6 @@
 #define SAI_DATASIZE_24		0x6
 #define SAI_DATASIZE_32		0x7
 
-#define STM_SAI_FIFO_SIZE	8
 #define STM_SAI_DAI_NAME_SIZE	15
 
 #define STM_SAI_IS_PLAYBACK(ip)	((ip)->dir == SNDRV_PCM_STREAM_PLAYBACK)
@@ -63,7 +62,8 @@
 #define SAI_SYNC_EXTERNAL	0x2
 
 #define STM_SAI_PROTOCOL_IS_SPDIF(ip)	((ip)->spdif)
-#define STM_SAI_HAS_SPDIF(x)	((x)->pdata->conf->has_spdif)
+#define STM_SAI_HAS_SPDIF(x)	((x)->pdata->conf.has_spdif_pdm)
+#define STM_SAI_HAS_PDM(x)	((x)->pdata->conf.has_spdif_pdm)
 #define STM_SAI_HAS_EXT_SYNC(x) (!STM_SAI_IS_F4(sai->pdata))
 
 #define SAI_IEC60958_BLOCK_FRAMES	192
@@ -274,7 +274,7 @@ static int stm32_sai_get_clk_div(struct stm32_sai_sub_data *sai,
 				 unsigned long input_rate,
 				 unsigned long output_rate)
 {
-	int version = sai->pdata->conf->version;
+	int version = sai->pdata->conf.version;
 	int div;
 
 	div = DIV_ROUND_CLOSEST(input_rate, output_rate);
@@ -295,7 +295,7 @@ static int stm32_sai_get_clk_div(struct stm32_sai_sub_data *sai,
 static int stm32_sai_set_clk_div(struct stm32_sai_sub_data *sai,
 				 unsigned int div)
 {
-	int version = sai->pdata->conf->version;
+	int version = sai->pdata->conf.version;
 	int ret, cr1, mask;
 
 	if (div > SAI_XCR1_MCKDIV_MAX(version)) {
@@ -1148,6 +1148,8 @@ static int stm32_sai_dai_probe(struct snd_soc_dai *cpu_dai)
 	 * constraints).
 	 */
 	sai->dma_params.maxburst = 4;
+	if (sai->pdata->conf.fifo_size < 8)
+		sai->dma_params.maxburst = 1;
 	/* Buswidth will be set by framework at runtime */
 	sai->dma_params.addr_width = DMA_SLAVE_BUSWIDTH_UNDEFINED;
 
@@ -1315,8 +1317,8 @@ static int stm32_sai_sub_parse_of(struct platform_device *pdev,
 	sai->phys_addr = res->start;
 
 	sai->regmap_config = &stm32_sai_sub_regmap_config_f4;
-	/* Note: PDM registers not available for H7 sub-block B */
-	if (STM_SAI_IS_H7(sai->pdata) && STM_SAI_IS_SUB_A(sai))
+	/* Note: PDM registers not available for sub-block B */
+	if (STM_SAI_HAS_PDM(sai) && STM_SAI_IS_SUB_A(sai))
 		sai->regmap_config = &stm32_sai_sub_regmap_config_h7;
 
 	sai->regmap = devm_regmap_init_mmio_clk(&pdev->dev, "sai_ck",
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
