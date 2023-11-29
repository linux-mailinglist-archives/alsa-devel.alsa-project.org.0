Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E447FE1F1
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Nov 2023 22:29:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0885AE9;
	Wed, 29 Nov 2023 22:29:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0885AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701293383;
	bh=CymTQDDMieEmoGaXusdRyIJjLBuXlDOdqeJYkUoYxVc=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=r+RAwv4I88x6PQ7V8h2wSX3opUD/d7ARXpHKTv4MZJSplgAFThRBKDo137EwguT3P
	 btWTujqqeLsq9YuaEmGlwtfshkIo2zoqvPyyb32NyeAVMJe8uVkD6i6p3fnA1KeFUx
	 6dahwKIiA4bV3aCAnI6TmbJbAOOhSsq9Wlcu2VQ4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF645F805C7; Wed, 29 Nov 2023 22:28:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 99DE4F805B1;
	Wed, 29 Nov 2023 22:28:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A4B9F80557; Wed, 29 Nov 2023 22:28:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 66705F80166
	for <alsa-devel@alsa-project.org>; Wed, 29 Nov 2023 22:28:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66705F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ttrHs55c
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2c9c149848fso3406971fa.2
        for <alsa-devel@alsa-project.org>;
 Wed, 29 Nov 2023 13:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701293320; x=1701898120;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JVtouacVrrR5Jn9scn4yjT9l92Jv7EbZPGxiKjWiiDI=;
        b=ttrHs55cewLXTc2ewadnuNJeKe50NSMJSSdRkbLMlg/1cp1rQKeQ9/PZhojZbsJnwJ
         xQxCku4p/neUw1Hb/bQG2h8W9kvE5wsLBMsx6JVZvYSrFYj4KQa6NVL2PYxj4YYRcZTS
         87i1t152wQ6MZIdp9RoR7gOkM6kgNVDXiWmSt8XiXE8d6gIFEs153/iE6dFOuW2lxGbn
         v4bdp2pNCQrw7yJO8QAICPUa6RJGlaOFMXdvLEzmXYBBt++sfADEy+TkF2uw2lYwzeyE
         uTG2MRIQ46BE9NVMsfcm8p70AWc2x06kapH4rZq67c4+6Pc7cIuAR1txT9PpDLZoV4G6
         OTWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701293320; x=1701898120;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JVtouacVrrR5Jn9scn4yjT9l92Jv7EbZPGxiKjWiiDI=;
        b=JUzfqgEJAL4t3gR+WVU+7T8LX8mfarZSItkozLTmKL+AzeV6DP73y9BxGSml+t07FF
         NVFhEiJq7lVZ3Bkeu09JF5fRwvCTSyr5jRW7LG4eMWDjDlFtIx4U+cTPcBmDx/9u2UKf
         RrDq8FjPLEbl/VfXjPnKKbQOXdiaoTSPUiz08eTKyQNZJYcOb8TXiPYZaI0zJ7Vs9/Pn
         ynAqHImW+697QhIactOjZszdK3Wgx/RzXl+7PVhkoD3Xor14nLc+mX53G3irAYymoP1i
         zXi0zmpXhBfO16IiED+Rr6InOI69jywhqcSGGGBpY3EHcDYXK/A+IcFbK2Q85vS0/jGm
         GqpQ==
X-Gm-Message-State: AOJu0YzYLt+xAlfAjPFcwXmD+UxURvpQAIJ4a2o5IBjg+a3czX/frZlo
	/KIpDk7B3VqhkaYxKt5pEmnoHg==
X-Google-Smtp-Source: 
 AGHT+IEwkINnI/mpd3rYVPrRN6fdLm/mchI5FP5PJu+561pNnVnQiZR0QEViJMJGk62lvxiV+rXBxA==
X-Received: by 2002:a2e:c51:0:b0:2c9:b84d:b8e with SMTP id
 o17-20020a2e0c51000000b002c9b84d0b8emr4053036ljd.17.1701293320014;
        Wed, 29 Nov 2023 13:28:40 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 b5-20020a05651c032500b002bcdbfe36b9sm2106196ljp.111.2023.11.29.13.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 13:28:39 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 00/10] ASoC: Convert Cirrus codecs to GPIO descriptors
Date: Wed, 29 Nov 2023 22:28:36 +0100
Message-Id: <20231129-descriptors-sound-cirrus-v1-0-31aa74425ff8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAStZ2UC/x3MwQqDMAyA4VeRnA20GY66VxEP0mZbLq0kU4TSd
 7fs+B3+v4KxChu8hgrKp5iU3OHHAeJ3yx9GSd1Ajh7e04yJLarsv6KGVo6cMIrqYTgRpdk9fXC
 Boee78luu/3pZW7sBZerrHGoAAAA=
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
Message-ID-Hash: SX7LLKDYBBWKJZDBCIRIIUXW7ZUT73PT
X-Message-ID-Hash: SX7LLKDYBBWKJZDBCIRIIUXW7ZUT73PT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SX7LLKDYBBWKJZDBCIRIIUXW7ZUT73PT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This series walks over the Cirrus Logic ASoC drivers and
clean out the use of legacy GPIO numbers and legacy
GPIO APIs.

The CS4271 affects an ASoC driver for EP93xx which Nikita is
actively working on moving over to device tree, so I don't
know about that patch specifically, but I think the collision
would be max "the file was deleted".

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (10):
      ASoC: cs35l32: Drop legacy include
      ASoC: cs35l33: Fix GPIO name and drop legacy include
      ASoC: cs35l34: Fix GPIO name and drop legacy include
      ASoC: cs35l35: Drop legacy includes
      ASoC: cs35l36: Drop legacy includes
      ASoC: cs4271: Convert to GPIO descriptors
      ASoC: cirrus: edb93xx: Drop legacy include
      ASoC: cs42l42: Drop legacy include
      ASoC: cs43130: Drop legacy includes
      ASoC: cs4349: Drop legacy include

 arch/arm/mach-ep93xx/edb93xx.c       | 32 +++++++++++++++++++++++++----
 arch/arm/mach-ep93xx/vision_ep9307.c | 12 ++++++++++-
 include/sound/cs4271.h               |  1 -
 sound/soc/cirrus/edb93xx.c           |  1 -
 sound/soc/codecs/cs35l32.c           |  1 -
 sound/soc/codecs/cs35l33.c           |  4 +---
 sound/soc/codecs/cs35l34.c           |  4 +---
 sound/soc/codecs/cs35l35.c           |  2 --
 sound/soc/codecs/cs35l36.c           |  2 --
 sound/soc/codecs/cs4271.c            | 39 ++++++++++++------------------------
 sound/soc/codecs/cs42l42.c           |  1 -
 sound/soc/codecs/cs42l42.h           |  2 +-
 sound/soc/codecs/cs43130.c           |  2 --
 sound/soc/codecs/cs4349.c            |  1 -
 14 files changed, 55 insertions(+), 49 deletions(-)
---
base-commit: 267aea213ae042f779a8054401a8a5f301518605
change-id: 20231129-descriptors-sound-cirrus-522d9061808e

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

