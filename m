Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3419B299374
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Oct 2020 18:12:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4E0916B0;
	Mon, 26 Oct 2020 18:11:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4E0916B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603732342;
	bh=1Un2KkYt8SdwtKmuQs41llTpnRnIuDWF+rYorremO5I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cUqzUDWWhGkAlzLTuIxvQpd5pK+o2gYR2RTw3qousivvOWajvOQH8IZs1cc2wqVut
	 abS8Hiz41ZEOfgr3MiSZ6yWe5pbAgYa6qI7PyNDVU91AskEzloyRlni8J/8UCdJBK2
	 VBxZaz3cBkcvIDiH73e/Z/KnRSCHUXvbx482jZg8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44092F8028B;
	Mon, 26 Oct 2020 18:10:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9CAFF80272; Mon, 26 Oct 2020 18:09:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC7CDF80086
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 18:09:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC7CDF80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="QyVBpuNW"
Received: by mail-wr1-x431.google.com with SMTP id h5so13510084wrv.7
 for <alsa-devel@alsa-project.org>; Mon, 26 Oct 2020 10:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2w2zKDInoE0nEOTDxRu7ShBOzqjTt9h0UybMigLUZ7A=;
 b=QyVBpuNWrUnrnE3nTTLRUCTTT7/VWyI7mqP6SZtt6v6Yh+Vi69RNMQPZ3o69D3F35h
 6DVQ0nFx8sAjMCDjq57ChbigaaQiARydxivJHmF76gmNGhyLkIr2iZop2GQokTPbviM5
 HjsmiNXw1FVzyc7T8Dp4NavK4QbWTiK7BTQy4p0Qao49DiTdS34k1uRdczQnl/rfU211
 DeDMue360GnBjFdGc+AS4BaSwFRudBqxnpjJ3cDw99VJajlid8o0K+YMkzG8KQU+b6wl
 4TAGsmXNOaRQDEOYaeXTA096bZDNyY5gSOQ6DtZ0klKQbYbiOmNBOJ8TDDuJyLUsPaiy
 hLwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2w2zKDInoE0nEOTDxRu7ShBOzqjTt9h0UybMigLUZ7A=;
 b=Sfg3Zoznozf9M4qEk+CUPAwBtEGuR19BBGYbV0gUj377ROEmnhF2kKqiJHMaWgGiDd
 NG0uZ+dh1EDMHO3e+EvPSSF5Q/izUTDvQgciYEcbYDD29afsjfuG7HefpZa3Kcj481NG
 GR9ZVr7wNEA5f7mcRjG975ELboVAmUIYAP8RDa8SjZmgrSvD/knUlboOqTjjYz6gJvIV
 t1iOhhoFwyxTcWREl53wUqrHBu7NQSV/T9ddy4oUy0kQLulriTJK3bLVQlFmziVVqrZf
 Lr4N9QEisULLC6plf6BzVGKf+ak7dFCRXYPISL12pj5PwIj2hwwrt6qLmlmZU/lU4JB1
 TYPQ==
X-Gm-Message-State: AOAM530Kq6dwPBhlUyJ1H6TnkaaW6wcW0SWiHYeRrdTui0iqy6miXxRw
 X3xEPJXXDeYUULQveqmbXhOibg==
X-Google-Smtp-Source: ABdhPJzKEdmT+P+QVCtJT7v9CNbZUhOtFVFaiIx+8jOI4D+7abuPMZkk56f8H5emMxrZ2Xr3U3VXEg==
X-Received: by 2002:adf:f44d:: with SMTP id f13mr18201344wrp.385.1603732192856; 
 Mon, 26 Oct 2020 10:09:52 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id u133sm23136174wmb.6.2020.10.26.10.09.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 10:09:52 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v1 1/2] ASoC: qcom: dt-bindings: Add SM8250 sound card bindings
Date: Mon, 26 Oct 2020 17:09:46 +0000
Message-Id: <20201026170947.10567-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20201026170947.10567-1-srinivas.kandagatla@linaro.org>
References: <20201026170947.10567-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, plai@codeaurora.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, spapothi@codeaurora.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This patch adds bindings required for SM8250 based soundcards
for example Qualcomm Robotics RB5 Development Kit which makes
use of ADSP and Internal LPASS codec.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../bindings/sound/qcom,sm8250.yaml           | 161 ++++++++++++++++++
 1 file changed, 161 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
new file mode 100644
index 000000000000..b8f97fe6e92c
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -0,0 +1,161 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,sm8250.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies Inc. SM8250 ASoC sound card driver
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description:
+  This bindings describes SC8250 SoC based sound cards
+  which uses LPASS internal codec for audio.
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,qrb5165-rb5
+      - items:
+        - const: qcom,sm8250
+        - const: qcom,qrb5165-rb5
+
+  audio-routing:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description:
+      A list of the connections between audio components. Each entry is a
+      pair of strings, the first being the connection's sink, the second
+      being the connection's source. Valid names could be power supplies,
+      MicBias of codec and the jacks on the board.
+
+  model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: User visible long sound card name
+
+patternProperties:
+  ".*-dai-link$":
+    description:
+      Each subnode represents a dai link. Subnodes of each dai links would be
+      cpu/codec dais.
+
+    type: object
+
+    properties:
+      link-name:
+        description: Indicates dai-link name and PCM stream name.
+        $ref: /schemas/types.yaml#/definitions/string
+        maxItems: 1
+
+      cpu:
+        description: Holds subnode which indicates cpu dai.
+        type: object
+        properties:
+          sound-dai: true
+
+      platform:
+        description: Holds subnode which indicates platform dai.
+        type: object
+        properties:
+          sound-dai: true
+
+      codec:
+        description: Holds subnode which indicates codec dai.
+        type: object
+        properties:
+          sound-dai: true
+
+    required:
+      - link-name
+      - cpu
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - model
+
+additionalProperties: false
+
+examples:
+
+  - |
+    #include <dt-bindings/sound/qcom,q6afe.h>
+    #include <dt-bindings/sound/qcom,q6asm.h>
+    sound {
+        compatible = "qcom,qrb5165-rb5";
+        model = "Qualcomm-qrb5165-RB5-WSA8815-Speakers-DMIC0";
+        audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
+                    "SpkrRight IN", "WSA_SPK2 OUT",
+                    "VA DMIC0", "vdd-micb",
+                    "VA DMIC1", "vdd-micb",
+                    "MM_DL1",  "MultiMedia1 Playback",
+                    "MM_DL2",  "MultiMedia2 Playback",
+                    "MultiMedia3 Capture", "MM_UL3";
+
+        mm1-dai-link {
+            link-name = "MultiMedia0";
+            cpu {
+                sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA1>;
+            };
+        };
+
+        mm2-dai-link {
+            link-name = "MultiMedia2";
+            cpu {
+                sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA2>;
+            };
+        };
+
+        mm3-dai-link {
+            link-name = "MultiMedia3";
+            cpu {
+                sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA3>;
+            };
+        };
+
+        hdmi-dai-link {
+            link-name = "HDMI Playback";
+            cpu {
+                sound-dai = <&q6afedai TERTIARY_MI2S_RX>;
+            };
+
+            platform {
+                sound-dai = <&q6routing>;
+            };
+
+            codec {
+                sound-dai = <&lt9611_codec 0>;
+            };
+        };
+
+        wsa-dai-link {
+            link-name = "WSA Playback";
+            cpu {
+                sound-dai = <&q6afedai WSA_CODEC_DMA_RX_0>;
+            };
+
+            platform {
+                sound-dai = <&q6routing>;
+            };
+
+            codec {
+                sound-dai = <&left_spkr>, <&right_spkr>, <&swr0 0>, <&wsamacro>;
+            };
+        };
+
+        va-dai-link {
+            link-name = "VA Capture";
+            cpu {
+                sound-dai = <&q6afedai VA_CODEC_DMA_TX_0>;
+            };
+
+            platform {
+                sound-dai = <&q6routing>;
+            };
+
+            codec {
+                sound-dai = <&vamacro 0>;
+            };
+        };
+    };
-- 
2.21.0

