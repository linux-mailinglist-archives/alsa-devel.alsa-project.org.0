Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9C8473AA1
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 03:13:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF7C21AD7;
	Tue, 14 Dec 2021 03:12:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF7C21AD7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639448009;
	bh=RHFnF8IKI5qVeoGUapYtoLWvA0kXISOQbg3j6d/NIlQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=goNBUGoHs5M3v3exZbpzuR+9VNWoIh0dkC05Z8/fa8uT0RlcYgYupRhxSQeU0zPRc
	 9EVn0pAEw3SecV7NcpwGJoSkq6KFsqP6Ml3CaA+cFcJ1HH/qHbssd4sDf0PekgMYYX
	 NryfCT2pC5nkB0+iluRH9EVSS5Da+XoTqvQde6rc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1CB7F80559;
	Tue, 14 Dec 2021 03:09:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B799F80535; Tue, 14 Dec 2021 03:09:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB086F8051E
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 03:09:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB086F8051E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kUrnJpsA"
Received: by mail-pf1-x432.google.com with SMTP id g18so16576132pfk.5
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 18:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0m7+RV35C2IK1AeVqYynJWc44tnirqkkVx+QKmMJDV8=;
 b=kUrnJpsAiuoBev+UuABzlHCAdjnzCL1IMvtmaZ/c9G2I11orsEMFCZQyxBwKPwTdSk
 xRuXBf1h27adBAdD/2X3v/YvwzSxtaBgZn8GiNsaOf/FPonBCZmt9f3DoF5wYR4bBJHF
 u+4uhcTVD1ZwnMUU/pqyJH+Pcd5bs2YQYDiipoqHlNMykZu1GG9aMTVeaFGrhGuprqr2
 2qXVGrW2hRTG7pBizjsn29UwLgpRnnH/7sXZ+C0pIVF7h9IRff2VFrZwFenDVn/7Aeaw
 VLnPuh7SZ9wOUtRVQGyy/ckHmUZSecpMHiSYgdqeV3AJiv6at1/nZ+wLyMH4ZkhcOAuI
 gyzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0m7+RV35C2IK1AeVqYynJWc44tnirqkkVx+QKmMJDV8=;
 b=GD3tbXcDYcUdKCpzBHuzlKPUf8Q8FMvGudPFgo613+2ps7W34NMJx0eeFP+LxP18O/
 q3uqSLyXGLr1RKCOoqmEZgw+1cST1MloBqAKaVZ5dMmmaeEUgP0zSFkBhgByBpARqvcz
 ov1yQrOOW70T/MHWZQGiumopcUawju9bYjR4EFk6IY+wr3EbzKUjaVdEYmiNxthrIL+Z
 r7dSHVXuttW1ORJYXvg8eEFmPM/v2BZZl5a+vN57Q/ygd1Vh4FQncTEh8qybV/RvH8lF
 V5mJUyVGgCjfP/jAjVs/IAyvkfMDyy6SiSBBkHapar3nrttdQj7iAH9QwjZv2nc80rcL
 7ebA==
X-Gm-Message-State: AOAM533RH/M+FQV8cWjQe/Q4AsBIb8RZUbOSHo6iJh7vgssxlISer7wU
 X5z0PolE3xeIptC4DPrQT+w=
X-Google-Smtp-Source: ABdhPJyWM9gcNuY05Bd8Kb7EHy4n6XhjBizleCxpM3k61dsmuvW2kjCs05HIjGQXr6AVAaeJJ9hT8g==
X-Received: by 2002:a63:6c8a:: with SMTP id h132mr1728134pgc.85.1639447773996; 
 Mon, 13 Dec 2021 18:09:33 -0800 (PST)
Received: from localhost.localdomain ([126.249.140.249])
 by smtp.gmail.com with ESMTPSA id b2sm14622296pfv.198.2021.12.13.18.09.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 18:09:33 -0800 (PST)
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 08/22] ASoC: codecs: simple-mux: Use dev_err_probe() helper
Date: Tue, 14 Dec 2021 11:08:29 +0900
Message-Id: <20211214020843.2225831-9-kuninori.morimoto.gx@renesas.com>
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
 sound/soc/codecs/simple-mux.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/simple-mux.c b/sound/soc/codecs/simple-mux.c
index e0a09dadfa7c..d30c0d24d90a 100644
--- a/sound/soc/codecs/simple-mux.c
+++ b/sound/soc/codecs/simple-mux.c
@@ -82,7 +82,6 @@ static int simple_mux_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct simple_mux *priv;
-	int err;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -91,12 +90,9 @@ static int simple_mux_probe(struct platform_device *pdev)
 	dev_set_drvdata(dev, priv);
 
 	priv->gpiod_mux = devm_gpiod_get(dev, "mux", GPIOD_OUT_LOW);
-	if (IS_ERR(priv->gpiod_mux)) {
-		err = PTR_ERR(priv->gpiod_mux);
-		if (err != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get 'mux' gpio: %d", err);
-		return err;
-	}
+	if (IS_ERR(priv->gpiod_mux))
+		return dev_err_probe(dev, PTR_ERR(priv->gpiod_mux),
+				     "Failed to get 'mux' gpio");
 
 	return devm_snd_soc_register_component(dev, &simple_mux_component_driver, NULL, 0);
 }
-- 
2.25.1

