Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD12D554F6D
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:35:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 611F421D5;
	Wed, 22 Jun 2022 17:34:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 611F421D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655912141;
	bh=FpGKCq2GGtLX13/bAR9ApL0zzxiJlvthiIpB7Iv1RcU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jbtwP+EFLUeM7aYN5iCJzZEVQntOpqh6TY8l1Ltqji+C5vYacaNDICzI2hjiIi3V1
	 lQCXLGXaHVuPMRdJdRC0QF1D0fKi6EVuVbK8qPC92GRxOk1SrpfIuiBVu8u7vEaNcv
	 Kn0OhNjTeYbEdFxsmzz84zIXGDnRZpiiwFJOvYj0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4103F8063D;
	Wed, 22 Jun 2022 17:23:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5CB9AF804E7; Mon, 20 Jun 2022 22:07:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,SPF_HELO_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D5DBF804D2
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 22:07:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D5DBF804D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="l4GFUZrK"
Received: by mail-wr1-x431.google.com with SMTP id m1so8326299wrb.2
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 13:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=klzG1EiAdFscBZBcoCzDKMr3GKqX2S6ab3hLTukICYA=;
 b=l4GFUZrKtyjWTlZn2W6sbNe7RkJpSisjb5nPFCMRsK4VVftYk11OQgyGsUsVQOVVxd
 WveltYUyuvOFbYFUdYhxpXNuxE4S4YCumzKcvnxPGX4OsA13JEey1GXiYfj+BN3FyuAk
 YoyM6iFFHOgbk2ykc+NDEEHh/n23+NkaBHDoIRTmULng90YVn+qOGMdpsjX8phANF5/i
 sk5OxAxVvNJ2GPbb6NqRjZvP8u6Pf1FxTRCjPvzgHPcXQnzfgqR8rhEIYzbMNaK4cAp6
 yiv/olpO3Koxh4OhoUfRvU3fEVkmdETxuX090a9/gNWOJYRM4fDVw5XWJYzxI9yxqfA6
 IXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=klzG1EiAdFscBZBcoCzDKMr3GKqX2S6ab3hLTukICYA=;
 b=h1vQ8BX+ppv7c09DUswXkAB471AZvCDzYTds8A8bASic6/8WA9BYvnOvmpJdh47fH0
 Cg8he4hRq2quYoBU5JNzszDpdnoqt4KI+YSGNSu0bLuO2gtHJr0Gfk8XREHAiJkAq7jN
 FnW1VOrQdQaq7YLAdNw33wea3zbl8sr96FrrL8ttItBJlhJ8mOysNXqEcNsB+QrTQPPD
 POzevNc3WIRoQZKlqXNOFxD9UybgXX6h4whD3d247dj94fpsi2qVjfwvajJuQ260/EyJ
 flaURTP4ma65CNUs3VNO1wD1Ihnirh2jccVYLWXZknuuQ6dc7BHi0zODl5chq5uwpprT
 c4yQ==
X-Gm-Message-State: AJIora+CkuN4DcgXuGH81aV32npECv6ZlRZUN0UD3GyzUumrL/aIe2/U
 JHWD9BKs18sz+IThEI3Nnhk=
X-Google-Smtp-Source: AGRyM1tNlpsLQBbADqcDPRR01JRNtswf/HBtBf5oihaYlvZj08PdTVfZrZn0YfVlGpD8PsGFQGId1w==
X-Received: by 2002:a5d:5981:0:b0:218:51ae:8808 with SMTP id
 n1-20020a5d5981000000b0021851ae8808mr24885992wri.244.1655755648056; 
 Mon, 20 Jun 2022 13:07:28 -0700 (PDT)
Received: from localhost (92.40.169.63.threembb.co.uk. [92.40.169.63])
 by smtp.gmail.com with ESMTPSA id
 d3-20020adffbc3000000b0020e6ce4dabdsm14219147wrs.103.2022.06.20.13.07.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 13:07:27 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 45/49] regmap-irq: Remove mask_invert flag
Date: Mon, 20 Jun 2022 21:06:40 +0100
Message-Id: <20220620200644.1961936-46-aidanmacdonald.0x0@gmail.com>
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

An inverted mask register can be represented more directly
as an unmask register. Drop the redundant mask_invert flag.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/base/regmap/regmap-irq.c | 30 ++++++++----------------------
 include/linux/regmap.h           |  2 --
 2 files changed, 8 insertions(+), 24 deletions(-)

diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-irq.c
index 8a718615fd09..0a8edaee064a 100644
--- a/drivers/base/regmap/regmap-irq.c
+++ b/drivers/base/regmap/regmap-irq.c
@@ -30,9 +30,6 @@ struct regmap_irq_chip_data {
 	int irq;
 	int wake_count;
 
-	unsigned int mask_base;
-	unsigned int unmask_base;
-
 	void *status_reg_buf;
 	unsigned int *main_status_buf;
 	unsigned int *status_buf;
@@ -126,8 +123,8 @@ static void regmap_irq_sync_unlock(struct irq_data *data)
 	 * suppress pointless writes.
 	 */
 	for (i = 0; i < d->chip->num_regs; i++) {
-		if (d->mask_base) {
-			reg = sub_irq_reg(d, d->mask_base, i);
+		if (d->chip->mask_base) {
+			reg = sub_irq_reg(d, d->chip->mask_base, i);
 			ret = regmap_irq_update_mask_bits(d, reg,
 					d->mask_buf_def[i], d->mask_buf[i]);
 			if (ret != 0)
@@ -135,8 +132,8 @@ static void regmap_irq_sync_unlock(struct irq_data *data)
 					reg);
 		}
 
-		if (d->unmask_base) {
-			reg = sub_irq_reg(d, d->unmask_base, i);
+		if (d->chip->unmask_base) {
+			reg = sub_irq_reg(d, d->chip->unmask_base, i);
 			ret = regmap_irq_update_mask_bits(d, reg,
 					d->mask_buf_def[i], ~d->mask_buf[i]);
 			if (ret != 0)
@@ -721,17 +718,6 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 	d->chip = chip;
 	d->irq_base = irq_base;
 
-	/*
-	 * Swap role of mask_base and unmask_base if mask bits are inverted.
-	 */
-	if (chip->mask_invert) {
-		d->mask_base = chip->unmask_base;
-		d->unmask_base = chip->mask_base;
-	} else {
-		d->mask_base = chip->mask_base;
-		d->unmask_base = chip->unmask_base;
-	}
-
 	if (chip->irq_reg_stride)
 		d->irq_reg_stride = chip->irq_reg_stride;
 	else
@@ -756,8 +742,8 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 	for (i = 0; i < chip->num_regs; i++) {
 		d->mask_buf[i] = d->mask_buf_def[i];
 
-		if (d->mask_base) {
-			reg = sub_irq_reg(d, d->mask_base, i);
+		if (d->chip->mask_base) {
+			reg = sub_irq_reg(d, d->chip->mask_base, i);
 			ret = regmap_irq_update_mask_bits(d, reg,
 					d->mask_buf_def[i], d->mask_buf[i]);
 			if (ret != 0) {
@@ -767,8 +753,8 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 			}
 		}
 
-		if (d->unmask_base) {
-			reg = sub_irq_reg(d, d->unmask_base, i);
+		if (d->chip->unmask_base) {
+			reg = sub_irq_reg(d, d->chip->unmask_base, i);
 			ret = regmap_irq_update_mask_bits(d, reg,
 					d->mask_buf_def[i], ~d->mask_buf[i]);
 			if (ret != 0) {
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index a3103c88e936..bb625a1edef9 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -1462,7 +1462,6 @@ struct regmap_irq_sub_irq_map {
  * @config_base: Base address for IRQ type config regs. If null unsupported.
  * @irq_reg_stride:  Stride to use for chips where registers are not contiguous.
  * @init_ack_masked: Ack all masked interrupts once during initalization.
- * @mask_invert: Inverted mask register: cleared bits are masked out.
  * @use_ack:     Use @ack register even if it is zero.
  * @ack_invert:  Inverted ack register: cleared bits for ack.
  * @clear_ack:  Use this to set 1 and 0 or vice-versa to clear interrupts.
@@ -1514,7 +1513,6 @@ struct regmap_irq_chip {
 	unsigned int irq_reg_stride;
 	bool mask_writeonly:1;
 	bool init_ack_masked:1;
-	bool mask_invert:1;
 	bool use_ack:1;
 	bool ack_invert:1;
 	bool clear_ack:1;
-- 
2.35.1

