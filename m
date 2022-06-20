Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9A8554F25
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:26:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D1021EEC;
	Wed, 22 Jun 2022 17:25:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D1021EEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655911604;
	bh=pd6l84BGUQCGpdnTLfPJTRgvBUirmJoDgpU9BXyfWIE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dZyHfvVcFK4A9KHvL+bjDCKZh2oQ7MObBO+mQ5Zx4VIYLfSMmuJDcubEU5l32oNFS
	 e5+hz3rEgGTNWg019fKCUxUDRI/7rxasB9wC4zhA3JoGWqPtczFsuK9ZlbwLzBX4xM
	 AO1J8Ew10axTbzioghYgK0/Tr0AbjivD6KJWlJkY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB326F80571;
	Wed, 22 Jun 2022 17:23:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B22F7F8052E; Mon, 20 Jun 2022 22:06:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBB1BF800CB
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 22:06:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBB1BF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="BTO8A9HS"
Received: by mail-wr1-x430.google.com with SMTP id g4so16059613wrh.11
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 13:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DxJmWv+hNttTbxmMnV8/0ynx/LV1OsxaVUXYP15PQh0=;
 b=BTO8A9HSWQnGNlJMXGdjduAwCNw3J11bxtii/kElmojKXpaQs9JJN+nB/Z11ecJ4+t
 aPcLjAvZTskP0Yy6Kx/uIv0Pq4VWXkpkS0ydzCVOuqbhT6f6VQizjp7Sw04Q9ffxbkhH
 csmvkrDN8vedL9apF4hjml4cDaHMUEENPeOpI+nc8qXBzi0Wj2VwJTYkHME9zb913aEV
 IKyBbkfVxi5GJtK2kKrwaqqf8HvGUo/7yih/Vli27G+00xxOpMWmGXBttaJ/eXDOS/2E
 m+aHlEaTYXuUuMTbUBmdEYfc5z0kBqJKMG9awNzXrPF6DsLmWYoGVOaU8py71drMcwzH
 ZOxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DxJmWv+hNttTbxmMnV8/0ynx/LV1OsxaVUXYP15PQh0=;
 b=CwUvvO3AfQTxNBuFc8iyxERMg61708+IxfD3D9t9MxzeI97f2AileO/EVqJSuX6Shg
 8H9slanXuCBvomPFvEUqYs/VVcunSxARiq4+GN7WcLazA+DJC8Iog4/ex7fox/Xb6JIB
 O3NRA6zTsi/hoRLru9vH5AYNa+Oz8f5SskWpEF/L7KSgzwAFX/Epo25E/VBA1oH/V6+7
 v4xjHWp5mwsgjXK3xRV7UVJDUGQ9Qd93cw8h6fjKkF3Wyi96CeVCAeKY5sDoong6n6sz
 hysfwR1hfJiLZNkdui/1ydX4YRc3K5l/8bmYlZx1wnFKRrAEu+uwpg2gvMnBybXWpYnr
 ciSA==
X-Gm-Message-State: AJIora/i3NPmBDbigvuW16DG+LXUqnMsDldUigY2+PKuhWnwI8Mv/iAf
 QlHoTlOupqLfhAvVp+qLtig=
X-Google-Smtp-Source: AGRyM1u9FwilnQ/YSzQ7+AkLyasXeK9euw6s745o8xH3ioUxds4vNSlLHDgKFQb8ki5d0K5hJNGaTg==
X-Received: by 2002:adf:a35a:0:b0:21a:3431:fcc with SMTP id
 d26-20020adfa35a000000b0021a34310fccmr22166494wrb.241.1655755592351; 
 Mon, 20 Jun 2022 13:06:32 -0700 (PDT)
Received: from localhost (92.40.169.68.threembb.co.uk. [92.40.169.68])
 by smtp.gmail.com with ESMTPSA id
 a17-20020a056000101100b00213465d202esm14269010wrx.46.2022.06.20.13.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 13:06:31 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 11/49] regmap-irq: Remove old type register support, refactor
Date: Mon, 20 Jun 2022 21:06:06 +0100
Message-Id: <20220620200644.1961936-12-aidanmacdonald.0x0@gmail.com>
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

Now that all users have been converted to use config registers
for setting IRQ types, the old type register handling code can
be removed. Also refactor the parts related to type_in_mask.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/base/regmap/regmap-irq.c | 102 +++++--------------------------
 include/linux/regmap.h           |   4 --
 2 files changed, 14 insertions(+), 92 deletions(-)

diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-irq.c
index 5a3e255816fd..85d7fd4e07d7 100644
--- a/drivers/base/regmap/regmap-irq.c
+++ b/drivers/base/regmap/regmap-irq.c
@@ -36,8 +36,7 @@ struct regmap_irq_chip_data {
 	unsigned int *mask_buf;
 	unsigned int *mask_buf_def;
 	unsigned int *wake_buf;
-	unsigned int *type_buf;
-	unsigned int *type_buf_def;
+	unsigned int *mask_type_buf;
 	unsigned int **config_buf;
 
 	unsigned int irq_reg_stride;
@@ -199,24 +198,6 @@ static void regmap_irq_sync_unlock(struct irq_data *data)
 		}
 	}
 
-	/* Don't update the type bits if we're using mask bits for irq type. */
-	if (!d->chip->type_in_mask) {
-		for (i = 0; i < d->chip->num_type_reg; i++) {
-			if (!d->type_buf_def[i])
-				continue;
-			reg = sub_irq_reg(d, d->chip->type_base, i);
-			if (d->chip->type_invert)
-				ret = regmap_irq_update_bits(d, reg,
-					d->type_buf_def[i], ~d->type_buf[i]);
-			else
-				ret = regmap_irq_update_bits(d, reg,
-					d->type_buf_def[i], d->type_buf[i]);
-			if (ret != 0)
-				dev_err(d->map->dev, "Failed to sync type in %x\n",
-					reg);
-		}
-	}
-
 	for (i = 0; i < d->chip->num_config_bases; i++) {
 		for (j = 0; j < d->chip->num_config_regs; j++) {
 			reg = sub_irq_reg(d, d->chip->config_base[i], j);
@@ -259,11 +240,11 @@ static void regmap_irq_enable(struct irq_data *data)
 	 *
 	 * If the interrupt we're enabling defines any supported types
 	 * then instead of using the regular mask bits for this interrupt,
-	 * use the value previously written to the type buffer at the
+	 * use the value previously written to the mask_type buffer at the
 	 * corresponding offset in regmap_irq_set_type().
 	 */
 	if (d->chip->type_in_mask && irq_data->type.types_supported)
-		mask = d->type_buf[reg] & irq_data->mask;
+		mask = d->mask_type_buf[reg] & irq_data->mask;
 	else
 		mask = irq_data->mask;
 
@@ -287,50 +268,21 @@ static int regmap_irq_set_type(struct irq_data *data, unsigned int type)
 	struct regmap_irq_chip_data *d = irq_data_get_irq_chip_data(data);
 	struct regmap *map = d->map;
 	const struct regmap_irq *irq_data = irq_to_regmap_irq(d, data->hwirq);
-	int reg;
 	const struct regmap_irq_type *t = &irq_data->type;
+	unsigned int reg;
 
-	if ((t->types_supported & type) != type)
+	if ((irq_data->type.types_supported & type) != type)
 		return 0;
 
 	reg = t->type_reg_offset / map->reg_stride;
 
+	if (d->chip->type_in_mask)
+		return regmap_irq_set_type_config_simple(&d->mask_type_buf,
+							 type, irq_data, reg);
 	if (d->chip->set_type_config)
 		return d->chip->set_type_config(d->config_buf, type,
 						irq_data, reg);
 
-	if (t->type_reg_mask)
-		d->type_buf[reg] &= ~t->type_reg_mask;
-	else
-		d->type_buf[reg] &= ~(t->type_falling_val |
-				      t->type_rising_val |
-				      t->type_level_low_val |
-				      t->type_level_high_val);
-	switch (type) {
-	case IRQ_TYPE_EDGE_FALLING:
-		d->type_buf[reg] |= t->type_falling_val;
-		break;
-
-	case IRQ_TYPE_EDGE_RISING:
-		d->type_buf[reg] |= t->type_rising_val;
-		break;
-
-	case IRQ_TYPE_EDGE_BOTH:
-		d->type_buf[reg] |= (t->type_falling_val |
-					t->type_rising_val);
-		break;
-
-	case IRQ_TYPE_LEVEL_HIGH:
-		d->type_buf[reg] |= t->type_level_high_val;
-		break;
-
-	case IRQ_TYPE_LEVEL_LOW:
-		d->type_buf[reg] |= t->type_level_low_val;
-		break;
-	default:
-		return -EINVAL;
-	}
-
 	return 0;
 }
 
@@ -682,7 +634,6 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 	struct regmap_irq_chip_data *d;
 	int i;
 	int ret = -ENOMEM;
-	int num_type_reg;
 	u32 reg;
 	u32 unmask_offset;
 
@@ -750,16 +701,10 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 			goto err_alloc;
 	}
 
-	num_type_reg = chip->type_in_mask ? chip->num_regs : chip->num_type_reg;
-	if (num_type_reg) {
-		d->type_buf_def = kcalloc(num_type_reg,
-					  sizeof(unsigned int), GFP_KERNEL);
-		if (!d->type_buf_def)
-			goto err_alloc;
-
-		d->type_buf = kcalloc(num_type_reg, sizeof(unsigned int),
-				      GFP_KERNEL);
-		if (!d->type_buf)
+	if (chip->type_in_mask) {
+		d->mask_type_buf = kcalloc(chip->num_regs,
+					   sizeof(unsigned int), GFP_KERNEL);
+		if (!d->mask_type_buf)
 			goto err_alloc;
 	}
 
@@ -899,23 +844,6 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 		}
 	}
 
-	if (chip->num_type_reg && !chip->type_in_mask) {
-		for (i = 0; i < chip->num_type_reg; ++i) {
-			reg = sub_irq_reg(d, d->chip->type_base, i);
-
-			ret = regmap_read(map, reg, &d->type_buf_def[i]);
-
-			if (d->chip->type_invert)
-				d->type_buf_def[i] = ~d->type_buf_def[i];
-
-			if (ret) {
-				dev_err(map->dev, "Failed to get type defaults at 0x%x: %d\n",
-					reg, ret);
-				goto err_alloc;
-			}
-		}
-	}
-
 	if (irq_base)
 		d->domain = irq_domain_create_legacy(fwnode, chip->num_irqs,
 						     irq_base, 0,
@@ -945,8 +873,7 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 err_domain:
 	/* Should really dispose of the domain but... */
 err_alloc:
-	kfree(d->type_buf);
-	kfree(d->type_buf_def);
+	kfree(d->mask_type_buf);
 	kfree(d->wake_buf);
 	kfree(d->mask_buf_def);
 	kfree(d->mask_buf);
@@ -1020,8 +947,7 @@ void regmap_del_irq_chip(int irq, struct regmap_irq_chip_data *d)
 	}
 
 	irq_domain_remove(d->domain);
-	kfree(d->type_buf);
-	kfree(d->type_buf_def);
+	kfree(d->mask_type_buf);
 	kfree(d->wake_buf);
 	kfree(d->mask_buf_def);
 	kfree(d->mask_buf);
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index bb8c89a83b51..879afdc81526 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -1458,7 +1458,6 @@ struct regmap_irq_sub_irq_map {
  * @ack_base:    Base ack address. If zero then the chip is clear on read.
  *               Using zero value is possible with @use_ack bit.
  * @wake_base:   Base address for wake enables.  If zero unsupported.
- * @type_base:   Base address for irq type.  If zero unsupported.
  * @config_base: Base address for IRQ type config regs. If null unsupported.
  * @irq_reg_stride:  Stride to use for chips where registers are not contiguous.
  * @init_ack_masked: Ack all masked interrupts once during initalization.
@@ -1484,7 +1483,6 @@ struct regmap_irq_sub_irq_map {
  * @irqs:        Descriptors for individual IRQs.  Interrupt numbers are
  *               assigned based on the index in the array of the interrupt.
  * @num_irqs:    Number of descriptors.
- * @num_type_reg:    Number of type registers.
  * @type_reg_stride: Stride to use for chips where type registers are not
  *			contiguous.
  * @num_config_bases:	Number of config base registers.
@@ -1514,7 +1512,6 @@ struct regmap_irq_chip {
 	unsigned int unmask_base;
 	unsigned int ack_base;
 	unsigned int wake_base;
-	unsigned int type_base;
 	const unsigned int *config_base;
 	unsigned int irq_reg_stride;
 	bool mask_writeonly:1;
@@ -1536,7 +1533,6 @@ struct regmap_irq_chip {
 	const struct regmap_irq *irqs;
 	int num_irqs;
 
-	int num_type_reg;
 	int num_config_bases;
 	int num_config_regs;
 	unsigned int type_reg_stride;
-- 
2.35.1

