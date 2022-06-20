Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76197554F66
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:34:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 174E2206C;
	Wed, 22 Jun 2022 17:33:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 174E2206C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655912078;
	bh=C3RLgvOHtC4wW2FaN1spuP4JfxX+4t6GORKGQTVdLCY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=li7zlM2cJnkBP3L4+IiPbchykhJQ2tdCR6C6fVoMzQEz6j7jnppCe5QOmfpef/tNC
	 k3dmAjtLVCC5YychiQcO8UUyDmEOLNCnqsV9b/KKwWcM4hIVdNIDpPghvcu3bLVqqU
	 Hh0iiONOTxvfjrjgOHrXKbkjLICJyRiXVYVOniag=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 841F3F8062D;
	Wed, 22 Jun 2022 17:23:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AD43F804D2; Mon, 20 Jun 2022 22:07:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8842F804DA
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 22:07:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8842F804DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QjvV+I2L"
Received: by mail-wr1-x435.google.com with SMTP id g4so16062228wrh.11
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 13:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=drtbL6Ol3nSvJosEWn6BWyNAP++5ZasjbOfmzop3MZQ=;
 b=QjvV+I2LY/VPVY45eWYJLbt7si9DgUbUdBiK1tnDmgIOAGcJlPEfPEbz0xPv6PFG6C
 fqwpwN657JaXPxJXBP5AOwcKcjfbM0nFCo3ly+/TCctIcxL8Ez9srZzj3C6ZbVZaRiqz
 JbpxIf/a/wjakAyd7TsXsc3ArAii392QnIxa2RXb5I35fEt59JdMD+jqhaGkdRCDDnM/
 pAKKZGaQWk1j3re/9CnNYt5bHRviVWNWQz6tjo3Kf2EI4KjNuph2+cI7M7xbk0fkDW+c
 fBjVbekqWUfyD7IfdeqH1QuljKLVCEXC/+72mhEJsa01pPfOg9ygPXXe7cysaPnB7z2q
 C0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=drtbL6Ol3nSvJosEWn6BWyNAP++5ZasjbOfmzop3MZQ=;
 b=rmCgzJ2SgWoN2K34DNXKcqOjy5C7hRKv6fX/iQJgvXuX19jUwNMl+c3RXlBAn2kh2c
 Nz4DVFo1GXKqTWsAzTeY/0w0fRYgu27khFg0FJVQRjzClhh6iuf2cbsp1EB98VIEqGUr
 rQwrMIKqd1dzjS6RK9rxPkGLeDt0AcTQrZEBppmlqFuVOHFLIdaphCFjJJfqlU6UrHJx
 e98E/bT2kjcfUeKUpGysJr2gidLeiQfu00gt8LGdjEYT4mBm/hMmqmEr0sbWS1auN1b8
 C0tMEejSrUnqGA2kRp4seBIvb2u3ZL0muCnDcYWcjRe2qAkCQ0CnITeHrBopC5NzC+Kc
 NjFg==
X-Gm-Message-State: AJIora/dNjBo/V3aaa6x/QRTHSb+L9lGJiPPQJZ/LW/7V5qurX4ZeAG7
 e+N2VhKGDhOWEEA7gD9yZpk=
X-Google-Smtp-Source: AGRyM1upACNZTooDfHG9XrmiWJXxBNAesYYQbcORquUwOuEJ3OJEEk57wgHnkZp1ZcThb45MTPunjw==
X-Received: by 2002:a05:6000:1788:b0:219:e28f:dc98 with SMTP id
 e8-20020a056000178800b00219e28fdc98mr24527156wrg.144.1655755639378; 
 Mon, 20 Jun 2022 13:07:19 -0700 (PDT)
Received: from localhost (92.40.169.63.threembb.co.uk. [92.40.169.63])
 by smtp.gmail.com with ESMTPSA id
 c130-20020a1c3588000000b0039c798b2dc5sm19765399wma.8.2022.06.20.13.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 13:07:18 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 40/49] mfd: stpmic1: Fix broken mask/unmask in irq chip
Date: Mon, 20 Jun 2022 21:06:35 +0100
Message-Id: <20220620200644.1961936-41-aidanmacdonald.0x0@gmail.com>
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
 drivers/mfd/stpmic1.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/stpmic1.c b/drivers/mfd/stpmic1.c
index 2307d1b0269d..11f3d92acbc0 100644
--- a/drivers/mfd/stpmic1.c
+++ b/drivers/mfd/stpmic1.c
@@ -108,9 +108,8 @@ static const struct regmap_irq stpmic1_irqs[] = {
 static const struct regmap_irq_chip stpmic1_regmap_irq_chip = {
 	.name = "pmic_irq",
 	.status_base = INT_PENDING_R1,
-	.mask_base = INT_CLEAR_MASK_R1,
-	.unmask_base = INT_SET_MASK_R1,
-	.broken_mask_unmask = true,
+	.mask_base = INT_SET_MASK_R1,
+	.unmask_base = INT_CLEAR_MASK_R1,
 	.ack_base = INT_CLEAR_R1,
 	.num_regs = STPMIC1_PMIC_NUM_IRQ_REGS,
 	.irqs = stpmic1_irqs,
-- 
2.35.1

