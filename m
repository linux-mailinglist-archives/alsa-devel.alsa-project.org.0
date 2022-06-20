Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4099D554F4B
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:29:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB4BF1FC5;
	Wed, 22 Jun 2022 17:29:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB4BF1FC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655911793;
	bh=nqza5eL39EyJGclZOlMd2YpPeyNIXN31cw7wq5nyyLU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W+Mtxlwsox/2Tq/Dj6u9ZqI1AIFKOwkN+pL3w8kwk3H1tXoET8Q0OMXsaVtTpnTcb
	 XySHqHkbkPHXx5gFa3z4byF29ONFt7sBIXetFsOrvHhowU2QqVvoQxV0uRCFL/j+3O
	 41X1yGp6lKTOtNo2uJsu8bCfLBMaQmXzp3CWBdqg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C89CF805DF;
	Wed, 22 Jun 2022 17:23:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B930F804DA; Mon, 20 Jun 2022 22:06:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79B4CF804D2
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 22:06:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79B4CF804D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fwpJrSBM"
Received: by mail-wr1-x42f.google.com with SMTP id s1so16072728wra.9
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 13:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/LPf9h09XUJR/z/RdQdPV0VQS/kTyakjP+1OAofeWXA=;
 b=fwpJrSBMfmFPeeNXJrlpjWlkFshzFm6Y1DWOVq+h4L71A/9e1R5aHmopQ9JlXAYX77
 p/aPMsuwp0jXJ6JA/lErm+8RcPw1nwj/qzcNe82rYLGJJE87iMHlnWgUuO98N/3+uLWl
 HoFIstzlvMDtCLgfhnOriWLoNwZv6+3clTJtgU5AJImo5hzLcA8Xl5biIy+qCPN0Yl2h
 sSZ3MIekuF7sfDNA5dosij4OPFFY4DXnc1sarY9jKvYuFBzZIvgCKpyr0XlJB/Ymar7p
 76Xyx3zNFdDnkRRyU54ZBIwLy/ubU9zZyaI0NzK9C8RtA20uucTc0zHujNOvDTsjWaG+
 UbTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/LPf9h09XUJR/z/RdQdPV0VQS/kTyakjP+1OAofeWXA=;
 b=XLTbOLtuAipcqytqweZgrPydtbWwc3jxJgBemtah6JG/CRrIGKEOtA+OyI/lTzWxlg
 YPhfHTDvgIa5QRMWlInXe/J2OdYqvbLn84Utz1gYRKtKrxYSqtjlUWagsm7wnBrk1Vd4
 jG4ha8pdpGNXUOfAkyDCgQXG8rBpLxuO4HX020Je2KtAP/zcmRyNDepjWYHv3/siG28i
 kNAye/ca+MJzZLg7d+HkwJGjnY2n5y9L+Ub6NiM3R2cLIxM6Jmeok4rL9XqqGN6P/oPW
 oksgiTil9iah6WNBhvXyEsLYh3xKhNPJShr9Wua/DnUzpHFGJGstFdsAr8lSn8yjpGDb
 YA2w==
X-Gm-Message-State: AJIora9eDnFMTqekpUshQ6lzGG3U/p0SwmPEDoVw2bzlt7tpvthu2ctW
 2cX1Nx6+xVRrBcDC9BpSZmc=
X-Google-Smtp-Source: AGRyM1saqWHhZeAqgNDua/lIIE8QUgq+ce7t9oCt2daRUSekH7GNKx27L1qwZwbxMxNYwR5edglGYw==
X-Received: by 2002:a05:6000:156c:b0:218:5691:e72b with SMTP id
 12-20020a056000156c00b002185691e72bmr24333023wrz.95.1655755612132; 
 Mon, 20 Jun 2022 13:06:52 -0700 (PDT)
Received: from localhost (92.40.169.63.threembb.co.uk. [92.40.169.63])
 by smtp.gmail.com with ESMTPSA id
 h17-20020a05600c2cb100b00397393419e3sm20418814wmc.28.2022.06.20.13.06.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 13:06:51 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 24/49] mfd: rt5033: replace irqchip mask_invert with
 unmask_base
Date: Mon, 20 Jun 2022 21:06:19 +0100
Message-Id: <20220620200644.1961936-25-aidanmacdonald.0x0@gmail.com>
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
 drivers/mfd/rt5033.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mfd/rt5033.c b/drivers/mfd/rt5033.c
index f1236a9acf30..dc9bf4057a09 100644
--- a/drivers/mfd/rt5033.c
+++ b/drivers/mfd/rt5033.c
@@ -29,8 +29,7 @@ static const struct regmap_irq rt5033_irqs[] = {
 static const struct regmap_irq_chip rt5033_irq_chip = {
 	.name		= "rt5033",
 	.status_base	= RT5033_REG_PMIC_IRQ_STAT,
-	.mask_base	= RT5033_REG_PMIC_IRQ_CTRL,
-	.mask_invert	= true,
+	.unmask_base	= RT5033_REG_PMIC_IRQ_CTRL,
 	.num_regs	= 1,
 	.irqs		= rt5033_irqs,
 	.num_irqs	= ARRAY_SIZE(rt5033_irqs),
-- 
2.35.1

