Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC2791D932
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 09:41:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AA5B22A9;
	Mon,  1 Jul 2024 09:41:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AA5B22A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719819680;
	bh=2LXhDj+OjHwm9PSo2QZCbe9HMxUgBLthEvA3G7WWahk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UBhmBrQpek+YDeJP9pJrTkN+qtMls8nNbaAnu7LAYDLEWn5B4hLxJMklI/r8cqwW4
	 KSynGtksjR5Xs0L5dSz8ArwTzx1KE8mwjY70/xsidg8ONDd/vuVnLFU9o0wS1nFx5n
	 JNlgEWwLym9Ncy0wmQU9Q4j76XbKYg9zu5gay/zo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD12AF8061A; Mon,  1 Jul 2024 09:40:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B730F8003A;
	Mon,  1 Jul 2024 09:40:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71513F805E8; Mon,  1 Jul 2024 09:40:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7FB05F8028B
	for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2024 09:39:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FB05F8028B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=FSZsGU/V
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ebe6495aedso27457081fa.0
        for <alsa-devel@alsa-project.org>;
 Mon, 01 Jul 2024 00:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719819589; x=1720424389;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S8ExwtvC8Rv0PryTWXbkCNqG0vwkQRpwqxJGJECfGVk=;
        b=FSZsGU/Vo7Xw5lvQLZz+6Vepy6RFkVbTydQHclPcmiJE+ewVdpAIJ/ePvzr28MfCPq
         /tfsOT04IphZYKG7beUfarrWgU0T9d6XlXPoHRgJY2PwDJ0ExBMGZ7M/CqupcJOYeC0w
         2lL2+1t4KRjPgUHptQ0K75MyK6+vadd5XGGom18WCgmIwfLAdh8Wk1PsSHk8CA62r/j9
         XBOkkXyVtVZ2xxvyFLkiFeFQFkY41xwZRlWDOyimlSIOdG/lKkh4tC1Qj2qBZgJC+T6+
         KLYO+mT7wMWLMzcXR1LhIK0rxR+LepNu2udADgGMFTmMw5R0u9k+yglhQJ5rbkqvN292
         VVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719819589; x=1720424389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S8ExwtvC8Rv0PryTWXbkCNqG0vwkQRpwqxJGJECfGVk=;
        b=KiMrkfSEBZwF+zQeyKYUr+/+dcSmanqFV1qbfsP11qPbn9/c6Hv1fOn/JN/VN1pnlY
         JgRy32jDLrMK+8WncvUpYSofyOImN5ZCg5yr5WS39Wp4ZZi/KNQ2TyqmxlNMK1RZWbWt
         RM5vEcPehiZrsKldTvTBhz/83vKzjTQXNUh7n/tykeD9KxMQw959gEoJ6jfES44OS8Ug
         lu71RgH3H+9expyLDG7UiKaSKJQ2JqVH9hHAs4vxobIPiJUa/Vu4Q2wvlbAfykgcXeqN
         xAC7Hs2Kgi6u2EHXLkvvv+GHrD3aMFNz4T0vWpVhVbTpPx2Q8DizMgD92H6u7Izpr7Ky
         9VBQ==
X-Gm-Message-State: AOJu0YygEGfvBbHmM8q8smj7lAOjXF0rf8sIv8crjwV+lQb7HuzgtTJl
	4nYurnXqxG0LtBPDkz+oRUz2vAQJe/Bu39kyIItNtzNSxTE3MhE3sCRX+5wcZVo=
X-Google-Smtp-Source: 
 AGHT+IHhZFMA0XT6XBDgJiHh2nMdh9If6ijL1sfRHPnrXsiQhUhG2w0sX4XVs3IUQY3q0KizhIYGUw==
X-Received: by 2002:a2e:99c2:0:b0:2ec:50fa:1e47 with SMTP id
 38308e7fff4ca-2ee5e392b79mr29326251fa.21.1719819588889;
        Mon, 01 Jul 2024 00:39:48 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a0fb9absm9279936f8f.80.2024.07.01.00.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 00:39:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 01 Jul 2024 09:39:34 +0200
Subject: [PATCH v3 2/6] ASoC: codecs: lpass-rx-macro: Simplify with
 cleanup.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240701-b4-qcom-audio-lpass-codec-cleanups-v3-2-6d98d4dd1ef5@linaro.org>
References: 
 <20240701-b4-qcom-audio-lpass-codec-cleanups-v3-0-6d98d4dd1ef5@linaro.org>
In-Reply-To: 
 <20240701-b4-qcom-audio-lpass-codec-cleanups-v3-0-6d98d4dd1ef5@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2459;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=2LXhDj+OjHwm9PSo2QZCbe9HMxUgBLthEvA3G7WWahk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmgl08N1puNYLwMumh8OH49VAat5Ny9jHNO2iyY
 57k6THtXieJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZoJdPAAKCRDBN2bmhouD
 1//JD/9zt7hVaxdfvsXkn2F2F19ihi9vDCarT30YkxGA3IVJvvjXPnaZT5C1Xt6V2F3XAMi2V+L
 yg8KOfBaAgQ10sskIqnXUwJIw5oRsIO60s7mBNjpwHE1O9zykThNWZNRY9zaGQWeJtb/wE53L3T
 ctOQ9SyRUdKF4zKtquDYRJF7mUht2nNuCmOMWFUbK8xRAYFm0hmgNFjmCULr8X1os/Yyytk282N
 81l5OF9q1Cx3KbeWKLrlsJawjiqh3xXxvg5bzBQYGhpfYYyTKkdcK1LyUVVF74NkdxlDepZWXd9
 6LDZkFPgtoFW7+F+SeedcrKjpZk8aj+6jhWuNRfKipqK5756AZb4zdeFHTdtcbkc26EzKdh7DSr
 NOfP2fhazYtTEc0d3Bn8JEDX6zfAGWV4C7YnNKoGHK4TB2tlcLBR5i4pBDEIliiDN+zALH0ChTn
 inZfFV39xUrYmiSauHUelqX/gVuFOA+/8fiOPfhnsmYmHjWUeENk0k5skw2hjNJoUtqJ3YRKmUl
 kCYtIaDPlxxgI6oy2VJkKgF9dFvGymPDM1NuuNLme0oGoGljeR9i11DDVTLv0+11xJpGRi74Kjs
 icJ8U5RNKmVh8h8LO13LDpkpXewQK9gBX4twCTvk+rq/2gI12JUX9mXFvXBjPIWZtiCUbmhfxR0
 ADa/jYSfZoHnAjw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: I43ZJSTQVDPFJJO5L6QDYKFWBJLMS2M5
X-Message-ID-Hash: I43ZJSTQVDPFJJO5L6QDYKFWBJLMS2M5
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I43ZJSTQVDPFJJO5L6QDYKFWBJLMS2M5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Allocate the default register values array with scoped/cleanup.h to
reduce number of error paths and make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not adding Dmitry's Rb tag, because of major change devm->cleanup.h.
---
 sound/soc/codecs/lpass-rx-macro.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 77e734ad1885..638f3995a364 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 // Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/io.h>
@@ -3764,7 +3765,6 @@ static const struct snd_soc_component_driver rx_macro_component_drv = {
 
 static int rx_macro_probe(struct platform_device *pdev)
 {
-	struct reg_default *reg_defaults;
 	struct device *dev = &pdev->dev;
 	kernel_ulong_t flags;
 	struct rx_macro *rx;
@@ -3812,6 +3812,8 @@ static int rx_macro_probe(struct platform_device *pdev)
 		return PTR_ERR(base);
 
 	rx->codec_version = lpass_macro_get_codec_version();
+	struct reg_default *reg_defaults __free(kfree) = NULL;
+
 	switch (rx->codec_version) {
 	case LPASS_CODEC_VERSION_1_0:
 	case LPASS_CODEC_VERSION_1_1:
@@ -3849,10 +3851,8 @@ static int rx_macro_probe(struct platform_device *pdev)
 	rx_regmap_config.num_reg_defaults = def_count;
 
 	rx->regmap = devm_regmap_init_mmio(dev, base, &rx_regmap_config);
-	if (IS_ERR(rx->regmap)) {
-		ret = PTR_ERR(rx->regmap);
-		goto err_ver;
-	}
+	if (IS_ERR(rx->regmap))
+		return PTR_ERR(rx->regmap);
 
 	dev_set_drvdata(dev, rx);
 
@@ -3864,7 +3864,7 @@ static int rx_macro_probe(struct platform_device *pdev)
 
 	ret = clk_prepare_enable(rx->macro);
 	if (ret)
-		goto err_ver;
+		return ret;
 
 	ret = clk_prepare_enable(rx->dcodec);
 	if (ret)
@@ -3910,7 +3910,6 @@ static int rx_macro_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_clkout;
 
-	kfree(reg_defaults);
 	return 0;
 
 err_clkout:
@@ -3923,8 +3922,6 @@ static int rx_macro_probe(struct platform_device *pdev)
 	clk_disable_unprepare(rx->dcodec);
 err_dcodec:
 	clk_disable_unprepare(rx->macro);
-err_ver:
-	kfree(reg_defaults);
 
 	return ret;
 }

-- 
2.43.0

