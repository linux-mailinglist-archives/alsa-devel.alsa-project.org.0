Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EB8777082
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Aug 2023 08:36:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEA8F843;
	Thu, 10 Aug 2023 08:36:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEA8F843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691649412;
	bh=bjiwc0x9O1YzA9o/dItr8qU6qZLmxbdOglUh+/ntFCE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nI1lZwqB/O97vx4sZKE6+y7Fqjjni5iryOUNOmQBZ1REg3/Gd9yGYCrCK+wclPCo/
	 c5ipI9k1eFK/ok6kDsoWTxXfOP0cwrPFVZWuYR2IfEQk0RJosAuwUkJSROlGE67bI7
	 BflTOJ+mHR1Aq0U9/r4D6fOVtCS5kMVtxzURvUC8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D9BCF80558; Thu, 10 Aug 2023 08:35:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 912CFF80508;
	Thu, 10 Aug 2023 08:35:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16F43F80510; Thu, 10 Aug 2023 08:35:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E733EF801EB
	for <alsa-devel@alsa-project.org>; Thu, 10 Aug 2023 08:33:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E733EF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=WsW7N5hH
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3fe5eb84dceso4802775e9.1
        for <alsa-devel@alsa-project.org>;
 Wed, 09 Aug 2023 23:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691649208; x=1692254008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/WBYHWBePTU6C5eucIxmnpm6TRHg4GxWEuDC87hbIx8=;
        b=WsW7N5hH568pRQc1HRO3Dph5sZBjMP7VCQ9PCz17RKguEShZUyFktuqumSMowNXnNL
         eZS7dxaBqYwAANnxZaDYAmepUMVya8yW7kPjBBApwlk7OvvMjJEZO7H+FbP07j4yW/Q9
         v+OQWgdu1hwGASwjeScs1jrTLWsV+ZWk6T7EU3sxTyt8AmDwR3GSouEMghCxR7wTB4+l
         QyKQhIQUJpsbbZm1bTH7OH4EwIzoF2l1A+au4POCQyT1uXwMkgZcMkz5b1mxwoyN3S41
         HQkoW65jAh72hsl2jei/YeCfL+DOSWqvIbvOk1YayxqYBkf7jfR67GAuRMcFIDR1qauT
         ezqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691649208; x=1692254008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/WBYHWBePTU6C5eucIxmnpm6TRHg4GxWEuDC87hbIx8=;
        b=KY9eKNejSwMuRmPGVtSdOvHlfHxBLaB+b1NroWnXCmQ/E6CWHmxG5KIsVzOvR66+B0
         saq5NLVyNJCmQH6FhzbkcbdMwmU6oW3G3RPLZbesx0TRuFeRMVTsODHF5XVvZn5SMvac
         evD9lWHrubFAzEK+UTrAgQC9VTsDvG9qUFYGSj/RFDlkT3axvHkiqkv4OYRa7qKxarHk
         /CpwEGLnt9nx4PW01GKjJGEADaa/94tCMnCHqhxJt4zeoTE8nf5am7yXTNY0+KsgzC3T
         cxyfzVDLGtKN2yCPjLluTDnpEdxgzwuOQuigc4yPtl/TeDBhZJRb/9c1ZrzF3leTAtlT
         ATNg==
X-Gm-Message-State: AOJu0YxvGHzY5ZLE73h7Xz4l6fDx3k+7/G164UkuukXpMwPuHgOBVroD
	FTn5T9THZQ2wNG+enjPYuR7J0Q==
X-Google-Smtp-Source: 
 AGHT+IEXV/tZ+ldWvHaqx8+19PGg8/1xO8IsS1t83BnY9Nx8oyuLOskgHlviUqUGSPNbI+PEAFXAUg==
X-Received: by 2002:a7b:ce8e:0:b0:3fe:2109:b9ff with SMTP id
 q14-20020a7bce8e000000b003fe2109b9ffmr1127175wmj.0.1691649208491;
        Wed, 09 Aug 2023 23:33:28 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id
 o10-20020a1c750a000000b003fe2b6d64c8sm4020018wmc.21.2023.08.09.23.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 23:33:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Rohit kumar <quic_rohkumar@quicinc.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Rao Mandadapu <srivasam@codeaurora.org>,
	Judy Hsiao <judyhsiao@chromium.org>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Jonathan Bakker <xc-racer2@live.ca>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 11/11] ASoC: samsung: tm2_wm5110: parse audio-routing
Date: Thu, 10 Aug 2023 08:32:59 +0200
Message-Id: <20230810063300.20151-11-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810063300.20151-1-krzysztof.kozlowski@linaro.org>
References: <20230810063300.20151-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BMY63B2C4ZJ77EHDMIAS2SF77B7OC3XV
X-Message-ID-Hash: BMY63B2C4ZJ77EHDMIAS2SF77B7OC3XV
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BMY63B2C4ZJ77EHDMIAS2SF77B7OC3XV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Parse generic sound card "audio-routing" property and fallback to
"samsung,audio-routing" if it is missing.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/samsung/tm2_wm5110.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/samsung/tm2_wm5110.c b/sound/soc/samsung/tm2_wm5110.c
index d611ec9e5325..5ebf17f3de1e 100644
--- a/sound/soc/samsung/tm2_wm5110.c
+++ b/sound/soc/samsung/tm2_wm5110.c
@@ -523,10 +523,14 @@ static int tm2_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = snd_soc_of_parse_audio_routing(card, "samsung,audio-routing");
+	ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
 	if (ret < 0) {
-		dev_err(dev, "Audio routing is not specified or invalid\n");
-		return ret;
+		/* Backwards compatible way */
+		ret = snd_soc_of_parse_audio_routing(card, "samsung,audio-routing");
+		if (ret < 0) {
+			dev_err(dev, "Audio routing is not specified or invalid\n");
+			return ret;
+		}
 	}
 
 	card->aux_dev[0].dlc.of_node = of_parse_phandle(dev->of_node,
-- 
2.34.1

