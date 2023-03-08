Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 023CF6B05BD
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Mar 2023 12:21:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4030717EF;
	Wed,  8 Mar 2023 12:21:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4030717EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678274516;
	bh=Gz/XVqXtlcYs8RKBK79jhcuQqJWWc0oEFjWRvbOJ3lU=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h5vutyhtQRmeoEIeYbH7Wz/qnBeC4wA8+qhHsuAKUWX4iAPmNllb/Xp9qB4DQ7xzo
	 +4m8EAPkygsOvqaXwDU8vOoBsZcSzk0NR+U+Z7CqQvGBDyVxsfM8uDWwEaDugpWYno
	 zXUmh05MGp9hfJmwE8pOSmXku8z4aPtxxIJYlOBg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 522C0F8052D;
	Wed,  8 Mar 2023 12:19:53 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60A42F804FE; Wed,  8 Mar 2023 08:35:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8CC15F8042F
	for <alsa-devel@alsa-project.org>; Wed,  8 Mar 2023 08:35:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CC15F8042F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=LtOCJHK4
Received: by mail-ed1-x529.google.com with SMTP id a25so62257702edb.0
        for <alsa-devel@alsa-project.org>;
 Tue, 07 Mar 2023 23:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678260927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WBcnq48gZafulICVd9tvrELT8WaB8t4pfISzUK/pzOI=;
        b=LtOCJHK4KvMX8bwTtHJrl8sZHkh+iEgZz6I87FKs713yXXegtKWTWcWFc/1P5V9pzf
         3uY+McYYdyOoCIzWMZN/E8S7P226CMZ9IOdn2mjGDHGkVxhkMf3rW5KFJaSLlBL9654V
         y1PqPvye6lBWlzcGm2qHm/B3ECEH07bWwXAKuc32lJ/CkfDb1kSVmODkVoVVHSnWM1Ua
         VU592RmHtzHhiVi/XRlwqqmbsN6WI2OA+EimSNlXcN2lb3nwUSI/2pzvGnb42sZ+zTvg
         usP2J3osvVH8ExlHymqazrZHFPd2jryxCbmCMxDygSxQlrVZr/yP6hgm8W3rx1utFwFR
         sLJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678260927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WBcnq48gZafulICVd9tvrELT8WaB8t4pfISzUK/pzOI=;
        b=5SL6dwNcMuAG8iK9PJzXlqmDZziTVlgMlswfPx7W/dinxah/W9atHpVcA0zcSagPFY
         rCtayQ9d6UPg4G1TW/whgOLA5RAo7CVXWlVAtaVQyClotBItygaLyd1JMwemg8KvCAUc
         saMraG1OpPslOVW/itBUSCHCDHErqV6Ur01XYr08NOJTG8EseC/McYsGVnIaD6F09h/7
         yvetII7UlrgYwVfK+trQ4LM/lrd8SLIXGuaK2m8eAeQbDK4dFGzDpUVtfPeBRwXPoYYr
         2Dmuz1ANrlPym5eYY1kIJs/RQi439VsmU5iXm1Qad2vQElS9g5GPjIlfLXWRPa3aBeES
         trvQ==
X-Gm-Message-State: AO0yUKWq6asjgRcA14iaSzC0mdnnGAG6OyVC2Tki6FoCHuUeACn5UMGt
	7dQEiy5MLqaY/djrLnKZq3s=
X-Google-Smtp-Source: 
 AK7set+zGCxAlpvDYOch6Rucm3mfAoV+frk+zkxD07ypTa4bSC5gYI3kTWWYePSU4FynWRc4Obe4oQ==
X-Received: by 2002:a17:906:2db1:b0:7c9:6e0e:1427 with SMTP id
 g17-20020a1709062db100b007c96e0e1427mr15342605eji.6.1678260927608;
        Tue, 07 Mar 2023 23:35:27 -0800 (PST)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id
 h15-20020a1709062dcf00b008dffda52d71sm7051880eji.124.2023.03.07.23.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 23:35:27 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Maxim Schwalm <maxim.schwalm@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v2 4/8] dt-bindings: sound: nvidia,tegra-audio: add RT5631
 CODEC
Date: Wed,  8 Mar 2023 09:34:58 +0200
Message-Id: <20230308073502.5421-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230308073502.5421-1-clamor95@gmail.com>
References: <20230308073502.5421-1-clamor95@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: clamor95@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: WYEB4D22DHZFGA4RZIFIN3SZK3CUTEJW
X-Message-ID-Hash: WYEB4D22DHZFGA4RZIFIN3SZK3CUTEJW
X-Mailman-Approved-At: Wed, 08 Mar 2023 11:19:41 +0000
CC: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
 linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WYEB4D22DHZFGA4RZIFIN3SZK3CUTEJW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: David Heidelberg <david@ixit.cz>

Add dt-binding for RT5631 CODEC.

Signed-off-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../sound/nvidia,tegra-audio-rt5631.yaml      | 85 +++++++++++++++++++
 1 file changed, 85 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml
new file mode 100644
index 000000000000..a04487002e88
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-rt5631.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra audio complex with RT5631 CODEC
+
+maintainers:
+  - Jon Hunter <jonathanh@nvidia.com>
+  - Thierry Reding <thierry.reding@gmail.com>
+
+allOf:
+  - $ref: nvidia,tegra-audio-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - pattern: '^[a-z0-9]+,tegra-audio-rt5631(-[a-z0-9]+)+$'
+      - const: nvidia,tegra-audio-rt5631
+
+  nvidia,audio-routing:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description: |
+      A list of the connections between audio components.
+      Each entry is a pair of strings, the first being the connection's sink,
+      the second being the connection's source. Valid names for sources and
+      sinks are the pins (documented in the binding document),
+      and the jacks on the board.
+    minItems: 2
+    items:
+      enum:
+        # Board Connectors
+        - "Int Spk"
+        - "Headphone Jack"
+        - "Mic Jack"
+        - "Int Mic"
+
+        # CODEC Pins
+        - MIC1
+        - MIC2
+        - AXIL
+        - AXIR
+        - MONOIN_RXN
+        - MONOIN_RXP
+        - DMIC
+        - MIC Bias1
+        - MIC Bias2
+        - MONO_IN
+        - AUXO1
+        - AUXO2
+        - SPOL
+        - SPOR
+        - HPOL
+        - HPOR
+        - MONO
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra30-car.h>
+    #include <dt-bindings/soc/tegra-pmc.h>
+    sound {
+        compatible = "asus,tegra-audio-rt5631-tf700t",
+                     "nvidia,tegra-audio-rt5631";
+        nvidia,model = "Asus Transformer Infinity TF700T RT5631";
+
+        nvidia,audio-routing =
+                "Headphone Jack", "HPOL",
+                "Headphone Jack", "HPOR",
+                "Int Spk", "SPOL",
+                "Int Spk", "SPOR",
+                "MIC1", "MIC Bias1",
+                "MIC Bias1", "Mic Jack",
+                "DMIC", "Int Mic";
+
+        nvidia,i2s-controller = <&tegra_i2s1>;
+        nvidia,audio-codec = <&rt5631>;
+
+        clocks = <&tegra_car TEGRA30_CLK_PLL_A>,
+                 <&tegra_car TEGRA30_CLK_PLL_A_OUT0>,
+                 <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+        clock-names = "pll_a", "pll_a_out0", "mclk";
+    };
-- 
2.37.2

