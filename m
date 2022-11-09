Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C408362304B
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Nov 2022 17:38:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60A2383A;
	Wed,  9 Nov 2022 17:38:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60A2383A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668011936;
	bh=e+ex77Os18LuOn3+BMizU3fDvC1lVflx4D8LoQLyfPw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aZlf0qawn4IWdIk0Kg61ct5MTIcLMwIvVdgOu90k4OsEn/kcwhvS4lur9SQbTf1Dz
	 iFi4sxNHsdLwUD56LluaXvIsg/hi+T3BKMGuhMuTOvPZg0zJDlaAyIUTDhEYo3fUMF
	 qoTSE1eZ9Vf9MAi1X7SMECZus3j5TX0Q0VbxI3B0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0E64F80166;
	Wed,  9 Nov 2022 17:38:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DDC1F80217; Wed,  9 Nov 2022 17:37:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3067BF800EC
 for <alsa-devel@alsa-project.org>; Wed,  9 Nov 2022 17:37:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3067BF800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="c8cubEf6"
Received: by mail-lj1-x236.google.com with SMTP id l8so26464846ljh.13
 for <alsa-devel@alsa-project.org>; Wed, 09 Nov 2022 08:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=igRKNWyl8eDcyN8ADQ2CerDEG1C252RVqSCCLSg5/ao=;
 b=c8cubEf64QS6Q+U7fjrB+sIgZfWpFGaA+TPPDL5rMINY4WnVsrYg+9VxrJGUnDXAj4
 rbypuF9VW/blvVOH6DlIlBmSa9Rwnll/hVweaPQAt47UdGom8Mpn8X/W36GkafxS0OYJ
 uTMVTwDlWWmZnefNk8kkYKgcNSmsp229Fxfdcb0vJqTH7Js/rnR5sYK8bonAf+0o4Uhl
 YCH72dy/hTASWhV1oFZWe7iX6wgdm/EEOJkRDmK9pbzLGGfsHn52tEOXoMl9ukQjWCP7
 aZFGOX7aErHbMVFB7mea/c15hZt3IR3WaicKMIUMbuVjsouDXd++DKA8b7VObhnfIPIE
 GJng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=igRKNWyl8eDcyN8ADQ2CerDEG1C252RVqSCCLSg5/ao=;
 b=Io+H4dXKNJVhMQQ57IznKGSi0SWI0e11BolcUFMf8iUVtMMo+vkJ8rekg2Cfp7+llD
 I4lewiUFFAKNMXUTL7qZBLXzcG7I1gxOtjL42peHA3SzVhdjTJwqGWaPVaHjLie5zW0X
 CDIwlfzUpm0iEaIladx/Ga2Yafa99AeH3ihVHLd6opqwWLHIJOghWRZUtIgyuegDzBRW
 qyQAW+HB7JYjawxRwMxIGfY4cDqdx7kOl0QZ4R5kVkpIyHDk09TAH3bBAzvie4cWEl1t
 JKiwm/86bXL6K+2/Fo51NOm44y0Brv6hglZbyYOnTURIUmXPDFSnIxn29I6u5nX6g6ie
 mToA==
X-Gm-Message-State: ACrzQf0ekFFA7zKAg+V6QFdNGfr+6f0ScxsIyVtNkiTzX1U5z4ALOfZt
 U56gzIDItETv8wzXhmLz8xjPLw==
X-Google-Smtp-Source: AMsMyM5nTgoZ2joUXWj6vhYWVGTA6I/LsWqnQ2kSEQTKAr2tKLCopqfnlSgbt4Ji+5RZx9Eyw6R4rw==
X-Received: by 2002:a05:651c:12c8:b0:277:75bb:429f with SMTP id
 8-20020a05651c12c800b0027775bb429fmr6576554lje.387.1668011869798; 
 Wed, 09 Nov 2022 08:37:49 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a2e8041000000b00277129b4a10sm2222091ljg.86.2022.11.09.08.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 08:37:49 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: codecs: wsa883x: Use proper shutdown GPIO values
Date: Wed,  9 Nov 2022 17:37:40 +0100
Message-Id: <20221109163740.1158785-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

The shutdown GPIO is active_low (sd_n), but this depends on actual board
layout.  Linux drivers should only care about logical state, where high
(1) means shutdown and low (0) means do not shutdown.

Invert the GPIO to match logical value.

Fixes: 43b8c7dc85a1 ("ASoC: codecs: add wsa883x amplifier support")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wsa883x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index c7b10bbfba7e..77a7dd3cf495 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -1392,7 +1392,7 @@ static int wsa883x_probe(struct sdw_slave *pdev,
 	}
 
 	wsa883x->sd_n = devm_gpiod_get_optional(&pdev->dev, "powerdown",
-						GPIOD_FLAGS_BIT_NONEXCLUSIVE);
+						GPIOD_FLAGS_BIT_NONEXCLUSIVE | GPIOD_OUT_HIGH);
 	if (IS_ERR(wsa883x->sd_n)) {
 		dev_err(&pdev->dev, "Shutdown Control GPIO not found\n");
 		ret = PTR_ERR(wsa883x->sd_n);
@@ -1411,7 +1411,7 @@ static int wsa883x_probe(struct sdw_slave *pdev,
 	pdev->prop.simple_clk_stop_capable = true;
 	pdev->prop.sink_dpn_prop = wsa_sink_dpn_prop;
 	pdev->prop.scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
-	gpiod_direction_output(wsa883x->sd_n, 1);
+	gpiod_direction_output(wsa883x->sd_n, 0);
 
 	wsa883x->regmap = devm_regmap_init_sdw(pdev, &wsa883x_regmap_config);
 	if (IS_ERR(wsa883x->regmap)) {
-- 
2.34.1

