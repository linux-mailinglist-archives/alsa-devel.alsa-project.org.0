Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE5A4CFF12
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 13:47:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F8D71705;
	Mon,  7 Mar 2022 13:46:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F8D71705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646657220;
	bh=P9lmF3UFe/zuxYf5tQlJ74tJXhXK5iN2dKxFjO8WxGI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aYj2oKGwisrWMYxDlC5TkMbLa85dP8pK2uabvO9QqwJJlcYtS3oiEcuj6J+lyQS8W
	 tX76d16HcFQg2UbOlf/nSV+++jqxajrJTPQAtaSOPE/yUGZeqDoenhMvuhzmuioIu5
	 AUaU0wGV3mL4CM7KRzK1Tz/RCZGlysySvgZ4J+N8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B88BF8020D;
	Mon,  7 Mar 2022 13:45:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEFA1F80159; Mon,  7 Mar 2022 13:45:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 224C3F800E9
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 13:45:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 224C3F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="cD+B9+Hi"
Received: by mail-pg1-x536.google.com with SMTP id 132so13466147pga.5
 for <alsa-devel@alsa-project.org>; Mon, 07 Mar 2022 04:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=TlcCWdEmJAkGERXKgqWQ74vqcWFDfJqoMfNr678xADM=;
 b=cD+B9+HipufW4e6RKtDe7ZfrvlpAfbZv+pAr7A9bMzN8MCLzhK7ZEQl7a0NeLPOu5v
 sCYD99HPTLEJpnZvMMnl/YnDK92oPTXa3+fZAEFP7lM4c6+YsAziiePstIKroJ+qu89m
 DdgbkK8wwUvZ9LpQIUO7X/s/GR39hJk6yVIr8Nf5merry6RZD31q9qYYNScncF3ysBi6
 3Ul0cWJD4QaxtEm9pe3lTDSR48dVW44mwUq/o/J5sqKj26lHcJlsoMcfkwyT5PckRn4J
 0MPeF+2EBAOzCAc4jL6QLGXMc/3lbEUp9XFs3nh2it1tBskNG1pkP9hOPojgDOYxpE7A
 xXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=TlcCWdEmJAkGERXKgqWQ74vqcWFDfJqoMfNr678xADM=;
 b=V+e38ilrU9yClv0m7XCJOOyaoQNFssC8BoxdXx/Ro1NVXPtO+Q7RO9HCk/fKtjsT2C
 s0Xwt0G97qTJ3yK9dDjyyJsxOoqm+yoRXfn/mlvHbVMsre4oa/h1RvLlM5gKR+S6k++4
 B13DrTEUpJ+jvgaBuV4nqZJpQ2UDBaCpRPIYvqq3WPElnvQ4yj0T87vJmLF196sVqZao
 AGT5BuxYCork9XKXY/Zn/cxopVAu0jVxQU/pzGC85gjvhRk+hRm5Q/dls+7dNlDYcWUn
 J3rG7eDAyQvsgV8G6OPuQCv6AeQ3q+vWmgdk8bMFbsE3oh2wrNitXkvNoOqc0AUwl2zd
 zelg==
X-Gm-Message-State: AOAM531OjqlrBQu78IYCkrBjmjZ6iCZZwsmfEmTdUGLFlZutgYKA52+m
 oMjZBoI2E6GGNx5cOPISiyE=
X-Google-Smtp-Source: ABdhPJzy1JniVTE0Xq7VuNwfKPIfVaxET2IZ7oF7c7FCET0xpvuAlZk491+K1c89c1SqMJ25A6Nnkg==
X-Received: by 2002:a63:7:0:b0:37f:fa5b:95f9 with SMTP id
 7-20020a630007000000b0037ffa5b95f9mr8901563pga.57.1646657145757; 
 Mon, 07 Mar 2022 04:45:45 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 b5-20020a056a0002c500b004f6dbd217c9sm8246431pft.108.2022.03.07.04.45.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 04:45:45 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Bo Shen <voice.shen@atmel.com>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: atmel: Add missing of_node_put() in
 at91sam9g20ek_audio_probe
Date: Mon,  7 Mar 2022 12:45:39 +0000
Message-Id: <20220307124539.1743-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linmq006@gmail.com
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

This node pointer is returned by of_parse_phandle() with refcount
incremented in this function.
Calling of_node_put() to avoid the refcount leak.

Fixes: 531f67e41dcd ("ASoC: at91sam9g20ek-wm8731: convert to dt support")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 sound/soc/atmel/sam9g20_wm8731.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/atmel/sam9g20_wm8731.c b/sound/soc/atmel/sam9g20_wm8731.c
index 915da92e1ec8..33e43013ff77 100644
--- a/sound/soc/atmel/sam9g20_wm8731.c
+++ b/sound/soc/atmel/sam9g20_wm8731.c
@@ -214,6 +214,7 @@ static int at91sam9g20ek_audio_probe(struct platform_device *pdev)
 	cpu_np = of_parse_phandle(np, "atmel,ssc-controller", 0);
 	if (!cpu_np) {
 		dev_err(&pdev->dev, "dai and pcm info missing\n");
+		of_node_put(codec_np);
 		return -EINVAL;
 	}
 	at91sam9g20ek_dai.cpus->of_node = cpu_np;
-- 
2.17.1

