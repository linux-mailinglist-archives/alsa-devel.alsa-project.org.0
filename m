Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C925A7FE1FC
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 22:32:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7566384A;
	Wed, 29 Nov 2023 22:32:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7566384A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701293535;
	bh=yB5pKzTCYEUlbxwJMzl/ckqbC/X80Zt2tURy9XN/d64=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=b0R83qiYEH2Vm8H+BrizOc/vlH8cH7m3/ChSwiS8PUKp1OYnlKaDYMWaxobiWxvJt
	 mSm/O9UAbdm1+S9mw4QZ5fbUX8QOAmSAtzVjawNV5RCvWkCJBaq2QRhg8MW9U0jbl6
	 MiAFEFYIHwf5t0G1Q/uvwyPrCOWMLJbT3tmhHoyc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F481F806E2; Wed, 29 Nov 2023 22:29:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CDA8AF806F5;
	Wed, 29 Nov 2023 22:29:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0382F80568; Wed, 29 Nov 2023 22:29:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 05DDCF80236
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 22:28:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05DDCF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Pxj2kU1U
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2c9b9191722so3738571fa.1
        for <alsa-devel@alsa-project.org>;
 Wed, 29 Nov 2023 13:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701293326; x=1701898126;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YU/umhZ4xMv6PXObbvZL6R5y01gsoGYZgYp3KJFvARs=;
        b=Pxj2kU1UtLyozBRqssmiEuJ6WBCA8h+wYxu7zHM7G+JnjEoIFEd6z1fUQfZOse1h5C
         leMJjyjBvsUjv/LZK6oqPFlKXB9dQ8kQ9QmY08kL95VyIk8JdjA2ybJq/dExITd/2rlg
         v3SoejMgrWZGmbWQcLcoz2GpqsOG1Ja5osJtSVJ5TMBNIRYqKr5wmvpJ4UIIn8J8Ij61
         KqRHhLQQbkm4aj1lAkRcVf6uC4VGyU4OmBISjKpLdSTB/vbJoE5LWfXPpdTnrsni23du
         o6PX9dGIYbh0QO5H7iEfE0DB/yh9YIzbUAUOHLE+n7XUI0DFMhSIJ0lQMcN4NxOJtvUj
         0sVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701293326; x=1701898126;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YU/umhZ4xMv6PXObbvZL6R5y01gsoGYZgYp3KJFvARs=;
        b=vlmCpkD1hvaA1JLzbb5dRBO+Lc3NV2Iacch4c2meBgVkRkfxrASW5Ak0U+y7fVsKIW
         NHPB5DL+q5iTPkAfi1EcSvw4gghNbtGWSqjPjbmiENeizin9WlftNhp7JH0KpeSAB4Sm
         HDdQiSr9aiv6mTZenF4vqOgfnvXKT60sZRIY+8cjJYa6/r9heBTrj0Ly4N0yg53GP2gw
         g2507YpZe2HEq5xauMR4JJ9Vrdqolh4/Q0VjYXbJk7oZJsFtz7Y7Xbd0ejFuP5OXu35o
         /sxnxCjZQeYPqeEsZpJnT6iD4yONEvJaaCiZmAg6+1HlwwPwgWO4f0rWnpWQmNN0/BRm
         sULg==
X-Gm-Message-State: AOJu0Yw2z5JuSDrLzHILgmjN7zCkxzr6ibMDZKqsBc/pNfLTTcVxevQp
	dVZcEYJAPZK6ve9YGrn4hmODlg==
X-Google-Smtp-Source: 
 AGHT+IE+lDIdHAdte4rENQsg0tSBQfqVYqAjeDvwRKqHOtDWVAZmyuqpLukchZeA3cMSJEgTRjKklw==
X-Received: by 2002:a2e:88c6:0:b0:2c9:c438:d0fb with SMTP id
 a6-20020a2e88c6000000b002c9c438d0fbmr1191629ljk.34.1701293325848;
        Wed, 29 Nov 2023 13:28:45 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 b5-20020a05651c032500b002bcdbfe36b9sm2106196ljp.111.2023.11.29.13.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 13:28:45 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Nov 2023 22:28:40 +0100
Subject: [PATCH 04/10] ASoC: cs35l35: Drop legacy includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231129-descriptors-sound-cirrus-v1-4-31aa74425ff8@linaro.org>
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
Message-ID-Hash: 36LDJZIDZDIPAVEVAMSYSCJNQHOTXKH6
X-Message-ID-Hash: 36LDJZIDZDIPAVEVAMSYSCJNQHOTXKH6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/36LDJZIDZDIPAVEVAMSYSCJNQHOTXKH6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver includes the legacy GPIO APIs <linux/gpio.h> and
<linux/of_gpio.h> but does not use any symbols from any of
them.

Drop the includes.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 sound/soc/codecs/cs35l35.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/cs35l35.c b/sound/soc/codecs/cs35l35.c
index 63a538f747d3..ddb7d63213a3 100644
--- a/sound/soc/codecs/cs35l35.c
+++ b/sound/soc/codecs/cs35l35.c
@@ -18,14 +18,12 @@
 #include <linux/regulator/consumer.h>
 #include <linux/gpio/consumer.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/regmap.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
-#include <linux/gpio.h>
 #include <sound/initval.h>
 #include <sound/tlv.h>
 #include <sound/cs35l35.h>

-- 
2.34.1

