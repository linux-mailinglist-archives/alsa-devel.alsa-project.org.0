Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 459EB4CFF8C
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 14:05:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D66291708;
	Mon,  7 Mar 2022 14:04:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D66291708
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646658335;
	bh=Yy7QdJboFpJU9eo6ttch16BlJ/maiVNqZTl4AP6xZ7c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=P3FIpBPiEfTujt9Rqrq+eWcIDzKuzUnTzV3NzfHyFNZNcbQC5yogM6n/M6x9wu3mx
	 ee+wYSDrBOIus0M7ZPtdKVfnVaKzdIJ43zXFWji3S+G5drCIgudUhRC6Nf1V+SPPaF
	 jZoIhMpbNT4+JMnuRXvWAi2eZJcz8PsYRniRGWo0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E18DF80159;
	Mon,  7 Mar 2022 14:04:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 202DDF800D1; Mon,  7 Mar 2022 14:04:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86296F800D1
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 14:04:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86296F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hNqgxl7R"
Received: by mail-pj1-x1031.google.com with SMTP id b8so13402281pjb.4
 for <alsa-devel@alsa-project.org>; Mon, 07 Mar 2022 05:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=JXzVQ2ZdweQIJEbxKcie2X+tclhUtVN1X52+YVLb9ho=;
 b=hNqgxl7RZ8Mz040Am5Mimahm0M96u9CqSIyWge99EgmYicdlsy6/4yXWTt1VRmYceo
 a4Qx+jCcdhcD4oOshOyNqiez1FjjwI5PR/N0MGQma0EtRXD/jxchdtQwxKc8Uyqff6/c
 1F+WlFB0HjdbdxqwPArIWmStkvMUZkgeGFd/MIsPiMbGjAXCPfWMmYihRs3P1/6b5RVv
 0DAtxY4e0C/FFcFDzaNu3mqIQSpe/GTuJVvJI7jyjjfYqe59p7Oc2JUpKxbP3HeOsaLf
 RW9cLtWOiUMqgj54p7Gp2ozGtg1sm3RlITsynlUdPdUfXQ+D8g9AlbHGjROY4NxISx2s
 Fwwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=JXzVQ2ZdweQIJEbxKcie2X+tclhUtVN1X52+YVLb9ho=;
 b=Y7x/kW99FaX6M+dixImlsAMl38mepLfUPwPIJkVAQ1XEmYGW5UaFUyu0BghzzUVWvj
 eqquRKpA0Yve01AgIwoCGl4z7tQrtV9E7CwbbvYS6Vu4a5z00HYdJHW6iQa4J+6eIt1s
 7gZoBKCn/BqC7GBmsqJoEljqVfqVPx77aPaqj0vfd7AYmR87J5rY5/9K9/5K+0q9RK3k
 DZP894h+70efhHlkUWnoF4IJKVoOtL7uo9A6rx7feLl4y8q0WF1X/TO29R2kkN55ufHE
 zC6rnE9NX8H+kKcMQQ4qMHtOoCRWH+SxKeKaN/KA/o/rvPifw1n3f8dgSA9vPBMJRJCW
 KS1Q==
X-Gm-Message-State: AOAM5329CA2fDWvKEa116Ut23kfhsqXG7SuRFcgnA4SPKvVw4XQXo7kr
 2unDQaicP2muEktdB3+11cg=
X-Google-Smtp-Source: ABdhPJxyQZKjSR7O+jwWjm2Gm0nSCiz028BLT0JG5cVW38JeaVoEIj4UC0qg9LQoFwz0NAFzxiPbHw==
X-Received: by 2002:a17:90a:1941:b0:1bf:3918:d49e with SMTP id
 1-20020a17090a194100b001bf3918d49emr12833754pjh.136.1646658261409; 
 Mon, 07 Mar 2022 05:04:21 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 y12-20020a62640c000000b004f104f0ee75sm15099513pfb.185.2022.03.07.05.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 05:04:21 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Florian Meier <florian.meier@koalo.de>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: atmel: Fix error handling in snd_proto_probe
Date: Mon,  7 Mar 2022 13:04:14 +0000
Message-Id: <20220307130415.5720-1-linmq006@gmail.com>
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

The device_node pointer is returned by of_parse_phandle()  with refcount
incremented. We should use of_node_put() on it when done.

This function only calls of_node_put() in the regular path.
And it will cause refcount leak in error paths.
Fix this by calling of_node_put() in error handling too.

Fixes: a45f8853a5f9 ("ASoC: Add driver for PROTO Audio CODEC (with a WM8731)")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 sound/soc/atmel/mikroe-proto.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/sound/soc/atmel/mikroe-proto.c b/sound/soc/atmel/mikroe-proto.c
index 627564c18c27..9ed634ee9dfc 100644
--- a/sound/soc/atmel/mikroe-proto.c
+++ b/sound/soc/atmel/mikroe-proto.c
@@ -115,7 +115,8 @@ static int snd_proto_probe(struct platform_device *pdev)
 	cpu_np = of_parse_phandle(np, "i2s-controller", 0);
 	if (!cpu_np) {
 		dev_err(&pdev->dev, "i2s-controller missing\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto put_codec_node;
 	}
 	dai->cpus->of_node = cpu_np;
 	dai->platforms->of_node = cpu_np;
@@ -125,7 +126,8 @@ static int snd_proto_probe(struct platform_device *pdev)
 						       &bitclkmaster, &framemaster);
 	if (bitclkmaster != framemaster) {
 		dev_err(&pdev->dev, "Must be the same bitclock and frame master\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto put_cpu_node;
 	}
 	if (bitclkmaster) {
 		if (codec_np == bitclkmaster)
@@ -136,18 +138,21 @@ static int snd_proto_probe(struct platform_device *pdev)
 		dai_fmt |= snd_soc_daifmt_parse_clock_provider_as_flag(np, NULL);
 	}
 
-	of_node_put(bitclkmaster);
-	of_node_put(framemaster);
-	dai->dai_fmt = dai_fmt;
 
-	of_node_put(codec_np);
-	of_node_put(cpu_np);
+	dai->dai_fmt = dai_fmt;
 
 	ret = snd_soc_register_card(&snd_proto);
 	if (ret)
 		dev_err_probe(&pdev->dev, ret,
 			"snd_soc_register_card() failed\n");
 
+
+put_cpu_node:
+	of_node_put(bitclkmaster);
+	of_node_put(framemaster);
+	of_node_put(cpu_np);
+put_codec_node:
+	of_node_put(codec_np);
 	return ret;
 }
 
-- 
2.17.1

