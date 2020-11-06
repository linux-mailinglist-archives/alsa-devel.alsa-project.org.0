Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 569812A904D
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Nov 2020 08:28:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E52E3167C;
	Fri,  6 Nov 2020 08:27:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E52E3167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604647715;
	bh=btjNbsogy1THfM0+0+xdCRTQopNaAJMJahZp1tdkOZ0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NUykTpaS6NUCMC25yCVo8waK+Y5G/CZ+4QEY6BiOzxgPjDGrh7K8cr7phC4Lj+GtC
	 AFbmOuU8yeGi8Mi1q58P4ZoZJm0MPCyOhR1R5GMI0QqtAjwHMURGQ8Xsj4yq+vMrH3
	 w+MLwQvzgv/knn2jsFggYrxQ2/f375TlQxdYN5/c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85CC6F804E1;
	Fri,  6 Nov 2020 08:25:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B610FF804E0; Fri,  6 Nov 2020 08:25:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12AF3F8023E
 for <alsa-devel@alsa-project.org>; Fri,  6 Nov 2020 08:25:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12AF3F8023E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="f/LABfF0"
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A67PIWA114028;
 Fri, 6 Nov 2020 01:25:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604647518;
 bh=1jPynEs0aAy9dWc/saF0G3bNVEgpcQo3cXkyGCqGmTA=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=f/LABfF0HB3dMy2YpVNlukOXOL1QfO7yFZNsKP7hyBkWnaxN/hVcqIUAG/p8A000f
 9XuiaLPszJTl/tXDYmp4G9ABHPdB95VqtNDNZp8yuzhpPS85qzEVqne8xUF0skXuUY
 qQ+hd7WwBlb6ouRiz6yhjndtaq2IcatQp6IVf5+k=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A67PIvQ008140
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 6 Nov 2020 01:25:18 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 6 Nov
 2020 01:25:18 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 6 Nov 2020 01:25:18 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A67P8Sx113537;
 Fri, 6 Nov 2020 01:25:16 -0600
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 4/4] ASoC: ti: davinci-mcasp: Handle missing required DT
 properties
Date: Fri, 6 Nov 2020 09:25:51 +0200
Message-ID: <20201106072551.689-5-peter.ujfalusi@ti.com>
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

McASP needs three required properties to be usable for audio:
op-mode, tdm-slots and the serial-dir array.

Instead of probing the driver even without the needed information we should
make sure that all the parameters are provided for operation.

The fact that McASP can act as a GPIO controller for it's pins complicates
this a bit, but as a general rule we can:
- we fail the probe if McASP is not configured to be used as gpiochip
- we will not register the DAI (and PCM) if gpiochip is defined

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 sound/soc/ti/davinci-mcasp.c | 77 +++++++++++++++++++++++++++---------
 1 file changed, 58 insertions(+), 19 deletions(-)

diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index 7aba1ccec8c9..6247ec3d3a09 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -83,6 +83,9 @@ struct davinci_mcasp {
 	struct snd_pcm_substream *substreams[2];
 	unsigned int dai_fmt;
 
+	/* Audio can not be enabled due to missing parameter(s) */
+	bool	missing_audio_param;
+
 	/* McASP specific data */
 	int	tdm_slots;
 	u32	tdm_mask[2];
@@ -1748,6 +1751,17 @@ static int mcasp_reparent_fck(struct platform_device *pdev)
 	return ret;
 }
 
+static bool davinci_mcasp_have_gpiochip(struct davinci_mcasp *mcasp)
+{
+#ifdef CONFIG_OF_GPIO
+	if (mcasp->dev->of_node &&
+	    of_property_read_bool(mcasp->dev->of_node, "gpio-controller"))
+		return true;
+#endif
+
+	return false;
+}
+
 static int davinci_mcasp_get_config(struct davinci_mcasp *mcasp,
 				    struct platform_device *pdev)
 {
@@ -1772,8 +1786,12 @@ static int davinci_mcasp_get_config(struct davinci_mcasp *mcasp,
 		return -EINVAL;
 	}
 
-	if (of_property_read_u32(np, "op-mode", &val) == 0)
+	if (of_property_read_u32(np, "op-mode", &val) == 0) {
 		pdata->op_mode = val;
+	} else {
+		mcasp->missing_audio_param = true;
+		goto out;
+	}
 
 	if (of_property_read_u32(np, "tdm-slots", &val) == 0) {
 		if (val < 2 || val > 32) {
@@ -1782,6 +1800,9 @@ static int davinci_mcasp_get_config(struct davinci_mcasp *mcasp,
 		}
 
 		pdata->tdm_slots = val;
+	} else if (pdata->op_mode == DAVINCI_MCASP_IIS_MODE) {
+		mcasp->missing_audio_param = true;
+		goto out;
 	}
 
 	of_serial_dir32 = of_get_property(np, "serial-dir", &val);
@@ -1798,6 +1819,9 @@ static int davinci_mcasp_get_config(struct davinci_mcasp *mcasp,
 
 		pdata->num_serializer = val;
 		pdata->serial_dir = of_serial_dir;
+	} else {
+		mcasp->missing_audio_param = true;
+		goto out;
 	}
 
 	if (of_property_read_u32(np, "tx-num-evt", &val) == 0)
@@ -1823,6 +1847,16 @@ static int davinci_mcasp_get_config(struct davinci_mcasp *mcasp,
 out:
 	mcasp->pdata = pdata;
 
+	if (mcasp->missing_audio_param) {
+		if (davinci_mcasp_have_gpiochip(mcasp)) {
+			dev_dbg(&pdev->dev, "Missing DT parameter(s) for audio\n");
+			return 0;
+		}
+
+		dev_err(&pdev->dev, "Insufficient DT parameter(s)\n");
+		return -ENODEV;
+	}
+
 	mcasp->op_mode = pdata->op_mode;
 	/* sanity check for tdm slots parameter */
 	if (mcasp->op_mode == DAVINCI_MCASP_IIS_MODE) {
@@ -2072,7 +2106,7 @@ static const struct gpio_chip davinci_mcasp_template_chip = {
 
 static int davinci_mcasp_init_gpiochip(struct davinci_mcasp *mcasp)
 {
-	if (!of_property_read_bool(mcasp->dev->of_node, "gpio-controller"))
+	if (!davinci_mcasp_have_gpiochip(mcasp))
 		return 0;
 
 	mcasp->gpio_chip = davinci_mcasp_template_chip;
@@ -2111,11 +2145,6 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
 	if (!mcasp)
 		return	-ENOMEM;
 
-	mcasp->dev = &pdev->dev;
-	ret = davinci_mcasp_get_config(mcasp, pdev);
-	if (ret)
-		return ret;
-
 	mem = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mpu");
 	if (!mem) {
 		dev_warn(&pdev->dev,
@@ -2131,8 +2160,23 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
 	if (IS_ERR(mcasp->base))
 		return PTR_ERR(mcasp->base);
 
+	dev_set_drvdata(&pdev->dev, mcasp);
 	pm_runtime_enable(&pdev->dev);
 
+	mcasp->dev = &pdev->dev;
+	ret = davinci_mcasp_get_config(mcasp, pdev);
+	if (ret)
+		goto err;
+
+	/* All PINS as McASP */
+	pm_runtime_get_sync(mcasp->dev);
+	mcasp_set_reg(mcasp, DAVINCI_MCASP_PFUNC_REG, 0x00000000);
+	pm_runtime_put(mcasp->dev);
+
+	/* Skip audio related setup code if the configuration is not adequat */
+	if (mcasp->missing_audio_param)
+		goto no_audio;
+
 	irq = platform_get_irq_byname_optional(pdev, "common");
 	if (irq > 0) {
 		irq_name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s_common",
@@ -2252,19 +2296,8 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
 	if (ret)
 		goto err;
 
-	dev_set_drvdata(&pdev->dev, mcasp);
-
 	mcasp_reparent_fck(pdev);
 
-	/* All PINS as McASP */
-	pm_runtime_get_sync(mcasp->dev);
-	mcasp_set_reg(mcasp, DAVINCI_MCASP_PFUNC_REG, 0x00000000);
-	pm_runtime_put(mcasp->dev);
-
-	ret = davinci_mcasp_init_gpiochip(mcasp);
-	if (ret)
-		goto err;
-
 	ret = devm_snd_soc_register_component(&pdev->dev, &davinci_mcasp_component,
 					      &davinci_mcasp_dai[mcasp->op_mode], 1);
 
@@ -2293,8 +2326,14 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	return 0;
+no_audio:
+	ret = davinci_mcasp_init_gpiochip(mcasp);
+	if (ret) {
+		dev_err(&pdev->dev, "gpiochip registration failed: %d\n", ret);
+		goto err;
+	}
 
+	return 0;
 err:
 	pm_runtime_disable(&pdev->dev);
 	return ret;
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

