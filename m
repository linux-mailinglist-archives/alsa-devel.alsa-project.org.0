Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97693554F24
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:26:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33AA81F23;
	Wed, 22 Jun 2022 17:25:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33AA81F23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655911592;
	bh=j8NvU2/YkYyLt/jWrjigSTazKQb0/+Mi3zVI+YV5ckk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NGLO70lH11jlQAmEn7F/YdMJMJnyKu+qOvhRfaYUaDDZd3KFQQLSIWwHlY/jfCc4G
	 tGZrSgONeTuwfl2+m0QjdoUa2oukXV8RJEIZ9lF3tFFCbKfeHan13/eqUjfFTewPQB
	 CO6wMEINIlcASqPclKjOftrQWyw2ZxdmrB7LmHPE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4EA84F80570;
	Wed, 22 Jun 2022 17:23:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85EB0F804D2; Mon, 20 Jun 2022 22:06:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C1F4F804DA
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 22:06:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C1F4F804DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="VdNEnW4i"
Received: by mail-wr1-x42a.google.com with SMTP id e25so12215275wrc.13
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 13:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CygB1KehYAHqhpc4bRUhgcxf+zQL9loE7cQLl/MEP/k=;
 b=VdNEnW4i4C6kZGpiqp1Jxmc+HT2MVBw6IwavlCehBQXlv5QOH8TPwVeq3H4ho5YMpx
 H8exp7Pq3R8RMqC3UBwjz4B4XNaNN5lfob6sT6+PndMQfoaU+DTqcC6wBk5rfoCSNQCJ
 /25J++hcAVbS0URhiPSxzu20PkT4vyStw3QlwmbqipEVuj0SMfiZBMh7ShX9R9n4h95O
 9crhgA7QEsaJW7A0sgHALhx1p9ncqoWinxadYQ4mbkrwCqLicK48miZo2piT71YFto5R
 e92szgit9CnwLu5DANwjGf3x1RqZ4wrj46ixAYyPN9ECBgT4l9bBF3FVNWT0DQBc63Y5
 2+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CygB1KehYAHqhpc4bRUhgcxf+zQL9loE7cQLl/MEP/k=;
 b=mzkhFZ7gqD+CA6hGd1qoQ6CBryvok5XgZibw7UVxNUmRLbT7EVIHQWjQbLCJbHNUer
 c+J/uSdfacm/3q9DONGEdMJpzAdyuvPZ1/R3sATpwmMs2un1/p4oRtZI0HxVc12gtiqS
 IxhmqEIb3d/QUQiZWUYP5V+fPCjhc3RAF6kyKemghEgd3PYSqvJSkFu6e+AYgmjFEP27
 +dbtEN41uJpy3RWydRkw4s3N96hYG7t1FZ0CMDFhdJAAHMXSU7Ye8/SoHEry7B6RF0np
 r8SOr6Ph1LIjnvcYcWngdrDfpUwt16p0vnpzL7JrKnQd6UuNJZF5ABJ5vWwS8YTDlAYB
 nSuQ==
X-Gm-Message-State: AJIora8EyHRMQHutjv4ZKzMtHMCogsL3ccE2YH7+4m8ac1GBSAtOM/d8
 5gFakQtcSQcdIjsQ6iuajeE=
X-Google-Smtp-Source: AGRyM1v/XOcLvn/YOZvKeR4GgDqyzG8bAWUAUx2H4/vrgHli6exwOFqzUpGDvK4ZhP7QI3IhQMp+Sw==
X-Received: by 2002:a05:6000:1567:b0:217:abea:6a67 with SMTP id
 7-20020a056000156700b00217abea6a67mr25796898wrz.305.1655755588840; 
 Mon, 20 Jun 2022 13:06:28 -0700 (PDT)
Received: from localhost (92.40.169.68.threembb.co.uk. [92.40.169.68])
 by smtp.gmail.com with ESMTPSA id
 a13-20020adffb8d000000b0021a3a87fda9sm12865573wrr.47.2022.06.20.13.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 13:06:28 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 09/49] mfd: max77650: Remove useless type_invert flag
Date: Mon, 20 Jun 2022 21:06:04 +0100
Message-Id: <20220620200644.1961936-10-aidanmacdonald.0x0@gmail.com>
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

The type_invert flag does nothing when type_in_mask is set,
so get rid of it.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/mfd/max77650.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mfd/max77650.c b/drivers/mfd/max77650.c
index 777485a33bc0..3c07fcdd9d07 100644
--- a/drivers/mfd/max77650.c
+++ b/drivers/mfd/max77650.c
@@ -138,7 +138,6 @@ static const struct regmap_irq_chip max77650_irq_chip = {
 	.status_base		= MAX77650_REG_INT_GLBL,
 	.mask_base		= MAX77650_REG_INTM_GLBL,
 	.type_in_mask		= true,
-	.type_invert		= true,
 	.init_ack_masked	= true,
 	.clear_on_unmask	= true,
 };
-- 
2.35.1

