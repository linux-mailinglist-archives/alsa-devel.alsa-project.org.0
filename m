Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E3491D895
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 09:07:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53AB5233F;
	Mon,  1 Jul 2024 09:07:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53AB5233F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719817673;
	bh=aJ1LZosClX5NnP0cJXhnk/NVUavVqkeU0v2SDbbuCfI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b2ufI/UotfFfzB9ACefDnI3GK1nWqSh2X3EJTrVycfwJMi5gEFaPGmlHPqPRY/7W+
	 /iOssVnSHzAxyLEDqltPqgxSPR/2UGvIcxF7Gqtgz+UzWKyYLJIRH7MWFFoLX9+9LP
	 /WSBgleMx94ecI/ljOM/crIng/Htf3fhTRDZuddE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE9BDF80622; Mon,  1 Jul 2024 09:06:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E2C8CF80606;
	Mon,  1 Jul 2024 09:06:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE235F80238; Mon,  1 Jul 2024 09:05:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ECDD2F8042F
	for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2024 09:02:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECDD2F8042F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=kAX67rYQ
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-57d06101d76so2839237a12.3
        for <alsa-devel@alsa-project.org>;
 Mon, 01 Jul 2024 00:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719817363; x=1720422163;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GMJ9ytIbd8fpZ+zpiTVxchehIRD6mB7COwsKFHn30yI=;
        b=kAX67rYQQ581z0GMSTUBAHCAl2xq+LjEb4PqsvKkjtLmwB+YmLmQtQXw0+uE3HMc+v
         AH4tFd/R8tN0ms9qVwkXuIaToLtZ8sAyjKeInQXWJchkVvFCWyxvdVc6Htx9mMY1QuSa
         aWmUTHCUgw/Kbty+Oe+uuksDo7ydt1pHaS0CAR0uajWpQxMc9/hwpj8mz45M+35riN5x
         iyX+Svtr+aC09j4wUUibJHoZrZiQTxZIyEO3/sfU0c6vqteDi70XorAoHBedujS0yz3M
         /ob3zpudANaKsTMOmimfoBPqNMs8sMxQpKDBLW5uqZFqRZDz8cIGe43DUiGiib7HgBIM
         vG7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719817363; x=1720422163;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GMJ9ytIbd8fpZ+zpiTVxchehIRD6mB7COwsKFHn30yI=;
        b=U35pd6w+yPyisG5mOaaRc45ibRN151MjITKM1v3AKQ64im6GLb/lJ3bJZIf9CGBhDO
         mzBvDs+ASsHJAku5qUk/0epCY6jwc0ABq2rxpUFxajb5S4qPwnNhcRKRcu+XDoqM1bFC
         1CRmpXoRgY0kZ6fy2A3TGHkauyTZxLbfCIRxqZlmY6kf3+F1P2u0bzakHwiNZLceMnw7
         vmCaCF4IgOVeVchBmz1acAlgQjY/2MlsW5pRhXjYe2Ty+zVKTmbOnKJjbs0RSfhZVE9S
         iWzNHL/gkcmI3czEwMx/49DTcbZYh4OtsfE+vtpaXPEy9duJsErN0yAeZg+8RgpHVAui
         0/EA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmVJOeklIDQ9Mq+ya6xkuj5hAPewi1e5VvAdEupq2RsmZ0Jpc3stN5WSGMkDL6Ii1kMe191dw8astszwcu8zH3u8avZnN7bqI22BY=
X-Gm-Message-State: AOJu0YxIjwGD7De/gaP5u53r56kcVGzfOWfq52oXjvNpPfSQvG+OXGqk
	vHMrw6QJFcx9YnouuHzGVBdW/ASfjYNqUb2xcVpqz3kmHYwgTQdQnFhaKZ7b5Yc=
X-Google-Smtp-Source: 
 AGHT+IHR5yOOsqPZFJrRu7Wk8J8cXhauusw1meNRgDWk7XLLZNs2DncjjI+qUlPMsRkkGHRfGt2GEw==
X-Received: by 2002:a05:6402:5cd:b0:57c:c10c:eee8 with SMTP id
 4fb4d7f45d1cf-5879fa7f71emr2584654a12.19.1719817362830;
        Mon, 01 Jul 2024 00:02:42 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5861324f036sm4034383a12.34.2024.07.01.00.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 00:02:42 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 01 Jul 2024 09:02:15 +0200
Subject: [PATCH 4/4] ASoC: tas*: Drop unused GPIO includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240701-asoc-tas-gpios-v1-4-d69ec5d79939@linaro.org>
References: <20240701-asoc-tas-gpios-v1-0-d69ec5d79939@linaro.org>
In-Reply-To: <20240701-asoc-tas-gpios-v1-0-d69ec5d79939@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shenghao Ding <13916275206@139.com>, alsa-devel@alsa-project.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.0
Message-ID-Hash: PDZXKQK7MQVZPN66XGPQIQB3JWYF6QVP
X-Message-ID-Hash: PDZXKQK7MQVZPN66XGPQIQB3JWYF6QVP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PDZXKQK7MQVZPN66XGPQIQB3JWYF6QVP/>
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
 sound/soc/codecs/tas2552.c | 2 --
 sound/soc/codecs/tas2764.c | 2 --
 sound/soc/codecs/tas2770.c | 2 --
 sound/soc/codecs/tas2780.c | 2 --
 4 files changed, 8 deletions(-)

diff --git a/sound/soc/codecs/tas2552.c b/sound/soc/codecs/tas2552.c
index a7ed59ec49a6..684d52ec6600 100644
--- a/sound/soc/codecs/tas2552.c
+++ b/sound/soc/codecs/tas2552.c
@@ -12,8 +12,6 @@
 #include <linux/errno.h>
 #include <linux/device.h>
 #include <linux/i2c.h>
-#include <linux/gpio.h>
-#include <linux/of_gpio.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 1dc719d726ab..d482cd194c08 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -10,12 +10,10 @@
 #include <linux/delay.h>
 #include <linux/pm.h>
 #include <linux/i2c.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/regulator/consumer.h>
 #include <linux/regmap.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/slab.h>
 #include <sound/soc.h>
 #include <sound/pcm.h>
diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 67bc1c8b0131..9f93b230652a 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -14,13 +14,11 @@
 #include <linux/delay.h>
 #include <linux/pm.h>
 #include <linux/i2c.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/regulator/consumer.h>
 #include <linux/firmware.h>
 #include <linux/regmap.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/slab.h>
 #include <sound/soc.h>
 #include <sound/pcm.h>
diff --git a/sound/soc/codecs/tas2780.c b/sound/soc/codecs/tas2780.c
index a18ccf5fb7ad..a1963415c931 100644
--- a/sound/soc/codecs/tas2780.c
+++ b/sound/soc/codecs/tas2780.c
@@ -7,11 +7,9 @@
 #include <linux/err.h>
 #include <linux/pm.h>
 #include <linux/i2c.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/regmap.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <sound/soc.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>

-- 
2.45.2

