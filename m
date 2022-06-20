Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C986554F75
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:37:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CD491FF8;
	Wed, 22 Jun 2022 17:36:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CD491FF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655912220;
	bh=LPmWRtpk8Iv1gLgrL5S7E59zl2UAkHcU++RbqL+Cupg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xzxc9846BStN95697DM/77nz9qVr6Hqh9ZEhKvbiNyZEz+aioUlZXS1klOvy1Emfd
	 QDNXUU71CVzslEycRubPOesUcsBQ2ctUXYtBVBs6nYqHErLKm2z+QJJVd3arDULd4R
	 CU5XVMBIcpgr26f3N9HKnKsHQ3ZLbcjau8Uitnd0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E56D5F80678;
	Wed, 22 Jun 2022 17:23:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2ADC8F804D8; Mon, 20 Jun 2022 22:07:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,SPF_HELO_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B87BFF800CB
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 22:07:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B87BFF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="o6bhf9Ae"
Received: by mail-wr1-x430.google.com with SMTP id k22so9645746wrd.6
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 13:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8kelxsU1mTvCHb8JyuDiGnwBNKthLdTp6riqPTxASyE=;
 b=o6bhf9AeZ2+5NqgP4pO+3P9gyNweVr/bGU2k/NUXa6NYXjGakzCObDD7wDkgdnebAg
 v6HJT2NvVLc4mo3MpTeYh7ui7/s+BGJ7Q4/gnJt/JyyKpgFnZPhBR2Ka+BdipZTmpezs
 50XXSFPysaMCnC2KyoQqTfJgpwHcP8Qs6csQsoSjKJr7YEOzIlf0AvxEBaBGy51urmg4
 0Qc9l+ouyuPb6zVKalYja0H/6iGdSRaP0Jx3Ik9CPxUwZcQPoSFsBH2qzIwE8XNgSX1u
 1SryEGKFSLwPnYG9/aqm/DK+EGcho8O+D/L54CfDLfTFRjDpxwWLjKpGj0GZHfs/pPGX
 yvQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8kelxsU1mTvCHb8JyuDiGnwBNKthLdTp6riqPTxASyE=;
 b=czc+zsncnPpj/sn/OgNaCqLvAM88ATL2HJwKtFpN7XwM+tKHJo/zvtTMQLociRnYdz
 KUv8qPLm97zE4E72zalFy5k6ZoJwo87qpdqbZVnUaW58h4e2f7vq7oSa8aiprLHw3s/j
 76cbzxCtnzXSfCY5Qeg8YkPvoRXiyc7Fdq2nq4Yip2R9TztEVDu4bEviCWQ2APBk603U
 2VuXS6ePROXtI3ATNFtAwSo3C9Y7MsD0g5F/ZpPchIyRKzDo0jnVxy23LU4mRrUHQ9Dr
 Bg42YC8EAFi/bSwCE+q7EhVKctB7uPsK9D/1KTS2X9CGlpphPmX6YiPjz5zSTz09ptBD
 L3BQ==
X-Gm-Message-State: AJIora+XNtf47wkKDNKWDfYC9YNS5yC9HinDMdiU7lpV2I40lC7ZnuSz
 Vfd8AEbcV0yLqTRNK4QxLEE=
X-Google-Smtp-Source: AGRyM1svSmsGihGwSulWHMLA111MOtQXrfsi0glFa3Tcg1QRdKrN9n0oiKBKxxv3eSGlgwCYymRU0Q==
X-Received: by 2002:a05:6000:1689:b0:218:3fb1:fd30 with SMTP id
 y9-20020a056000168900b002183fb1fd30mr24704084wrd.302.1655755655073; 
 Mon, 20 Jun 2022 13:07:35 -0700 (PDT)
Received: from localhost (92.40.169.63.threembb.co.uk. [92.40.169.63])
 by smtp.gmail.com with ESMTPSA id
 j6-20020adff006000000b0021b892f4b35sm7152390wro.98.2022.06.20.13.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 13:07:34 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 49/49] regmap-irq: Remove not_fixed_stride flag
Date: Mon, 20 Jun 2022 21:06:44 +0100
Message-Id: <20220620200644.1961936-50-aidanmacdonald.0x0@gmail.com>
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

Clean up all the cruft related to not_fixed_stride. The same thing
can be accomplished with a custom get_irq_reg() callback.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/base/regmap/regmap-irq.c | 41 +++-----------------------------
 include/linux/regmap.h           |  7 ------
 2 files changed, 3 insertions(+), 45 deletions(-)

diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-irq.c
index acbd6e22b0cd..0c9dd218614a 100644
--- a/drivers/base/regmap/regmap-irq.c
+++ b/drivers/base/regmap/regmap-irq.c
@@ -320,15 +320,8 @@ static inline int read_sub_irq_data(struct regmap_irq_chip_data *data,
 			unsigned int offset = subreg->offset[i];
 			unsigned int index = offset / map->reg_stride;
 
-			if (chip->not_fixed_stride)
-				ret = regmap_read(map,
-						chip->status_base + offset,
-						&data->status_buf[b]);
-			else
-				ret = regmap_read(map,
-						chip->status_base + offset,
-						&data->status_buf[index]);
-
+			ret = regmap_read(map, chip->status_base + offset,
+					  &data->status_buf[index]);
 			if (ret)
 				break;
 		}
@@ -380,18 +373,7 @@ static irqreturn_t regmap_irq_thread(int irq, void *d)
 		 * sake of simplicity. and add bulk reads only if needed
 		 */
 		for (i = 0; i < chip->num_main_regs; i++) {
-			/*
-			 * For not_fixed_stride, don't use get_irq_reg().
-			 * It would produce an incorrect result.
-			 */
-			if (data->chip->not_fixed_stride)
-				reg = chip->main_status +
-					(i * map->reg_stride *
-					 data->irq_reg_stride);
-			else
-				reg = data->get_irq_reg(data,
-							chip->main_status, i);
-
+			reg = data->get_irq_reg(data, chip->main_status, i);
 			ret = regmap_read(map, reg, &data->main_status_buf[i]);
 			if (ret) {
 				dev_err(map->dev,
@@ -561,17 +543,6 @@ unsigned int regmap_irq_get_irq_reg_linear(struct regmap_irq_chip_data *data,
 	const struct regmap_irq_chip *chip = data->chip;
 	struct regmap *map = data->map;
 
-	/*
-	 * NOTE: This is for backward compatibility only and will be removed
-	 * when not_fixed_stride is dropped (it's only used by qcom-pm8008).
-	 */
-	if (chip->not_fixed_stride && chip->sub_reg_offsets) {
-		struct regmap_irq_sub_irq_map *subreg;
-
-		subreg = &chip->sub_reg_offsets[0];
-		return base + subreg->offset[0];
-	}
-
 	return base + index * (map->reg_stride * chip->irq_reg_stride);
 }
 EXPORT_SYMBOL_GPL(regmap_irq_get_irq_reg_linear);
@@ -674,12 +645,6 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 			return -EINVAL;
 	}
 
-	if (chip->not_fixed_stride) {
-		for (i = 0; i < chip->num_regs; i++)
-			if (chip->sub_reg_offsets[i].num_regs != 1)
-				return -EINVAL;
-	}
-
 	if (irq_base) {
 		irq_base = irq_alloc_descs(irq_base, 0, chip->num_irqs, 0);
 		if (irq_base < 0) {
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index be51af0a2425..ecd3682de269 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -1446,9 +1446,6 @@ struct regmap_irq_chip_data;
  *		     status_base. Should contain num_regs arrays.
  *		     Can be provided for chips with more complex mapping than
  *		     1.st bit to 1.st sub-reg, 2.nd bit to 2.nd sub-reg, ...
- *		     When used with not_fixed_stride, each one-element array
- *		     member contains offset calculated as address from each
- *		     peripheral to first peripheral.
  * @num_main_regs: Number of 'main status' irq registers for chips which have
  *		   main_status set.
  *
@@ -1474,9 +1471,6 @@ struct regmap_irq_chip_data;
  * @clear_on_unmask: For chips with interrupts cleared on read: read the status
  *                   registers before unmasking interrupts to clear any bits
  *                   set when they were masked.
- * @not_fixed_stride: Used when chip peripherals are not laid out with fixed
- * 		      stride. Must be used with sub_reg_offsets containing the
- * 		      offsets to each peripheral.
  * @status_invert: Inverted status register: cleared bits are active interrupts.
  * @runtime_pm:  Hold a runtime PM lock on the device when accessing it.
  *
@@ -1529,7 +1523,6 @@ struct regmap_irq_chip {
 	bool runtime_pm:1;
 	bool type_in_mask:1;
 	bool clear_on_unmask:1;
-	bool not_fixed_stride:1;
 	bool status_invert:1;
 
 	int num_regs;
-- 
2.35.1

