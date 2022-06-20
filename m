Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5227554F69
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:35:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8196F205A;
	Wed, 22 Jun 2022 17:34:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8196F205A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655912109;
	bh=7Xr91GBTIk8V/6Ucyw2lpWkyUfUIUrQGG12uVJ2UDGs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P2Mfvev55VAw4pH8USsrR5XeXG+3NRmAq6Wd8r87N6CpwBl0/z0rrOsja1v+YtOsI
	 mKDAlTLwaMP48c5sMrogASmq6hhJRMhXjh0hVbmu9WZQEuq6TGpZWr+z1cmOdJbglF
	 GyLojtewsjL9rR2ZZBd7hp86jNLbbAfViuZvuHxE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A7A6F80632;
	Wed, 22 Jun 2022 17:23:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B196F804DA; Mon, 20 Jun 2022 22:07:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A15E3F804DA
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 22:07:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A15E3F804DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="AjebCnrC"
Received: by mail-wr1-x42a.google.com with SMTP id e25so12215275wrc.13
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 13:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rFP2epvfooKrZpPFT8BKKDNI28ulsq6H0dBYSPgFoyk=;
 b=AjebCnrCn0roYHEXtZUSrMTMzWgreVkEMmGmWHB4aW5MqCKA4G4WAtMmLhSH/wSD9O
 hErB+wW/nmuyZcj6VsVAhDUiCzXy1A0InOSiMOhVg1zOo944NV//bnCbQ2Nfq/Wvm/4X
 gHuja0BV7C29XQ21FTvJ66Q4m2HHGHfjAfbDNfzOus4oL46kEV7W/Ut/DNWQxw6A0wN3
 MaclksZzjz+wgvfYM3RiCRmGkMi+n+Veo8oqESntYKECZMRtvsRVSUdWqg/UzoMptmRp
 DOSCYB+7UcRMW3szUyAX5e47sGuNfYYpbyhUPLebUPzr6yz1Frjd0ZNrD8flYUO0+4T7
 n+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rFP2epvfooKrZpPFT8BKKDNI28ulsq6H0dBYSPgFoyk=;
 b=uZB06jlgjqqht4MshcKl8zaau7A5fAFhYElvdd0UZiD66gxBdcMZPlaNuoCZR37DRl
 5G9VNwW2ImY13bC1MGtzSVNpJmjHI5aRuWoqeFxk3S8UA2WS6rHzHThiixF8agGz6JNz
 7EQuvQyiS8+eWWCrI3fQ024Ok7sqHo/v7Whr5eBFOSC98HmSXekFhYD2ivfVOkblHv2T
 dgf/DwEosm3CRmEVqKhRxRG5AFv6J94glvt/SFOYpseGHlW1HtdPoAfsHmphAlJe2S7I
 8wWZk/d7BC8563+ZIrIs4B+Gq0Bf2vZXynsYtOEEWPBwDE/iexOkTsIJ4sCNiSefv1R6
 WtSA==
X-Gm-Message-State: AJIora9xj8p0RR+LPEPu251yqkiG3WZ19n/hWmzYqKpwSYCCIAPNQY7H
 UFuCFLzHpbzKTP3IY/LfiZI=
X-Google-Smtp-Source: AGRyM1tPhWdLWdfyykUlpNJ3PSEDMPtwatE94NYU/Ih24mSrC9Dy3BbzCPtCbJhpEUzIutMTZqJdog==
X-Received: by 2002:a05:6000:10d0:b0:21b:8ffb:80ad with SMTP id
 b16-20020a05600010d000b0021b8ffb80admr6433209wrx.444.1655755644354; 
 Mon, 20 Jun 2022 13:07:24 -0700 (PDT)
Received: from localhost (92.40.169.63.threembb.co.uk. [92.40.169.63])
 by smtp.gmail.com with ESMTPSA id
 o20-20020a1c7514000000b0039c4ec6fdacsm15898561wmc.40.2022.06.20.13.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 13:07:23 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 43/49] mfd: qcom-pm8008: Enable mask_writeonly flag for irq
 chip
Date: Mon, 20 Jun 2022 21:06:38 +0100
Message-Id: <20220620200644.1961936-44-aidanmacdonald.0x0@gmail.com>
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

The PM8008 has separate set and clear registers for controlling
its interrupt masks. These are likely volatile registers which
read as 0, and writing a '1' bit sets or clears the corresponding
bit in the mask register.

The PM8008's regmap config doesn't enable a cache, so all register
access is already volatile. Adding the mask_writeonly flag should
reduce bus traffic by avoiding a read-modify-write on the mask
set/clear registers.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 drivers/mfd/qcom-pm8008.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
index 7bc6becfe7f4..c778f2f87a17 100644
--- a/drivers/mfd/qcom-pm8008.c
+++ b/drivers/mfd/qcom-pm8008.c
@@ -141,6 +141,7 @@ static struct regmap_irq_chip pm8008_irq_chip = {
 	.status_base		= PM8008_STATUS_BASE,
 	.mask_base		= PM8008_MASK_BASE,
 	.unmask_base		= PM8008_UNMASK_BASE,
+	.mask_writeonly		= true,
 	.ack_base		= PM8008_ACK_BASE,
 	.config_base		= pm8008_config_regs,
 	.num_config_bases	= ARRAY_SIZE(pm8008_config_regs),
-- 
2.35.1

