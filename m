Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 656C5554F4C
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:30:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BB321FD7;
	Wed, 22 Jun 2022 17:29:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BB321FD7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655911808;
	bh=JgL4aOwEBx+NyqkasFWMOiuGgm7Pg+Pji9gXyLlefJ8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QKyf+Hs8w703cJ56U0Yekn8XGceqz319O9oIUDFIrRovh0NOAifUdNPavAZ8UU+FW
	 vGLbo1t0hV2ADTnynwlv4ReQhNL+ezLIXPsae7jwBkyDFFLj+XujjPF/+7uxlFMSrX
	 BImmuNnxrRi9QTV9AYNLLyMxvCfX4EuxfKyw/JSk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 330C8F805E2;
	Wed, 22 Jun 2022 17:23:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E956EF804E5; Mon, 20 Jun 2022 22:06:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,SPF_HELO_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45995F800E3
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 22:06:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45995F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="o76wuo0x"
Received: by mail-wr1-x42a.google.com with SMTP id e25so12215275wrc.13
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 13:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RxzMqxj/eXn7w9NNf93GCQveT2W3i+9cnq4DwR+RJyE=;
 b=o76wuo0xPC/x3J+fSzV08PvTJNEDSkggAXYsoR9+fouiAFePVvNZxWHKb6V2vQ92OA
 SE+0Tgogz4/JpWBQo32vpyKXLh2Katf4rLXy/5aiL3oY3i7H+xTu8fBXo9Kmwm+1LdJN
 n17o06/gfXQXFoYWk4+a7o5AXR1yv4WDcHzYxk5Bo6GjGCsBM4jzZLPAZskoHBAppBrr
 O0akQIZhIrT1LlNKwQ0GBml8Y9QIufqmcfQWayZorKoyOzzGnKmI65dWbbANUzud/obW
 h52Jbwhvf8dXR/t08i55bKKmJaWPIdWVSrVoX8K6QhSQSAGB7kcnC01lTkvgx2dqq/2U
 cwUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RxzMqxj/eXn7w9NNf93GCQveT2W3i+9cnq4DwR+RJyE=;
 b=Anqjxaw/kpeHZunY+3PhiafQrW8DPfJSBiHKcrzO1dVuEZew297sF0fzmb6/gtAxBw
 WxHrgIiC+949ZgwHNynw1RkYEo5qGVzPLzyQpq3ElGSkcDmEeoMwMRAlAhBWOpG0wHi1
 BkAlSxbHMR8zSuDe8Z6G/7XnV524dvqJCmF5QfDBatQEKpiihBz81aPLmQhPVLIKTKv+
 Hg0GnHgdYSjeG4ZC0FNKkzQpSJo4L4cU79gJjNQgs11ztbZPeI1QzRF8uQ+DBy2dWBn1
 NvKhCGy+jWmKbHirTz4PRFtf8gqGLUfu8EnW378r6hYtnjgwAcamO29AHPZtB6CliYvg
 REfg==
X-Gm-Message-State: AJIora+h+NZ4nutgc9wIXK3h4EOBSf4QGWr+QgHQMcR6WsYpfWlx7Ona
 g9/+2X/wLpI33JtMlljY2VUE8N/r5Yg=
X-Google-Smtp-Source: AGRyM1uQHejr8zASwoWiI73KhsStma0zb82PJc1yA+xXQ76Hdedooq3WaNWKMgmFn77ar+BE+OUVCQ==
X-Received: by 2002:a5d:4592:0:b0:21b:8e50:7fb9 with SMTP id
 p18-20020a5d4592000000b0021b8e507fb9mr7563688wrq.428.1655755613935; 
 Mon, 20 Jun 2022 13:06:53 -0700 (PDT)
Received: from localhost (92.40.169.63.threembb.co.uk. [92.40.169.63])
 by smtp.gmail.com with ESMTPSA id
 j13-20020a5d452d000000b0021a3d94c7bdsm11884838wra.28.2022.06.20.13.06.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 13:06:53 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 25/49] mfd: rohm-bd71828: replace irqchip mask_invert with
 unmask_base
Date: Mon, 20 Jun 2022 21:06:20 +0100
Message-Id: <20220620200644.1961936-26-aidanmacdonald.0x0@gmail.com>
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

An inverted mask register can be described more directly
as an unmask register.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/mfd/rohm-bd71828.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/rohm-bd71828.c b/drivers/mfd/rohm-bd71828.c
index 714d9fcbf07b..3c5c6c393650 100644
--- a/drivers/mfd/rohm-bd71828.c
+++ b/drivers/mfd/rohm-bd71828.c
@@ -413,9 +413,8 @@ static struct regmap_irq_chip bd71828_irq_chip = {
 	.irqs = &bd71828_irqs[0],
 	.num_irqs = ARRAY_SIZE(bd71828_irqs),
 	.status_base = BD71828_REG_INT_BUCK,
-	.mask_base = BD71828_REG_INT_MASK_BUCK,
+	.unmask_base = BD71828_REG_INT_MASK_BUCK,
 	.ack_base = BD71828_REG_INT_BUCK,
-	.mask_invert = true,
 	.init_ack_masked = true,
 	.num_regs = 12,
 	.num_main_regs = 1,
@@ -430,9 +429,8 @@ static struct regmap_irq_chip bd71815_irq_chip = {
 	.irqs = &bd71815_irqs[0],
 	.num_irqs = ARRAY_SIZE(bd71815_irqs),
 	.status_base = BD71815_REG_INT_STAT_01,
-	.mask_base = BD71815_REG_INT_EN_01,
+	.unmask_base = BD71815_REG_INT_EN_01,
 	.ack_base = BD71815_REG_INT_STAT_01,
-	.mask_invert = true,
 	.init_ack_masked = true,
 	.num_regs = 12,
 	.num_main_regs = 1,
-- 
2.35.1

