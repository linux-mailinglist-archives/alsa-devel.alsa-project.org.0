Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D94C6B70BA
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Mar 2023 08:59:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C4041486;
	Mon, 13 Mar 2023 08:59:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C4041486
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678694392;
	bh=lns+CGv/3yOeiWvM3oUmkokljAT5JAPOQE7oxItAxz0=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OjpcC+i41sDCmRgrPrA4gPa0CVBREJ/Lex2dDgtBOu5xtVS3u1N66x/4Veb9X/hHT
	 3sZP5EWP/7okGgfvgl+SekFTaiR1g2ngwQR9LgSZgi93clGsGT+0CgAb455q8djkUE
	 4pmTVpB5g4z8Xnu2yBruQtJrtXBe6yG8qiFps9No=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 39A89F8055A;
	Mon, 13 Mar 2023 08:57:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91158F80425; Mon, 13 Mar 2023 08:55:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 16E79F8051B
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 08:55:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16E79F8051B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=FOhQOPd5
Received: by mail-ed1-x52a.google.com with SMTP id h8so1149949ede.8
        for <alsa-devel@alsa-project.org>;
 Mon, 13 Mar 2023 00:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678694100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quQo6pOhl6y8TGUcX12fIubQW+W2OiQtrC5VDkiwRuk=;
        b=FOhQOPd5JL9G9LS9ORK5Tji01kJl5AJ98t96Ikcs9U/qDgDFeFkfqxrIzDQsO05JxD
         y3WIcezf3tcFpujDCymKjzdHTabONYch5BPxnUfO7I8gFbAZTkUnJ9umO6flB7RF7Eu3
         UA4pXvDc6YXRfw9XQpYdKu8cJYvza1zsppgxR2wwX6p+CjiQrMQV+z+To24UR+SiujKA
         MLGBGAYgFwLi39jGNxnv//5KN5zzQgw8ZaBTZJ9Ohm3RzVQlunGvv7LzC0x55DEywziY
         W4y5rsIkZLUaGBPPlkCoWicOfp6ovwqFO8113JI258DA8x7wYOnNQCU+Z+da+hchLoA+
         O42w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678694100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=quQo6pOhl6y8TGUcX12fIubQW+W2OiQtrC5VDkiwRuk=;
        b=GvqU7calOWiry2Njw9RZzUS9uC6OROLHroFWIhNJSijwUqixFZT8Yw/6gRtn4sC+68
         Yf9IbzgbdQcIjG7S04vU/Kim6VCAchP8zjg53u4uhmaIxpiyZJwUbqWw2AGpmD7R9myP
         Y5dnGdLqzYl+aHlkHf41Mln/9N2xUl8S8bTaESUuGYt2BwSZEPpqA92ercrkLwuN97a/
         5eQhzP7y7yNsxUXzaYFfddUfkoBRVVhXdpQxw8wjctIPApOD8//BOKI545EqAv6y06fq
         R5IUnzLH40774DJhp2s6xYQCZzpQ1wIP9igUCfBthsvReMc/cZL/caQQ8b7uiBeH0t3B
         7pDA==
X-Gm-Message-State: AO0yUKV13Cye54qnDv6b+mBt4tknqZ44kTDx3YCZsfe5ln5nRXtiLz7H
	lSy2oR4a+TMHAgS7WOAQaa1WFQ==
X-Google-Smtp-Source: 
 AK7set/3PbFHdZy0ncdvyVkLVLkp6VS6VNXlpvP6aWjTg5xS1ztRZBKbr4EAVGSBtJBAdS22Zc6Ozw==
X-Received: by 2002:a17:907:6e03:b0:888:a72f:1599 with SMTP id
 sd3-20020a1709076e0300b00888a72f1599mr40929581ejc.11.1678694100270;
        Mon, 13 Mar 2023 00:55:00 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:f052:f15:3f90:fcb3])
        by smtp.gmail.com with ESMTPSA id
 g7-20020a1709061c8700b008b980c3e013sm3146943ejh.179.2023.03.13.00.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 00:54:59 -0700 (PDT)
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
Subject: [PATCH v2 9/9] ASoC: codecs: lpass-wsa-macro: add support for SM8550
Date: Mon, 13 Mar 2023 08:54:45 +0100
Message-Id: <20230313075445.17160-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230313075445.17160-1-krzysztof.kozlowski@linaro.org>
References: <20230313075445.17160-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HUK2KN3CSRIVADARBYBBGJMJIBLXAHB6
X-Message-ID-Hash: HUK2KN3CSRIVADARBYBBGJMJIBLXAHB6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HUK2KN3CSRIVADARBYBBGJMJIBLXAHB6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add support for the WSA macro codec on Qualcomm SM8550.  SM8550 does not
use NPL clock, thus add flags allowing to skip it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

---

Changes since v1:
1. Move the flag define to common header
---
 sound/soc/codecs/lpass-wsa-macro.c | 37 +++++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index ba7480f3831e..881b3154cc69 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -14,6 +14,8 @@
 #include <linux/pm_runtime.h>
 #include <linux/of_platform.h>
 #include <sound/tlv.h>
+
+#include "lpass-macro-common.h"
 #include "lpass-wsa-macro.h"
 
 #define CDC_WSA_CLK_RST_CTRL_MCLK_CONTROL	(0x0000)
@@ -2346,7 +2348,10 @@ static int wsa_macro_register_mclk_output(struct wsa_macro *wsa)
 	struct clk_init_data init;
 	int ret;
 
-	parent_clk_name = __clk_get_name(wsa->npl);
+	if (wsa->npl)
+		parent_clk_name = __clk_get_name(wsa->npl);
+	else
+		parent_clk_name = __clk_get_name(wsa->mclk);
 
 	init.name = "mclk";
 	of_property_read_string(dev_of_node(dev), "clock-output-names",
@@ -2379,9 +2384,12 @@ static int wsa_macro_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct wsa_macro *wsa;
+	kernel_ulong_t flags;
 	void __iomem *base;
 	int ret;
 
+	flags = (kernel_ulong_t)device_get_match_data(dev);
+
 	wsa = devm_kzalloc(dev, sizeof(*wsa), GFP_KERNEL);
 	if (!wsa)
 		return -ENOMEM;
@@ -2398,9 +2406,11 @@ static int wsa_macro_probe(struct platform_device *pdev)
 	if (IS_ERR(wsa->mclk))
 		return PTR_ERR(wsa->mclk);
 
-	wsa->npl = devm_clk_get(dev, "npl");
-	if (IS_ERR(wsa->npl))
-		return PTR_ERR(wsa->npl);
+	if (flags & LPASS_MACRO_FLAG_HAS_NPL_CLOCK) {
+		wsa->npl = devm_clk_get(dev, "npl");
+		if (IS_ERR(wsa->npl))
+			return PTR_ERR(wsa->npl);
+	}
 
 	wsa->fsgen = devm_clk_get(dev, "fsgen");
 	if (IS_ERR(wsa->fsgen))
@@ -2553,10 +2563,21 @@ static const struct dev_pm_ops wsa_macro_pm_ops = {
 };
 
 static const struct of_device_id wsa_macro_dt_match[] = {
-	{.compatible = "qcom,sc7280-lpass-wsa-macro"},
-	{.compatible = "qcom,sm8250-lpass-wsa-macro"},
-	{.compatible = "qcom,sm8450-lpass-wsa-macro"},
-	{.compatible = "qcom,sc8280xp-lpass-wsa-macro" },
+	{
+		.compatible = "qcom,sc7280-lpass-wsa-macro",
+		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
+	}, {
+		.compatible = "qcom,sm8250-lpass-wsa-macro",
+		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
+	}, {
+		.compatible = "qcom,sm8450-lpass-wsa-macro",
+		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
+	}, {
+		.compatible = "qcom,sm8550-lpass-wsa-macro",
+	}, {
+		.compatible = "qcom,sc8280xp-lpass-wsa-macro",
+		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, wsa_macro_dt_match);
-- 
2.34.1

