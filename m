Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5316B70B6
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Mar 2023 08:59:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 020DC148C;
	Mon, 13 Mar 2023 08:58:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 020DC148C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678694364;
	bh=bqRQr1+fwZ5agTPyQG2TEJNPiCWiBA7n/P1CfZ3yrgw=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=I32RzyircZuBql7ncax3TvzRbWgNgxFnBQKjmCijERV9EPVGoQFvQNxvf3nSzpYdM
	 3ltJDZl357wwCTXGzcGTG+C/szSO67j/WdhuHHeVT38uO8EBnYk0bJMZ377bo+q67+
	 0DPc4oAlLvKcQgLUpUPyMUr1+ag0fJDdmwshf3YI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EC39BF80544;
	Mon, 13 Mar 2023 08:57:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6801F80425; Mon, 13 Mar 2023 08:55:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DE1AAF80482
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 08:54:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE1AAF80482
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=xX3qQEzK
Received: by mail-ed1-x52f.google.com with SMTP id y4so15454746edo.2
        for <alsa-devel@alsa-project.org>;
 Mon, 13 Mar 2023 00:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678694096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aOLvETKr12gRLc+dvhlTcgF5sZT1MDYlJ7/1TcrZo+s=;
        b=xX3qQEzKsx+66gUd9XUqSf+Hr3CrB+H3JRf2p/Bmux8hAn+1seNR30FiLO+tvVNjjT
         dYu2zDTTinQboVoKJJlwxoG7lpfTznDpl2OW10swf6CsFGfyqD9tdkAUeETVE4Khrf+T
         p8Y9OXF6UauCT946HCrYP9dTl+DO4Lg+mWzVzAUUtCcd07vWBo6NUMQ/POE1FTodUAXs
         nhSfJkJM1UtDvLRRsepvRdIBOMAblHSZNJBLnRTFwlPQEQ3gwAAF5tX5EbfyxYoVxdgi
         /w8joUS3ke3litcNtUppzn4mXShN2gSZ+rADO+15Lk+Ig0OX98ihAZphj13gwdounQGJ
         BH/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678694096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aOLvETKr12gRLc+dvhlTcgF5sZT1MDYlJ7/1TcrZo+s=;
        b=ZdcCYAOp14Il1DowxsJNjG/t7paUQmqqfg32WDsz1yyADR9+6MB7ZjyCcvRVOAESJJ
         6fEvARH0bfiNKhSsYBrhggMkrkQoxzj55yTp6BCQC0lWWyPRmHn6FvxJDGWgLJ1AWqyA
         95QNpyU2GvxlUJ2GSadrmKnL5QyIaImsyrO1MvOQB+/oJ4XNjLPiOKljfI1ns7/A15nE
         gHLQSJ12steuK0lKilJOS8iPxPe0hFJAzTtD6cb4zj7g236wRF8qNqRVlnoG4rDa0pDK
         QXR3GGCNFW36O9e20bdjUs1G67w9oY5bE0Q3JcE70B7ebZs0Xi55CC9FRVk/mXB1Maom
         qYiw==
X-Gm-Message-State: AO0yUKUC8OQDF1sGx5cgUK6mBuWkgfQNmcsPP9mfxUD/yZmHVG7YyYGK
	ymyz09/uN6/urvmREDj9GkP27g==
X-Google-Smtp-Source: 
 AK7set+GlczbPPP4+2pS69wk1xnY0+UkBHHrd9kySDYK81vNV7l/lZEbo7WewH5iME+BbG0DmGOT6w==
X-Received: by 2002:a17:906:1604:b0:879:bff:55c with SMTP id
 m4-20020a170906160400b008790bff055cmr6271106ejd.1.1678694096626;
        Mon, 13 Mar 2023 00:54:56 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:f052:f15:3f90:fcb3])
        by smtp.gmail.com with ESMTPSA id
 g7-20020a1709061c8700b008b980c3e013sm3146943ejh.179.2023.03.13.00.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 00:54:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/9] ASoC: codecs: lpass-tx-macro: add support for SM8550
Date: Mon, 13 Mar 2023 08:54:42 +0100
Message-Id: <20230313075445.17160-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230313075445.17160-1-krzysztof.kozlowski@linaro.org>
References: <20230313075445.17160-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3WLJSNBTYVIYHNXTU4UD37QN34HEE53J
X-Message-ID-Hash: 3WLJSNBTYVIYHNXTU4UD37QN34HEE53J
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3WLJSNBTYVIYHNXTU4UD37QN34HEE53J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add support for the TX macro codec on Qualcomm SM8550.  SM8550 does not
use NPL clock, thus add flags allowing to skip it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

---

Changes since v1:
1. Move the flag define to common header
---
 sound/soc/codecs/lpass-tx-macro.c | 35 ++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index 473d3cd39554..a01a35f2e471 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -1915,7 +1915,10 @@ static int tx_macro_register_mclk_output(struct tx_macro *tx)
 	struct clk_init_data init;
 	int ret;
 
-	parent_clk_name = __clk_get_name(tx->npl);
+	if (tx->npl)
+		parent_clk_name = __clk_get_name(tx->npl);
+	else
+		parent_clk_name = __clk_get_name(tx->mclk);
 
 	init.name = clk_name;
 	init.ops = &swclk_gate_ops;
@@ -1946,10 +1949,13 @@ static int tx_macro_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
+	kernel_ulong_t flags;
 	struct tx_macro *tx;
 	void __iomem *base;
 	int ret, reg;
 
+	flags = (kernel_ulong_t)device_get_match_data(dev);
+
 	tx = devm_kzalloc(dev, sizeof(*tx), GFP_KERNEL);
 	if (!tx)
 		return -ENOMEM;
@@ -1966,9 +1972,11 @@ static int tx_macro_probe(struct platform_device *pdev)
 	if (IS_ERR(tx->mclk))
 		return PTR_ERR(tx->mclk);
 
-	tx->npl = devm_clk_get(dev, "npl");
-	if (IS_ERR(tx->npl))
-		return PTR_ERR(tx->npl);
+	if (flags & LPASS_MACRO_FLAG_HAS_NPL_CLOCK) {
+		tx->npl = devm_clk_get(dev, "npl");
+		if (IS_ERR(tx->npl))
+			return PTR_ERR(tx->npl);
+	}
 
 	tx->fsgen = devm_clk_get(dev, "fsgen");
 	if (IS_ERR(tx->fsgen))
@@ -2145,10 +2153,21 @@ static const struct dev_pm_ops tx_macro_pm_ops = {
 };
 
 static const struct of_device_id tx_macro_dt_match[] = {
-	{ .compatible = "qcom,sc7280-lpass-tx-macro" },
-	{ .compatible = "qcom,sm8250-lpass-tx-macro" },
-	{ .compatible = "qcom,sm8450-lpass-tx-macro" },
-	{ .compatible = "qcom,sc8280xp-lpass-tx-macro" },
+	{
+		.compatible = "qcom,sc7280-lpass-tx-macro",
+		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
+	}, {
+		.compatible = "qcom,sm8250-lpass-tx-macro",
+		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
+	}, {
+		.compatible = "qcom,sm8450-lpass-tx-macro",
+		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
+	}, {
+		.compatible = "qcom,sm8550-lpass-tx-macro",
+	}, {
+		.compatible = "qcom,sc8280xp-lpass-tx-macro",
+		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, tx_macro_dt_match);
-- 
2.34.1

