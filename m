Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D989A609403
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Oct 2022 16:37:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78CB889D2;
	Sun, 23 Oct 2022 16:36:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78CB889D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666535830;
	bh=UjmgI9+q/8WIGaKASFpwVsOOOS8ERBdZMKv8fLzyang=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T+L0JLZwfVgOebWekY0xTxKkLvlgagHfgOpxWTCaaFl7J/hHSz5zlpeOPsPWxUTen
	 gXfbLacsBnbkoeMpx4qDC/lHwNHK0h6/PcD/vK6x2WDo1yT6SEjFqO+lzUecXzK3zF
	 kecIoDi320LbjBeafifGBptHkqffEvW1/JwXLI78=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49BFBF8058C;
	Sun, 23 Oct 2022 16:33:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98C34F80567; Sun, 23 Oct 2022 16:33:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1565DF80515
 for <alsa-devel@alsa-project.org>; Sun, 23 Oct 2022 16:33:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1565DF80515
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MiAv+zhV"
Received: by mail-wm1-x32a.google.com with SMTP id
 e20-20020a05600c449400b003cce0107a6fso822364wmo.0
 for <alsa-devel@alsa-project.org>; Sun, 23 Oct 2022 07:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pvKXzpxFzZWAwh4ulfZ9nH6QQVrhwgz8YLgYLKE7oQk=;
 b=MiAv+zhVnlxmLdsRupQuYxZ+FUIDw9Fj/el8pUwCqfG4qpwFptaKXOgIZ3I2VqjkjZ
 biPuyIRR20VekRI4LcN+B89C4XYiGOmLicys+PnEUSFspnnqkDUJiK5yW8GhA1GPe0SV
 xkQsFftWaV3+6oOAvUIqUqJLlinN2RypA76M9QbkIo/regxEFAyvc35MIatgg0kR8tLf
 PxNpcjmFvCbtn1avOhGUn3eam5WA9Yf3TlUdKoLQXIxkrBUZoJBnqQKCJoQ1bO/8b6N8
 JgiWjxgbJ5kvOxcHUUUDO7ul8vG87dAiK7hptPQe1rovWUJBRHa8iXzcyCGhdkfMps26
 j9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pvKXzpxFzZWAwh4ulfZ9nH6QQVrhwgz8YLgYLKE7oQk=;
 b=5BR7B2zRyn2K7BkyLAE1jE4YwHoVNsVosGEdr4HqERaA9g0bH83UJLzs+wIsG4QWOZ
 2rKzr3bx+9fTzYGboNvCzPIboehMGn+6SDKEEPzqYEoR+HmXPQVKRdZ3yCoTZHYACig4
 iTJOi3N9dYWtAF8Iel4sRyIfXdRcJWtIAxf3AANx+D2KCcq29idI+TYdQdcDIBL2Q+J3
 3F1qqbJTFll2NWXns6MgZBiZ1XOC+DQdVXlyllq/0zeFIVPDUW+twU6h2WKqxVcU9CoG
 6tMVZiZ+19oP7Drx75YgNIKDQxEJjbGYjHnwJOrCSqn6BoFTaZ6nOC0C54qsYNNxA6vX
 JH1g==
X-Gm-Message-State: ACrzQf1LDe5Pm7cwFPBK4Ai9TP9WfBdw4nMHiPRK3EJe3gLOmSkc/uCw
 NJb9S1FM/WQnZACfECCcTQM=
X-Google-Smtp-Source: AMsMyM4Jr8bpSn4dBiYu8xvawkAvOdkOXBkSzIVXVHX5h6ly2AgTR60eJ8BpaVu5+s3ByLfKeFZqXg==
X-Received: by 2002:a05:600c:358f:b0:3c6:da94:66f9 with SMTP id
 p15-20020a05600c358f00b003c6da9466f9mr18888398wmq.142.1666535620335; 
 Sun, 23 Oct 2022 07:33:40 -0700 (PDT)
Received: from localhost (94.197.10.75.threembb.co.uk. [94.197.10.75])
 by smtp.gmail.com with ESMTPSA id
 l24-20020a1c7918000000b003b50428cf66sm8463974wme.33.2022.10.23.07.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 07:33:39 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: paul@crapouillou.net, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com
Subject: [PATCH v6 7/9] ASoC: jz4740-i2s: Support continuous sample rate
Date: Sun, 23 Oct 2022 15:33:26 +0100
Message-Id: <20221023143328.160866-8-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20221023143328.160866-1-aidanmacdonald.0x0@gmail.com>
References: <20221023143328.160866-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 zhouyu@wanyeetech.com, linux-mips@vger.kernel.org
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

The I2S controller on JZ47xx SoCs doesn't impose restrictions on
sample rate and the driver doesn't make any assumptions about it,
so the DAI should advertise a continuous sample rate range.

Acked-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 sound/soc/jz4740/jz4740-i2s.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/jz4740/jz4740-i2s.c b/sound/soc/jz4740/jz4740-i2s.c
index fd35a8a51f60..201368f828ff 100644
--- a/sound/soc/jz4740/jz4740-i2s.c
+++ b/sound/soc/jz4740/jz4740-i2s.c
@@ -390,13 +390,13 @@ static struct snd_soc_dai_driver jz4740_i2s_dai = {
 	.playback = {
 		.channels_min = 1,
 		.channels_max = 2,
-		.rates = SNDRV_PCM_RATE_8000_48000,
+		.rates = SNDRV_PCM_RATE_CONTINUOUS,
 		.formats = JZ4740_I2S_FMTS,
 	},
 	.capture = {
 		.channels_min = 2,
 		.channels_max = 2,
-		.rates = SNDRV_PCM_RATE_8000_48000,
+		.rates = SNDRV_PCM_RATE_CONTINUOUS,
 		.formats = JZ4740_I2S_FMTS,
 	},
 	.symmetric_rate = 1,
@@ -426,13 +426,13 @@ static struct snd_soc_dai_driver jz4770_i2s_dai = {
 	.playback = {
 		.channels_min = 1,
 		.channels_max = 2,
-		.rates = SNDRV_PCM_RATE_8000_48000,
+		.rates = SNDRV_PCM_RATE_CONTINUOUS,
 		.formats = JZ4740_I2S_FMTS,
 	},
 	.capture = {
 		.channels_min = 2,
 		.channels_max = 2,
-		.rates = SNDRV_PCM_RATE_8000_48000,
+		.rates = SNDRV_PCM_RATE_CONTINUOUS,
 		.formats = JZ4740_I2S_FMTS,
 	},
 	.ops = &jz4740_i2s_dai_ops,
-- 
2.38.1

