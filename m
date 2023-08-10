Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C05077707C
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Aug 2023 08:35:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B4A8828;
	Thu, 10 Aug 2023 08:34:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B4A8828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691649326;
	bh=yC2acnMd1k0ze+fNdHreAApBNc+SKsztwPeJT58l2Oo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Kxbd9ENyy/WcwqXZgqQbWz7kol02120xyRoRuZ/DKD7Tsg39O9R3hL1L3tzu6FH76
	 1VBtcCUszU4pFSI1yaMAxPlk/6D0RQxaIXVwXVxh91KSEMyUM3qZUrkNNb61WkhoiJ
	 nke3weVMzbZIlTt/hZKNlbeS1BjAYifbjrJjZLBc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56756F8057D; Thu, 10 Aug 2023 08:33:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AF50CF8057A;
	Thu, 10 Aug 2023 08:33:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41327F8057A; Thu, 10 Aug 2023 08:33:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 52BA4F801EB
	for <alsa-devel@alsa-project.org>; Thu, 10 Aug 2023 08:33:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52BA4F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=mRr+gxVp
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3fe12baec61so4414185e9.2
        for <alsa-devel@alsa-project.org>;
 Wed, 09 Aug 2023 23:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691649193; x=1692253993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSd9+dSCMBHcEUNxg9MGXggi9cWLvGAB+LtJE315jeE=;
        b=mRr+gxVpp7pg8jiFsl0EUQi5k0c8YNKWhwr6kNOBuPuxwnKM5eZyhgXsxqDAbhRuoA
         PTWTEzAVio/vIkXOYyPEdBPSDhIgUOcWOeoZWEizWD16j9Ab7f6v3priEedUhIdxLxY0
         dukP7frX7T5QWOyLE6qZRj74zajXX9XcaRvpNY2gGNCJv69kWiQG8FAglIq1J0ovIaCW
         3WrUgKDYi7t9i+rceE/UMbW9R9MzrzADAIVpM73fHvDZiSVDHTx6Nt9xr1yG8A25FIgh
         1zj+Quf8e/cz4H6+Fv0UtOrSTXcqmfQlOrCUIwG/BQl4xzGvqT4K7AoasOrss9AoIHPo
         DwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691649193; x=1692253993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eSd9+dSCMBHcEUNxg9MGXggi9cWLvGAB+LtJE315jeE=;
        b=VNB4+HulSRJaqkxW5QtDhuWy9p2ckf5jQlHnmww3XUrKRqelKXDBCwEmZ2Ig8si25v
         tyXWj3He5X7vJOy4cdz+5PeU2jvWIOeawELUy+oTjiXQeCTONruHnpG2A6SgscXyd4F6
         jU3Y0eftmO8EqbKOI4wpecBn3vHFkW5dc6Mrbh7suzYSq+nlSXnWClBJt1ljNDbozCWu
         kLoXXLUPZLqconYUu2d3ylwodnVJ3vBuAewcAK7bhdopc/YgomkxZLiagQ6qmjZtHlE6
         ujse6m1UKwBi6G2yIdEe2WfPFkI9i4TxSofy9oG722LcbBZGwRKttrdFNnud6ALhckcV
         uCGw==
X-Gm-Message-State: AOJu0YzCaKoGz35K7OpkTGqsmjiQvq05sYbgMVmCrnPQC/QiSrgpOG1T
	g4O/R9FQaNH0Jau8iFBonyTjgw==
X-Google-Smtp-Source: 
 AGHT+IEZxYb1FxIKEtJBlNcisBGSSmO94qeg2OhCBYD6jauaU1qMUChlV2aymQyGQ4CtlQKgGbb+cg==
X-Received: by 2002:a05:600c:3654:b0:3fb:403d:90c0 with SMTP id
 y20-20020a05600c365400b003fb403d90c0mr1018356wmq.39.1691649193448;
        Wed, 09 Aug 2023 23:33:13 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id
 o10-20020a1c750a000000b003fe2b6d64c8sm4020018wmc.21.2023.08.09.23.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 23:33:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Rohit kumar <quic_rohkumar@quicinc.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Rao Mandadapu <srivasam@codeaurora.org>,
	Judy Hsiao <judyhsiao@chromium.org>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Jonathan Bakker <xc-racer2@live.ca>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 05/11] ASoC: dt-bindings: samsung,odroid: use common sound
 card
Date: Thu, 10 Aug 2023 08:32:53 +0200
Message-Id: <20230810063300.20151-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810063300.20151-1-krzysztof.kozlowski@linaro.org>
References: <20230810063300.20151-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AMV4W3UUG76CSDFO3RT7SKWXOAUR46RC
X-Message-ID-Hash: AMV4W3UUG76CSDFO3RT7SKWXOAUR46RC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AMV4W3UUG76CSDFO3RT7SKWXOAUR46RC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Reference the common sound card properties and deprecate the
custom "samsung,audio-routing" in favor of generic one.  This allows to
remove "model" property and make the binding closer to other sounds
cards.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/sound/samsung,odroid.yaml  | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/samsung,odroid.yaml b/Documentation/devicetree/bindings/sound/samsung,odroid.yaml
index c6751c40e63f..b77284e3e26a 100644
--- a/Documentation/devicetree/bindings/sound/samsung,odroid.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung,odroid.yaml
@@ -10,6 +10,9 @@ maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
   - Sylwester Nawrocki <s.nawrocki@samsung.com>
 
+allOf:
+  - $ref: sound-card-common.yaml#
+
 properties:
   compatible:
     oneOf:
@@ -24,10 +27,6 @@ properties:
       - const: samsung,odroid-xu4-audio
         deprecated: true
 
-  model:
-    $ref: /schemas/types.yaml#/definitions/string
-    description: The user-visible name of this sound complex.
-
   assigned-clock-parents: true
   assigned-clock-rates: true
   assigned-clocks: true
@@ -52,6 +51,7 @@ properties:
 
   samsung,audio-routing:
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    deprecated: true
     description: |
       List of the connections between audio
       components;  each entry is a pair of strings, the first being the
@@ -61,6 +61,7 @@ properties:
       For Odroid X2: "Headphone Jack", "Mic Jack", "DMIC"
       For Odroid U3, XU3: "Headphone Jack", "Speakers"
       For Odroid XU4: no entries
+      Deprecated, use audio-routing.
 
   samsung,audio-widgets:
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
@@ -70,18 +71,17 @@ properties:
 
 required:
   - compatible
-  - model
   - cpu
   - codec
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
     sound {
         compatible = "hardkernel,odroid-xu3-audio";
         model = "Odroid-XU3";
-        samsung,audio-routing =
+        audio-routing =
                 "Headphone Jack", "HPL",
                 "Headphone Jack", "HPR",
                 "IN1", "Mic Jack",
-- 
2.34.1

