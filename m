Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BEF905863
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 18:18:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FC77E9A;
	Wed, 12 Jun 2024 18:18:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FC77E9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718209118;
	bh=Qvm23q2GYZ89u4m4lnW1gC9ZSpuZfm4HZTc7sb1PqHc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oiDJn4k8ECOgnFWM2R8xkJ3sxXUlqLirNJiRkT8CooPCMZs176tv5LBw06V2yK41C
	 HbCDsb/CwOlq9yqnI+QzQmOPP14RwWr6EXWeSgchBwfa2r3XG/uDVgU3vpzwMQSWfJ
	 cN+7h47Wu5UMWFwEP93IkozIbUuvXytG0OHaZPB4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1DDEF80714; Wed, 12 Jun 2024 18:16:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 86714F805A0;
	Wed, 12 Jun 2024 18:16:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B64B2F8064F; Wed, 12 Jun 2024 18:16:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CBA58F805FD
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 18:15:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBA58F805FD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=rWBflnEp
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-57c61165af6so6689931a12.2
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jun 2024 09:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718208955; x=1718813755;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=61skfWvt9BRl/9QYc63/KGerHmR4wxlY7IwK9GFNUXg=;
        b=rWBflnEpvWAWeY8snRlCitEcYZmTpZ+cxYDvY5Nm19y7QiW+0cfOYp5zj8n1Kzo7Ej
         CIIX1HttQnsaN0eKeL9AIrh+EDe2FunKjbWB57HhCTf6e44XF774r76yoJ1XtR0xx5Jj
         oDKy4aHoBQpN+4JoAlkTBR0yehsYmHut1gQxLUq1VfBhXsErPHJ1IYu1Ks6nkOZ7m6Q0
         7sZ6pJjgnNnU4qxhUoRmgoljTtXqX1araJ1ipgTl/m6cvP5EdUyB/1TqFMxo+BHDsWaw
         y8aVKgP6mW8ZWF27BiLufboTaWII/P9YwMh44vqJw57LXv380uOhJp4d4w+Ltu0SS1jl
         B5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718208955; x=1718813755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=61skfWvt9BRl/9QYc63/KGerHmR4wxlY7IwK9GFNUXg=;
        b=u34TeMOOyr+3K9sdiw4UYO5CM4iEFRu7d1KrbNWC/WgJbCJlLjDQN9kmnht9CLaUsc
         OGfxOmRAnmbtiE8CKs4qnoXBTqzIhJRJiNEPdLtsb/tNJ1CPQmXZlbE+dvtY1S+I0vUc
         Q0HT/q0AjeWs3Ndmy8sy8OJ7fC7m/NNWY2ZPkLOtnTIPNuURMCEbOl+Wfmm2zgPKSY4J
         YYOCBA/dYXpteSb0Y5AXOnlX8MrZgzumqK6ZsOJijABd0JPPjLszjO9vDO1s5fVUfyBT
         XzaiekezOv6fz5SvL7RzRRUCRze19oGFn0rvnGak7A/1D1OGAFl6pLtgmBiN9WOQxr0M
         NyeA==
X-Gm-Message-State: AOJu0YxpAkg+bbRH/GbmgJDy51qCD7Ch5VoGtl5kFa+4pLG2xOxHjEKA
	qs1NWbkEbvRuaXpOtcv4VpODoOT2GRl+R3Z2VJhNtLITW/GrjEVrx4LbzHYwE2c=
X-Google-Smtp-Source: 
 AGHT+IFrFEyR1KwAKRzvE5BUx0XlzQZ7BeNBxLJzklNFCPiFqELpkjXvSl/mHaW5rpddnl1lvh2tFw==
X-Received: by 2002:a17:906:2c45:b0:a6f:1893:f549 with SMTP id
 a640c23a62f3a-a6f47f7ff70mr125342966b.28.1718208955435;
        Wed, 12 Jun 2024 09:15:55 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6efd6cfb74sm624815866b.20.2024.06.12.09.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 09:15:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Jun 2024 18:15:23 +0200
Subject: [PATCH 10/23] ASoC: codecs: wcd934x: Handle nicer probe deferral
 and simplify with dev_err_probe()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240612-asoc-wcd9xxx-wide-cleanups-v1-10-0d15885b2a06@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1792;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Qvm23q2GYZ89u4m4lnW1gC9ZSpuZfm4HZTc7sb1PqHc=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGZpyZ+iUkory59nFZNw3S4z4Zfqy+Cwzs2u33Jv5ftaDeLtk
 4kCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJmacmfAAoJEME3ZuaGi4PXJoQP/RIF
 O+QjkDONoNlP35hSnfUWOqDNPKOOqqeXELTnnNWBOo9hK+x2Q9kxQYTbKIfVwhVnyACJWoMBGGr
 0oGDECFTwTqAqxWtO/zctF3fzRFR9etq/+JadVGW7SLgtcX0aAX96Clr16BnOibMFeUfrNbBh/3
 /ySkxMl+TewZCjxNlGqCiYRisNwaP/HRmu1cMaQcE37iditJkrfP69L/KlJEhG9oq+dhCk4x86E
 kf5Lhd+LG6ZLo+p3qiZetcvlCDP8zSddbBpAINJDroxSA1t5br7yySir/Z0ZQ8SR/VooNpYahGv
 /M+J3mCkpHSi28/3OCC9/hrkWKM0j+F+rQ+DPfYqgbCy9iuMQrHhbZQ4pFQ6OzcjezIRGlU7DbX
 p9/XllFtOaBce/vwjnMyWC4lOeG020XioQTa29S/VWNEIlBj/eVn2lL9IrbwW4HpNMHL6zI8rQS
 Le+WMuhWh5oK0xR1vBhv1Y3okzrbFtJ4dBvWFq8xXIleHIiLlYWT62Qp8oUZL5DjG4yWFUr78j8
 vvFIgpo0ydjM0Q/aFlr95Bxw7OHlLyzmB5KO5OPcuP3C/32dirueNHMHp7LSJmWsGGrbZSnDRGw
 IYni5KrQfaP4MDtAOYT+8OksVXrF/CuuvNmNC7i6yH3chQLVd34cB9fkSxO9USJ8fViC0CnEHDo
 gYf56
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: IJSWFGTSH6VYON5SK6GYJUVUCJ4MUH4K
X-Message-ID-Hash: IJSWFGTSH6VYON5SK6GYJUVUCJ4MUH4K
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IJSWFGTSH6VYON5SK6GYJUVUCJ4MUH4K/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

wcd934x_codec_parse_data() function is called only from probe(), so
printing errors on resource acquisition is discouraged, because it can
pollute dmesg in case of probe deferral.  The actual deferral is here
unlikely, but still the code is a bit simpler with dev_err_probe().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd934x.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index 2a5fb4370ba3..d1bbc963856b 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -5856,17 +5856,13 @@ static int wcd934x_codec_parse_data(struct wcd934x_codec *wcd)
 	struct device_node *ifc_dev_np;
 
 	ifc_dev_np = of_parse_phandle(dev->of_node, "slim-ifc-dev", 0);
-	if (!ifc_dev_np) {
-		dev_err(dev, "No Interface device found\n");
-		return -EINVAL;
-	}
+	if (!ifc_dev_np)
+		return dev_err_probe(dev, -EINVAL, "No Interface device found\n");
 
 	wcd->sidev = of_slim_get_device(wcd->sdev->ctrl, ifc_dev_np);
 	of_node_put(ifc_dev_np);
-	if (!wcd->sidev) {
-		dev_err(dev, "Unable to get SLIM Interface device\n");
-		return -EINVAL;
-	}
+	if (!wcd->sidev)
+		return dev_err_probe(dev, -EINVAL, "Unable to get SLIM Interface device\n");
 
 	slim_get_logical_addr(wcd->sidev);
 	wcd->if_regmap = regmap_init_slimbus(wcd->sidev,
@@ -5912,10 +5908,8 @@ static int wcd934x_codec_probe(struct platform_device *pdev)
 	mutex_init(&wcd->micb_lock);
 
 	ret = wcd934x_codec_parse_data(wcd);
-	if (ret) {
-		dev_err(wcd->dev, "Failed to get SLIM IRQ\n");
+	if (ret)
 		return ret;
-	}
 
 	/* set default rate 9P6MHz */
 	regmap_update_bits(wcd->regmap, WCD934X_CODEC_RPM_CLK_MCLK_CFG,

-- 
2.43.0

