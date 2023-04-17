Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A106E4B24
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Apr 2023 16:16:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D35A5AE8;
	Mon, 17 Apr 2023 16:15:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D35A5AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681740959;
	bh=tYI9XY6ZSj8vDuP9ew3r8r85M7hkzrlK6IHH8D+MwSw=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=NkCnwnJPa0x3d4jvpomFHQstV5FTVbYOhxfGOO/3W0LFbCwR8fvzztGvwvbZcaUZv
	 cfdcB2ywlRiMD+RecW7Z4xfzRPq+FsgI3dlCtcVJxuunq5muibp8bf788Vwo7dEm2X
	 17oSnZ9QH0N6XLcZHWpUVxghz9xeA2fTu2YnMO1M=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1C3B7F80269;
	Mon, 17 Apr 2023 16:15:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47EE6F804F2; Mon, 17 Apr 2023 16:15:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1B333F80212
	for <alsa-devel@alsa-project.org>; Mon, 17 Apr 2023 16:14:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B333F80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=w/93HIzA
Received: by mail-ej1-x62e.google.com with SMTP id u3so12521450ejj.12
        for <alsa-devel@alsa-project.org>;
 Mon, 17 Apr 2023 07:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681740896; x=1684332896;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l8OjZCSSC//phSuWYvfawiHJ89Dsp2AaxdfcVlgHVfA=;
        b=w/93HIzAuP5t6l+IMz0tDo3YXGzXWUJfwpErdrbZ2jkDH3nOltQcKZOYn6MZ1Ylvl1
         YLolZ3KjnWSSIntWx1g4yDPgdjiqT6I2zzmCX5KJQaQXaq7L1KeNKa/3w2mWAegaasjt
         GWU8XrzdE0Pru49Zd1WhwPo+2oynrKKVG5jGGjYX7k30SB0aWL2mm0mc/6absdit0rpU
         BBAP1E3hWtowRNEii0j1CYtHHW29bvRE0778vJ/k0HYCuNJqW5M39iKouODl141uyHqW
         6pLzU7eyxgPEr7q/m3ltm80htp1o9qRxVwIM7gIQTCZ35T61WGr6juhm5kInRcEn1L7g
         Lr1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681740896; x=1684332896;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l8OjZCSSC//phSuWYvfawiHJ89Dsp2AaxdfcVlgHVfA=;
        b=hFDrFXK+e9QeCp3uSa7hF1k6j5fiapRDTt8HG30GKyz8Krqx7zUntIDDsADVOzOaDT
         4MhIejmXME6QY/Jg15vmWVeMqTupqDEYeNQJs+AIPwORS1Yhwf+3n11wf2ce+xxoSk1i
         imeEtmX7b8Ti+JuLoTPTkqovL5vIofFXuW5dEee8OvOsm7Z4PBT4xPG2nBgOGqmEwJfa
         5NC9XPUtud7m7FO1D8ikbe7iv9iLWOuItrD0DL030ozPmco2XlSAHjjBfoetTHimnx4x
         Iko0XicPy7evk3pNhxe28sBcSJYt6bT0R4BDo00OggN+oAR0SJuZjoBFuoji80MjPHrV
         rE3Q==
X-Gm-Message-State: AAQBX9cVe0V1CifHlYWC+h8kA3JVgVQu5oQiS1c7CZVPsLi8fW7ye5ot
	RHLfWcxU4iKjBCZbqkCli87usA==
X-Google-Smtp-Source: 
 AKy350a2bmRei9A0qs2pgDzWdwVvj/XCBSxX7OL18aPrP8Z+ZGBhJJ5K8guxgj+yHghapBSOeIWGQg==
X-Received: by 2002:a17:907:7e9c:b0:94f:335b:4da0 with SMTP id
 qb28-20020a1709077e9c00b0094f335b4da0mr6563124ejc.51.1681740895939;
        Mon, 17 Apr 2023 07:14:55 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:96aa:60eb:e021:6511])
        by smtp.gmail.com with ESMTPSA id
 q6-20020a056402040600b004f9e6495f94sm5832034edv.50.2023.04.17.07.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 07:14:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] ASoC: codecs: wcd9335: Simplify with dev_err_probe
Date: Mon, 17 Apr 2023 16:14:50 +0200
Message-Id: <20230417141453.919158-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OZFHZG7MPDUJNZNDU44VK3T2UDMOYP6H
X-Message-ID-Hash: OZFHZG7MPDUJNZNDU44VK3T2UDMOYP6H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OZFHZG7MPDUJNZNDU44VK3T2UDMOYP6H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Code can be a bit simpler with dev_err_probe().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd9335.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index d2548fdf9ae5..8bf3510a3ea3 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -5138,20 +5138,17 @@ static int wcd9335_irq_init(struct wcd9335_codec *wcd)
 	 * INTR2 is a subset of first interrupt sources MAD, VBAT, and SVA
 	 */
 	wcd->intr1 = of_irq_get_byname(wcd->dev->of_node, "intr1");
-	if (wcd->intr1 < 0) {
-		if (wcd->intr1 != -EPROBE_DEFER)
-			dev_err(wcd->dev, "Unable to configure IRQ\n");
-
-		return wcd->intr1;
-	}
+	if (wcd->intr1 < 0)
+		return dev_err_probe(wcd->dev, wcd->intr1,
+				     "Unable to configure IRQ\n");
 
 	ret = devm_regmap_add_irq_chip(wcd->dev, wcd->regmap, wcd->intr1,
 				 IRQF_TRIGGER_HIGH, 0,
 				 &wcd9335_regmap_irq1_chip, &wcd->irq_data);
 	if (ret)
-		dev_err(wcd->dev, "Failed to register IRQ chip: %d\n", ret);
+		return dev_err_probe(wcd->dev, ret, "Failed to register IRQ chip\n");
 
-	return ret;
+	return 0;
 }
 
 static int wcd9335_slim_probe(struct slim_device *slim)
@@ -5207,17 +5204,15 @@ static int wcd9335_slim_status(struct slim_device *sdev,
 	slim_get_logical_addr(wcd->slim_ifc_dev);
 
 	wcd->regmap = regmap_init_slimbus(sdev, &wcd9335_regmap_config);
-	if (IS_ERR(wcd->regmap)) {
-		dev_err(dev, "Failed to allocate slim register map\n");
-		return PTR_ERR(wcd->regmap);
-	}
+	if (IS_ERR(wcd->regmap))
+		return dev_err_probe(dev, PTR_ERR(wcd->regmap),
+				     "Failed to allocate slim register map\n");
 
 	wcd->if_regmap = regmap_init_slimbus(wcd->slim_ifc_dev,
 						  &wcd9335_ifc_regmap_config);
-	if (IS_ERR(wcd->if_regmap)) {
-		dev_err(dev, "Failed to allocate ifc register map\n");
-		return PTR_ERR(wcd->if_regmap);
-	}
+	if (IS_ERR(wcd->if_regmap))
+		return dev_err_probe(dev, PTR_ERR(wcd->if_regmap),
+				     "Failed to allocate ifc register map\n");
 
 	ret = wcd9335_bring_up(wcd);
 	if (ret) {
-- 
2.34.1

