Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C85554F15
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:25:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4585C1EE8;
	Wed, 22 Jun 2022 17:24:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4585C1EE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655911510;
	bh=NcXpNtH+Jlgb6PTV7lsYU3FWa8/XgfjPnJFkV560tBk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ls4n8SrXuTvhbhQU6r23ACFNPBvx95I8LycQguv/+QFL8pGStwjMQtSsIsVDxukOs
	 TLP7ks9D4Afqwdb/4qCshLdMjxJ0IGtn00xv3QFtIDO4B7ZM5Ja7SII2qm92MdWeYC
	 779RjSXwDyW669P9on06jRWEpxDDt8zadRh4FrWs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C138CF80543;
	Wed, 22 Jun 2022 17:23:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 416E8F80536; Mon, 20 Jun 2022 22:06:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75D46F800CB
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 22:06:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75D46F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="M57wXO9i"
Received: by mail-wm1-x32a.google.com with SMTP id
 p6-20020a05600c1d8600b0039c630b8d96so6919401wms.1
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 13:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wkuS+j3EIennvsLgZYGM7vfpABGRVV/MeAPfOizAshw=;
 b=M57wXO9iRmAgu6U0WPasocwyW6YC4HvS/IJuioNN538vnmyv29ll0KmRtJRGqY4itN
 I5gbLCbLPlKHq7ZNuKC0QkXblcjbrochyZFlSuHnjjhoHPPr1Vg/TNn/mngewPIWO169
 E27kNJdVJV3Q769UkEnpR1Oh4c69WClUwfdfkWm6pR4le2OgBRbLQJrUBMFotv/eASj1
 YU0JLn4khTyo1PQcOGGFf4AknS/GI3pTm1R4xxZ86sjh87yWudtYtwnb4CMZDPW1zXwd
 CLfvknNTNJG/K6TH6GcO0gCA7f0ytehD0u7KI3rLDYx1D5YiPv3fyPkopDKkyw4YaySB
 j/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wkuS+j3EIennvsLgZYGM7vfpABGRVV/MeAPfOizAshw=;
 b=gQFeGwvbQP5GfyGk5BIgBv/i1cMmiey1QcORwWKZTZqw4cVPraVxV4kXSTCBRmjJd2
 +pfAW1F93SHoWNY2Uzk0jjpkZD8FmWiF9ne2TTwZPgvmJ/sBa62Uy49S9scuXZePup1b
 tULeF0y4jhDI802Vo/TC2/NGAmEzduBH2js0EMJnU5B5FNTQGHFfv8GAo0Rk4XBzdO+3
 TYC+4C9CNokc7WeZSspSTfV5jFaLdH83EujYiNqGe3WiImA2UmtMyTu/TkUhk9RH1pL7
 xVLQpcLwT70x4z6QTpr4GfJFc0uNDasdMVX05EHxWL5wn73AJEvdsqFA5XRmExbBisMz
 AmpA==
X-Gm-Message-State: AJIora9V6e0/nMVI8Bx9PkNXTMJwWTg0QTLyx+flD2zsi/s91r3j0kTl
 1lHRNLxv2lqvLcKYfO/xcDY=
X-Google-Smtp-Source: AGRyM1uEEMAc+8FJxLc/mlb8t301IgpWCnjiYLUqgY6m1IDXCYaAeszmfVIolkVxg0Mtj7p66FG3gQ==
X-Received: by 2002:a05:600c:5112:b0:397:53f5:e15b with SMTP id
 o18-20020a05600c511200b0039753f5e15bmr26724095wms.93.1655755584181; 
 Mon, 20 Jun 2022 13:06:24 -0700 (PDT)
Received: from localhost (92.40.169.68.threembb.co.uk. [92.40.169.68])
 by smtp.gmail.com with ESMTPSA id
 t22-20020a05600c41d600b0039db7f1a3f5sm15482666wmh.45.2022.06.20.13.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 13:06:23 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 06/49] mfd: wcd934x: Convert irq chip to config regs
Date: Mon, 20 Jun 2022 21:06:01 +0100
Message-Id: <20220620200644.1961936-7-aidanmacdonald.0x0@gmail.com>
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

Switch the driver to config registers. This will allow the old
type register code in regmap-irq to be removed.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/mfd/wcd934x.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/wcd934x.c b/drivers/mfd/wcd934x.c
index 68e2fa2fda99..07e884087f2c 100644
--- a/drivers/mfd/wcd934x.c
+++ b/drivers/mfd/wcd934x.c
@@ -55,17 +55,22 @@ static const struct regmap_irq wcd934x_irqs[] = {
 	WCD934X_REGMAP_IRQ_REG(WCD934X_IRQ_SOUNDWIRE, 2, BIT(4)),
 };
 
+static const unsigned int wcd934x_config_regs[] = {
+	WCD934X_INTR_LEVEL0,
+};
+
 static const struct regmap_irq_chip wcd934x_regmap_irq_chip = {
 	.name = "wcd934x_irq",
 	.status_base = WCD934X_INTR_PIN1_STATUS0,
 	.mask_base = WCD934X_INTR_PIN1_MASK0,
 	.ack_base = WCD934X_INTR_PIN1_CLEAR0,
-	.type_base = WCD934X_INTR_LEVEL0,
-	.num_type_reg = 4,
-	.type_in_mask = false,
 	.num_regs = 4,
 	.irqs = wcd934x_irqs,
 	.num_irqs = ARRAY_SIZE(wcd934x_irqs),
+	.config_base = wcd934x_config_regs,
+	.num_config_bases = ARRAY_SIZE(wcd934x_config_regs),
+	.num_config_regs = 4,
+	.set_type_config = regmap_irq_set_type_config_simple,
 };
 
 static bool wcd934x_is_volatile_register(struct device *dev, unsigned int reg)
-- 
2.35.1

