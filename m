Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EED8BFD85
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 14:45:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18EB7950;
	Wed,  8 May 2024 14:45:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18EB7950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715172325;
	bh=yeOI4X99Sc7Swlz3qKg+Cc6O9KkBtF41vdppAyeJnxM=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vAAL/LliAR/De+IY5bPscMU7B9rRcT3lvT9XMlfi6gz+xe+PxE8Io3TG20+eQ63BY
	 zLsXSzoSpRIMPrDASLPP78cnzFdnAZbnQIJEhu69zGsUf2Cxt8BMtcn0mlH/bMjca9
	 peKG/vKGEM/wQ7qSaLR6upUGbHyUqHiBdxKvC/yo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4749F8057F; Wed,  8 May 2024 14:44:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A7CAF804E7;
	Wed,  8 May 2024 14:44:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 907ADF8049C; Fri,  3 May 2024 20:55:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 86BB7F800E2
	for <alsa-devel@alsa-project.org>; Fri,  3 May 2024 20:55:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86BB7F800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=VPd2V2J9
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a599a298990so210817466b.2
        for <alsa-devel@alsa-project.org>;
 Fri, 03 May 2024 11:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714762521; x=1715367321;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EnxMYqw83s5oEuRsJKXGuOf6rkwvSd9+11+j63EQ1rg=;
        b=VPd2V2J9PiP5WxUPmYcjiDQ5bMUTc6jfl2JZQn1G7iA/5FqjAO3P7vhbmnWWDFT7lm
         my9QukA0TUxD5ZV8ixr+nzAvtqXfaps4OOvTLLv9Mm90hZLWbf18WaU1IFw2RDlZFvla
         Hwnb7nipgXl3uJc++7nYfnkNRWKuoqdz6Dfd7FFpyTSzNnk9L0um8bqOMYAMe7mE/QZ6
         fh64PDJ84zLT2fLiVoIfq+ppUPJqUcXNB7JWf2SGJepJml8i7dh1UckESgMLawm1H1M+
         KHLeP3+fsJcsDzhMpcFzehbZakgs94w8VqONMBzsGtxr9y+8pRqcmoVrEjVkAU5xYRwx
         o15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714762521; x=1715367321;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EnxMYqw83s5oEuRsJKXGuOf6rkwvSd9+11+j63EQ1rg=;
        b=JOa49FkufbrLJnBvwc/Uu7XqH4/OakPVuDn37JZmx4HDb5S7RtiNgcUBa/ObYzfzMu
         VJrR2WUUPLDtACHiR4bURyzQcv8bSbhfDCcVOFeN9ubnv4tInoZ8g77ZSPdOEUrXXZ9W
         MhGu3RjQkhC9og6k8FHuVZpaAatJXYubPtLL0anTPwtMsbwFpjboeWICJOCwgGot1PF9
         WFBMeyKp8GcCEkMz+1BrgBpC//4xg/oGohqqdI5rDy1dBaT44mPSEM+6LA+6TjIjmZri
         Bk9Wf2shpmmPzMiI3wqVIGCUP76a7yiDibFB74vygCkPljk763wSUQMLydFbtlR/+5mP
         9YzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvXwq5fEDVFeYC9tFi7EvVDYp3ET6k/FNYK4xmr713EI0ecBSgNYiNO5zPNlzJU8csugReuPoNQVL5DS2P2W5ILAH3E5yYT44R/C8=
X-Gm-Message-State: AOJu0Yy3fYPyuWAEYnH+azHwTnz/eMEr59RbqaFFXip9qb59HgB0m0R2
	0558ltZ5QoMEfzWk0laRinM7YbU+KHtwZmv7rR4fhGSguN47Voe6
X-Google-Smtp-Source: 
 AGHT+IEQB6b4e3H38yp9btaJmIcRDwe/VCwFfyZT9AmvoljLIJT+ZBSK9hkBuHY8WT6rNnvO1Y6fxA==
X-Received: by 2002:a17:906:4f0f:b0:a55:65e6:ce9f with SMTP id
 t15-20020a1709064f0f00b00a5565e6ce9fmr2326939eju.20.1714762520609;
        Fri, 03 May 2024 11:55:20 -0700 (PDT)
Received: from hex.my.domain (83.25.185.84.ipv4.supernova.orange.pl.
 [83.25.185.84])
        by smtp.gmail.com with ESMTPSA id
 l8-20020a170906078800b00a598d3ddf8dsm1104618ejc.28.2024.05.03.11.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 11:55:20 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH 0/3] ASoC: samsung: midas-audio: Add GPIO-based headset
 jack detection
Date: Fri, 03 May 2024 20:55:10 +0200
Message-Id: <20240503-midas-wm1811-gpio-jack-v1-0-e8cddbd67cbf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA4zNWYC/x3MSQqAMAxA0atI1gaa4IRXERe1Ro3iQAsqiHe3u
 HyL/x8I4lUC1MkDXk4Num8RlCbgJruNgtpHAxvOTG4YV+1twGuligjHQ3ecrVuwI8NcdFSKcxD
 jw8ug9z9u2vf9AMBerkRoAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714762519; l=2127;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=yeOI4X99Sc7Swlz3qKg+Cc6O9KkBtF41vdppAyeJnxM=;
 b=CVtRwrW63dzCjdHMfuym89IrHMx7aKfSUuB173VVInw9/mE4o5Hyn8+yEyj8S7B5FKza+8hMV
 vXsUAqf9GV9CDmsqN7xyKlhXEfIeHB6rEq3lsoLMY/Om4x1ZtLbpKOW
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-MailFrom: aweber.kernel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: YKKSCPJLMRCVE7IU4F7NN5CZ3E6FJ5JV
X-Message-ID-Hash: YKKSCPJLMRCVE7IU4F7NN5CZ3E6FJ5JV
X-Mailman-Approved-At: Wed, 08 May 2024 12:44:50 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YKKSCPJLMRCVE7IU4F7NN5CZ3E6FJ5JV/>
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
Artur Weber (3):
      ASoC: dt-bindings: samsung,midas-audio: Add GPIO-based headset jack detection
      ASoC: samsung: midas_wm1811: Add GPIO-based headset jack detection
      ARM: dts: samsung: exynos4212-tab3: Fix headset mic, add jack detection

 .../bindings/sound/samsung,midas-audio.yaml        |  30 +++
 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi     |  23 +-
 sound/soc/samsung/Kconfig                          |   2 +-
 sound/soc/samsung/midas_wm1811.c                   | 265 ++++++++++++++++++++-
 4 files changed, 305 insertions(+), 15 deletions(-)
---
base-commit: e67572cd2204894179d89bd7b984072f19313b03
change-id: 20240502-midas-wm1811-gpio-jack-b10226b17ecc

Best regards,
-- 
Artur Weber <aweber.kernel@gmail.com>

