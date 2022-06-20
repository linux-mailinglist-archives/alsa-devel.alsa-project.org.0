Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF2C554F74
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:36:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5841F205A;
	Wed, 22 Jun 2022 17:35:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5841F205A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655912203;
	bh=/vUTsmLpFI54cIZoWxQv5H61EjMtr9Mdep/1TXV6xzc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pMnJM66eI/EokyiWlqOyDM4jwaodqdoIMlpRvBWEZV5VWHcP8pvZAkIqXnUYe/gCm
	 1xMMI48IGAHmKcbMSZgfc5NShKqQvKSLKMHzcj6NTBH5GIKBUtWc2hmKvKKd8KZVMb
	 hb3YncAfRwlSQW36XMSzsOjcWpdl89l6guPEi5i4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66AF4F80674;
	Wed, 22 Jun 2022 17:23:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4966CF804D8; Mon, 20 Jun 2022 22:07:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,SPF_HELO_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86FF2F800CB
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 22:07:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86FF2F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="S/EtAgiY"
Received: by mail-wm1-x331.google.com with SMTP id
 l2-20020a05600c4f0200b0039c55c50482so8297468wmq.0
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 13:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gGGGI5LNQd5QfFmuY5vVwQrtUD8WBKwvWjL6Bicr/nE=;
 b=S/EtAgiYih2o97vzKZ46FuXvAcLZH4aZSRqS9u2yBKGwrnkXOKPCMGGLd7i9ZmxQaG
 BnBbK63aSq4v1vSjGAPc164mZGaSk3LPHtRt8daUl8xMv0xp20Wh0ybrxjQLqHXLqdDy
 yhDIj9t6XfrHHFv3whu+IVZQrWETjZ1AesrYnf54NJGg7Cy+3sRgTPv9faAKYSFooPY0
 45O48rrjzHJTrXu/6XULoJep5LjaBkkIDGdtmMKtfzD41Z5IcTn0ruAikZetXvnqo0Tl
 Zdz1vCizcAGpaQKPTcGKQxbHlaaCG3L3c003lP0kS60LBM2I8ti3fkUMC/+0uVt3nR1g
 Y3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gGGGI5LNQd5QfFmuY5vVwQrtUD8WBKwvWjL6Bicr/nE=;
 b=4iV+msPPXYmM69o56yvviysrXWgJUg80INyy/iXAmtw0b8AjEd0/OWschdESWOaDy1
 k9XVZaLyNaQs6+Eifdd62Nuy31BJxL5ZREF1qNCGZa6mYvxlgtTNV5YDwY9rLCHeKELZ
 M1uM87i1uX9iYv6aFbqlw1jFmPaACHyd7N0Lw7THEJFr6gPY2Ql1pVB+SQpY6H7R84KQ
 8D/VOA1YECa7PYJxzFv4crVULH5X7iX0VuvrPEnAEwuBBxnaCH8wcwsRc/5YR9GFWj2M
 2JuTZAzI6OivnXy4gUXy1Np7/SBL/CeQx/1ULOFzAy6oYEkRoUun5HPf5aDtJjTS2S+Z
 +oSQ==
X-Gm-Message-State: AJIora/Como/DUUIh2g9JURM7RSdWYgtFYwX5DLl4WmYoO9EU3NkOTkP
 fnEhRWljDji9qAXKcWf5xYc=
X-Google-Smtp-Source: AGRyM1t7nmjsnyP7qTIA/w/988Wjv4MiUTlTDpMZzgOJTqyM5/Li8wCJHVRxnaV0tBlHxN/JpqOs4g==
X-Received: by 2002:a05:600c:4ec7:b0:39c:84a7:3762 with SMTP id
 g7-20020a05600c4ec700b0039c84a73762mr25749060wmq.153.1655755653087; 
 Mon, 20 Jun 2022 13:07:33 -0700 (PDT)
Received: from localhost (92.40.169.63.threembb.co.uk. [92.40.169.63])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a5d6a87000000b0021b8c99860asm5606007wru.115.2022.06.20.13.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 13:07:32 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 48/49] mfd: qcom-pm8008: Use get_irq_reg() for irq chip
Date: Mon, 20 Jun 2022 21:06:43 +0100
Message-Id: <20220620200644.1961936-49-aidanmacdonald.0x0@gmail.com>
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

Replace the not_fixed_stride flag with a get_irq_reg() callback,
which expresses what we want to do here more directly instead of
relying on a convoluted hierarchy of offsets.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/mfd/qcom-pm8008.c | 56 +++++++++++++++++----------------------
 1 file changed, 25 insertions(+), 31 deletions(-)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index c778f2f87a17..f6407aa0bcfc 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -44,16 +44,6 @@ enum {
 #define PM8008_GPIO1_ADDR	PM8008_PERIPH_2_BASE
 #define PM8008_GPIO2_ADDR	PM8008_PERIPH_3_BASE
 
-#define PM8008_STATUS_BASE	(PM8008_PERIPH_0_BASE | INT_LATCHED_STS_OFFSET)
-#define PM8008_MASK_BASE	(PM8008_PERIPH_0_BASE | INT_EN_CLR_OFFSET)
-#define PM8008_UNMASK_BASE	(PM8008_PERIPH_0_BASE | INT_EN_SET_OFFSET)
-#define PM8008_TYPE_BASE	(PM8008_PERIPH_0_BASE | INT_SET_TYPE_OFFSET)
-#define PM8008_ACK_BASE		(PM8008_PERIPH_0_BASE | INT_LATCHED_CLR_OFFSET)
-#define PM8008_POLARITY_HI_BASE	(PM8008_PERIPH_0_BASE | INT_POL_HIGH_OFFSET)
-#define PM8008_POLARITY_LO_BASE	(PM8008_PERIPH_0_BASE | INT_POL_LOW_OFFSET)
-
-#define PM8008_PERIPH_OFFSET(paddr)	(paddr - PM8008_PERIPH_0_BASE)
-
 struct pm8008_data {
 	struct device *dev;
 	struct regmap *regmap;
@@ -61,22 +51,10 @@ struct pm8008_data {
 	struct regmap_irq_chip_data *irq_data;
 };
 
-static unsigned int p0_offs[] = {PM8008_PERIPH_OFFSET(PM8008_PERIPH_0_BASE)};
-static unsigned int p1_offs[] = {PM8008_PERIPH_OFFSET(PM8008_PERIPH_1_BASE)};
-static unsigned int p2_offs[] = {PM8008_PERIPH_OFFSET(PM8008_PERIPH_2_BASE)};
-static unsigned int p3_offs[] = {PM8008_PERIPH_OFFSET(PM8008_PERIPH_3_BASE)};
-
-static struct regmap_irq_sub_irq_map pm8008_sub_reg_offsets[] = {
-	REGMAP_IRQ_MAIN_REG_OFFSET(p0_offs),
-	REGMAP_IRQ_MAIN_REG_OFFSET(p1_offs),
-	REGMAP_IRQ_MAIN_REG_OFFSET(p2_offs),
-	REGMAP_IRQ_MAIN_REG_OFFSET(p3_offs),
-};
-
 static unsigned int pm8008_config_regs[] = {
-	PM8008_TYPE_BASE,
-	PM8008_POLARITY_HI_BASE,
-	PM8008_POLARITY_LO_BASE,
+	INT_SET_TYPE_OFFSET,
+	INT_POL_HIGH_OFFSET,
+	INT_POL_LOW_OFFSET,
 };
 
 enum {
@@ -96,6 +74,23 @@ static struct regmap_irq pm8008_irqs[] = {
 	REGMAP_IRQ_REG(PM8008_IRQ_GPIO2,	PM8008_GPIO2,	BIT(0)),
 };
 
+static const unsigned int pm8008_periph_base[] = {
+	PM8008_PERIPH_0_BASE,
+	PM8008_PERIPH_1_BASE,
+	PM8008_PERIPH_2_BASE,
+	PM8008_PERIPH_3_BASE,
+};
+
+static unsigned int pm8008_get_irq_reg(struct regmap_irq_chip_data *data,
+				       unsigned int base, int index)
+{
+	/* Simple linear addressing for the main status register */
+	if (base == I2C_INTR_STATUS_BASE)
+		return base + index;
+
+	return pm8008_periph_base[index] + base;
+}
+
 static int pm8008_set_type_config(unsigned int **buf, unsigned int type,
 				  const struct regmap_irq *irq_data, int idx)
 {
@@ -136,17 +131,16 @@ static struct regmap_irq_chip pm8008_irq_chip = {
 	.irqs			= pm8008_irqs,
 	.num_irqs		= ARRAY_SIZE(pm8008_irqs),
 	.num_regs		= PM8008_NUM_PERIPHS,
-	.not_fixed_stride	= true,
-	.sub_reg_offsets	= pm8008_sub_reg_offsets,
-	.status_base		= PM8008_STATUS_BASE,
-	.mask_base		= PM8008_MASK_BASE,
-	.unmask_base		= PM8008_UNMASK_BASE,
+	.status_base		= INT_LATCHED_STS_OFFSET,
+	.mask_base		= INT_EN_CLR_OFFSET,
+	.unmask_base		= INT_EN_SET_OFFSET,
 	.mask_writeonly		= true,
-	.ack_base		= PM8008_ACK_BASE,
+	.ack_base		= INT_LATCHED_CLR_OFFSET,
 	.config_base		= pm8008_config_regs,
 	.num_config_bases	= ARRAY_SIZE(pm8008_config_regs),
 	.num_config_regs	= PM8008_NUM_PERIPHS,
 	.set_type_config	= pm8008_set_type_config,
+	.get_irq_reg		= pm8008_get_irq_reg,
 };
 
 static struct regmap_config qcom_mfd_regmap_cfg = {
-- 
2.35.1

