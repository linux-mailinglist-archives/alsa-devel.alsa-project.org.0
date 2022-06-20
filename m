Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4803A554F72
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:36:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0ADA1FEC;
	Wed, 22 Jun 2022 17:35:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0ADA1FEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655912188;
	bh=1DW6dyNvHFlRmCClUUpAyK2LfRSsw2zdb4ZvgY3N9os=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sW1rso7jZgbkOiNwhvWDODkPuIJ2E1fCndPvtx1DtD4w6YqMZ7qd6pu3+wQKcLWvr
	 WWMjRN8uAwWG+cW8coX5eoBHlBWwV9ZVNN9AMSpNGHxpx8Ig8fp5n6ePMF9ONhUnua
	 xvLqzZ5Wu/aJc3RzObm9Xy4UZMqOUZBjfxZ9dXeU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D649EF8065B;
	Wed, 22 Jun 2022 17:23:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97086F804E7; Mon, 20 Jun 2022 22:07:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
 DKIM_INVALID,DKIM_SIGNED,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 NML_ADSP_CUSTOM_MED,PRX_BODY_30,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B30EAF804D2
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 22:07:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B30EAF804D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="imip7dzG"
Received: by mail-wr1-x42f.google.com with SMTP id w17so16065230wrg.7
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 13:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XaILMaaUfjKKrrd1BT5yUC0wzaqueGQvAdQj7TQ0vLM=;
 b=imip7dzGE8pif//iZiBwRPgT0Zy30AicR52p+YSjODyhTVrRZ2lor3isprtfe5BvRf
 6g0qehbR9h2oP87ubh9puaYqDZ7h0g3Qr9cE+rFnZyOveR2FPmH15B6/0Pb9aqj9zL2t
 1WdH5LJC+mlljGPaehp7prMgTu/wr2dyHT4f+0DWYEPU53OC4k7EcUfjdBa8Y0jLKd7f
 jOCRN3c+t45IpipXCIFg8ljs4JDcpiwga1eEgM8TL6lytc62RYsXd2Xi9hxEDHg2Johr
 jswOtD5N2Zu8rtBWb5ETbrZRPG5UV6rhvYOpjg7uu/p7IFU2L64Kf3biwJJ9dht9BHHs
 DmLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XaILMaaUfjKKrrd1BT5yUC0wzaqueGQvAdQj7TQ0vLM=;
 b=FXltjNzzgLfLvHsM1v0wlwRscLioXH+ssvLVxHaI9AF2tZIz7ZbyJcC4RfR5ckmRbJ
 xzAZt8RdBn2U0CEaGOOPeCXQNhPoF7icp83ndMqSsXB0bAwbmxSYDrfRov4GpR/Cacta
 KDbbwhW4Un9O/CD9gnIZL0dQupMYI7yfkW7or94kQL0mTC1wOEBfEtIBbDzdy66HWcXI
 moLwOkNYL9DEFS8o8lF2ZE7nEJ/sdHgbYbX1x0ODMlO57nV5ODTsVhTnbSMjk3eIoDDB
 ZFcdeN4H8NuB+C2NPMALYwzbuBfEBmvG3WefFHsqyaeOdz+b5Xvfar4teJu0OKnjHbAw
 drrw==
X-Gm-Message-State: AJIora92gcoyDhJFTu/GP9mJFQb9s8rwvz1AqMj74sp1cFwtQvK5WzV8
 C5ze+DV8uOIf8v03/uXWr9Y=
X-Google-Smtp-Source: AGRyM1t9IFcsSmUxm6NbAdug13RNQx5axNz4NGatMxkirYwyQ+EAH80iv3Me1JZp6GMwiYGFFjPvjg==
X-Received: by 2002:a5d:4cc4:0:b0:21b:8a19:b8a6 with SMTP id
 c4-20020a5d4cc4000000b0021b8a19b8a6mr10152154wrt.590.1655755651340; 
 Mon, 20 Jun 2022 13:07:31 -0700 (PDT)
Received: from localhost (92.40.169.63.threembb.co.uk. [92.40.169.63])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a5d5941000000b0020c5253d907sm14219807wri.83.2022.06.20.13.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 13:07:30 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 47/49] regmap-irq: Add get_irq_reg() callback
Date: Mon, 20 Jun 2022 21:06:42 +0100
Message-Id: <20220620200644.1961936-48-aidanmacdonald.0x0@gmail.com>
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

Replace the internal sub_irq_reg() function with a public callback
that drivers can use when they have more complex register layouts.
The default implementation is regmap_irq_get_irq_reg_linear(), used
if the chip doesn't provide its own callback.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/base/regmap/regmap-irq.c | 122 ++++++++++++++++++++-----------
 include/linux/regmap.h           |  15 +++-
 2 files changed, 92 insertions(+), 45 deletions(-)

diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-irq.c
index 7b5bd1d45fc0..acbd6e22b0cd 100644
--- a/drivers/base/regmap/regmap-irq.c
+++ b/drivers/base/regmap/regmap-irq.c
@@ -41,30 +41,12 @@ struct regmap_irq_chip_data {
 
 	unsigned int irq_reg_stride;
 
+	unsigned int (*get_irq_reg)(struct regmap_irq_chip_data *data,
+				    unsigned int base, int index);
+
 	bool clear_status:1;
 };
 
-static int sub_irq_reg(struct regmap_irq_chip_data *data,
-		       unsigned int base_reg, int i)
-{
-	const struct regmap_irq_chip *chip = data->chip;
-	struct regmap *map = data->map;
-	struct regmap_irq_sub_irq_map *subreg;
-	unsigned int offset;
-	int reg = 0;
-
-	if (!chip->sub_reg_offsets || !chip->not_fixed_stride) {
-		/* Assume linear mapping */
-		reg = base_reg + (i * map->reg_stride * data->irq_reg_stride);
-	} else {
-		subreg = &chip->sub_reg_offsets[i];
-		offset = subreg->offset[0];
-		reg = base_reg + offset;
-	}
-
-	return reg;
-}
-
 static inline const
 struct regmap_irq *irq_to_regmap_irq(struct regmap_irq_chip_data *data,
 				     int irq)
@@ -76,8 +58,14 @@ static bool regmap_irq_can_bulk_read_status(struct regmap_irq_chip_data *data)
 {
 	struct regmap *map = data->map;
 
+	/*
+	 * While possible that a user-defined get_irq_reg callback might be
+	 * linear enough to support bulk reads, most of the time it won't.
+	 * Therefore only allow them if the default callback is being used.
+	 */
 	return !map->use_single_read && map->reg_stride == 1 &&
-		data->irq_reg_stride == 1;
+		data->irq_reg_stride == 1 &&
+		data->get_irq_reg == regmap_irq_get_irq_reg_linear;
 }
 
 static void regmap_irq_lock(struct irq_data *data)
@@ -114,7 +102,7 @@ static void regmap_irq_sync_unlock(struct irq_data *data)
 
 	if (d->clear_status) {
 		for (i = 0; i < d->chip->num_regs; i++) {
-			reg = sub_irq_reg(d, d->chip->status_base, i);
+			reg = d->get_irq_reg(d, d->chip->status_base, i);
 
 			ret = regmap_read(map, reg, &val);
 			if (ret)
@@ -132,7 +120,7 @@ static void regmap_irq_sync_unlock(struct irq_data *data)
 	 */
 	for (i = 0; i < d->chip->num_regs; i++) {
 		if (d->chip->mask_base) {
-			reg = sub_irq_reg(d, d->chip->mask_base, i);
+			reg = d->get_irq_reg(d, d->chip->mask_base, i);
 			ret = regmap_irq_update_mask_bits(d, reg,
 					d->mask_buf_def[i], d->mask_buf[i]);
 			if (ret != 0)
@@ -141,7 +129,7 @@ static void regmap_irq_sync_unlock(struct irq_data *data)
 		}
 
 		if (d->chip->unmask_base) {
-			reg = sub_irq_reg(d, d->chip->unmask_base, i);
+			reg = d->get_irq_reg(d, d->chip->unmask_base, i);
 			ret = regmap_irq_update_mask_bits(d, reg,
 					d->mask_buf_def[i], ~d->mask_buf[i]);
 			if (ret != 0)
@@ -149,7 +137,7 @@ static void regmap_irq_sync_unlock(struct irq_data *data)
 					reg);
 		}
 
-		reg = sub_irq_reg(d, d->chip->wake_base, i);
+		reg = d->get_irq_reg(d, d->chip->wake_base, i);
 		if (d->wake_buf) {
 			if (d->chip->wake_invert)
 				ret = regmap_update_bits(d->map, reg,
@@ -173,7 +161,7 @@ static void regmap_irq_sync_unlock(struct irq_data *data)
 		 * it'll be ignored in irq handler, then may introduce irq storm
 		 */
 		if (d->mask_buf[i] && (d->chip->ack_base || d->chip->use_ack)) {
-			reg = sub_irq_reg(d, d->chip->ack_base, i);
+			reg = d->get_irq_reg(d, d->chip->ack_base, i);
 
 			/* some chips ack by write 0 */
 			if (d->chip->ack_invert)
@@ -194,7 +182,7 @@ static void regmap_irq_sync_unlock(struct irq_data *data)
 
 	for (i = 0; i < d->chip->num_config_bases; i++) {
 		for (j = 0; j < d->chip->num_config_regs; j++) {
-			reg = sub_irq_reg(d, d->chip->config_base[i], j);
+			reg = d->get_irq_reg(d, d->chip->config_base[i], j);
 			ret = regmap_write(map, reg, d->config_buf[i][j]);
 			if (ret != 0)
 				dev_err(d->map->dev,
@@ -316,14 +304,17 @@ static inline int read_sub_irq_data(struct regmap_irq_chip_data *data,
 	const struct regmap_irq_chip *chip = data->chip;
 	struct regmap *map = data->map;
 	struct regmap_irq_sub_irq_map *subreg;
+	unsigned int reg;
 	int i, ret = 0;
 
 	if (!chip->sub_reg_offsets) {
-		/* Assume linear mapping */
-		ret = regmap_read(map, chip->status_base +
-				  (b * map->reg_stride * data->irq_reg_stride),
-				   &data->status_buf[b]);
+		reg = data->get_irq_reg(data, chip->status_base, b);
+		ret = regmap_read(map, reg, &data->status_buf[b]);
 	} else {
+		/*
+		 * Note we can't use get_irq_reg() here because the offsets
+		 * in 'subreg' are *not* interchangeable with indices.
+		 */
 		subreg = &chip->sub_reg_offsets[b];
 		for (i = 0; i < subreg->num_regs; i++) {
 			unsigned int offset = subreg->offset[i];
@@ -389,10 +380,19 @@ static irqreturn_t regmap_irq_thread(int irq, void *d)
 		 * sake of simplicity. and add bulk reads only if needed
 		 */
 		for (i = 0; i < chip->num_main_regs; i++) {
-			ret = regmap_read(map, chip->main_status +
-				  (i * map->reg_stride
-				   * data->irq_reg_stride),
-				  &data->main_status_buf[i]);
+			/*
+			 * For not_fixed_stride, don't use get_irq_reg().
+			 * It would produce an incorrect result.
+			 */
+			if (data->chip->not_fixed_stride)
+				reg = chip->main_status +
+					(i * map->reg_stride *
+					 data->irq_reg_stride);
+			else
+				reg = data->get_irq_reg(data,
+							chip->main_status, i);
+
+			ret = regmap_read(map, reg, &data->main_status_buf[i]);
 			if (ret) {
 				dev_err(map->dev,
 					"Failed to read IRQ status %d\n",
@@ -457,7 +457,7 @@ static irqreturn_t regmap_irq_thread(int irq, void *d)
 
 	} else {
 		for (i = 0; i < data->chip->num_regs; i++) {
-			unsigned int reg = sub_irq_reg(data,
+			unsigned int reg = data->get_irq_reg(data,
 					data->chip->status_base, i);
 			ret = regmap_read(map, reg, &data->status_buf[i]);
 
@@ -485,7 +485,7 @@ static irqreturn_t regmap_irq_thread(int irq, void *d)
 		data->status_buf[i] &= ~data->mask_buf[i];
 
 		if (data->status_buf[i] && (chip->ack_base || chip->use_ack)) {
-			reg = sub_irq_reg(data, data->chip->ack_base, i);
+			reg = data->get_irq_reg(data, data->chip->ack_base, i);
 
 			if (chip->ack_invert)
 				ret = regmap_write(map, reg,
@@ -545,6 +545,37 @@ static const struct irq_domain_ops regmap_domain_ops = {
 	.xlate	= irq_domain_xlate_onetwocell,
 };
 
+/**
+ * regmap_irq_get_irq_reg_linear() - Linear IRQ register mapping callback.
+ *
+ * @data: Data for the &struct regmap_irq_chip
+ * @base: Base register
+ * @index: Register index
+ *
+ * Returns the register address corresponding to the given @base and @index
+ * by the formula ``base + index * regmap_stride * irq_reg_stride``.
+ */
+unsigned int regmap_irq_get_irq_reg_linear(struct regmap_irq_chip_data *data,
+					   unsigned int base, int index)
+{
+	const struct regmap_irq_chip *chip = data->chip;
+	struct regmap *map = data->map;
+
+	/*
+	 * NOTE: This is for backward compatibility only and will be removed
+	 * when not_fixed_stride is dropped (it's only used by qcom-pm8008).
+	 */
+	if (chip->not_fixed_stride && chip->sub_reg_offsets) {
+		struct regmap_irq_sub_irq_map *subreg;
+
+		subreg = &chip->sub_reg_offsets[0];
+		return base + subreg->offset[0];
+	}
+
+	return base + index * (map->reg_stride * chip->irq_reg_stride);
+}
+EXPORT_SYMBOL_GPL(regmap_irq_get_irq_reg_linear);
+
 /**
  * regmap_irq_set_type_config_simple() - Simple IRQ type configuration callback.
  *
@@ -730,6 +761,11 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 	else
 		d->irq_reg_stride = 1;
 
+	if (chip->get_irq_reg)
+		d->get_irq_reg = chip->get_irq_reg;
+	else
+		d->get_irq_reg = regmap_irq_get_irq_reg_linear;
+
 	if (regmap_irq_can_bulk_read_status(d)) {
 		d->status_reg_buf = kmalloc_array(chip->num_regs,
 						  map->format.val_bytes,
@@ -749,7 +785,7 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 		d->mask_buf[i] = d->mask_buf_def[i];
 
 		if (d->chip->mask_base) {
-			reg = sub_irq_reg(d, d->chip->mask_base, i);
+			reg = d->get_irq_reg(d, d->chip->mask_base, i);
 			ret = regmap_irq_update_mask_bits(d, reg,
 					d->mask_buf_def[i], d->mask_buf[i]);
 			if (ret != 0) {
@@ -760,7 +796,7 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 		}
 
 		if (d->chip->unmask_base) {
-			reg = sub_irq_reg(d, d->chip->unmask_base, i);
+			reg = d->get_irq_reg(d, d->chip->unmask_base, i);
 			ret = regmap_irq_update_mask_bits(d, reg,
 					d->mask_buf_def[i], ~d->mask_buf[i]);
 			if (ret != 0) {
@@ -774,7 +810,7 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 			continue;
 
 		/* Ack masked but set interrupts */
-		reg = sub_irq_reg(d, d->chip->status_base, i);
+		reg = d->get_irq_reg(d, d->chip->status_base, i);
 		ret = regmap_read(map, reg, &d->status_buf[i]);
 		if (ret != 0) {
 			dev_err(map->dev, "Failed to read IRQ status: %d\n",
@@ -786,7 +822,7 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 			d->status_buf[i] = ~d->status_buf[i];
 
 		if (d->status_buf[i] && (chip->ack_base || chip->use_ack)) {
-			reg = sub_irq_reg(d, d->chip->ack_base, i);
+			reg = d->get_irq_reg(d, d->chip->ack_base, i);
 			if (chip->ack_invert)
 				ret = regmap_write(map, reg,
 					~(d->status_buf[i] & d->mask_buf[i]));
@@ -811,7 +847,7 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 	if (d->wake_buf) {
 		for (i = 0; i < chip->num_regs; i++) {
 			d->wake_buf[i] = d->mask_buf_def[i];
-			reg = sub_irq_reg(d, d->chip->wake_base, i);
+			reg = d->get_irq_reg(d, d->chip->wake_base, i);
 
 			if (chip->wake_invert)
 				ret = regmap_update_bits(d->map, reg,
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index bb625a1edef9..be51af0a2425 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -1424,6 +1424,8 @@ struct regmap_irq_sub_irq_map {
 	unsigned int *offset;
 };
 
+struct regmap_irq_chip_data;
+
 /**
  * struct regmap_irq_chip - Description of a generic regmap irq_chip.
  *
@@ -1489,6 +1491,13 @@ struct regmap_irq_sub_irq_map {
  * @handle_post_irq: Driver specific callback to handle interrupt from device
  *		     after handling the interrupts in regmap_irq_handler().
  * @set_type_config: Callback used for configuring irq types.
+ * @get_irq_reg: Callback for mapping (base register, index) pairs to register
+ *		 addresses. The base register will be one of @status_base,
+ *		 @mask_base, etc., @main_status, or any of @config_base.
+ *		 The index will be in the range [0, num_main_regs[ for the
+ *		 main status base, [0, num_type_settings[ for any config
+ *		 register base, and [0, num_regs[ for any other base.
+ *		 If unspecified then regmap_irq_get_irq_reg_linear() is used.
  * @irq_drv_data:    Driver specific IRQ data which is passed as parameter when
  *		     driver specific pre/post interrupt handler is called.
  *
@@ -1535,11 +1544,13 @@ struct regmap_irq_chip {
 	int (*handle_post_irq)(void *irq_drv_data);
 	int (*set_type_config)(unsigned int **buf, unsigned int type,
 			       const struct regmap_irq *irq_data, int idx);
+	unsigned int (*get_irq_reg)(struct regmap_irq_chip_data *data,
+				    unsigned int base, int index);
 	void *irq_drv_data;
 };
 
-struct regmap_irq_chip_data;
-
+unsigned int regmap_irq_get_irq_reg_linear(struct regmap_irq_chip_data *data,
+					   unsigned int base, int index);
 int regmap_irq_set_type_config_simple(unsigned int **buf, unsigned int type,
 				      const struct regmap_irq *irq_data, int idx);
 
-- 
2.35.1

