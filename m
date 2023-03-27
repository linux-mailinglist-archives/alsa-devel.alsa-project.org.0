Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 975E06CA5B4
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 15:25:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8613B839;
	Mon, 27 Mar 2023 15:24:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8613B839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679923502;
	bh=5xNYzAzP4HSrM4G4a60lL5MIP4dsbp7xYPlbM1E6pxU=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=swbNxiC5t3EGh4K42bThKUUYSFIh0e4G9RcVf+46Jjdxb7pzEJiOOGRADiX/k01Dn
	 E169jSmeM91YUnKDige/VtS3Tw36ZNPciavtX1MdIhFtOHL2cqnQ/lBUtiOxokPwiH
	 rUdFFtQ3PwS0jWk13I8Vp1HXRELqvTUonbmjdmOM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 56E6DF80549;
	Mon, 27 Mar 2023 15:23:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5297F80551; Mon, 27 Mar 2023 15:23:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A1B7F80272
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 15:23:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A1B7F80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Y+QiFOvk
Received: by mail-ed1-x52d.google.com with SMTP id b20so36239459edd.1
        for <alsa-devel@alsa-project.org>;
 Mon, 27 Mar 2023 06:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679923393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KL1Hi3X0orGZTBrm+1PohiZFQrgy9knLwvGCmFqK1Xc=;
        b=Y+QiFOvkoqdFUWtBEhtuaG3ENcUwaPQw5O/C1BVM5MnukIWz3KPjKdTbde9AGcCGbr
         xs4Sai9ih6pqOrwrpRgv4dXEJ9OaUVAvD5PVdyak4uqjeAoEXNJuFu0RxKZA1UYsWA8h
         Ct8jjVagOr2e8iROSq3X1x0os3hoaAhMOYqO01D+/0X6EOaEJOY/g8ftG+//brU22kkZ
         DS5H0VlnhvyWpDRjtvYqipy+zk1NlexO7XOkNmOofhGeflF7v2ECsrnWmKktKGe9DI00
         zFiT5Jh0xjGOixgjwvyXc3ugZ8vqoPGsY1mOMiY+Sk+En+kFkR3PiV9wWWJYiHzL4Y1K
         V9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679923393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KL1Hi3X0orGZTBrm+1PohiZFQrgy9knLwvGCmFqK1Xc=;
        b=QHPWmOL065Jam9QtKn2wo/7CMTKMnvHx0m3mWOvgqaAnMggbZmg2NQh3A+nkthJnpw
         USIjSVQGtdfuj2pYNCPEKN75nPVxWV7iN2g88pWwqebY2zMxdKiT6JORrJhkv9yyEDW+
         Z3ZZzgh9oxDMSOHkh7KYzntRPKMpZO6VfkenW0eE8p5C8Q/rUl15mIzOivvEfrnuMe8N
         WYLbGgFr3V7mqN4rOIZXojIfKzIZcPYtCwWNxkOCiltOWvlsxeJkFuPHo/AtRw9Mpsd0
         jMgSabGUQdHbK9au3kJakXh3TVvsvxuqmk/VaYCfy4qDX8Ax3WxybKgov6OUy80t2Y5n
         WLZA==
X-Gm-Message-State: AAQBX9c4pBMxTw51Qg8nk6lbGFKR8n8Kr/XGHiQ3PiC/saHbUpgDA7Qx
	EPAb8BVkhKJQxue/3lTnHHlIiQ==
X-Google-Smtp-Source: 
 AKy350ZfC8HTAQDloW4dKgWmhG0qTpvb72a26hXxIRE6FS5bAyc7xOdoQoKtpuE6vQm9cU/MZw8NHg==
X-Received: by 2002:a17:906:6c91:b0:932:615c:33d4 with SMTP id
 s17-20020a1709066c9100b00932615c33d4mr12433354ejr.34.1679923393086;
        Mon, 27 Mar 2023 06:23:13 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:581e:789c:7616:5ee])
        by smtp.gmail.com with ESMTPSA id
 gy24-20020a170906f25800b00930445428acsm14286814ejb.14.2023.03.27.06.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 06:23:12 -0700 (PDT)
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
Subject: [PATCH v3 03/10] ASoC: codecs: lpass-rx-macro: add support for SM8550
Date: Mon, 27 Mar 2023 15:22:47 +0200
Message-Id: <20230327132254.147975-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230327132254.147975-1-krzysztof.kozlowski@linaro.org>
References: <20230327132254.147975-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BQ7U5LQ5FVL4ADMWVU47JAKWN3SS3L4E
X-Message-ID-Hash: BQ7U5LQ5FVL4ADMWVU47JAKWN3SS3L4E
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Patrick Lai <quic_plai@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BQ7U5LQ5FVL4ADMWVU47JAKWN3SS3L4E/>
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
index 372bea8b3525..685ca95ef4a9 100644
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
@@ -3653,10 +3661,22 @@ static void rx_macro_remove(struct platform_device *pdev)
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

