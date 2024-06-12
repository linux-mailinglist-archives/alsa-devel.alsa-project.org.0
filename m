Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A219905851
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 18:17:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B49EDF8;
	Wed, 12 Jun 2024 18:16:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B49EDF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718209019;
	bh=+6N7gMq4jHzelVlw8umcPCRfVgXICvRLvIVfctyIHUQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OB8GbU4uXh6KFuwe/zz9zWxMro3wlwd17s68QA32MHeRLON2lRBJOWFTO0aJoUZWD
	 fUKLqHL6nIS1IFRs0s/WFhW9FTyZvxjX+Gh+3kR6qFnsG8XPX05ck9PpGW27NicWWi
	 IQdMX/K5s2VaqU8VjTqGeUBGxL4sGnsJZQ6uMK/g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2307F80615; Wed, 12 Jun 2024 18:16:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D584AF8060D;
	Wed, 12 Jun 2024 18:15:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CBACF80579; Wed, 12 Jun 2024 18:15:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DB7EDF80580
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 18:15:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB7EDF80580
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=GzAx6Ky+
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-57c6011d75dso2940563a12.3
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jun 2024 09:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718208947; x=1718813747;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UbUB+HoAqq7FbsjH4xIB6iwTWnEv+liGNHJk9xgO0cg=;
        b=GzAx6Ky+bd4+YcWtAJPdmRIhdP1JuY6+H9j8BoWkNq2zR+V4q2X4BfT+o75QmlDsXR
         PWf5+NJ29cUBs3RFwrPeXLmOJJoQo8NmwmhWusdsivmvAOvQCybhdJTtrDct0yceJUou
         fTLP7XxeXAHwMa1Zd0TIbhEG1dDJX5qEdGAqYw4RbbkFZj53Bxzv7vABVAKbGGD3HoOI
         bv2qXLl+AnZ0VoDhJgXO+/ln/lMtHX94Crjck2sOQ2WNMgdXEGVnG2ljxBaq4eQHkJOY
         zWLkOdovgrphDD+UnyuySZShD7iXiHWRGKsMZibogZMNXF3fQUTIW/dR5o/4QqR3RV0Q
         4mdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718208947; x=1718813747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UbUB+HoAqq7FbsjH4xIB6iwTWnEv+liGNHJk9xgO0cg=;
        b=rOsQILJC9STZPWYjuZ4JpzWmOdoQJ8aygrs5XHso8zNlBaq17Cvs79km9ZYsYWjcDZ
         fh4dNaKzbhfqXKLBv8oYYdF0wbgdpT7JLqIs8BBUtVyPE2BxgVcx2wLHOTPf4teiMAA0
         NDGb+MmBAHkbZlBn2F6nty1ctAUgKDI6qiLPYlZ2fXF66ESye635UpotyjKgymYOji0I
         lboN9Vjm7G3kmkvNG3JOBGNMuWS1w8CFWLiGQd+zmB3EPsI2ps+NqKVpEpzW+TRpSOYs
         w/mnAocBnyXTBu5uXxYcxGX8HELRUZYGebjFZdsY+NbwVSMK45ad4GazAi9/FCgbrrSN
         lzgA==
X-Gm-Message-State: AOJu0YzdM9B/RTLzG+0SaCgnyAUGREjvYg6rVX9BwBBya1L24KRPXPFT
	nVAXeAhGrSR0096zaOdNqt8t6BdifsUeQEhBN1qZWnFDVwgT/AulTlQKzlxdKDM=
X-Google-Smtp-Source: 
 AGHT+IG0yCZZBR115YOLcbqPgpzpGDnmFUZQ7t8V3T3cBvW0NmL6cdA4+NAFWt7VmyHk43Bf5ICYxA==
X-Received: by 2002:a17:907:38c:b0:a6f:15f5:261e with SMTP id
 a640c23a62f3a-a6f47c9b5fbmr151234666b.7.1718208947613;
        Wed, 12 Jun 2024 09:15:47 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6efd6cfb74sm624815866b.20.2024.06.12.09.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 09:15:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Jun 2024 18:15:17 +0200
Subject: [PATCH 04/23] ASoC: codecs: wcd9335: Handle nicer probe deferral
 and simplify with dev_err_probe()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-asoc-wcd9xxx-wide-cleanups-v1-4-0d15885b2a06@linaro.org>
References: <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
In-Reply-To: 
 <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2279;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=+6N7gMq4jHzelVlw8umcPCRfVgXICvRLvIVfctyIHUQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmacma7eeNDLLN0oFnHMu4KHxXU88PgA6aoK/iC
 kzfL/NTn/qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmnJmgAKCRDBN2bmhouD
 12oDEACbOfb0Sh+eYacsC3jNLnc/sjhcEJmmabc7LSV2WeyBsOpmWU2H+R1hzWoehPhT/C56MFZ
 E6eECee+tk5B07aSBZ3m7AmmjXcpplP7fmG25JGiRKnSZAAscVYTDv9Nn6r3b6WBkmu1y3fK446
 FZEcVG/vIThP6TFX4KnxO/zq4iM7AtzCEqWqPYqIWOfVvTKOG2oQRGV83sqAgsg7PT7Rlq06R/q
 H5UztTT74rl09nhTYlgdXvPrcLpyUeqog56haAg6sRXSffwo9YvkusGOS1tn8gHvQLD9limLpk9
 5VR/iN9CwtSDf5jItZUPYSAEmaD1qiUZNPXehwHZMoLRLbSB8wJCXU2AZJ71TkU/SgyeGGREIKY
 f/cfNQWiPJWRjIs1gIjCi+BgoX5PUn7vsvnxrf5rmN0PdvVWimILgdX2Q2/BO9CsC0wHU7LZkI4
 uvP/eIv1wytwf0EczGdvUXWoPUZb4fkH+GYLtJlb67p4VNeAP0APnLDAvaL1pMH34nLr9dXppOU
 DSnh/hZDOVU8J5pblyOyJeuOP6dMS0ypPhLWjh52wLLr1JBKPD5p+B4tQsAArE6vvUCdFwAlrdv
 FFo+J0hi8cwmycN0F5sp8ATkRQVH84qpupHF8PxAJbm8tzuUVN20GFd/ibngZBqQ42zxLyZj1Ag
 p83UAfr91YoTpyw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: YIB5VX6HG6HNXIVYLKAR5HWZHXMZ5T6L
X-Message-ID-Hash: YIB5VX6HG6HNXIVYLKAR5HWZHXMZ5T6L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YIB5VX6HG6HNXIVYLKAR5HWZHXMZ5T6L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

wcd9335_parse_dt() function is called only from probe(), so printing
errors on resource acquisition is discouraged, because it can pollute
dmesg.  Use dev_err_probe() to fix this and also make the code a bit
simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd9335.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index c5ac2d46e556..334c5241617f 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -5031,22 +5031,16 @@ static int wcd9335_parse_dt(struct wcd9335_codec *wcd)
 	int ret;
 
 	wcd->reset_gpio = of_get_named_gpio(np,	"reset-gpios", 0);
-	if (wcd->reset_gpio < 0) {
-		dev_err(dev, "Reset GPIO missing from DT\n");
-		return wcd->reset_gpio;
-	}
+	if (wcd->reset_gpio < 0)
+		return dev_err_probe(dev, wcd->reset_gpio, "Reset GPIO missing from DT\n");
 
 	wcd->mclk = devm_clk_get(dev, "mclk");
-	if (IS_ERR(wcd->mclk)) {
-		dev_err(dev, "mclk not found\n");
-		return PTR_ERR(wcd->mclk);
-	}
+	if (IS_ERR(wcd->mclk))
+		return dev_err_probe(dev, PTR_ERR(wcd->mclk), "mclk not found\n");
 
 	wcd->native_clk = devm_clk_get(dev, "slimbus");
-	if (IS_ERR(wcd->native_clk)) {
-		dev_err(dev, "slimbus clock not found\n");
-		return PTR_ERR(wcd->native_clk);
-	}
+	if (IS_ERR(wcd->native_clk))
+		return dev_err_probe(dev, PTR_ERR(wcd->native_clk), "slimbus clock not found\n");
 
 	wcd->supplies[0].supply = "vdd-buck";
 	wcd->supplies[1].supply = "vdd-buck-sido";
@@ -5055,10 +5049,8 @@ static int wcd9335_parse_dt(struct wcd9335_codec *wcd)
 	wcd->supplies[4].supply = "vdd-io";
 
 	ret = regulator_bulk_get(dev, WCD9335_MAX_SUPPLY, wcd->supplies);
-	if (ret) {
-		dev_err(dev, "Failed to get supplies: err = %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get supplies\n");
 
 	return 0;
 }
@@ -5157,10 +5149,8 @@ static int wcd9335_slim_probe(struct slim_device *slim)
 
 	wcd->dev = dev;
 	ret = wcd9335_parse_dt(wcd);
-	if (ret) {
-		dev_err(dev, "Error parsing DT: %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	ret = wcd9335_power_on_reset(wcd);
 	if (ret)

-- 
2.43.0

