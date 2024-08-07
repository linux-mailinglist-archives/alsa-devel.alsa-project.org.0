Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5236894AC5D
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2024 17:14:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5D47193B;
	Wed,  7 Aug 2024 17:14:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5D47193B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723043668;
	bh=gD60QMy/QwxxGBLOYwPLMsMir9my6tspif2L4UDaxCo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b2lN4yN1Pr1dgTpxmBDF9SsvHGfXqMs33ScTH75prI/ivQaPc/M2K59ybvqnfQ0Qz
	 ESl+uNnBGDiGPS/boOkxbcKeCxU6beMMc/Fbtd9oDVzndDlh/TZuY5GcRDTP1qk+PQ
	 Fff5767Cup4fixum4G5hAMo5r5M0b+CcUJthJ/ps=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6DD0F805F8; Wed,  7 Aug 2024 17:13:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B7F20F805FA;
	Wed,  7 Aug 2024 17:13:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44414F8023A; Wed,  7 Aug 2024 17:06:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 77A15F802DB
	for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2024 17:02:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77A15F802DB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=lhTNlaoC
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5b8c2a6135dso2781296a12.1
        for <alsa-devel@alsa-project.org>;
 Wed, 07 Aug 2024 08:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723042964; x=1723647764;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zb7lA4qnI7KpE11eMK8Td9pIdoQNK6RGZ1WWHf+hwpk=;
        b=lhTNlaoCfgzc+TqVIm0LoGeqrJnrIOQBwawdDR24q5eGL62nEzllP3/5D7zU/44dqS
         E5q5ArFE2LO3ZU+cg/HDzOP1pEWArepJZFNLzYqxBpFkLdehUiSP+u3gEhb7yarTm3dU
         yAiPAv8fAcgk3F+A/qqenn1rkXidQGoF7gJ5gwDWfiTTCAiIlOd4pdLnN//dUtO/fgRE
         My/DeyQEjqARHA8AhZPJ/UVDhp0YpKdWDBkd3sdrh6mrmX4xOcdGK5txFrkZiPiB+yqr
         ghj7Rf7WaJT2CiLbyQT+rxCh05gn8Al85Pe44n6ePUImHLd3jeevUbDFbYFrKTm68aeJ
         k+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723042964; x=1723647764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zb7lA4qnI7KpE11eMK8Td9pIdoQNK6RGZ1WWHf+hwpk=;
        b=DwOcspvhltWT+NVmdS1cUaZ9yNyhwO9VYDu1l54Ed5UybxQAvw4eKQyHcUoLvValQW
         agzCjrlOhC6SkCGJIrlZ2Jm7xyX7M3LIebbJJEShEL2mFtx5OLMvoWdmnT5zJCwTHejV
         BriMkOtPtwR0dR8Xf5GgWlQDP+JaXBDQzgkaaDBZ8EDSNAKn1gP3OdB8XtsgCy6Y4ZIN
         O2gCuDq8k9ySQQpvazVIpqk6tupj8cVJama2KgFQhjIOXWVeugYXUsq8EBlm1D/gB0vx
         ON0m2rJnsH3BSAT//X+X6LvaBr/yMOL6k2kIWMGOOgMfRrqwf/72Pqgjv+sf3O6FVFm1
         mGHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwcC6lCPQkoG2fqTxZPe6JwQAofZvv8b1FC606m9k1+TIj8Soo2VLQy/WE9wS3vlEhlSCNnzDGsJrNPXSKi7ciBaZzEhhDEUQMHw0=
X-Gm-Message-State: AOJu0YwCwsarxEx4FEQsaAmDZ/a6fbki8yRf2fyfKLIQz2XSEMXZyFYw
	lMiIzmaKWo0E7MRnzxnm09XB1P8q6vFaJXEoVvaYIVrJ8FeJwRWdNGoDxhzpqyk=
X-Google-Smtp-Source: 
 AGHT+IEBb/2tO0u0sDAp3dDW7mXSiJkZfOd7Vz4ANN2+MBZgge3MX1YpJhT2vVz4APXcj0lgtag8Kw==
X-Received: by 2002:a05:6402:1a3c:b0:5a2:1f7b:dffa with SMTP id
 4fb4d7f45d1cf-5b7f350462fmr13646143a12.3.1723042963968;
        Wed, 07 Aug 2024 08:02:43 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bb90be3a91sm2583047a12.65.2024.08.07.08.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 08:02:42 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 07 Aug 2024 17:02:34 +0200
Subject: [PATCH v2 3/3] ASoC: tas*: Drop unused GPIO includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-asoc-tas-gpios-v2-3-bd0f2705d58b@linaro.org>
References: <20240807-asoc-tas-gpios-v2-0-bd0f2705d58b@linaro.org>
In-Reply-To: <20240807-asoc-tas-gpios-v2-0-bd0f2705d58b@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shenghao Ding <13916275206@139.com>, alsa-devel@alsa-project.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.0
Message-ID-Hash: 6MWZXGSJUFC57NNZYSX2YF3WZR633BAC
X-Message-ID-Hash: 6MWZXGSJUFC57NNZYSX2YF3WZR633BAC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6MWZXGSJUFC57NNZYSX2YF3WZR633BAC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

These drivers all use <linux/gpio/consumer.h> and has no business
including the legacy headers <linux/gpio.h> or <linux/of_gpio.h>.
Drop the surplus includes.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/codecs/tas2552.c | 1 -
 sound/soc/codecs/tas2764.c | 1 -
 sound/soc/codecs/tas2770.c | 1 -
 sound/soc/codecs/tas2780.c | 1 -
 4 files changed, 4 deletions(-)

diff --git a/sound/soc/codecs/tas2552.c b/sound/soc/codecs/tas2552.c
index 9e68afc09897..684d52ec6600 100644
--- a/sound/soc/codecs/tas2552.c
+++ b/sound/soc/codecs/tas2552.c
@@ -12,7 +12,6 @@
 #include <linux/errno.h>
 #include <linux/device.h>
 #include <linux/i2c.h>
-#include <linux/gpio.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 5eaddf07aadc..d482cd194c08 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -10,7 +10,6 @@
 #include <linux/delay.h>
 #include <linux/pm.h>
 #include <linux/i2c.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/regulator/consumer.h>
 #include <linux/regmap.h>
diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 5601fba17c96..9f93b230652a 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -14,7 +14,6 @@
 #include <linux/delay.h>
 #include <linux/pm.h>
 #include <linux/i2c.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/regulator/consumer.h>
 #include <linux/firmware.h>
diff --git a/sound/soc/codecs/tas2780.c b/sound/soc/codecs/tas2780.c
index 6902bfef185b..a1963415c931 100644
--- a/sound/soc/codecs/tas2780.c
+++ b/sound/soc/codecs/tas2780.c
@@ -7,7 +7,6 @@
 #include <linux/err.h>
 #include <linux/pm.h>
 #include <linux/i2c.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/regmap.h>
 #include <linux/of.h>

-- 
2.45.2

