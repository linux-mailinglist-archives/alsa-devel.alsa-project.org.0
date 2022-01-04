Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F540484776
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jan 2022 19:07:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 130C717EB;
	Tue,  4 Jan 2022 19:06:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 130C717EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641319660;
	bh=s2gluDklecgeDNZwH1I48Vq4fyy+eaENvF1abMr+ac0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bJ6oToOui3pSubj1DJzzcvo8cLdQS/37cZ3su7XMoNHUbPTNYER74RXwl7/m3CBGu
	 Kx+VC6+KSSV0EEv/xWqnUccKt7+5mL//qyVyT+hHfxbr1X2a4u5ahEMKDFxXUGn5DZ
	 xGqgU7apH0M42hKcT3h8uvCfNwtGeg1kqPNVOJi8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C6A8F8032B;
	Tue,  4 Jan 2022 19:06:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B552AF80310; Tue,  4 Jan 2022 19:06:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com
 [IPv6:2607:f8b0:4864:20::92a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABB0AF800FF
 for <alsa-devel@alsa-project.org>; Tue,  4 Jan 2022 19:06:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABB0AF800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WBrBbU46"
Received: by mail-ua1-x92a.google.com with SMTP id az37so43737834uab.12
 for <alsa-devel@alsa-project.org>; Tue, 04 Jan 2022 10:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bcUNR4StbkbR9El5Yx0jG1mh/r4XOjc7rnmdFz7pPmw=;
 b=WBrBbU46Z6hii0QrZXbscwE0mvZ61vk6kbsuaZXihL2RBKVdd6JiYnLL0zkujdhErt
 dS9MrlHsH6zphHiWkgx2mbALuW4VbsI9j/ElEW+DJMekjXOc+tQ8adzcCiLHaY+zUFYz
 EeiL2TCgchZfUN8uSMCHkuA23M2vmyB2JdQQzwZFBWYpkT1wpm7FXESqElwAU03wah9k
 AZT5joNSeMS9zC5iJSvHNammONavu9QnjJWpQID292WTjFizD1x8Z8BSfATBLIHwYk1B
 cTKtu2Bcf/WNvfV7ja3A1kKieZUmNux1rTyvyudZtFpTOp0SVuD/7HGbUkryjfUbSkjg
 5BQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bcUNR4StbkbR9El5Yx0jG1mh/r4XOjc7rnmdFz7pPmw=;
 b=nIzWFldF/9st15Eo9I9RLU0jLYX3/IxOAPUn/EeTuRsVEk0W6An4p/pDPW3XbSmZ7n
 Ib/sH1Z5Y9+hWGGSABjlJ2oIE6D/WGk1Hmxfm/oGQJMQu2r87lAyWXPzU5awkURrEZnQ
 52e/0neMVJfDkW7t6e96UqimuyRJk2rTB3FaEc5guNCHIkCFlo+ianLTMatJh4prD0e3
 44Sahi9gre8UIz+Kfff5flUJU6eVTWOOYxQTs8T/HPlLcjhd9X6iG5T/oF+qHz4gDCkx
 EPBD+RLt0+9KrJpndTwaFVwXTdIth8dIFuTCTDzbSgY/bFn1u6eLF9zjP1DKYGvCLZhs
 XANQ==
X-Gm-Message-State: AOAM533y5JiL7MNeXGfDD4f2DM7EhmqBanbqVtoDbE8a8BPG0YpvHiXI
 PjUScc5JhvvfrDbpirv/J2Q=
X-Google-Smtp-Source: ABdhPJweQQ+HWt6U8W38cVLk8GZmWh/0TkfIi7SMYln+dHFgmfPcOjtT6wgkWQtM2PaHXvqRDuQQoA==
X-Received: by 2002:ab0:24d1:: with SMTP id k17mr14860861uan.32.1641319581536; 
 Tue, 04 Jan 2022 10:06:21 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:504a:ffc6:8cd3:a2dd:67a9])
 by smtp.gmail.com with ESMTPSA id
 w138sm4949043vkd.46.2022.01.04.10.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 10:06:20 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Subject: [PATCH v3] ASoC: cs4265: Add a remove() function
Date: Tue,  4 Jan 2022 15:06:13 -0300
Message-Id: <20220104180613.639317-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Fabio Estevam <festevam@denx.de>,
 ckeepax@opensource.cirrus.com
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

From: Fabio Estevam <festevam@denx.de>

When the reset_gpio GPIO is used, it is better to put the codec
back into reset state when the driver unbinds.

Add a remove() function to accomplish that.

Suggested-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v2:
- Keep using the current polarity logic.

 sound/soc/codecs/cs4265.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/codecs/cs4265.c b/sound/soc/codecs/cs4265.c
index 294fa7ac16cb..8fa166e4b2a9 100644
--- a/sound/soc/codecs/cs4265.c
+++ b/sound/soc/codecs/cs4265.c
@@ -626,6 +626,16 @@ static int cs4265_i2c_probe(struct i2c_client *i2c_client,
 			ARRAY_SIZE(cs4265_dai));
 }
 
+static int cs4265_i2c_remove(struct i2c_client *i2c)
+{
+	struct cs4265_private *cs4265 = i2c_get_clientdata(i2c);
+
+	if (cs4265->reset_gpio)
+		gpiod_set_value_cansleep(cs4265->reset_gpio, 0);
+
+	return 0;
+}
+
 static const struct of_device_id cs4265_of_match[] = {
 	{ .compatible = "cirrus,cs4265", },
 	{ }
@@ -645,6 +655,7 @@ static struct i2c_driver cs4265_i2c_driver = {
 	},
 	.id_table = cs4265_id,
 	.probe =    cs4265_i2c_probe,
+	.remove =   cs4265_i2c_remove,
 };
 
 module_i2c_driver(cs4265_i2c_driver);
-- 
2.25.1

