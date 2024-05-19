Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CC08CB009
	for <lists+alsa-devel@lfdr.de>; Tue, 21 May 2024 16:07:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E529C950;
	Tue, 21 May 2024 16:07:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E529C950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716300445;
	bh=vOmrQBJAdvlGhlh3IQuJFC5nzf12tuwIUaUkDgVZRHA=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=MtX8WL4RwCffVupc0zlbpmCzTHx+yvZmDB1kJUDJKzZ+4FqQxTFcxZiJVZfSej0jL
	 Vjj9+CoJll6hgnZ2IJMQ6eJjDw3S9oyfav0piJ8GnTzMdFM++n1V7tKhWiEpHNL+d9
	 RRoPDf0J1rq0KTsZuFztPmjVa3tJntsYLGS/VJ0A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C60ECF805D2; Tue, 21 May 2024 16:06:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94532F805C6;
	Tue, 21 May 2024 16:06:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46871F8026A; Mon, 20 May 2024 16:43:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9189EF8016B
	for <alsa-devel@alsa-project.org>; Mon, 20 May 2024 16:43:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9189EF8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=d3fRiRaD
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5238fe0cfc9so2623996e87.0
        for <alsa-devel@alsa-project.org>;
 Mon, 20 May 2024 07:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716216210; x=1716821010;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vw+eqC8qYyRv3MIYCjMkS6Jwy9w22sYSmCr6FUkRoZQ=;
        b=d3fRiRaDSqyIMGqgixi8SqLElKyhhPaZ20pAhrFxpsURwirSplhUP08uWE7Ye6NtxV
         7+PZY0nf1U1spc56KbQcHWeNBiJIky39ZY5jackXPZxsmfVsr1u8zChncESMH/Y2AlpH
         8PvxtNE2BHG/7021KpgOUx+H/oGsgwLWj500B+cZet10+qQ6PF5rmwPxj3MkCzz3T1+t
         X/+k7hcv7r/c3hr6TLMPdEhhMDx1reQkv2m2TozDB8EXWwD4WHtgaORkWDlgJnujXpG0
         rntq7xSESStP9MxSbQDxJWNnOa3M5xBMk6d6Kbzf1iarVQaMwOs2IvqoT8Vxjwz7wEwc
         yYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716216210; x=1716821010;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vw+eqC8qYyRv3MIYCjMkS6Jwy9w22sYSmCr6FUkRoZQ=;
        b=I0OpOwBBoEzYTQAh3WdfUCKklK0yyYVxF1D4kIvtTUs+pNWyAfx5g4h2GNIj0F7MLe
         xLd+y57M7hQ7SjHyocKeqGkrAzpv+HZLP7MjMMDwzINgOIit3XO4L8gWUuJV12w3WxCj
         8Ae5AKgVwPGyC2qJDr4wpdbSVXqArbA13QwxuZb1HFvRobQ1ESJjk+ISnM9bdDFUGSkH
         oqGwz4qEcO7ny0qChT66fgWH/Q59lCFMx7BDnRL8QZySRyiLjVL2cy2LsKNX722J91kn
         YlIJbX/iBAIleV5Diu/etNSgiW34ppy3+5/sXCRnACes+wVqazSUomgnzBt1kjn8Nv6O
         D++Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5qNp/axoRBCpQZBf0wsbunJm+dF2KbvpPQPchPkJzUvplEG7YH0ha9DfBTXgkVLdFM+BrgFohgRnaiLGRbUnCfPmdlIPwK7buUt8=
X-Gm-Message-State: AOJu0Yxyl7yNAuChcTcZs2vGdW1NqE0Sl/QHox/GAgvKoWq7+kSmIr81
	5Kuk16A4NniVj4+xNfxhsZJDwenPLdjh0hsDd62x4C4q+hx77vkR+RsWBQ==
X-Google-Smtp-Source: 
 AGHT+IFTKZlj4vaDpbFg3ISEA24rKauu3cUeaZy4+4egT5W58uNnkMk5KIUOqtmg4LEoq7V+gTWqYA==
X-Received: by 2002:a05:6402:2695:b0:575:2c30:fe60 with SMTP id
 4fb4d7f45d1cf-5752c30ffa6mr2896233a12.10.1716106688326;
        Sun, 19 May 2024 01:18:08 -0700 (PDT)
Received: from hex.my.domain (83.8.125.62.ipv4.supernova.orange.pl.
 [83.8.125.62])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733c34e5ccsm13698518a12.95.2024.05.19.01.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 01:18:07 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH v3 0/8] ASoC: samsung: midas-audio: Add GPIO-based headset
 jack detection
Date: Sun, 19 May 2024 10:17:46 +0200
Message-Id: <20240519-midas-wm1811-gpio-jack-v3-0-0c1736144c0e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKq1SWYC/3XN0Q6CIBTG8VdxXEcDNHRd9R6tCzigngpx0Kjmf
 PfQrc0bL//fdn5nItEGtJGci4kEmzCiH3KUh4JAr4bOUjS5iWCiYicmqEOjIn073nBOuxE9vSt
 4UM2ZEFLz2gKQfDwG2+Jnha+33D3Glw/f9U/iy/onyz0yccqobcAYbWQNur10TuHzCN6RhUxiy
 zS7jMiMrkwpwTAB0m6ZeZ5/MwkqeAMBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716106686; l=3238;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=vOmrQBJAdvlGhlh3IQuJFC5nzf12tuwIUaUkDgVZRHA=;
 b=8XirlovSgTFuyZInY7Ney+LFvrii3NLSjBFIG6JDVzAN3bhN/OId1rINWfUWRG1PFIHDFLUdO
 lmlBKecojj/BNO4y0F+SmsaVzGnzByslst8HeezuK6mh6DPNsON2UNI
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-MailFrom: aweber.kernel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: CSVFNK6JHH4MMMTQQJSSO2U3LU4FBQMF
X-Message-ID-Hash: CSVFNK6JHH4MMMTQQJSSO2U3LU4FBQMF
X-Mailman-Approved-At: Tue, 21 May 2024 14:06:38 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CSVFNK6JHH4MMMTQQJSSO2U3LU4FBQMF/>
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
Artur Weber (8):
      ASoC: dt-bindings: samsung,midas-audio: Add headset mic bias supply
      ASoC: dt-bindings: samsung,midas-audio: Add GPIO-based headset jack detection
      ASoC: samsung: midas_wm1811: Add headset mic bias supply support
      ASoC: samsung: midas_wm1811: Add GPIO-based headset jack detection
      ASoC: samsung: midas_wm1811: Use dev_err_probe where appropriate
      ARM: dts: samsung: exynos4212-tab3: Fix headset mic, add jack detection
      ARM: dts: samsung: exynos4212-tab3: Add MCLK2 clock to WM1811 codec config
      ARM: dts: samsung: exynos4212-tab3: Drop interrupt from WM1811 codec

 .../bindings/sound/samsung,midas-audio.yaml        |  33 ++
 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi     |  31 +-
 sound/soc/samsung/Kconfig                          |   2 +-
 sound/soc/samsung/midas_wm1811.c                   | 343 +++++++++++++++++++--
 4 files changed, 379 insertions(+), 30 deletions(-)
---
base-commit: e67572cd2204894179d89bd7b984072f19313b03
change-id: 20240502-midas-wm1811-gpio-jack-b10226b17ecc

Best regards,
-- 
Artur Weber <aweber.kernel@gmail.com>

