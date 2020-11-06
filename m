Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEFF2A904A
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Nov 2020 08:27:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE7A31686;
	Fri,  6 Nov 2020 08:27:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE7A31686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604647678;
	bh=InoV0GLsXsS0/DNOk3IZGGv2GOZnjLgQ5Ekff7dIIwU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i8GWVlGPsMm0381kEJ6trJbTjcJef79qO32uv7zhz6XGsNgCUj/GDekjWAghvnHQT
	 CowYIvehqn5BKfrUBHKquTuqwRH3ag7OOh+bdbe9RC1eb/gD2YwPJrFSsM8xEdvoGD
	 8wZYkXNi1H0z7RJlunE8jKz9FBRDCjqSLkeOgIY0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFE17F804D8;
	Fri,  6 Nov 2020 08:25:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4FA6F804C2; Fri,  6 Nov 2020 08:25:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE661F80232
 for <alsa-devel@alsa-project.org>; Fri,  6 Nov 2020 08:25:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE661F80232
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZbAaw0/8"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A67PGK1114022;
 Fri, 6 Nov 2020 01:25:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604647516;
 bh=sRh/HznZj9KFWgR4KW4Oa4TWxnLFf3zyEAxQWgTFHNo=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=ZbAaw0/8UkwzNSdhYbT7oFAzm1R/qrwJau5KppU/VFmc9PasVqgIPKn5l15vsXWSy
 miGDV2UN+U+D4M4bAWeYxEkYvyfJTwWnybiYCqknfetPiy1bFmVq58rHbdA99of1pd
 qHSVPdR4JsgleEG9Mcn6oO6g6p6tzFUrSRFj+fW0=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A67PG8R065733
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 6 Nov 2020 01:25:16 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 6 Nov
 2020 01:25:16 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 6 Nov 2020 01:25:16 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A67P8Sw113537;
 Fri, 6 Nov 2020 01:25:14 -0600
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 3/4] ASoC: ti: davinci-mcasp: Simplify the configuration
 parameter handling
Date: Fri, 6 Nov 2020 09:25:50 +0200
Message-ID: <20201106072551.689-4-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201106072551.689-1-peter.ujfalusi@ti.com>
References: <20201106072551.689-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: nm@ti.com, tony@atomide.com, alsa-devel@alsa-project.org,
 tomi.valkeinen@ti.com
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

Replace the davinci_mcasp_set_pdata_from_of() function which returned a
pdata pointer with davinci_mcasp_get_config() to return an actual error
code and handle all pdata validation and private mcasp struct setup in
there.

Drop the unused ram-size-playback and sram-size-capture query from DT at
the same time.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 sound/soc/ti/davinci-mcasp.c | 164 +++++++++++++----------------------
 1 file changed, 60 insertions(+), 104 deletions(-)

diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index 19120bdf747a..7aba1ccec8c9 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -76,6 +76,7 @@ struct davinci_mcasp_ruledata {
 
 struct davinci_mcasp {
 	struct snd_dmaengine_dai_dma_data dma_data[2];
+	struct davinci_mcasp_pdata *pdata;
 	void __iomem *base;
 	u32 fifo_base;
 	struct device *dev;
@@ -1747,44 +1748,37 @@ static int mcasp_reparent_fck(struct platform_device *pdev)
 	return ret;
 }
 
-static struct davinci_mcasp_pdata *davinci_mcasp_set_pdata_from_of(
-						struct platform_device *pdev)
+static int davinci_mcasp_get_config(struct davinci_mcasp *mcasp,
+				    struct platform_device *pdev)
 {
+	const struct of_device_id *match = of_match_device(mcasp_dt_ids, &pdev->dev);
 	struct device_node *np = pdev->dev.of_node;
 	struct davinci_mcasp_pdata *pdata = NULL;
-	const struct of_device_id *match =
-			of_match_device(mcasp_dt_ids, &pdev->dev);
-
 	const u32 *of_serial_dir32;
 	u32 val;
-	int i, ret = 0;
+	int i;
 
 	if (pdev->dev.platform_data) {
 		pdata = pdev->dev.platform_data;
 		pdata->dismod = DISMOD_LOW;
-		return pdata;
+		goto out;
 	} else if (match) {
 		pdata = devm_kmemdup(&pdev->dev, match->data, sizeof(*pdata),
 				     GFP_KERNEL);
 		if (!pdata)
-			return NULL;
+			return -ENOMEM;
 	} else {
-		/* control shouldn't reach here. something is wrong */
-		ret = -EINVAL;
-		goto nodata;
+		dev_err(&pdev->dev, "No compatible match found\n");
+		return -EINVAL;
 	}
 
-	ret = of_property_read_u32(np, "op-mode", &val);
-	if (ret >= 0)
+	if (of_property_read_u32(np, "op-mode", &val) == 0)
 		pdata->op_mode = val;
 
-	ret = of_property_read_u32(np, "tdm-slots", &val);
-	if (ret >= 0) {
+	if (of_property_read_u32(np, "tdm-slots", &val) == 0) {
 		if (val < 2 || val > 32) {
-			dev_err(&pdev->dev,
-				"tdm-slots must be in rage [2-32]\n");
-			ret = -EINVAL;
-			goto nodata;
+			dev_err(&pdev->dev, "tdm-slots must be in rage [2-32]\n");
+			return -EINVAL;
 		}
 
 		pdata->tdm_slots = val;
@@ -1796,10 +1790,8 @@ static struct davinci_mcasp_pdata *davinci_mcasp_set_pdata_from_of(
 		u8 *of_serial_dir = devm_kzalloc(&pdev->dev,
 						 (sizeof(*of_serial_dir) * val),
 						 GFP_KERNEL);
-		if (!of_serial_dir) {
-			ret = -ENOMEM;
-			goto nodata;
-		}
+		if (!of_serial_dir)
+			return -ENOMEM;
 
 		for (i = 0; i < val; i++)
 			of_serial_dir[i] = be32_to_cpup(&of_serial_dir32[i]);
@@ -1808,24 +1800,16 @@ static struct davinci_mcasp_pdata *davinci_mcasp_set_pdata_from_of(
 		pdata->serial_dir = of_serial_dir;
 	}
 
-	ret = of_property_read_u32(np, "tx-num-evt", &val);
-	if (ret >= 0)
+	if (of_property_read_u32(np, "tx-num-evt", &val) == 0)
 		pdata->txnumevt = val;
 
-	ret = of_property_read_u32(np, "rx-num-evt", &val);
-	if (ret >= 0)
+	if (of_property_read_u32(np, "rx-num-evt", &val) == 0)
 		pdata->rxnumevt = val;
 
-	ret = of_property_read_u32(np, "sram-size-playback", &val);
-	if (ret >= 0)
-		pdata->sram_size_playback = val;
-
-	ret = of_property_read_u32(np, "sram-size-capture", &val);
-	if (ret >= 0)
-		pdata->sram_size_capture = val;
+	if (of_property_read_u32(np, "auxclk-fs-ratio", &val) == 0)
+		mcasp->auxclk_fs_ratio = val;
 
-	ret = of_property_read_u32(np, "dismod", &val);
-	if (ret >= 0) {
+	if (of_property_read_u32(np, "dismod", &val) == 0) {
 		if (val == 0 || val == 2 || val == 3) {
 			pdata->dismod = DISMOD_VAL(val);
 		} else {
@@ -1836,15 +1820,40 @@ static struct davinci_mcasp_pdata *davinci_mcasp_set_pdata_from_of(
 		pdata->dismod = DISMOD_LOW;
 	}
 
-	return  pdata;
+out:
+	mcasp->pdata = pdata;
 
-nodata:
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Error populating platform data, err %d\n",
-			ret);
-		pdata = NULL;
+	mcasp->op_mode = pdata->op_mode;
+	/* sanity check for tdm slots parameter */
+	if (mcasp->op_mode == DAVINCI_MCASP_IIS_MODE) {
+		if (pdata->tdm_slots < 2) {
+			dev_warn(&pdev->dev, "invalid tdm slots: %d\n",
+				 pdata->tdm_slots);
+			mcasp->tdm_slots = 2;
+		} else if (pdata->tdm_slots > 32) {
+			dev_warn(&pdev->dev, "invalid tdm slots: %d\n",
+				 pdata->tdm_slots);
+			mcasp->tdm_slots = 32;
+		} else {
+			mcasp->tdm_slots = pdata->tdm_slots;
+		}
 	}
-	return  pdata;
+
+	mcasp->num_serializer = pdata->num_serializer;
+#ifdef CONFIG_PM
+	mcasp->context.xrsr_regs = devm_kcalloc(&pdev->dev,
+						mcasp->num_serializer, sizeof(u32),
+						GFP_KERNEL);
+	if (!mcasp->context.xrsr_regs)
+		return -ENOMEM;
+#endif
+	mcasp->serial_dir = pdata->serial_dir;
+	mcasp->version = pdata->version;
+	mcasp->txnumevt = pdata->txnumevt;
+	mcasp->rxnumevt = pdata->rxnumevt;
+	mcasp->dismod = pdata->dismod;
+
+	return 0;
 }
 
 enum {
@@ -2083,25 +2092,10 @@ static inline int davinci_mcasp_init_gpiochip(struct davinci_mcasp *mcasp)
 }
 #endif /* CONFIG_GPIOLIB */
 
-static void davinci_mcasp_get_dt_params(struct davinci_mcasp *mcasp)
-{
-	struct device_node *np = mcasp->dev->of_node;
-	int ret;
-	u32 val;
-
-	if (!np)
-		return;
-
-	ret = of_property_read_u32(np, "auxclk-fs-ratio", &val);
-	if (ret >= 0)
-		mcasp->auxclk_fs_ratio = val;
-}
-
 static int davinci_mcasp_probe(struct platform_device *pdev)
 {
 	struct snd_dmaengine_dai_dma_data *dma_data;
 	struct resource *mem, *dat;
-	struct davinci_mcasp_pdata *pdata;
 	struct davinci_mcasp *mcasp;
 	char *irq_name;
 	int irq;
@@ -2117,11 +2111,10 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
 	if (!mcasp)
 		return	-ENOMEM;
 
-	pdata = davinci_mcasp_set_pdata_from_of(pdev);
-	if (!pdata) {
-		dev_err(&pdev->dev, "no platform data\n");
-		return -EINVAL;
-	}
+	mcasp->dev = &pdev->dev;
+	ret = davinci_mcasp_get_config(mcasp, pdev);
+	if (ret)
+		return ret;
 
 	mem = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mpu");
 	if (!mem) {
@@ -2140,40 +2133,6 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
 
 	pm_runtime_enable(&pdev->dev);
 
-	mcasp->op_mode = pdata->op_mode;
-	/* sanity check for tdm slots parameter */
-	if (mcasp->op_mode == DAVINCI_MCASP_IIS_MODE) {
-		if (pdata->tdm_slots < 2) {
-			dev_err(&pdev->dev, "invalid tdm slots: %d\n",
-				pdata->tdm_slots);
-			mcasp->tdm_slots = 2;
-		} else if (pdata->tdm_slots > 32) {
-			dev_err(&pdev->dev, "invalid tdm slots: %d\n",
-				pdata->tdm_slots);
-			mcasp->tdm_slots = 32;
-		} else {
-			mcasp->tdm_slots = pdata->tdm_slots;
-		}
-	}
-
-	mcasp->num_serializer = pdata->num_serializer;
-#ifdef CONFIG_PM
-	mcasp->context.xrsr_regs = devm_kcalloc(&pdev->dev,
-					mcasp->num_serializer, sizeof(u32),
-					GFP_KERNEL);
-	if (!mcasp->context.xrsr_regs) {
-		ret = -ENOMEM;
-		goto err;
-	}
-#endif
-	mcasp->serial_dir = pdata->serial_dir;
-	mcasp->version = pdata->version;
-	mcasp->txnumevt = pdata->txnumevt;
-	mcasp->rxnumevt = pdata->rxnumevt;
-	mcasp->dismod = pdata->dismod;
-
-	mcasp->dev = &pdev->dev;
-
 	irq = platform_get_irq_byname_optional(pdev, "common");
 	if (irq > 0) {
 		irq_name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s_common",
@@ -2242,7 +2201,7 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
 	if (dat)
 		dma_data->addr = dat->start;
 	else
-		dma_data->addr = mem->start + davinci_mcasp_txdma_offset(pdata);
+		dma_data->addr = mem->start + davinci_mcasp_txdma_offset(mcasp->pdata);
 
 
 	/* RX is not valid in DIT mode */
@@ -2253,7 +2212,7 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
 			dma_data->addr = dat->start;
 		else
 			dma_data->addr =
-				mem->start + davinci_mcasp_rxdma_offset(pdata);
+				mem->start + davinci_mcasp_rxdma_offset(mcasp->pdata);
 	}
 
 	if (mcasp->version < MCASP_VERSION_3) {
@@ -2306,11 +2265,8 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
 	if (ret)
 		goto err;
 
-	davinci_mcasp_get_dt_params(mcasp);
-
-	ret = devm_snd_soc_register_component(&pdev->dev,
-					&davinci_mcasp_component,
-					&davinci_mcasp_dai[pdata->op_mode], 1);
+	ret = devm_snd_soc_register_component(&pdev->dev, &davinci_mcasp_component,
+					      &davinci_mcasp_dai[mcasp->op_mode], 1);
 
 	if (ret != 0)
 		goto err;
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

