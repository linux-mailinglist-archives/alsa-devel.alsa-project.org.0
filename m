Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F9F554F63
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:34:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD9741F18;
	Wed, 22 Jun 2022 17:33:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD9741F18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655912045;
	bh=Xk1voGX+liHEb+NZMPIX7T2gTR1FlKHOj3NFh1i2EUI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XvQ0tdYScc5vmL6vzH7QV9NgpryDe3rrCSLEIADR1zmTwEEf2fzgCK7bH9O8jhS3V
	 7N2CBFDTdEhg+S3sMLIVt6NyT3h0P46CyD0R8RoIeIpzcofErWWr80vRGmSBnaC0PI
	 e5RtmP9YlQrWMMAdQdTs2LFuajvtEZ6Rtd9LnihQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DE59F8061D;
	Wed, 22 Jun 2022 17:23:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 371D8F804EB; Mon, 20 Jun 2022 22:07:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE52FF804D8
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 22:07:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE52FF804D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="JYv78xaE"
Received: by mail-wr1-x430.google.com with SMTP id c21so16101605wrb.1
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 13:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NcUaD1/hetXoR1Hr3zOaIrV5ibqb80WKTQCzVE8bVrc=;
 b=JYv78xaECQZTaj29SjmNHnhs4gfEEratnCgfJZagJJiK+EVif7vCkcuTP1QF0wfouK
 JhOxz5Q0vETS+bhO7JLSkwPttvHYnqkEyX3HWyCMGYjjskRlAQvkUsr5XtoBlAJVGwhM
 Gw+0xCBp9YPW230YKLPHGegCcK1UoKqqxF+q0NM7n1ss/f9b2tA03ELnh9lj8wNVqRiD
 p3oWRBH9z/0ejlWRohZ3vCWr/VL+wIvmrnrFxL5IVwRiWT8mfm+mPnriC/8/NBkGAEQT
 cw5lNfhGyRNeY0VAdg2EvhXglVeSK8bk4eq65rFbOML/1pGcXaRo+6lWO3/nbDyuiy/y
 5z2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NcUaD1/hetXoR1Hr3zOaIrV5ibqb80WKTQCzVE8bVrc=;
 b=JllhR564lXgb2+3B+ABw7o/Ha1dlbCjAeaxCsSV1Pe/y8isDypmOxbjzWbeH0mbZGj
 wO5ENYii0GtbtAR4aTf0G7YgwaE6XlGmDTV+hP+2WfMfxLIKSZ/4a8QPFTwiTK2WnAP3
 HUlWUvEcrOrmWEagp5XDM01Zc0hAYWxFbbz+JV6WUQadBMMHnGS7ZXpwMmeUvc7nVtm6
 Ghvbrpwi3l+TJZ0AhDPf4KSi8Ul8DfJFxbd+8w9zrA0T673Lrc5/m64Rwj4pj9hJ14l/
 u+YDKUZykJSlDeJygJc6tiBGlRqoD+S0QzMgB6pef4XrT3Hwi0bbzdH94MtodHMm93V/
 is4Q==
X-Gm-Message-State: AJIora97FQsrtAPb8vCanxKQJz7KcIqzTTFZNpI83YDUOikL1QBete3m
 lSQKCeiMsRlhUndwsluH9+E=
X-Google-Smtp-Source: AGRyM1t6EjGq1Ksd7MyVDLpDLClD84TIjP3RmrRekqAiittfXcb8Cp1PUoN9E0quIHfglyDXxzFsVA==
X-Received: by 2002:a5d:4601:0:b0:21b:9035:d295 with SMTP id
 t1-20020a5d4601000000b0021b9035d295mr6103622wrq.63.1655755637616; 
 Mon, 20 Jun 2022 13:07:17 -0700 (PDT)
Received: from localhost (92.40.169.63.threembb.co.uk. [92.40.169.63])
 by smtp.gmail.com with ESMTPSA id
 m42-20020a05600c3b2a00b003973435c517sm16572141wms.0.2022.06.20.13.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 13:07:17 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 39/49] gpio: sl28cpld: replace irqchip mask_invert with
 unmask_base
Date: Mon, 20 Jun 2022 21:06:34 +0100
Message-Id: <20220620200644.1961936-40-aidanmacdonald.0x0@gmail.com>
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
 drivers/gpio/gpio-sl28cpld.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-sl28cpld.c b/drivers/gpio/gpio-sl28cpld.c
index 52404736ac86..2195f88c2048 100644
--- a/drivers/gpio/gpio-sl28cpld.c
+++ b/drivers/gpio/gpio-sl28cpld.c
@@ -70,8 +70,7 @@ static int sl28cpld_gpio_irq_init(struct platform_device *pdev,
 	irq_chip->num_irqs = ARRAY_SIZE(sl28cpld_gpio_irqs);
 	irq_chip->num_regs = 1;
 	irq_chip->status_base = base + GPIO_REG_IP;
-	irq_chip->mask_base = base + GPIO_REG_IE;
-	irq_chip->mask_invert = true;
+	irq_chip->unmask_base = base + GPIO_REG_IE;
 	irq_chip->ack_base = base + GPIO_REG_IP;
 
 	ret = devm_regmap_add_irq_chip_fwnode(dev, dev_fwnode(dev),
-- 
2.35.1

