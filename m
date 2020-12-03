Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B6E2CCBC3
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Dec 2020 02:38:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CC7117F8;
	Thu,  3 Dec 2020 02:37:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CC7117F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606959520;
	bh=fOz39NK/tf9z8hcheUlRKIc+jNeuDfUb6ea2XkjDf+8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bBDeoKoyelhXzwrcGB5K6nQ2wx1m5ZqXOqvq8TEdIXKxXi88RJJWpOXnuCrVOjo38
	 7Ue5CUrDuj/KR+uG/tGvETNzqlEThaatLJ2tZRmjX6nEQv9+nwdquPIRoN1uVJ6wOu
	 9dWzOiCUPR5aXUdBOi+704jETUZ99kjoyoHV5tbI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69819F80158;
	Thu,  3 Dec 2020 02:37:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BC8BF8026B; Thu,  3 Dec 2020 02:37:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF4F9F80168
 for <alsa-devel@alsa-project.org>; Thu,  3 Dec 2020 02:36:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF4F9F80168
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="o32c4rmC"
Received: by mail-qv1-xf41.google.com with SMTP id 62so222253qva.11
 for <alsa-devel@alsa-project.org>; Wed, 02 Dec 2020 17:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=isbDjvFd6XyHdx+buQd+lmqXBjXq/tNyon4AA/qDhNE=;
 b=o32c4rmCcDl25wnxV7Yk9n062c+1GYZaPwPuOmIZHLm1fZNVzgfcX9GSyJCCzVdE+L
 HCh2qZmxrZIdqUBldJ2lc9tbxxd3/+gR6lAHLntnWr4XqACMNQhIAkCEu5am0lm08MJ6
 eYYicX5axPkNDZ0wI64MtNYo9VfTKLDX3PQUCaWcZTVzieea0wYDWsViftZ3l3RnARy8
 WNfX4afE4eg/k9SsnDlEERs2ClsXPdpREtkmpmgp+GDtzwY/p3DQrTcpKiNLGewgWf8+
 WbjZWadTHD+TS9NKQeFF/gH+4GHvZmCNegl56sUA70PZirM+rMaHRbq2jWU3frppokjv
 ei8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=isbDjvFd6XyHdx+buQd+lmqXBjXq/tNyon4AA/qDhNE=;
 b=uUnONF0y4m8qed1K5c1bhsVk/W0FQSZgVSihgN/4Q6mNWSjjF5AS2311Ik5XoVTNf/
 3TS0tiao33/hUmzEJM869Vc42TIWNOlyr5hKjkIYEUkx0FZbnnT9lIrJS0XdmPEwdTTE
 P5bCW9p7hUNwSxkFLZrjPq4BcNvGroq0KNx2cDWORT1JlEWvM8PZqe5LXYNM3sUOb7X2
 NwmJqnRr1P0bFTpGwE54nmBp+GPexXyY2XRxmpVludAoXYi40Vz4ViGldp17lweNwxTn
 p1l2gIuymsQ0wPhUFuRxmRRJfIhBkvwfpcjdudc3oo50/uF+5+wWCVdoJNR8gu3zFE5f
 frzg==
X-Gm-Message-State: AOAM5333GQ9WKSTawPYG/yB6f3AaRJtFwzJagJIJJVcKcP4zgUtgm4Gt
 jrqJ5hUruKVVeLhHaR7E/zk=
X-Google-Smtp-Source: ABdhPJwE9uq8LjpXZ1VJG0F0Cg+wZY1Vvo0UyireL0GS7D4TUTF9re0f9yzm9ibBJ5lKLIjb1z64Ig==
X-Received: by 2002:a0c:e583:: with SMTP id t3mr1134206qvm.42.1606959413606;
 Wed, 02 Dec 2020 17:36:53 -0800 (PST)
Received: from localhost.localdomain ([177.194.72.74])
 by smtp.gmail.com with ESMTPSA id b186sm519591qkc.111.2020.12.02.17.36.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 17:36:52 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Subject: [PATCH] ASoC: fsl_audmix: Remove unneeded data field
Date: Wed,  2 Dec 2020 22:34:39 -0300
Message-Id: <20201203013439.10617-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: nicoleotsuka@gmail.com, Fabio Estevam <festevam@gmail.com>,
 alsa-devel@alsa-project.org, shengjiu.wang@gmail.com, viorel.suman@nxp.com
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

The .data field is only used to pass the string name to
platform_device_register_data().

Pass the string name directly to make the code simpler.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 sound/soc/fsl/fsl_audmix.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
index 7ad5925772e8..8dc44dec7956 100644
--- a/sound/soc/fsl/fsl_audmix.c
+++ b/sound/soc/fsl/fsl_audmix.c
@@ -455,7 +455,6 @@ static const struct regmap_config fsl_audmix_regmap_config = {
 static const struct of_device_id fsl_audmix_ids[] = {
 	{
 		.compatible = "fsl,imx8qm-audmix",
-		.data = "imx-audmix",
 	},
 	{ /* sentinel */ }
 };
@@ -465,17 +464,9 @@ static int fsl_audmix_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct fsl_audmix *priv;
-	const char *mdrv;
-	const struct of_device_id *of_id;
 	void __iomem *regs;
 	int ret;
 
-	of_id = of_match_device(fsl_audmix_ids, dev);
-	if (!of_id || !of_id->data)
-		return -EINVAL;
-
-	mdrv = of_id->data;
-
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
@@ -510,10 +501,10 @@ static int fsl_audmix_probe(struct platform_device *pdev)
 		goto err_disable_pm;
 	}
 
-	priv->pdev = platform_device_register_data(dev, mdrv, 0, NULL, 0);
+	priv->pdev = platform_device_register_data(dev, "imx-audmix", 0, NULL, 0);
 	if (IS_ERR(priv->pdev)) {
 		ret = PTR_ERR(priv->pdev);
-		dev_err(dev, "failed to register platform %s: %d\n", mdrv, ret);
+		dev_err(dev, "failed to register platform: %d\n", ret);
 		goto err_disable_pm;
 	}
 
-- 
2.17.1

