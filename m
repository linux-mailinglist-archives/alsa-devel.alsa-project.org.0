Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 404E4554F14
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:25:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C40BF1F90;
	Wed, 22 Jun 2022 17:24:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C40BF1F90
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655911501;
	bh=QlvVOwoQ6lFmeptQTmb/eEJoyNlDHdD3UTl9WHMxEeQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lCVXVNWg8Soc9veCLvjYtFYCnSe69/DxoVYfxLdNU6MUsfWcfPrJOBkqrLyW/BYOL
	 GtwDLnr7koha8Cin0GWvtPCBsUYuETSUARGipd6CWTbZ51KZKiDBP8UW1Q5A54fp2r
	 5BFOxH074gF6PB4YPW/4Wts5k+vLygZtuvuvyr08=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F368F80482;
	Wed, 22 Jun 2022 17:23:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B46F4F804DA; Mon, 20 Jun 2022 22:06:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FE16F804E5
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 22:06:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FE16F804E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="e6An1+k7"
Received: by mail-wr1-x430.google.com with SMTP id g4so16059613wrh.11
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 13:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DcQuE9oGehOZto3hA/rTLb2fToN8VqZpboB1wSvVLeU=;
 b=e6An1+k7URA0wQXNcY2/BdRAilnccZF6A/hAv9jWNU7eSpvfOtHDfFPlFA9Tmj9tdP
 Q3jbhTK1VDeXWFItQMxcv0vZ7RCc5cmoO02hqrWFt1bNQVvSZ9vWPfkxDdj301roqukK
 VxcyBZNW8QGynfO8JWI+WWahEFDrUvnJXyIxMEVYx3RByt41ka89CAhjte2WBrFW5mhM
 TCXItN7+bBmjpnPbHtb5ce5F5Rk9ZgfpC/oo8VuyT8lEVZBE0Oo1B0D7mW2UL08mlg2l
 JQb9VPre/3jtmwZhYCFcXMZ3dZ9tQ6hqqgn0BUdmCk0DnRF2pxNugG3O1NbKVirJLc3k
 3CXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DcQuE9oGehOZto3hA/rTLb2fToN8VqZpboB1wSvVLeU=;
 b=r0P4QqD3C5LlgqmrUCbej9o6dx0A2UU1nppG77K6pzLaD7HukpFoMLsw6HU22tY6MN
 1+/s6yEUuSu47uNBZ+aRSbqmn1bnrMCXmappkJ2J5WOJ57G4Q7qOXUJFbWv1hJgL/YFy
 8XCVlABpL15VqTi/AKr1HptHI910EA5Rjl2EyTnGBv55KaxQoeIGGB+oACYofBE+UchF
 xBYrGJJofiMi+Tm07GoohgitXfyHFsE5VAqeO5hIu61yNBSdtG8VB0BJ+DYnDq2ED0+K
 rKCbdcUuoWayCuk/fYvfTg6XpVCzqQg0F0v7QR6gSYZZ0HX/wM8jKxG3FyGwoRzqhWFj
 BtXw==
X-Gm-Message-State: AJIora8kXbYwh0lmACUpbKQYzj8KcXH/BR0veeAgNw9tx8TQTrGqhiOK
 5hJnFODiS/hIgbqQLVTSVd4=
X-Google-Smtp-Source: AGRyM1toV/6s8wRgMxmabtCAeVPKyocBr9a+nW1Hds3EtsXXFabw7Q99ucUCOTs0Oy4tAKumPVl4nQ==
X-Received: by 2002:a5d:64c7:0:b0:21b:9661:6aac with SMTP id
 f7-20020a5d64c7000000b0021b96616aacmr665641wri.496.1655755579596; 
 Mon, 20 Jun 2022 13:06:19 -0700 (PDT)
Received: from localhost (92.40.169.68.threembb.co.uk. [92.40.169.68])
 by smtp.gmail.com with ESMTPSA id
 c5-20020adffb45000000b0021b91d1ddbfsm2917554wrs.21.2022.06.20.13.06.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 13:06:19 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 03/49] regmap-irq: Remove an unnecessary restriction on
 type_in_mask
Date: Mon, 20 Jun 2022 21:05:58 +0100
Message-Id: <20220620200644.1961936-4-aidanmacdonald.0x0@gmail.com>
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

Check types_supported instead of checking type_rising/falling_val
when using type_in_mask interrupts. This makes the intent clearer
and allows a type_in_mask irq to support level or edge triggers,
rather than only edge triggers. Update the comment to reflect the
new behavior.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/base/regmap/regmap-irq.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-irq.c
index a6db605707b0..59cfd4000e63 100644
--- a/drivers/base/regmap/regmap-irq.c
+++ b/drivers/base/regmap/regmap-irq.c
@@ -253,22 +253,19 @@ static void regmap_irq_enable(struct irq_data *data)
 	struct regmap *map = d->map;
 	const struct regmap_irq *irq_data = irq_to_regmap_irq(d, data->hwirq);
 	unsigned int reg = irq_data->reg_offset / map->reg_stride;
-	unsigned int mask, type;
-
-	type = irq_data->type.type_falling_val | irq_data->type.type_rising_val;
+	unsigned int mask;
 
 	/*
 	 * The type_in_mask flag means that the underlying hardware uses
-	 * separate mask bits for rising and falling edge interrupts, but
-	 * we want to make them into a single virtual interrupt with
-	 * configurable edge.
+	 * separate mask bits for each interrupt trigger type, but we want
+	 * to have a single logical interrupt with a configurable type.
 	 *
-	 * If the interrupt we're enabling defines the falling or rising
-	 * masks then instead of using the regular mask bits for this
-	 * interrupt, use the value previously written to the type buffer
-	 * at the corresponding offset in regmap_irq_set_type().
+	 * If the interrupt we're enabling defines any supported types
+	 * then instead of using the regular mask bits for this interrupt,
+	 * use the value previously written to the type buffer at the
+	 * corresponding offset in regmap_irq_set_type().
 	 */
-	if (d->chip->type_in_mask && type)
+	if (d->chip->type_in_mask && irq_data->type.types_supported)
 		mask = d->type_buf[reg] & irq_data->mask;
 	else
 		mask = irq_data->mask;
-- 
2.35.1

