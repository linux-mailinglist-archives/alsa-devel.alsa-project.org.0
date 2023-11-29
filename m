Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9727FE1EE
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 22:29:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BD44AE9;
	Wed, 29 Nov 2023 22:29:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BD44AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701293370;
	bh=VssnOm4PeCD2AYkAkjJNDkBOjVBXB/SmcNyQhhRGYuA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=d8EEJl4NCMGJ8AXIW9n/u53flGzW1qDriAYWfL4ZDWnvEYPBrkGmn5hlw2pFuQq2M
	 3JECETyb2gLbH54LUuv5nlfJdKQqrCdILPgvFk7ieWLOOmPE1Emtf6w1HhYAVXli/Q
	 cRKklS19zg7p7OwsK8KUj6xA6A74c++YANZIUBsc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E09AF805C6; Wed, 29 Nov 2023 22:28:57 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5161CF80587;
	Wed, 29 Nov 2023 22:28:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5AE46F8025A; Wed, 29 Nov 2023 22:28:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1FB27F800F5
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 22:28:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FB27F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Oz9M4cI1
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2c9c39b7923so3753691fa.0
        for <alsa-devel@alsa-project.org>;
 Wed, 29 Nov 2023 13:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701293323; x=1701898123;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uGzqJZeCIvHWgx50HcN8P2Sdt/SHVZafM+S/3T4/ITk=;
        b=Oz9M4cI1HnvF1+Cr1IhIU+ht8kjzYC+6LIeQT2BJRH9+tgc8ARy1+ZYm55noMS2JPb
         nKEGuqQ8PEZ/CHhU8mC7dTcUkQQMubkekOIym4vP8Y1r2PM7A+r5n8QUaD/Hs5qmfKSr
         HgV7ae6wpOVw5KpTMs9I+Zo8Qs8NAz65uxIyc9UU9DtJK5XQWj9giIMFAuYdyxWKHOC0
         yRybU1o+Ntq7J+L2oNT8FdeMNWEF6E3gNsf4TbKY6IU4nYrsNCYo14dBDF0jZxnjjYAJ
         31Bv40jfZGn8m+4H91eq4H0nF6/7ZuoC+yE4cziNvAdqTgz8B9psqKLsGez995Xa5Z9/
         n/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701293323; x=1701898123;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uGzqJZeCIvHWgx50HcN8P2Sdt/SHVZafM+S/3T4/ITk=;
        b=XQ70XtoeYpHmazkXgRp3gh1iKs1pitlWUOm0sGFvi4sR8Wu0UbVwMVwseWH1mwUaQO
         6KrLWQlxkeEielGJCM/PzDgQ/oo+hPNc4/lKtxsy1VEJL5OrvzYG9xDs7/pFTHbtHe5T
         TepjDY3XEk9XlkMwFO9jD1+P+/VnDIz/ZwHI3hMg6j+fFE6Ny8zFThhWIfTddXEPsJQw
         B0z8+oNHGj3bAPj5mCdnFNTyKrn5q/TsgsMvINRUvr5PZXrQ5Le5QlCjtACMSdoTEMSf
         Q3TM+Iv8XcT+5EiacE+cwEscGuQqQbPPmBSH2226oHvaVlXKYabV8vp+RHTy96OBbB3c
         6MOA==
X-Gm-Message-State: AOJu0YzFHh+wRJZh0YK4eO1RdcCq4Qvm1k1MZxF/hY2BR/50DGcY8TyV
	68SmxydwN5RAiExUTP42+RoYww==
X-Google-Smtp-Source: 
 AGHT+IH2iP1+SnhRh5dk6NH/SIXt5a1DgU9BeCKEI9Kd5MNkN/wjAcRvj26p+QcR+8v7vqnF7DFCiA==
X-Received: by 2002:a05:651c:b27:b0:2c9:a9ba:97ec with SMTP id
 b39-20020a05651c0b2700b002c9a9ba97ecmr6389122ljr.38.1701293322448;
        Wed, 29 Nov 2023 13:28:42 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 b5-20020a05651c032500b002bcdbfe36b9sm2106196ljp.111.2023.11.29.13.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 13:28:41 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Nov 2023 22:28:37 +0100
Subject: [PATCH 01/10] ASoC: cs35l32: Drop legacy include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231129-descriptors-sound-cirrus-v1-1-31aa74425ff8@linaro.org>
References: <20231129-descriptors-sound-cirrus-v1-0-31aa74425ff8@linaro.org>
In-Reply-To: <20231129-descriptors-sound-cirrus-v1-0-31aa74425ff8@linaro.org>
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
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4
Message-ID-Hash: WY6LHXNYM57DFHMP55MPHCIWS7OH2C6M
X-Message-ID-Hash: WY6LHXNYM57DFHMP55MPHCIWS7OH2C6M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WY6LHXNYM57DFHMP55MPHCIWS7OH2C6M/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver includes the legacy GPIO API <linux/gpio.h> but
does not use any symbols from it.

Drop the include.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/codecs/cs35l32.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l32.c b/sound/soc/codecs/cs35l32.c
index 138040618438..d1350ffbf3bd 100644
--- a/sound/soc/codecs/cs35l32.c
+++ b/sound/soc/codecs/cs35l32.c
@@ -13,7 +13,6 @@
 #include <linux/init.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
-#include <linux/gpio.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/platform_device.h>

-- 
2.34.1

