Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1665B925FFF
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2024 14:17:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A911414FD;
	Wed,  3 Jul 2024 14:17:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A911414FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720009035;
	bh=5n2U7Ii8u9qpjNSh5gTMMpFE3U1zzbLfE0z6dwMWgWY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uF8vrqPsSNCMztwSm+WRAaDzCccXr+FYHoKo+b/4bQIC4C5JaL1ltiuAyMWIUpDOk
	 ibktcPwLP+/lHaxcR5sM3bKdcckhJY01hXxL++VtfNO9M3EkHE4F1GBiUmfxUUAFE0
	 1PclXZEXHUwkcbwrOUo1CpJTX/UnQUQyubAv5k8E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B136F80746; Wed,  3 Jul 2024 14:14:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E5074F8072D;
	Wed,  3 Jul 2024 14:14:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45232F8014C; Wed,  3 Jul 2024 14:13:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B6B5F80301
	for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2024 14:11:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B6B5F80301
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=aN9EIqPU
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3626c29d3f0so2638719f8f.1
        for <alsa-devel@alsa-project.org>;
 Wed, 03 Jul 2024 05:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720008676; x=1720613476;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=voPxYQD0gS+6s0oE8RPo9jZsqMZNTCeTe5vHHnILF0s=;
        b=aN9EIqPUZTI84TzgZjvOk5lt1atK0PTazodjRQYkpq0DJwiokEb9hOTf3s4yhWVQbA
         gIDj+XwBVCl9sC9mW78dr9ikKu1tHU/1U7xY1gHLuM7ZlYBiUXgWoN9TanzGfnc+Pgh2
         mi8hIkcLH/xhJ24np2h17jvXi4Ovf76JYDE8zRwdqS/6coOPlQjiobIs5BKn11WwOn3H
         dQPeA8ctzovb5ZPyRQKJxeqVOXi3KEsNmS93Snqhs/Lgw3IFO+a8wrzq4lI/uHpfk9Og
         NdE2HxdBMfk7BaNT22LZ90ZfHwYXgRq2UF5tmpZk7gAPQA6P2Et760YHjG+zRh/Vtm0c
         6geA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720008676; x=1720613476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=voPxYQD0gS+6s0oE8RPo9jZsqMZNTCeTe5vHHnILF0s=;
        b=Nz5xIszKWbmn0/Q4IOaDQX603Uyx8R6BXYmyY9jh0DDtA8/hVTTDVaqPbWXlc03VI8
         mI4sUp2zJ2SrrHYmaWaLQfY1U80XkYw/WLAJxW7x1ycjxFWmpwyxlrqyg2BD9i8FlsA5
         GvCoA4OTEwDNZasuMOmGKhgeqjs5j+fdBemkYqOA1kLjNT0l+HUKDEm/IO2B1mnQ7AIE
         DkEvTmtcSpixJsQevMh+THmj0Mf0CRGchfuoulafc/hk79vqsienHs4TV/fP+Pm+VzLK
         b9CkoC3FOFdlyPDfet5eHQ8qSM0HTydUQG9yhPge/8cJ+ZzTKXxVWbQOYEClWtgJor2p
         j2Mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEkaqgrVQsgud5yw5+m//m/bZng7L2Eo3ITWiOHmlJoC0tBwaMmFssybiwu0m7XbVYJVZSwbs9tAjLsmtiJ3KI8JZUy+QS4v3W63I=
X-Gm-Message-State: AOJu0YwxwAyw5uuQXF9+c5tSv843PoFARhbgvfEEuwJXa/3XxzSGSwH7
	kbpFjQHN8/SiPfiUJz7X6x3am2Z5hje1fPQTkhY+oAzSx+sf8nCS/+Nk30C89Mw=
X-Google-Smtp-Source: 
 AGHT+IHUpJv09c/tX0BJoWGcywOs1/igC2JtMah//K7mGQHmsYLuuC/hM6I4L59TczjXLvEdh4+MWg==
X-Received: by 2002:adf:fe88:0:b0:364:aafb:5fd7 with SMTP id
 ffacd0b85a97d-36775725e0bmr7848385f8f.45.1720008676185;
        Wed, 03 Jul 2024 05:11:16 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3675a10307bsm15716222f8f.94.2024.07.03.05.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 05:11:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 03 Jul 2024 14:10:59 +0200
Subject: [PATCH 05/11] ASoC: simple-card-utils: Simplify with cleanup.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-asoc-cleanup-h-v1-5-71219dfd0aef@linaro.org>
References: <20240703-asoc-cleanup-h-v1-0-71219dfd0aef@linaro.org>
In-Reply-To: <20240703-asoc-cleanup-h-v1-0-71219dfd0aef@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1989;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=5n2U7Ii8u9qpjNSh5gTMMpFE3U1zzbLfE0z6dwMWgWY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmhT/VpH4b1lQMWfJeGjQDjMJ4k7DARxOdBMzRK
 YzljfxO+aqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZoU/1QAKCRDBN2bmhouD
 172hEACWQQu3Q5imqmfhy2Da+4TNTvqC5znQ4ArWh4RI66hNVDgTQHmyb+N0fxWIL3qrevl8eSr
 0AN3N1lmd6D7W5upGGqIks/nPJgFiEe7VqIhy13tVhA7ebEYCWp88sNtgOYg55zmOJh5E+Bsf5H
 DlSPHhaaDgKoFK6wwXe9XGHUMDnSuuortUIxpQeiKT7U1DKNHYHfeUsKuB1y1miIV0ZO2F+15Uw
 Ek5WblZNHEWX5C9PS9z6mW8epDNRqFh6wuCZNXx7UnVD7845z5wO6Kq6etIlVxVi2m3wzdPh2ED
 URWvk1er5OxmQgbjwYoZlZTHY5Na/xooBuKB9bywJATWbzltzlE1RHlcJJT4JsHMnd62Gf7/bGq
 Y1yeVYjgi2LV2ocil3//TPQItf1LRV/odPQ8BLUssFP3BLg1gfFLfZq+bZ/sb2wny8cLVE2Zm/T
 /xX4nd0/068uemcuJIOOrzOv6RFH5u71oP3Pw5WhhqPybcpXw/KhztBlBBNv79PtO5MOjH86s3E
 hVzSxSqHUtzRB0nvkkPw+Z/7uV0sovANZSF25ogEV8Yb92eQg+KNfeS5pbHryj2Lhzekufvp6wD
 5uEgE8Og4+VCN28mAw2TKrmk1fGO+0o8ETKvaYlPlWTUghUVwV0O0pu8xEnjXMiNB3MSf0ZwV7w
 rA74nq0PkFkfJyA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: LSVXU3DZXTRX3AUGK4X323A37SVLAOBB
X-Message-ID-Hash: LSVXU3DZXTRX3AUGK4X323A37SVLAOBB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LSVXU3DZXTRX3AUGK4X323A37SVLAOBB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Allocate the memory with scoped/cleanup.h to reduce error handling (less
error paths) and make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/generic/simple-card-utils.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index a18de86b3c88..fedae7f6f70c 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -5,6 +5,7 @@
 // Copyright (c) 2016 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
 
 #include <dt-bindings/sound/audio-graph.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
@@ -135,8 +136,8 @@ EXPORT_SYMBOL_GPL(simple_util_parse_daifmt);
 int simple_util_parse_tdm_width_map(struct device *dev, struct device_node *np,
 				    struct simple_util_dai *dai)
 {
-	u32 *array_values, *p;
 	int n, i, ret;
+	u32 *p;
 
 	if (!of_property_read_bool(np, "dai-tdm-slot-width-map"))
 		return 0;
@@ -151,14 +152,15 @@ int simple_util_parse_tdm_width_map(struct device *dev, struct device_node *np,
 	if (!dai->tdm_width_map)
 		return -ENOMEM;
 
-	array_values = kcalloc(n, sizeof(*array_values), GFP_KERNEL);
+	u32 *array_values __free(kfree) = kcalloc(n, sizeof(*array_values),
+						  GFP_KERNEL);
 	if (!array_values)
 		return -ENOMEM;
 
 	ret = of_property_read_u32_array(np, "dai-tdm-slot-width-map", array_values, n);
 	if (ret < 0) {
 		dev_err(dev, "Could not read dai-tdm-slot-width-map: %d\n", ret);
-		goto out;
+		return ret;
 	}
 
 	p = array_values;
@@ -169,11 +171,8 @@ int simple_util_parse_tdm_width_map(struct device *dev, struct device_node *np,
 	}
 
 	dai->n_tdm_widths = i;
-	ret = 0;
-out:
-	kfree(array_values);
 
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(simple_util_parse_tdm_width_map);
 

-- 
2.43.0

