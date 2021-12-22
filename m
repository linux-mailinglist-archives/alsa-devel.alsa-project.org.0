Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D18747D386
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Dec 2021 15:20:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFA93176B;
	Wed, 22 Dec 2021 15:20:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFA93176B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640182851;
	bh=slJUjsdML78x+OhS7JlbpojLz49K2SAgZauT90+J3eU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N4YEQVmH044z6rmpBB7wQU4kcjEuhEm7DMLc85vsRzk23kd8WBAGaihZHdihECgyD
	 DxZHOtMklnIskGNe/3wo3K2qLbow6EJ95LbTo02nEUeDdryHIxad1VR+Zpht1vyhIM
	 EXTD44Y+ZOet4cgqRj+t+bRNStLAWFpOe8iW4+ic=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B5A7F80124;
	Wed, 22 Dec 2021 15:19:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6AE1F80111; Wed, 22 Dec 2021 15:19:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5E0DF80105
 for <alsa-devel@alsa-project.org>; Wed, 22 Dec 2021 15:19:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5E0DF80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="m7uhfmjB"
Received: by mail-qt1-x836.google.com with SMTP id 8so2020541qtx.5
 for <alsa-devel@alsa-project.org>; Wed, 22 Dec 2021 06:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i5ZIY4065lAUAEWLLFizJmNYttH1lhQoJWZCwlRqXS4=;
 b=m7uhfmjBWlbMAdVXWg1ZmJoUM9qOot3symJR95YagQv3VORKtniNYS/m6YkvRwrlJ4
 /09rZpYcy9boxzXO/W11nRZAdfMTQrF6ei3G7DyeQzR85YzpWo1LDf/qj6U2egZWQPvM
 Effk9omq/ZTgqllaMy3SfZyvZVTzEXlbdV4jXqzd9rynHVkfY0OZ0jVA5/QQfT9IzTq7
 qXbiqQdczWqBkoPy2Mh+aGW8/zSaqrzGBu4bZhQHg3A9gCqvO34BXMAVHTq9U3j6xh5v
 0eKZ5yTidxsgTvti8SFgU0YGEhi48zfN3bYQvURoli7npEqb+HaZBhnH55FPVPLfRJYP
 KABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i5ZIY4065lAUAEWLLFizJmNYttH1lhQoJWZCwlRqXS4=;
 b=jUyWojvOcqIvWmgxci7f8C9RORjIwr+2yuEDpYopXigj/f9jYZbI7vhobZdgvWZmoO
 88i5FecX3J+2Yj+7GkoIAqZNIXP7Q9bwMmGjl6LVIvoBSFtLlOuDaGOr9vn9cCo857Z2
 EV3zcFytguxb2NF3tq2t318n3SYxH6+i886chtCPYEED1Q+Rbn55PYKiWIrWYcvZq5sC
 vdEGG0Fp80C3nXoGc+wwtlXUvdstQUYo4J7ZEAevaerSMfl1Wg9EXyzfX1qoGikY4Cz+
 rEohe+V4jKmw1FxczBr0LIGIif3ExqPsQ3OCsEfDod+L1ni4bwoV46zpNHRDtkP/XzxL
 wGTA==
X-Gm-Message-State: AOAM532+/LvHwSSRPsQO6SBLWIU6kNCnwkMdluCveZX6mMM9wLWQDoV4
 0E2uGPvXttZmQAmtm8II8SU=
X-Google-Smtp-Source: ABdhPJzjKcfRlZoMTt4B+KzFSxE9OtwiliOOTNLxH0Rdp3oRuakJFSZU+qTS9HD+iC53R8HDKBqSgQ==
X-Received: by 2002:ac8:7dcd:: with SMTP id c13mr2241175qte.133.1640182774512; 
 Wed, 22 Dec 2021 06:19:34 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:504a:4709:e1da:a7a:6d6e])
 by smtp.gmail.com with ESMTPSA id
 b9sm1803990qtb.53.2021.12.22.06.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 06:19:34 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Subject: [PATCH RESEND 2/2] ASoC: cs4265: Move reset_gpio to local scope
Date: Wed, 22 Dec 2021 11:19:20 -0300
Message-Id: <20211222141920.1482451-2-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211222141920.1482451-1-festevam@gmail.com>
References: <20211222141920.1482451-1-festevam@gmail.com>
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

There is no need to keep 'struct gpio_desc *reset_gpio' inside
the private structure becase reset_gpio is only used inside the
probe() function.

Move it to a local scope.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 sound/soc/codecs/cs4265.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/cs4265.c b/sound/soc/codecs/cs4265.c
index b89002189a2b..88d89366f816 100644
--- a/sound/soc/codecs/cs4265.c
+++ b/sound/soc/codecs/cs4265.c
@@ -29,7 +29,6 @@
 
 struct cs4265_private {
 	struct regmap *regmap;
-	struct gpio_desc *reset_gpio;
 	u8 format;
 	u32 sysclk;
 };
@@ -573,6 +572,7 @@ static int cs4265_i2c_probe(struct i2c_client *i2c_client,
 			     const struct i2c_device_id *id)
 {
 	struct cs4265_private *cs4265;
+	struct gpio_desc *reset_gpio;
 	int ret;
 	unsigned int devid = 0;
 	unsigned int reg;
@@ -589,14 +589,14 @@ static int cs4265_i2c_probe(struct i2c_client *i2c_client,
 		return ret;
 	}
 
-	cs4265->reset_gpio = devm_gpiod_get_optional(&i2c_client->dev,
-		"reset", GPIOD_OUT_LOW);
-	if (IS_ERR(cs4265->reset_gpio))
-		return PTR_ERR(cs4265->reset_gpio);
+	reset_gpio = devm_gpiod_get_optional(&i2c_client->dev, "reset",
+					      GPIOD_OUT_LOW);
+	if (IS_ERR(reset_gpio))
+		return PTR_ERR(reset_gpio);
 
-	if (cs4265->reset_gpio) {
+	if (reset_gpio) {
 		mdelay(1);
-		gpiod_set_value_cansleep(cs4265->reset_gpio, 1);
+		gpiod_set_value_cansleep(reset_gpio, 1);
 	}
 
 	i2c_set_clientdata(i2c_client, cs4265);
-- 
2.25.1

