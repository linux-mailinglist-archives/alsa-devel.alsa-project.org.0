Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D43554F5A
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:32:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6BCA1F72;
	Wed, 22 Jun 2022 17:31:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6BCA1F72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655911951;
	bh=pduRRadCqjm+H5Q0Ot3vxqGM1hN74ck5MfZ2xBpkQAQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zxbd69tTt+lWe9QBd/QjZvWx1pxMNKzMlSzYoqsSmBk/gvWmW/4lFv2LOj7hBKPrI
	 JqjecCmR04O/JX/ruk3gpTp4zXhg4rWwVXZVFPdq5VUNgQwBXxNzgUvdPL6oeGqv7U
	 mNj3tssAdxqmsPG6+2znkuKjdAis/O3FY/0fuoXE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0ED4F80608;
	Wed, 22 Jun 2022 17:23:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7714EF800CB; Mon, 20 Jun 2022 22:07:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55959F800CB
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 22:07:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55959F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="I9SWwmkb"
Received: by mail-wm1-x331.google.com with SMTP id z9so6374441wmf.3
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 13:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oqx3v8Sb2M8GmsYA5Ky+XV9uouybbnIvgB5+4WCQaEA=;
 b=I9SWwmkbAS0twwPt8IX4E7bPDCP7aUbF2QrdWQqioO/YT8vPWDbo5jafFWHLiMIjc6
 1mw/0Uimpyz3cUcNIuL1gNMxnkzOwuSG3edxomlaxXv/3L99G0JTdAg4POHGrEyB2REH
 3lIDZKKJ3rfCVWbTQEoaG7JmB0gDKFGBeqb20JXEMuxvSMR5CHUbycRO4F8LKhZqPuhZ
 YEBHTx15YFCjU5hxF8mncOccOzTdEdvUtBMGeSXsVkIqDI9MxnDbvI8sGUw4c4kcM2YR
 yU4ZYgDnXaav8BMzDiccmgOUBiOIkEhH4tyXriDpDiHGnyleHXKRGyMCZfOTYeUkSsCw
 fC3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oqx3v8Sb2M8GmsYA5Ky+XV9uouybbnIvgB5+4WCQaEA=;
 b=fKJ3EcEV6o0sE60tNXGPOscxL7qM4O3oQjcXW8dk3fPZr0G1e4SojEF9N0ylWmuFtO
 KQtGG5iGHrvs1gtPXPWWVIvJl7sEA0+lflvmJ6GP29BY+B23ZeVU7OaOpOUQNDqmFvA6
 Hu2eFpr8r1JKz/ASmNSstWhSPudme7Cwjh5Oj3y/JoUfI73J/wnI9Ya/z7sKWOPIsbjQ
 sYsBwbvpVTWDrxml6uf4Ywc6dPv0aM/Q7zMfDnau4ujYedYf81YrBrO/NtS+9omPhPTq
 tA+9QXSwi4DqKNJLa59ZWeCcdW9sfY83gsvcZUnDPuAW2SvG+PqYPGziH/dUMLkTcDIH
 d1cw==
X-Gm-Message-State: AJIora+9QoChmkfk2QiRpOakxRcywpL7UrcqRFDLkl8gLHO10wmdzOPA
 kETyGThClqy+/s1/OgSciWw=
X-Google-Smtp-Source: AGRyM1swymX/u49DBHMJPPyC7OgnYJ7zcAJGoTucjUXlwJwy4Cy1b+UW+TJYIq67rmm7OR5jau1T3g==
X-Received: by 2002:a05:600c:5112:b0:397:53f5:e15b with SMTP id
 o18-20020a05600c511200b0039753f5e15bmr26726456wms.93.1655755622524; 
 Mon, 20 Jun 2022 13:07:02 -0700 (PDT)
Received: from localhost (92.40.169.63.threembb.co.uk. [92.40.169.63])
 by smtp.gmail.com with ESMTPSA id
 a17-20020adffad1000000b0021b8749728dsm8178971wrs.73.2022.06.20.13.07.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 13:07:01 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 30/49] mfd: 88pm800: replace irqchip mask_invert with
 unmask_base
Date: Mon, 20 Jun 2022 21:06:25 +0100
Message-Id: <20220620200644.1961936-31-aidanmacdonald.0x0@gmail.com>
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
 drivers/mfd/88pm800.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mfd/88pm800.c b/drivers/mfd/88pm800.c
index eaf9845633b4..6d1192db13c1 100644
--- a/drivers/mfd/88pm800.c
+++ b/drivers/mfd/88pm800.c
@@ -398,9 +398,8 @@ static struct regmap_irq_chip pm800_irq_chip = {
 
 	.num_regs = 4,
 	.status_base = PM800_INT_STATUS1,
-	.mask_base = PM800_INT_ENA_1,
+	.unmask_base = PM800_INT_ENA_1,
 	.ack_base = PM800_INT_STATUS1,
-	.mask_invert = 1,
 };
 
 static int pm800_pages_init(struct pm80x_chip *chip)
-- 
2.35.1

