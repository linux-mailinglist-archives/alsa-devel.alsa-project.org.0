Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1D6481233
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Dec 2021 12:47:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 892461767;
	Wed, 29 Dec 2021 12:46:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 892461767
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640778446;
	bh=D+VOmzJw+4IVUx2BVHJKl/iLlia+5SOU7L7MbTspZ9Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jIDOOiMXuVciREymFiOALYSTteKfa+3ITaWpI+4HMTD2dXq6b3NoMCDzpuuv1DHps
	 yF/eX0szoIPBOxEcTIH21Dd3Frwd9hAri2CzYLkRDFKtOmfB21nWnOSG9WUL/M9GMC
	 nstnZ/LGZ9ZbEE38JTMfddnw3zI87nLNOUS3fhEM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D70DCF80279;
	Wed, 29 Dec 2021 12:45:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E22EF80248; Wed, 29 Dec 2021 12:45:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4263FF801EC
 for <alsa-devel@alsa-project.org>; Wed, 29 Dec 2021 12:45:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4263FF801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gChk0OqJ"
Received: by mail-qv1-xf32.google.com with SMTP id kc16so19005499qvb.3
 for <alsa-devel@alsa-project.org>; Wed, 29 Dec 2021 03:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AJA9uCUXVXnOgOewB0X1cMRPQwNxuz9DMojdOZD+C78=;
 b=gChk0OqJwq3L9/j24PqGARaC67qJebktVLVMRBr2cRMQybPJKmsJFvyV1XlylrPZCm
 xaPPZdOYultZkAqpuaIBGQe44K4uesrpxACYkOVxh4k42393XenSV4vlYemLReC4VeUm
 vWM6kCPOLh7Q59Tgc0iM+Thro+LWAQnQxVyWk+ts5YlEEGuOollm3EH7X0rPIFgYLn8l
 gtW+HAkDco9P6xoK/kOYckSjJRU4nmO07G5cWxaGlzyzIiyoWSs+f8eEzAkjw+CwchYi
 XxECi81i7fcnTZ9T6WJTsQE2G4rla1oBmS6a0nWvOAg+4jPDPuNNYkMwHnWBuVtyxykB
 WHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AJA9uCUXVXnOgOewB0X1cMRPQwNxuz9DMojdOZD+C78=;
 b=6tGQVXHpRdeFhlLwuRV95tI4vFkNRmMw83cl1oLu0Cj35wm0cP2qEv7RdtgzB8yGvW
 1wH91gi9yBh0NLwrhapS9F3KHC3pp0V1U4z6RCde8wzLERn0cb7OvDGbdXWmXqWQC6R5
 cQqrW9lInr4anpSTZ0QT7iISTy73e1fHbhIaeeRa7bNx187JW8wOv02CyskvuvEn11QA
 yHbtr2IXrNk6wpYNKa/Hs/MVW9Llt9Ln+MW16p7p5KnmGRYfAmu5cKGm54gUvBkW3woG
 OQgAe8/mtd7lE9hTvcpHQgur2d+4Bdf2gfaKAD40qyp1gkZ56S6H6Ec3sJFdAQ5Zs0oF
 fC8Q==
X-Gm-Message-State: AOAM532v4WM5nramfeM8fKiofegHdZGJt4C/7REHdJpJ2ChXK7I8dzQ1
 P7qxgRITLLmwPxsdxN5gFkQ=
X-Google-Smtp-Source: ABdhPJwraN8OZtkPAMF0oXH3c22r01052ORrXFqcdRZtkvwUfmP+WGCsP9FGUGxMTtyUfPWLGS2I9A==
X-Received: by 2002:a05:6214:76a:: with SMTP id
 f10mr23178921qvz.8.1640778332253; 
 Wed, 29 Dec 2021 03:45:32 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:504a:4bbe:5997:2c6c:1a08])
 by smtp.gmail.com with ESMTPSA id
 g14sm18085936qko.55.2021.12.29.03.45.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 03:45:31 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Subject: [PATCH v2 3/3] ASoC: cs4265: Add a remove() function
Date: Wed, 29 Dec 2021 08:44:57 -0300
Message-Id: <20211229114457.4101989-3-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211229114457.4101989-1-festevam@gmail.com>
References: <20211229114457.4101989-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Fabio Estevam <festevam@denx.de>,
 ckeepax@opensource.cirrus.com, Paul.Handrigan@cirrus.com,
 james.schulman@cirrus.com
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
Changes since v1:
- Newly introduced patch.

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
+		gpiod_set_value_cansleep(cs4265->reset_gpio, 1);
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

