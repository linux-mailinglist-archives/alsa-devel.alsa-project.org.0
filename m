Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D42554F2B
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:27:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A1911F90;
	Wed, 22 Jun 2022 17:26:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A1911F90
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655911634;
	bh=IQFbZ81Tkk/TwR3CoDrS75qztXU02oLstDsTVs67B0M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o1z7EJb2u6hpl1dY6HY7g3pO87NcvKK04cseAX1P5/WfzoxTvjby8sGM1m7u+Z6y/
	 Wp7QgdvCLkrhvwdBmlbyaQKrVsRGgoLFGwS8IZK/R++SnrFiMpiZd3894+OkAt/RwV
	 hIGQHKeOp9mIxFpY2a8YLRcxwz4YmZiIvIenxx+k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 190E3F8059F;
	Wed, 22 Jun 2022 17:23:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3473BF804E5; Mon, 20 Jun 2022 22:06:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,SPF_HELO_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 153C0F804D8
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 22:06:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 153C0F804D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Z5NU7sru"
Received: by mail-wm1-x32c.google.com with SMTP id
 m125-20020a1ca383000000b0039c63fe5f64so6210561wme.0
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 13:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NSMrw3v+dSzormMBlFnVqYO9Ybr8y9x05CczXbq+F0o=;
 b=Z5NU7srurHjdW0PF4O55elxfUZBgUDk5YPFMpg1RdqsrfEMk7qqDL8ep246OtTDiC4
 6ju1VuX4sBfj/74uye9hCH9gCwZwRwcHtZnxI5fARi8+LKkAfdtx6MsYh7Pd2V1TJjz4
 mBfORf4k+PothfafLBhj4toSDqA8T3fphY7zdnpKPOEXFqu9HOx5TIDgCjq0SHrD5+CC
 INWDLlQYTChLHohDgNjGViE1FGyoeWG6e0guIJwG/DdPTqvgerAxAxO0lis9868OmZEE
 CKl/wzAj2Z91E8tmS3NFKhGL/f5b2L127K+Vv0HRjyl36ABwGlxo+z8eyN1C5YXCAV/1
 VXTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NSMrw3v+dSzormMBlFnVqYO9Ybr8y9x05CczXbq+F0o=;
 b=EHz2uTWqRQLICAsswGWSVEuLRf1d4aqiEVOwiDayw5M4tVrTFPkIOpdrfcwjKtqLFj
 wLReMMlWXDfRfwgUKAGo/57x1pDjxDJfJRLmNX4haauah4huMh9u77i7d1oTxYExBjY5
 Dd7yHbxfV4Fqz2+7DB/0KV9lPpEH6nLLhDTNG0aUl9feXaj5tvYIuDNjmcCXVjUU1cW5
 hGGsvFkUUNoFC+EkMpznl36CACbB56Ef94VGkB9EdG8Z5V6tJS6LcP5CBAdfFl1kr6Pv
 Ieh20BYY48zuzzvNmU6F3i3+Lu1ZHIAbYItHqJWZVm0L1Q8BHm0LWHU4pwm1FBaEQ58z
 ii7w==
X-Gm-Message-State: AJIora86dmR85WqJ3c1VNw1tbMq6J54W5R6Qsit2gWd64dpF9zDWCTB0
 mMi0dM2Sm2UV1QF+QWKrGfE=
X-Google-Smtp-Source: AGRyM1v4nGqgjAhTskzkWcEAA3t4wJpSGRdFd7rK8rtyVQboY6GtKy9ysgj/zJBTNIGbPGeagfeUtA==
X-Received: by 2002:a05:600c:3d18:b0:39c:474c:eb with SMTP id
 bh24-20020a05600c3d1800b0039c474c00ebmr26181880wmb.87.1655755590681; 
 Mon, 20 Jun 2022 13:06:30 -0700 (PDT)
Received: from localhost (92.40.169.68.threembb.co.uk. [92.40.169.68])
 by smtp.gmail.com with ESMTPSA id
 u25-20020adfa199000000b002184a3a3641sm14724036wru.100.2022.06.20.13.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 13:06:30 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 10/49] regmap-irq: Remove virtual registers support
Date: Mon, 20 Jun 2022 21:06:05 +0100
Message-Id: <20220620200644.1961936-11-aidanmacdonald.0x0@gmail.com>
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

Virtual registers can be removed, since config registers implement
the same functionality.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/base/regmap/regmap-irq.c | 42 --------------------------------
 include/linux/regmap.h           |  9 -------
 2 files changed, 51 deletions(-)

diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-irq.c
index be35f2e41b8c..5a3e255816fd 100644
--- a/drivers/base/regmap/regmap-irq.c
+++ b/drivers/base/regmap/regmap-irq.c
@@ -38,7 +38,6 @@ struct regmap_irq_chip_data {
 	unsigned int *wake_buf;
 	unsigned int *type_buf;
 	unsigned int *type_buf_def;
-	unsigned int **virt_buf;
 	unsigned int **config_buf;
 
 	unsigned int irq_reg_stride;
@@ -218,20 +217,6 @@ static void regmap_irq_sync_unlock(struct irq_data *data)
 		}
 	}
 
-	if (d->chip->num_virt_regs) {
-		for (i = 0; i < d->chip->num_virt_regs; i++) {
-			for (j = 0; j < d->chip->num_regs; j++) {
-				reg = sub_irq_reg(d, d->chip->virt_reg_base[i],
-						  j);
-				ret = regmap_write(map, reg, d->virt_buf[i][j]);
-				if (ret != 0)
-					dev_err(d->map->dev,
-						"Failed to write virt 0x%x: %d\n",
-						reg, ret);
-			}
-		}
-	}
-
 	for (i = 0; i < d->chip->num_config_bases; i++) {
 		for (j = 0; j < d->chip->num_config_regs; j++) {
 			reg = sub_irq_reg(d, d->chip->config_base[i], j);
@@ -346,10 +331,6 @@ static int regmap_irq_set_type(struct irq_data *data, unsigned int type)
 		return -EINVAL;
 	}
 
-	if (d->chip->set_type_virt)
-		return d->chip->set_type_virt(d->virt_buf, type, data->hwirq,
-					      reg);
-
 	return 0;
 }
 
@@ -782,24 +763,6 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 			goto err_alloc;
 	}
 
-	if (chip->num_virt_regs) {
-		/*
-		 * Create virt_buf[chip->num_extra_config_regs][chip->num_regs]
-		 */
-		d->virt_buf = kcalloc(chip->num_virt_regs, sizeof(*d->virt_buf),
-				      GFP_KERNEL);
-		if (!d->virt_buf)
-			goto err_alloc;
-
-		for (i = 0; i < chip->num_virt_regs; i++) {
-			d->virt_buf[i] = kcalloc(chip->num_regs,
-						 sizeof(unsigned int),
-						 GFP_KERNEL);
-			if (!d->virt_buf[i])
-				goto err_alloc;
-		}
-	}
-
 	if (chip->num_config_bases && chip->num_config_regs) {
 		/*
 		 * Create config_buf[num_config_bases][num_config_regs]
@@ -989,11 +952,6 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 	kfree(d->mask_buf);
 	kfree(d->status_buf);
 	kfree(d->status_reg_buf);
-	if (d->virt_buf) {
-		for (i = 0; i < chip->num_virt_regs; i++)
-			kfree(d->virt_buf[i]);
-		kfree(d->virt_buf);
-	}
 	if (d->config_buf) {
 		for (i = 0; i < chip->num_config_bases; i++)
 			kfree(d->config_buf[i]);
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index e48d65756fb4..bb8c89a83b51 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -1459,7 +1459,6 @@ struct regmap_irq_sub_irq_map {
  *               Using zero value is possible with @use_ack bit.
  * @wake_base:   Base address for wake enables.  If zero unsupported.
  * @type_base:   Base address for irq type.  If zero unsupported.
- * @virt_reg_base:   Base addresses for extra config regs.
  * @config_base: Base address for IRQ type config regs. If null unsupported.
  * @irq_reg_stride:  Stride to use for chips where registers are not contiguous.
  * @init_ack_masked: Ack all masked interrupts once during initalization.
@@ -1486,8 +1485,6 @@ struct regmap_irq_sub_irq_map {
  *               assigned based on the index in the array of the interrupt.
  * @num_irqs:    Number of descriptors.
  * @num_type_reg:    Number of type registers.
- * @num_virt_regs:   Number of non-standard irq configuration registers.
- *		     If zero unsupported.
  * @type_reg_stride: Stride to use for chips where type registers are not
  *			contiguous.
  * @num_config_bases:	Number of config base registers.
@@ -1496,8 +1493,6 @@ struct regmap_irq_sub_irq_map {
  *		     before regmap_irq_handler process the interrupts.
  * @handle_post_irq: Driver specific callback to handle interrupt from device
  *		     after handling the interrupts in regmap_irq_handler().
- * @set_type_virt:   Driver specific callback to extend regmap_irq_set_type()
- *		     and configure virt regs.
  * @set_type_config: Callback used for configuring irq types.
  * @irq_drv_data:    Driver specific IRQ data which is passed as parameter when
  *		     driver specific pre/post interrupt handler is called.
@@ -1520,7 +1515,6 @@ struct regmap_irq_chip {
 	unsigned int ack_base;
 	unsigned int wake_base;
 	unsigned int type_base;
-	unsigned int *virt_reg_base;
 	const unsigned int *config_base;
 	unsigned int irq_reg_stride;
 	bool mask_writeonly:1;
@@ -1543,15 +1537,12 @@ struct regmap_irq_chip {
 	int num_irqs;
 
 	int num_type_reg;
-	int num_virt_regs;
 	int num_config_bases;
 	int num_config_regs;
 	unsigned int type_reg_stride;
 
 	int (*handle_pre_irq)(void *irq_drv_data);
 	int (*handle_post_irq)(void *irq_drv_data);
-	int (*set_type_virt)(unsigned int **buf, unsigned int type,
-			     unsigned long hwirq, int reg);
 	int (*set_type_config)(unsigned int **buf, unsigned int type,
 			       const struct regmap_irq *irq_data, int idx);
 	void *irq_drv_data;
-- 
2.35.1

