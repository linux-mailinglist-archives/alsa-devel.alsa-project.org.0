Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0498BFDC2
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 14:53:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F42993A;
	Wed,  8 May 2024 14:53:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F42993A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715172814;
	bh=r5VX4FkZssbN7CluXLWuH6JvBu0lDlmJiHnKY2yOe2I=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=RZul01XACN4MdoI8Gd3w654803deOodEoyDUUPLcVt+IfkpMcuyInUAOcOl12Mrz5
	 JJNfIL7yoTH9vB8pBMZjwV4FCfPBStjMmsTh/OlFqNxYqBmGYcm8Ktjrl4RPJ6bzDD
	 ZUnZJTWtQGXrS/+MJ/XlPWPVTyn/YBaxS/wvE29E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D1BEF8068E; Wed,  8 May 2024 14:51:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A0039F80676;
	Wed,  8 May 2024 14:51:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8126EF80571; Wed,  8 May 2024 13:01:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 57434F800E2
	for <alsa-devel@alsa-project.org>; Wed,  8 May 2024 13:01:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57434F800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=SyCqm22r
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a59c0a6415fso971177566b.1
        for <alsa-devel@alsa-project.org>;
 Wed, 08 May 2024 04:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715166078; x=1715770878;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nLUfxm5MoMUpMeCDhK5Bz2fJOiPFk2NnRkp477QVdeE=;
        b=SyCqm22rQF+yadiM2ksEp0b2wz4jGXcTHsXEroH8WsKiBYFYEJbU6c0XVj2ygO//Yj
         DQa5EXUWvJ81IozxzuI2nMKd2UQilQQExgTLlLDsyHvRmbihru/SZa5pfHNLi/YvwG41
         EDrpzW+BFHfvBJZA6+ubkrT7OfCELEaeCM4+zhHe1IACuiUtPIqNy4HzvWVDoLJz/rGB
         JrCGLNKwgU83jgFCSqor2UkZ/xXq1w2+SQ6FzY7dDYgSHYoyDWm7Tg50oe9OCapkqQuz
         LEAITtRwJ8s2X+OTJAZ8edBoUlSRvh5oq2hn4WhUgmO37XAGPlIg3+YF2ekBwdLkGlGq
         AMLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715166078; x=1715770878;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nLUfxm5MoMUpMeCDhK5Bz2fJOiPFk2NnRkp477QVdeE=;
        b=trgTKb6qsu3aURw4A7tXSG8U9YhUwhOGccIvt5BhKwnVszblMSa0lMw6OwamHkd/0F
         D4ii1RIpWL/cXke5xFUWOyv2AzGyMYsgykVlH+7MUBARI9T1hW+GtN1xpi8DiZRj32b/
         qyY6Y7qrxYYZtk4gGSbC8ila1er7klPvCNQSyqLkK0EOQhDLzKBvi1UEx2IqThzqJ1UQ
         BjUgGTjpM6yEfswp/7DwDfVetchRc1dMvT+TA0no0R8yBr9O9m76XtLo8yD6mo4ix5Ze
         V3nfdZ9CJ38kTAknLNPxUzt3XN5jS1RYucBBjfEej9Bo0R4kpyTaKArOaMT4K8Ko9QtQ
         cdcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXx5SKd1GNHt7HQn2rgcPkKGApDJN7Zuq6r+UV5A68OVPwuyRcvY+YVWGpNDjddUVf598cHskwPUXOv5S+ndfiFKZy6OgUdaKAxP20=
X-Gm-Message-State: AOJu0YyzBjOdYNtkitG/a0TrFMn384h6EMrhu43utd5n6dEDHr0LC9yy
	Dnv5axlckltu3y8EkSUNkDGelrngGWPZsA06Gyp3Bw2wo35EwcCz
X-Google-Smtp-Source: 
 AGHT+IE8hv2zDJ3LkL3ncFxb3Ha6bL6EU12va4uVfT4eJ+Rn37xQs/HDgl9eOJT08amMnIDxyvOygA==
X-Received: by 2002:a50:d5da:0:b0:572:32e4:daca with SMTP id
 4fb4d7f45d1cf-5731d9f1f1emr1431811a12.25.1715166077915;
        Wed, 08 May 2024 04:01:17 -0700 (PDT)
Received: from hex.my.domain (83.8.126.253.ipv4.supernova.orange.pl.
 [83.8.126.253])
        by smtp.gmail.com with ESMTPSA id
 m6-20020a056402510600b005726b58a436sm7455793edd.30.2024.05.08.04.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 04:01:17 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH v2 0/7] ASoC: samsung: midas-audio: Add GPIO-based headset
 jack detection
Date: Wed, 08 May 2024 12:58:48 +0200
Message-Id: <20240508-midas-wm1811-gpio-jack-v2-0-b4d36cd02c6e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOhaO2YC/3WNQQ6CMBBFr0K6dkynKhBX3MOwaKcFRi0lrUEN4
 e5WEpcu30v++4tILrJL4lwsIrqZE4cxg9oVggY99g7YZhZKqqM8SQWerU7w9FgjQj9xgKumGxi
 USpUGK0ck8niKruPXFr60mQdOjxDf28+MX/tLHv4lZwQJriZrjS0rMl3Te833PQUv2nVdPxCQI
 ZG8AAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715166076; l=2757;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=r5VX4FkZssbN7CluXLWuH6JvBu0lDlmJiHnKY2yOe2I=;
 b=efwB+kVCs/L/SZZaODuzZbKPTctk3zichDAOp2lR+DvHFC7GKEvMKy77JrMEeOY/zvUyB2G1z
 5nECFtfNyNpAk5lJ8jrkQdC6RykE44TaxW2X4Fe0ZihcEigyUe8jgwR
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-MailFrom: aweber.kernel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 6TC427RQVPAQLZK4AM5J67RRYOBV3RCT
X-Message-ID-Hash: 6TC427RQVPAQLZK4AM5J67RRYOBV3RCT
X-Mailman-Approved-At: Wed, 08 May 2024 12:51:30 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6TC427RQVPAQLZK4AM5J67RRYOBV3RCT/>
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
Changes in v2:
- Added vendor prefix to threshold properties
- Added separate headset mic bias regulator
- Changed some cases of dev_err + return with return dev_err_probe
- Added an extra patch to replace some previous dev_err + return cases
  with dev_err_probe
- Moved tab3 DTS wm1811 codec config changes to separate commit

---
Artur Weber (7):
      ASoC: dt-bindings: samsung,midas-audio: Add headset mic bias supply
      ASoC: dt-bindings: samsung,midas-audio: Add GPIO-based headset jack detection
      ASoC: samsung: midas_wm1811: Add headset mic bias supply support
      ASoC: samsung: midas_wm1811: Add GPIO-based headset jack detection
      ASoC: samsung: midas_wm1811: Use dev_err_probe where appropriate
      ARM: dts: samsung: exynos4212-tab3: Fix headset mic, add jack detection
      ARM: dts: samsung: exynos4212-tab3: Fix up wm1811 codec config

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

