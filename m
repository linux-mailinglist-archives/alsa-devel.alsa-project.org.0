Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFE1554F65
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:34:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACFCF1F6D;
	Wed, 22 Jun 2022 17:33:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACFCF1F6D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655912061;
	bh=xeYFxgWlLAVDMsEkAA6W1rHTIvjU0RDo7Pn2A8eaPO0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ij+n7NvPty7/wAy/3Z62fNu+HqcN9MaPTZfDYA7cAlquNzadyGhltGk1/E42a7MFF
	 UzYj3KlIGG6yC5wEGREl0ABS6hiynAzjgOIo7y6ylXoxHQSD+s4/mjEQGFGMD2cUHj
	 f+43ZCPlCt13rAQ39GputkKf7iJqSAgMuyNZBiHY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E42EFF80621;
	Wed, 22 Jun 2022 17:23:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E8E6F804E7; Mon, 20 Jun 2022 22:07:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E909F804D2
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 22:07:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E909F804D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="O31tT53s"
Received: by mail-wr1-x435.google.com with SMTP id g4so16062228wrh.11
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 13:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dbyvlkbY4sJOjh3UQdGyOPNGXQQ/y7Irc+C1CWkw+ak=;
 b=O31tT53sO/Sz1zUUmz4+b7clogfECSiQb9wF145zFCWeos95kyFGhyMNr0ihPdqpqx
 bJc50KM0wIrtRqZCqzGADVF4M3k1QjGTHVo1VYjGwT74JLbT3B4kvTSheNe818VtY8DZ
 HDqJJzSXulU9aA8Q7p64IRscmVk+LyazVQczqtnvFpnAbVUfczXyJXpSX6rv84tpA2ID
 Fp6mzmh7R3C0ofGj++M07N5Nk1RQvkOi9t24WmMCnaJkp1Xa/s9Jij2cEafhCNNYBn56
 seJUbVNIALw9YCjjSnuje4l/jDR/w2Hi2qVNJRlUiL9Bqsun5VReJR/qIIMDhEg6iASO
 mm4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dbyvlkbY4sJOjh3UQdGyOPNGXQQ/y7Irc+C1CWkw+ak=;
 b=YmX16GgGEeZf14JO3a3xs8QlW7VaDcQoseJfVxbDFUaz2bIFIKzJs+ENhjQeD7QfQo
 L5Mt3sy+hQwNyHcYKsTsf5NM8GHhy/qILxSmK0+No6pOYIuIoTSEwGoeJq1Mm9q7+N7w
 NmxD1/zrb2QVL3aZWtwr+TrqtVWniS7rVV/ik2FLDn793EHV1Jy8jsNNWksr2WWRMkPI
 fUkjT/vW0Y9ZgcI6ScqPbAMDJMX7pA0+hsaSuZ1lbNSk8bn49vGm0Ngb3HExtnjAk8+5
 MNASFD9gTVHkx45fENciJF4pWG+soaEafRdBcCPdSDDUUtevekgdvhMgUYFHBpdfNVSx
 j+Cg==
X-Gm-Message-State: AJIora8QFrlAc1PgTiv1n5Dxx4XpVkbw1JIkJEONrfDT5b9tEPrN0Cj5
 cplFRJDpIfpZySKzZr5bFc0=
X-Google-Smtp-Source: AGRyM1txLq4Tx5IKJyl2yL+hQwHqEppU3pzgOBeDxgV9FsOmPyXZOlr03TOSB7o38hDoIT4MKowqhA==
X-Received: by 2002:a5d:588d:0:b0:218:4d0e:b89 with SMTP id
 n13-20020a5d588d000000b002184d0e0b89mr24292034wrf.58.1655755634413; 
 Mon, 20 Jun 2022 13:07:14 -0700 (PDT)
Received: from localhost (92.40.169.63.threembb.co.uk. [92.40.169.63])
 by smtp.gmail.com with ESMTPSA id
 n68-20020a1c2747000000b0039c5a765388sm15705645wmn.28.2022.06.20.13.07.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 13:07:14 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 37/49] extcon: rt8973a: drop useless mask_invert flag on
 irqchip
Date: Mon, 20 Jun 2022 21:06:32 +0100
Message-Id: <20220620200644.1961936-38-aidanmacdonald.0x0@gmail.com>
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
 drivers/extcon/extcon-rt8973a.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/extcon/extcon-rt8973a.c b/drivers/extcon/extcon-rt8973a.c
index 40c07f4d656e..02ba770acb27 100644
--- a/drivers/extcon/extcon-rt8973a.c
+++ b/drivers/extcon/extcon-rt8973a.c
@@ -192,7 +192,6 @@ static const struct regmap_irq_chip rt8973a_muic_irq_chip = {
 	.name			= "rt8973a",
 	.status_base		= RT8973A_REG_INT1,
 	.mask_base		= RT8973A_REG_INTM1,
-	.mask_invert		= false,
 	.num_regs		= 2,
 	.irqs			= rt8973a_irqs,
 	.num_irqs		= ARRAY_SIZE(rt8973a_irqs),
-- 
2.35.1

