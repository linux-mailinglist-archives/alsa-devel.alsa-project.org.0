Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C332C90778C
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 17:53:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3427A85D;
	Thu, 13 Jun 2024 17:52:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3427A85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718293982;
	bh=Rsl4K9dB39cIJFWh12QWC6byH17AfCNyG1AGcEHy56E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=etUy9qbEuojStgz9JfuaXkfG+lgSnujiWFq97nOSVFqEwGF9L+tP7fpgDmZtT3hh0
	 lll1m4CBk6I2SGGmYkwaHnJu/GhTCm5Ex0i17OhnfH9d+JC+0Y4hTLLIiQBeIESfvz
	 uADQDTL2DXXnjKx2lbFBWfC1a8F8laFh0dnX06hM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3279CF806BA; Thu, 13 Jun 2024 17:50:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 31CDFF806AE;
	Thu, 13 Jun 2024 17:50:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13105F8026A; Sat, 25 May 2024 15:31:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0313AF8028B
	for <alsa-devel@alsa-project.org>; Sat, 25 May 2024 15:28:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0313AF8028B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=gd1I1t+H
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a6266ffdba8so153202866b.1
        for <alsa-devel@alsa-project.org>;
 Sat, 25 May 2024 06:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716643689; x=1717248489;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GaBTo72FFPQQpv6Vx/c6UOAp3vgYZvaAb8kpzvmiOq4=;
        b=gd1I1t+HCpG3Mpjhz8JtexiNSjKH9NR1PQPa6n/uuEOf5b+ljPqHLBIvkx5fINIOkw
         B08GT2YwIMAkijLOM/DkLNmL1QIYw71R1yqFg+Q198KJvW8KjSr/4fkl4isC0XQV2eM2
         uJLl/kNRe9jqLXcTfn8fjVTl0u5s+h9Mh4gmdDmXESKNEizIlTS/RmdtCG96pw0322hC
         TkG69Ld/sMvYrT3PK+biZlhmRf9mB+fnFKyeMLzgnUwuPrxrKoK6aaiyjt1NSBFUd9xZ
         PkC2SUixEhSaaqNbEhfc6wfy0aIV8kkrG2QmLZM/HVgQkE4euJ/WnR1Fm5ttqFSaL6wZ
         wuFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716643689; x=1717248489;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GaBTo72FFPQQpv6Vx/c6UOAp3vgYZvaAb8kpzvmiOq4=;
        b=pwXBNkj6WN34+zJiIEQEO5znjEJS3XSDr0FMvOk644x4sxDtdChaJv4InAfN7w63/9
         16KZ0/cRC9legLuXOqiHwGx/oEo2JQ4TLxO7JUbGClR9ElIvR+eXMaGMVZZGcuVqpLfR
         4F4Ryfah687e2uAARlzJ0nREtxembMLJik2H4zsvuEaxDL8EZNcF/KFt4MuHQ0/IZdeW
         2vIhXh0QiF0lcCZHFplkDGT0v6ZQFd957Wjq7dnen74fW9SNhRFgKQIp65v/6WxAGdjm
         jyHInf18FJzaaJeHc8V7omRUvKldMi4dOb53Na0/Y50r5t+shpDR+hERgPWXthAmPYLQ
         FDdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIM//8nfJXITV7L5AqijWZDefW2bfSNHHENIvf+Pr+GliMAjuKtimSzzOPZCKz7VWYwdFbMCsK8rTFXRof3DfZ1XhFdmPvT8Qzo/U=
X-Gm-Message-State: AOJu0YzZ8T0l4ZjlWoom/STOm+z5RmQBuYIhVoAPUnwzLO5I2xPhgDth
	7ymgKg3+hJwsQ9mC/b1oezLPz2i47GU15CdnrS3TI3ZoeDU02YxL
X-Google-Smtp-Source: 
 AGHT+IF4bGIOqG3W34z32lSukG6Ef5s1FlI9dkGFnxyKECa3N/yURT+cuvpIZ9OZEntCd4Ld2UdhcA==
X-Received: by 2002:a17:906:a0a:b0:a5a:4683:e961 with SMTP id
 a640c23a62f3a-a6264f0eeaemr311160366b.52.1716643689383;
        Sat, 25 May 2024 06:28:09 -0700 (PDT)
Received: from hex.my.domain (83.8.128.191.ipv4.supernova.orange.pl.
 [83.8.128.191])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626cda46e1sm251842566b.196.2024.05.25.06.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 May 2024 06:28:08 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sat, 25 May 2024 15:28:06 +0200
Subject: [PATCH v4 2/9] ASoC: dt-bindings: samsung,midas-audio: Add
 GPIO-based headset jack detection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240525-midas-wm1811-gpio-jack-v4-2-f488e03bd8c7@gmail.com>
References: <20240525-midas-wm1811-gpio-jack-v4-0-f488e03bd8c7@gmail.com>
In-Reply-To: <20240525-midas-wm1811-gpio-jack-v4-0-f488e03bd8c7@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716643685; l=2328;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=Rsl4K9dB39cIJFWh12QWC6byH17AfCNyG1AGcEHy56E=;
 b=VNuxPjI5euL5nPUvXQhYTV/hpQPtChvapioTHtcSQs/+z/mENYr3KDtB+9gBSeEivCEerZK5p
 9DGuSbFHIJZAbOQ2gV7eXkUb/2PKxPzwrTr3VdIZIAQlJ3PaqU92shJ
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-MailFrom: aweber.kernel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 5LALNRONX6CVZVD2YY6QN3ZHIGK3TWRE
X-Message-ID-Hash: 5LALNRONX6CVZVD2YY6QN3ZHIGK3TWRE
X-Mailman-Approved-At: Thu, 13 Jun 2024 15:50:37 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5LALNRONX6CVZVD2YY6QN3ZHIGK3TWRE/>
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
Changes in v3:
- Re-added pipe (|) to description of samsung,headset-button-threshold-
  microvolt to prevent syntax error (otherwise the "in order: ..." part
  is interpreted as a list)
Changes in v2:
- Added vendor prefix to threshold properties
- Dropped pipe (|) character from description: field
---
 .../bindings/sound/samsung,midas-audio.yaml        | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
index 6ed53dd0bb53..69ddfd4afdcd 100644
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
+    description: |
+      Array of minimum (inclusive) IO channel values for headset button
+      detection, in order: "Media", "Volume Up" and "Volume Down".
+
 required:
   - compatible
   - cpu

-- 
2.45.1

