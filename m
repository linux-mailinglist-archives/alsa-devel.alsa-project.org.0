Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1794441104B
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Sep 2021 09:38:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 978461687;
	Mon, 20 Sep 2021 09:37:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 978461687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632123516;
	bh=hy5nt/xObB/fxgz8i7So5bbMmXLkCjzAxfGckOPUHnA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iGiBjvaJY88AZPUiFwEx2Yj5qZbrCa1CwOzSRfrzjiMVh49G7ZFwXdunNtPHvqWHn
	 R/iXIIR1oSnQ0O4GdvAKr4BmA0Q5XGwb+7c3tOR4WsJ+zMIZbVT4OVDXjOer4GgMM3
	 nMzUZ2gxx7uR0QqGRi3Ij4DMlhbIlcAV1On4Hjuw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D67BF804E6;
	Mon, 20 Sep 2021 09:36:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E2CAF804BB; Mon, 20 Sep 2021 09:36:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3A5FF80152
 for <alsa-devel@alsa-project.org>; Mon, 20 Sep 2021 09:36:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3A5FF80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="oe5uf92b"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632123385; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=ffcyisodcBdF9BO8GbzfssdNwyEkzbdhdwQtAO1wPYg=;
 b=oe5uf92bj2Km0QCNrqTQS9kv/OuxvQpdwMNdmbTIaNhEEJD7Y7FAYuvIHwbmcqkLtrbu9+f2
 uxT392qFV784WqC0NC/Yl2H+YPg5Vzwgy2ebgjzMpJuYBg8j+goF78/JBZGMZi2k52zQ2TyL
 APzmC+lNII8BQ0N+aLTwjAskjMQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 614839f0648642cc1c3356ea (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 20 Sep 2021 07:36:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 816C1C43616; Mon, 20 Sep 2021 07:36:16 +0000 (UTC)
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id F3A7AC4338F;
 Mon, 20 Sep 2021 07:36:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org F3A7AC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To: agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
 bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
Subject: [PATCH 4/7] ASoC: codecs: lpass-va-macro: Change bulk voting to
 individual clock voting
Date: Mon, 20 Sep 2021 13:05:28 +0530
Message-Id: <1632123331-2425-5-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1632123331-2425-1-git-send-email-srivasam@codeaurora.org>
References: <1632123331-2425-1-git-send-email-srivasam@codeaurora.org>
Cc: Venkata Prasad Potturu <potturu@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
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

Change bulk clock frequency voting to individual voting.

Fixes: 908e6b1df26e (ASoC: codecs: lpass-va-macro: Add support to VA Macro)

Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
 sound/soc/codecs/lpass-va-macro.c | 46 ++++++++++++++++++++++++---------------
 1 file changed, 28 insertions(+), 18 deletions(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index d312a14..0ea39ae 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -193,7 +193,10 @@ struct va_macro {
 
 	int dec_mode[VA_MACRO_NUM_DECIMATORS];
 	struct regmap *regmap;
-	struct clk_bulk_data clks[VA_NUM_CLKS_MAX];
+	struct clk *mclk;
+	struct clk *macro;
+	struct clk *dcodec;
+
 	struct clk_hw hw;
 
 	s32 dmic_0_1_clk_cnt;
@@ -1321,7 +1324,7 @@ static const struct clk_ops fsgen_gate_ops = {
 
 static int va_macro_register_fsgen_output(struct va_macro *va)
 {
-	struct clk *parent = va->clks[2].clk;
+	struct clk *parent = va->mclk;
 	struct device *dev = va->dev;
 	struct device_node *np = dev->of_node;
 	const char *parent_clk_name;
@@ -1404,15 +1407,18 @@ static int va_macro_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	va->dev = dev;
-	va->clks[0].id = "macro";
-	va->clks[1].id = "dcodec";
-	va->clks[2].id = "mclk";
 
-	ret = devm_clk_bulk_get(dev, VA_NUM_CLKS_MAX, va->clks);
-	if (ret) {
-		dev_err(dev, "Error getting VA Clocks (%d)\n", ret);
-		return ret;
-	}
+	va->macro = devm_clk_get_optional(dev, "macro");
+	if (IS_ERR(va->macro))
+		return PTR_ERR(va->macro);
+
+	va->dcodec = devm_clk_get_optional(dev, "dcodec");
+	if (IS_ERR(va->dcodec))
+		return PTR_ERR(va->dcodec);
+
+	va->mclk = devm_clk_get(dev, "mclk");
+	if (IS_ERR(va->mclk))
+		return PTR_ERR(va->mclk);
 
 	ret = of_property_read_u32(dev->of_node, "qcom,dmic-sample-rate",
 				   &sample_rate);
@@ -1426,10 +1432,11 @@ static int va_macro_probe(struct platform_device *pdev)
 	}
 
 	/* mclk rate */
-	clk_set_rate(va->clks[1].clk, VA_MACRO_MCLK_FREQ);
-	ret = clk_bulk_prepare_enable(VA_NUM_CLKS_MAX, va->clks);
-	if (ret)
-		return ret;
+	clk_set_rate(va->mclk, VA_MACRO_MCLK_FREQ);
+
+	clk_prepare_enable(va->mclk);
+	clk_prepare_enable(va->macro);
+	clk_prepare_enable(va->dcodec);
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base)) {
@@ -1457,8 +1464,9 @@ static int va_macro_probe(struct platform_device *pdev)
 	return ret;
 
 err:
-	clk_bulk_disable_unprepare(VA_NUM_CLKS_MAX, va->clks);
-
+	clk_disable_unprepare(va->mclk);
+	clk_disable_unprepare(va->macro);
+	clk_disable_unprepare(va->dcodec);
 	return ret;
 }
 
@@ -1466,8 +1474,10 @@ static int va_macro_remove(struct platform_device *pdev)
 {
 	struct va_macro *va = dev_get_drvdata(&pdev->dev);
 
-	clk_bulk_disable_unprepare(VA_NUM_CLKS_MAX, va->clks);
-
+	of_clk_del_provider(pdev->dev.of_node);
+	clk_disable_unprepare(va->mclk);
+	clk_disable_unprepare(va->macro);
+	clk_disable_unprepare(va->dcodec);
 	return 0;
 }
 
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

