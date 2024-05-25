Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8284C90778D
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 17:53:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DACB3E69;
	Thu, 13 Jun 2024 17:53:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DACB3E69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718293995;
	bh=4zLRKryEPEhLxtkijn6RbgJhMMJkRIFlKDleLaNwm/A=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=M9IgzckSrLhtk6N46+T37H/5UqvDmJXTvqL9UfTZMhA0ud2MQYT1HIVvICG9E+ZQQ
	 HOFkPNd/kfQi9Y6H2Myq54fafou/d+z406/cWvY32h7nRaZUlVOHQ8rnRnn4sOpyMW
	 h3o/VqCducLgCOvjsXW7Uu8nW72QExyk3I7ciFsI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CFBC7F806D0; Thu, 13 Jun 2024 17:51:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D2801F8057A;
	Thu, 13 Jun 2024 17:51:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA58EF8026A; Sat, 25 May 2024 15:31:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8D20F8016B
	for <alsa-devel@alsa-project.org>; Sat, 25 May 2024 15:28:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8D20F8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=mDJZzsar
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5755fafa5a7so9240500a12.1
        for <alsa-devel@alsa-project.org>;
 Sat, 25 May 2024 06:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716643687; x=1717248487;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mo8+1mx/nA30VwrcIjP4AOPt1PugmzRzdV+Mta/P/KY=;
        b=mDJZzsarP8PuIG2+3A2zd4vJkelWf0qLbBaN8C6NYhkTEJxq/nLONXUZr7F3mEIl5u
         1CvTBq5Y9bl7dTHYNFGnTAIKp9+SEaB0zY1Yedy63m9YgAAJS2ZKHOrlOprV24jWuNPo
         3TKK0BRuzuIbQ3i0pwm5VFe/9/Nz4gs6mLddlUuNSt+s5BDDw4c2CjGMd0Vvb/XLdIHu
         Xt+dQMN8l4aGzefL2vISqIIygJ7ImlsexS5p9wI+lpFRxz6NBhVjqQNtrrRyOeRnxMS9
         ZtTZFa2bO8GqwEaMwOc9B5lBs32+Hsp3EjyLybtOrs0dSe2xHTqiuz7fQpS43m2eVvEL
         RdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716643687; x=1717248487;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mo8+1mx/nA30VwrcIjP4AOPt1PugmzRzdV+Mta/P/KY=;
        b=PzLLriqivlKpHFmom2glzS8HlCBbQ0QyJ5TvKCcqipOJoy0jGqQAvxeefZokR9j5jm
         /bn4vHpaN/gCk4ZNaZ3WBAJoIrNboB86IhtFDdWLp71w8iJG+MAgln4E6yqAa+mmmdKD
         syOK6k/j6YeI266s13mmByd230P5rFr/ybBNLlrN7a1DJ8ZEoFIqWv4pvhGJ/cjteNIS
         +0WpXfWFU0u9n/Xx6utYEyWXtHJ/aBZkS20bnmOwueXgakDQwWwCB++34r/yfv7bOgOL
         +nEVyy8CseYx2Jb1uNyLh28FfVo2jgZLrxrU9Yt2XD8wqger84ZYmP0Job5/jFgZsWnY
         GOYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW02EGMT+ZLJaiPlKHPJchqr0mUC3+uFXbLGbOuub8p3tJnSgsJ75TgXdOnm8ZQQlvPfVKc0ANVtadkDIn/vs8ikAepVj4qMrPGpPU=
X-Gm-Message-State: AOJu0YyBZS9+imlDQZml63PGp2CbQwIvkxlpgbcDyNlZXRk3wyIDyJ0i
	IYHSw9szTHK976FhPmA7oW6Jtqk+iiYmAaQSedFekLFpIb8Ja07L
X-Google-Smtp-Source: 
 AGHT+IE3gmJUIvul4S1O2zw/h8rOZCXQEQULnqDXXH8/XuEr0PvPCteVwNCcdD28vdmFGEI5XQNy4Q==
X-Received: by 2002:a17:906:48d8:b0:a59:a7b7:2b8e with SMTP id
 a640c23a62f3a-a62643e0787mr323899366b.29.1716643686789;
        Sat, 25 May 2024 06:28:06 -0700 (PDT)
Received: from hex.my.domain (83.8.128.191.ipv4.supernova.orange.pl.
 [83.8.128.191])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626cda46e1sm251842566b.196.2024.05.25.06.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 May 2024 06:28:06 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH v4 0/9] ASoC: samsung: midas-audio: Add GPIO-based headset
 jack detection
Date: Sat, 25 May 2024 15:28:04 +0200
Message-Id: <20240525-midas-wm1811-gpio-jack-v4-0-f488e03bd8c7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGTnUWYC/3XNTQrCMBCG4atI1kYySUyrK+8hLppJ2o7aHxqpS
 undTQtCFbp8P5hnBhZ8Rz6w42Zgne8pUFPH0NsNwzKrC8/JxWZSSC32QvKKXBb4s4IUgBctNfy
 a4Y1bEFIaC4lHZPG47XxOrxk+X2KXFB5N957/9DCtX1KtkT1wwX2KzllnErT5qagyuu+wqdhE9
 nLJpKuMjIzVThl0QqLx/4xaMHBYZVRkBEKiDGiN4ocZx/EDd8zgKEoBAAA=
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716643685; l=3607;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=4zLRKryEPEhLxtkijn6RbgJhMMJkRIFlKDleLaNwm/A=;
 b=lzS2mNI5ljRanb1yQ0vamjZSFmy4b2nQZa2vjTwXuGZWExrbMpjflCts+SmNj5dVCDUH3E5rg
 KYPnEJ0mCskCVn7yrDhQ8xurQgoxPydl+59q6OdsOXxiyIy1A3xjv1t
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-MailFrom: aweber.kernel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 7THJ5RXFAVXTJJE4GLIFMONBNMC7GOCX
X-Message-ID-Hash: 7THJ5RXFAVXTJJE4GLIFMONBNMC7GOCX
X-Mailman-Approved-At: Thu, 13 Jun 2024 15:51:03 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7THJ5RXFAVXTJJE4GLIFMONBNMC7GOCX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Many of Samsung's Exynos 4 devices share the same midas-audio driver
to handle the codec setup. While most of these devices, including the
Midas itself, use the jack detection provided by the WM8994 driver,
other devices such as the Samsung Galaxy Tab 3 8.0 (lt01) use two GPIOs
and an ADC channel to determine jack insertion, the jack's type, and
button presses (for headsets with volume up/down/play buttons).

In the downstream kernel, this behavior is implemented in the sec-jack
driver[1], and the per-device settings are configured in *-jack.c files
in the mach folder (see e.g. the Tab 3's implementation[2]).

This patchset implements this mechanism in the midas_wm1811.c driver,
and adds new DTS options to allow for its configuration. It also
enables jack detection for the Samsung Galaxy Tab 3 8.0.

A very similar mechanism was already present in the aries_wm8994.c
driver[3]; this implementation heavily borrows from it, though there
are a few extra cleanups as well.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>

[1] https://github.com/gr8nole/android_kernel_samsung_smdk4x12/blob/lineage-14.1/drivers/misc/sec_jack.c
[2] https://github.com/gr8nole/android_kernel_samsung_smdk4x12/blob/lineage-14.1/arch/arm/mach-exynos/tab3-jack.c
[3] https://github.com/torvalds/linux/blob/master/sound/soc/samsung/aries_wm8994.c

---
Changes in v4:
- Replaced manual regulator toggles with SND_SOC_DAPM_REGULATOR_SUPPLY,
  both for existing mic bias regulators and for the new headset mic bias
  regulator
- Link to v3: https://lore.kernel.org/r/20240519-midas-wm1811-gpio-jack-v3-0-0c1736144c0e@gmail.com

Changes in v3:
- Re-added pipe (|) character to samsung,headset-button-threshold-microvolt
  description to prevent it from being parsed as a mapping (fixes syntax
  error)
- Split out "ASoC: dt-bindings: samsung,midas-audio: Add GPIO-based headset
  jack detection" into two patches
- Link to v2: https://lore.kernel.org/r/20240508-midas-wm1811-gpio-jack-v2-0-b4d36cd02c6e@gmail.com

Changes in v2:
- Added vendor prefix to threshold properties
- Added separate headset mic bias regulator
- Changed some cases of dev_err + return with return dev_err_probe
- Added an extra patch to replace some previous dev_err + return cases
  with dev_err_probe
- Moved tab3 DTS wm1811 codec config changes to separate commit

---
Artur Weber (9):
      ASoC: dt-bindings: samsung,midas-audio: Add headset mic bias supply
      ASoC: dt-bindings: samsung,midas-audio: Add GPIO-based headset jack detection
      ASoC: samsung: midas_wm1811: Use SND_SOC_DAPM_REGULATOR_SUPPLY for bias regulators
      ASoC: samsung: midas_wm1811: Add headset mic bias supply support
      ASoC: samsung: midas_wm1811: Add GPIO-based headset jack detection
      ASoC: samsung: midas_wm1811: Use dev_err_probe where appropriate
      ARM: dts: samsung: exynos4212-tab3: Fix headset mic, add jack detection
      ARM: dts: samsung: exynos4212-tab3: Add MCLK2 clock to WM1811 codec config
      ARM: dts: samsung: exynos4212-tab3: Drop interrupt from WM1811 codec

 .../bindings/sound/samsung,midas-audio.yaml        |  33 ++
 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi     |  31 +-
 sound/soc/samsung/Kconfig                          |   2 +-
 sound/soc/samsung/midas_wm1811.c                   | 348 +++++++++++++++++----
 4 files changed, 343 insertions(+), 71 deletions(-)
---
base-commit: a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6
change-id: 20240502-midas-wm1811-gpio-jack-b10226b17ecc

Best regards,
-- 
Artur Weber <aweber.kernel@gmail.com>

