Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1B9554F58
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:31:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8985A1FC5;
	Wed, 22 Jun 2022 17:31:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8985A1FC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655911919;
	bh=SFZNB8HayJRHL0y+PWWM20xCeWQBqhpQ4qoaeFCM6YM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JEjZ84wGVr3W5j2jyRi8CV2ZnSyXyCQcN4oNkEL/j+9kBkvivKjonAaClffJMW9cP
	 I4WZhKRR/oYY45fKZvLIcnXmiJJWmT/fx6qv+glD395EAnfB+NQy51LBY0qtzpDFkf
	 EDbhGQrE+EFe625sGC2Ju65L/JhM4DcRXZrj2KH4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BC1DF80600;
	Wed, 22 Jun 2022 17:23:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBB81F804E7; Mon, 20 Jun 2022 22:07:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41077F804D2
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 22:07:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41077F804D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YUh2vwUe"
Received: by mail-wr1-x430.google.com with SMTP id c21so16101605wrb.1
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 13:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZcPkw+2A0TirCszPgnJO/5hF80h/wPfz0UaGX/pzVNI=;
 b=YUh2vwUeEXYDwtve+jVQfFl/6YVNWOAIVPUr1zYo+eBFnt9qJmC1h396Dttl7iu30W
 T72agxhnODuQPA8wHq5CHifcFd5EYVPC81+/j6s3ZgCRoDUYDCUbMpGVtQaRNLiaLhXU
 QS7EQhrRacil71DsUOvOaEFN+yfud+SolFp7Hf2wlPmira1TuVu6HCLacmYuzkt+UPQb
 bPCP9Nd0N9XVELIGM6wkT1GXzJBi+jeHMnmCZodJcOgIJ9vYksE0uAGXSIdYbQeh2PqF
 +cI6sb+kfTRmzuH9SSOuiNNkX6Hp5p/7pz3QkKp8eK0vNx1bCJy5JNTFMNDMA1rl8oN7
 47+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZcPkw+2A0TirCszPgnJO/5hF80h/wPfz0UaGX/pzVNI=;
 b=iTy5UpCVKBjwdetd8zMJ8WhEomkkvj/clYr0YmOLwSYjnJxbgd6kCd/bxWEwG0APhT
 h4AbXTSngn6NwzYDYVBCYE2xe7WyommArTArFjOvODz7zBStzM6fTr3ihB+83qRUeq7E
 WsNCVgAxhXMQBCD15Nt5PQCE7aDiX/+Hoeage7bJb+V3AeGDp5LwgxQ2SLmuXtHyuIfl
 gHTHmxafkNwfVQkxh6ZgVqwyXW49x1rL6xFkNOehAdtyYx+4JXpNds3gieORoUzSWTyt
 +SLRHciRV2fnGN5+LlLHzki1t6z6R7R/O37higlJHI50ufxSNuA8MPJpjkjRZtA5WYBN
 G+2A==
X-Gm-Message-State: AJIora+GU3fH7bOMNgGOlrM/tE11tQBvjoU3g+nU/eNwH0HE7cB6vopO
 2bR52WOucrfdxfjhNX9JZpE=
X-Google-Smtp-Source: AGRyM1tZaUeEpnuzhwhw1Ih5MayJo7jRJMhj09tZrXjkTYjWA5UlXO8ZylD5FlAGiFfie+sPuTumpQ==
X-Received: by 2002:a5d:5a94:0:b0:218:531a:eea with SMTP id
 bp20-20020a5d5a94000000b00218531a0eeamr24344542wrb.703.1655755625880; 
 Mon, 20 Jun 2022 13:07:05 -0700 (PDT)
Received: from localhost (92.40.169.63.threembb.co.uk. [92.40.169.63])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a5d4d06000000b0021a3dd1c5d5sm11711267wrt.96.2022.06.20.13.07.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 13:07:05 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 32/49] mfd: max77693: replace irqchip mask_invert with
 unmask_base
Date: Mon, 20 Jun 2022 21:06:27 +0100
Message-Id: <20220620200644.1961936-33-aidanmacdonald.0x0@gmail.com>
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

Also drop useless mask_invert flag from other irq chips.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/mfd/max77693.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/mfd/max77693.c b/drivers/mfd/max77693.c
index 4e6244e17559..fadea37b97cc 100644
--- a/drivers/mfd/max77693.c
+++ b/drivers/mfd/max77693.c
@@ -66,7 +66,6 @@ static const struct regmap_irq_chip max77693_led_irq_chip = {
 	.name			= "max77693-led",
 	.status_base		= MAX77693_LED_REG_FLASH_INT,
 	.mask_base		= MAX77693_LED_REG_FLASH_INT_MASK,
-	.mask_invert		= false,
 	.num_regs		= 1,
 	.irqs			= max77693_led_irqs,
 	.num_irqs		= ARRAY_SIZE(max77693_led_irqs),
@@ -82,7 +81,6 @@ static const struct regmap_irq_chip max77693_topsys_irq_chip = {
 	.name			= "max77693-topsys",
 	.status_base		= MAX77693_PMIC_REG_TOPSYS_INT,
 	.mask_base		= MAX77693_PMIC_REG_TOPSYS_INT_MASK,
-	.mask_invert		= false,
 	.num_regs		= 1,
 	.irqs			= max77693_topsys_irqs,
 	.num_irqs		= ARRAY_SIZE(max77693_topsys_irqs),
@@ -100,7 +98,6 @@ static const struct regmap_irq_chip max77693_charger_irq_chip = {
 	.name			= "max77693-charger",
 	.status_base		= MAX77693_CHG_REG_CHG_INT,
 	.mask_base		= MAX77693_CHG_REG_CHG_INT_MASK,
-	.mask_invert		= false,
 	.num_regs		= 1,
 	.irqs			= max77693_charger_irqs,
 	.num_irqs		= ARRAY_SIZE(max77693_charger_irqs),
@@ -136,8 +133,7 @@ static const struct regmap_irq max77693_muic_irqs[] = {
 static const struct regmap_irq_chip max77693_muic_irq_chip = {
 	.name			= "max77693-muic",
 	.status_base		= MAX77693_MUIC_REG_INT1,
-	.mask_base		= MAX77693_MUIC_REG_INTMASK1,
-	.mask_invert		= true,
+	.unmask_base		= MAX77693_MUIC_REG_INTMASK1,
 	.num_regs		= 3,
 	.irqs			= max77693_muic_irqs,
 	.num_irqs		= ARRAY_SIZE(max77693_muic_irqs),
-- 
2.35.1

