Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B2D69E7AE
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Feb 2023 19:39:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70654EBF;
	Tue, 21 Feb 2023 19:38:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70654EBF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677004768;
	bh=GJp3dakHCrfssrLo80pECOILqO3xbZUG92GIcDrXAwE=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q6+lvd8ztzxD+nqSvzUstTYXpSihL9tzWTkL5cn8Ihm81WtwgUleE3WC35jYH24uA
	 RVaRKB+KECQAejqwmuwQfMTqbaO7rMo6PqW+SWc+/DvLFmRAkGgUpltde3zj2xXXRY
	 ntl0iVZdkNIyGiPEd9g1Lhrm2lFwY5116+8AirDA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ECD08F8055C;
	Tue, 21 Feb 2023 19:36:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED9EBF80525; Tue, 21 Feb 2023 19:32:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8300BF802DB
	for <alsa-devel@alsa-project.org>; Tue, 21 Feb 2023 19:32:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8300BF802DB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=H/CTM8eq
Received: by mail-ed1-x52f.google.com with SMTP id s26so20956145edw.11
        for <alsa-devel@alsa-project.org>;
 Tue, 21 Feb 2023 10:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NH8T3uIDsMsshselwDvDLZiGP6dvAgAvE+M69z4Yx3w=;
        b=H/CTM8eqll4oT5mdFcfpaEYryD5fvk1h+y1Tbx39YEVekGOVolmb/0uTeQLtxZE1fl
         nDKd8uCmSKwbzkevYopP8oOoFWbX2MXvWsA+tthPw6mCF7xFgwJQ6ewYSQWOnIpFuEp0
         usH3bVyQ8WsYbQNcJKdo4W66lYT+ccTnrksgYnsj25QXX8kAA6kb7EjfloCTaMMZbNj4
         qEDw4FB3oxyV9Tde9ie1Giv02lSDCDtlfinG12y6McC7sJDtCpXccNxQH57lziAcFRC8
         Pi1gP8ynmxlLGKRC1nrgyosthPKS7dQQve9gmYtWzxYIsSWDWD41OQDvf9v+PnrIDjL0
         4yYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NH8T3uIDsMsshselwDvDLZiGP6dvAgAvE+M69z4Yx3w=;
        b=Svim/6IphQ4UJAu9Q0VpONc+/r2r9aV1wi4/DcdsAs0M8DdyDv36MU7uVrHdWpCdY8
         rlwFNPA6BBR+6x/iLEsviX2nU+hXDp2RdY0xG4/sHfY/rwgG6cINZaLiSACk9/6PViRS
         jpkkOB+kvwSMmmV5u42uhYeIJ2tSLaDx3JanoEUqKCDGo/AIGeXYnrKiN4qAF/IQQWMs
         +jLYgbSaApHkCRcD2545ZuMHgSJdvaTelCeGmB1fRVt0DUBzC0gjlOdC0OatsisROVEd
         hRo/EDqk6bd0JmP3PclQGLd51Jw19iFct0EspU/n6hNPV1IerIR3hIoFRcm0DtI8WOSI
         pM+g==
X-Gm-Message-State: AO0yUKWa+Sket5kCMmUox+mONvOtq+fiw6xaRKv9cdzNuDtIKPAXfJDz
	IqbazhUVQbuF+QNERjSRvaY=
X-Google-Smtp-Source: 
 AK7set9MPFA7PiA4Qwf584jP14HcozBU036cScKVnlwHTZJuOfvIsNU4rUdHRJDpVcT91NlLdpB80w==
X-Received: by 2002:aa7:c055:0:b0:4ac:bbd8:d04a with SMTP id
 k21-20020aa7c055000000b004acbbd8d04amr6237682edo.5.1677004346521;
        Tue, 21 Feb 2023 10:32:26 -0800 (PST)
Received: from xeon.. ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id
 i3-20020a50c3c3000000b004af5aa16fcasm169102edf.66.2023.02.21.10.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 10:32:26 -0800 (PST)
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
Subject: [PATCH v1 03/10] dt-bindings: sound: nvidia,tegra-audio: add RT5631
 CODEC
Date: Tue, 21 Feb 2023 20:32:04 +0200
Message-Id: <20230221183211.21964-4-clamor95@gmail.com>
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
Message-ID-Hash: NGRPDCSHSEKZB2OWKQDIS2GSRRCFI6CA
X-Message-ID-Hash: NGRPDCSHSEKZB2OWKQDIS2GSRRCFI6CA
X-Mailman-Approved-At: Tue, 21 Feb 2023 18:36:36 +0000
CC: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
 linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NGRPDCSHSEKZB2OWKQDIS2GSRRCFI6CA/>
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
---
 .../sound/nvidia,tegra-audio-rt5631.yaml      | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml
new file mode 100644
index 000000000000..b347f34c47f2
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5631.yaml
@@ -0,0 +1,88 @@
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

