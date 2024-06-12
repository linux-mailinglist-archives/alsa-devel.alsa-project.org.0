Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC8190585E
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 18:18:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 176D3E67;
	Wed, 12 Jun 2024 18:17:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 176D3E67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718209088;
	bh=EX2ahL6J6gVjXyyMMyKCJVoPSigpcf+psbFgYuluYwk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HnwB1Wa5VahRLgPiwp+rM2DJZdJvoX9HAatehPJ1Nh1JgWJuj8NIdHCAukPdmJSgq
	 ocR4EG/ZJYfiOdzQz5K6fV/22d0eww/mIYxvfSl0PdKCdvxXTl2sZKTENdZoFZ3taV
	 XSQ1rYFCVZH6nRaazOzcWjD6qps6tgTKoH2SVTUI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE2CDF806C6; Wed, 12 Jun 2024 18:16:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 00B9CF806B5;
	Wed, 12 Jun 2024 18:16:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE7ECF80617; Wed, 12 Jun 2024 18:16:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 59B8DF805E3
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 18:15:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59B8DF805E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=r8sf7Xl8
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a6f1c4800easo6821066b.3
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jun 2024 09:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718208954; x=1718813754;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SEKGICqGgE2b6uDcqkkwK9UClcAb7dqdvvSEbvTTj0M=;
        b=r8sf7Xl8amNWiXWyMhBylcQVukdioAF2C2T4bgYW9aF2zWFlA/QrDbkbDH8x2cN/Bd
         6QMUwoQqE7IaavlYCD7F9wbSsODY6yD4/e7ilBGoa7SbepmqZgPAZBXq+B1rgQfvxrld
         F96/qy7PLTOqbhIEjwcMrfT50U8hMoThSs7nIBPE1No2TpTO9zY1DP6x4VzmgwCQICZ5
         ib+wIgsq7LA3uzaW1ZR41yDofHKW9PErXBJieepyHXp7MjUvJwJ5CwE+KfJ8gs+vxDSC
         2fWG+0+GpxuQkaQLYLa7SWMQDkQixmAClYq0ofU6EQ4T0uMgHpwvMpL48Fu0Shgrmo4o
         MAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718208954; x=1718813754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SEKGICqGgE2b6uDcqkkwK9UClcAb7dqdvvSEbvTTj0M=;
        b=hZd4nRCSXZ65dXtcwUTqSykDdFcrd5wM/n/G5oJQRWTxlY6LK8bHFA6i6eg7LIakKI
         PDZvoKCIWK3PB6PwtqetZ4dThYes/QLsVXc8ZtgSa3VD99jFyIdN0zMm1jKlDZYsYt+F
         W++TWkT+lwHrg7i7r/T/0g0UvicEQvHcKoPvM2Wmry4r+GcW6y6JD26Z2qu2DIFEhImQ
         COshvl7qQr6iNVGgypaYQpYDqxm+MLNw5YF+XR4vZjfMe8jwhQSAv9l0r7T4FaqgzzRe
         BDl5USC++0DJO3g1lE3Cs1SgA333KaY6E+qkq4YYsuNOkz/ucwKQQC/L24L5KDta5lbt
         dgUg==
X-Gm-Message-State: AOJu0YxhWsL3nW/6m4n7990t2JQC1FGrmu735jTf7FX3bbY746XW8zU9
	ECV0xLe/Cyyoy53Cyj4lk+RoSGUkToNee1UmkRcw+Z+YpVsYf865DhpqBPqhE5A=
X-Google-Smtp-Source: 
 AGHT+IHYEtQvDVbT6uJNSotzJaByqehhuWhxlB0O63Bn7wSy9KpB96B9a+ukyvZ1xgkh0eq0/z6n5w==
X-Received: by 2002:a17:906:480a:b0:a66:c338:65cc with SMTP id
 a640c23a62f3a-a6f47d3593emr150992266b.19.1718208954195;
        Wed, 12 Jun 2024 09:15:54 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6efd6cfb74sm624815866b.20.2024.06.12.09.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 09:15:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Jun 2024 18:15:22 +0200
Subject: [PATCH 09/23] ASoC: codecs: wcd934x: Drop unused mic bias voltage
 fields
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240612-asoc-wcd9xxx-wide-cleanups-v1-9-0d15885b2a06@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1979;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=EX2ahL6J6gVjXyyMMyKCJVoPSigpcf+psbFgYuluYwk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmacmfUq+jhizaLbMXoUgIxvDCzWGZrgeZdF/wf
 dfrMV1SHqKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmnJnwAKCRDBN2bmhouD
 19N0EACMZdzHK7kT5jfHO+OLl2KWwObwFoTIuOxIp2z/nCRwkYmmH02uCrwaLRwMC6fTy1HAoV5
 mfunts6Spsg3P9FcQyJQGg8nYTIsxsVy+76SMxhR3+F0lU6QPwy24A7K6gvXK3L5T5mhY0iZ7Ln
 gGqf2XlV7tReFlQKp7SFtIEi8FZ+A1HBuzZocEhH4DFdPEeOOdWRq7O5Zv2HdPb2dFEraohL+Xx
 /xJ13ZPSYAImCF+qofa7m6k1Fq2+FuZrHKxveVRX/qy2VsvfKZAo+XacZhfvGej+IXLKEIFtlWJ
 LpJlJPDhXm8TKBo/vCpFQBB6Sqk78qzISUt039KpyOrDbJ8JbZUBHK5X1WZYJFWp5f64KQC9wQw
 yDoAA3RRn0HGVc+zEyQVaglLLK4wInPzEG6wzctKEGfOyiaFa4ew4T2ZU/qraojlEcG4We+AqVD
 2Mvi37jqLcoso6oojXPIE35B1mCBrLQJdVKGi0hHknqu2lJ7VKmxFiYPdSrDBYjKkHTmqEUB9Mn
 xh6pzZXWYHKq7oBOs7U0CITuH41NACzebveNzxkOI7XSrEprZ5NYGUNgGMjXnCpYULn3n6HtVKH
 9XYfNS2QTNaT0PeJY3NT+B8PV/pW0R+drWRPTh0QcsGSbs6GYuomsDLx/39b/kdxI4ttJS0Rgzw
 7STZMgm9Urff5nw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: G42X35DEKIOH5BCEPWAJH766GYGBS5AJ
X-Message-ID-Hash: G42X35DEKIOH5BCEPWAJH766GYGBS5AJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G42X35DEKIOH5BCEPWAJH766GYGBS5AJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Driver stores the voltage of mic bias in fields in state container
structure, but actually never reads them - except for the mic2 bias
(micb2_mv field).  Drop the fields from the structure so the code will
be a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd934x.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index 7885aa423886..2a5fb4370ba3 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -566,10 +566,7 @@ struct wcd934x_codec {
 	struct mutex micb_lock;
 	u32 micb_ref[WCD934X_MAX_MICBIAS];
 	u32 pullup_ref[WCD934X_MAX_MICBIAS];
-	u32 micb1_mv;
 	u32 micb2_mv;
-	u32 micb3_mv;
-	u32 micb4_mv;
 };
 
 #define to_wcd934x_codec(_hw) container_of(_hw, struct wcd934x_codec, hw)
@@ -2203,7 +2200,8 @@ static int wcd934x_get_micbias_val(struct device *dev, const char *micbias,
 		mv = WCD934X_DEF_MICBIAS_MV;
 	}
 
-	*micb_mv = mv;
+	if (micb_mv)
+		*micb_mv = mv;
 
 	return (mv - 1000) / 50;
 }
@@ -2215,17 +2213,14 @@ static int wcd934x_init_dmic(struct snd_soc_component *comp)
 	u32 def_dmic_rate, dmic_clk_drv;
 
 	vout_ctl_1 = wcd934x_get_micbias_val(comp->dev,
-					     "qcom,micbias1-microvolt",
-					     &wcd->micb1_mv);
+					     "qcom,micbias1-microvolt", NULL);
 	vout_ctl_2 = wcd934x_get_micbias_val(comp->dev,
 					     "qcom,micbias2-microvolt",
 					     &wcd->micb2_mv);
 	vout_ctl_3 = wcd934x_get_micbias_val(comp->dev,
-					     "qcom,micbias3-microvolt",
-					     &wcd->micb3_mv);
+					     "qcom,micbias3-microvolt", NULL);
 	vout_ctl_4 = wcd934x_get_micbias_val(comp->dev,
-					     "qcom,micbias4-microvolt",
-					     &wcd->micb4_mv);
+					     "qcom,micbias4-microvolt", NULL);
 
 	snd_soc_component_update_bits(comp, WCD934X_ANA_MICB1,
 				      WCD934X_MICB_VAL_MASK, vout_ctl_1);

-- 
2.43.0

