Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96769554F6B
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:35:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3738220C7;
	Wed, 22 Jun 2022 17:34:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3738220C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655912124;
	bh=+0yLKRFOKqBW1Upp/o0HCNE6LCYhV91297Rd5m9WDJ8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iaeRo+eHvbWJxZjKO/kShpdO98NmUdJHYNgYtnmMXLXLoU5ji3VPrISJGtvFqsx1S
	 VV3YOJjuF6ATZyDCmA8dGKVMXo8E8uubKwBoE9UvO6XsXyE9Mwx9SXfv2yUwp+OoFk
	 oCqDL4LRL/7Xtf6DCiEv96uN+O8EsmZ+UQnNQbbU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C3A0F80639;
	Wed, 22 Jun 2022 17:23:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97C84F804E5; Mon, 20 Jun 2022 22:07:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E047FF804D2
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 22:07:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E047FF804D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TIaLYM+7"
Received: by mail-wr1-x430.google.com with SMTP id i10so12335105wrc.0
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 13:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dqZEE7XdviwRWITP3iO6UBVL417kMvPw/5cpdhOCnY0=;
 b=TIaLYM+7aLuuRlXrQlapwog96FVtU0ooWGOQ047CVxq6/eBhXYieIqxwCcMXfW3g6t
 f+HGuhXPfSxIelrPnYEN7OU7peoZLJxZnRXDaJcr5fL+fEf69btKbTF4tAUZNYQyHScv
 iwtpLeRs+BLtCQHpOHV5HTtcb+smm2n5XiEw9va+rWEPvmpRhr9uihWsn8c3AWaKo2tu
 ixhGNtLy3TSWF+J6E4waInzEuxA2ck3ipVwp4MrV2tbNe0NS3OQkYDrzOC8k9atTsxJT
 71CeVTVSDdBpYrNOzHBu5VTgwxnGKG7OS+jOMILWiKTmwhHwDvjmfpRNJ4UZ4pzCshkj
 2pww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dqZEE7XdviwRWITP3iO6UBVL417kMvPw/5cpdhOCnY0=;
 b=pVEO8qcocxfAVSEAS6Gjg1P0+UB7xc9QyQ9n+56Iy2/pn7tr7eDSNBLZRzlSWk4Iuz
 xMZxeVOEbpBqIhO2cHVJzgWvIWREsnkRw9dqF4p+U7DE3f1F6VlXx/yr2/znXn7gtKP/
 CMwvuObln4X3+Qm4KBZRh9/zVB1b/m9qSskV1m+Wz4+Xr/L4CIDxEBSr7hSn/z7hLBMJ
 9qsNdY4nIT0x9D94XOY6Gn4pdXsicgffdsFi8K9rXN54yKsWeZ8EMOH3fA7cEdPDAu9O
 +VjURXZrqSmU7nviCoyIl5F9kpEk9SWYMdcBUs0XNAHddnLSyKmFU0yYRwfCBGaeMpZC
 wG5Q==
X-Gm-Message-State: AJIora9wMfA4gQPuFmYgfz2PYGQELaAeFhpdX37mSd0Dy4taQnBs2l3M
 zEOMJ6DQIp/hdPEWxxKvbd4=
X-Google-Smtp-Source: AGRyM1t7fF9oWyoFMD4Gd1xha3GDwq5quNlzvF+7I8uqpwdkfaVZSf+y3kr/8cPcMtmBqNLfvwIwNg==
X-Received: by 2002:a5d:5885:0:b0:218:3d12:e0eb with SMTP id
 n5-20020a5d5885000000b002183d12e0ebmr24861338wrf.510.1655755642796; 
 Mon, 20 Jun 2022 13:07:22 -0700 (PDT)
Received: from localhost (92.40.169.63.threembb.co.uk. [92.40.169.63])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a05600c014a00b0039ee51fda45sm12789702wmm.2.2022.06.20.13.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 13:07:22 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 42/49] mfd: qcom-pm8008: Fix broken mask/unmask in irq chip
Date: Mon, 20 Jun 2022 21:06:37 +0100
Message-Id: <20220620200644.1961936-43-aidanmacdonald.0x0@gmail.com>
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

Swap mask_base and unmask_base, and drop the broken_mask_unmask
flag since we're now expecting the registers to have their usual
behavior.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/mfd/qcom-pm8008.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index 18095e72714e..7bc6becfe7f4 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -45,8 +45,8 @@ enum {
 #define PM8008_GPIO2_ADDR	PM8008_PERIPH_3_BASE
 
 #define PM8008_STATUS_BASE	(PM8008_PERIPH_0_BASE | INT_LATCHED_STS_OFFSET)
-#define PM8008_MASK_BASE	(PM8008_PERIPH_0_BASE | INT_EN_SET_OFFSET)
-#define PM8008_UNMASK_BASE	(PM8008_PERIPH_0_BASE | INT_EN_CLR_OFFSET)
+#define PM8008_MASK_BASE	(PM8008_PERIPH_0_BASE | INT_EN_CLR_OFFSET)
+#define PM8008_UNMASK_BASE	(PM8008_PERIPH_0_BASE | INT_EN_SET_OFFSET)
 #define PM8008_TYPE_BASE	(PM8008_PERIPH_0_BASE | INT_SET_TYPE_OFFSET)
 #define PM8008_ACK_BASE		(PM8008_PERIPH_0_BASE | INT_LATCHED_CLR_OFFSET)
 #define PM8008_POLARITY_HI_BASE	(PM8008_PERIPH_0_BASE | INT_POL_HIGH_OFFSET)
@@ -141,7 +141,6 @@ static struct regmap_irq_chip pm8008_irq_chip = {
 	.status_base		= PM8008_STATUS_BASE,
 	.mask_base		= PM8008_MASK_BASE,
 	.unmask_base		= PM8008_UNMASK_BASE,
-	.broken_mask_unmask	= true,
 	.ack_base		= PM8008_ACK_BASE,
 	.config_base		= pm8008_config_regs,
 	.num_config_bases	= ARRAY_SIZE(pm8008_config_regs),
-- 
2.35.1

