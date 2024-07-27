Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3138942999
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2024 10:50:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C43A32BFF;
	Wed, 31 Jul 2024 10:50:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C43A32BFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722415849;
	bh=cjVHMpBbBNVIROJODEIAMPhNoAE9dItU05+iUVuD1ps=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EwqFQqANiEDlhAZv19JaA1YkYxythOttc7Gha+O4WafTxhIaUPRtLUuLVpsUAjzUs
	 05VZPved7AaOZFVr2R9F0dJkuuKix9fVu7vT8eXFMF8rdhe1rCU+e79JVyk8ykystc
	 kRYkgIPZQI/GTerOSiYOQhlia7gj4YsUL2uvb0+I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DFEAF8063B; Wed, 31 Jul 2024 10:49:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 360BAF80613;
	Wed, 31 Jul 2024 10:49:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C92F6F80579; Sat, 27 Jul 2024 20:27:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3B82EF8026D
	for <alsa-devel@alsa-project.org>; Sat, 27 Jul 2024 20:20:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B82EF8026D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QBC4QYq3
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ef7fef3ccfso25439041fa.3
        for <alsa-devel@alsa-project.org>;
 Sat, 27 Jul 2024 11:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722104455; x=1722709255;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/b1UF2QE7ux02MF1mK2AOvPunWfuVvcN7o6J69AheMU=;
        b=QBC4QYq3VZ6vtQVecvbHyCh3XECe3BWwvetbPReJiAW44m8dYoxSCu/tKnDoj3h7lB
         0U9CfrBsUS/wEPM5bQHUw1nZ1JZlQCt2X0vwVaiRabSGw2b903UTwCuVE5pGJL4K4WSh
         0T2njB8ST9q3D13sESBlsWZTcaV5ivSXxyvDRz3RD+o/acV05GP7wlOYH5F0I97OmIJr
         evKLAtclBcHa62a4SaD74qMKH0vnp3aXCS3Qs6XXLIu6+hieHB40J+zEIsVSY6Gjre4N
         Ug90Ls3JA72XuLJK9ng28ocGoK9xKWjeJDBYxJlsghvy8QivQ+YoR5rwkGymLJciLSpS
         8RdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722104455; x=1722709255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/b1UF2QE7ux02MF1mK2AOvPunWfuVvcN7o6J69AheMU=;
        b=QXeIQ+trHipxjs/u608EzPZNLDEixSbAhfvG6m8Ibvo5COen34m2YPrS3tc8uZjbs2
         ZOznd5OjYW3TdUcHbxSY1i6xHuwC4XSynTlgWtAxQPID/wV0O5Tt9Kf5cplxgc8tZyPK
         bTkpAawxYNirU+Ziyh6oIzRPGqzzJ3uaMkmlycWtoW1u6X/fuxeXmY08NOli8BKMHW+8
         yauQSv3L58dnzAN6IdZ+ikmJg1czL2DYPeDrBNLhwkOrUiNVLjSv3ZrNjEy2S48EpqW+
         Zx0qz22A4COXtotZeG00Wah9nFvpmUGp6z+q2sadB9WyOh+Kydba4GV4mrI7A+X/BHOY
         mYjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAVHgbnXEcfmSdEtS01zQDB8Sxjt39dS9HmOY7ddGnukTASDHFY/DV6jyted9lEl+EMPc671ap8VJwG8OH9XObRXllSbSIO3bY1wM=
X-Gm-Message-State: AOJu0YxbXvoWn9W15HoYMqekRLUTE2vorTCoEBVJE2NkvWfbLc780JJG
	KWWdWlny+OsNBY2t+O549JJXghDNoDmJa2ht1Tc4rvJVJ2XFGYG7
X-Google-Smtp-Source: 
 AGHT+IFsHsOE9GFIml5SbGqV2PLpprs29PPSV7oR7rhgGyymm9vSuDoD90hrVIW/JyK4/9e8l+NdPg==
X-Received: by 2002:a2e:9609:0:b0:2ef:2a60:c1c1 with SMTP id
 38308e7fff4ca-2f12ee1663bmr19475811fa.21.1722104454336;
        Sat, 27 Jul 2024 11:20:54 -0700 (PDT)
Received: from localhost.localdomain (byw127.neoplus.adsl.tpnet.pl.
 [83.30.42.127])
        by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f03d077226sm7504891fa.126.2024.07.27.11.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 11:20:53 -0700 (PDT)
From: Adam Skladowski <a39.skl@gmail.com>
To: 
Cc: phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Adam Skladowski <a39.skl@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 3/4] ASoC: dt-bindings: apq8016-sbc: Add
 msm8953/msm8976-qdsp6-sndcard
Date: Sat, 27 Jul 2024 20:20:26 +0200
Message-ID: <20240727182031.35069-4-a39.skl@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240727182031.35069-1-a39.skl@gmail.com>
References: <20240727182031.35069-1-a39.skl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: a39.skl@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: WVD77EESV7XOMOVV4UATPDSPQ6HFUCLM
X-Message-ID-Hash: WVD77EESV7XOMOVV4UATPDSPQ6HFUCLM
X-Mailman-Approved-At: Wed, 31 Jul 2024 08:48:46 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WVD77EESV7XOMOVV4UATPDSPQ6HFUCLM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Document MSM8953/MSM8976 QDSP6 cards.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
---
 .../sound/qcom,apq8016-sbc-sndcard.yaml       | 51 ++++++++++++++++---
 1 file changed, 45 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc-sndcard.yaml b/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc-sndcard.yaml
index 6ad451549036..1706ce334d2f 100644
--- a/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc-sndcard.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,apq8016-sbc-sndcard.yaml
@@ -15,16 +15,16 @@ properties:
     enum:
       - qcom,apq8016-sbc-sndcard
       - qcom,msm8916-qdsp6-sndcard
+      - qcom,msm8953-qdsp6-sndcard
+      - qcom,msm8976-qdsp6-sndcard
 
   reg:
-    items:
-      - description: Microphone I/O mux register address
-      - description: Speaker I/O mux register address
+    minItems: 2
+    maxItems: 3
 
   reg-names:
-    items:
-      - const: mic-iomux
-      - const: spkr-iomux
+    minItems: 2
+    maxItems: 3
 
   audio-routing:
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
@@ -106,6 +106,45 @@ required:
   - reg-names
   - model
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,apq8016-sbc-sndcard
+              - qcom,msm8916-qdsp6-sndcard
+    then:
+      properties:
+        reg:
+          items:
+            - description: Microphone I/O mux register address
+            - description: Speaker I/O mux register address
+        reg-names:
+          items:
+            - const: mic-iomux
+            - const: spkr-iomux
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,msm8953-qdsp6-sndcard
+              - qcom,msm8976-qdsp6-sndcard
+    then:
+      properties:
+        reg:
+          items:
+            - description: Microphone I/O mux register address
+            - description: Speaker I/O mux register address
+            - description: Quinary Mi2S I/O mux register address
+        reg-names:
+          items:
+            - const: mic-iomux
+            - const: spkr-iomux
+            - const: quin-iomux
+
 additionalProperties: false
 
 examples:
-- 
2.45.2

