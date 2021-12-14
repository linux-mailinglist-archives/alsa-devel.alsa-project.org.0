Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE9B473A94
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 03:11:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29DEC18FF;
	Tue, 14 Dec 2021 03:10:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29DEC18FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639447874;
	bh=+xZBtG6b0VgkwZGO4AfYJ7IOSs490JOSW2+ykhiETK8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Pbn6HCVFK9Qd8l2SHXvrNUVl7YQIDPFX6Fgboyc6qc+OUAMXHfMJBNPMgAjMx4TA4
	 sECOIF3dMb4cxuYtKS3ED5Of5PvJnHXzaS8d7ULFS44Tr2Dfw3IeZZFQmr5qVs6mvx
	 yR/ZyPctfhj/A3ql+D9mE/X6aE3dagUqZxipkICE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A677F80516;
	Tue, 14 Dec 2021 03:09:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC79DF8050F; Tue, 14 Dec 2021 03:09:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D71D9F800FE
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 03:09:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D71D9F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QvuAcOjV"
Received: by mail-pg1-x533.google.com with SMTP id m15so16100088pgu.11
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 18:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=67aAVHzQgMYaTzVoy6PRJ1eod7mleiOp7Z/MtjZ0F1c=;
 b=QvuAcOjVz1fq/l4yRK/e6hXTKjCSYxy+QK7xySZHcZhVM0p2LKF714U27y/lrRbYSK
 Uy41/eVPS/Mt0iRqv5ftQJ+RoFajFJ+ovFRsvnxtIOIE3vwgs0JWd2kG/81I7xV9B0Nx
 7pGzJOjBWTqGnDNfTwVStXHczEEMAuTBNs5LFB6MjVnA/4pE4if+gIF8EGp1y/HsWgxQ
 mIWp+u0oeRMh0xfhzILDGo+SyV6VBj2QXmue69EzTdzdZp0KpI8Se4JW4OhM/NgOrPox
 J9wJW8QEcHKNZNkgXKLlHBLZUeI7+5HgS6cIlEOYpvNG1VtY2gbHIWk30M9dkjt04JF5
 uKww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=67aAVHzQgMYaTzVoy6PRJ1eod7mleiOp7Z/MtjZ0F1c=;
 b=vTqqiUyMrcUhkJm5Ani4eMdlIJk6xHONAoJxLfTtlHqD5aoqt6z5W/1UVqIidVRu5C
 SJfsHuWyLuWIg0cZEm6s07DrnNwra8VAwrQ3KiEONEarFhg7Ufd/Tl3KaGGRXpCdvJvg
 i5FiENMKWPGrKdVF7VhuZ1B2fsV2OxAxsambtCxlCW/MvCLMGb9oTYc7tVkWOzChHKaS
 rb8dhGDQ2AkguvzT9/8Sgj33Z/fNV121LPdo7MfHZjWGY2OsDTJb4wgiNyOdOOsLpE+j
 bm09EZ3GPngkkRwVj9MH5AQNMbDr03T92p2dnodZRouepVCjNzFMawS6iBhZg0r+YFuq
 aEBw==
X-Gm-Message-State: AOAM530nqRFRrIWS49IEVcx0ywwwyzl8+XxZZw82Pqy+dWRq/deiC425
 UEZT1ahu4EMSneEPT8LYhkE=
X-Google-Smtp-Source: ABdhPJwfSg775AQtbWaqex19UH1FOVC/avKlf2yC4OnmAegUr+6QzAXITaV77tZgLvmbH/64jl1Blg==
X-Received: by 2002:a62:7541:0:b0:4a3:8a3b:6136 with SMTP id
 q62-20020a627541000000b004a38a3b6136mr1756489pfc.78.1639447763910; 
 Mon, 13 Dec 2021 18:09:23 -0800 (PST)
Received: from localhost.localdomain ([126.249.140.249])
 by smtp.gmail.com with ESMTPSA id b2sm14622296pfv.198.2021.12.13.18.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 18:09:23 -0800 (PST)
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 01/22] ASoC: codecs: ak4118: Use dev_err_probe() helper
Date: Tue, 14 Dec 2021 11:08:22 +0900
Message-Id: <20211214020843.2225831-2-kuninori.morimoto.gx@renesas.com>
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
 sound/soc/codecs/ak4118.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/ak4118.c b/sound/soc/codecs/ak4118.c
index e0a6451851e8..2e6bafd2a821 100644
--- a/sound/soc/codecs/ak4118.c
+++ b/sound/soc/codecs/ak4118.c
@@ -374,20 +374,14 @@ static int ak4118_i2c_probe(struct i2c_client *i2c,
 	i2c_set_clientdata(i2c, ak4118);
 
 	ak4118->reset = devm_gpiod_get(&i2c->dev, "reset", GPIOD_OUT_HIGH);
-	if (IS_ERR(ak4118->reset)) {
-		ret = PTR_ERR(ak4118->reset);
-		if (ret != -EPROBE_DEFER)
-			dev_err(&i2c->dev, "Failed to get reset: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(ak4118->reset))
+		return dev_err_probe(&i2c->dev, PTR_ERR(ak4118->reset),
+				     "Failed to get reset\n");
 
 	ak4118->irq = devm_gpiod_get(&i2c->dev, "irq", GPIOD_IN);
-	if (IS_ERR(ak4118->irq)) {
-		ret = PTR_ERR(ak4118->irq);
-		if (ret != -EPROBE_DEFER)
-			dev_err(&i2c->dev, "Failed to get IRQ: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(ak4118->irq))
+		return dev_err_probe(&i2c->dev, PTR_ERR(ak4118->irq),
+				     "Failed to get IRQ\n");
 
 	ret = devm_request_threaded_irq(&i2c->dev, gpiod_to_irq(ak4118->irq),
 					NULL, ak4118_irq_handler,
-- 
2.25.1

