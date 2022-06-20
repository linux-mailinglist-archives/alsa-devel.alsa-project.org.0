Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CC1554F0D
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:24:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A75CC1EFE;
	Wed, 22 Jun 2022 17:23:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A75CC1EFE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655911451;
	bh=BGjVD/pvTwOsdPF3ZKgAKvEKqE0G2mBJjFqkBY5e7jw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WrEuJZJHgBygrdViN830DEBiKSnqKSKyg0CyNJ2UBjceYbD+XQAGsiVlZMB8AQh4j
	 RW0Td1Yej7oRt9c6tJOtAyyly0UW0AJYIaMFJL6EC31ve0Kw0w4egwoJAhbm497ZOv
	 8i5XmMw5JjYQgq+QBsJ3cf7xwFdDmcmfMoHaptDw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44523F800CB;
	Wed, 22 Jun 2022 17:23:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47090F804E5; Mon, 20 Jun 2022 22:06:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DA5DF800E3
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 22:06:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DA5DF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="paYIdrfs"
Received: by mail-wr1-x434.google.com with SMTP id n1so15841819wrg.12
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 13:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8yaggp5fpGj18LvMF3HyT2CJ/UUMH+aDaQflQSqacJg=;
 b=paYIdrfsy1HcKjFG3USjGArwLlnXJ403FKBZEPKprh1PE/RRI93VAPiwepWUj+Ro7c
 ENC61PGASfcrY+pgOAuseMs4lQ6AScSKlCWwru9Ljvgf7pC4KMSA0bK4eGu3OCxV7qm5
 wgVWfAf3vE7WG0I2f3RsPT0dXYiyX6GqnUHQvuabUHTfmg5nJMNWCtH5ZMzBwNs25wX4
 t9E8oLF5DpWG+D3DpftCIf9mTSQJxDqoYaVCZhTgCuJRmMfUgjPLjlE/ERIuOv1UJLCy
 WClaj8RTIGJTGfmnGr90xpS3FB0zska6QllBOTUIBV7q3LzA4TCoQEqAIklVfUSlFkfB
 OuMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8yaggp5fpGj18LvMF3HyT2CJ/UUMH+aDaQflQSqacJg=;
 b=5qDPnHjL3Fz4PpBF1NYSxnzL/VqcqPYZiGJW9t04yCCkl5npoG6lKzg7hjoY7+yZn8
 0zgLDqwRowTl4A5VefQpKcSrdYm+WYSmoHdlei7f3jQ0Rjub61pZ/1n6N6mw6OaR1gcz
 Xz8VXPTQ80dmjtjT3FhQh6xU0DhPCEOeBYJZDV8FXhJlz0TPtgUhQBaWXlz+Nf5LTXjV
 BTzaOSXGDTbeA5tS8rAVCTFWVhJLIHjVSwrtZrphLysGrAaph+77/rTJY0Iy+My2vyKV
 dTvwuZJWSFvbi9FisW31o4tBoJvzu24AZeZN5JYZZLKgy1VcYxYJeaJhdi2eDFQvTdcC
 8lDg==
X-Gm-Message-State: AJIora+gbUli6hjuv6bLAK9+GDYvmI5x3l3/fQPheuCQPFH0VdilBiHI
 08CfPNOGJJ0VDpEjeiYU7CA=
X-Google-Smtp-Source: AGRyM1tqaOvSQ7Sb2fsCdfhlkOWzq8CIvRvGO9y9U1DjiSWuL/0J+/imI8fVxdWC8klmC3T0EKcKBg==
X-Received: by 2002:adf:fec2:0:b0:21a:6cff:a4f1 with SMTP id
 q2-20020adffec2000000b0021a6cffa4f1mr18314590wrs.139.1655755576525; 
 Mon, 20 Jun 2022 13:06:16 -0700 (PDT)
Received: from localhost (92.40.169.68.threembb.co.uk. [92.40.169.68])
 by smtp.gmail.com with ESMTPSA id
 p14-20020a5d48ce000000b0021020517639sm14093823wrs.102.2022.06.20.13.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 13:06:16 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 01/49] regmap-irq: Fix a bug in regmap_irq_enable() for
 type_in_mask chips
Date: Mon, 20 Jun 2022 21:05:56 +0100
Message-Id: <20220620200644.1961936-2-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 22 Jun 2022 17:23:17 +0200
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

When enabling a type_in_mask irq, the type_buf contents must be
AND'd with the mask of the IRQ we're enabling to avoid enabling
other IRQs by accident, which can happen if several type_in_mask
irqs share a mask register.

Fixes: bc998a730367 ("regmap: irq: handle HW using separate rising/falling edge interrupts")
Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/base/regmap/regmap-irq.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-irq.c
index 400c7412a7dc..4f785bc7981c 100644
--- a/drivers/base/regmap/regmap-irq.c
+++ b/drivers/base/regmap/regmap-irq.c
@@ -252,6 +252,7 @@ static void regmap_irq_enable(struct irq_data *data)
 	struct regmap_irq_chip_data *d = irq_data_get_irq_chip_data(data);
 	struct regmap *map = d->map;
 	const struct regmap_irq *irq_data = irq_to_regmap_irq(d, data->hwirq);
+	unsigned int reg = irq_data->reg_offset / map->reg_stride;
 	unsigned int mask, type;
 
 	type = irq_data->type.type_falling_val | irq_data->type.type_rising_val;
@@ -268,14 +269,14 @@ static void regmap_irq_enable(struct irq_data *data)
 	 * at the corresponding offset in regmap_irq_set_type().
 	 */
 	if (d->chip->type_in_mask && type)
-		mask = d->type_buf[irq_data->reg_offset / map->reg_stride];
+		mask = d->type_buf[reg] & irq_data->mask;
 	else
 		mask = irq_data->mask;
 
 	if (d->chip->clear_on_unmask)
 		d->clear_status = true;
 
-	d->mask_buf[irq_data->reg_offset / map->reg_stride] &= ~mask;
+	d->mask_buf[reg] &= ~mask;
 }
 
 static void regmap_irq_disable(struct irq_data *data)
-- 
2.35.1

