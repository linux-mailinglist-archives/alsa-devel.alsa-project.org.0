Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A56554F1A
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:25:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE5D41E74;
	Wed, 22 Jun 2022 17:24:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE5D41E74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655911548;
	bh=6Tsq3ZgBGOEd17sDCbUJ0OKXCkZH8q2eJWwBy2QehbY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XID9swRBMcnDB0HcCgaoKQK63aCsAuSTD6BtKltj463xUz4Jkr1MjqsMqH3oi/S0X
	 +JdH0p51GIvavLlvVXvtZZaPkeLQ97B90WuO6Vq9QJDf7DWqou5eymXKlVS1xoo9+v
	 Sxza3jbThXB2m1eLMLCVBuDB4aGi59qu+8+5KfSg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3D99F80557;
	Wed, 22 Jun 2022 17:23:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5454FF804E7; Mon, 20 Jun 2022 22:06:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1A69F804D2
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 22:06:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1A69F804D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="iqvQ3lEY"
Received: by mail-wm1-x329.google.com with SMTP id
 i17-20020a7bc951000000b0039c4760ec3fso7069164wml.0
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 13:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n7C5fvVEgBv5GCdLdnesehqd1UexDtPscEtDq8TpQ98=;
 b=iqvQ3lEYGu10uGW18Rm99ayT8x3XLn8XsO9ymyUHVGvqkrAaQyuQPHeJloUfiJLsCF
 brvGIxTPxFY1qneHHNIXCVo9xBJ6RdKlEW0a+M06XrPY9smcUzKXBODzoRGSYX2fBOi0
 ois+9p71zNywpoyFgK1TIsJrPw8oRs+q2dNOU0miygmL4JPhI83OXUTFGpe0qYtNO5ma
 dzfiFEZpepT2Nxpnrff763DGS7DNF3ILweh1b8BAmm8zFxc2WGUKCoGEy5vMCKQkMK8d
 xKAxIIl3WT/W48wenSiIcIm+nDxzv7O78vP0Jryl5YepV6he0PFC0T0HzFB52vF6jmKy
 3vzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n7C5fvVEgBv5GCdLdnesehqd1UexDtPscEtDq8TpQ98=;
 b=dSqFttPcPr3aH5na57h4igsbgBHMzrqqWWCqSDVuh3CFqOch27+TTpDqSCtpGk2Smr
 C79Csw28qL0KVKFhxroyqd/Q+yfIP2l22+b9nJ2KfotJyJOP0DZ2mFaPecIbond0bg1y
 YqgtiFQtuP0QEyqgKTQdfZnaNT5WSl3UGzDz9jEjuD/SGDcOA0CUEYw/aQUuDfVDuGb/
 ikVFIKSo0VAdomHG0b4JtK4nnTzx9PrGuhmN62+BmTNT82kSwYzE+/VtK5Q8ohkF6csT
 EVkCANn1FmFhtVcLzRIVFRDm0fg1eHbSWPP2b4G5J6NA4POclrYs3pCXI7v43pbWB4WR
 C7xQ==
X-Gm-Message-State: AOAM532jbc7x2i452YB67ZaeRPBZWTgBiwxp/PZ5A915J1TelQERYh7a
 2yQGG7mBhU77VDqu4wDhpfs=
X-Google-Smtp-Source: ABdhPJx6f36rmenVzwLf28ElgO1YJCiHAg7RsENbp/+lJ/G4kOpdScdIio38B+uaAC+s+EJF6BDpIQ==
X-Received: by 2002:a05:600c:4f14:b0:39c:8612:a95e with SMTP id
 l20-20020a05600c4f1400b0039c8612a95emr37337282wmq.107.1655755581260; 
 Mon, 20 Jun 2022 13:06:21 -0700 (PDT)
Received: from localhost (92.40.169.68.threembb.co.uk. [92.40.169.68])
 by smtp.gmail.com with ESMTPSA id
 d8-20020adfc088000000b00213ba0cab3asm14319173wrf.44.2022.06.20.13.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 13:06:20 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 04/49] regmap-irq: Introduce config registers for irq types
Date: Mon, 20 Jun 2022 21:05:59 +0100
Message-Id: <20220620200644.1961936-5-aidanmacdonald.0x0@gmail.com>
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

Config registers provide a more uniform approach to handling irq type
registers. They are essentially an extension of the virtual registers
used by the qcom-pm8008 driver.

Config registers can be represented as a 2D array:

    config_base[0]      reg0,0      reg0,1      reg0,2      reg0,3
    config_base[1]      reg1,0      reg1,1      reg1,2      reg1,3
    config_base[2]      reg2,0      reg2,1      reg2,2      reg2,3

There are 'num_config_bases' base registers, each of which is used to
address 'num_config_regs' registers. The addresses are calculated in
the same way as for other bases. It is assumed that an irq's type is
controlled by one column of registers; that column is identified by
the irq's 'type_reg_offset'.

The set_type_config() callback is responsible for updating the config
register contents. It receives an array of buffers (each represents a
row of registers) and the index of the column to update, along with
the 'struct regmap_irq' description and requested irq type.

Buffered values are written to registers in regmap_irq_sync_unlock().
Note that the entire register contents are overwritten, which is a
minor change in behavior from type registers via 'type_base'.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/base/regmap/regmap-irq.c | 102 ++++++++++++++++++++++++++++++-
 include/linux/regmap.h           |  12 ++++
 2 files changed, 113 insertions(+), 1 deletion(-)

diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-irq.c
index 59cfd4000e63..be35f2e41b8c 100644
--- a/drivers/base/regmap/regmap-irq.c
+++ b/drivers/base/regmap/regmap-irq.c
@@ -39,6 +39,7 @@ struct regmap_irq_chip_data {
 	unsigned int *type_buf;
 	unsigned int *type_buf_def;
 	unsigned int **virt_buf;
+	unsigned int **config_buf;
 
 	unsigned int irq_reg_stride;
 	unsigned int type_reg_stride;
@@ -231,6 +232,17 @@ static void regmap_irq_sync_unlock(struct irq_data *data)
 		}
 	}
 
+	for (i = 0; i < d->chip->num_config_bases; i++) {
+		for (j = 0; j < d->chip->num_config_regs; j++) {
+			reg = sub_irq_reg(d, d->chip->config_base[i], j);
+			ret = regmap_write(map, reg, d->config_buf[i][j]);
+			if (ret != 0)
+				dev_err(d->map->dev,
+					"Failed to write config %x: %d\n",
+					reg, ret);
+		}
+	}
+
 	if (d->chip->runtime_pm)
 		pm_runtime_put(map->dev);
 
@@ -298,6 +310,10 @@ static int regmap_irq_set_type(struct irq_data *data, unsigned int type)
 
 	reg = t->type_reg_offset / map->reg_stride;
 
+	if (d->chip->set_type_config)
+		return d->chip->set_type_config(d->config_buf, type,
+						irq_data, reg);
+
 	if (t->type_reg_mask)
 		d->type_buf[reg] &= ~t->type_reg_mask;
 	else
@@ -603,6 +619,62 @@ static const struct irq_domain_ops regmap_domain_ops = {
 	.xlate	= irq_domain_xlate_onetwocell,
 };
 
+/**
+ * regmap_irq_set_type_config_simple() - Simple IRQ type configuration callback.
+ *
+ * @buf: Buffer containing configuration register values, this is a 2D array of
+ *       `num_config_bases` rows, each of `num_config_regs` elements.
+ * @type: The requested IRQ type.
+ * @irq_data: The IRQ being configured.
+ * @idx: Index of the irq's config registers within each array `buf[i]`
+ *
+ * This is a &struct regmap_irq_chip->set_type_config callback suitable for
+ * chips with one config register. Register values are updated according to
+ * the &struct regmap_irq_type data associated with an IRQ.
+ */
+int regmap_irq_set_type_config_simple(unsigned int **buf, unsigned int type,
+				      const struct regmap_irq *irq_data, int idx)
+{
+	const struct regmap_irq_type *t = &irq_data->type;
+
+	if (t->type_reg_mask)
+		buf[0][idx] &= ~t->type_reg_mask;
+	else
+		buf[0][idx] &= ~(t->type_falling_val |
+				 t->type_rising_val |
+				 t->type_level_low_val |
+				 t->type_level_high_val);
+
+	switch (type) {
+	case IRQ_TYPE_EDGE_FALLING:
+		buf[0][idx] |= t->type_falling_val;
+		break;
+
+	case IRQ_TYPE_EDGE_RISING:
+		buf[0][idx] |= t->type_rising_val;
+		break;
+
+	case IRQ_TYPE_EDGE_BOTH:
+		buf[0][idx] |= (t->type_falling_val |
+				t->type_rising_val);
+		break;
+
+	case IRQ_TYPE_LEVEL_HIGH:
+		buf[0][idx] |= t->type_level_high_val;
+		break;
+
+	case IRQ_TYPE_LEVEL_LOW:
+		buf[0][idx] |= t->type_level_low_val;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(regmap_irq_set_type_config_simple);
+
 /**
  * regmap_add_irq_chip_fwnode() - Use standard regmap IRQ controller handling
  *
@@ -728,6 +800,24 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 		}
 	}
 
+	if (chip->num_config_bases && chip->num_config_regs) {
+		/*
+		 * Create config_buf[num_config_bases][num_config_regs]
+		 */
+		d->config_buf = kcalloc(chip->num_config_bases,
+					sizeof(*d->config_buf), GFP_KERNEL);
+		if (!d->config_buf)
+			goto err_alloc;
+
+		for (i = 0; i < chip->num_config_regs; i++) {
+			d->config_buf[i] = kcalloc(chip->num_config_regs,
+						   sizeof(unsigned int),
+						   GFP_KERNEL);
+			if (!d->config_buf[i])
+				goto err_alloc;
+		}
+	}
+
 	d->irq_chip = regmap_irq_chip;
 	d->irq_chip.name = chip->name;
 	d->irq = irq;
@@ -904,6 +994,11 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 			kfree(d->virt_buf[i]);
 		kfree(d->virt_buf);
 	}
+	if (d->config_buf) {
+		for (i = 0; i < chip->num_config_bases; i++)
+			kfree(d->config_buf[i]);
+		kfree(d->config_buf);
+	}
 	kfree(d);
 	return ret;
 }
@@ -944,7 +1039,7 @@ EXPORT_SYMBOL_GPL(regmap_add_irq_chip);
 void regmap_del_irq_chip(int irq, struct regmap_irq_chip_data *d)
 {
 	unsigned int virq;
-	int hwirq;
+	int i, hwirq;
 
 	if (!d)
 		return;
@@ -974,6 +1069,11 @@ void regmap_del_irq_chip(int irq, struct regmap_irq_chip_data *d)
 	kfree(d->mask_buf);
 	kfree(d->status_reg_buf);
 	kfree(d->status_buf);
+	if (d->config_buf) {
+		for (i = 0; i < d->chip->num_config_bases; i++)
+			kfree(d->config_buf[i]);
+		kfree(d->config_buf);
+	}
 	kfree(d);
 }
 EXPORT_SYMBOL_GPL(regmap_del_irq_chip);
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index 8952fa3d0d59..e48d65756fb4 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -1460,6 +1460,7 @@ struct regmap_irq_sub_irq_map {
  * @wake_base:   Base address for wake enables.  If zero unsupported.
  * @type_base:   Base address for irq type.  If zero unsupported.
  * @virt_reg_base:   Base addresses for extra config regs.
+ * @config_base: Base address for IRQ type config regs. If null unsupported.
  * @irq_reg_stride:  Stride to use for chips where registers are not contiguous.
  * @init_ack_masked: Ack all masked interrupts once during initalization.
  * @mask_invert: Inverted mask register: cleared bits are masked out.
@@ -1489,12 +1490,15 @@ struct regmap_irq_sub_irq_map {
  *		     If zero unsupported.
  * @type_reg_stride: Stride to use for chips where type registers are not
  *			contiguous.
+ * @num_config_bases:	Number of config base registers.
+ * @num_config_regs:	Number of config registers for each config base register.
  * @handle_pre_irq:  Driver specific callback to handle interrupt from device
  *		     before regmap_irq_handler process the interrupts.
  * @handle_post_irq: Driver specific callback to handle interrupt from device
  *		     after handling the interrupts in regmap_irq_handler().
  * @set_type_virt:   Driver specific callback to extend regmap_irq_set_type()
  *		     and configure virt regs.
+ * @set_type_config: Callback used for configuring irq types.
  * @irq_drv_data:    Driver specific IRQ data which is passed as parameter when
  *		     driver specific pre/post interrupt handler is called.
  *
@@ -1517,6 +1521,7 @@ struct regmap_irq_chip {
 	unsigned int wake_base;
 	unsigned int type_base;
 	unsigned int *virt_reg_base;
+	const unsigned int *config_base;
 	unsigned int irq_reg_stride;
 	bool mask_writeonly:1;
 	bool init_ack_masked:1;
@@ -1539,17 +1544,24 @@ struct regmap_irq_chip {
 
 	int num_type_reg;
 	int num_virt_regs;
+	int num_config_bases;
+	int num_config_regs;
 	unsigned int type_reg_stride;
 
 	int (*handle_pre_irq)(void *irq_drv_data);
 	int (*handle_post_irq)(void *irq_drv_data);
 	int (*set_type_virt)(unsigned int **buf, unsigned int type,
 			     unsigned long hwirq, int reg);
+	int (*set_type_config)(unsigned int **buf, unsigned int type,
+			       const struct regmap_irq *irq_data, int idx);
 	void *irq_drv_data;
 };
 
 struct regmap_irq_chip_data;
 
+int regmap_irq_set_type_config_simple(unsigned int **buf, unsigned int type,
+				      const struct regmap_irq *irq_data, int idx);
+
 int regmap_add_irq_chip(struct regmap *map, int irq, int irq_flags,
 			int irq_base, const struct regmap_irq_chip *chip,
 			struct regmap_irq_chip_data **data);
-- 
2.35.1

