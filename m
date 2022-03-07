Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4877C4CFFD8
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 14:20:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C47BA1726;
	Mon,  7 Mar 2022 14:19:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C47BA1726
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646659249;
	bh=KHY+EVClAbi7gRTeYUFoBGeIRPLXEWyu2o+HVlpVxhI=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oSpG1e+j47sP7W5pTsHGRzJkVKVBku0pVcmGuI+lAZYmd9kE0qy17O6HJchPlBESq
	 H1JNHyI4oAe8jbTD5TAhCl//7+NLDhJZZCMCWI5SZUapUplAFYs2+DyJM/Qu94HRcv
	 a/Qsk6WC1EtcRXXSQYv88GEht1562TaikDuwCV1M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32F2AF80159;
	Mon,  7 Mar 2022 14:19:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DB54F80132; Mon,  7 Mar 2022 14:19:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1A58F800D1
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 14:19:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1A58F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="aFXQLGZN"
Received: by mail-pf1-x42c.google.com with SMTP id a5so2166702pfv.2
 for <alsa-devel@alsa-project.org>; Mon, 07 Mar 2022 05:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id;
 bh=8UIXOdI0t1TiJ+FRLj3UKI2HFoPWogUwUu2GB97fws0=;
 b=aFXQLGZNm6HlTM+8vb5jBpBwR6GcUgZ+vJeu6kLxjsPs4qpHX63yj5GjD7LIv+R0qG
 uW0/fL50y3txM8TmbA+ZeFDXGIwErtwvN+cksdP91/UNNNL8nnfMlNWMM+xMKJot988o
 FCNj/CFn2yPPNnTAmUEmNjayZTw8UHpvKiLp9kqXlLOwmJBU1aIqd3sXdxKGPLu56/85
 XZMh0ztdYKajUKKqNMaUCjrqzpZ5Jd7hH5ZrmkrDm6eMZxAciarclpNiwIiMPuA/a4C+
 m01AWr7JiT9EH/Lu/XqMPX6IH6dVMj6+VCCWXrUhuXDnD0HZ0VdfgxDJdNAJ74Caj/Gc
 ZZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=8UIXOdI0t1TiJ+FRLj3UKI2HFoPWogUwUu2GB97fws0=;
 b=m9fNt6AqOhp+YYhVFCOQY/HrUE2HaCI1Ys5s1POYTKVWiF0WU1iSj2et42Q6mVpPBO
 CEhbHlMpFsbXmGAjTKmlE9ylz7a/PdLvI1EIRJHa/k8oICFiIn8j3I9KEApayYAw/iEe
 q7VImE+mbb2kN/TAFZoOhMgaLfKrPG8CpwwN5SycxbfX/2fU9AfCAKxNomisoTAOV0dc
 iKwWHU4SB62X2P6uCwW0bdqpvjs2tKVXOh9rt86UnZdn1iASkm+9Ou3mca3PaNnyhPFo
 2Ou6riaD9DubcI1nt5gltcvH+szxQwe4JIayfuadftATAtJEt7fGpUtGsFAGGbnz9cRl
 s7sw==
X-Gm-Message-State: AOAM533MCf2xhZaEWKXCc6MjAOsq+QmMtZzQWfBOW5rnYrYDtqaJetDp
 m4O3eOxHQAB+n71tXXrgggI=
X-Google-Smtp-Source: ABdhPJw2cXIDr0JRcIC/XnOnRqQeuQAShi8lvv7wag+5HYdHbVOXvTbaf3SR8QpJ/e9XmNztZflyDw==
X-Received: by 2002:a62:8f83:0:b0:4f1:68e4:c561 with SMTP id
 n125-20020a628f83000000b004f168e4c561mr12760779pfd.67.1646659175160; 
 Mon, 07 Mar 2022 05:19:35 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 m8-20020a17090a158800b001bf2cec0377sm11040696pja.3.2022.03.07.05.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 05:19:34 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Miaoqian Lin <linmq006@gmail.com>, Shunli Wang <shunli.wang@mediatek.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: mediatek: Fix error handling in
 mt8183_da7219_max98357_dev_probe
Date: Mon,  7 Mar 2022 13:19:21 +0000
Message-Id: <20220307131924.9905-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
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

The device_node pointer is returned by of_parse_phandle()  with refcount
incremented. We should use of_node_put() on it when done.

This function only calls of_node_put() in the regular path.
And it will cause refcount leak in error paths.
Fix this by calling of_node_put() in error handling too.

Fixes: ebbddc75bbe8 ("ASoC: Mediatek: MT8183: Add machine driver with DA7219")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 .../mediatek/mt8183/mt8183-da7219-max98357.c  | 23 +++++++++++++------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index 718505c75418..f090dee0c7a4 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -695,8 +695,11 @@ static int mt8183_da7219_max98357_dev_probe(struct platform_device *pdev)
 	}
 
 	card = (struct snd_soc_card *)of_device_get_match_data(&pdev->dev);
-	if (!card)
-		return -EINVAL;
+	if (!card) {
+		ret = -EINVAL;
+		goto put_platform_node;
+	}
+
 	card->dev = &pdev->dev;
 
 	hdmi_codec = of_parse_phandle(pdev->dev.of_node,
@@ -761,12 +764,15 @@ static int mt8183_da7219_max98357_dev_probe(struct platform_device *pdev)
 	if (!mt8183_da7219_max98357_headset_dev.dlc.of_node) {
 		dev_err(&pdev->dev,
 			"Property 'mediatek,headset-codec' missing/invalid\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto put_hdmi_codec;
 	}
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
+	if (!priv) {
+		ret = -ENOMEM;
+		goto put_hdmi_codec;
+	}
 
 	snd_soc_card_set_drvdata(card, priv);
 
@@ -775,13 +781,16 @@ static int mt8183_da7219_max98357_dev_probe(struct platform_device *pdev)
 		ret = PTR_ERR(pinctrl);
 		dev_err(&pdev->dev, "%s failed to select default state %d\n",
 			__func__, ret);
-		return ret;
+		goto put_hdmi_codec;
 	}
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 
-	of_node_put(platform_node);
+
+put_hdmi_codec:
 	of_node_put(hdmi_codec);
+put_platform_node:
+	of_node_put(platform_node);
 	return ret;
 }
 
-- 
2.17.1

