Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6517A554F5F
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:33:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F00921F6D;
	Wed, 22 Jun 2022 17:32:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F00921F6D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655911999;
	bh=sB6hyCrOr1JiyxvBRqrMiAIcRByL7GK0Ppnds6KEUWE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oe0Yxq4XIRcV0cwX2wrmiVnD66QFAbg5AHZHhk9baRxk91hXWL4yD5p1YOf9k/r1d
	 Jj51kZVoivgr+uw1V0znlAIF4H2gVQlsbykt828CY5ZSTg9hOXZrKLQDgEoWvKrneJ
	 XXhoYioywzuGZlmzVAWoclpLeouUsa17rZkt8ajw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F8E2F805F5;
	Wed, 22 Jun 2022 17:23:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51AB7F804E7; Mon, 20 Jun 2022 22:07:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,SPF_HELO_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B379F800CB
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 22:07:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B379F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YUDmW8ZJ"
Received: by mail-wr1-x42a.google.com with SMTP id o8so16102621wro.3
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 13:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EO+iuOKogLq1gEhCZXsb9WMdWtj7M6TVjC1w+kM7coQ=;
 b=YUDmW8ZJsJxu9mf+AG0DiMhcJc31kRVZ4ADkdSPk8W6VHXXqo4OhpTn+ltak91umjD
 t2+KAswtChyR/y4NqqTx+RmQR/8HLN00XtsNQ0e4xwfKxuZBByicexl2a5x5LBn3I0pk
 x8JO5FxRZt/KDQOCVtNQIKgDYlK/FvLijeVz2EHn2mzjXxfDjOvMwunXb8JB3OkGfefD
 6GNtm5l9fhoIdmSS9kdw/3MIBC2aqx27mxgbqN6E4qbJINN1Ul/S8xgw8SLML3o/B/QQ
 Kk8/5xYVjIsLkrwsviBZMNweB6p+q9qY5xoEECUP5iygiuGIb6cd2pLwlh4Zo+v28+Ho
 aKgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EO+iuOKogLq1gEhCZXsb9WMdWtj7M6TVjC1w+kM7coQ=;
 b=4V+bCJ0LFaSl56uj2+oiLmWRQWvMS/3wB0GGybTQU5pR4+zcQ1lxHrwfupMo3DL17u
 neDHnbjarMZl613pQdhs82xp6+c9h52eyw7zMFeFe+zirYaL8A3LvUxODR03HnaT1r7g
 VWNhv2DwO371IW1/JDNnFMmozhVikQ+Hjp5N4n8wt/7E7HIqVyV6qBLP0BRsVMainNKC
 Udew/fN03DfpjAIRQXlW9S3GI5NDiL9A4N/cV+HMHVnpoI7GltuRauRCC07yjsaLzuiR
 FDmjmKh5NyoGhK7iXqCtf07/Qxh0xcd2AfPKxlah8mvHI6tdOkTL22NgNariAUhG0/O4
 I26w==
X-Gm-Message-State: AJIora+22EEncFnii2k8hfNPq2SWkhypT5pHMknb5j7pdhhJtcOwIXPH
 ewTl9YoaMtI4naaiSNF1RSE=
X-Google-Smtp-Source: AGRyM1uQnJZI6JTSn/IXnIpbA1+48K9Xd0eSzXtkoL8kKSucoVse7cEUTXPmpKK2qI8vGS5EmgHfHA==
X-Received: by 2002:a5d:6a01:0:b0:21a:338c:4862 with SMTP id
 m1-20020a5d6a01000000b0021a338c4862mr23039009wru.631.1655755631108; 
 Mon, 20 Jun 2022 13:07:11 -0700 (PDT)
Received: from localhost (92.40.169.63.threembb.co.uk. [92.40.169.63])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a05600c3b0600b00397402ae674sm20063059wms.11.2022.06.20.13.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 13:07:10 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 35/49] extcon: max77843: replace irqchip mask_invert with
 unmask_base
Date: Mon, 20 Jun 2022 21:06:30 +0100
Message-Id: <20220620200644.1961936-36-aidanmacdonald.0x0@gmail.com>
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
 drivers/extcon/extcon-max77843.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/extcon/extcon-max77843.c b/drivers/extcon/extcon-max77843.c
index 8e6e97ec65a8..1bc0426ce3f1 100644
--- a/drivers/extcon/extcon-max77843.c
+++ b/drivers/extcon/extcon-max77843.c
@@ -189,8 +189,7 @@ static const struct regmap_irq max77843_muic_irq[] = {
 static const struct regmap_irq_chip max77843_muic_irq_chip = {
 	.name           = "max77843-muic",
 	.status_base    = MAX77843_MUIC_REG_INT1,
-	.mask_base      = MAX77843_MUIC_REG_INTMASK1,
-	.mask_invert    = true,
+	.unmask_base    = MAX77843_MUIC_REG_INTMASK1,
 	.num_regs       = 3,
 	.irqs           = max77843_muic_irq,
 	.num_irqs       = ARRAY_SIZE(max77843_muic_irq),
-- 
2.35.1

