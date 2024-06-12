Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 871E0905874
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 18:19:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36343E68;
	Wed, 12 Jun 2024 18:19:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36343E68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718209177;
	bh=/rK5N4p7lzNbPikFsCFIG2uN9Y+xeaegWompkr8S1aA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qaOkkt0CqASBTEMzgxQwoSYro63FVAyvFyuR3fpl0zhNRlAPjYGz+oiXo4mqHEXLx
	 UAtLUaxtc8wlYFIEBZ/oHSRn1yMfycfs08Ws+bcF7lcsjhgPQBU5VZUFfGlx9jexop
	 5vYKTLS8CkJ7fYjz579wgDBivMt5D3MMDxFMxadA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D22AFF8081B; Wed, 12 Jun 2024 18:16:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D7292F8086D;
	Wed, 12 Jun 2024 18:16:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACBF9F806B9; Wed, 12 Jun 2024 18:16:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D73ACF80603
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 18:15:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D73ACF80603
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=lPR+KeZv
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a6f21ff4e6dso9093666b.3
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jun 2024 09:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718208957; x=1718813757;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/iEo4Md295/OTL7Myd2RIYbHSuX6XmNxZdXGojd1Rgg=;
        b=lPR+KeZveelgIjwzae5vqYjU3fqoJYVMmvxVZNDSFPOPhj/G7m9iKa5mbCIK2hpgWA
         53QAUgcBTdrpckLtZ09shQEJDFIws+Cvyy/FgnX/QananQRtrNQXRoS3N37wemgT+rW4
         MbZ7gv9nByhlL7X1Dz9Omc1m8IFlQCIbqKyXEyHLpsGAlSSkOhE34fTZdPS10ViUb8mp
         edEWx6V0Q9cwBp2zSQ86Agpt1qTDc4oRHJ7h60Hwr4jA7NpK3k9fLdqKvq3orqPWnEen
         s7956fSF/TN/G6pVT0kc0Fx8gAJ7W3UQ4Z5yzxpX6/PJQkJn4hrGYLi1EGn4IK1/KlkO
         wXjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718208957; x=1718813757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/iEo4Md295/OTL7Myd2RIYbHSuX6XmNxZdXGojd1Rgg=;
        b=I+c8Yie841OXuIHiWsILaHT85O1v4EEP3gka/kGgsYI7oJwqryD1uvGvTOhsIsuICG
         dDKIju2blyf6Zq+KgtkWaaHSxGWleVT+OXxZ6+xxLqhDcANdp9zVAyT+eozBzWpNgMFm
         d1MlZ7jD/8lGyd75UqcWwKeCYxviXqvAQXlpJPP1F3TKByt6a3JlaNHYPCoGZfKfCA9K
         sX6UIfPE4BvmBVlyQbzhV2JT5JpFC6I2Zo9gGQW0eKc1CZf4XPdz3s/C9r+/CI+XgRHh
         797IekBY2d20JT20+Ytyvmdxj+tmzxmGQBB4CG8M5rlU3bhggJuTzYqQ5Vc+YSwUdjjP
         PA6A==
X-Gm-Message-State: AOJu0YxfFv1ERtuJY2qhxYjmo5x0FKUZhDE86+Pf0oOFvIOIIcSgEyFV
	4QfgueCN8CkNrIETvA2vDcgHI/dFs1eLlH/Hf2ti/AYYgV8LzkjaSl/5djD+0hE=
X-Google-Smtp-Source: 
 AGHT+IEy50S8SITZi3bjq2DbDVZcQs7pImUEBnzlSKFFftxfcGZSuVKB5uF7YIpLQwSbQnYIWU2E/A==
X-Received: by 2002:a17:907:6095:b0:a6f:526e:5f4b with SMTP id
 a640c23a62f3a-a6f526e6074mr3480066b.14.1718208956973;
        Wed, 12 Jun 2024 09:15:56 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6efd6cfb74sm624815866b.20.2024.06.12.09.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 09:15:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Jun 2024 18:15:24 +0200
Subject: [PATCH 11/23] ASoC: codecs: wcd937x: Constify static data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240612-asoc-wcd9xxx-wide-cleanups-v1-11-0d15885b2a06@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1465;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=/rK5N4p7lzNbPikFsCFIG2uN9Y+xeaegWompkr8S1aA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmacmgfrAvN9jmrz3zOenScYVJk3VRxnk6Op1wW
 DYK4/Iv3s6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmnJoAAKCRDBN2bmhouD
 11nsEACB2gWgRhL36G/IHrTBMlWrvaaF6KR0xQBOPCetIqklAbL8fvnh5L+rf/eDEw7kCYPy3i1
 i8mw4seuiZYhJpCwAWrJcD4hogyGtwa3B+af+/pXC7YaaKJBAuKUlo4uj8dbcpc+yFml0P5VXiW
 /E5xGbhl7xlKmkIHhB3Fhip/r37Mlj38RPzTVQexKwR4Foys73xWfcgY5e5ZC0FLjdLlhI9wptF
 0sKCLx9Es3zFxAl6S+nIqF19JhYlBnNDTmHHRw6zoDhVUCWbR5aMbqn8srovfpnMJd3c4rDRMw/
 jMbnGB5l6LJBo8nzc7ljuV6fo4Wf2/0egGaDmLwXw+VjxX6gWBKgc9MK+OvuwLacXrBmkomApL5
 NvaCJoiITxa0P27g0tEm3XiHJcAxICk9t4ZcqIF101QeYnSi1k7abnSRczKemTS/AeqwKIo4olM
 elHbe21+/y0LLq1L+f3313qf3BqcyygVeNR0gZWyyr/S2cOwJ4orxqkZegRrYxi/WygfbXzNG2y
 xvyW9YaAoxf6/kCLKS0mfOrkGF0HTNwBI1QA6IBDUOX7gmSOr9vs8aWzqh9H56ZB9e3mDAlt7cg
 YxQTfHb7S5PoUeo6vU4qJnER0AmKMfuLS23dc60tDw7AsRQMiiZ4ag0tFKGX378yuf/yTE7mdRU
 Iq7SaBlQ+Oks0Vw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: OA72NPDJ4BJN5MWALHBMQG6BP77ZIZZF
X-Message-ID-Hash: OA72NPDJ4BJN5MWALHBMQG6BP77ZIZZF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OA72NPDJ4BJN5MWALHBMQG6BP77ZIZZF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Driver does not modify few static data (MBHC reg fields, IRQ chip), so
make them const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd937x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index ef649ed77fb2..4cf17d62a0bc 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -133,7 +133,7 @@ struct wcd937x_mbhc_zdet_param {
 	u16 btn7;
 };
 
-static struct wcd_mbhc_field wcd_mbhc_fields[WCD_MBHC_REG_FUNC_MAX] = {
+static const struct wcd_mbhc_field wcd_mbhc_fields[WCD_MBHC_REG_FUNC_MAX] = {
 	WCD_MBHC_FIELD(WCD_MBHC_L_DET_EN, WCD937X_ANA_MBHC_MECH, 0x80),
 	WCD_MBHC_FIELD(WCD_MBHC_GND_DET_EN, WCD937X_ANA_MBHC_MECH, 0x40),
 	WCD_MBHC_FIELD(WCD_MBHC_MECH_DETECTION_TYPE, WCD937X_ANA_MBHC_MECH, 0x20),
@@ -227,7 +227,7 @@ static const u32 wcd937x_config_regs[] = {
 	WCD937X_DIGITAL_INTR_LEVEL_0,
 };
 
-static struct regmap_irq_chip wcd937x_regmap_irq_chip = {
+static const struct regmap_irq_chip wcd937x_regmap_irq_chip = {
 	.name = "wcd937x",
 	.irqs = wcd937x_irqs,
 	.num_irqs = ARRAY_SIZE(wcd937x_irqs),
@@ -2503,7 +2503,7 @@ static irqreturn_t wcd937x_wd_handle_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static struct irq_chip wcd_irq_chip = {
+static const struct irq_chip wcd_irq_chip = {
 	.name = "WCD937x",
 };
 

-- 
2.43.0

