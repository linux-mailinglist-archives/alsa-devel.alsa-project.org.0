Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2615D8C9E72
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 15:56:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D667E67;
	Mon, 20 May 2024 15:56:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D667E67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716213399;
	bh=EZXePcBvXKiwP3EXDEHqCyB/Gu0AEIhLbrUV4Fe+KI4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WXSVpfXVvFGPScINOiN/8ErNR+FAQAIPy7Oie5dqq4Q6WtveNcXCjHn9ODhve5/P4
	 xSmCllwKM88j9aEogi3+l7SqM3v7PPUpLq+zJKcsrONUMOJbNF/gR7aApkv7uxLLI/
	 I6Ap+ikfow+7Wm0BGvi4TCDxZvEks70SwzMbDC/w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43539F805E9; Mon, 20 May 2024 15:56:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 60658F805EA;
	Mon, 20 May 2024 15:56:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FF4CF805BF; Mon, 20 May 2024 15:03:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AB608F80578
	for <alsa-devel@alsa-project.org>; Mon, 20 May 2024 15:03:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB608F80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=HmkIHcFv
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a59b49162aeso687682366b.3
        for <alsa-devel@alsa-project.org>;
 Mon, 20 May 2024 06:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716210228; x=1716815028;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R9dPohp8pfuUkAslj/44LQMkiwtv+DsL3rPN9tPKGHw=;
        b=HmkIHcFvTpRYbHtb9+ccDOW+WtKbov5YpbB06VgzM/LOiXO+rzxI95AGLSof15/naB
         wC7R6xcgY/LVid826AOPWRiuOISE6r1uStWw7TMhgNyjcn0v5aoNujgqpJ/e4JwEhAte
         /1k7kkfU66n3bVmukKv5gaIjnNyNQuiv70Tvgk1DJp793cL/hKvznacF3hm2mRUevbIA
         5wAkkse4xFMYEFBcBe6a0BWrCkvb+D7zn5/Ta8vJQcIIKZX62pt4EzT98IP0a1YPNiOm
         E7OgvoxI5sBVqA+sFJzWRF2GfbBhYrJ4MqrbhcJ5ZUlc/wnQzHgOOa7BGd5hUJ161rlW
         SuIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716210228; x=1716815028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R9dPohp8pfuUkAslj/44LQMkiwtv+DsL3rPN9tPKGHw=;
        b=EFscRh0N16Gj2YDTV71oR5FvTBfILxQmUxmKXOhtYPy8o412XBdiKzPhBfsm1uv4Fs
         1aAP8fmRfIEOd/sRhgVLb1icQMroC1TcgJgv+pop8affcCS/hX90Y9JV03TRnaWH7xEV
         H4K2kYFLIEPQDk5+huiZEBHxta3T/vnvFTBf1FIJYeLlkt+tr5rUr2s96qdX3pJ8HxxV
         22sPKOkmAarUFHziHAAk5/530SyqhUpUde/Zr7wZriLlfNQVgNyXQ4bjIjl5utp9Rd7A
         pqg9VWHNlJNgPjQDgtxd7wsuP0fkrRFho7jqX0mCF8LG55K86nY29jGSyQ+Lb6JTqFen
         S9wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1UNMOYHu2tKJ13v61BIb3KOhgGfbxj7rcEtsTveD5B6nk4+t9wQe1bWe1XQUAMMmLuBNXGTHDC1K/wHN1WBWUCDaC5sdav4FhuJY=
X-Gm-Message-State: AOJu0YykBpWJ70+72uF1Ddh89An5aR2u58BXD+in48XcIUjtFLVA552X
	enM3suF2+XNxIEXhKi6AI2O9xyBaM/aVDZYH/7EF8/ZZhKMr0RZVbVNozg==
X-Google-Smtp-Source: 
 AGHT+IFSJPpCsXD8nlzNZtTtwVuOywlJ3kEeHAEQNsTVgsVqCTp5lAG6+vAvM/y1zxZstH6QWCi7tQ==
X-Received: by 2002:a50:9519:0:b0:575:d74:338c with SMTP id
 4fb4d7f45d1cf-5750d7433dbmr5644244a12.10.1716106691185;
        Sun, 19 May 2024 01:18:11 -0700 (PDT)
Received: from hex.my.domain (83.8.125.62.ipv4.supernova.orange.pl.
 [83.8.125.62])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733c34e5ccsm13698518a12.95.2024.05.19.01.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 01:18:10 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sun, 19 May 2024 10:17:48 +0200
Subject: [PATCH v3 2/8] ASoC: dt-bindings: samsung,midas-audio: Add
 GPIO-based headset jack detection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240519-midas-wm1811-gpio-jack-v3-2-0c1736144c0e@gmail.com>
References: <20240519-midas-wm1811-gpio-jack-v3-0-0c1736144c0e@gmail.com>
In-Reply-To: <20240519-midas-wm1811-gpio-jack-v3-0-0c1736144c0e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716106686; l=2328;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=EZXePcBvXKiwP3EXDEHqCyB/Gu0AEIhLbrUV4Fe+KI4=;
 b=y0s6y128OFbER9wO691Pl1y+dbxejiJKN2KyMeWLB/2Zj0rDj0uqrU/vqrYEf3sfku35wMvuJ
 4n07G9uGfoZC4uco+vrUBL0eL2AF5KeXYuDpzrN+9MsyZOiAHxEX8eh
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-MailFrom: aweber.kernel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: IVBL6OFJ347JDEYW5CANTVRVM2XYZYXS
X-Message-ID-Hash: IVBL6OFJ347JDEYW5CANTVRVM2XYZYXS
X-Mailman-Approved-At: Mon, 20 May 2024 13:56:00 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IVBL6OFJ347JDEYW5CANTVRVM2XYZYXS/>
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
2.45.0

