Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EC17739A6
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 12:38:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BD66857;
	Tue,  8 Aug 2023 12:37:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BD66857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691491091;
	bh=hYKzJQaX1SCl5vUDcGOW73cK/Vew/NVEeAQk9UvzNVk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=krVCT4YkEC4/nGHs9dTqMLuycZNDvrVcqfqMPwuDM/DGd9KbA2TkyTkTF0lMS3bZT
	 5NJsg2pKhUfxeyTTNqCjeCzT6ocjU+Un0zkz6TNu0HS/WkGEv0T3PfTC+ve4K1wazf
	 CUpUWge9MMsl/Ml2O42xLVLV1Tqo21+NnX0Qc4x4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9F81CF805B4; Tue,  8 Aug 2023 12:35:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F03DBF805B4;
	Tue,  8 Aug 2023 12:35:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F34FAF80425; Sat,  5 Aug 2023 20:06:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6A580F80149
	for <alsa-devel@alsa-project.org>; Sat,  5 Aug 2023 20:05:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A580F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20221208 header.b=r3Txk5RV
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3fe2bc27029so30779615e9.3
        for <alsa-devel@alsa-project.org>;
 Sat, 05 Aug 2023 11:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691258741; x=1691863541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYdoFc7rP2Qn0GrAVsnewk5f2j5o1yVoLkw8kbLJjy0=;
        b=r3Txk5RV5wSnvM9sUhJh/haq7s/rvtUErYBNeUGXZvyxG28S5pVHmusx9El8fjzzOe
         8d+FE5hPEyvs6E8G708I/QCAREgKXVfvQssxNDWoYgjFC91e/qQv7JPBnvHddK5GuU/u
         3r0ciKiuXdQpfn04ssBtDdwhkOrCPgF94itvMf4pV0ee8NBV7gE82gIDTSvSOCiCghQ7
         DI4HZoNJEaQGng6dUKIkv8kUoBRQu/+PB9b4/F6GIOnwnJ5Xk2uTAuT5jpxW0HoCSWc1
         RYStqJSmsIqGj464x8bUbin0bxRPm2TY5Cv9GtH1+nQoBAzbe6Y46Fn19RnmSOmP8Cdb
         pG7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691258741; x=1691863541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LYdoFc7rP2Qn0GrAVsnewk5f2j5o1yVoLkw8kbLJjy0=;
        b=ip+0iE8gF9tng3fgoF1arPksdff+7fA4GCvz2ei7oXjZq/wOlAfY9iLhC8RvIDc9Ck
         dhRNgyGgB1A+k4smGc8aH9b80yg7EHni/sFpWhP/F17aFxbwJAXGsVG8Q7/G4gcLbta+
         NS0Q/z74OAUB5iGZhcxxfDzTTMfAu0nuwAcg4ZvYdh1gYvV77dOs+mZs2BmPRg54ae3N
         KkTTRvp00mctqPscZQpQ2DKQa+fp32Noipkd/dav/9Xszqv9vmY+3k7Eg7fvCeSqGW5c
         Gc2m7cHAl6LSDHaPuc/SymxUyz3V6p3heh+X3N6W3GiMUmOnzBGBIDstBqRMvXSlFc72
         eFvw==
X-Gm-Message-State: AOJu0YzBWvbdb8aiBPTvRDAfHZhumWpYEy9E6vUCzSJAE0zrlLLLKuZa
	Q0sPIzcnumW8PwWe995mzwI=
X-Google-Smtp-Source: 
 AGHT+IEhVL7vlQWncytTyM/13d+OkFFEwfUKiR3bSl2fOgd9CDDE30po2p9SosJ2ijsdOWBwvqj4ow==
X-Received: by 2002:a1c:7205:0:b0:3f5:fff8:d4f3 with SMTP id
 n5-20020a1c7205000000b003f5fff8d4f3mr3949613wmc.7.1691258741186;
        Sat, 05 Aug 2023 11:05:41 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id
 v4-20020a5d6104000000b003176aa612b1sm5710402wrt.38.2023.08.05.11.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 11:05:41 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Maxime Ripard <mripard@kernel.org>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 1/5] ASoC: dt-bindings: sun4i-a10-codec: Add binding for
 Allwinner D1 SoC
Date: Sat,  5 Aug 2023 21:05:01 +0300
Message-Id: <20230805180506.718364-2-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230805180506.718364-1-bigunclemax@gmail.com>
References: <20230805180506.718364-1-bigunclemax@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: bigunclemax@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: IKIAGWDKAJVYTDZRVHS7FSZBG67WJPID
X-Message-ID-Hash: IKIAGWDKAJVYTDZRVHS7FSZBG67WJPID
X-Mailman-Approved-At: Tue, 08 Aug 2023 10:35:25 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IKIAGWDKAJVYTDZRVHS7FSZBG67WJPID/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Allwinner D1 SoC has a internal audio codec that similar to previous
ones, but it contains a three ADC channels instead of two, and also has
a separate clocks for ADC and DAC modules.

Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 .../sound/allwinner,sun4i-a10-codec.yaml      | 64 ++++++++++++++++---
 1 file changed, 56 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
index 78273647f766..cd9e2ca5783c 100644
--- a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
@@ -22,6 +22,7 @@ properties:
       - allwinner,sun8i-a23-codec
       - allwinner,sun8i-h3-codec
       - allwinner,sun8i-v3s-codec
+      - allwinner,sun20i-d1-codec
 
   reg:
     maxItems: 1
@@ -29,15 +30,9 @@ properties:
   interrupts:
     maxItems: 1
 
-  clocks:
-    items:
-      - description: Bus Clock
-      - description: Module Clock
+  clocks: true
 
-  clock-names:
-    items:
-      - const: apb
-      - const: codec
+  clock-names: true
 
   dmas:
     items:
@@ -103,6 +98,36 @@ required:
 
 allOf:
   - $ref: dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          const: allwinner,sun20i-d1-codec
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Bus Clock
+            - description: ADC Module Clock
+            - description: DAC Module Clock
+
+        clock-names:
+          items:
+            - const: apb
+            - const: adc
+            - const: dac
+
+    else:
+      properties:
+        clocks:
+          items:
+            - description: Bus Clock
+            - description: Module Clock
+
+        clock-names:
+          items:
+            - const: apb
+            - const: codec
+
   - if:
       properties:
         compatible:
@@ -111,6 +136,7 @@ allOf:
             - allwinner,sun8i-a23-codec
             - allwinner,sun8i-h3-codec
             - allwinner,sun8i-v3s-codec
+            - allwinner,sun20i-d1-codec
 
     then:
       if:
@@ -229,6 +255,28 @@ allOf:
               - Mic
               - Speaker
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - allwinner,sun20i-d1-codec
+
+    then:
+      properties:
+        allwinner,audio-routing:
+          items:
+            enum:
+              - HP
+              - LINEIN
+              - MIC3
+              - MBIAS
+              - Headphone
+              - Headset Mic
+              - Line In
+              - Line Out
+              - Mic
+              - Speaker
+
 unevaluatedProperties: false
 
 examples:
-- 
2.39.2

