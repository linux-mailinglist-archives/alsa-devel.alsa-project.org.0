Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A11800BB4
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Dec 2023 14:21:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 089E2DEC;
	Fri,  1 Dec 2023 14:21:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 089E2DEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701436901;
	bh=W9uWWb0OT+OW230+6kgDXDm72OVBpDo/6SEAE01cj7g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JJ4iWIOSEnzqdn4aC/wnxWXfUJijksEg45S6K377BY+t+psrtQ+TrhUztI09id3us
	 /BmeWrR71I3o9MlfMiC6tzz6JmLicg3nA6cSVNpweMa1F50Z+yDZoSMhciq7zk59v8
	 qWlcr+cCJXsl6n1E5VZmvuLSzoPQYSm6sJh7vZWI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 692C8F805C0; Fri,  1 Dec 2023 14:20:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 55275F805C3;
	Fri,  1 Dec 2023 14:20:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 362E5F802BE; Fri,  1 Dec 2023 14:20:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8DC86F80104
	for <alsa-devel@alsa-project.org>; Fri,  1 Dec 2023 14:20:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DC86F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=yBVwgKH3
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-50bba815f30so2882853e87.2
        for <alsa-devel@alsa-project.org>;
 Fri, 01 Dec 2023 05:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701436833; x=1702041633;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6nBS0qEXkMT109HJpJHOUn0za4cdp5UY2TNq9aMO3Co=;
        b=yBVwgKH35mMa7zlyU29anJDPJKPc4pwZ14AAeW0rjXoDKbRC7UNYOQipICg+tbCtC6
         7THlECcwVI8GjLM9CqLVybXb9w/PmFqcX80ODBL/knVuHoEL7UwvDvbDMYuEp/11EG85
         KYGIG2QIZ5zPMmzUuiN8hqMrwx1smdJBneQYHqF9cod9gJYE1e63SvlG8vA9+Se+Nu/O
         ieYe+gc4UtMpDbjUIf6+IBK85vT7gVie1QLcbY24bQiex7P3VE9iTOocgWcSh+juPZ3X
         GyCzZW8Pz/V0YGhdccrQ69O8nI+FZLpJhIPjUxdzjZagqVa3B/v5fGSLZNd8ykflkVLh
         wDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701436833; x=1702041633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6nBS0qEXkMT109HJpJHOUn0za4cdp5UY2TNq9aMO3Co=;
        b=gGxmp3MhAWONCCNzvRstwR85HAkt4gNG1I+1S+5SjOOF+eHZBcnVGRQJE/4u9v9vAQ
         iVrkzySEatC6xjFumA9VIPPDie1o2rUzH8uDKhvDqQsIO5uiW9knUejjDzQ+C1RXeOxq
         OkgC+8Tr2zSa878VW46XTk0AA6m+agI6DzIiryukqGuE2YwjywSqPFiFP9yd3SBFwusr
         P1rBZAzN3vF3SGvxDKpMGI8o/ntR6kitJoocUvnVtXJPlKT/rH8GNETlfy6qhPoR7xs7
         MQbF7WdxyUt2d0nRCmE6+VGLlEzoeaA4hUyl9R251zpswdw8R+jReBBos6wDyALdV7fd
         iyaA==
X-Gm-Message-State: AOJu0YwB7FTeRJRnSFpX5GO4Zrm2ughYOJcJXTzgE0oeu0PXCu5RaKWO
	C5G1j3rBJR+YO+UFOOmEyNtiHk2KbdKwV8RvD8c=
X-Google-Smtp-Source: 
 AGHT+IEZBoALYT2AI/HvZGmMjYehDRhxvtPlZru/apoTdsAj69LXnriJmkSP9pMwuY+NY+SyLAK8qw==
X-Received: by 2002:ac2:46db:0:b0:50b:d764:8e5f with SMTP id
 p27-20020ac246db000000b0050bd7648e5fmr446890lfo.113.1701436832963;
        Fri, 01 Dec 2023 05:20:32 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 u25-20020ac243d9000000b0050be054b4e8sm1081lfl.121.2023.12.01.05.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 05:20:32 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 01 Dec 2023 14:20:30 +0100
Subject: [PATCH v2 01/10] ASoC: cs35l32: Drop legacy include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231201-descriptors-sound-cirrus-v2-1-ee9f9d4655eb@linaro.org>
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
Message-ID-Hash: KARUYYZQA5SKJM3IEU4JGEG6ZVUWT6OW
X-Message-ID-Hash: KARUYYZQA5SKJM3IEU4JGEG6ZVUWT6OW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KARUYYZQA5SKJM3IEU4JGEG6ZVUWT6OW/>
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

