Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE12800BB3
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Dec 2023 14:21:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3938BA4E;
	Fri,  1 Dec 2023 14:21:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3938BA4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701436879;
	bh=Dyw99w10VtyAlsLb9nZnvgYXI/cya0F0brNtz1/uIvI=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=DOogz1h7EW7p7lJw9iU136Bf1D1Zil2uMgW5Pj4Q7uc/4HTRY2tZAyM/36EcdoAsp
	 4J4n4n2fxdvE0cfq3IGfc7MDN2IDFZxNQNj9u/Ig+scQtLtJw+XttvkM8L5MT9MWSK
	 dbDnlV5cCiV4So99+DhyEd347eo3B1I59EX4/rmM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74246F8057E; Fri,  1 Dec 2023 14:20:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69520F80580;
	Fri,  1 Dec 2023 14:20:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48D21F80114; Fri,  1 Dec 2023 14:20:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 36881F80114
	for <alsa-devel@alsa-project.org>; Fri,  1 Dec 2023 14:20:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36881F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=CXuWPqSR
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50bc501081fso3088218e87.1
        for <alsa-devel@alsa-project.org>;
 Fri, 01 Dec 2023 05:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701436832; x=1702041632;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3WxPktasKkZEej0sqgFg3/J9Uo7JHJmWFpjxeLxWfYc=;
        b=CXuWPqSR64jyxyoLASUvXKedabQd6l10S04z8wi9N/K059TN7UZpNaG/mr0FTklF4B
         XXC/Zzm+2ARI2zO6uacR8imbuxAjICO6sqc2dIZ9h0NPPJkybYv6zy5WQrvaJoktMcep
         XsFZacmRn9M0J0TvHL3Q6/4q2qe3WxCWkchm3wrxluMQUCE6G46DAeFoJf3zOdpmUG9+
         pJXJ1Da2ck3ABjLwPB9NdJeIb8mf/BLYFVLe8vvqZzDGSnqIP89+bq+aLaBBAyyTOY66
         ftzXbUlyqb4egez4y+lN89KVw7o5k5ZHFGJEzpiDUA81t+/cUMqqLv7kTTuQGqAxZai4
         QAxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701436832; x=1702041632;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3WxPktasKkZEej0sqgFg3/J9Uo7JHJmWFpjxeLxWfYc=;
        b=Q8Zc6osY9dit8zVqsQsJvagGahijsVd2oijJ5LHDhVGyMTFEUeqWoiZMNgiBVm+mW2
         o8WB7M/KzlaT2yN2U4afcS8AzHoOJ/5phVBPk7prihEIF5c3XlIYSoHAXqmmOHIUrgNc
         ZagOrYw21EgMbxwPVqXQ+mj1LL1Koa3y+cNdphdvEImnX3/5qd84eSrTgML3hFUhFrNx
         liuuf7E60Bf9t2x+njgvis/fNKJHjAchkCsDwinsfonu39hGRG83EbVHF8t4nqgYsUwC
         JKQNJZ9o3t5pOnaNJPIl20+SLc3qaSBWl5w/A540TsgFkbwSjcxX95rN8ntpZYXVcVRs
         oLIQ==
X-Gm-Message-State: AOJu0Yx0bkmEaN5RbdE3u+K8SYs7B1SZ4tK/b1fyGMZL309fWcaJhCsF
	bfXZiaq/ssJuwRRU3eEnhopJQZ2HisEP5KUhqms=
X-Google-Smtp-Source: 
 AGHT+IHnkI/nqzO/GyNwmeS7iBCAivqXeSYuwkz4bEKNd4hhmJw/EAoXBhuD7RcEBSZRCHCeEWL6mw==
X-Received: by 2002:a05:6512:239f:b0:50b:c2f4:ad44 with SMTP id
 c31-20020a056512239f00b0050bc2f4ad44mr1028147lfv.29.1701436831756;
        Fri, 01 Dec 2023 05:20:31 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 u25-20020ac243d9000000b0050be054b4e8sm1081lfl.121.2023.12.01.05.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 05:20:31 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 00/10] ASoC: Convert Cirrus codecs to GPIO descriptors
Date: Fri, 01 Dec 2023 14:20:29 +0100
Message-Id: <20231201-descriptors-sound-cirrus-v2-0-ee9f9d4655eb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ3daWUC/42NQQ6CMBBFr0JmbU07gIIr72FYNHSASUxLZoRoC
 He3cgKX7yfv/Q2UhEnhVmwgtLJyihnwVEA/+TiS4ZAZ0GLpHLYmkPbC8yuJGk1LDKZnkUVNjRh
 ae3GNbQiyPgsN/D7Sjy7zxJqlz/G0ut/6R3R1xprSeX+tKqyHobk/OXpJ5yQjdPu+fwGdVkqIw
 QAAAA==
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
Message-ID-Hash: V2JF35IWNK3VN444YDLMZFPRXKYPZR25
X-Message-ID-Hash: V2JF35IWNK3VN444YDLMZFPRXKYPZR25
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V2JF35IWNK3VN444YDLMZFPRXKYPZR25/>
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
Changes in v2:
- Add explicit <linux/irq.h> include in the cs35l36 driver, apparently
  the driver useeed this implicitly through the <linux/gpio.h> include.
- Fix commit messages "gpios" -> "reset" on two patches.
- Test builds OK
- Link to v1: https://lore.kernel.org/r/20231129-descriptors-sound-cirrus-v1-0-31aa74425ff8@linaro.org

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
 sound/soc/codecs/cs35l36.c           |  3 +--
 sound/soc/codecs/cs4271.c            | 39 ++++++++++++------------------------
 sound/soc/codecs/cs42l42.c           |  1 -
 sound/soc/codecs/cs42l42.h           |  2 +-
 sound/soc/codecs/cs43130.c           |  2 --
 sound/soc/codecs/cs4349.c            |  1 -
 14 files changed, 56 insertions(+), 49 deletions(-)
---
base-commit: 267aea213ae042f779a8054401a8a5f301518605
change-id: 20231129-descriptors-sound-cirrus-522d9061808e

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

