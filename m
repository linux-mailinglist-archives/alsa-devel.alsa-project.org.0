Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E576554F6E
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:35:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F40E720DC;
	Wed, 22 Jun 2022 17:35:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F40E720DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655912156;
	bh=8g+j3a6+bioODTDRzpX8rpodN/x7ZjxXYU21b+igjc0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rZoFvaMWRShejy4TG7vw4oA1iEqrLGEEgLBNmxmaRtBJSrgfd/0VPgS94m86bCBYK
	 2m0uc3JC+uCw57kLw4GFwyosev9ubuZC+TF5+eaK8vvnS/ITpFHDpcK6uPIvk9vzqF
	 zoyMw6ybITyU5Ui4V/MATfR4RZPYApaJ//4i5lfU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FDAAF80642;
	Wed, 22 Jun 2022 17:23:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8AD83F804DA; Mon, 20 Jun 2022 22:07:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9765F800CB
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 22:07:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9765F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="key not found in DNS" (0-bit key) header.d=gmail.com
 header.i=@gmail.com header.b="U/u1eI8X"
Received: by mail-wm1-x32e.google.com with SMTP id
 m16-20020a7bca50000000b0039c8a224c95so6195354wml.2
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 13:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E0jLkqilWpvnbTcSo4wfjkJhQqF1reP5Ib9ezCHoYWc=;
 b=U/u1eI8XG0RLSewZC9yH0TEBjAQ2QVQeFgi9rzCUa/S/IXH9PHYw0gdakIKNDT90kV
 hMuwVJCliXAFt+/OKjfOJGf07gA2TRZWRFVa9nvnR7w8MWysPG76mxgNw9ukyrADHZ5N
 ALr37IiaH9saP7DoyArHAIbUsX5KFRzx8Uw6meqm+M15MdeUmVUAWTmMi15JWu+Wq07m
 itZyiVgoqQZkvIT6ra3IIfQvQJZJo5C0Y+CD2t4yxMPenkkULdYZFq6Wwj6TJ4CoenZF
 dRCH3mEbVAzCd1YjOvUgfQGm1TEKpTWU8WSRmJwdw9G0Be/ybY4XqRUVEJ0I0EIJYNRr
 FSCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E0jLkqilWpvnbTcSo4wfjkJhQqF1reP5Ib9ezCHoYWc=;
 b=jsNcWDvnbVgL1hP0eSFPfOqrFjNBnnZRiSlq9Xo65n0iowlso8DFZb/lj3y37kyalJ
 WXK17gh6+TIguRPjpd+G672iP6f6UPPZ0+INT3zfFC8betyuj0wuyRBBubajma/T2L0x
 N//fxo4RAHCWK65YSUjXIfR1cbhgh4unAvy6B9UVoVXhantF0n0hSV29ix1hw4Ei7NjV
 TS+ZZdK5l5XmH8Vsc/SGuqeZLrOApt+6wPkBQC619N8he1wvseCGVBgEQK1i80Sw3K85
 FZgNZcp6CU9Xrx2Zcg2gn4hLRCzaUWHMD7Cxnj4hbSxLrEU1S+4RoUvrKJZb0sNhyxcr
 hoLw==
X-Gm-Message-State: AJIora/XHHHj9ia5eLnWeG++qhfdAen6MkVxqcIm6Xteb/8ygbMOahkT
 utmo6873hKoCfQFhCEBjirE=
X-Google-Smtp-Source: AGRyM1uhXBLM2mCEhpF1oCgYeIG722Adlji+SZHE2C7bZquQV7GS0wP1KfS6UMHZPFYNwRmyV3niBQ==
X-Received: by 2002:a05:600c:1c10:b0:39c:4708:648d with SMTP id
 j16-20020a05600c1c1000b0039c4708648dmr26590108wms.85.1655755649580; 
 Mon, 20 Jun 2022 13:07:29 -0700 (PDT)
Received: from localhost (92.40.169.63.threembb.co.uk. [92.40.169.63])
 by smtp.gmail.com with ESMTPSA id
 j11-20020a05600c190b00b0039c5328ad92sm22754411wmq.41.2022.06.20.13.07.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 13:07:29 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 46/49] regmap-irq: Refactor checks for status bulk read support
Date: Mon, 20 Jun 2022 21:06:41 +0100
Message-Id: <20220620200644.1961936-47-aidanmacdonald.0x0@gmail.com>
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

There are several conditions that must be satisfied to support
bulk read of status registers. Move the check into a function
to avoid duplicating it in two places.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/base/regmap/regmap-irq.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-irq.c
index 0a8edaee064a..7b5bd1d45fc0 100644
--- a/drivers/base/regmap/regmap-irq.c
+++ b/drivers/base/regmap/regmap-irq.c
@@ -72,6 +72,14 @@ struct regmap_irq *irq_to_regmap_irq(struct regmap_irq_chip_data *data,
 	return &data->chip->irqs[irq];
 }
 
+static bool regmap_irq_can_bulk_read_status(struct regmap_irq_chip_data *data)
+{
+	struct regmap *map = data->map;
+
+	return !map->use_single_read && map->reg_stride == 1 &&
+		data->irq_reg_stride == 1;
+}
+
 static void regmap_irq_lock(struct irq_data *data)
 {
 	struct regmap_irq_chip_data *d = irq_data_get_irq_chip_data(data);
@@ -413,8 +421,7 @@ static irqreturn_t regmap_irq_thread(int irq, void *d)
 			}
 
 		}
-	} else if (!map->use_single_read && map->reg_stride == 1 &&
-		   data->irq_reg_stride == 1) {
+	} else if (regmap_irq_can_bulk_read_status(data)) {
 
 		u8 *buf8 = data->status_reg_buf;
 		u16 *buf16 = data->status_reg_buf;
@@ -723,8 +730,7 @@ int regmap_add_irq_chip_fwnode(struct fwnode_handle *fwnode,
 	else
 		d->irq_reg_stride = 1;
 
-	if (!map->use_single_read && map->reg_stride == 1 &&
-	    d->irq_reg_stride == 1) {
+	if (regmap_irq_can_bulk_read_status(d)) {
 		d->status_reg_buf = kmalloc_array(chip->num_regs,
 						  map->format.val_bytes,
 						  GFP_KERNEL);
-- 
2.35.1

