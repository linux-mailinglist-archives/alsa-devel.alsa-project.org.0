Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DFF554F54
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:31:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E2D11F23;
	Wed, 22 Jun 2022 17:30:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E2D11F23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655911888;
	bh=XW4kyzMVi5YwsnPeL//kAENuSFbFgiljBs7kag1kVQM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MlWxp59gLC0beeg4OMfE14cKORbFjh/4RNM4bDoNWuSntk9O0vV4lfYLvKjisSUrJ
	 Qg3fXE4PXSvsaJMMu2UYsG8X6KjfbtiwfITjYMr2f/6SMHuv69hUscjXAGP9JjxCP4
	 cWnHIArfaIqamo8kr9lpHnnPfznucyI2XPrB836c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22E9AF805F6;
	Wed, 22 Jun 2022 17:23:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B75F7F804E5; Mon, 20 Jun 2022 22:07:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B764AF800CB
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 22:07:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B764AF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YLV9HVC+"
Received: by mail-wr1-x429.google.com with SMTP id v14so16098362wra.5
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 13:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DTY/U6s0Ls/Dtw06y3+h8JI8hTjwct+Am+4ddShNVBI=;
 b=YLV9HVC+AuiPiyFoS3kBS6rWy2Gjdbs/RM2nFfy9wTqwdZFX0UXlXKk5xti7k7/YfQ
 2P62pyaX41f81Mx4DSWuyjatSY+/7lA/G8nV48egrVJ2yaymGBYB2GNCkXpSY8BVwdPc
 UfIABhiWRF+9AghYCFIxPI5Zxc5kChjXJpHLRgpieDaKOWBp5sHc9iq/i8aKzPSn9tFm
 4gxgSzdozxH22+jMKs/x0dBZBgERtmU1igIsm48zLXwthMic+vhyTYQctNH5OkVynDcN
 7mpW0MeJmLgfC+VbxloiSMxT2IAuB2PsvQjFG1L99Vog+c+Ukv3qRMNVf6Kq/ifo+mKe
 7Hdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DTY/U6s0Ls/Dtw06y3+h8JI8hTjwct+Am+4ddShNVBI=;
 b=7FBnW2+dFT1SmyNyk8g/S9F1z2tesiQ9MiZymq0INWWeka8GCu045S0JKeYfy55FUD
 LgmPB26HqRrKchM3kGiYzVXxJq/aPR4Dl2mA+/9tLFfhyWe5LYu4c87mAmTOgKP6Z4YQ
 Cz0aXD7DZiCRa7LFpMjVhoIA5NdwwqviIpRTXfz609TAakgS+PNAXx9jPXiudkZwG9PH
 oHG1bAsPQa4pSVZKzH79Q8WY7ToDsnIaMp9rdnxEATOaD6hSQWk1+/UCKnKrTwMkh4fc
 LfmUcAWlfcDbAy9ngakP4MbXhovDH1Q0M6PUrSh2FLroUaRNZAbeeQr18Z13/kE4Ch9k
 4EgA==
X-Gm-Message-State: AJIora/y5jSinc8c2EnGCloitgUr+B8rUOAflGCHco9oYggYn3ewswID
 DtKPHzaoqUgTQkpHYbqhVc0=
X-Google-Smtp-Source: AGRyM1sDxyahRh5I6JQeiiGBQbk9ax/ShTfPCo/d3S6kQfwtlTUB/zSFPkFow3AhqZQhxwOVIp9FHQ==
X-Received: by 2002:a5d:64e9:0:b0:218:3fdb:bfd2 with SMTP id
 g9-20020a5d64e9000000b002183fdbbfd2mr25588725wri.717.1655755618712; 
 Mon, 20 Jun 2022 13:06:58 -0700 (PDT)
Received: from localhost (92.40.169.63.threembb.co.uk. [92.40.169.63])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a056000114900b0021b8dd05f45sm4858105wrx.55.2022.06.20.13.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 13:06:58 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 28/49] mfd: axp20x: replace irqchip mask_invert with
 unmask_base
Date: Mon, 20 Jun 2022 21:06:23 +0100
Message-Id: <20220620200644.1961936-29-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 22 Jun 2022 17:23:18 +0200
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org, rafael@kernel.org,
 linus.walleij@linaro.org, bjorn.andersson@linaro.org,
 srinivas.kandagatla@linaro.org, myungjoo.ham@samsung.com, lee.jones@linaro.org,
 samuel@sholland.org, maz@kernel.org, brgl@bgdev.pl, mani@kernel.org,
 krzysztof.kozlowski@linaro.org, jernej.skrabec@gmail.com,
 cw00.choi@samsung.com, wens@csie.org, agross@kernel.org, orsonzhai@gmail.com,
 linux-sunxi@lists.linux.dev, b.zolnierkie@samsung.com,
 linux-arm-msm@vger.kernel.org, tharvey@gateworks.com,
 linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org, tiwai@suse.com,
 tglx@linutronix.de, cristian.ciocaltea@gmail.com,
 linux-arm-kernel@lists.infradead.org, rjones@gateworks.com,
 gregkh@linuxfoundation.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 michael@walle.cc, zhang.lyra@gmail.com, baolin.wang7@gmail.com,
 mazziesaccount@gmail.com
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

An inverted mask register can be described more directly
as an unmask register.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/mfd/axp20x.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index 8161a5dc68e8..3be0d0aa8b34 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -506,8 +506,7 @@ static const struct regmap_irq_chip axp152_regmap_irq_chip = {
 	.name			= "axp152_irq_chip",
 	.status_base		= AXP152_IRQ1_STATE,
 	.ack_base		= AXP152_IRQ1_STATE,
-	.mask_base		= AXP152_IRQ1_EN,
-	.mask_invert		= true,
+	.unmask_base		= AXP152_IRQ1_EN,
 	.init_ack_masked	= true,
 	.irqs			= axp152_regmap_irqs,
 	.num_irqs		= ARRAY_SIZE(axp152_regmap_irqs),
@@ -518,8 +517,7 @@ static const struct regmap_irq_chip axp20x_regmap_irq_chip = {
 	.name			= "axp20x_irq_chip",
 	.status_base		= AXP20X_IRQ1_STATE,
 	.ack_base		= AXP20X_IRQ1_STATE,
-	.mask_base		= AXP20X_IRQ1_EN,
-	.mask_invert		= true,
+	.unmask_base		= AXP20X_IRQ1_EN,
 	.init_ack_masked	= true,
 	.irqs			= axp20x_regmap_irqs,
 	.num_irqs		= ARRAY_SIZE(axp20x_regmap_irqs),
@@ -531,8 +529,7 @@ static const struct regmap_irq_chip axp22x_regmap_irq_chip = {
 	.name			= "axp22x_irq_chip",
 	.status_base		= AXP20X_IRQ1_STATE,
 	.ack_base		= AXP20X_IRQ1_STATE,
-	.mask_base		= AXP20X_IRQ1_EN,
-	.mask_invert		= true,
+	.unmask_base		= AXP20X_IRQ1_EN,
 	.init_ack_masked	= true,
 	.irqs			= axp22x_regmap_irqs,
 	.num_irqs		= ARRAY_SIZE(axp22x_regmap_irqs),
@@ -543,8 +540,7 @@ static const struct regmap_irq_chip axp288_regmap_irq_chip = {
 	.name			= "axp288_irq_chip",
 	.status_base		= AXP20X_IRQ1_STATE,
 	.ack_base		= AXP20X_IRQ1_STATE,
-	.mask_base		= AXP20X_IRQ1_EN,
-	.mask_invert		= true,
+	.unmask_base		= AXP20X_IRQ1_EN,
 	.init_ack_masked	= true,
 	.irqs			= axp288_regmap_irqs,
 	.num_irqs		= ARRAY_SIZE(axp288_regmap_irqs),
@@ -556,8 +552,7 @@ static const struct regmap_irq_chip axp803_regmap_irq_chip = {
 	.name			= "axp803",
 	.status_base		= AXP20X_IRQ1_STATE,
 	.ack_base		= AXP20X_IRQ1_STATE,
-	.mask_base		= AXP20X_IRQ1_EN,
-	.mask_invert		= true,
+	.unmask_base		= AXP20X_IRQ1_EN,
 	.init_ack_masked	= true,
 	.irqs			= axp803_regmap_irqs,
 	.num_irqs		= ARRAY_SIZE(axp803_regmap_irqs),
@@ -568,8 +563,7 @@ static const struct regmap_irq_chip axp806_regmap_irq_chip = {
 	.name			= "axp806",
 	.status_base		= AXP20X_IRQ1_STATE,
 	.ack_base		= AXP20X_IRQ1_STATE,
-	.mask_base		= AXP20X_IRQ1_EN,
-	.mask_invert		= true,
+	.unmask_base		= AXP20X_IRQ1_EN,
 	.init_ack_masked	= true,
 	.irqs			= axp806_regmap_irqs,
 	.num_irqs		= ARRAY_SIZE(axp806_regmap_irqs),
@@ -580,8 +574,7 @@ static const struct regmap_irq_chip axp809_regmap_irq_chip = {
 	.name			= "axp809",
 	.status_base		= AXP20X_IRQ1_STATE,
 	.ack_base		= AXP20X_IRQ1_STATE,
-	.mask_base		= AXP20X_IRQ1_EN,
-	.mask_invert		= true,
+	.unmask_base		= AXP20X_IRQ1_EN,
 	.init_ack_masked	= true,
 	.irqs			= axp809_regmap_irqs,
 	.num_irqs		= ARRAY_SIZE(axp809_regmap_irqs),
-- 
2.35.1

