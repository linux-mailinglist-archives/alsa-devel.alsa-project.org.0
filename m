Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C13623050
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Nov 2022 17:39:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E93B0839;
	Wed,  9 Nov 2022 17:38:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E93B0839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668011988;
	bh=sMRZFr9VmJMZZPzv2MhTz8iCz1tcXOK8nrx3qAPfl6g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xi+nsEj5l7MfwLFbaV/80FVLx3oOxycRcDbPBdXP1gTNeVf31wFq1hoP/ODR3L51C
	 tEEbfZIRGH7OaeuON2zoAK9SZdNl1N/wMioQWITF8VtLLtvN0Ri/SxtRkxvvFXglKx
	 XDVGi77qtNRyOCx52aeD7UmfW+TiJ9DNAFzIqQiQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AADDF80557;
	Wed,  9 Nov 2022 17:38:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C624F804FB; Wed,  9 Nov 2022 17:38:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8CD16F80121
 for <alsa-devel@alsa-project.org>; Wed,  9 Nov 2022 17:38:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CD16F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="KUe0/9ra"
Received: by mail-lj1-x234.google.com with SMTP id h12so26447003ljg.9
 for <alsa-devel@alsa-project.org>; Wed, 09 Nov 2022 08:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M7C2hHnfI1uYNjIWJLHD9FrtHQvprfeg/2R452u0Yvw=;
 b=KUe0/9raCDsxcD15jNaoHEKQGY1/z3OYfBstsqbbVT0/dTZxxlTFOP7vThUbFzgweK
 wKugzPaXOIsI8vcmjF78XPW8V1wzRqrh5vsdKK4h6RyMV03ReqPKUrnU6l2xZNv7PnW+
 z60fruvLAa+BQWl199mTBWEmipiZ/6Vj1L3VuvC9mFuZUzABF5Ssvu5nianwySzBUx49
 Us5PwbT86nEgP//Oq8Qo+Omv9uK8ys0RVQeEuKVU9/In3rfFRhz2cvHl0dAup9ChQl6k
 JhrIx/DpNSts9N+FanVuzj5AMI2K/pAOFZK6z/rbR0bemlDVlF5FuPMNGJ5VEceZ/XiD
 vCGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M7C2hHnfI1uYNjIWJLHD9FrtHQvprfeg/2R452u0Yvw=;
 b=YX73a+utY1v4V3IYQn5naZ3dv1Fa7qMTfAVYd6H3XPCRy5xJ3VZluiLiJmYQ9oWJJ7
 6EzQr+y97njfuRhNvKnBDkPxA736Z/W+3hW+tsFX6H0owOtUQwzyUCKCv33DHRAUDwPe
 yf15OdC9SSrOcDj0j8IW7/3F0sjCXD5q2HY6JdD76qYmqG15nO7c1I706YW/u6tXJute
 PtYwVTPRpAy4hSrXwKdnYupK+wETRK5bWJBLMT95CynZUgMs4PEsZJD1nuIbiyv0Ol3T
 0QrdsmhIiCdh3l414Qp0vWBow2RXGF5d7fLHFi7Varf2bejDAkNeAxerpfUBfCjP9IE7
 PRsA==
X-Gm-Message-State: ACrzQf3JixfX6/8OWyCZOohPwmXt4xC7BjA+wFJs0QBVg1XdBwwSxugN
 odP7LDH8NjA0z12WcGXqFd0/yg==
X-Google-Smtp-Source: AMsMyM6FrG459irhWWgn/mdmV+tHUH+ng59iK8pFUv1yvdPiS8GI/H82o+kBVrPB7FU5hsLAxaBwGQ==
X-Received: by 2002:a2e:b626:0:b0:26e:6fb:4845 with SMTP id
 s6-20020a2eb626000000b0026e06fb4845mr7796442ljn.120.1668011884830; 
 Wed, 09 Nov 2022 08:38:04 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
 by smtp.gmail.com with ESMTPSA id
 c15-20020a056512074f00b0049476667228sm2309168lfs.65.2022.11.09.08.38.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 08:38:03 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: codecs: wsa883x: Simplify with dev_err_probe
Date: Wed,  9 Nov 2022 17:37:59 +0100
Message-Id: <20221109163759.1158837-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221109163759.1158837-1-krzysztof.kozlowski@linaro.org>
References: <20221109163759.1158837-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

Code can be a bit simpler with dev_err_probe().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wsa883x.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index 4ad8b875eb8f..85a2d928db13 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -1380,22 +1380,19 @@ static int wsa883x_probe(struct sdw_slave *pdev,
 		return -ENOMEM;
 
 	wsa883x->vdd = devm_regulator_get(dev, "vdd");
-	if (IS_ERR(wsa883x->vdd)) {
-		dev_err(dev, "No vdd regulator found\n");
-		return PTR_ERR(wsa883x->vdd);
-	}
+	if (IS_ERR(wsa883x->vdd))
+		return dev_err_probe(dev, PTR_ERR(wsa883x->vdd),
+				     "No vdd regulator found\n");
 
 	ret = regulator_enable(wsa883x->vdd);
-	if (ret) {
-		dev_err(dev, "Failed to enable vdd regulator (%d)\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable vdd regulator\n");
 
 	wsa883x->sd_n = devm_gpiod_get_optional(&pdev->dev, "powerdown",
 						GPIOD_FLAGS_BIT_NONEXCLUSIVE | GPIOD_OUT_HIGH);
 	if (IS_ERR(wsa883x->sd_n)) {
-		dev_err(&pdev->dev, "Shutdown Control GPIO not found\n");
-		ret = PTR_ERR(wsa883x->sd_n);
+		ret = dev_err_probe(&pdev->dev, PTR_ERR(wsa883x->sd_n),
+				    "Shutdown Control GPIO not found\n");
 		goto err;
 	}
 
@@ -1416,8 +1413,8 @@ static int wsa883x_probe(struct sdw_slave *pdev,
 	wsa883x->regmap = devm_regmap_init_sdw(pdev, &wsa883x_regmap_config);
 	if (IS_ERR(wsa883x->regmap)) {
 		gpiod_direction_output(wsa883x->sd_n, 1);
-		dev_err(&pdev->dev, "regmap_init failed\n");
-		ret = PTR_ERR(wsa883x->regmap);
+		ret = dev_err_probe(&pdev->dev, PTR_ERR(wsa883x->regmap),
+				    "regmap_init failed\n");
 		goto err;
 	}
 	pm_runtime_set_autosuspend_delay(dev, 3000);
-- 
2.34.1

