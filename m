Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B760B473A9C
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 03:12:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 443D21AA1;
	Tue, 14 Dec 2021 03:11:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 443D21AA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639447955;
	bh=XLIZ4DusYl8K2khBezaMQicq/+6o90bAopuSI+yGXh4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GfkBOEuRsx6d/Mwf06G2IPnLk703UhwgLyBRS5yQeun5c94asOD9MxKu9tUtaSePl
	 u82ry1vjZXXd8s2kdK5nzVDxVGycXAlu5vvhN3ADo9MwpAiImYvzYQNlUS6uuXVeft
	 uKn3o5+KtovpC2Q8JK53+iPlbrzl3gxGLT4++4i4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEC80F80533;
	Tue, 14 Dec 2021 03:09:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68DFCF80524; Tue, 14 Dec 2021 03:09:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF3BBF80249
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 03:09:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF3BBF80249
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HZNftTbv"
Received: by mail-pf1-x435.google.com with SMTP id o4so16533327pfp.13
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 18:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mQaC6K9YndJEdnlkbOMVQ6sAJ1uOqahAPasZDGVESNA=;
 b=HZNftTbvru3kRrNn68i5AFu//Kr3Sa+GB0dEwJd2eAQCB4qF6+FIs2IF8/RWQCuIDn
 kbRI+dKGll4zta6oYZUoX1HwTO0+XNZXRYx3KqMHR2TFCtoEkJhRJkViS0I2AVyIPqOj
 fHwmvB4FYp8wsowyXiDY8vncqadS5wwVLJ3dQC5hq4Cc5VJ7Xfj4isRA2QDq9osxBzXP
 msw2tBU5c1/szVlmX+Jl5KU4qmofbJtA1HGvwf+pvXNOXIgklO3DoPgFLCGsGZS7yBLi
 VbUfsKGUd9RJ2o5hDKtLPPewWvZlwdDif63G48MEnfYpLu7/OpNMzomCdUVAEfqxwqJt
 thBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mQaC6K9YndJEdnlkbOMVQ6sAJ1uOqahAPasZDGVESNA=;
 b=j0tB35imp11mSC0VjCwU+TewmarvdCnBp28zkhfkOf85iI67i3Wqrn0RYbfYNgAyNF
 vAuDIvcRJaOvPVfhXwaNMqEjOGJbbuM1KAYCohxCmlMoqEqyNRz5Z2SG8drhNAAi6QPl
 14zKd5zEUrbfpPe6MgeWG51tYUmqMmd4lDI9ZfeWKLvJkAXlbWy+GzBGXQE1WQF605jd
 S3GYwJxKPJtzdQJBe8BWn3uaO94fDywUpnhIMzzYXBS5jyOPMTGv7DV821D1ylmaX8+S
 EXni8XaJyah7WXnqPef15JMHdSqSsin1j8qeMwxRu/lYJndlcJy3PK0YkPDnlgEqrghh
 6EpA==
X-Gm-Message-State: AOAM530UBBlN6Snjgb1gXQ1gMfo59Q3iDrSQjue1bXx/lLHToEIPdyPY
 ucTa8KB0ytQYWz7Y4AZFGMC6OlHuDZM=
X-Google-Smtp-Source: ABdhPJybou3wRK2ZIewGa+Jb1EoPIeRt17B1Ae4iJ2uAahWZ8j/p2LUU5ZwIzG/+/Vd8WbjhKS9YQg==
X-Received: by 2002:a05:6a00:2391:b0:4a2:cb64:2e01 with SMTP id
 f17-20020a056a00239100b004a2cb642e01mr1644502pfc.45.1639447775461; 
 Mon, 13 Dec 2021 18:09:35 -0800 (PST)
Received: from localhost.localdomain ([126.249.140.249])
 by smtp.gmail.com with ESMTPSA id b2sm14622296pfv.198.2021.12.13.18.09.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 18:09:35 -0800 (PST)
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 09/22] ASoC: codecs: ssm2305: Use dev_err_probe() helper
Date: Tue, 14 Dec 2021 11:08:30 +0900
Message-Id: <20211214020843.2225831-10-kuninori.morimoto.gx@renesas.com>
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
 sound/soc/codecs/ssm2305.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/ssm2305.c b/sound/soc/codecs/ssm2305.c
index 2968959c4b75..1d022643c307 100644
--- a/sound/soc/codecs/ssm2305.c
+++ b/sound/soc/codecs/ssm2305.c
@@ -57,7 +57,6 @@ static int ssm2305_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct ssm2305 *priv;
-	int err;
 
 	/* Allocate the private data */
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -69,13 +68,9 @@ static int ssm2305_probe(struct platform_device *pdev)
 	/* Get shutdown gpio */
 	priv->gpiod_shutdown = devm_gpiod_get(dev, "shutdown",
 					      GPIOD_OUT_LOW);
-	if (IS_ERR(priv->gpiod_shutdown)) {
-		err = PTR_ERR(priv->gpiod_shutdown);
-		if (err != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get 'shutdown' gpio: %d\n",
-				err);
-		return err;
-	}
+	if (IS_ERR(priv->gpiod_shutdown))
+		return dev_err_probe(dev, PTR_ERR(priv->gpiod_shutdown),
+				     "Failed to get 'shutdown' gpio\n");
 
 	return devm_snd_soc_register_component(dev, &ssm2305_component_driver,
 					       NULL, 0);
-- 
2.25.1

