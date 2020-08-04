Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B889823B684
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Aug 2020 10:10:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 590F31674;
	Tue,  4 Aug 2020 10:09:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 590F31674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596528641;
	bh=pk+J+EBSVRnpc7SjYOgd3FKYMwRKr2eoAcNDdGMJzoI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AEhsXBnzcmtl5KUTI+BAR25PlJlR9KnH/6WNVsNlMja4y1fWirU4wfeKbxFzxx6N0
	 gPxAiHHfzf1zQuFKgrtRHE6YH51MXGgzdplcv8agstQEFC2s47cZ8vmgdixxa2R67E
	 M+jxXS6x+n4iloHug4PjNZ0zmw7SfvUxQA8eskg0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 305EFF8027D;
	Tue,  4 Aug 2020 10:08:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DD13F80260; Tue,  4 Aug 2020 10:08:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B88FF80124
 for <alsa-devel@alsa-project.org>; Tue,  4 Aug 2020 10:08:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B88FF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="r8vbDiNZ"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1596528494; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=f5kfQP1eboY+NaqkYe/LSy+Eh7biZgr189iHUfCZn/U=;
 b=r8vbDiNZkBVswMnWOqt3o4q38f4mNN/Ji4CKgEYtt8zCNKnaCxU/cDSt2o0KE90eC53yJD1y
 XDa7j/96LH6ViuK757FvQ76UjZuDRmmu/AB6e7F9a6qbfbC+5oZqXez0pHgpaU2ZzCa/lrJZ
 zbpPTmu5VeSPRvYvpRQDXLEiQ/c=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5f29176b8ecb2754f9c2fdb9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 04 Aug 2020 08:08:11
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id DC621C433C6; Tue,  4 Aug 2020 08:08:10 +0000 (UTC)
Received: from rohkumar-linux.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: rohitkr)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6FB3BC433C9;
 Tue,  4 Aug 2020 08:08:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6FB3BC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=rohitkr@codeaurora.org
From: Rohit kumar <rohitkr@codeaurora.org>
To: agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
 bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 02/12] ASoC: qcom: lpass-cpu: Move ahbix clk to platform
 specific function
Date: Tue,  4 Aug 2020 13:37:23 +0530
Message-Id: <1596528453-11437-3-git-send-email-rohitkr@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596528453-11437-1-git-send-email-rohitkr@codeaurora.org>
References: <1596528453-11437-1-git-send-email-rohitkr@codeaurora.org>
Cc: Rohit kumar <rohitkr@codeaurora.org>
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

Ahbix clock is optional clock and not needed for all platforms.
Move it to lpass-apq8016/ipq806x as it is not needed for sc7180.

Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/lpass-apq8016.c | 27 ++++++++++++++++++++++++++
 sound/soc/qcom/lpass-cpu.c     | 40 ++++++++++-----------------------------
 sound/soc/qcom/lpass-ipq806x.c | 43 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 80 insertions(+), 30 deletions(-)

diff --git a/sound/soc/qcom/lpass-apq8016.c b/sound/soc/qcom/lpass-apq8016.c
index 8210e37..fe4c258 100644
--- a/sound/soc/qcom/lpass-apq8016.c
+++ b/sound/soc/qcom/lpass-apq8016.c
@@ -185,7 +185,33 @@ static int apq8016_lpass_init(struct platform_device *pdev)
 		return ret;
 	}
 
+	drvdata->ahbix_clk = devm_clk_get(dev, "ahbix-clk");
+	if (IS_ERR(drvdata->ahbix_clk)) {
+		dev_err(dev, "error getting ahbix-clk: %ld\n",
+				PTR_ERR(drvdata->ahbix_clk));
+		ret = PTR_ERR(drvdata->ahbix_clk);
+		goto err_ahbix_clk;
+	}
+
+	ret = clk_set_rate(drvdata->ahbix_clk, LPASS_AHBIX_CLOCK_FREQUENCY);
+	if (ret) {
+		dev_err(dev, "error setting rate on ahbix_clk: %d\n", ret);
+		goto err_ahbix_clk;
+	}
+	dev_dbg(dev, "set ahbix_clk rate to %lu\n",
+			clk_get_rate(drvdata->ahbix_clk));
+
+	ret = clk_prepare_enable(drvdata->ahbix_clk);
+	if (ret) {
+		dev_err(dev, "error enabling ahbix_clk: %d\n", ret);
+		goto err_ahbix_clk;
+	}
+
 	return 0;
+
+err_ahbix_clk:
+	clk_bulk_disable_unprepare(drvdata->num_clks, drvdata->clks);
+	return ret;
 }
 
 static int apq8016_lpass_exit(struct platform_device *pdev)
@@ -193,6 +219,7 @@ static int apq8016_lpass_exit(struct platform_device *pdev)
 	struct lpass_data *drvdata = platform_get_drvdata(pdev);
 
 	clk_bulk_disable_unprepare(drvdata->num_clks, drvdata->clks);
+	clk_disable_unprepare(drvdata->ahbix_clk);
 
 	return 0;
 }
diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index e00a4af..f0c7e93 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -566,8 +566,13 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 		return PTR_ERR(drvdata->lpaif_map);
 	}
 
-	if (variant->init)
-		variant->init(pdev);
+	if (variant->init) {
+		ret = variant->init(pdev);
+		if (ret) {
+			dev_err(dev, "error initializing variant: %d\n", ret);
+			return ret;
+		}
+	}
 
 	for (i = 0; i < variant->num_dai; i++) {
 		dai_id = variant->dai_driver[i].id;
@@ -594,46 +599,22 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 		}
 	}
 
-	drvdata->ahbix_clk = devm_clk_get(dev, "ahbix-clk");
-	if (IS_ERR(drvdata->ahbix_clk)) {
-		dev_err(dev, "error getting ahbix-clk: %ld\n",
-			PTR_ERR(drvdata->ahbix_clk));
-		return PTR_ERR(drvdata->ahbix_clk);
-	}
-
-	ret = clk_set_rate(drvdata->ahbix_clk, LPASS_AHBIX_CLOCK_FREQUENCY);
-	if (ret) {
-		dev_err(dev, "error setting rate on ahbix_clk: %d\n", ret);
-		return ret;
-	}
-	dev_dbg(dev, "set ahbix_clk rate to %lu\n",
-		clk_get_rate(drvdata->ahbix_clk));
-
-	ret = clk_prepare_enable(drvdata->ahbix_clk);
-	if (ret) {
-		dev_err(dev, "error enabling ahbix_clk: %d\n", ret);
-		return ret;
-	}
-
 	ret = devm_snd_soc_register_component(dev,
 					      &lpass_cpu_comp_driver,
 					      variant->dai_driver,
 					      variant->num_dai);
 	if (ret) {
 		dev_err(dev, "error registering cpu driver: %d\n", ret);
-		goto err_clk;
+		goto err;
 	}
 
 	ret = asoc_qcom_lpass_platform_register(pdev);
 	if (ret) {
 		dev_err(dev, "error registering platform driver: %d\n", ret);
-		goto err_clk;
+		goto err;
 	}
 
-	return 0;
-
-err_clk:
-	clk_disable_unprepare(drvdata->ahbix_clk);
+err:
 	return ret;
 }
 EXPORT_SYMBOL_GPL(asoc_qcom_lpass_cpu_platform_probe);
@@ -645,7 +626,6 @@ int asoc_qcom_lpass_cpu_platform_remove(struct platform_device *pdev)
 	if (drvdata->variant->exit)
 		drvdata->variant->exit(pdev);
 
-	clk_disable_unprepare(drvdata->ahbix_clk);
 
 	return 0;
 }
diff --git a/sound/soc/qcom/lpass-ipq806x.c b/sound/soc/qcom/lpass-ipq806x.c
index 1987605..b7c0586 100644
--- a/sound/soc/qcom/lpass-ipq806x.c
+++ b/sound/soc/qcom/lpass-ipq806x.c
@@ -55,6 +55,47 @@ static struct snd_soc_dai_driver ipq806x_lpass_cpu_dai_driver = {
 	.ops    = &asoc_qcom_lpass_cpu_dai_ops,
 };
 
+static int ipq806x_lpass_init(struct platform_device *pdev)
+{
+	struct lpass_data *drvdata = platform_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	drvdata->ahbix_clk = devm_clk_get(dev, "ahbix-clk");
+	if (IS_ERR(drvdata->ahbix_clk)) {
+		dev_err(dev, "error getting ahbix-clk: %ld\n",
+				PTR_ERR(drvdata->ahbix_clk));
+		ret = PTR_ERR(drvdata->ahbix_clk);
+		goto err_ahbix_clk;
+	}
+
+	ret = clk_set_rate(drvdata->ahbix_clk, LPASS_AHBIX_CLOCK_FREQUENCY);
+	if (ret) {
+		dev_err(dev, "error setting rate on ahbix_clk: %d\n", ret);
+		goto err_ahbix_clk;
+	}
+	dev_dbg(dev, "set ahbix_clk rate to %lu\n",
+			clk_get_rate(drvdata->ahbix_clk));
+
+	ret = clk_prepare_enable(drvdata->ahbix_clk);
+	if (ret) {
+		dev_err(dev, "error enabling ahbix_clk: %d\n", ret);
+		goto err_ahbix_clk;
+	}
+
+err_ahbix_clk:
+	return ret;
+}
+
+static int ipq806x_lpass_exit(struct platform_device *pdev)
+{
+	struct lpass_data *drvdata = platform_get_drvdata(pdev);
+
+	clk_disable_unprepare(drvdata->ahbix_clk);
+
+	return 0;
+}
+
 static int ipq806x_lpass_alloc_dma_channel(struct lpass_data *drvdata, int dir)
 {
 	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
@@ -90,6 +131,8 @@ static struct lpass_variant ipq806x_data = {
 	.dai_bit_clk_names	= (const char *[]) {
 				"mi2s-bit-clk",
 				},
+	.init			= ipq806x_lpass_init,
+	.exit			= ipq806x_lpass_exit,
 	.alloc_dma_channel	= ipq806x_lpass_alloc_dma_channel,
 	.free_dma_channel	= ipq806x_lpass_free_dma_channel,
 };
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

