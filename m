Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD837E53FE
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Nov 2023 11:45:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE4D36C1;
	Wed,  8 Nov 2023 11:44:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE4D36C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699440307;
	bh=AyLQCLU2X46/ZycRif1EZurFjQeuSY/k1tMBeCN4eS8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZBpCIRfjqBZLkhDFaZoyNA8nkctFwKK+Jr0ryU5/ii1iMMjX4rIYAex3gKIO4iIRg
	 yA1LO94E2Unsz1X9BWSaQZACYXOgv9ItJymmJ5t5Cn9gFdBs3vTuo8VZ5fI1oz1yi4
	 4sAHoCF4yUsQyxUzMW0mIFON4NV0QNTy7v2+RN+0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1761FF804DA; Wed,  8 Nov 2023 11:44:13 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 48071F800ED;
	Wed,  8 Nov 2023 11:44:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7F7FF804DA; Wed,  8 Nov 2023 11:44:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 49F89F800ED
	for <alsa-devel@alsa-project.org>; Wed,  8 Nov 2023 11:43:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49F89F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=roqpFb53
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4083cd3917eso51187115e9.3
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Nov 2023 02:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699440235; x=1700045035;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VTczEAqOVbvVARsgwQf+QqYx6Pwq1efdiOYWiIKMhjk=;
        b=roqpFb53CY4h9FbQ3L4Tuz41Qf7Lmm42vlfIxUuwDdNDw4+CoMzbFGb/ULlXsMlhku
         KBlA+HXW232DzpmAtEltPPQ2ybOUwVKo1RLX1BNVQbjO6oa34xQ5D8StAb+oxdJjZgav
         u/AID8Qtopn5XWrGhVDz/J9RMUBVGUlOtYztIKe/RxNROUoPlsKSchy9RX71rYAjQxlU
         A7aLXSVWvDaVUrmceQoNkApNs2eZpzRqaP0nCn5jh7wMx4N0+LR+MXxBl4wSfVc3EHaM
         Ev3jJ1dxO+giNBid9gJul2hZALxEGGDjKW1A6CNTkbiD7oyhzgYPlDaWlOoJuix65+Zy
         ej0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699440235; x=1700045035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VTczEAqOVbvVARsgwQf+QqYx6Pwq1efdiOYWiIKMhjk=;
        b=PRtqnSXC/oYDlG0RYrQFcyHA2yritDHo6vROXAc70pj+ZTTviVGRrXawe2DPCM8xWR
         j919h/8xrHCTF8VS5STlcOVmwtc8BO+Kz3pdZFpNBSdOQ3YIKzGlEMAJKXDhN9cNjTuR
         qw1VaUqygSVIO9RLrHV4/lvSAKET7CN3LrucgskoSWjLOs0EKI8sN/Cg3ZTwMTX6Chh/
         FxZ/upFPDhZMa0yq3GnEDYrCTyFCq6D8Xy6qewo0Zl+3vxVWKtYiFEf66ACVgok24470
         awAGeTPqvITl5Pqh/UTdrRjRlm5aXMId2qQloWhvMKMO8szRLmdlsN04YN8ta7164IA/
         BbFg==
X-Gm-Message-State: AOJu0YyOAc7KYaAwzOMXHyImitx+hHXfHpOxlLQ4zp+/Z0ZqKwc2isQ5
	I7baydh82Eevj9QTMWHZ92N3GA==
X-Google-Smtp-Source: 
 AGHT+IHiDWmBeuBOZUqxDCJkN9irswNWvo/qNXRb1omqiS2LAbu6ncxcqqv9pqzxYLbz6uacwStwug==
X-Received: by 2002:a05:600c:5113:b0:405:336b:8307 with SMTP id
 o19-20020a05600c511300b00405336b8307mr1360908wms.7.1699440234966;
        Wed, 08 Nov 2023 02:43:54 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id
 fj12-20020a05600c0c8c00b004094c5d92bdsm19377377wmb.31.2023.11.08.02.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 02:43:54 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Lee Jones <lee@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-serial@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/17] dt-bindings: samsung: add specific compatibles for
 existing SoC
Date: Wed,  8 Nov 2023 11:43:26 +0100
Message-Id: <20231108104343.24192-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: P7MU53AYOXWKRPYGKK5TW64WHR2SLN4C
X-Message-ID-Hash: P7MU53AYOXWKRPYGKK5TW64WHR2SLN4C
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P7MU53AYOXWKRPYGKK5TW64WHR2SLN4C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

Merging
=======
I propose to take entire patchset through my tree (Samsung SoC), because:
1. Next cycle two new SoCs will be coming (Google GS101 and ExynosAutov920), so
   they will touch the same lines in some of the DT bindings (not all, though).
   It is reasonable for me to take the bindings for the new SoCs, to have clean
   `make dtbs_check` on the new DTS.
2. Having it together helps me to have clean `make dtbs_check` within my tree
   on the existing DTS.
3. No drivers are affected by this change.
4. I plan to do the same for Tesla FSD and Exynos ARM32 SoCs, thus expect
   follow up patchsets.

If folks agree, please kindly Ack the patches.

Description
===========
Samsung Exynos SoCs reuse several devices from older designs, thus historically
we kept the old (block's) compatible only.  This works fine and there is no bug
here, however guidelines expressed in
Documentation/devicetree/bindings/writing-bindings.rst state that:
1. Compatibles should be specific.
2. We should add new compatibles in case of bugs or features.

Add compatibles specific to each SoC in front of all old-SoC-like compatibles.
This will also help reviews of new code using existing DTS as template.  No
functional impact on Linux drivers behavior.

Future
======
If reasonable, I will do similar work for Tesla FSD and ARMv7/ARM32 Exynos
bindings and DTS.

Best regards,
Krzysztof

Krzysztof Kozlowski (17):
  dt-bindings: hwinfo: samsung,exynos-chipid: add specific compatibles
    for existing SoC
  dt-bindings: i2c: exynos5: add specific compatibles for existing SoC
  dt-bindings: i2c: samsung,s3c2410-i2c: add specific compatibles for
    existing SoC
  dt-bindings: mmc: samsung,exynos-dw-mshc: add specific compatibles for
    existing SoC
  dt-bindings: pinctrl: samsung: add specific compatibles for existing
    SoC
  dt-bindings: rtc: s3c-rtc: add specific compatibles for existing SoC
  dt-bindings: serial: samsung: add specific compatibles for existing
    SoC
  dt-bindings: samsung: exynos-pmu: add specific compatibles for
    existing SoC
  dt-bindings: gpu: arm,mali-midgard: add specific compatibles for
    existing Exynos SoC
  dt-bindings: iio: samsung,exynos-adc: add specific compatibles for
    existing SoC
  ASoC: dt-bindings: samsung-i2s: add specific compatibles for existing
    SoC
  dt-bindings: pwm: samsung: add specific compatibles for existing SoC
  arm64: dts: exynos5433: add specific compatibles to several blocks
  arm64: dts: exynos7: add specific compatibles to several blocks
  arm64: dts: exynos7885: add specific compatibles to several blocks
  arm64: dts: exynos850: add specific compatibles to several blocks
  arm64: dts: exynosautov9: add specific compatibles to several blocks

 .../bindings/gpu/arm,mali-midgard.yaml        |  5 ++
 .../hwinfo/samsung,exynos-chipid.yaml         | 17 +++++-
 .../devicetree/bindings/i2c/i2c-exynos5.yaml  | 10 +++-
 .../bindings/i2c/samsung,s3c2410-i2c.yaml     | 22 ++++---
 .../bindings/iio/adc/samsung,exynos-adc.yaml  | 29 +++++----
 .../mfd/samsung,exynos5433-lpass.yaml         |  2 +-
 .../bindings/mmc/samsung,exynos-dw-mshc.yaml  | 25 +++++---
 .../samsung,pinctrl-wakeup-interrupt.yaml     | 24 +++++---
 .../bindings/pinctrl/samsung,pinctrl.yaml     |  3 +-
 .../devicetree/bindings/pwm/pwm-samsung.yaml  |  2 +
 .../devicetree/bindings/rtc/s3c-rtc.yaml      |  5 ++
 .../bindings/serial/samsung_uart.yaml         | 14 ++++-
 .../bindings/soc/samsung/exynos-pmu.yaml      |  6 ++
 .../bindings/soc/samsung/exynos-usi.yaml      |  2 +-
 .../bindings/sound/samsung-i2s.yaml           | 19 +++---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi    | 60 ++++++++++++-------
 arch/arm64/boot/dts/exynos/exynos7.dtsi       | 18 +++---
 arch/arm64/boot/dts/exynos/exynos7885.dtsi    | 45 +++++++++-----
 arch/arm64/boot/dts/exynos/exynos850.dtsi     | 34 ++++++-----
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi  |  6 +-
 20 files changed, 233 insertions(+), 115 deletions(-)

-- 
2.34.1

