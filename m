Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E62554F5C
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:33:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3797D205A;
	Wed, 22 Jun 2022 17:32:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3797D205A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655911982;
	bh=bsWHGohdUbfY3nyZypyK44rW2viwGKCYp8ggtV0U/Y8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PjKnhto998oc92x6ruPZe2l93uvwZMETfCf9kj9Xtq0R03d9df3NGOlnbrevHqfwy
	 yPrwOzNVHUTAFC4LSV4/4pXTTOGnAwk4vpGmbBuuUo3XYcl4PQEVgN7mXZ444mYNOl
	 Ywdd887bWsRDZfUlBh1SR35YEK+nht7x8E2KmIA0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6E94F8060F;
	Wed, 22 Jun 2022 17:23:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2ACC3F804E7; Mon, 20 Jun 2022 22:07:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30183F804D2
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 22:07:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30183F804D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="SqSwnGBc"
Received: by mail-wm1-x32e.google.com with SMTP id
 m16-20020a7bca50000000b0039c8a224c95so6195354wml.2
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 13:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FJAftx/p0C7OJqXldJ+ksCvuM2Jz1/dLJXnCMlN2VIw=;
 b=SqSwnGBcriuBOSFplaryTgzwQV9etoBhh79kFYweRlmDdxQeRvrcZhZxeGzYrNQvjK
 69NE66snB8AAFxosGQi32hwg8wAh/0UlVrRlylnlYpF3UP2foQigCMMdDJ2hf1VoUcQw
 IGJhoucIfU9bShmNTRIW7SeERFLMl9SzWwa/gkuyhaNnZGAegN5/b8AD7xgZbr+q96V3
 wIZE74xoK0opWS9DO77kd+xhhjv05vYGMC2P4dGUBy6pWp5QiJg6JRI3NjoqvsL5Fuv7
 /rYrzhVG+vkyLBPngH5EcdERxjCI3qHqaUK8MI70z8mDb7VK4k5Utxh9mIEOvpvvGk/6
 VkjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FJAftx/p0C7OJqXldJ+ksCvuM2Jz1/dLJXnCMlN2VIw=;
 b=3kvGZjFXZnm6aBo1MEXJvO9PJf45xuMklt5Z762T/fnmCe3YoA5KsQPNDitjWO+xxq
 qUWXrDHq5zkhP2iZBX0O0IcJv+yEJevnhmSNHoEshxdmm3vHB0PPdqPI7RJehmRkiAks
 SecOPif2oQxsAYMpre3t4JTKzr3/EcKdmvkmgRd1gntY21c0Zz2Oku0YxkkSKdePcnqJ
 6CeR+Gv1E0+rOBa2mTo7V3njiabItTQPszq5sASf3zbtwwDNOByviAAEKNrJdSYknJ7g
 j1Efir5M6GmpXIV2Pk0DJfYGInRhPFU9wLf3SqGQBqXN4rM3HdGjaelL1A7hB8Wl3+4l
 mltw==
X-Gm-Message-State: AJIora/ukaxfK6OV4uYwC2zZ/fTbLiEkTUwGWqrP+d3OUuI/Q2phVIC3
 FaYUMytD/kpGRb0husN6Up4=
X-Google-Smtp-Source: AGRyM1uYqQE7GmYoWseO34ZpgDLrPdxmQJYvkYR87njx8ZglDl7MI8oKPbgMJxyF1RluTFoj9tUheA==
X-Received: by 2002:a1c:c909:0:b0:3a0:1725:619d with SMTP id
 f9-20020a1cc909000000b003a01725619dmr5451578wmb.19.1655755629537; 
 Mon, 20 Jun 2022 13:07:09 -0700 (PDT)
Received: from localhost (92.40.169.63.threembb.co.uk. [92.40.169.63])
 by smtp.gmail.com with ESMTPSA id
 q7-20020adf9dc7000000b0020cdcb0efa2sm7500229wre.34.2022.06.20.13.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 13:07:09 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 34/49] mfd: max77843: drop useless mask_invert flag on irqchip
Date: Mon, 20 Jun 2022 21:06:29 +0100
Message-Id: <20220620200644.1961936-35-aidanmacdonald.0x0@gmail.com>
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

There's no need to set the flag explicitly to false, since that
is the default value from zero initialization.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/mfd/max77843.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mfd/max77843.c b/drivers/mfd/max77843.c
index 209ee24d9ce1..4da58eab1603 100644
--- a/drivers/mfd/max77843.c
+++ b/drivers/mfd/max77843.c
@@ -59,7 +59,6 @@ static const struct regmap_irq_chip max77843_irq_chip = {
 	.name		= "max77843",
 	.status_base	= MAX77843_SYS_REG_SYSINTSRC,
 	.mask_base	= MAX77843_SYS_REG_SYSINTMASK,
-	.mask_invert	= false,
 	.num_regs	= 1,
 	.irqs		= max77843_irqs,
 	.num_irqs	= ARRAY_SIZE(max77843_irqs),
-- 
2.35.1

