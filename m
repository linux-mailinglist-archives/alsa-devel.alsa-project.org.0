Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F708554F4D
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:30:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1656F1FE2;
	Wed, 22 Jun 2022 17:29:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1656F1FE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655911826;
	bh=ty9T/Yw/+FlBfdOoovses7WGNdhWnvNh/vt5gAcIEt4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lbhFfA9PluT/6AfAiFpiVuPWdUj/Vt/fuimnr7xPLb3kY22QaPHnRziflKvfYJacl
	 eoQsKX+kcdL+mnA85T0AQtKBC3oB/oGZqjWOALNpQ+6ARjbkQEdFb6Xw1Be3GXRADx
	 DxRk0GXWh9GwQLbj1mazBPu/xVyf+tXWdvTFcMa0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1AB4F805E3;
	Wed, 22 Jun 2022 17:23:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 108F7F804D2; Mon, 20 Jun 2022 22:06:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B18E5F800CB
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 22:06:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B18E5F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="nSss6m1i"
Received: by mail-wm1-x32c.google.com with SMTP id
 m125-20020a1ca383000000b0039c63fe5f64so6210561wme.0
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 13:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=83f6yOVGHF33wbJFNUqHVsMRQC83Nm7l3Jffulf5Q20=;
 b=nSss6m1iZMp9y7Vv5974YLuhhJUZ614v32RzAfng7nP1DgOtE0Apdk3S4hwIYaOcx1
 golYgrNSS7bRWfwoAUSA5Og7WysO98jLMv2W9IlYLvHZnPWxMcZHBnXlEYNbFGYXAe4h
 zkX/QFUpTqAkwk57wIfRoBajgsGcPIRZsVFEZEBTCfHJUtpgAuIwl1tCoiFICvSGYFcM
 iW1sdZy6IBsByUO4a0aRbsf/NzuzhMMy7unrWxcauagegTS75O7aSHLZgHRYpLH0BAZ+
 4ZZseSMNKYwbZHqZFgQqC8T4HX4zh6g3gg0Rzx4vx6r8K2qxxQIrzGRKLh03m3NFkovC
 6bHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=83f6yOVGHF33wbJFNUqHVsMRQC83Nm7l3Jffulf5Q20=;
 b=3BUm5gSFL71WS6Epzq0Wgs3U4kJbdizjdkmRSbTaOj5F5myawl8t9eH2CWibx9hFMS
 RgU5+QjPF9cQeLvNQ8CycSv83NpegJI25jS9fZAKdTA5NhHc8QciJSJumcJZxEgTxkeP
 8xRPz1CIR/CdVViRMeXwjUTS1JcWKBD5GH+3yIYlzgtJ6UtDmCO+qHjL6Xo8nLefLomv
 HG8sPi/j5FIyTSoIzmjttE+iv67ypY5+y1I2jMqxdJ1oodqT9wPKa7r3vRZD6QExnim2
 LzWTpkFbglzrpZq1wTCR+D6kc4CCYbeYiaiGy2m6N3ToA9dqeelI2WAtNSPSQHE2X7iB
 g44w==
X-Gm-Message-State: AOAM5306grEQBjAenuPAR3Bk5YtLGgNsHixmSkwqdcq5Kj77JwNS161O
 lv4JUHKi7orQK6+LF+I6fsU=
X-Google-Smtp-Source: ABdhPJy5hxDd4tBIdG/h7CHZ7zMWEzJh0oBujvFGRYSxBfUs0KG9/aftZhFj9CMuaUDM6O3W6BLpoA==
X-Received: by 2002:a05:600c:1547:b0:39c:7fc6:3082 with SMTP id
 f7-20020a05600c154700b0039c7fc63082mr36832709wmg.189.1655755610410; 
 Mon, 20 Jun 2022 13:06:50 -0700 (PDT)
Received: from localhost (92.40.169.63.threembb.co.uk. [92.40.169.63])
 by smtp.gmail.com with ESMTPSA id
 cl10-20020a5d5f0a000000b0021b92171d28sm3418468wrb.54.2022.06.20.13.06.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 13:06:50 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 23/49] mfd: sprd-sc27xx-spi: replace irqchip mask_invert with
 unmask_base
Date: Mon, 20 Jun 2022 21:06:18 +0100
Message-Id: <20220620200644.1961936-24-aidanmacdonald.0x0@gmail.com>
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
 drivers/mfd/sprd-sc27xx-spi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mfd/sprd-sc27xx-spi.c b/drivers/mfd/sprd-sc27xx-spi.c
index d05a47c5187f..a4a9b81a952b 100644
--- a/drivers/mfd/sprd-sc27xx-spi.c
+++ b/drivers/mfd/sprd-sc27xx-spi.c
@@ -181,11 +181,10 @@ static int sprd_pmic_probe(struct spi_device *spi)
 	ddata->irq_chip.name = dev_name(&spi->dev);
 	ddata->irq_chip.status_base =
 		pdata->irq_base + SPRD_PMIC_INT_MASK_STATUS;
-	ddata->irq_chip.mask_base = pdata->irq_base + SPRD_PMIC_INT_EN;
+	ddata->irq_chip.unmask_base = pdata->irq_base + SPRD_PMIC_INT_EN;
 	ddata->irq_chip.ack_base = 0;
 	ddata->irq_chip.num_regs = 1;
 	ddata->irq_chip.num_irqs = pdata->num_irqs;
-	ddata->irq_chip.mask_invert = true;
 
 	ddata->irqs = devm_kcalloc(&spi->dev,
 				   pdata->num_irqs, sizeof(struct regmap_irq),
-- 
2.35.1

