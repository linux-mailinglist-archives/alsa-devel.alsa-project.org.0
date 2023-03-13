Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE4C6B70A1
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Mar 2023 08:58:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A41D3148A;
	Mon, 13 Mar 2023 08:57:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A41D3148A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678694320;
	bh=fnCYn4T1N9zFxDJ6wfBal0HcWMrCNrQ29suy6/DgJWY=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VYCsDLsLbLhrr8K37fumTJ0ltnEBWAMRwQBzCYOPiF5TmlzCRFBM5jEXo7TSawWi/
	 bggQLPFlCVHgSef2zVrpy/LxOpiMuWHz+fos0px2VBOw4m6fQ/OK+odYKkS7BLDIMC
	 ZBx5pxi/lk5ySD/+Y8p1U8PBlwy9BUIKtdOZCY6c=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 176C6F804FE;
	Mon, 13 Mar 2023 08:57:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B226AF80527; Mon, 13 Mar 2023 08:55:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4BDC3F8032D
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 08:54:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BDC3F8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=cm6jvEBY
Received: by mail-ed1-x532.google.com with SMTP id da10so45014830edb.3
        for <alsa-devel@alsa-project.org>;
 Mon, 13 Mar 2023 00:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678694093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xYNVVvk5MYQJLcGCKlZ/3nxpCpW/KOAolH/I1VmRq1M=;
        b=cm6jvEBYoy8FtI9jVa4wcNUNcS0EPBarIeNL4EtUigouIMM/5ZX6a0HCtLQzmdjsi1
         GXHeXCdAWpy4ru2ygJchKm04DfdGPDOyPbo5cL7HRRp4VFvGod2wUzCWPjUBrM9nwdtc
         g15ylGyBV4EKeJ08kXKZOl0cmVsyS7B2OtXqbnVTBtgw0KKU6E4A/GpKsS5JwMHx0Dj8
         Tj3U/JbCfpCiWjDQ1CuwUSgDxMBI+OSIJNSTAA9eTDiNxjHn7ARrhZDLmasMjPjGqsSc
         19e+vdxj8Gdegq6zR9owK4F6o4WDYJ69+utN1B+fjPWJY5qNwQxAh+5oijkkRt6vVjt2
         FHNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678694093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xYNVVvk5MYQJLcGCKlZ/3nxpCpW/KOAolH/I1VmRq1M=;
        b=szeFtA8zhRnzYSlmdCf+LJqPaGAX0c6I1KOPf36D6P7xWNdks0Wt929DtTKP5GTQkj
         7yxLx2e9YqC1CuUx4XB773pWj5POKQl+rBub4qYuUKbfww6SEWWZFPVKWQj360Byj6xU
         oHUr8q3By6jxyvxfr3M6uEacq9cCeDlaVV2F0ukoI2MIT2AGuSdf0+26zUIQQoRovkfd
         WUYJyt0sFsWbAZoB0lw30+ArGB2Iydv0rEy/m2F/DVkQ0E05DrN/rpRMk52Vu21kokIv
         cn0XX6GMqKbQGQzKX0peUuI1L34jXScMAcg5N/CPDTsZXf/kwwktr2bE2y/H12RHHYDl
         aF6Q==
X-Gm-Message-State: AO0yUKXQ3n7JvVE7zwqRJBS2uA/SWhcVKBhrYGDrXbl3uKirjF8fvqI7
	WBYFWLUIc14KhRUA5GjRsPLRbw==
X-Google-Smtp-Source: 
 AK7set8WfbTprk60wBZoVW3YeYQ44X9CgRpqwgCIhPOgrcEMDxgqoFr+J4qy06w1tmvgru1NzTkkgA==
X-Received: by 2002:a17:907:1c07:b0:920:307a:21d9 with SMTP id
 nc7-20020a1709071c0700b00920307a21d9mr8348837ejc.15.1678694093310;
        Mon, 13 Mar 2023 00:54:53 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:f052:f15:3f90:fcb3])
        by smtp.gmail.com with ESMTPSA id
 g7-20020a1709061c8700b008b980c3e013sm3146943ejh.179.2023.03.13.00.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 00:54:53 -0700 (PDT)
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
Subject: [PATCH v2 3/9] ASoC: codecs: lpass-rx-macro: add support for SM8550
Date: Mon, 13 Mar 2023 08:54:39 +0100
Message-Id: <20230313075445.17160-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230313075445.17160-1-krzysztof.kozlowski@linaro.org>
References: <20230313075445.17160-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AEK2V2X4G6DX2MM3YPV67PVQL2ZZQPFP
X-Message-ID-Hash: AEK2V2X4G6DX2MM3YPV67PVQL2ZZQPFP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AEK2V2X4G6DX2MM3YPV67PVQL2ZZQPFP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add support for the RX macro codec on Qualcomm SM8550.  SM8550 does not
use NPL clock, thus add flags allowing to skip it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

---

Changes since v1:
1. Move the flag define to common header
---
 sound/soc/codecs/lpass-macro-common.h |  3 +++
 sound/soc/codecs/lpass-rx-macro.c     | 36 +++++++++++++++++++++------
 2 files changed, 31 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
index f2cbf9fe2c6e..4eb886565ea3 100644
--- a/sound/soc/codecs/lpass-macro-common.h
+++ b/sound/soc/codecs/lpass-macro-common.h
@@ -6,6 +6,9 @@
 #ifndef __LPASS_MACRO_COMMON_H__
 #define __LPASS_MACRO_COMMON_H__
 
+/* NPL clock is expected */
+#define LPASS_MACRO_FLAG_HAS_NPL_CLOCK		BIT(0)
+
 struct lpass_macro {
 	struct device *macro_pd;
 	struct device *dcodec_pd;
diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index a73a7d7a1c0a..8519794e36fb 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3491,7 +3491,10 @@ static int rx_macro_register_mclk_output(struct rx_macro *rx)
 	struct clk_init_data init;
 	int ret;
 
-	parent_clk_name = __clk_get_name(rx->npl);
+	if (rx->npl)
+		parent_clk_name = __clk_get_name(rx->npl);
+	else
+		parent_clk_name = __clk_get_name(rx->mclk);
 
 	init.name = clk_name;
 	init.ops = &swclk_gate_ops;
@@ -3521,10 +3524,13 @@ static const struct snd_soc_component_driver rx_macro_component_drv = {
 static int rx_macro_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	kernel_ulong_t flags;
 	struct rx_macro *rx;
 	void __iomem *base;
 	int ret;
 
+	flags = (kernel_ulong_t)device_get_match_data(dev);
+
 	rx = devm_kzalloc(dev, sizeof(*rx), GFP_KERNEL);
 	if (!rx)
 		return -ENOMEM;
@@ -3541,9 +3547,11 @@ static int rx_macro_probe(struct platform_device *pdev)
 	if (IS_ERR(rx->mclk))
 		return PTR_ERR(rx->mclk);
 
-	rx->npl = devm_clk_get(dev, "npl");
-	if (IS_ERR(rx->npl))
-		return PTR_ERR(rx->npl);
+	if (flags & LPASS_MACRO_FLAG_HAS_NPL_CLOCK) {
+		rx->npl = devm_clk_get(dev, "npl");
+		if (IS_ERR(rx->npl))
+			return PTR_ERR(rx->npl);
+	}
 
 	rx->fsgen = devm_clk_get(dev, "fsgen");
 	if (IS_ERR(rx->fsgen))
@@ -3655,10 +3663,22 @@ static int rx_macro_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id rx_macro_dt_match[] = {
-	{ .compatible = "qcom,sc7280-lpass-rx-macro" },
-	{ .compatible = "qcom,sm8250-lpass-rx-macro" },
-	{ .compatible = "qcom,sm8450-lpass-rx-macro" },
-	{ .compatible = "qcom,sc8280xp-lpass-rx-macro" },
+	{
+		.compatible = "qcom,sc7280-lpass-rx-macro",
+		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
+
+	}, {
+		.compatible = "qcom,sm8250-lpass-rx-macro",
+		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
+	}, {
+		.compatible = "qcom,sm8450-lpass-rx-macro",
+		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
+	}, {
+		.compatible = "qcom,sm8550-lpass-rx-macro",
+	}, {
+		.compatible = "qcom,sc8280xp-lpass-rx-macro",
+		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, rx_macro_dt_match);
-- 
2.34.1

