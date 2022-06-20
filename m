Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F484554F53
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:31:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C303E1DF4;
	Wed, 22 Jun 2022 17:30:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C303E1DF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655911872;
	bh=ZCOzxBLjHX26DoNSlpcgdlSE6xvZicVr3vGGB3CZ7b0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eor/74wJeqNldCDJE7V7NS3vbg0S7PGnK9gGcPkj3bphYrIM5P6vuwS4Y2WbNcM3Z
	 tRN/SPlJML+Wi4y/cxqRfp5KwkWvMWZy6+a1eaNa/31dCpxE/oJKcxIGtbiMPk8koc
	 i/4aPbtkFe8I70t5L9cCnXHreUr61QjZR3IiNBRI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C0A6F805F2;
	Wed, 22 Jun 2022 17:23:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5060CF804E5; Mon, 20 Jun 2022 22:07:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,SPF_HELO_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92A85F800E3
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 22:06:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92A85F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Hx66dBMo"
Received: by mail-wr1-x431.google.com with SMTP id m1so8326299wrb.2
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 13:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aFyu5esk/Zb2lNQzmvPRJ9QuwxnaeJqoP/Ih9wxKaVE=;
 b=Hx66dBMoypw3HFQ6ZlYKo/eR568ezNz8W5y6iElQBkDHOOhjdkd2OOUeXyuM4IJATJ
 nOWdw0iuhlEmOX8vNXfnAWlMC147l0U4mfE3S2gNMusmdyP2zWZJyHYTvmwCppX/Iskv
 vwfm6snjUXGKxpT/jRbYfj6RIQgagfupLw7jvBu/UAvy5tQBhPO9eQAGfcl+0IEp9k+M
 wAT+eo4bwJp8EjwTVNo5vMEs/MgiikrzJ6fDgsNBPx0jramgLds5jhx1zxPNI3c4MG3Q
 IGQX9FrRR/YfkFCB3wF6UfpCKRFn8rTPevafX0DQ9EPElddTBsBLn3qw+l3BZXYk9GKI
 5nXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aFyu5esk/Zb2lNQzmvPRJ9QuwxnaeJqoP/Ih9wxKaVE=;
 b=oiIekwgoAVi78I/2h7CpAKoLZXRRcvOisMLJm4LfrTh8NKV1DrvUUY1zmhvxty0kSz
 aLsNjVrMy+ue3pVG2xgYjg9oGcV/qI8Q24YGvhMzaSOT+/6t4iflNcb1YIxJ60+0RFT8
 zAzWaqy65PbZoOBlc/qctwUP8RNVHL3FabT5PFVIxPv15B2k99jknhGcIj9DHQFkSeXm
 2DzKQc8he//suGARKED0iEJCFRA/QGpgPNA7qBuK/rpEYRQixldsasK/dZaIT0/Vkp8R
 vcZFOSfiJIJcLiLv+0CX7YYuWuk/+DA1dh98CTe92dbIP6kZ5mnAG9g8VPirHkCB4eLu
 anPQ==
X-Gm-Message-State: AJIora/zozj5K6nI/nJmUH0HKF+Hg+prR7Po44fp6oMLoUyh06K4RSLF
 Ohj+vsukzrYry5IYvoHxHW0=
X-Google-Smtp-Source: AGRyM1tHw8LdpOYQ4ocdkg/wb7xbdY+ptC8YBcgzkEw+K1EEKq9i385MNLM8p7QV0MNlJKBoINhp9g==
X-Received: by 2002:a5d:5847:0:b0:218:5319:f4e3 with SMTP id
 i7-20020a5d5847000000b002185319f4e3mr25586723wrf.500.1655755615568; 
 Mon, 20 Jun 2022 13:06:55 -0700 (PDT)
Received: from localhost (92.40.169.63.threembb.co.uk. [92.40.169.63])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a7bc105000000b003976fbfbf00sm15528084wmi.30.2022.06.20.13.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 13:06:54 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 26/49] mfd: rn5t618: replace irqchip mask_invert with
 unmask_base
Date: Mon, 20 Jun 2022 21:06:21 +0100
Message-Id: <20220620200644.1961936-27-aidanmacdonald.0x0@gmail.com>
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
 drivers/mfd/rn5t618.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mfd/rn5t618.c b/drivers/mfd/rn5t618.c
index 384acb459427..7ed002d090bd 100644
--- a/drivers/mfd/rn5t618.c
+++ b/drivers/mfd/rn5t618.c
@@ -80,8 +80,7 @@ static const struct regmap_irq_chip rc5t619_irq_chip = {
 	.num_irqs = ARRAY_SIZE(rc5t619_irqs),
 	.num_regs = 1,
 	.status_base = RN5T618_INTMON,
-	.mask_base = RN5T618_INTEN,
-	.mask_invert = true,
+	.unmask_base = RN5T618_INTEN,
 };
 
 static struct i2c_client *rn5t618_pm_power_off;
-- 
2.35.1

