Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFC469E7AD
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Feb 2023 19:39:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E616EBC;
	Tue, 21 Feb 2023 19:38:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E616EBC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677004751;
	bh=rM4h26//E0MQP7dt1QpwFE+KENRYFrL/1rwXnQiGpow=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=h+ISjVFS/rL3wFNhEH6GMLkcezyO48AtN+FWsqmxuSSypPYud3r+4W3EJGf/dnghj
	 b/r1XoeX8e5ttTkFWW5anPMO17W1nFvc99d7f0PkP/I+sKOXom+aGj1MTou7iZ9DZp
	 5+uE+bvzvIDkFa2DN+iMGR6N6eYdIgPGWjYyOMdw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 044F3F80558;
	Tue, 21 Feb 2023 19:36:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CC41F80527; Tue, 21 Feb 2023 19:32:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1554CF8047C
	for <alsa-devel@alsa-project.org>; Tue, 21 Feb 2023 19:32:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1554CF8047C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Ku08TnoY
Received: by mail-ed1-x530.google.com with SMTP id da10so22223074edb.3
        for <alsa-devel@alsa-project.org>;
 Tue, 21 Feb 2023 10:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mbS3PQtaiGcPdHVmHK5KHmqLpEohCcTweQJ5EgXuiY=;
        b=Ku08TnoYik5za8z9qvRzVXLT6c1xZUixmrWodB6t+suqVat/3n0Jrtzr2IhboiCRAY
         5FMHqXM69Wqmuv37UIZs9hnkJDlSU5NXr8q/eTdNH6ijCZ14qZDxT5F0MjOKYzrCqedA
         ZgN/y+y2CWqj8Dvo0DImcvd1Cwzz2/uU9y22Coi3WqQPRw72Hc07WlrlD6Xu4ESJznPF
         53etHxCFf0ql6+sX4Dc8LbjYpRLpFA3qEdH6Ca5ytApvCVqCXWjN7OTBrGS9d3jahpq7
         EoMseFH8UTUkyIFmVLW1cA8Ae76cpFEXGNlY7Yo4U14vWM1R1Pke0ywsLllqLCT5uNSF
         B/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7mbS3PQtaiGcPdHVmHK5KHmqLpEohCcTweQJ5EgXuiY=;
        b=1uBVaQeAjYNBrtiXanPDvVh6J+VrYNE4h3LmNqZIclg8o9qjzZJNMdXC4b9PIK6arf
         7Hfziij1eOXM31ujaazmOgD0qiBxsAjUaCFvdIFQJFgghVIwurnU0PIFbfmTiPU2bPnl
         VC7v86vvTrAqlpp2mimCZwRfKvrE9uQbScZvpc+GdQy8RdTbtE42dgCN1GLM5Nu5oIJo
         3nHC5clGz/1/iXYkAVXIhliXtz4rt5Gf106ecPoLejgVjnOsgqG6GTNyQu1vfiMRBlkB
         Guj+3b3O8gkYp6TeYwQwjAlDd/84Vs1wxFAGeR6pWpvTQreVjQzHM6Z4aBga0V1bgKtk
         o+JA==
X-Gm-Message-State: AO0yUKVsPNS3fPTrn4KyQoZS3plDD90SUUrjGcI8qnYPnhBpfEu9Wz9e
	GM7DqOfJ1sxzSkdRlvscfcg=
X-Google-Smtp-Source: 
 AK7set/LteK3qpbAq1LKdw+rlpbLWNJhpurzLhgxg23pB6vb+FQgCIHXqCxN3v958CVxug40jX9oFw==
X-Received: by 2002:a50:ee01:0:b0:4ae:eb0f:892e with SMTP id
 g1-20020a50ee01000000b004aeeb0f892emr5579895eds.20.1677004348983;
        Tue, 21 Feb 2023 10:32:28 -0800 (PST)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id
 i3-20020a50c3c3000000b004af5aa16fcasm169102edf.66.2023.02.21.10.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 10:32:28 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Maxim Schwalm <maxim.schwalm@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 05/10] dt-bindings: sound: nvidia,tegra-audio: add MAX9808x
 CODEC
Date: Tue, 21 Feb 2023 20:32:06 +0200
Message-Id: <20230221183211.21964-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230221183211.21964-1-clamor95@gmail.com>
References: <20230221183211.21964-1-clamor95@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: clamor95@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: BGGYUHXTH44NDSIE32KDPRYG2UHDK2QG
X-Message-ID-Hash: BGGYUHXTH44NDSIE32KDPRYG2UHDK2QG
X-Mailman-Approved-At: Tue, 21 Feb 2023 18:36:36 +0000
CC: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
 linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BGGYUHXTH44NDSIE32KDPRYG2UHDK2QG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add dt-binding for MAX9808x CODEC.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../sound/nvidia,tegra-audio-max9808x.yaml    | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max9808x.yaml

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max9808x.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max9808x.yaml
new file mode 100644
index 000000000000..256ca4ad081e
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max9808x.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-max9808x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra audio complex with MAX9808x CODEC
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
+    oneOf:
+      - items:
+          - pattern: '^[a-z0-9]+,tegra-audio-max98088(-[a-z0-9]+)+$'
+          - const: nvidia,tegra-audio-max98088
+      - items:
+          - pattern: '^[a-z0-9]+,tegra-audio-max98089(-[a-z0-9]+)+$'
+          - const: nvidia,tegra-audio-max98089
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
+        - "Earpiece"
+        - "Headset Mic"
+        - "Internal Mic 1"
+        - "Internal Mic 2"
+
+        # CODEC Pins
+        - HPL
+        - HPR
+        - SPKL
+        - SPKR
+        - RECL
+        - RECR
+        - INA1
+        - INA2
+        - INB1
+        - INB2
+        - MIC1
+        - MIC2
+        - MICBIAS
+
+required:
+  - nvidia,i2s-controller
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/tegra30-car.h>
+    #include <dt-bindings/soc/tegra-pmc.h>
+    sound {
+        compatible = "lge,tegra-audio-max98089-p895",
+                     "nvidia,tegra-audio-max98089";
+        nvidia,model = "LG Optimus Vu MAX98089";
+
+        nvidia,audio-routing =
+            "Headphone Jack", "HPL",
+            "Headphone Jack", "HPR",
+            "Int Spk", "SPKL",
+            "Int Spk", "SPKR",
+            "Earpiece", "RECL",
+            "Earpiece", "RECR",
+            "INA1", "Headset Mic",
+            "MIC1", "MICBIAS",
+            "MICBIAS", "Internal Mic 1",
+            "MIC2", "Internal Mic 2";
+
+        nvidia,i2s-controller = <&tegra_i2s0>;
+        nvidia,audio-codec = <&codec>;
+
+        clocks = <&tegra_car TEGRA30_CLK_PLL_A>,
+                 <&tegra_car TEGRA30_CLK_PLL_A_OUT0>,
+                 <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+        clock-names = "pll_a", "pll_a_out0", "mclk";
+    };
-- 
2.37.2

