Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACB21A7521
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 09:46:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7423168C;
	Tue, 14 Apr 2020 09:45:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7423168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586850376;
	bh=y28UbxWdvqoty5hr2urcEAnMd+Ed8EBk5a2sKzxEBMA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yct9JSWaYuQVJY0ARgL0lFIRqncxUMFRPcbIqAnq0vbB/ulCVVX4l2fhDfpkPoFil
	 pdPXdHXT8r8A+a31xwiJH9rtBpgniVQFyRVCYrSAOpZ3B5Z/3JfSQ0YDSzHg/wFmF9
	 feRfhRVKqS3jkKUdzEqqkNfXODoJ9RnUeIYKnBwQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78E3BF8029B;
	Tue, 14 Apr 2020 09:42:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3766F801DA; Sat, 11 Apr 2020 10:04:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF670F800CB
 for <alsa-devel@alsa-project.org>; Sat, 11 Apr 2020 10:04:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF670F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="pwjskvPU"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1586592244; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Y8q86WTB5/2WAKeKfT6xOfI6cCwvGx47c3+wU560RYE=;
 b=pwjskvPUzCSZlnEH65KwTMD8u7t0ZHSsA3U7YBErrTcqtOiR3J0Fb8dsNQaBIFqynCwvvuub
 aDzyJd6UnJBGWscuaS+51Ip9ik+Yfz/FAvPHbprIWU+8kz54yFwYR8rkxnyZLG44YD6pDZuZ
 /EA3V/e9DLPCctlTk2K90LuQ4r8=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e9179f3.7f70714401b8-smtp-out-n05;
 Sat, 11 Apr 2020 08:04:03 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 41875C432C2; Sat, 11 Apr 2020 08:04:02 +0000 (UTC)
Received: from c-ajitp-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: ajitp)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8C4B2C433F2;
 Sat, 11 Apr 2020 08:03:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8C4B2C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=ajitp@codeaurora.org
From: Ajit Pandey <ajitp@codeaurora.org>
To: alsa-devel@alsa-project.org, broonie@kernel.org,
 devicetree@vger.kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 srinivas.kandagatla@linaro.org
Subject: [PATCH 03/11] ASoC: qcom: Add common array to initialize soc based
 core clocks
Date: Sat, 11 Apr 2020 13:32:43 +0530
Message-Id: <1586592171-31644-4-git-send-email-ajitp@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1586592171-31644-1-git-send-email-ajitp@codeaurora.org>
References: <1586592171-31644-1-git-send-email-ajitp@codeaurora.org>
X-Mailman-Approved-At: Tue, 14 Apr 2020 09:41:46 +0200
Cc: Ajit Pandey <ajitp@codeaurora.org>, linux-kernel@vger.kernel.org,
 tiwai@suse.com
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

lpass variants have their own soc specific clocks that needs to be
enable for MI2S audio support. Added a common variable in drvdata to
initialize such clocks using bulk clk api. Such clock names is still
defined in variants specific data and needs to fetched during init.

Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
---
 sound/soc/qcom/lpass-apq8016.c | 39 ++++++++++++++++++---------------------
 sound/soc/qcom/lpass.h         | 10 +++++++---
 2 files changed, 25 insertions(+), 24 deletions(-)

diff --git a/sound/soc/qcom/lpass-apq8016.c b/sound/soc/qcom/lpass-apq8016.c
index 6575da5..cef4661 100644
--- a/sound/soc/qcom/lpass-apq8016.c
+++ b/sound/soc/qcom/lpass-apq8016.c
@@ -161,33 +161,26 @@ static int apq8016_lpass_free_dma_channel(struct lpass_data *drvdata, int chan)
 static int apq8016_lpass_init(struct platform_device *pdev)
 {
 	struct lpass_data *drvdata = platform_get_drvdata(pdev);
+	struct lpass_variant *variant = drvdata->variant;
 	struct device *dev = &pdev->dev;
-	int ret;
+	int ret, i;
 
-	drvdata->pcnoc_mport_clk = devm_clk_get(dev, "pcnoc-mport-clk");
-	if (IS_ERR(drvdata->pcnoc_mport_clk)) {
-		dev_err(&pdev->dev, "error getting pcnoc-mport-clk: %ld\n",
-			PTR_ERR(drvdata->pcnoc_mport_clk));
-		return PTR_ERR(drvdata->pcnoc_mport_clk);
-	}
+	drvdata->clks = devm_kcalloc(dev, variant->num_clks,
+				     sizeof(*drvdata->clks), GFP_KERNEL);
+	drvdata->num_clks = variant->num_clks;
+
+	for (i = 0; i < drvdata->num_clks; i++)
+		drvdata->clks[i].id = variant->clk_name[i];
 
-	ret = clk_prepare_enable(drvdata->pcnoc_mport_clk);
+	ret = devm_clk_bulk_get(dev, drvdata->num_clks, drvdata->clks);
 	if (ret) {
-		dev_err(&pdev->dev, "Error enabling pcnoc-mport-clk: %d\n",
-			ret);
+		dev_err(dev, "Failed to get clocks %d\n", ret);
 		return ret;
 	}
 
-	drvdata->pcnoc_sway_clk = devm_clk_get(dev, "pcnoc-sway-clk");
-	if (IS_ERR(drvdata->pcnoc_sway_clk)) {
-		dev_err(&pdev->dev, "error getting pcnoc-sway-clk: %ld\n",
-			PTR_ERR(drvdata->pcnoc_sway_clk));
-		return PTR_ERR(drvdata->pcnoc_sway_clk);
-	}
-
-	ret = clk_prepare_enable(drvdata->pcnoc_sway_clk);
+	ret = clk_bulk_prepare_enable(drvdata->num_clks, drvdata->clks);
 	if (ret) {
-		dev_err(&pdev->dev, "Error enabling pcnoc_sway_clk: %d\n", ret);
+		dev_err(dev, "ao8016 clk_enable failed\n");
 		return ret;
 	}
 
@@ -198,8 +191,7 @@ static int apq8016_lpass_exit(struct platform_device *pdev)
 {
 	struct lpass_data *drvdata = platform_get_drvdata(pdev);
 
-	clk_disable_unprepare(drvdata->pcnoc_mport_clk);
-	clk_disable_unprepare(drvdata->pcnoc_sway_clk);
+	clk_bulk_disable_unprepare(drvdata->num_clks, drvdata->clks);
 
 	return 0;
 }
@@ -220,6 +212,11 @@ static int apq8016_lpass_exit(struct platform_device *pdev)
 	.wrdma_reg_stride	= 0x1000,
 	.wrdma_channel_start	= 5,
 	.wrdma_channels		= 2,
+	.clk_name		= (const char*[]) {
+				   "pcnoc-mport-clk",
+				   "pcnoc-sway-clk",
+				  },
+	.num_clks		= 2,
 	.dai_driver		= apq8016_lpass_cpu_dai_driver,
 	.num_dai		= ARRAY_SIZE(apq8016_lpass_cpu_dai_driver),
 	.dai_osr_clk_names	= (const char *[]) {
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index b729686..279cd02 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -49,9 +49,9 @@ struct lpass_data {
 	/* used it for handling interrupt per dma channel */
 	struct snd_pcm_substream *substream[LPASS_MAX_DMA_CHANNELS];
 
-	/* 8016 specific */
-	struct clk *pcnoc_mport_clk;
-	struct clk *pcnoc_sway_clk;
+	/* SOC specific clock list */
+	struct clk_bulk_data *clks;
+	int num_clks;
 
 };
 
@@ -87,6 +87,10 @@ struct lpass_variant {
 	int num_dai;
 	const char * const *dai_osr_clk_names;
 	const char * const *dai_bit_clk_names;
+
+	/* SOC specific clocks configuration */
+	const char **clk_name;
+	int num_clks;
 };
 
 /* register the platform driver from the CPU DAI driver */
-- 
1.9.1
