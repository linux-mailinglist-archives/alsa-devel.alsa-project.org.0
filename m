Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1DD94AC4E
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2024 17:13:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75B92162C;
	Wed,  7 Aug 2024 17:13:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75B92162C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723043635;
	bh=+wyWa9keKYvJvojA0lUFTGTwanpx4GNfWBttcW1dW/g=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=LL9vcz686edQvbVGTtVxjcHWE/qgzWpUDGa3K3BGWUiY21cmgn2RuxTgxmqJu7Qy/
	 9k2B4WHoaWPRUzZGK+3Ly4cw6bQJ8ZdF+bZY/K7VioFujymeh/FuqEFBBTNGvqueQJ
	 cWlLl/lZQ1miQS1mOzSnq5UrWaig8V4lUn7ic6uY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C025F805B2; Wed,  7 Aug 2024 17:13:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 50CBDF805AC;
	Wed,  7 Aug 2024 17:13:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02F3CF8047C; Wed,  7 Aug 2024 17:06:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 028DFF800BF
	for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2024 17:02:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 028DFF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=vw5EmAYF
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5a2a90243c9so1818300a12.0
        for <alsa-devel@alsa-project.org>;
 Wed, 07 Aug 2024 08:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723042958; x=1723647758;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gboyXAEeXuINog3pkYnMpOO7y/D6nwWKyvX/1H9FuXk=;
        b=vw5EmAYFsPLfQ38iXfum93k7U3le1LTYp3tUmkxJbvigZQoaejtMuWYi/+akAr9w/q
         qk1i9IgWTiuXWNuBS+SoZsrfzOhmP54tzNx7eqeXt6AhTZ6XzROF17+tIozsHo1NB3zt
         dsJuSi7yOt8xLf75Mxqb6kSdSpDGvW0vgzhjos2fujzgijuqcDChH5oiIUlr9OGMB3Ib
         WANkJTY/VToh9aBtYao8lafm63YhFBUzP0vcRe68rlt6wwLpAxv+9+5PaqrcGxSjzTpo
         RvfpFvy35NwqgUGrGtdyS9cauJNa8nxyYZ+joWsFPy1c1C0KErz7RRbg95AwVdqzzhQ2
         w79A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723042958; x=1723647758;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gboyXAEeXuINog3pkYnMpOO7y/D6nwWKyvX/1H9FuXk=;
        b=e6sCpXRJfSkJzaHOvkL7jdmHYMpIG/JD2aTWPvJttX1RYmriOGTb/hQcNyoC8OxaBr
         xxAhEIlgx9WsexS52LFIZuhldxhAzMGFp/HcqPmsRF5QLtr2E0g5cZrl/3gfxzN+lJVv
         6JOTJwkBBD44X2jusVqV60ohjmG4w9YXSxFRGlPBwMoxn1U0ABe+DOurcIcOCv8DYHRK
         zgBqKSvElG8/KniKd/TO5JrKKOFEMtgIQUVzPigpkkT654RqMlC4UUzBMhgUVn7EOtEZ
         BHai4PM04GSiuwX3B8mtj47wJX/wE+Mi9sgtAbYi4KRFExX2Dm6qNqE73DrmUApuIyYh
         rokA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVH+ujnlaAb/5IHZqomFr+nXeUwsla5yYy/YoAeFiXgjhkNtB0s1Mn9ulGsnp6i/WBiIzupL60MYSQDCNgmYIer/GewFX825so1VeQ=
X-Gm-Message-State: AOJu0Ywe9G8ZPVufLeZyRkU6CzOecMp+utfZttfu9yY79IrBCfeAGc5i
	YZj3oTQWCb4+/coLRN8cZh+2U73uA02yUz1lo+DoIpPdYsCe+jHn17ndgy2Edn4=
X-Google-Smtp-Source: 
 AGHT+IFAVMAyBYgyjB17PgBIAsqIPvYIgbKexhMjycc9NMyI226M25xxGJarXKv+Tma4MwJ18ohlaQ==
X-Received: by 2002:aa7:dcd9:0:b0:5a1:40d9:6a46 with SMTP id
 4fb4d7f45d1cf-5b7f5dc5d68mr12204944a12.36.1723042957750;
        Wed, 07 Aug 2024 08:02:37 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bb90be3a91sm2583047a12.65.2024.08.07.08.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 08:02:37 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 0/3] ASoC: tas*: Fix up GPIO usage
Date: Wed, 07 Aug 2024 17:02:31 +0200
Message-Id: <20240807-asoc-tas-gpios-v2-0-bd0f2705d58b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIeMs2YC/3XMywrCMBCF4Vcps3YkifYSV76HdBGS2A5IU2ZKU
 Ere3di9y//A+XaQyBQFbs0OHDMJpaWGOTXgZ7dMESnUBqPMVfVKo5PkcXOC00pJsPWq1WFQoe8
 GqKeV45PeB/gYa88kW+LP4Wf9W/9SWaPC0Nno29Bbe7H3Fy2O0znxBGMp5QsYLWOsrQAAAA==
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shenghao Ding <13916275206@139.com>, alsa-devel@alsa-project.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.0
Message-ID-Hash: EQZHG5S5VRET6WEZWZT2ENEU7EENRU2S
X-Message-ID-Hash: EQZHG5S5VRET6WEZWZT2ENEU7EENRU2S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EQZHG5S5VRET6WEZWZT2ENEU7EENRU2S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The TI TAS drivers use some legacy GPIO code and headers,
this series fixes it up.

The TAS2781 is a special case since it adds a handful of
lines of deviating code to reconfigure a GPIO line for
IRQ mode and then never actually use the IRQ obtained in
the code. Is the line used by autonomous hardware? I'm
puzzled by this.

Anyways the patch suggest how to solve this properly by
fixing the parent irqchip and I'm happy to help.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v2:
- Rebased onto v6.11-rc1
- Link to v1: https://lore.kernel.org/r/20240701-asoc-tas-gpios-v1-0-d69ec5d79939@linaro.org

---
Linus Walleij (3):
      ASoC: tas2781-i2c: Drop weird GPIO code
      ASoC: tas2781-i2c: Get the right GPIO line
      ASoC: tas*: Drop unused GPIO includes

 include/sound/tas2781.h           |  7 +------
 sound/pci/hda/tas2781_hda_i2c.c   |  2 +-
 sound/soc/codecs/tas2552.c        |  1 -
 sound/soc/codecs/tas2764.c        |  1 -
 sound/soc/codecs/tas2770.c        |  1 -
 sound/soc/codecs/tas2780.c        |  1 -
 sound/soc/codecs/tas2781-comlib.c |  3 ---
 sound/soc/codecs/tas2781-fmwlib.c |  1 -
 sound/soc/codecs/tas2781-i2c.c    | 26 ++++----------------------
 9 files changed, 6 insertions(+), 37 deletions(-)
---
base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
change-id: 20240701-asoc-tas-gpios-5c051d80d768

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

