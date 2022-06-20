Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8C2554F16
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:25:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9A9D1F13;
	Wed, 22 Jun 2022 17:24:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9A9D1F13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655911522;
	bh=nbbow5pWfxMzH3NUmmFs9ly6QQIUWASIOTghj4IlefU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h/ZZTH1JAWeXNMGYMqqh2GXWfC/GrDFZ7UKlO9UPF6AglidoDskRI1OueBc0Okywd
	 PMpWsSgK1U45J9wb0M4QiFPQufVg8StmVrKXkeutFu18qu5VBCDUvFFC7KfJ0SHSdh
	 wq3I98ZDtrjX4kscck7Dl7KSKa0YdHNoZIK0u3KA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E1F7F8054A;
	Wed, 22 Jun 2022 17:23:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68DDEF804E5; Mon, 20 Jun 2022 22:06:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
 DKIM_INVALID,DKIM_SIGNED,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 219C0F804E7
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 22:06:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 219C0F804E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MFe3Q+6q"
Received: by mail-wr1-x432.google.com with SMTP id i10so12332208wrc.0
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 13:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+RKr+XEaRdRjV4wQDDo6dA3o5NhQRFg9bdRqt89GYJ0=;
 b=MFe3Q+6q+h4xcL+TmQJO+X66B7qIj60KwU1bFNqVSVGdb6rLV0HBSOV2kqB2IjbUOu
 EeUFb2zxP73mwWK5HebDmiVlcTN8/lZAhuLs1PYprMOgS3IJsFXo991qtdEe757TgDt9
 PNPQFGJRS+9ee64SFv8BTOpI+yUy8iMY6XDOthlwL791AZzHrgjOrzL2Z+WNMe4Q5oWF
 qoB1e1HBzkv5OpvL4CfZkeKUFNVwqSHVXe+sPPHD6FW/G5Yf9GVjSClhAKk8/5129GdY
 Md+190DcO8iXrY/zsP1mYBAaO/sM8k8KeCFB2bYWTrEW6jR8+hXYDV/1ognbiuUqqzMD
 dr9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+RKr+XEaRdRjV4wQDDo6dA3o5NhQRFg9bdRqt89GYJ0=;
 b=OzLqnvQ3Cv1j591hD9jgHmfhm4OcuTqQuuxibRKbizla4WPNuqN8wtxJYx4rRUPacS
 AL8hANPY11bAKeH5lVo++s1U07JN+AWWAHCmNhhmqTgocNeubQJsKz1SygJNR5IWCzvs
 QOYb3pRng8D+3xjxXFXeCrgX2WA4hweD0WaasURuQYglWkj86xCZQ00WL3QWuRdEmMfK
 QsnfmBOKvKiUH0XlIUtdrPtu7TmDl7qZlO+Oqs+vsjh4pCLkdNDMeqpOmeckBDUQHH9s
 jkpd32tHk9sJP5BFHvM/UdP4Y/E+FzXb+yvoidmTdmqbb6fzgCG4jTKD5BpBWViXrZcm
 Cjzw==
X-Gm-Message-State: AJIora9KvbDPXv7Fp4pXAJRo4sADyLCfu6x5Xyorr2QVpl6hiLX4OIFC
 L6P3hy6Lxcr6tlKwEQtGUMs=
X-Google-Smtp-Source: AGRyM1s4brtjxXAe+5dbgtT8AX6IW9qXMEOUfwY6ndJ5c4LaV2MOHLy/q9oiZpUl7AFgXk1xm6zPXA==
X-Received: by 2002:a5d:6d8f:0:b0:218:45ef:30c2 with SMTP id
 l15-20020a5d6d8f000000b0021845ef30c2mr23978566wrs.411.1655755582833; 
 Mon, 20 Jun 2022 13:06:22 -0700 (PDT)
Received: from localhost (92.40.169.68.threembb.co.uk. [92.40.169.68])
 by smtp.gmail.com with ESMTPSA id
 x13-20020adfdd8d000000b0021b81855c1csm12567311wrl.27.2022.06.20.13.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 13:06:22 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 05/49] mfd: qcom-pm8008: Convert irq chip to config regs
Date: Mon, 20 Jun 2022 21:06:00 +0100
Message-Id: <20220620200644.1961936-6-aidanmacdonald.0x0@gmail.com>
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

Use config registers to simplify the driver, putting all of the
code for irq type configuration in one place instead of splitting
it up arbitrarily between type and virtual registers.

Remove the initial register setting in pm8008_init(). The comment
indicates this is a hack to work around quirks in regmap-irq, but
this is not necessary if using config registers.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/mfd/qcom-pm8008.c | 76 +++++++++++----------------------------
 1 file changed, 21 insertions(+), 55 deletions(-)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index c472d7f8103c..da16566f7883 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -73,15 +73,16 @@ static struct regmap_irq_sub_irq_map pm8008_sub_reg_offsets[] = {
 	REGMAP_IRQ_MAIN_REG_OFFSET(p3_offs),
 };
 
-static unsigned int pm8008_virt_regs[] = {
+static unsigned int pm8008_config_regs[] = {
+	PM8008_TYPE_BASE,
 	PM8008_POLARITY_HI_BASE,
 	PM8008_POLARITY_LO_BASE,
 };
 
 enum {
+	SET_TYPE_INDEX,
 	POLARITY_HI_INDEX,
 	POLARITY_LO_INDEX,
-	PM8008_NUM_VIRT_REGS,
 };
 
 static struct regmap_irq pm8008_irqs[] = {
@@ -95,32 +96,36 @@ static struct regmap_irq pm8008_irqs[] = {
 	REGMAP_IRQ_REG(PM8008_IRQ_GPIO2,	PM8008_GPIO2,	BIT(0)),
 };
 
-static int pm8008_set_type_virt(unsigned int **virt_buf,
-				      unsigned int type, unsigned long hwirq,
-				      int reg)
+static int pm8008_set_type_config(unsigned int **buf, unsigned int type,
+				  const struct regmap_irq *irq_data, int idx)
 {
 	switch (type) {
 	case IRQ_TYPE_EDGE_FALLING:
 	case IRQ_TYPE_LEVEL_LOW:
-		virt_buf[POLARITY_HI_INDEX][reg] &= ~pm8008_irqs[hwirq].mask;
-		virt_buf[POLARITY_LO_INDEX][reg] |= pm8008_irqs[hwirq].mask;
+		buf[POLARITY_HI_INDEX][idx] &= ~irq_data->mask;
+		buf[POLARITY_LO_INDEX][idx] |= irq_data->mask;
 		break;
 
 	case IRQ_TYPE_EDGE_RISING:
 	case IRQ_TYPE_LEVEL_HIGH:
-		virt_buf[POLARITY_HI_INDEX][reg] |= pm8008_irqs[hwirq].mask;
-		virt_buf[POLARITY_LO_INDEX][reg] &= ~pm8008_irqs[hwirq].mask;
+		buf[POLARITY_HI_INDEX][idx] |= irq_data->mask;
+		buf[POLARITY_LO_INDEX][idx] &= ~irq_data->mask;
 		break;
 
 	case IRQ_TYPE_EDGE_BOTH:
-		virt_buf[POLARITY_HI_INDEX][reg] |= pm8008_irqs[hwirq].mask;
-		virt_buf[POLARITY_LO_INDEX][reg] |= pm8008_irqs[hwirq].mask;
+		buf[POLARITY_HI_INDEX][idx] |= irq_data->mask;
+		buf[POLARITY_LO_INDEX][idx] |= irq_data->mask;
 		break;
 
 	default:
 		return -EINVAL;
 	}
 
+	if (type & IRQ_TYPE_EDGE_BOTH)
+		buf[SET_TYPE_INDEX][idx] |= irq_data->mask;
+	else
+		buf[SET_TYPE_INDEX][idx] &= ~irq_data->mask;
+
 	return 0;
 }
 
@@ -128,20 +133,19 @@ static struct regmap_irq_chip pm8008_irq_chip = {
 	.name			= "pm8008_irq",
 	.main_status		= I2C_INTR_STATUS_BASE,
 	.num_main_regs		= 1,
-	.num_virt_regs		= PM8008_NUM_VIRT_REGS,
 	.irqs			= pm8008_irqs,
 	.num_irqs		= ARRAY_SIZE(pm8008_irqs),
 	.num_regs		= PM8008_NUM_PERIPHS,
 	.not_fixed_stride	= true,
 	.sub_reg_offsets	= pm8008_sub_reg_offsets,
-	.set_type_virt		= pm8008_set_type_virt,
 	.status_base		= PM8008_STATUS_BASE,
 	.mask_base		= PM8008_MASK_BASE,
 	.unmask_base		= PM8008_UNMASK_BASE,
-	.type_base		= PM8008_TYPE_BASE,
 	.ack_base		= PM8008_ACK_BASE,
-	.virt_reg_base		= pm8008_virt_regs,
-	.num_type_reg		= PM8008_NUM_PERIPHS,
+	.config_base		= pm8008_config_regs,
+	.num_config_bases	= ARRAY_SIZE(pm8008_config_regs),
+	.num_config_regs	= PM8008_NUM_PERIPHS,
+	.set_type_config	= pm8008_set_type_config,
 };
 
 static struct regmap_config qcom_mfd_regmap_cfg = {
@@ -150,34 +154,6 @@ static struct regmap_config qcom_mfd_regmap_cfg = {
 	.max_register	= 0xFFFF,
 };
 
-static int pm8008_init(struct pm8008_data *chip)
-{
-	int rc;
-
-	/*
-	 * Set TEMP_ALARM peripheral's TYPE so that the regmap-irq framework
-	 * reads this as the default value instead of zero, the HW default.
-	 * This is required to enable the writing of TYPE registers in
-	 * regmap_irq_sync_unlock().
-	 */
-	rc = regmap_write(chip->regmap,
-			 (PM8008_TEMP_ALARM_ADDR | INT_SET_TYPE_OFFSET),
-			 BIT(0));
-	if (rc)
-		return rc;
-
-	/* Do the same for GPIO1 and GPIO2 peripherals */
-	rc = regmap_write(chip->regmap,
-			 (PM8008_GPIO1_ADDR | INT_SET_TYPE_OFFSET), BIT(0));
-	if (rc)
-		return rc;
-
-	rc = regmap_write(chip->regmap,
-			 (PM8008_GPIO2_ADDR | INT_SET_TYPE_OFFSET), BIT(0));
-
-	return rc;
-}
-
 static int pm8008_probe_irq_peripherals(struct pm8008_data *chip,
 					int client_irq)
 {
@@ -185,20 +161,10 @@ static int pm8008_probe_irq_peripherals(struct pm8008_data *chip,
 	struct regmap_irq_type *type;
 	struct regmap_irq_chip_data *irq_data;
 
-	rc = pm8008_init(chip);
-	if (rc) {
-		dev_err(chip->dev, "Init failed: %d\n", rc);
-		return rc;
-	}
-
 	for (i = 0; i < ARRAY_SIZE(pm8008_irqs); i++) {
 		type = &pm8008_irqs[i].type;
 
-		type->type_reg_offset	  = pm8008_irqs[i].reg_offset;
-		type->type_rising_val	  = pm8008_irqs[i].mask;
-		type->type_falling_val	  = pm8008_irqs[i].mask;
-		type->type_level_high_val = 0;
-		type->type_level_low_val  = 0;
+		type->type_reg_offset = pm8008_irqs[i].reg_offset;
 
 		if (type->type_reg_offset == PM8008_MISC)
 			type->types_supported = IRQ_TYPE_EDGE_RISING;
-- 
2.35.1

