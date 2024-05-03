Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9927D8BFD89
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 14:45:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7B19826;
	Wed,  8 May 2024 14:45:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7B19826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715172357;
	bh=iSL/9TbpKZMCrEtopfNilhigbnt3bHY73t6ih8p4REI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sWupbst3CcJwEz7bvs4vzCHtbBkJz2pseX/WC27i86SAJNdBAIcZ0u4TAI+/ofAnZ
	 y0nV1Ti7y/iZLyvEKwIt/9AunJQ1H72etCAywrzmwQ6a+C+qSXsyVm/Hc8KMgOmckN
	 bqydpLx/0UbKYaPRSn9zLGE0FdF+8ZRV+GWbFI6c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2AFF2F805F6; Wed,  8 May 2024 14:44:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 79944F805ED;
	Wed,  8 May 2024 14:44:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67155F8028D; Fri,  3 May 2024 20:55:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 16BC9F80266
	for <alsa-devel@alsa-project.org>; Fri,  3 May 2024 20:55:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16BC9F80266
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kEqEz49U
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-51fd87ce075so274566e87.3
        for <alsa-devel@alsa-project.org>;
 Fri, 03 May 2024 11:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714762522; x=1715367322;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UbmcMWxuo0P18e6D0ea2liBuANMn4GXXURkDxbEh2Ck=;
        b=kEqEz49UJUcT0Xu6xx9HY+RxVLkw5MzwANX6gPNyMw7ZSYvXm8Mb+cHJHJGUQn43I+
         kvB+RA0XdkAF5QQTKzqg+UFMi6xr5KXIgIoEw0ZtewYII/kTKd76XUiwYt5QHGCACUB0
         trhBfeeUOe+QzEsgxhStLXjWMR6rESSPrhxLEmoBnw51jM51lYHlaH00mIYgj9ATVm5J
         R30b/VWTbGi1K2o1RApueCBg/dp85hlj48o1w0jxJljKya0nyrG7M7m3r21/AjOp1tew
         vkb9kxoMwFzYQSEPXc2REAG78GIwF7AduNn5FICmSoT+mB7x3s/TD2pB302doc8a0Nkn
         TZcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714762522; x=1715367322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UbmcMWxuo0P18e6D0ea2liBuANMn4GXXURkDxbEh2Ck=;
        b=bqeFJRRw4h7/owaf3vlEHI9YBOKvkiJH4YA9WnXA6N7AP+ORzZ+4+T16VkySAqLXOw
         F9fBSFznGEOaEkYpCdYVMf29rIQXXa9rr9Az5UMOfd/f8txFs87bcpNHmjXyMMZV+Pl+
         sANHk+E3dOD1Kgcnak+Bs2SRMgAs7qeEyOalFlWgBc++tYTqiQN+8lurm8P68S8TmEV5
         jYDQa1QB0tD8/hb6UWkejHqsoReMzw0iV4LN+zfaCiNz942yiTFdZ/8WxQclq9//In/0
         zaW962hcePrUD9v/r8BTo4wZu8qRLE8uWwYAGgL4/Mv24EmfoQCaj9qPSX/4KfVo0os3
         cJyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJuqyzolNBXGRjVYUSy2qIhG0VgyDPPLlBZLh8hRt3iRsmOBbbpKsvMYNdbqnDUUo1geUbltZnxGM+TeBIi5lG6EGUu3PYdhBWeUs=
X-Gm-Message-State: AOJu0Ywpzr4/8LPJ6JrbWstozDmUVCHAkb2DKopdTEqWN4HPnkeIGt2F
	fJ2dB2W4kE9AHmAovUSFf62kh21gpeYea7nEETOa4uX/qHoBhOmq
X-Google-Smtp-Source: 
 AGHT+IHxuJfes30dEmvdnSiiOTWELTaaG0Zgc39pHJXiEjvoeWJvMYPpqTzzw8aPSPJHb+gxO7ayMg==
X-Received: by 2002:a19:2d5c:0:b0:51f:5760:dd34 with SMTP id
 t28-20020a192d5c000000b0051f5760dd34mr2227092lft.55.1714762522300;
        Fri, 03 May 2024 11:55:22 -0700 (PDT)
Received: from hex.my.domain (83.25.185.84.ipv4.supernova.orange.pl.
 [83.25.185.84])
        by smtp.gmail.com with ESMTPSA id
 l8-20020a170906078800b00a598d3ddf8dsm1104618ejc.28.2024.05.03.11.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 11:55:21 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Fri, 03 May 2024 20:55:11 +0200
Subject: [PATCH 1/3] ASoC: dt-bindings: samsung,midas-audio: Add GPIO-based
 headset jack detection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240503-midas-wm1811-gpio-jack-v1-1-e8cddbd67cbf@gmail.com>
References: <20240503-midas-wm1811-gpio-jack-v1-0-e8cddbd67cbf@gmail.com>
In-Reply-To: <20240503-midas-wm1811-gpio-jack-v1-0-e8cddbd67cbf@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714762519; l=1850;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=iSL/9TbpKZMCrEtopfNilhigbnt3bHY73t6ih8p4REI=;
 b=84P+PrhoPK9SG9icveouBZi2fkf11bKuxyjdVfmtV3cwHD9/v77W7mjlchFTt/lJ9bwTEE9hQ
 DCYby6BSQPDBGUfIYW9w4C9YUh1EE+E6U+7VDmfaJ7n5Avw64nS7XHD
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-MailFrom: aweber.kernel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: HF6363O3TEFQJDYSXXDEIYBJOAHNYKIP
X-Message-ID-Hash: HF6363O3TEFQJDYSXXDEIYBJOAHNYKIP
X-Mailman-Approved-At: Wed, 08 May 2024 12:44:50 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HF6363O3TEFQJDYSXXDEIYBJOAHNYKIP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some Samsung devices that share the midas-audio driver use a GPIO-based
approach to headset jack detection, as opposed to using the built-in
jack detection provided by the wm8994 driver.

Add DT configuration values that allow for describing these setups.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 .../bindings/sound/samsung,midas-audio.yaml        | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
index 6ec80f529d84..9f521131f2b3 100644
--- a/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung,midas-audio.yaml
@@ -61,6 +61,36 @@ properties:
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
+  headset-4pole-threshold-microvolt:
+    minItems: 2
+    maxItems: 2
+    description: |
+      Array containing minimum and maximum IO channel value for 4-pole
+      (with microphone/button) headsets. If the IO channel value is
+      outside of this range, a 3-pole headset is assumed.
+
+  headset-button-threshold-microvolt:
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
2.45.0

