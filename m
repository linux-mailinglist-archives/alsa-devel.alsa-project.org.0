Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15129473AA3
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 03:14:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 910461AF9;
	Tue, 14 Dec 2021 03:13:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 910461AF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639448040;
	bh=0TwBkDkAKZepLqwdm9ld5rQTuhjFTY4BmHG3aE8HJcY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uV4++YPkz3WsvD6rNwFYN5sjpACU31h82sKAgYDm/Qn7sT7+BmuIdiltDs7uYOJJM
	 JRcRAxGSC51zQC6fpNS6kKJmoB+l6YXmfuJG/O1Z3uCUiMS5PqZ82QRZH0PeXh13bg
	 33d+3moS63OG2/ttsglBtsLuZPNcjA/ST7IWUufo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4086AF80271;
	Tue, 14 Dec 2021 03:09:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5422CF8051E; Tue, 14 Dec 2021 03:09:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BAF4FF8051C
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 03:09:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAF4FF8051C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gRhrP5cP"
Received: by mail-pj1-x1029.google.com with SMTP id
 f18-20020a17090aa79200b001ad9cb23022so14860175pjq.4
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 18:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nWrNp+DLPW2444tMTP4zI8bLePOte7dVEAPpo+ddoCo=;
 b=gRhrP5cPDcYC2g0S9CkNvzT0aV+2ch27LUgrgA0wgAMfhDsvNbMx58Bd4L97TsUS27
 RmqPGKijmnw0qu30uLHwOoI+HoAseoENyg1lBsPDAlQZ/aQIMPOJCLH4x7GsfcDVZpVt
 b6x1dhw+8ex0YS6rjBvCHn6ucs/dx/go98X4CDKs/4xbsE+YTSPWh6CagCNyd77sz+Oo
 vF7/etwNyubS6KXzg44L8Qeyai2CTBxc9A7Hw3KJiHHEErhMWjfwyVOI1XhuJsFjn8r7
 nSaE4KIUcUrZn765WmXpvercmqkxrMZbzwn5CeNx9E34ho/uPfznmIHGW3W+dbcVgofb
 2IlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nWrNp+DLPW2444tMTP4zI8bLePOte7dVEAPpo+ddoCo=;
 b=BN6WZ/XU7Ntqw6oBDS2WLrybQXNrDMVErSQzLCPOvsiidNILPhpc/MobsHcVjZ6CnA
 TeNVPNW1wLTnHZ7RguLHEVW39k7jI4yl454XDaAvErDEAuhoYcyxSAnmn7sn8viol7Vq
 4fj5b+6Shcwqs35YhDDyvEbfGySSMSS+BATg8AVqPwRfdNYHBMmI9S2fYBEsrhWXdDmS
 dI0HWklecAnZpR+Y+vbyKV6oKstrY2DXs/qyVm23p3hZMWYqKD2ZGYdqiebu2UbF0giE
 RZf2Xr1VQFzq7B2UQ0ztddtUp2jV3XTSXOtI54jW5Kf7Y3uTcRmd5GiIH6c6c/cDcl35
 nczQ==
X-Gm-Message-State: AOAM53348+uvhoXpLthCpCXZZsvI04OvNfQIKo/CX7QD9OpTlLwzodRB
 Mc0ls3qEkoUu52jvmiYUm/A=
X-Google-Smtp-Source: ABdhPJyAeNlFxDiVBPOHJMWG5wuMC4SIv1aZnlxDrCBZasVpzhP+kQ465PIh6LwodHsb6JmCLBYRhg==
X-Received: by 2002:a17:90a:ac08:: with SMTP id
 o8mr2335660pjq.87.1639447776847; 
 Mon, 13 Dec 2021 18:09:36 -0800 (PST)
Received: from localhost.localdomain ([126.249.140.249])
 by smtp.gmail.com with ESMTPSA id b2sm14622296pfv.198.2021.12.13.18.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 18:09:36 -0800 (PST)
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 10/22] ASoC: codecs: tlv320aic31xx: Use dev_err_probe() helper
Date: Tue, 14 Dec 2021 11:08:31 +0900
Message-Id: <20211214020843.2225831-11-kuninori.morimoto.gx@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211214020843.2225831-1-kuninori.morimoto.gx@renesas.com>
References: <20211214020843.2225831-1-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Use the dev_err_probe() helper, instead of open-coding the same
operation.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/tlv320aic31xx.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic31xx.c b/sound/soc/codecs/tlv320aic31xx.c
index 4224b4b3cae6..e77342aff46d 100644
--- a/sound/soc/codecs/tlv320aic31xx.c
+++ b/sound/soc/codecs/tlv320aic31xx.c
@@ -1680,11 +1680,9 @@ static int aic31xx_i2c_probe(struct i2c_client *i2c,
 
 	aic31xx->gpio_reset = devm_gpiod_get_optional(aic31xx->dev, "reset",
 						      GPIOD_OUT_LOW);
-	if (IS_ERR(aic31xx->gpio_reset)) {
-		if (PTR_ERR(aic31xx->gpio_reset) != -EPROBE_DEFER)
-			dev_err(aic31xx->dev, "not able to acquire gpio\n");
-		return PTR_ERR(aic31xx->gpio_reset);
-	}
+	if (IS_ERR(aic31xx->gpio_reset))
+		return dev_err_probe(aic31xx->dev, PTR_ERR(aic31xx->gpio_reset),
+				     "not able to acquire gpio\n");
 
 	for (i = 0; i < ARRAY_SIZE(aic31xx->supplies); i++)
 		aic31xx->supplies[i].supply = aic31xx_supply_names[i];
@@ -1692,12 +1690,8 @@ static int aic31xx_i2c_probe(struct i2c_client *i2c,
 	ret = devm_regulator_bulk_get(aic31xx->dev,
 				      ARRAY_SIZE(aic31xx->supplies),
 				      aic31xx->supplies);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(aic31xx->dev,
-				"Failed to request supplies: %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(aic31xx->dev, ret, "Failed to request supplies\n");
 
 	aic31xx_configure_ocmv(aic31xx);
 
-- 
2.25.1

