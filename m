Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A584554F5B
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:32:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FB43200B;
	Wed, 22 Jun 2022 17:31:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FB43200B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655911967;
	bh=5U5L11rCWyBgJVVcS+L8bHmJeFeWLj/aqnTHoPwfSCM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P93NLTQyIFVZ3wAb34Moxh1AF6xnooqdXqzk6JA2Nda1/VmDY0AzYVC7OuQzz/cP9
	 c3HGPY/TAw2SGMAOWRTaOjiH1uPu1CFuV4wkPJRYRIhG22a1laXMLz0BUhmgiC+1gA
	 7j0UbU2aJx7tMPJI4F/84+DLofBqqzBmMuNCWfS8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5310CF804AC;
	Wed, 22 Jun 2022 17:23:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A3E6F800E3; Mon, 20 Jun 2022 22:07:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,SPF_HELO_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C803F804D8
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 22:07:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C803F804D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qBJcC0Lr"
Received: by mail-wm1-x32c.google.com with SMTP id
 m125-20020a1ca383000000b0039c63fe5f64so6210561wme.0
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 13:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rzfzyKEVoJaKFIv88YU1vTCrVQJBpK7ii1ptmDvGvSE=;
 b=qBJcC0LrxQSAdxyKj5Dt7HUFUmjMISoYgjBHUUClNbIz3vAp9h4I6Lqto2o/8nRZZx
 +mUtIMCKQ+xDXPL3Fzv7A9LsfxQhVJy+J3jisVRnKW/heO0ptBVZJfGA10gsSJrLxZO+
 MObbJW6hGStsGnZRd48uGh/4qGcgNShaBsFXlaMlKP83cLUJ5mnOfQscQbtReaFC3JVv
 djWshs0XGTygSwTV7AEfyGWiz4kJ7raOzjYloQWDqDDB2Jm1I+3fzts9p4jEUGs+ylCU
 BlkyfP5HaSiXqAYXZ7zggOUoAuRHWYspwGWZ2TzWqacHn9MVYPY2Vzt3RKPNhtN644ir
 H1Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rzfzyKEVoJaKFIv88YU1vTCrVQJBpK7ii1ptmDvGvSE=;
 b=bqes1IzprhYc3P+DXoHmDKAXiqomikHyio9hYLVrTGo5qPVKICBrqbR6F3uAo4JsHM
 p87BO29vZbevWUAn+o63JwhXM3E1MLwWpr5g73hkJ09F9bN0ZTZqRQvjxa3KkvHsTMq3
 LWXEhbX5qibdHm9/p5X60etpPsmhWH+uzNUCbjAeF3UqVV+PvfCgkCDayGE7gypLlUmA
 w7NGEXMpDzJs2cy9I6tOGJS32S4iVZ1LM/BsDEn+e4fr/Ye9h7okkmJnmfEznL+j0fzb
 gzManDV1GolZ0sRfnxxOMVdQPWZcUOGKN9/JwpwPE5nH5S6X30AqhteCAEDrE+MgUMwd
 RC7Q==
X-Gm-Message-State: AOAM532ysNXTM0XRqlGCJr09y4OemHn5LKnws58l1ZLfmloueNZOi1X5
 iE0aKlsoKQ0lGDUhEKkYoYo=
X-Google-Smtp-Source: ABdhPJyInyenW+OvDrbjpJKIaFUgNOigofr86k1OtUqbh4EqGuM90WNh58WAi7KJRkr+4OM3pXCRPQ==
X-Received: by 2002:a1c:4c13:0:b0:39c:5a6b:8540 with SMTP id
 z19-20020a1c4c13000000b0039c5a6b8540mr36262410wmf.106.1655755624155; 
 Mon, 20 Jun 2022 13:07:04 -0700 (PDT)
Received: from localhost (92.40.169.63.threembb.co.uk. [92.40.169.63])
 by smtp.gmail.com with ESMTPSA id
 j19-20020a05600c1c1300b0039c5645c60fsm28045293wms.3.2022.06.20.13.07.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 13:07:03 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 31/49] mfd: max14577: replace irqchip mask_invert with
 unmask_base
Date: Mon, 20 Jun 2022 21:06:26 +0100
Message-Id: <20220620200644.1961936-32-aidanmacdonald.0x0@gmail.com>
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

Also drop useless mask_invert flag from the pmic irq chip.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/mfd/max14577.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/max14577.c b/drivers/mfd/max14577.c
index 6c487fa14e9c..7a501dcc48f6 100644
--- a/drivers/mfd/max14577.c
+++ b/drivers/mfd/max14577.c
@@ -209,8 +209,7 @@ static const struct regmap_irq max14577_irqs[] = {
 static const struct regmap_irq_chip max14577_irq_chip = {
 	.name			= "max14577",
 	.status_base		= MAX14577_REG_INT1,
-	.mask_base		= MAX14577_REG_INTMASK1,
-	.mask_invert		= true,
+	.unmask_base		= MAX14577_REG_INTMASK1,
 	.num_regs		= 3,
 	.irqs			= max14577_irqs,
 	.num_irqs		= ARRAY_SIZE(max14577_irqs),
@@ -239,8 +238,7 @@ static const struct regmap_irq max77836_muic_irqs[] = {
 static const struct regmap_irq_chip max77836_muic_irq_chip = {
 	.name			= "max77836-muic",
 	.status_base		= MAX14577_REG_INT1,
-	.mask_base		= MAX14577_REG_INTMASK1,
-	.mask_invert		= true,
+	.unmask_base		= MAX14577_REG_INTMASK1,
 	.num_regs		= 3,
 	.irqs			= max77836_muic_irqs,
 	.num_irqs		= ARRAY_SIZE(max77836_muic_irqs),
@@ -255,7 +253,6 @@ static const struct regmap_irq_chip max77836_pmic_irq_chip = {
 	.name			= "max77836-pmic",
 	.status_base		= MAX77836_PMIC_REG_TOPSYS_INT,
 	.mask_base		= MAX77836_PMIC_REG_TOPSYS_INT_MASK,
-	.mask_invert		= false,
 	.num_regs		= 1,
 	.irqs			= max77836_pmic_irqs,
 	.num_irqs		= ARRAY_SIZE(max77836_pmic_irqs),
-- 
2.35.1

