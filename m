Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A7E554F49
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:29:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A75371EEC;
	Wed, 22 Jun 2022 17:28:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A75371EEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655911762;
	bh=wkfUYqrBXC8qPRT5H2ltOSOhV9/XqM/ja5DLKDeSBnQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hoIyyIqjGY7MfCPPzPDnu7sKPYH2UfV4kf/RWzzOzuP+IXk2+5og6Uob6wOvjmXBX
	 PkbRTO3vsgIb0GBUMBmIi5LXoJO0hbs9MX+QAF1ox2EOoYDGIkir8vHI55vUCKJQUp
	 tb+zGq+lNJoxoD34UVuJnGYAJHXgTSHPL/88+Vd0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08609F805C9;
	Wed, 22 Jun 2022 17:23:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10A2CF804D8; Mon, 20 Jun 2022 22:06:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3B29F804DA
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 22:06:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3B29F804DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="VO5DAnqE"
Received: by mail-wr1-x42f.google.com with SMTP id s1so16072728wra.9
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 13:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uoe8IKHiznCb2+08YYHq6Yn162+SdkatHT+ONYvtyvg=;
 b=VO5DAnqEeePAwi/axXTy4qE8A246zDDyLHKvfEeupMh4NJS9PKzy2HLbzv2HmLinOh
 sJDew7tvb/Du6JA9+pWT6wLYpZiUruBlDXuUNGniMiaSflxpZ999oM2RPoZbfWY8bM3s
 gls0xbSabfR+zndjmVVe2gZatWsAghFwtSJv7FWIrq2fOl5iZF4ORrEzRPpb9VagUUok
 bzn4DhZTxBTkt686Eof5bwsbZb+iffrPyGoKCrO/d9vttrGG2aS8UHirbaHGBHIZdzMU
 DZCNjjT5h1ru5g19uCfpQwoKH/YS5Rr49DFzT6RKpFmZ5PA1XwoUduGXijcI+1DBXDyM
 XTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uoe8IKHiznCb2+08YYHq6Yn162+SdkatHT+ONYvtyvg=;
 b=L86xtQr/y2mns8VuNmGM2NN6IwU+lyumRwGWY2Xvy6e6yazWyZ87BpcjyzSzwBAGE/
 KtEht/XpeLSKsT6u9EzOQw9TqY6Q9bvTs82DdQdox0IkzI6CcUYJnpvZ4l7NmYaQRQKa
 BLeI09spxwhsZsRC4feqfl8eLjBKS2nbGaB3Cbsj1nibXw9R0S75Kgd4Moi3GeJwvZ2P
 s/3MpdvS2s4wROaAnMRYStYsAr+L3Iy29jDxifU3M3XJrSoKPN0d91d+imGvhw2ZELNj
 Lm9KUNSZA8O8nIkWjlPslB+Te4wfqGOIn6MBm0/vqx6mgwL3SdNjXgXe/1TeR5e9ULYF
 mChQ==
X-Gm-Message-State: AJIora/IZytUYB8kiia/s+e2ID4MXfjTs2zTX5uEKaMiESescZs+NAKy
 2iR0eLu8ZT674NlbSJBYmiA=
X-Google-Smtp-Source: AGRyM1uZONrpz0spvVCV2D/AIVMzkFz9w2tp1QWQa34Ft0vrEMdw9wgaS52AsbxHhGWZBMtjoEgiDw==
X-Received: by 2002:adf:fec2:0:b0:21a:6cff:a4f1 with SMTP id
 q2-20020adffec2000000b0021a6cffa4f1mr18316222wrs.139.1655755607554; 
 Mon, 20 Jun 2022 13:06:47 -0700 (PDT)
Received: from localhost (92.40.169.68.threembb.co.uk. [92.40.169.68])
 by smtp.gmail.com with ESMTPSA id
 j27-20020a05600c1c1b00b0039c1396b495sm16596378wms.9.2022.06.20.13.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 13:06:47 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 21/49] mfd: tps65090: replace irqchip mask_invert with
 unmask_base
Date: Mon, 20 Jun 2022 21:06:16 +0100
Message-Id: <20220620200644.1961936-22-aidanmacdonald.0x0@gmail.com>
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

An inverted mask register can be described more directly
as an unmask register.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/mfd/tps65090.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mfd/tps65090.c b/drivers/mfd/tps65090.c
index bd6235308c6b..e474e1ca253a 100644
--- a/drivers/mfd/tps65090.c
+++ b/drivers/mfd/tps65090.c
@@ -127,8 +127,7 @@ static struct regmap_irq_chip tps65090_irq_chip = {
 	.num_irqs = ARRAY_SIZE(tps65090_irqs),
 	.num_regs = NUM_INT_REG,
 	.status_base = TPS65090_REG_INTR_STS,
-	.mask_base = TPS65090_REG_INTR_MASK,
-	.mask_invert = true,
+	.unmask_base = TPS65090_REG_INTR_MASK,
 };
 
 static bool is_volatile_reg(struct device *dev, unsigned int reg)
-- 
2.35.1

