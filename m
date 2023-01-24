Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CCAC9679EFF
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Jan 2023 17:41:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5767EE7E;
	Tue, 24 Jan 2023 17:40:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5767EE7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674578491;
	bh=Ef+leKFUpWhoSL/QkW49J0dK+6kRHx0CfkIzgr5Xta8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Ud75iMgekmu6nFlEqzDssvQN7fAaolwRfcUwKz4oTEbuMG1H7Fg1Q4nzxeehzCs9s
	 agmjqD6eFTiHNymFHFinGnpaN1f2UiBg1V6c23iKSp9tc/MRnRMOHIbnCnflqk9gqD
	 Nq5reNIf/sqX4DoSas7vi/341IALQDTk1SeRQbAc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1031F80515;
	Tue, 24 Jan 2023 17:40:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3BD5AF80515; Tue, 24 Jan 2023 17:40:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CEF88F8025D
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 17:40:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEF88F8025D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Hekbhkge
Received: by mail-wm1-x332.google.com with SMTP id
 o17-20020a05600c511100b003db021ef437so11387454wms.4
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 08:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L9X8Ucbf6sRwlUnn/8vBIIf3X5AUVXDo3mvuuIk6r0o=;
 b=Hekbhkge6JdDOnAucugsOX9pzI/aFw6Jo38Suz1gg8qj9+FE2PR8rStCUCJBvAWUo/
 ft4B5epJsuIvQb/TKOnQQfFyq3GSMZNRpdOLVHVaE+6PXkaq+0ObMSxzu4itvLQvSqtJ
 wyjqfUBWkRcVBJXxaJKx0nmrxaM2+Fs47JyLR3iw8HQY6NFk6hqhfEfq79ro/WR9SA4p
 +QLechW8H7DNl/1JmDDIIVNYWb9m1/MSXYpN609QygZPcMB306OTkICxzSFICCeSpd5a
 xcnA0h4UEKOpwSKLYwk8HVWmZOZNKb4hT+LynuHabx+9a6N6VxWIZmCoRHm1kmCW9yzS
 Jy8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L9X8Ucbf6sRwlUnn/8vBIIf3X5AUVXDo3mvuuIk6r0o=;
 b=6d4apX00RNNmP1pD29G5kc5bSih6IqnnVavaHjpAJUxCJ2mFQHJHLwNkmNzRLy1NOQ
 5f1tQBqLe181ePoabbojopHVWW7IrYxdb4YS9iBsPQInWcEOrZbNDfbq/awMWP9XX5B8
 s413kJ6tWzCIXrsXEYwVR1IajEbZEmSqSatQ7+2ram2yvmVtIzdY8S3RSWrZJ5eHLnRl
 ecQU81ODbHnY9Qqg59shDEzVa7jJsimYsVElQFjFYX6uzUdf9ZYt2guUTVgbm04CjYkw
 q9SlM4GUg1HZD/POKQW75TDn7bnMvDi3LXzEaD8WoWMmZxCD5LdBsUU3bMVIFFpugghk
 hkKg==
X-Gm-Message-State: AFqh2kqWHsLo9bkwBzfGXailjLmTQ9dkpJh+uNGaA502PlJrlC3wruKA
 yR736h/4+kpJkB2033bgx17g0w==
X-Google-Smtp-Source: AMrXdXt3sM9Ukk5z/BxKYw61KeZj4A9AedI7C5vzHWTUGQt3/b6pDwSGVspfWegeP6N9bzaP07qt3A==
X-Received: by 2002:a05:600c:3582:b0:3d3:5c21:dd94 with SMTP id
 p2-20020a05600c358200b003d35c21dd94mr25595559wmq.9.1674578399087; 
 Tue, 24 Jan 2023 08:39:59 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144]) by smtp.gmail.com with ESMTPSA id
 h20-20020a1ccc14000000b003dafbd859a6sm13477147wmb.43.2023.01.24.08.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 08:39:58 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] ASoC: codecs: wsa88xx: remove unneeded includes
Date: Tue, 24 Jan 2023 17:39:53 +0100
Message-Id: <20230124163953.345949-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124163953.345949-1-krzysztof.kozlowski@linaro.org>
References: <20230124163953.345949-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Remove unneeded includes from wsa881x and wsa883x drivers.  The drivers
do not reference anything from the headers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wsa881x.c | 3 ---
 sound/soc/codecs/wsa883x.c | 4 ----
 2 files changed, 7 deletions(-)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index d142ca9f2fb6..f709231b1277 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -5,10 +5,7 @@
 #include <linux/bitops.h>
 #include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
-#include <linux/interrupt.h>
 #include <linux/module.h>
-#include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/pm_runtime.h>
diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index de3f4b9b0dba..c609cb63dae6 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -4,16 +4,12 @@
  */
 
 #include <linux/bitops.h>
-#include <linux/debugfs.h>
-#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/gpio/consumer.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of_gpio.h>
-#include <linux/of_platform.h>
-#include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/printk.h>
 #include <linux/regmap.h>
-- 
2.34.1

