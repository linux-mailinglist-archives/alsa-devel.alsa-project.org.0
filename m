Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F73800BBD
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Dec 2023 14:22:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4A09A4D;
	Fri,  1 Dec 2023 14:22:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4A09A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701436978;
	bh=Nen+9wRais612KXHRU0p7KTeoBkM/6R2JHB+YWxS0ng=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qfVkEMT/ExankJoPYpI3pUOpGsEgcNML8neBdn+GRaHnoLVwifAXWDhjmJGZbJXsk
	 vBSmCcC2MXKYzvi32Ke4biBFFFbPAbezvpTVXoCnDZs9ZQuDS7vJLTQ60eIKgJJgc+
	 eKMRadCadzCPmRNxvmQBBDtYfJgg8OAtqHDe0xG4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 053BBF80680; Fri,  1 Dec 2023 14:21:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9548BF8068D;
	Fri,  1 Dec 2023 14:21:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1236CF80611; Fri,  1 Dec 2023 14:20:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BD381F80104
	for <alsa-devel@alsa-project.org>; Fri,  1 Dec 2023 14:20:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD381F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=wAxzuTsT
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-50bdec453c8so179957e87.3
        for <alsa-devel@alsa-project.org>;
 Fri, 01 Dec 2023 05:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701436841; x=1702041641;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kJ+3Y6BEIrIf7qh9svq9OVzbI1CjxUGno02MCFoO1oo=;
        b=wAxzuTsTUglQVWYLRob48DALWD2E8WghswKMQErTjJXa5XHUPc0Vvrl6MQjjqOC27O
         T/rVDHTt499QGgmtRDMfsUc20o1ZRDk/vEpICXcw6tV8tX/IYxNijmLtNXp0Gc5Nzz02
         0ncezPltYmZNtvDbB0/PmuQ2EKYEDMZHkrqZdSyHx2RTm1yNuAK2IcrAeylOb6lEKW5m
         A4kcz2tGFc7nRhp9mtQTewsKkN/0MijENAJe8m42SnWG7Qq53nTI7tmGkma4sYGymIbW
         PIUWDqdAsmyZ9fO+Oap4Dg+fOsZjlOk4A50I0WkdqvQ6W/TKk9HnfI5hL5m685IZOTUa
         DxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701436841; x=1702041641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kJ+3Y6BEIrIf7qh9svq9OVzbI1CjxUGno02MCFoO1oo=;
        b=lyY5NdY45ag3j8nWsiCezCRlObHPeVR5kDnaAh6/GvNtE2dwM9aI7Dyfr92Uos6VW+
         fUNLVqWm2MP2wVs8OERvcY0S5ynj9KVPuIb8rQs0n/zFU0cHnJVZeLns1O30hcn+Hm5C
         QzxXnSKsuNvgPMS5BXTDyhH4QIKAQmXVT0X+M8YTtaTRHJ7JaVu4Vu6w9Gh9MfES/dw8
         aHRq0J0QqX9DNMEH9qWsze5oIvy6VIx8sK1G8jZGyoBBH/7RDFRwt6duOXUjc2904oa4
         xqYkVARj9Ha8rooykTH+3Uc19ttWccZ4COnzTCbUft0nQo/YS6LyHj2beWIayhprkV1Z
         2Sfw==
X-Gm-Message-State: AOJu0YzKVqeEj7P9IGgATrlyskod/FclPxL9XFukVAjwlKvfrd5NL52g
	90HtmVg16QVQ32V1yZjW+VaUCHHiOrPZ8ZnyIEQ=
X-Google-Smtp-Source: 
 AGHT+IFCWkhwbCMo2Kf7qMaVHd44Tp9vXFDKbzrS0UCWqndYYop0TULKRfjWVlBGS5I0GO/2TXb3TQ==
X-Received: by 2002:a19:915e:0:b0:50b:d764:6edb with SMTP id
 y30-20020a19915e000000b0050bd7646edbmr666344lfj.139.1701436840946;
        Fri, 01 Dec 2023 05:20:40 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 u25-20020ac243d9000000b0050be054b4e8sm1081lfl.121.2023.12.01.05.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 05:20:40 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 01 Dec 2023 14:20:37 +0100
Subject: [PATCH v2 08/10] ASoC: cs42l42: Drop legacy include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231201-descriptors-sound-cirrus-v2-8-ee9f9d4655eb@linaro.org>
References: <20231201-descriptors-sound-cirrus-v2-0-ee9f9d4655eb@linaro.org>
In-Reply-To: <20231201-descriptors-sound-cirrus-v2-0-ee9f9d4655eb@linaro.org>
To: Paul Handrigan <Paul.Handrigan@cirrus.com>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Hartley Sweeten <hsweeten@visionengravers.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Nikita Shubin <nikita.shubin@maquefel.me>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
X-Mailer: b4 0.12.4
Message-ID-Hash: 2PME6KF44QYCCBKKTCVD2ZJUQUISUPKA
X-Message-ID-Hash: 2PME6KF44QYCCBKKTCVD2ZJUQUISUPKA
X-MailFrom: linus.walleij@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2PME6KF44QYCCBKKTCVD2ZJUQUISUPKA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver includes the legacy GPIO API <linux/gpio.h> but
does not use any symbols from it.

Drop the include.

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/codecs/cs42l42.c | 1 -
 sound/soc/codecs/cs42l42.h | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 94bcab812629..2d11c5125f73 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -15,7 +15,6 @@
 #include <linux/types.h>
 #include <linux/init.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/acpi.h>
diff --git a/sound/soc/codecs/cs42l42.h b/sound/soc/codecs/cs42l42.h
index 7785125b73ab..3d85ebc59489 100644
--- a/sound/soc/codecs/cs42l42.h
+++ b/sound/soc/codecs/cs42l42.h
@@ -14,7 +14,7 @@
 
 #include <dt-bindings/sound/cs42l42.h>
 #include <linux/device.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/mutex.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>

-- 
2.34.1

