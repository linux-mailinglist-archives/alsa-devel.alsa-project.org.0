Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F9F6B4059
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Mar 2023 14:25:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18F7C18AA;
	Fri, 10 Mar 2023 14:24:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18F7C18AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678454723;
	bh=zfFFRq1UmL7fjSU/hb8ET4L33KIhj0qxtpThVfgGcRE=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h2s88+40ne7eVw819eKTlVV005wjt4urV9ST+RJVh/ELDe+oP2iEkuCZUqmdw8F+F
	 s/hMfKCR82DALIVhbyakRGiDtzFKDD3u5+r+XVpyW/Pq/vtcnTIP0apSj4XSQr8I4s
	 wTuHtdGkQQ6LUyIwcTEBL4iU/NTpl//++yLJGXhE=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 55BD1F80578;
	Fri, 10 Mar 2023 14:22:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28DA3F8052E; Fri, 10 Mar 2023 14:22:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D2AFF804B1
	for <alsa-devel@alsa-project.org>; Fri, 10 Mar 2023 14:22:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D2AFF804B1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=JgavJRWV
Received: by mail-ed1-x536.google.com with SMTP id da10so20409480edb.3
        for <alsa-devel@alsa-project.org>;
 Fri, 10 Mar 2023 05:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678454530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7wB+ZDQLED1lfGjvfm20Sk8PslUquOiz9jmctspNl1k=;
        b=JgavJRWVjXavsT+LNLiKq8j4sHA3egVc/3wVlar/9dWGpeoo98SDPex1hMfV7pY5yf
         1ApuU822yhrebDtqVjYVKjz47l5hI0TdWfGiwEZapkXovmwUIYYl68blWk6e4mt71rcu
         gsdPePIHs1SGdDvQ7FH47ttAJ7julhHo1vkjhLXQbuB5DxVqX9s2palK3XkyV1Y14U/G
         9of8H0ZcpX3/4gnnZeWp5U+L9dLQeCUUUg6tf1JW4TCcjedsfUgNiduvAGRq36N25YwB
         foicPk1df44T0zPT4m2SYXjH/VF2uumUZRbCFNAUV/qLB6NhWGe55n4ADar+apYuxcrW
         Ayhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678454530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7wB+ZDQLED1lfGjvfm20Sk8PslUquOiz9jmctspNl1k=;
        b=TM9Z1sVlLGsxRCaWUHeGrehx78x9+zAF1DFK+CNSkRVTu75YO1I5NtpPcrJDdHIVLr
         QYvi1jqgB/DI7WyUegGuKCo5mwKlTiZczBTt9Lh403IUhqOMH31PEPRfqq1okQaba2zj
         c/Ee6Omu3z2ense2nt3htLPnU3XNqkeXCLLE0UToAV+yU04W/fiZNcYLQymuVCxAKrFL
         REXOGp/HLVgXEQexvVla1oOvGxkp0/g+8o1qqH6Lgy+ZrAzHUMLeGiK4hLUoMM6REMJr
         0vbLaqTdWy6DiSXh7D5Y8GX77kv2DHPqET4eQAOs+iVMG/AAXermP8lYOyxz6MW2+xH9
         v29Q==
X-Gm-Message-State: AO0yUKXCQBRiEsx8pvhNUSTvtantLIcjZF/NmSDoTV2AxAWb1pwNF8KX
	2V+5rG9JnhXPQOUt1VBGH/j2Dg==
X-Google-Smtp-Source: 
 AK7set+PxUyg5gMa34e3JPIVei4cJk2opNLH6ajC/YSQ9yp4xl5ntn+cwfyczNMHa6C+1F4RH8fehg==
X-Received: by 2002:a17:906:28d3:b0:8b2:3eb6:8661 with SMTP id
 p19-20020a17090628d300b008b23eb68661mr23663069ejd.8.1678454530577;
        Fri, 10 Mar 2023 05:22:10 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:45c4:46be:ec71:4a51])
        by smtp.gmail.com with ESMTPSA id
 zc4-20020a170906988400b008b17879ec95sm959124ejb.22.2023.03.10.05.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 05:22:10 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/9] ASoC: codecs: lpass-tx-macro: add support for SM8550
Date: Fri, 10 Mar 2023 14:21:58 +0100
Message-Id: <20230310132201.322148-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310132201.322148-1-krzysztof.kozlowski@linaro.org>
References: <20230310132201.322148-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AAV2CT6LBO4AG22CEVJFEO7JL7GVQME6
X-Message-ID-Hash: AAV2CT6LBO4AG22CEVJFEO7JL7GVQME6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AAV2CT6LBO4AG22CEVJFEO7JL7GVQME6/>
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
---
 sound/soc/codecs/lpass-tx-macro.c | 38 ++++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index 473d3cd39554..23371b21505e 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -205,6 +205,9 @@
 #define TX_MACRO_AMIC_HPF_DELAY_MS	300
 #define MCLK_FREQ		19200000
 
+/* NPL clock is expected */
+#define TX_MACRO_FLAG_HAS_NPL_CLOCK		BIT(0)
+
 enum {
 	TX_MACRO_AIF_INVALID = 0,
 	TX_MACRO_AIF1_CAP,
@@ -1915,7 +1918,10 @@ static int tx_macro_register_mclk_output(struct tx_macro *tx)
 	struct clk_init_data init;
 	int ret;
 
-	parent_clk_name = __clk_get_name(tx->npl);
+	if (tx->npl)
+		parent_clk_name = __clk_get_name(tx->npl);
+	else
+		parent_clk_name = __clk_get_name(tx->mclk);
 
 	init.name = clk_name;
 	init.ops = &swclk_gate_ops;
@@ -1946,10 +1952,13 @@ static int tx_macro_probe(struct platform_device *pdev)
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
@@ -1966,9 +1975,11 @@ static int tx_macro_probe(struct platform_device *pdev)
 	if (IS_ERR(tx->mclk))
 		return PTR_ERR(tx->mclk);
 
-	tx->npl = devm_clk_get(dev, "npl");
-	if (IS_ERR(tx->npl))
-		return PTR_ERR(tx->npl);
+	if (flags & TX_MACRO_FLAG_HAS_NPL_CLOCK) {
+		tx->npl = devm_clk_get(dev, "npl");
+		if (IS_ERR(tx->npl))
+			return PTR_ERR(tx->npl);
+	}
 
 	tx->fsgen = devm_clk_get(dev, "fsgen");
 	if (IS_ERR(tx->fsgen))
@@ -2145,10 +2156,21 @@ static const struct dev_pm_ops tx_macro_pm_ops = {
 };
 
 static const struct of_device_id tx_macro_dt_match[] = {
-	{ .compatible = "qcom,sc7280-lpass-tx-macro" },
-	{ .compatible = "qcom,sm8250-lpass-tx-macro" },
-	{ .compatible = "qcom,sm8450-lpass-tx-macro" },
-	{ .compatible = "qcom,sc8280xp-lpass-tx-macro" },
+	{
+		.compatible = "qcom,sc7280-lpass-tx-macro",
+		.data = (void *)TX_MACRO_FLAG_HAS_NPL_CLOCK,
+	}, {
+		.compatible = "qcom,sm8250-lpass-tx-macro",
+		.data = (void *)TX_MACRO_FLAG_HAS_NPL_CLOCK,
+	}, {
+		.compatible = "qcom,sm8450-lpass-tx-macro",
+		.data = (void *)TX_MACRO_FLAG_HAS_NPL_CLOCK,
+	}, {
+		.compatible = "qcom,sm8550-lpass-tx-macro",
+	}, {
+		.compatible = "qcom,sc8280xp-lpass-tx-macro",
+		.data = (void *)TX_MACRO_FLAG_HAS_NPL_CLOCK,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, tx_macro_dt_match);
-- 
2.34.1

