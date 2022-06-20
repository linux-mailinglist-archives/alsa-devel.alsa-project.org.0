Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB78554F33
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:28:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6F5A1FD7;
	Wed, 22 Jun 2022 17:27:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6F5A1FD7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655911682;
	bh=gMNbHY29UPLkdXChiQNgYIVLZhcUFBbBbZ0ffSudAAA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dytPnG2I2CMY8NzbGtJ5BBrBmdQFc1JEwLcRBjt1gBUVWpvcft/Lh5tTNbPrx6keB
	 78tSo6uCSCpIOZIV96UxWCnT6FXD5JmzLOFofOEb7ehyyP2pn6azvGTzwWArEFd9Vt
	 H8WCd+vNGTRttoO7ZvnQmbjFaq3Ot19Fj2e6HFDA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B65D8F805B4;
	Wed, 22 Jun 2022 17:23:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54D9CF804E5; Mon, 20 Jun 2022 22:06:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F9ABF804DA
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 22:06:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F9ABF804DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="j2RQqZvh"
Received: by mail-wr1-x42a.google.com with SMTP id e25so12215275wrc.13
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 13:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A1yO+P1r84NYRYcFw/ZOtSs0+i9q2Gv8RY8Jy0yOWqY=;
 b=j2RQqZvh6APhdsK/EoTEu81N6Pul31dRgCB3yZd8hs5x1U3Wtqcpi2IyHAfCICffHg
 gRE46BYS28U7XDvZvtUKB6Bkt51LTKNLuZl3ptMzn6BQlBgLD2r3jh/R/AjmK32xBhB/
 0LpqqAVt8CRLw8siXXmzBnqgCtafznYB6s/GT5pjpaL3Ybu6ff4EmEAU0UeweWfDlu9D
 gOHJaQkTCVmjnZ/VC5kfoHwVeu8ak+VVcbBIvos7fbcasrp9o1zr3tS8GqZqPBD0EZVy
 6K+rt8doOLqgDBdCB8rSjJnqOboGjisOhkwGg2ROmQbfj+bRGDs7mmQs1WJsKO3Yyqid
 O2RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A1yO+P1r84NYRYcFw/ZOtSs0+i9q2Gv8RY8Jy0yOWqY=;
 b=Bo0A3xTJMqI3swdqWZIqdEkI/P63QWbrsp0sGXHu6l111QLxB27wqwiqXHkJBKZBI5
 JrL8jeD7gM9Hzs1Np+7sroCojNCliKzORd6KzxHrnz4NBqrCW95zXlop+LXxacT3zZBB
 LbfO8/nWH/lNTRutcmuc9cieBokxvsoIHVt5shNVhp2byenU5LsItsGDp3niuLqqGy99
 ChpmSQGuuRqxv4DZeFrZOjSFAp68oy0GhJvAto3Rli51rL7adHkRo1e2LAhG2Ymr6Jvy
 RNwQ9nw5J8vg2+XTLun8XS9tX8iHsTm/nxRDF+77uBZ32O7sPB0Kqka3vSh69vSm6fEE
 QB+Q==
X-Gm-Message-State: AJIora+c6FdJfipJMFeXVE2pK7Fup5p7uDk5BIDfTd1XeN/txW7MBbLD
 m3h4Izdzu5DXadwZbZc8C+Q=
X-Google-Smtp-Source: AGRyM1vhjUq4WlL+gX1y0tyZ4A5CURR86xjVYNDJLu6ZP96h77dZI91Uh7rAWnxqjmtwV7H8z5gWhg==
X-Received: by 2002:a5d:67c3:0:b0:21b:8cd4:ad60 with SMTP id
 n3-20020a5d67c3000000b0021b8cd4ad60mr8680011wrw.380.1655755600064; 
 Mon, 20 Jun 2022 13:06:40 -0700 (PDT)
Received: from localhost (92.40.169.68.threembb.co.uk. [92.40.169.68])
 by smtp.gmail.com with ESMTPSA id
 n1-20020a5d4201000000b0021a36955493sm14274307wrq.74.2022.06.20.13.06.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 13:06:39 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 16/49] regmap-irq: Rename regmap_irq_update_bits()
Date: Mon, 20 Jun 2022 21:06:11 +0100
Message-Id: <20220620200644.1961936-17-aidanmacdonald.0x0@gmail.com>
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

This function should only be used for updating mask bits, since
it checks the mask_writeonly flag. To avoid confusion, rename it
to regmap_irq_update_mask_bits().

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/base/regmap/regmap-irq.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-irq.c
index 4c0d7f7aa544..875415fc3133 100644
--- a/drivers/base/regmap/regmap-irq.c
+++ b/drivers/base/regmap/regmap-irq.c
@@ -79,9 +79,9 @@ static void regmap_irq_lock(struct irq_data *data)
 	mutex_lock(&d->lock);
 }
 
-static int regmap_irq_update_bits(struct regmap_irq_chip_data *d,
-				  unsigned int reg, unsigned int mask,
-				  unsigned int val)
+static int regmap_irq_update_mask_bits(struct regmap_irq_chip_data *d,
+				       unsigned int reg, unsigned int mask,
+				       unsigned int val)
 {
 	if (d->chip->mask_writeonly)
 		return regmap_write(d->map, reg, val & mask);
@@ -129,11 +129,11 @@ static void regmap_irq_sync_unlock(struct irq_data *data)
 
 		reg = sub_irq_reg(d, d->chip->mask_base, i);
 		if (d->chip->mask_invert) {
-			ret = regmap_irq_update_bits(d, reg,
+			ret = regmap_irq_update_mask_bits(d, reg,
 					 d->mask_buf_def[i], ~d->mask_buf[i]);
 		} else if (d->chip->unmask_base) {
 			/* set mask with mask_base register */
-			ret = regmap_irq_update_bits(d, reg,
+			ret = regmap_irq_update_mask_bits(d, reg,
 					d->mask_buf_def[i], ~d->mask_buf[i]);
 			if (ret < 0)
 				dev_err(d->map->dev,
@@ -142,12 +142,12 @@ static void regmap_irq_sync_unlock(struct irq_data *data)
 			unmask_offset = d->chip->unmask_base -
 							d->chip->mask_base;
 			/* clear mask with unmask_base register */
-			ret = regmap_irq_update_bits(d,
+			ret = regmap_irq_update_mask_bits(d,
 					reg + unmask_offset,
 					d->mask_buf_def[i],
 					d->mask_buf[i]);
 		} else {
-			ret = regmap_irq_update_bits(d, reg,
+			ret = regmap_irq_update_mask_bits(d, reg,
 					 d->mask_buf_def[i], d->mask_buf[i]);
 		}
 		if (ret != 0)
@@ -761,17 +761,17 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 		reg = sub_irq_reg(d, d->chip->mask_base, i);
 
 		if (chip->mask_invert)
-			ret = regmap_irq_update_bits(d, reg,
+			ret = regmap_irq_update_mask_bits(d, reg,
 					 d->mask_buf[i], ~d->mask_buf[i]);
 		else if (d->chip->unmask_base) {
 			unmask_offset = d->chip->unmask_base -
 					d->chip->mask_base;
-			ret = regmap_irq_update_bits(d,
+			ret = regmap_irq_update_mask_bits(d,
 					reg + unmask_offset,
 					d->mask_buf[i],
 					d->mask_buf[i]);
 		} else
-			ret = regmap_irq_update_bits(d, reg,
+			ret = regmap_irq_update_mask_bits(d, reg,
 					 d->mask_buf[i], d->mask_buf[i]);
 		if (ret != 0) {
 			dev_err(map->dev, "Failed to set masks in 0x%x: %d\n",
-- 
2.35.1

