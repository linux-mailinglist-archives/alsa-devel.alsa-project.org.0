Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 637B1473A95
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 03:11:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C118192B;
	Tue, 14 Dec 2021 03:10:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C118192B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639447878;
	bh=1Onc+ig3iARyMMpg8u8pvYDRpPS4UnJ6+cRbGXadNnk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EgMXPFRvMEEKjJEC2X99HFYOpzUxGDbeyuDA2pttsvgMtOdPLTzXWvYWJpr/H2ERV
	 9c8tqdXrk491x2gue6hiH5xtvj3qXXpR+A6ucTauSgN2iVF0vaDT6YaP5NjiFlXXlR
	 Hz274isiPlR91MYzhrjNCk5UgG9nVKojgPfRYAiY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24F47F8025A;
	Tue, 14 Dec 2021 03:09:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6254EF8050F; Tue, 14 Dec 2021 03:09:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E515EF8013C
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 03:09:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E515EF8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="AiyhwqZh"
Received: by mail-pf1-x434.google.com with SMTP id i12so16575253pfd.6
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 18:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NA63f95I7CMHHnhVrUkiId9dVNBdG82PEh/NR72qdp0=;
 b=AiyhwqZhDLyspcE2mQvS0LAkWsIyFGqp1E8HQuxyylHrChTb0R2Yc9TPtJ49FLYmWx
 AzTFxvPFL6DkNpMf9yVN8X5Ciicu+9ZE6QyspkQ+MwEXnWbjfNfVjDF5SR8ytEFzwlgC
 43qSPGiWY5+2t+9g+La82kYS6JZaSacc/dpz+bpzW9GJAPaeTQnmb7liXQEQZeQCS2Xs
 e8OeHG6TTeR3s+g+eQRpSl01kFSoDqnsNaQyB+mC5uGA6MHejjC/cOl1Pr8Rqld6XmWg
 Vwhn28rmvOMWOupDm9rCRYqwM1sKQoJ4dsEOKKRlGoCfSgCSR4oLIJR96Zlm4BNXyjAB
 20TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NA63f95I7CMHHnhVrUkiId9dVNBdG82PEh/NR72qdp0=;
 b=5VMVmmONqSgh19DfqR7P8n540a9l+A/Q4Cqkit/wurLikFuo5igsw0s7/sPaoBIqT6
 OV+4+cVB06j/Qno5IOujSNglByQsAuF4wyQEKbiSithG3iLkj/vCd6Hpyg5b15u8dqrw
 fj6lccWFLl+xsxHygNpGY1mc4sh3BpmoLkpWy4YWxyLafSGC+V3GjBdOGdiczC89JBRt
 71arLljihms2IjniJu1FwSPQYzUdXlodrz02zOnwRIPyd/FnSx1Y/Vbt7RrEiGpOo2k1
 SIN9I2SfU9R1VKF44oymDscHSxr7Qgaj+FQjGwhKQMYMtLoV/aeqQho7o4at+Nt3j20q
 8fRg==
X-Gm-Message-State: AOAM5328wni6KieuiJIOC/v+WeGS5QSHb5TKawT3iZeVKeIyCTXjwTYJ
 oLxrVrhrDdni3qnT4ZeYJbk=
X-Google-Smtp-Source: ABdhPJzqhgwVuJvXm9FGTv5AB3oO/6HsdHa8glrhYdpkv1O9U4UUFsMEVosfBz0eiGvBEiPeAidhPg==
X-Received: by 2002:a05:6a00:8cf:b0:4a8:3ae:1a78 with SMTP id
 s15-20020a056a0008cf00b004a803ae1a78mr1735617pfu.7.1639447765370; 
 Mon, 13 Dec 2021 18:09:25 -0800 (PST)
Received: from localhost.localdomain ([126.249.140.249])
 by smtp.gmail.com with ESMTPSA id b2sm14622296pfv.198.2021.12.13.18.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 18:09:25 -0800 (PST)
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 02/22] ASoC: codecs: es7241: Use dev_err_probe() helper
Date: Tue, 14 Dec 2021 11:08:23 +0900
Message-Id: <20211214020843.2225831-3-kuninori.morimoto.gx@renesas.com>
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
 sound/soc/codecs/es7241.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/sound/soc/codecs/es7241.c b/sound/soc/codecs/es7241.c
index 2344a0b03518..9f20bfb855b3 100644
--- a/sound/soc/codecs/es7241.c
+++ b/sound/soc/codecs/es7241.c
@@ -255,7 +255,6 @@ static int es7241_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct es7241_data *priv;
-	int err;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -271,28 +270,19 @@ static int es7241_probe(struct platform_device *pdev)
 	es7241_parse_fmt(dev, priv);
 
 	priv->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
-	if (IS_ERR(priv->reset)) {
-		err = PTR_ERR(priv->reset);
-		if (err != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get 'reset' gpio: %d", err);
-		return err;
-	}
+	if (IS_ERR(priv->reset))
+		return dev_err_probe(dev, PTR_ERR(priv->reset),
+				     "Failed to get 'reset' gpio");
 
 	priv->m0 = devm_gpiod_get_optional(dev, "m0", GPIOD_OUT_LOW);
-	if (IS_ERR(priv->m0)) {
-		err = PTR_ERR(priv->m0);
-		if (err != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get 'm0' gpio: %d", err);
-		return err;
-	}
+	if (IS_ERR(priv->m0))
+		return dev_err_probe(dev, PTR_ERR(priv->m0),
+				     "Failed to get 'm0' gpio");
 
 	priv->m1 = devm_gpiod_get_optional(dev, "m1", GPIOD_OUT_LOW);
-	if (IS_ERR(priv->m1)) {
-		err = PTR_ERR(priv->m1);
-		if (err != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get 'm1' gpio: %d", err);
-		return err;
-	}
+	if (IS_ERR(priv->m1))
+		return dev_err_probe(dev, PTR_ERR(priv->m1),
+				     "Failed to get 'm1' gpio");
 
 	return devm_snd_soc_register_component(&pdev->dev,
 				      &es7241_component_driver,
-- 
2.25.1

