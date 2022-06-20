Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3BE554F4A
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:29:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5CE41FB6;
	Wed, 22 Jun 2022 17:28:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5CE41FB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655911778;
	bh=bKR2Ma6Uwh0Hd8xzrlk9x3uRMNl2yTOWCa4uGeCdBS8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N4fcPa1V5ySbUh6wSu5Q8i4xeVjnUM6lfJaL/dfrxfdgWypUqu/jWdNMDrHMEbZ7G
	 sZaYQZAXxxl53lBUu38kR4fG4r8t4i0F7mgdn0aTJGwyPwJzXHZwL74PCO0uZS0K2+
	 2tPXAAlkj57Zz6wUMKeB8DAkMtR4MSdfaSiJZRmQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 946E6F805D8;
	Wed, 22 Jun 2022 17:23:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 411D5F800E3; Mon, 20 Jun 2022 22:06:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
 DKIM_INVALID,DKIM_SIGNED,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
 NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B105F804D2
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 22:06:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B105F804D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jmla8ZkA"
Received: by mail-wm1-x32e.google.com with SMTP id z17so6380131wmi.1
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 13:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1GpLIZISKqF9zFT4V1VJAxmf6nn2WqheoAcUl14eN+0=;
 b=jmla8ZkAOgrPskXynLCx05NWcsoEkbzw4ryinc4jYDe2RQIqHhPmV85RQKl7U9EmUI
 bF6TQ7O+iemjbNinkBjDldrg2yYic5jWOfe5sSL2/VPNdE+cj0lrEbPwTlpJTZs7BttW
 crq3WUJJa6c/dObTJx9WHn0Fl68Y8gRDUlBvzH70ODYLEG0pgioICXVMDThfVXbcB68W
 ixmvmMn2GGU7Gnw+8ih+LjNZ3VEsZF5IpRaRfmraY75SBGsUraU0gCZChrsxbjdlp0c3
 X2WoHLbmrUSCLmnOMru0muZcahA8wUBHqdqxnvkpgp8UxCePBtXvm2MD7P0hwoO2uvZb
 BGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1GpLIZISKqF9zFT4V1VJAxmf6nn2WqheoAcUl14eN+0=;
 b=TX8RVOEtiNMDih9YVlGCJgqr5npIAdJdFKPEvXECjfbF9o+qwpqBzVht/jjWvwiyUS
 OVOcjT/CFGPIZKqZDgbHIAWWT1ZUtxnzHGXwTaqkLnKzXImCDPjM7SpZYIlp76OtFX+h
 GufidGywEenMvGJyTczP9ADRB6BqET5RSR8KCjiP3gUmkMPRYzQeWO3RLjtXMJNK1NWp
 fS0c+iye5NjTxelERpXuuz40FjwA0XZTLh27oio4/vfTRNNetdmDshkXgGyFXlbAbRGI
 uTTs1fmNI1q9kTkzywYgcFfmKxZ5HujJ03MLQpckmO+z4cpwZ5f4jSGSsST2LykfAVHb
 IDUw==
X-Gm-Message-State: AOAM530cjdgVsGqdJKgNIFDwAS+NU21/PvtX5BBQrfmclRgezcJcm9pe
 i0oQuSotPClyP7IkA33vEgM=
X-Google-Smtp-Source: ABdhPJx5dO+fQ4bSwFvdlpiB13bqVgu0Tmz5FemzXFKDgDhK5sVpfqzf/x7Jf9ygCYEoM4c832uaSw==
X-Received: by 2002:a05:600c:19cb:b0:397:51db:446f with SMTP id
 u11-20020a05600c19cb00b0039751db446fmr36963462wmq.182.1655755605944; 
 Mon, 20 Jun 2022 13:06:45 -0700 (PDT)
Received: from localhost (92.40.169.68.threembb.co.uk. [92.40.169.68])
 by smtp.gmail.com with ESMTPSA id
 t17-20020adfe111000000b002102cc4d63asm17480550wrz.81.2022.06.20.13.06.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 13:06:45 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 20/49] regmap-irq: Fix inverted handling of unmask registers
Date: Mon, 20 Jun 2022 21:06:15 +0100
Message-Id: <20220620200644.1961936-21-aidanmacdonald.0x0@gmail.com>
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

To me "unmask" suggests that we write 1s to the register when
an interrupt is enabled. This also makes sense because it's the
opposite of what the "mask" register does (write 1s to disable
an interrupt).

But regmap-irq does the opposite: for a disabled interrupt, it
writes 1s to "unmask" and 0s to "mask". This is surprising and
deviates from the usual way mask registers are handled.

Additionally, mask_invert didn't interact with unmask registers
properly -- it caused them to be ignored entirely.

Fix this by making mask and unmask registers orthogonal, using
the following behavior:

* Mask registers are written with 1s for disabled interrupts.
* Unmask registers are written with 1s for enabled interrupts.

This behavior supports both normal or inverted mask registers
and separate set/clear registers via different combinations of
mask_base/unmask_base. The mask_invert flag is made redundant,
since an inverted mask register can be described more directly
as an unmask register.

To cope with existing drivers that rely on the old "backward"
behavior, check for the broken_mask_unmask flag and swap the
roles of mask/unmask registers. This is a compatibility measure
which can be dropped once the drivers are updated to use the
new, more consistent behavior.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/base/regmap/regmap-irq.c | 96 +++++++++++++++++---------------
 include/linux/regmap.h           |  7 ++-
 2 files changed, 55 insertions(+), 48 deletions(-)

diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-irq.c
index 875415fc3133..082a2981120c 100644
--- a/drivers/base/regmap/regmap-irq.c
+++ b/drivers/base/regmap/regmap-irq.c
@@ -30,6 +30,9 @@ struct regmap_irq_chip_data {
 	int irq;
 	int wake_count;
 
+	unsigned int mask_base;
+	unsigned int unmask_base;
+
 	void *status_reg_buf;
 	unsigned int *main_status_buf;
 	unsigned int *status_buf;
@@ -95,7 +98,6 @@ static void regmap_irq_sync_unlock(struct irq_data *data)
 	struct regmap *map = d->map;
 	int i, j, ret;
 	u32 reg;
-	u32 unmask_offset;
 	u32 val;
 
 	if (d->chip->runtime_pm) {
@@ -124,35 +126,23 @@ static void regmap_irq_sync_unlock(struct irq_data *data)
 	 * suppress pointless writes.
 	 */
 	for (i = 0; i < d->chip->num_regs; i++) {
-		if (!d->chip->mask_base)
-			continue;
-
-		reg = sub_irq_reg(d, d->chip->mask_base, i);
-		if (d->chip->mask_invert) {
+		if (d->mask_base) {
+			reg = sub_irq_reg(d, d->mask_base, i);
 			ret = regmap_irq_update_mask_bits(d, reg,
-					 d->mask_buf_def[i], ~d->mask_buf[i]);
-		} else if (d->chip->unmask_base) {
-			/* set mask with mask_base register */
+					d->mask_buf_def[i], d->mask_buf[i]);
+			if (ret != 0)
+				dev_err(d->map->dev, "Failed to sync masks in %x\n",
+					reg);
+		}
+
+		if (d->unmask_base) {
+			reg = sub_irq_reg(d, d->unmask_base, i);
 			ret = regmap_irq_update_mask_bits(d, reg,
 					d->mask_buf_def[i], ~d->mask_buf[i]);
-			if (ret < 0)
-				dev_err(d->map->dev,
-					"Failed to sync unmasks in %x\n",
+			if (ret != 0)
+				dev_err(d->map->dev, "Failed to sync masks in %x\n",
 					reg);
-			unmask_offset = d->chip->unmask_base -
-							d->chip->mask_base;
-			/* clear mask with unmask_base register */
-			ret = regmap_irq_update_mask_bits(d,
-					reg + unmask_offset,
-					d->mask_buf_def[i],
-					d->mask_buf[i]);
-		} else {
-			ret = regmap_irq_update_mask_bits(d, reg,
-					 d->mask_buf_def[i], d->mask_buf[i]);
 		}
-		if (ret != 0)
-			dev_err(d->map->dev, "Failed to sync masks in %x\n",
-				reg);
 
 		reg = sub_irq_reg(d, d->chip->wake_base, i);
 		if (d->wake_buf) {
@@ -634,7 +624,6 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 	int i;
 	int ret = -ENOMEM;
 	u32 reg;
-	u32 unmask_offset;
 
 	if (chip->num_regs <= 0)
 		return -EINVAL;
@@ -732,6 +721,24 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 	d->chip = chip;
 	d->irq_base = irq_base;
 
+	/*
+	 * Swap role of mask_base and unmask_base if mask bits are inverted.
+	 *
+	 * Historically, chips that specify both mask_base and unmask_base
+	 * got inverted mask behavior; this was arguably a bug in regmap-irq
+	 * and there was no way to get the normal, non-inverted behavior.
+	 * Those chips will set the broken_mask_unmask flag. They don't set
+	 * mask_invert so there is no need to worry about interactions with
+	 * that flag.
+	 */
+	if (chip->mask_invert || chip->broken_mask_unmask) {
+		d->mask_base = chip->unmask_base;
+		d->unmask_base = chip->mask_base;
+	} else {
+		d->mask_base = chip->mask_base;
+		d->unmask_base = chip->unmask_base;
+	}
+
 	if (chip->irq_reg_stride)
 		d->irq_reg_stride = chip->irq_reg_stride;
 	else
@@ -755,28 +762,27 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 	/* Mask all the interrupts by default */
 	for (i = 0; i < chip->num_regs; i++) {
 		d->mask_buf[i] = d->mask_buf_def[i];
-		if (!chip->mask_base)
-			continue;
 
-		reg = sub_irq_reg(d, d->chip->mask_base, i);
-
-		if (chip->mask_invert)
+		if (d->mask_base) {
+			reg = sub_irq_reg(d, d->mask_base, i);
 			ret = regmap_irq_update_mask_bits(d, reg,
-					 d->mask_buf[i], ~d->mask_buf[i]);
-		else if (d->chip->unmask_base) {
-			unmask_offset = d->chip->unmask_base -
-					d->chip->mask_base;
-			ret = regmap_irq_update_mask_bits(d,
-					reg + unmask_offset,
-					d->mask_buf[i],
-					d->mask_buf[i]);
-		} else
+					d->mask_buf_def[i], d->mask_buf[i]);
+			if (ret != 0) {
+				dev_err(map->dev, "Failed to set masks in 0x%x: %d\n",
+					reg, ret);
+				goto err_alloc;
+			}
+		}
+
+		if (d->unmask_base) {
+			reg = sub_irq_reg(d, d->unmask_base, i);
 			ret = regmap_irq_update_mask_bits(d, reg,
-					 d->mask_buf[i], d->mask_buf[i]);
-		if (ret != 0) {
-			dev_err(map->dev, "Failed to set masks in 0x%x: %d\n",
-				reg, ret);
-			goto err_alloc;
+					d->mask_buf_def[i], ~d->mask_buf[i]);
+			if (ret != 0) {
+				dev_err(map->dev, "Failed to set masks in 0x%x: %d\n",
+					reg, ret);
+				goto err_alloc;
+			}
 		}
 
 		if (!chip->init_ack_masked)
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index 21a70fd99493..0cf3c4a66946 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -1451,10 +1451,11 @@ struct regmap_irq_sub_irq_map {
  *		   main_status set.
  *
  * @status_base: Base status register address.
- * @mask_base:   Base mask register address.
+ * @mask_base:   Base mask register address. Mask bits are set to 1 when an
+ *               interrupt is masked, 0 when unmasked.
  * @mask_writeonly: Base mask register is write only.
- * @unmask_base:  Base unmask register address. for chips who have
- *                separate mask and unmask registers
+ * @unmask_base:  Base unmask register address. Unmask bits are set to 1 when
+ *                an interrupt is unmasked and 0 when masked.
  * @ack_base:    Base ack address. If zero then the chip is clear on read.
  *               Using zero value is possible with @use_ack bit.
  * @wake_base:   Base address for wake enables.  If zero unsupported.
-- 
2.35.1

