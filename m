Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6431C333F
	for <lists+alsa-devel@lfdr.de>; Mon,  4 May 2020 09:01:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8035716DB;
	Mon,  4 May 2020 09:01:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8035716DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588575718;
	bh=pO8aPrBvWRWkZ5qRwq2waev8JVR76naIFfK9D6iCfAE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YM0oUpOFAG19Xcc188IEH/rkG1ne3KD4wGjfv7XFA70Q0N0ABgjgRsYMsp7JQb68Q
	 pOaO8rWn8yVQNbMxF7C/uT6+1Zb7xYVSkZDsvgdeCS44c2h+GOviQxc8HnlAXQMJqI
	 1TWTUfnbsK2W1D0mxPAiT/OY6lXxT/n9aqlwHZoo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D6B9F80234;
	Mon,  4 May 2020 09:00:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5628F80249; Mon,  4 May 2020 09:00:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cmccmta1.chinamobile.com (cmccmta1.chinamobile.com
 [221.176.66.79])
 by alsa1.perex.cz (Postfix) with ESMTP id DA2F5F800E5
 for <alsa-devel@alsa-project.org>; Mon,  4 May 2020 08:59:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA2F5F800E5
Received: from spf.mail.chinamobile.com (unknown[172.16.121.19]) by
 rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee25eafbd44c24-fd0a0;
 Mon, 04 May 2020 14:59:18 +0800 (CST)
X-RM-TRANSID: 2ee25eafbd44c24-fd0a0
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.3.182.180])
 by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea5eafbd4152c-0599b;
 Mon, 04 May 2020 14:59:17 +0800 (CST)
X-RM-TRANSID: 2eea5eafbd4152c-0599b
From: Tang Bin <tangbin@cmss.chinamobile.com>
To: broonie@kernel.org, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 bgoswami@codeaurora.org, plai@codeaurora.org
Subject: [PATCH] ASoC: qcom: Use the defined variable to simplify code
Date: Mon,  4 May 2020 14:59:47 +0800
Message-Id: <20200504065947.12172-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Zhang Shengju <zhangshengju@cmss.chinamobile.com>,
 linux-kernel@vger.kernel.org, Tang Bin <tangbin@cmss.chinamobile.com>
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

Use the defined variable "dev" to make the code cleaner.

Signed-off-by: Zhang Shengju <zhangshengju@cmss.chinamobile.com>
Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 sound/soc/qcom/lpass-apq8016.c |  9 ++++----
 sound/soc/qcom/lpass-cpu.c     | 39 ++++++++++++++++------------------
 2 files changed, 22 insertions(+), 26 deletions(-)

diff --git a/sound/soc/qcom/lpass-apq8016.c b/sound/soc/qcom/lpass-apq8016.c
index 6575da549..b3610d05b 100644
--- a/sound/soc/qcom/lpass-apq8016.c
+++ b/sound/soc/qcom/lpass-apq8016.c
@@ -166,28 +166,27 @@ static int apq8016_lpass_init(struct platform_device *pdev)
 
 	drvdata->pcnoc_mport_clk = devm_clk_get(dev, "pcnoc-mport-clk");
 	if (IS_ERR(drvdata->pcnoc_mport_clk)) {
-		dev_err(&pdev->dev, "error getting pcnoc-mport-clk: %ld\n",
+		dev_err(dev, "error getting pcnoc-mport-clk: %ld\n",
 			PTR_ERR(drvdata->pcnoc_mport_clk));
 		return PTR_ERR(drvdata->pcnoc_mport_clk);
 	}
 
 	ret = clk_prepare_enable(drvdata->pcnoc_mport_clk);
 	if (ret) {
-		dev_err(&pdev->dev, "Error enabling pcnoc-mport-clk: %d\n",
-			ret);
+		dev_err(dev, "Error enabling pcnoc-mport-clk: %d\n", ret);
 		return ret;
 	}
 
 	drvdata->pcnoc_sway_clk = devm_clk_get(dev, "pcnoc-sway-clk");
 	if (IS_ERR(drvdata->pcnoc_sway_clk)) {
-		dev_err(&pdev->dev, "error getting pcnoc-sway-clk: %ld\n",
+		dev_err(dev, "error getting pcnoc-sway-clk: %ld\n",
 			PTR_ERR(drvdata->pcnoc_sway_clk));
 		return PTR_ERR(drvdata->pcnoc_sway_clk);
 	}
 
 	ret = clk_prepare_enable(drvdata->pcnoc_sway_clk);
 	if (ret) {
-		dev_err(&pdev->dev, "Error enabling pcnoc_sway_clk: %d\n", ret);
+		dev_err(dev, "Error enabling pcnoc_sway_clk: %d\n", ret);
 		return ret;
 	}
 
diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index dbce7e92b..c6d26395f 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -425,12 +425,11 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 
 	dsp_of_node = of_parse_phandle(pdev->dev.of_node, "qcom,adsp", 0);
 	if (dsp_of_node) {
-		dev_err(&pdev->dev, "DSP exists and holds audio resources\n");
+		dev_err(dev, "DSP exists and holds audio resources\n");
 		return -EBUSY;
 	}
 
-	drvdata = devm_kzalloc(&pdev->dev, sizeof(struct lpass_data),
-			GFP_KERNEL);
+	drvdata = devm_kzalloc(dev, sizeof(struct lpass_data), GFP_KERNEL);
 	if (!drvdata)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, drvdata);
@@ -444,9 +443,9 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-lpaif");
 
-	drvdata->lpaif = devm_ioremap_resource(&pdev->dev, res);
+	drvdata->lpaif = devm_ioremap_resource(dev, res);
 	if (IS_ERR((void const __force *)drvdata->lpaif)) {
-		dev_err(&pdev->dev, "error mapping reg resource: %ld\n",
+		dev_err(dev, "error mapping reg resource: %ld\n",
 				PTR_ERR((void const __force *)drvdata->lpaif));
 		return PTR_ERR((void const __force *)drvdata->lpaif);
 	}
@@ -455,10 +454,10 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 						variant->wrdma_channels +
 						variant->wrdma_channel_start);
 
-	drvdata->lpaif_map = devm_regmap_init_mmio(&pdev->dev, drvdata->lpaif,
+	drvdata->lpaif_map = devm_regmap_init_mmio(dev, drvdata->lpaif,
 			&lpass_cpu_regmap_config);
 	if (IS_ERR(drvdata->lpaif_map)) {
-		dev_err(&pdev->dev, "error initializing regmap: %ld\n",
+		dev_err(dev, "error initializing regmap: %ld\n",
 			PTR_ERR(drvdata->lpaif_map));
 		return PTR_ERR(drvdata->lpaif_map);
 	}
@@ -468,10 +467,10 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 
 	for (i = 0; i < variant->num_dai; i++) {
 		dai_id = variant->dai_driver[i].id;
-		drvdata->mi2s_osr_clk[dai_id] = devm_clk_get(&pdev->dev,
+		drvdata->mi2s_osr_clk[dai_id] = devm_clk_get(dev,
 					     variant->dai_osr_clk_names[i]);
 		if (IS_ERR(drvdata->mi2s_osr_clk[dai_id])) {
-			dev_warn(&pdev->dev,
+			dev_warn(dev,
 				"%s() error getting optional %s: %ld\n",
 				__func__,
 				variant->dai_osr_clk_names[i],
@@ -480,10 +479,10 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 			drvdata->mi2s_osr_clk[dai_id] = NULL;
 		}
 
-		drvdata->mi2s_bit_clk[dai_id] = devm_clk_get(&pdev->dev,
+		drvdata->mi2s_bit_clk[dai_id] = devm_clk_get(dev,
 						variant->dai_bit_clk_names[i]);
 		if (IS_ERR(drvdata->mi2s_bit_clk[dai_id])) {
-			dev_err(&pdev->dev,
+			dev_err(dev,
 				"error getting %s: %ld\n",
 				variant->dai_bit_clk_names[i],
 				PTR_ERR(drvdata->mi2s_bit_clk[dai_id]));
@@ -491,41 +490,39 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 		}
 	}
 
-	drvdata->ahbix_clk = devm_clk_get(&pdev->dev, "ahbix-clk");
+	drvdata->ahbix_clk = devm_clk_get(dev, "ahbix-clk");
 	if (IS_ERR(drvdata->ahbix_clk)) {
-		dev_err(&pdev->dev, "error getting ahbix-clk: %ld\n",
+		dev_err(dev, "error getting ahbix-clk: %ld\n",
 			PTR_ERR(drvdata->ahbix_clk));
 		return PTR_ERR(drvdata->ahbix_clk);
 	}
 
 	ret = clk_set_rate(drvdata->ahbix_clk, LPASS_AHBIX_CLOCK_FREQUENCY);
 	if (ret) {
-		dev_err(&pdev->dev, "error setting rate on ahbix_clk: %d\n",
-			ret);
+		dev_err(dev, "error setting rate on ahbix_clk: %d\n", ret);
 		return ret;
 	}
-	dev_dbg(&pdev->dev, "set ahbix_clk rate to %lu\n",
+	dev_dbg(dev, "set ahbix_clk rate to %lu\n",
 		clk_get_rate(drvdata->ahbix_clk));
 
 	ret = clk_prepare_enable(drvdata->ahbix_clk);
 	if (ret) {
-		dev_err(&pdev->dev, "error enabling ahbix_clk: %d\n", ret);
+		dev_err(dev, "error enabling ahbix_clk: %d\n", ret);
 		return ret;
 	}
 
-	ret = devm_snd_soc_register_component(&pdev->dev,
+	ret = devm_snd_soc_register_component(dev,
 					      &lpass_cpu_comp_driver,
 					      variant->dai_driver,
 					      variant->num_dai);
 	if (ret) {
-		dev_err(&pdev->dev, "error registering cpu driver: %d\n", ret);
+		dev_err(dev, "error registering cpu driver: %d\n", ret);
 		goto err_clk;
 	}
 
 	ret = asoc_qcom_lpass_platform_register(pdev);
 	if (ret) {
-		dev_err(&pdev->dev, "error registering platform driver: %d\n",
-			ret);
+		dev_err(dev, "error registering platform driver: %d\n", ret);
 		goto err_clk;
 	}
 
-- 
2.20.1.windows.1



