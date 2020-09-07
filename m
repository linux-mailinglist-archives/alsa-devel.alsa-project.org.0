Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E5325F734
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Sep 2020 12:03:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B598617B1;
	Mon,  7 Sep 2020 12:02:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B598617B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599473015;
	bh=wNUmWXGcaMRt1eMpYHH1Xgda1hSwvDATWtnRaqeXQEg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XHxC7B8v9JFVS+H4lJS6FkOFWuyh2JeirykgM4nzCyG5vKyYzosmgZnVUnruv6t1k
	 gISltW84cfHDFfyLU26o3KtE6xQpE+emf9AI4efdNEGXG5rJhDZjaznMBPOTU3pcXH
	 KP24fuktTQDq5FfG9x2Pfbg1uZcHgtF2rnK2OUsM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4083FF80227;
	Mon,  7 Sep 2020 12:01:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8E90F802DB; Mon,  7 Sep 2020 12:01:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45EEBF80227
 for <alsa-devel@alsa-project.org>; Mon,  7 Sep 2020 12:01:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45EEBF80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="G2U+xauh"
Received: by mail-pl1-x642.google.com with SMTP id y6so4252720plk.10
 for <alsa-devel@alsa-project.org>; Mon, 07 Sep 2020 03:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZtBzFsLnQlADUQhDYi9AZbvuBk6CQQ/iUSZHP9znWeA=;
 b=G2U+xauhwOUIg1+sfdCC9aGNcSvglEqkkMBh6DCjmfq58K/T2d7rJA9Cm3fcyMxHva
 FZL7nTTT0HKvp2iSqi9GycSU1R25JyFScUE8CIwwhjboY6mUfSUEWHlrUwFy4jp08xOP
 rLUPwbwHtsSqUQcR+GUR0uUTwxIaBGbGCdHzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZtBzFsLnQlADUQhDYi9AZbvuBk6CQQ/iUSZHP9znWeA=;
 b=fKhgmmMqm2Lj1mwpdeg5kqn9xSmzZz9TvkHPYJRVOHF250NJDwEyTHcX38FPScN8LO
 ec7mP2j21XvXjcWhqlmOHpaks6EvQcUCmH72np+paplhBeHw7RV7d/ASoUvgPYB7PpL4
 5PkVZnskJfuun2Qb85LBo6JSeXGRAeAEpi37r2Xse4iEEafFuFB+vy63JzSfX9tXLuFa
 eacZs6qiwJeVdLUOf6f8tpN703KGT85vrkfPot9QYf0G+SZtIMBcYqdkkU1Alt9Ch+3b
 YK65Vtcaptja9s5g6wGYAhCaEhE8PQ4JWieH74H0kN4v2cwTM6OyehhhJz3PMyHbhY2z
 RwiQ==
X-Gm-Message-State: AOAM533MqUNSLp+qcXnhoqaOOFfwuXqM4KzCDBGTzBfS0BuH5vfGKcib
 1cn6SwEFI9WxBUDKrdJHwNWDDg==
X-Google-Smtp-Source: ABdhPJy9M8TMIRsRKfrSjFR15RkH+UCAIyZCO0fegGFdbr591p5xjKjo7GRykgUpbZfQWpn/LAH21A==
X-Received: by 2002:a17:90a:fa8b:: with SMTP id
 cu11mr18268777pjb.10.1599472863741; 
 Mon, 07 Sep 2020 03:01:03 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:de4a:3eff:fe7d:d39c])
 by smtp.gmail.com with ESMTPSA id k4sm11907489pjl.10.2020.09.07.03.00.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2020 03:01:03 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/3] ASoC: qcom: dt-bindings: Add sc7180 machine bindings
Date: Mon,  7 Sep 2020 18:00:38 +0800
Message-Id: <20200907100039.1731457-3-cychiang@chromium.org>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
In-Reply-To: <20200907100039.1731457-1-cychiang@chromium.org>
References: <20200907100039.1731457-1-cychiang@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Taniya Das <tdas@codeaurora.org>, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>, Heiko Stuebner <heiko@sntech.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Rohit kumar <rohitkr@codeaurora.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>, Patrick Lai <plai@codeaurora.org>,
 linux-rockchip@lists.infradead.org, Andy Gross <agross@kernel.org>,
 dgreid@chromium.org, devicetree@vger.kernel.org, tzungbi@chromium.org,
 Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, dianders@chromium.org,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
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
 .../bindings/sound/qcom,sc7180.yaml           | 143 ++++++++++++++++++
 1 file changed, 143 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,sc7180.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml b/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
new file mode 100644
index 000000000000..ae809346ca80
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
@@ -0,0 +1,143 @@
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
+    const: qcom,sc7180-sndcard
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
+  headset-jack:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle of the codec for headset detection
+
+  hdmi-jack:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: phandle of the codec for hdmi jack detection
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^dai-link(@[0-9])?$":
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
+  - headset-jack
+  - hdmi-jack
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
+        headset-jack = <&alc5682>;
+        hdmi-jack = <&msm_dp>;
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
+
+        dai-link@2 {
+            link-name = "MultiMedia2";
+            reg = <2>;
+            cpu {
+                sound-dai = <&lpass_hdmi 0>;
+            };
+
+            codec {
+                sound-dai = <&msm_dp>;
+            };
+        };
+    };
-- 
2.28.0.526.ge36021eeef-goog

