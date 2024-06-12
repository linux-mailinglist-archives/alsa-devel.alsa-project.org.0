Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D17DA905887
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 18:21:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E105DF8;
	Wed, 12 Jun 2024 18:21:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E105DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718209278;
	bh=BqagLWlqycAbhTFnkhaAyAXMO9chHZNsBtioPnuGa2g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=koY5AFXPCmJp4s8EuAvjK9xtYZQ+BghNy6V5aSyhckrNgiXXmSS8gku2J92t3Sagt
	 wHipGSS5Ts0yOJxgMb4TCy1v98rZfjLMeCDJW2vUM60/TF0JTb9/ixCP0m3mJtqM9h
	 wt8InWDrAir/XL4Ba55RdOo/CIL9lBp/Imqm0hl4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05407F896EC; Wed, 12 Jun 2024 18:16:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 34DDFF896E4;
	Wed, 12 Jun 2024 18:16:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16AD8F807DC; Wed, 12 Jun 2024 18:16:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C429FF8071F
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 18:16:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C429FF8071F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=bLHnW8GL
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a6f1dc06298so9202666b.1
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jun 2024 09:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718208973; x=1718813773;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=umunyDYCcpIfLhzHvmQwuR6ONiqX1k9YBrp8qSeACL4=;
        b=bLHnW8GLMwAsoiws0g1C0S9Jv1Eg0FxuHndEWuXp+P6tC1AZCcbTE6lRNYcUnpN6Yr
         Qfl+baX19aFmHtMENUtZESIo+lkc09NSDq8nCKSS4KxH5JGvEkxUbVTk3Y7guvPAsYa9
         R5i2XdVk+TRWsHqREr46G7/SlJ/6R0/+Bri1lJyRLT04akdgDWRPlApmJgRlYyfRBihX
         VpQfPq+/bemYyH1gclbCZMdhyv6o00aqd78IbFIo7IsUSHvoCBUmehmMhxBgwdmzrcWS
         kqo196YJ92xiMwZsJpcNzFgTy6cd3J2lZPhujCt+dYkYFUvFwMX8cIMyt0/H+GH27xy7
         AElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718208973; x=1718813773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=umunyDYCcpIfLhzHvmQwuR6ONiqX1k9YBrp8qSeACL4=;
        b=lCv0gqjJjK/puoJFgyG+ILGMtLFLvgSR4w3n2tFY4CXQfzOMHU5A0jO607PApNMTx/
         /EgukO7UoIzictPyQWsVCYIrBgNTTooQbrwh15kz/dvOBJUTsbGIGNogOg5dbXfRrWZQ
         jjw1q4yiX33AIgnJraIptDfG1EL0O2Rf52n1/ima6jpDG4WTi4uD2LiI3LLwuMIYlcBY
         5x2pEqEGJB4xwR2zHxjzbz1Xqlv4lLMkhFDEAhgAMsFNsSfY7hhgZk0P8NgPwAppFGFG
         GdCIeLVa9f5nTmCfWKGUWBHdMKcCVU4aZHCRIYZS5fN0cEh752p4pihoxvNz62AJKM6W
         a42w==
X-Gm-Message-State: AOJu0Yz1QfdSTMdsmrR7NZQWlpVvqPViZhMw6/O/r4y2PonRcjOwkoqB
	vNOvva9gt1e6WgTn2ICmWf5ZviqIclNuSxa2dA4Vxl10yjRm5w1SkDoI23S4jI8=
X-Google-Smtp-Source: 
 AGHT+IH0GoHifL6jgy5PyEjM8Pi/KiyQ6aZDtaFe9VNNR65uXeOBOYMv+ObkalJZW+YbesSK3YYEAw==
X-Received: by 2002:a17:907:7248:b0:a6e:f997:7d91 with SMTP id
 a640c23a62f3a-a6f47cc0a2amr171236166b.38.1718208973333;
        Wed, 12 Jun 2024 09:16:13 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6efd6cfb74sm624815866b.20.2024.06.12.09.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 09:16:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Jun 2024 18:15:33 +0200
Subject: [PATCH 20/23] ASoC: codecs: wcd939x: Constify static data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240612-asoc-wcd9xxx-wide-cleanups-v1-20-0d15885b2a06@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1698;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=BqagLWlqycAbhTFnkhaAyAXMO9chHZNsBtioPnuGa2g=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmacmouQc/YqbV6MVhWmi+gk/pR5ijNN2hgvhgM
 dfchoPH4x+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmnJqAAKCRDBN2bmhouD
 14J8D/4zatHrqm6oR4UtKKGG9K+NcNpYMFRJHkjHL60E/Kh9xLd8cK81n2EJmH/BliM4jnGx0NX
 pjaQ5YkAyW7xcBOgr9WqTajad/7lf+5XbhA+i/3Ql/DmhTkIWWF/83zjMrPJPL7qAzgNEAxqFur
 f1gvfWMzEByI651UXn0kcGXs2TKU70U0e1+NKlIx17EmGsTJNsPl6RdrBpbcoiPD1b7EsxyV6Pk
 1bceyltMIHOFEeHChT9Ps1OqOhEl6zNHIuWv4NVgOBnSrxF4Me95EwSXKsyXlYTWGZGhH+hHeeC
 rZyfj0SyX9xUUU9jVKyV2eQJMNoCEOaQjc0d5nYiplkIIfxia7VAE5wG7wwAhGEPW3RPg3jtBE7
 robLipydkTxV3DDWf0RqucD13vO3rJz+A4PmGt9dcSKTsEDzm7mqBzl7M81dNQ8iqbpDdvo6p9e
 pAW5neRHNUjddj9bF/ns2ZwjbQJ6BXRMxTtNCVT0ACyh9bDnyYdxSzlaYfdOTw4NwmZDgk0fylW
 oac9ZhZkz+dgAUq+4m0A6GHR4/ZyCrA6F4WKUlmspmbazH+vW+P5EgQZ48cS7CZkOvF0pq9c9Sq
 S4jvDRRJPLRZEWnLdJH/zQD8WlCuBdESd/LqUwpdSF0YIqGqrSq45w072hZZCJjPUSbILiGYmnc
 Xs4jHbcM/06U0uA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: O2MNVE25VLSGCZNXRENOMWWAACGMTV5F
X-Message-ID-Hash: O2MNVE25VLSGCZNXRENOMWWAACGMTV5F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O2MNVE25VLSGCZNXRENOMWWAACGMTV5F/>
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
 sound/soc/codecs/wcd939x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index 72d8a6a35052..1f94f49f9829 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -220,7 +220,7 @@ static const SNDRV_CTL_TLVD_DECLARE_DB_MINMAX(ear_pa_gain, 600, -1800);
 static const DECLARE_TLV_DB_SCALE(line_gain, 0, 7, 1);
 static const DECLARE_TLV_DB_SCALE(analog_gain, 0, 25, 1);
 
-static struct wcd_mbhc_field wcd_mbhc_fields[WCD_MBHC_REG_FUNC_MAX] = {
+static const struct wcd_mbhc_field wcd_mbhc_fields[WCD_MBHC_REG_FUNC_MAX] = {
 	WCD_MBHC_FIELD(WCD_MBHC_L_DET_EN, WCD939X_ANA_MBHC_MECH, 0x80),
 	WCD_MBHC_FIELD(WCD_MBHC_GND_DET_EN, WCD939X_ANA_MBHC_MECH, 0x40),
 	WCD_MBHC_FIELD(WCD_MBHC_MECH_DETECTION_TYPE, WCD939X_ANA_MBHC_MECH, 0x20),
@@ -291,7 +291,7 @@ static const struct regmap_irq wcd939x_irqs[WCD939X_NUM_IRQS] = {
 	REGMAP_IRQ_REG(WCD939X_IRQ_HPHR_SURGE_DET_INT, 2, 0x08),
 };
 
-static struct regmap_irq_chip wcd939x_regmap_irq_chip = {
+static const struct regmap_irq_chip wcd939x_regmap_irq_chip = {
 	.name = "wcd939x",
 	.irqs = wcd939x_irqs,
 	.num_irqs = ARRAY_SIZE(wcd939x_irqs),
@@ -2957,7 +2957,7 @@ static irqreturn_t wcd939x_wd_handle_irq(int irq, void *data)
  *     \- regmap_irq_thread()
  *         \- handle_nested_irq(i)
  */
-static struct irq_chip wcd_irq_chip = {
+static const struct irq_chip wcd_irq_chip = {
 	.name = "WCD939x",
 };
 

-- 
2.43.0

