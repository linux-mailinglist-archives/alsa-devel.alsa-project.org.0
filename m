Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A89554F68
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:34:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F30E6209C;
	Wed, 22 Jun 2022 17:34:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F30E6209C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655912093;
	bh=ZnVGfFx4w4okv/nIK0ywmJeln0DOUFoxvbYe+lWFSJo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VF/tMY/1cDVqPBozJRLVmH+QQdPoXA4NXgCEmEeqDf0yYSTGr1gtuZDUMzlJaVK6Y
	 HPlsydlVGTPgkuhSDx4fI/aW5MPWoZCA8M1r19mKwcaCcxJ3NhvukoRGDqRG+6Q4Oa
	 h+EUDUqLRczoAKVC5rcsF8jMAUALaKyL7B2cblKw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11DFCF80631;
	Wed, 22 Jun 2022 17:23:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F5A5F800CB; Mon, 20 Jun 2022 22:07:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B741CF800CB
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 22:07:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B741CF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ebmJPjTe"
Received: by mail-wm1-x32e.google.com with SMTP id
 c130-20020a1c3588000000b0039c6fd897b4so8272060wma.4
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 13:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jlVXT9wSLhbjTPX5ZR3Wmtb87jq29nLk3aAphr92sAg=;
 b=ebmJPjTeif3YqVHvTJpEhOnpA1LETt7fyC+dYjLX7rLJosvOzs1UQNRtfP7VlocI/M
 SwIjzmreM6vhiA8WP0nFyAlnvkcR1cph6p9w9CAsCH9xBR/BnJhAC1VOP2xg7dIrjnee
 +zaNjC6ZldbBdoFD98cx82VUpbinKwzYspMqw+aPPgXpt8M4kAHnWjx5TOKgR6frrIsg
 bXuvPeqxYG3zzsjOeJPJz1FR22BVk15SC32yeUV3YEF8h3u7ZygHhwDQwSNzGNcaPpgo
 N13v2bUVREQpLfKZ8qO6chIOpZWPy3oOCIUIt5sPYXlDIPpr/V0HH+XrX7eAvdFaGSwv
 Ar1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jlVXT9wSLhbjTPX5ZR3Wmtb87jq29nLk3aAphr92sAg=;
 b=bMWSLUe18N47qbT8Ym3BBiCbSWDUC3xXqMT+b/2wg0x7uVdb2AyEbHOLEXPFpgoW/W
 Z2MNmrrKno3QpnhYMuYz46QNHpHSKUbtKJLygKnzUZKX/jkfOdjv2I9FJQnMGPmwAsAe
 GiJRCwfPnwm9EIjZ1PrPMpUnca5EuvWwy9OuayrvrrLs+JiiiTViNoYRNgYzIl/QobqS
 MYI/4JQo4G6jOm+JWDMAiSGuqXeeL7+CWZa5F3BvCBYcMOggPc/L8gALMdsPr1yaUWYP
 SGKlvcux8rJbR4diALeFZmRSQc3WCJfvQ0NNuibiWTIJuGbGIuGHZ7MB1ooK8mpm2oHg
 ILaw==
X-Gm-Message-State: AJIora/S8JnlH8gBkxJ2EIR9ZeGii3tWwN29Me/g2U7yul06GKgs/Z4e
 uiALL2MKtd4fayKv8AKa43U=
X-Google-Smtp-Source: AGRyM1sc/mkNVW+Wf51Vzi8+T/JAUXCnQCm+ky6mXOwMd5kGL1382a4p9m8dOR+VJbmTp4xRJYVpMw==
X-Received: by 2002:a05:600c:19c9:b0:39c:72fc:9530 with SMTP id
 u9-20020a05600c19c900b0039c72fc9530mr25836673wmq.88.1655755641072; 
 Mon, 20 Jun 2022 13:07:21 -0700 (PDT)
Received: from localhost (92.40.169.63.threembb.co.uk. [92.40.169.63])
 by smtp.gmail.com with ESMTPSA id
 b9-20020adfe309000000b0020d0c9c95d3sm14556677wrj.77.2022.06.20.13.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 13:07:20 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 41/49] mfd: stpmic1: Enable mask_writeonly flag for irq chip
Date: Mon, 20 Jun 2022 21:06:36 +0100
Message-Id: <20220620200644.1961936-42-aidanmacdonald.0x0@gmail.com>
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

The STPMIC1 has separate set and clear registers for controlling
its interrupt masks. These are volatile registers; writing a '1'
will set or clear the corresponding mask bit, and they read as 0.

Marking the registers volatile and using the mask_writeonly flag
should reduce bus traffic by avoiding a read-modify-write on the
mask set/clear registers.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/mfd/stpmic1.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/stpmic1.c b/drivers/mfd/stpmic1.c
index 11f3d92acbc0..a99f7b45df57 100644
--- a/drivers/mfd/stpmic1.c
+++ b/drivers/mfd/stpmic1.c
@@ -42,6 +42,8 @@ static const struct regmap_range stpmic1_volatile_ranges[] = {
 	regmap_reg_range(WCHDG_CR, WCHDG_CR),
 	regmap_reg_range(INT_PENDING_R1, INT_PENDING_R4),
 	regmap_reg_range(INT_SRC_R1, INT_SRC_R4),
+	regmap_reg_range(INT_SET_MASK_R1, INT_SET_MASK_R4),
+	regmap_reg_range(INT_CLEAR_MASK_R1, INT_CLEAR_MASK_R4),
 };
 
 static const struct regmap_access_table stpmic1_readable_table = {
@@ -110,6 +112,7 @@ static const struct regmap_irq_chip stpmic1_regmap_irq_chip = {
 	.status_base = INT_PENDING_R1,
 	.mask_base = INT_SET_MASK_R1,
 	.unmask_base = INT_CLEAR_MASK_R1,
+	.mask_writeonly = true,
 	.ack_base = INT_CLEAR_R1,
 	.num_regs = STPMIC1_PMIC_NUM_IRQ_REGS,
 	.irqs = stpmic1_irqs,
-- 
2.35.1

