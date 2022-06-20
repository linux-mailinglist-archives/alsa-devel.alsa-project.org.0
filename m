Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4D4554F61
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:33:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7266F2031;
	Wed, 22 Jun 2022 17:33:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7266F2031
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655912030;
	bh=Axzq/NuK+tc7TvHHcMaj/cDHQxJMVCSRD9aOEV2d/wQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jTpbuJBcrabpUXzKTXVy5+FWobdOpHbdBmRF0kkh/mFmYHbvkogZnPKF6MESvGlEt
	 jyO2gx2fLXKONqAWEf2CWH7XXR5RaKmxg+XEGelWDCGaSwsipnOsCOkrMI436FEyl8
	 yUzuK4+m1mJDnM04xVbKTXU4g03ep/MAW9qTiD68=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C75C8F80619;
	Wed, 22 Jun 2022 17:23:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C950F800E3; Mon, 20 Jun 2022 22:07:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E83DF800E3
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 22:07:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E83DF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HAVLNiSG"
Received: by mail-wm1-x335.google.com with SMTP id
 x6-20020a1c7c06000000b003972dfca96cso6194801wmc.4
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 13:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4twauV1jKrSap9S7bWtY2G6jDd+AwgeAtPmARMXtVJs=;
 b=HAVLNiSG1Db+lrcRkQRn8OxHpInOCKVObpVGiV2a54L1CQgeoGOooL330nzmb1IrII
 a3+TudV6Bx14k7cwx4iQj2dXFhyD/5OkarV2X1AcQ8112qn1+A6sYLyb7gP/k60vWcpp
 QlXmznoiGFzV+kfuaH3NwBCvN7xAfZ6eQWiXmrgD9jVR+QP4E0pwxB386bRkdp7qjh4v
 RRefsra95ego+spLsfQaC4Onjyy0W/nUDl+zsdYC0d5hRcphjIZcJd2yOdzoQBdmrOLN
 oGvMMVKLgN9yHbyQ2rgqGCUc73aP/jM/TLKGsXmkumYZuLKeHNvCzWm6gGOK0EhOiQTm
 KNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4twauV1jKrSap9S7bWtY2G6jDd+AwgeAtPmARMXtVJs=;
 b=yDVtRyWfZua3R55AGuki2ZTc7Gr37l7Brc1PKDeQbjxl4ObDFQuZzi4ZXdOpRSCEDp
 BTHha9XLMDaT5cVDzdVFfoBfg7mXbAl4F2mmv85aoFt7ggNAlCWF2bsh8UoTCZXq1Ot2
 0OOK1ZzW7yqi5cGTSdnVrIPDsxqTB0nThuNAZPLs4GwIfQskuWzPhqemEn+Fa5bJ1+EH
 s8Z/eicvlcOIUtQCiCwVzzafvWHwx5/yQDeJHEzysXxopEK1BQzlbi69ytS8+V1AWWM1
 F+VraHZTsBlCQAyaXET+Uka7PXQDMF8VR7J6za2aTGr7F4UawgSNdiDUFKjQQm6oqcwn
 bpyA==
X-Gm-Message-State: AJIora95aZeakksZIVzd8SSZrVjj+mH3gnKkZTLNvSTFkqgzVu2TLT1R
 6FAt8F26/BB98i0K6BuFsg4=
X-Google-Smtp-Source: AGRyM1vZj7DM/aKfxxiAy6DKWUA3/0+uS2K9N2/ZQZ6xqLKDO+9vKTvK3AWaJgypH2v81OQNNU2jMg==
X-Received: by 2002:a05:600c:4787:b0:39c:8576:8f55 with SMTP id
 k7-20020a05600c478700b0039c85768f55mr25382417wmo.1.1655755635917; 
 Mon, 20 Jun 2022 13:07:15 -0700 (PDT)
Received: from localhost (92.40.169.63.threembb.co.uk. [92.40.169.63])
 by smtp.gmail.com with ESMTPSA id
 n37-20020a05600c502500b0039c5cecf206sm16544192wmr.4.2022.06.20.13.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 13:07:15 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 38/49] irqchip: sl28cpld: replace irqchip mask_invert with
 unmask_base
Date: Mon, 20 Jun 2022 21:06:33 +0100
Message-Id: <20220620200644.1961936-39-aidanmacdonald.0x0@gmail.com>
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
 drivers/irqchip/irq-sl28cpld.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-sl28cpld.c b/drivers/irqchip/irq-sl28cpld.c
index fbb354413ffa..f2172240172c 100644
--- a/drivers/irqchip/irq-sl28cpld.c
+++ b/drivers/irqchip/irq-sl28cpld.c
@@ -65,8 +65,7 @@ static int sl28cpld_intc_probe(struct platform_device *pdev)
 	irqchip->chip.num_irqs = ARRAY_SIZE(sl28cpld_irqs);
 	irqchip->chip.num_regs = 1;
 	irqchip->chip.status_base = base + INTC_IP;
-	irqchip->chip.mask_base = base + INTC_IE;
-	irqchip->chip.mask_invert = true;
+	irqchip->chip.unmask_base = base + INTC_IE;
 	irqchip->chip.ack_base = base + INTC_IP;
 
 	return devm_regmap_add_irq_chip_fwnode(dev, dev_fwnode(dev),
-- 
2.35.1

