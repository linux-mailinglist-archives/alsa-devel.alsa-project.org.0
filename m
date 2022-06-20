Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E759D554F51
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:30:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 893701FBD;
	Wed, 22 Jun 2022 17:29:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 893701FBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655911840;
	bh=dQbuzEPrCnmyUo8+GPhQvJ8bO0NeLYXJv7L8sBLWYXM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=umTmK3mLwz1mUmKfEP0KHbPGCJc4Lf9ZxieDU9XgBmQcATTHn0G/6SsZFfN4IheO8
	 sdExbjf7dpU81n8GwpJM3kAwLIRi0AQrl876ocEpeezpyD7wdyA07101PoSJAi4zeM
	 mh96n6hXkVyGEXEVkAZneZm2CW4Q8845yOpfLKa0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F0D4F805EA;
	Wed, 22 Jun 2022 17:23:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2695BF804DA; Mon, 20 Jun 2022 22:06:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0EAA4F804D8
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 22:06:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EAA4F804D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="n+dv2OHy"
Received: by mail-wr1-x42a.google.com with SMTP id o8so16102621wro.3
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 13:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gBD4FGBJfr7WfKu1UZU1bV8IB7E8/qXlLxTviEK1Akg=;
 b=n+dv2OHyeLcXNTmM5AoQ5y71hnTNJIpcERPeXRAZGzH3I/VENsQCVHYqLkDxbEjmN/
 TTkfawWz7sGx1fEvNmiL1zWs5fqtd8PmEYJ/uuxwTzmlN3TNWDIjfT7h7X2oiiCeJDJo
 G0D3xiO8ep0dRDPxWfA7mglV2rl0lfdiXs/NgfHf3uClxo2T0zSzKmcugT014uVsbBA4
 a8d72hUTWqP7aMSTkN4E6jMQH1AsJpvanWTcr/TzYICesUohxeYCLmlbHF8Or3sDiq5E
 ReozveZPFU1OGId9YBAanmpEq2oZ6/HDOKmehZPgromaOnVKCB0W7RktevOubR0I+UbT
 T3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gBD4FGBJfr7WfKu1UZU1bV8IB7E8/qXlLxTviEK1Akg=;
 b=rdQrxtMunSQsHI4+68Dh687w3h2d/Z07VWMH5SOzoy0nwDkaTE5z9v5nLu/6pLH7QF
 TtwSpJzYEoDoiyEOz5Re+9weqLyBw1bo1NECPZ1WhE1UGNjOiV/99+42y2LI6K3bu/ow
 /9D2Nbb6CZgDkD3REPwJpKhEgvAAHhj3Mfqa5oysbjM3zNSbKwe113UkxTA/aIcDKXhe
 HiUoM5QmQbi4Nqs4M9yM4HmzwXtQr/8/M1nJ3Xig2cAldUOqqRNb1i0uh3bnHPstRVF9
 6jxKLQN6ufgJsmVMPFF+OUU5+33cyedmkz7qYzGYXeSdYk8hVH2ZMi+vkwmlNJ7WPyy1
 PAQA==
X-Gm-Message-State: AJIora8ptatrOE1sEFTx4x+76NF5mFhHIBScp+8edCCAtEZB/yDvHYZz
 t4/92NXlN9iI96ZsKXRxbX8=
X-Google-Smtp-Source: AGRyM1ueeTVj4W+irPUqcFh4aibJZGRQv0luVUmTWKHSamp2328uXg/JWH281sGfd9zcwAAoGkXCMQ==
X-Received: by 2002:adf:ae09:0:b0:20e:e4f0:2133 with SMTP id
 x9-20020adfae09000000b0020ee4f02133mr24684442wrc.104.1655755608969; 
 Mon, 20 Jun 2022 13:06:48 -0700 (PDT)
Received: from localhost (92.40.169.68.threembb.co.uk. [92.40.169.68])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a05600c4f0900b0039db500714fsm16981828wmq.6.2022.06.20.13.06.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 13:06:48 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 22/49] mfd: sun4i-gpadc: replace irqchip mask_invert with
 unmask_base
Date: Mon, 20 Jun 2022 21:06:17 +0100
Message-Id: <20220620200644.1961936-23-aidanmacdonald.0x0@gmail.com>
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
 drivers/mfd/sun4i-gpadc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mfd/sun4i-gpadc.c b/drivers/mfd/sun4i-gpadc.c
index cfe14d9bf6dc..edc180d83a4b 100644
--- a/drivers/mfd/sun4i-gpadc.c
+++ b/drivers/mfd/sun4i-gpadc.c
@@ -34,9 +34,8 @@ static const struct regmap_irq_chip sun4i_gpadc_regmap_irq_chip = {
 	.name = "sun4i_gpadc_irq_chip",
 	.status_base = SUN4I_GPADC_INT_FIFOS,
 	.ack_base = SUN4I_GPADC_INT_FIFOS,
-	.mask_base = SUN4I_GPADC_INT_FIFOC,
+	.unmask_base = SUN4I_GPADC_INT_FIFOC,
 	.init_ack_masked = true,
-	.mask_invert = true,
 	.irqs = sun4i_gpadc_regmap_irq,
 	.num_irqs = ARRAY_SIZE(sun4i_gpadc_regmap_irq),
 	.num_regs = 1,
-- 
2.35.1

