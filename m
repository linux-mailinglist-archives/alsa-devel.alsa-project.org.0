Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 08205247D22
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 05:53:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D34D42;
	Tue, 18 Aug 2020 05:52:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D34D42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597722798;
	bh=T5JDLlge/A9sGj7/csHuKBJeOm7AjKAvzX+lo5Q/Uk0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HsOLoB1BQ/nyxfFZMJ2pjGKHGygoqKjBMqFc5Yd0t9Opcp25mZPGOmJg23fWB8wRb
	 jOtQ7n+05ZisttCQB/+2krj+YIr2412TZC15wscdRVAlqv//t5kZl9vbVquYSC8bMj
	 R+A0HrxFKgKlupgnyckv+E27hv8jcqHwAsPH6Oh8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C249DF802D2;
	Tue, 18 Aug 2020 05:50:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4AE6FF802C2; Tue, 18 Aug 2020 05:50:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6C1AF80114
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 05:50:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6C1AF80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="mfwGYaO1"
Received: by mail-pl1-x642.google.com with SMTP id t10so8571313plz.10
 for <alsa-devel@alsa-project.org>; Mon, 17 Aug 2020 20:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uQB89k74kDt35ZyGNSfBWwRkBKc1AYzsw/gOQgAPLK4=;
 b=mfwGYaO1HhUnhYx3Rfk07dxavCo+ZuVCmFx3c8xhgv7Hah8kb7Ygw8d9z22SPkg7dn
 GmzfM//2nJS3t0I5EO6nt2FWzqaueh6+5vRypaY4mVHAE/mQlbNZN6U9TF3BbY0fwAyr
 4EM78/cf+HWCqNzBHnqki91Iuvb083GyN65ps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uQB89k74kDt35ZyGNSfBWwRkBKc1AYzsw/gOQgAPLK4=;
 b=OwFYgt4Se3QrvpLq/96F+CNSXb3ykaNPbc0FZe6HWD6G+T0z262ZSKCnykKIS/laQ7
 rxoiECNjABCWDz/wsocTES/qN038afMXE4A8+D0HP27wa+W2iFn/AZgEY7au1bsVr9XC
 MIFggZL6Ukk6I1xjdZZ7Mm+TWHi3PS63R6zXSQfRxEHA674iVJx9UdrfB8KtCL2w3wZh
 rc/T2DXxPid1JJAPD+H9UnlDzRCqVutAJ4nOt6tXNmgHBAkHkAV00ae29N7v9ummnHNu
 9FgxCgT8JC2CUtqjsWEyFHTYdcRauenAHlK04KQRuV4bDtjlmPT8q75V7yhris13yoSO
 zGxA==
X-Gm-Message-State: AOAM533HQmL8YIt+ELRhzv4xyTLyDCy163iZvxTnEhmDfGlq8JQse8tI
 2zR1EXlqYaN92SdhgLtkFFs5yg==
X-Google-Smtp-Source: ABdhPJwpubw0kJ0Y8VgIQmbMAQnvNufq3phWuvJWYNM3qwJZg6E3HU6qDn9zWusLDJ2lIYyJcfK32g==
X-Received: by 2002:a17:90b:4c03:: with SMTP id
 na3mr15426216pjb.29.1597722646103; 
 Mon, 17 Aug 2020 20:50:46 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:de4a:3eff:fe7d:d39c])
 by smtp.gmail.com with ESMTPSA id b15sm21186940pje.52.2020.08.17.20.50.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2020 20:50:45 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/2] ASoC: qcom: dt-bindings: Add sc7180 machine bindings
Date: Tue, 18 Aug 2020 11:50:27 +0800
Message-Id: <20200818035028.2265197-2-cychiang@chromium.org>
X-Mailer: git-send-email 2.28.0.220.ged08abb693-goog
In-Reply-To: <20200818035028.2265197-1-cychiang@chromium.org>
References: <20200818035028.2265197-1-cychiang@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Taniya Das <tdas@codeaurora.org>, devicetree@vger.kernel.org,
 tzungbi@chromium.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
 Patrick Lai <plai@codeaurora.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, alsa-devel@alsa-project.org,
 Andy Gross <agross@kernel.org>, Rohit kumar <rohitkr@codeaurora.org>,
 Mark Brown <broonie@kernel.org>, dianders@chromium.org,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, dgreid@chromium.org,
 linux-arm-kernel@lists.infradead.org, Cheng-Yi Chiang <cychiang@chromium.org>
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

Add devicetree bindings documentation file for sc7180 sound card.

Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
---
 .../bindings/sound/qcom,sc7180.yaml           | 127 ++++++++++++++++++
 1 file changed, 127 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,sc7180.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml b/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
new file mode 100644
index 000000000000..b5cdaa0fe559
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
@@ -0,0 +1,127 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,sc7180.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies Inc. SC7180 ASoC sound card driver
+
+maintainers:
+  - Rohit kumar <rohitkr@codeaurora.org>
+  - Cheng-Yi Chiang <cychiang@chromium.org>
+
+description:
+  This binding describes the SC7180 sound card which uses LPASS for audio.
+
+properties:
+  compatible:
+    contains:
+      const: qcom,sc7180-sndcard
+
+  audio-routing:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description:
+      A list of the connections between audio components. Each entry is a
+      pair of strings, the first being the connection's sink, the second
+      being the connection's source.
+
+  model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: User specified audio sound card name
+
+  aux-dev:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle of the codec for headset detection
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^dai-link(@[0-9]+)?$":
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
+      reg:
+        description: dai link address.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        maxItems: 1
+
+      cpu:
+        description: Holds subnode which indicates cpu dai.
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
+      - codec
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - model
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+
+  - |
+    sound {
+        compatible = "qcom,sc7180-sndcard";
+        model = "sc7180-snd-card";
+
+        audio-routing =
+                    "Headphone Jack", "HPOL",
+                    "Headphone Jack", "HPOR";
+
+        aux-dev = <&alc5682>;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        dai-link@0 {
+            link-name = "MultiMedia0";
+            reg = <0>;
+            cpu {
+                sound-dai = <&lpass_cpu 0>;
+            };
+
+            codec {
+                sound-dai = <&alc5682 0>;
+            };
+        };
+
+        dai-link@1 {
+            link-name = "MultiMedia1";
+            reg = <1>;
+            cpu {
+                sound-dai = <&lpass_cpu 1>;
+            };
+
+            codec {
+                sound-dai = <&max98357a>;
+            };
+        };
+    };
-- 
2.28.0.220.ged08abb693-goog

