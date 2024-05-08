Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F028BFDC4
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 14:54:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43ADD3E7;
	Wed,  8 May 2024 14:53:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43ADD3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715172849;
	bh=x4CRj3HPQjjxV02Uhbn39jzTSMCqAM5BsNr5zZc40mM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KKCLkNAUqdww5E7x01BPY0Smn+W4whNKCvXpQJFbVheBapcETpcgL2GmZgYHX0lnB
	 oWflBpqN0JmH3Leutvwe97BZkWYOCF46c1gLjX5OYVwkXOtxb/mazOkYzi8yGRoitr
	 eyzftIA0v/Uel0W2/0WhGWMYvwEUneTtI6tLKeao=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3357EF804E7; Wed,  8 May 2024 14:51:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C721F806CD;
	Wed,  8 May 2024 14:51:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80F08F80564; Wed,  8 May 2024 13:01:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4E587F80423
	for <alsa-devel@alsa-project.org>; Wed,  8 May 2024 13:01:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E587F80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=HtRCNnOJ
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a59cc765c29so783224466b.3
        for <alsa-devel@alsa-project.org>;
 Wed, 08 May 2024 04:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715166080; x=1715770880;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bT4moxnFWMX+ROOOxuh3w595mSjqjEQ1yI4SN/pV6pw=;
        b=HtRCNnOJsWYUHtXXGYmvCNH1vIBIzhpCXmWv2L6J6WdYXsMzXLxVBTesotGhS2X6rd
         XTZpCdKUngsU5X+xZjGtOi9B3kDKRYP4qB6Zg8FPUSZHeMBw2AdweWJyeLf8dGYFVKjW
         TXS23aSgOAaLGgh3otWT9aoYdXPG+RZiWtAlOZsmWBk4tZ9NRMk/IE9rp4EhU9vPzgLI
         sW3XLMrx88UU8VPJNF1PVnVSdB5gLwRK8JeXT33UVwBvv4UVSdw3dE4vLtJ5ZkSZ4ah8
         nsHN5v4sL/97ud3y8x8F82Sc8IBWV8HSpHxxL5y8gK6Fp2caJspMtL9vhRTGFw/4u5iZ
         3qIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715166080; x=1715770880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bT4moxnFWMX+ROOOxuh3w595mSjqjEQ1yI4SN/pV6pw=;
        b=Efuvg5vlml2toxGLwS4DJ/8gufH5vIo8/3nV1h6TxmOqhBadExd9bOTGyV2mnO8LlE
         /cPrtIm+OyVnb6T3cUMOfw+UFJ+ccyMEwczqc5dv0duTQihrZbmZ6IpKegpdKvn+eV1i
         ilsqbeKNO0Fjx8nHgDFyVyIG8UlkoPbfmQtRKZ96/itYPX86M25OWs4lM6OgnRgqcL+0
         LQTxB1jskcXMrOZ/lhWlFidJ+/9jGwD+W/PrGxIymfkmt9HoDTGS4QibrBcrbH2Amewq
         iVq/RY/pvzMpSCpKGeTLO22LdgzNaLi8Fsp+Twk0EgxBaNhRODABMfHLvHz6CZG1k0ON
         3Dtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZpEMMUqnZZDghoz88EsjqfTaX9udQ7AlCJFM+RATAt9TGKE7kKYZsnmUjyk0EfxCsVNbHz1Qdizuv989dsmpsEyaJHheBut/naJM=
X-Gm-Message-State: AOJu0Yx6o04skquxawWNGmeVLYJWG2ICJr4ImPWegBU7mpQroU5ULtaj
	0h+i6XKObNZi2Qm8u/KZsMvCLc16k/EdOoergcfxpoOVAU1fqCs/
X-Google-Smtp-Source: 
 AGHT+IGyZZH2dVq+LOe0zaf4rz7kDLtf4v4iLQC8umEfCOPDmCDuJtUXH0SpHIqe1/sL73DxJ3vqeQ==
X-Received: by 2002:a50:ab49:0:b0:570:1ea8:c50a with SMTP id
 4fb4d7f45d1cf-5731d9cd410mr1935750a12.6.1715166080555;
        Wed, 08 May 2024 04:01:20 -0700 (PDT)
Received: from hex.my.domain (83.8.126.253.ipv4.supernova.orange.pl.
 [83.8.126.253])
        by smtp.gmail.com with ESMTPSA id
 m6-20020a056402510600b005726b58a436sm7455793edd.30.2024.05.08.04.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 04:01:20 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Wed, 08 May 2024 12:58:50 +0200
Subject: [PATCH v2 2/7] ASoC: dt-bindings: samsung,midas-audio: Add
 GPIO-based headset jack detection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240508-midas-wm1811-gpio-jack-v2-2-b4d36cd02c6e@gmail.com>
References: <20240508-midas-wm1811-gpio-jack-v2-0-b4d36cd02c6e@gmail.com>
In-Reply-To: <20240508-midas-wm1811-gpio-jack-v2-0-b4d36cd02c6e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715166076; l=2135;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=x4CRj3HPQjjxV02Uhbn39jzTSMCqAM5BsNr5zZc40mM=;
 b=zsZQ0yeh7zg0Ep6m1GYQPRjfMq2PTI5dByvyZhsHCpPeLOEvFLhyar0/PfAzi8k6j4w1bXraj
 /eDPEpjzkwMAq1iMHceo6NnRRQvuVdZXpOxSY/0HEXQIzSIoLMG5QuW
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-MailFrom: aweber.kernel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: SYHDIV5N446GUK7NGB3NCL6ULQNIRQ5L
X-Message-ID-Hash: SYHDIV5N446GUK7NGB3NCL6ULQNIRQ5L
X-Mailman-Approved-At: Wed, 08 May 2024 12:51:30 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SYHDIV5N446GUK7NGB3NCL6ULQNIRQ5L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some Samsung devices that share the midas-audio driver use a GPIO-based
approach to headset jack detection, as opposed to using the built-in
jack detection provided by the wm8994 driver. This setup uses two GPIOs
(one for jack detection and another for key detection) and an ADC
channel for determining the jack type or button pressed.

Add DT configuration values that allow for describing these setups.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v2:
- Added vendor prefix to threshold properties
- Dropped pipe (|) character from description: field
---
 .../bindings/sound/samsung,midas-audio.yaml        | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
index 6ed53dd0bb53..6b760a73e8bf 100644
--- a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
@@ -64,6 +64,36 @@ properties:
     maxItems: 1
     description: GPIO pin for line out selection
 
+  headset-detect-gpios:
+    maxItems: 1
+    description: GPIO for detection of headset insertion
+
+  headset-key-gpios:
+    maxItems: 1
+    description: GPIO for detection of headset key press
+
+  io-channels:
+    maxItems: 1
+    description: IO channel to read micbias voltage for headset detection
+
+  io-channel-names:
+    const: headset-detect
+
+  samsung,headset-4pole-threshold-microvolt:
+    minItems: 2
+    maxItems: 2
+    description:
+      Array containing minimum and maximum IO channel value for 4-pole
+      (with microphone/button) headsets. If the IO channel value is
+      outside of this range, a 3-pole headset is assumed.
+
+  samsung,headset-button-threshold-microvolt:
+    minItems: 3
+    maxItems: 3
+    description:
+      Array of minimum (inclusive) IO channel values for headset button
+      detection, in order: "Media", "Volume Up" and "Volume Down".
+
 required:
   - compatible
   - cpu

-- 
2.45.0

