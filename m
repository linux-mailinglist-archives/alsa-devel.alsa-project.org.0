Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F556BF690
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Mar 2023 00:37:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61109E86;
	Sat, 18 Mar 2023 00:36:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61109E86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679096263;
	bh=yF0jOPLOLxRhUvWgA3fKfHSXeMw3mGoX0gbyVhtGyw0=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZPajy56ePHZWOql5oMISqW22lR9Q9Tp2zKv4z3PE9ujui7bsYB6rVcqs7Ncn8RIa7
	 x99k6ZRyUMr236L46ZGUKoVbEmz4NafbimEqQGB2MLz7JPkCPH59Ct0lql+h3i0W4b
	 9uyJwP1W/ucwF0aniREk9MvooEFIMuqG0mOjqCPY=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B0AAF8016C;
	Sat, 18 Mar 2023 00:36:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E20FF80272; Sat, 18 Mar 2023 00:36:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A0E49F80272
	for <alsa-devel@alsa-project.org>; Sat, 18 Mar 2023 00:36:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0E49F80272
Received: by mail-io1-f54.google.com with SMTP id q6so3012721iot.2
        for <alsa-devel@alsa-project.org>;
 Fri, 17 Mar 2023 16:36:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679096177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YAZcuKYJLCFnnEBKwS88rbdIifxh3NqeJFPoZLaOyjw=;
        b=P5SLYe1FW3cMW0I/K3s6aExeSTpEnKljLauQVUx5WKd2JaEO4ECcantmhMjG9rGUVZ
         k4rcC9JBoKc2kE3Lv4Spu/vbwjXCWIcibq4mkpp7dGpdwXpmvrCRC2bI1gXK4rXYn02e
         FxWhhSJ2dsCVSkkvxeGBgR7m6+K6JZcylxAPnPhFv2dgnX3AY1gR2CAFOLWOU7Xexxtc
         g8XRuTXEJQrU0tnZu5C8ZgRxOn8XN61GYPpACI4/L30Pj/MK/H9pfnAvEnG9b8mlEZhM
         66pbgmPk8gcXnohccA8/uHvHto21+vSZld82mCbUadOKPM1cdUZsOGj4M+w8P3LLKFic
         U9rg==
X-Gm-Message-State: AO0yUKUJFJcq9XUmFE09nX7Zo4Cww9Y4aaaL2WVbJclDu9m/9ryHOHL1
	bGk3vKFdOYeqh4N0kASWsw==
X-Google-Smtp-Source: 
 AK7set9gCASFPcC1fuJCihIuym7rvnt9NnFL5ocgZ9H5SbJyCefO3q+izumFnA1p86VcXbLopc6Cug==
X-Received: by 2002:a5d:9041:0:b0:74c:d67a:6f97 with SMTP id
 v1-20020a5d9041000000b0074cd67a6f97mr238081ioq.17.1679096177277;
        Fri, 17 Mar 2023 16:36:17 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id
 c7-20020a6bec07000000b007549f6e6d3csm591593ioh.28.2023.03.17.16.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 16:36:16 -0700 (PDT)
Received: (nullmailer pid 3967959 invoked by uid 1000);
	Fri, 17 Mar 2023 23:36:13 -0000
From: Rob Herring <robh@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Fabio Estevam <festevam@gmail.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>
Subject: [PATCH] ASoC: dt-bindings: Drop unneeded quotes
Date: Fri, 17 Mar 2023 18:36:10 -0500
Message-Id: <20230317233612.3967849-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WRYBTMQVKIUIWHX53M7AM7IFBYAF5QY4
X-Message-ID-Hash: WRYBTMQVKIUIWHX53M7AM7IFBYAF5QY4
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WRYBTMQVKIUIWHX53M7AM7IFBYAF5QY4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Cleanup bindings dropping unneeded quotes. Once all these are fixed,
checking for this can be enabled in yamllint.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/sound/adi,adau1372.yaml          |  2 +-
 .../bindings/sound/adi,max98396.yaml          |  8 +++---
 .../bindings/sound/audio-graph-port.yaml      | 22 ++++++++--------
 .../bindings/sound/audio-graph.yaml           |  8 +++---
 .../bindings/sound/cirrus,cs35l45.yaml        |  2 +-
 .../bindings/sound/cirrus,cs42l42.yaml        | 12 ++++-----
 .../bindings/sound/mt8186-afe-pcm.yaml        |  6 ++---
 .../sound/mt8186-mt6366-da7219-max98357.yaml  |  2 +-
 .../sound/mt8186-mt6366-rt1019-rt5682s.yaml   |  2 +-
 .../bindings/sound/mt8192-afe-pcm.yaml        |  6 ++---
 .../sound/mt8192-mt6359-rt1015-rt5682.yaml    |  4 +--
 .../bindings/sound/mt8195-afe-pcm.yaml        |  2 +-
 .../bindings/sound/mt8195-mt6359.yaml         |  8 +++---
 .../sound/nvidia,tegra-audio-alc5632.yaml     |  8 +++---
 .../sound/nvidia,tegra-audio-max98090.yaml    |  8 +++---
 .../sound/nvidia,tegra-audio-rt5640.yaml      |  6 ++---
 .../sound/nvidia,tegra-audio-rt5677.yaml      | 26 +++++++++----------
 .../sound/nvidia,tegra-audio-sgtl5000.yaml    |  6 ++---
 .../sound/nvidia,tegra-audio-wm8753.yaml      |  6 ++---
 .../sound/nvidia,tegra-audio-wm8903.yaml      |  8 +++---
 .../sound/nvidia,tegra-audio-wm9712.yaml      |  8 +++---
 .../bindings/sound/qcom,q6asm-dais.yaml       |  2 +-
 .../bindings/sound/renesas,rsnd.yaml          |  2 +-
 .../devicetree/bindings/sound/sgtl5000.yaml   |  6 ++---
 .../bindings/sound/simple-card.yaml           |  2 +-
 .../sound/socionext,uniphier-aio.yaml         |  2 +-
 26 files changed, 87 insertions(+), 87 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/adi,adau1372.yaml b/Documentation/devicetree/bindings/sound/adi,adau1372.yaml
index 044bcd370d49..ea62e51aba90 100644
--- a/Documentation/devicetree/bindings/sound/adi,adau1372.yaml
+++ b/Documentation/devicetree/bindings/sound/adi,adau1372.yaml
@@ -32,7 +32,7 @@ properties:
     maxItems: 1
 
   clock-names:
-    const: "mclk"
+    const: mclk
 
   powerdown-gpios:
     description: GPIO used for hardware power-down.
diff --git a/Documentation/devicetree/bindings/sound/adi,max98396.yaml b/Documentation/devicetree/bindings/sound/adi,max98396.yaml
index fd5aa61b467f..bdc10d4204ec 100644
--- a/Documentation/devicetree/bindings/sound/adi,max98396.yaml
+++ b/Documentation/devicetree/bindings/sound/adi,max98396.yaml
@@ -41,21 +41,21 @@ properties:
 
   adi,vmon-slot-no:
     description: slot number of the voltage sense monitor
-    $ref: "/schemas/types.yaml#/definitions/uint32"
+    $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 0
     maximum: 15
     default: 0
 
   adi,imon-slot-no:
     description: slot number of the current sense monitor
-    $ref: "/schemas/types.yaml#/definitions/uint32"
+    $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 0
     maximum: 15
     default: 1
 
   adi,spkfb-slot-no:
     description: slot number of speaker DSP monitor
-    $ref: "/schemas/types.yaml#/definitions/uint32"
+    $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 0
     maximum: 15
     default: 2
@@ -64,7 +64,7 @@ properties:
     description:
       Selects the PCM data input channel that is routed to the speaker
       audio processing bypass path.
-    $ref: "/schemas/types.yaml#/definitions/uint32"
+    $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 0
     maximum: 15
     default: 0
diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
index 6b4e02a0695a..fa9f9a853365 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
@@ -16,19 +16,19 @@ definitions:
     $ref: /schemas/graph.yaml#/$defs/port-base
     properties:
       convert-rate:
-        $ref: "/schemas/sound/dai-params.yaml#/$defs/dai-sample-rate"
+        $ref: /schemas/sound/dai-params.yaml#/$defs/dai-sample-rate
       convert-channels:
-        $ref: "/schemas/sound/dai-params.yaml#/$defs/dai-channels"
+        $ref: /schemas/sound/dai-params.yaml#/$defs/dai-channels
       convert-sample-format:
-        $ref: "/schemas/sound/dai-params.yaml#/$defs/dai-sample-format"
+        $ref: /schemas/sound/dai-params.yaml#/$defs/dai-sample-format
       mclk-fs:
-        $ref: "simple-card.yaml#/definitions/mclk-fs"
+        $ref: simple-card.yaml#/definitions/mclk-fs
 
   endpoint-base:
     $ref: /schemas/graph.yaml#/$defs/endpoint-base
     properties:
       mclk-fs:
-        $ref: "simple-card.yaml#/definitions/mclk-fs"
+        $ref: simple-card.yaml#/definitions/mclk-fs
       frame-inversion:
         description: dai-link uses frame clock inversion
         $ref: /schemas/types.yaml#/definitions/flag
@@ -49,11 +49,11 @@ definitions:
         description: Indicates system clock
         $ref: /schemas/types.yaml#/definitions/phandle
       system-clock-frequency:
-        $ref: "simple-card.yaml#/definitions/system-clock-frequency"
+        $ref: simple-card.yaml#/definitions/system-clock-frequency
       system-clock-direction-out:
-        $ref: "simple-card.yaml#/definitions/system-clock-direction-out"
+        $ref: simple-card.yaml#/definitions/system-clock-direction-out
       system-clock-fixed:
-        $ref: "simple-card.yaml#/definitions/system-clock-fixed"
+        $ref: simple-card.yaml#/definitions/system-clock-fixed
 
       dai-format:
         description: audio format.
@@ -69,11 +69,11 @@ definitions:
             - msb
             - lsb
       convert-rate:
-        $ref: "/schemas/sound/dai-params.yaml#/$defs/dai-sample-rate"
+        $ref: /schemas/sound/dai-params.yaml#/$defs/dai-sample-rate
       convert-channels:
-        $ref: "/schemas/sound/dai-params.yaml#/$defs/dai-channels"
+        $ref: /schemas/sound/dai-params.yaml#/$defs/dai-channels
       convert-sample-format:
-        $ref: "/schemas/sound/dai-params.yaml#/$defs/dai-sample-format"
+        $ref: /schemas/sound/dai-params.yaml#/$defs/dai-sample-format
 
       dai-tdm-slot-num:
         description: Number of slots in use.
diff --git a/Documentation/devicetree/bindings/sound/audio-graph.yaml b/Documentation/devicetree/bindings/sound/audio-graph.yaml
index d59baedee180..c87eb91de159 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph.yaml
@@ -15,7 +15,7 @@ properties:
   label:
     maxItems: 1
   prefix:
-    description: "device name prefix"
+    description: device name prefix
     $ref: /schemas/types.yaml#/definitions/string
   routing:
     description: |
@@ -27,11 +27,11 @@ properties:
     description: User specified audio sound widgets.
     $ref: /schemas/types.yaml#/definitions/non-unique-string-array
   convert-rate:
-    $ref: "/schemas/sound/dai-params.yaml#/$defs/dai-sample-rate"
+    $ref: /schemas/sound/dai-params.yaml#/$defs/dai-sample-rate
   convert-channels:
-    $ref: "/schemas/sound/dai-params.yaml#/$defs/dai-channels"
+    $ref: /schemas/sound/dai-params.yaml#/$defs/dai-channels
   convert-sample-format:
-    $ref: "/schemas/sound/dai-params.yaml#/$defs/dai-sample-format"
+    $ref: /schemas/sound/dai-params.yaml#/$defs/dai-sample-format
 
   pa-gpios:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
index 88a0ca474c3d..b79990cf4f9f 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
@@ -45,7 +45,7 @@ properties:
       Audio serial port SDOUT Hi-Z control. Sets the Hi-Z
       configuration for SDOUT pin of amplifier. Logical OR of
       CS35L45_ASP_TX_HIZ_xxx values.
-    $ref: "/schemas/types.yaml#/definitions/uint32"
+    $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 0
     maximum: 3
     default: 2
diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
index 7356084a2ca2..af599d8735e2 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
@@ -68,7 +68,7 @@ properties:
       This is "normal tip sense (TS)" in the datasheet.
 
       The CS42L42_TS_INV_* defines are available for this.
-    $ref: "/schemas/types.yaml#/definitions/uint32"
+    $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 0
     maximum: 1
 
@@ -87,7 +87,7 @@ properties:
       7 - 1.5s
 
       The CS42L42_TS_DBNCE_* defines are available for this.
-    $ref: "/schemas/types.yaml#/definitions/uint32"
+    $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 0
     maximum: 7
 
@@ -106,7 +106,7 @@ properties:
       7 - 1.5s
 
       The CS42L42_TS_DBNCE_* defines are available for this.
-    $ref: "/schemas/types.yaml#/definitions/uint32"
+    $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 0
     maximum: 7
 
@@ -120,7 +120,7 @@ properties:
 
       0ms - 200ms,
       Default = 100ms
-    $ref: "/schemas/types.yaml#/definitions/uint32"
+    $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 0
     maximum: 200
 
@@ -133,7 +133,7 @@ properties:
 
       0ms - 20ms,
       Default = 10ms
-    $ref: "/schemas/types.yaml#/definitions/uint32"
+    $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 0
     maximum: 20
 
@@ -169,7 +169,7 @@ properties:
       3 - Slowest
 
       The CS42L42_HSBIAS_RAMP_* defines are available for this.
-    $ref: "/schemas/types.yaml#/definitions/uint32"
+    $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 0
     maximum: 3
 
diff --git a/Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml
index 88f82d096443..7fe85b08f9df 100644
--- a/Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8186-afe-pcm.yaml
@@ -26,15 +26,15 @@ properties:
     const: audiosys
 
   mediatek,apmixedsys:
-    $ref: "/schemas/types.yaml#/definitions/phandle"
+    $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of the mediatek apmixedsys controller
 
   mediatek,infracfg:
-    $ref: "/schemas/types.yaml#/definitions/phandle"
+    $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of the mediatek infracfg controller
 
   mediatek,topckgen:
-    $ref: "/schemas/types.yaml#/definitions/phandle"
+    $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of the mediatek topckgen controller
 
   clocks:
diff --git a/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml b/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml
index d427f7f623db..9853c11a1330 100644
--- a/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml
@@ -18,7 +18,7 @@ properties:
       - mediatek,mt8186-mt6366-da7219-max98357-sound
 
   mediatek,platform:
-    $ref: "/schemas/types.yaml#/definitions/phandle"
+    $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of MT8186 ASoC platform.
 
   headset-codec:
diff --git a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
index aa23b0024c46..d80083df03eb 100644
--- a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
@@ -19,7 +19,7 @@ properties:
       - mediatek,mt8186-mt6366-rt5682s-max98360-sound
 
   mediatek,platform:
-    $ref: "/schemas/types.yaml#/definitions/phandle"
+    $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of MT8186 ASoC platform.
 
   dmic-gpios:
diff --git a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
index 7a25bc9b8060..064ef172bef4 100644
--- a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
@@ -24,15 +24,15 @@ properties:
     const: audiosys
 
   mediatek,apmixedsys:
-    $ref: "/schemas/types.yaml#/definitions/phandle"
+    $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of the mediatek apmixedsys controller
 
   mediatek,infracfg:
-    $ref: "/schemas/types.yaml#/definitions/phandle"
+    $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of the mediatek infracfg controller
 
   mediatek,topckgen:
-    $ref: "/schemas/types.yaml#/definitions/phandle"
+    $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of the mediatek topckgen controller
 
   power-domains:
diff --git a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
index c6e614c1c30b..7e50f5d65c8f 100644
--- a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
@@ -21,11 +21,11 @@ properties:
       - mediatek,mt8192_mt6359_rt1015p_rt5682s
 
   mediatek,platform:
-    $ref: "/schemas/types.yaml#/definitions/phandle"
+    $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of MT8192 ASoC platform.
 
   mediatek,hdmi-codec:
-    $ref: "/schemas/types.yaml#/definitions/phandle"
+    $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of HDMI codec.
 
   headset-codec:
diff --git a/Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml
index 4452a4070eff..d5adf07d46e0 100644
--- a/Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml
@@ -32,7 +32,7 @@ properties:
       See ../reserved-memory/reserved-memory.txt for details.
 
   mediatek,topckgen:
-    $ref: "/schemas/types.yaml#/definitions/phandle"
+    $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of the mediatek topckgen controller
 
   power-domains:
diff --git a/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml b/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml
index ad3447ff8b2c..c1ddbf672ca3 100644
--- a/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8195-mt6359.yaml
@@ -24,19 +24,19 @@ properties:
     description: User specified audio sound card name
 
   mediatek,platform:
-    $ref: "/schemas/types.yaml#/definitions/phandle"
+    $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of MT8195 ASoC platform.
 
   mediatek,dptx-codec:
-    $ref: "/schemas/types.yaml#/definitions/phandle"
+    $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of MT8195 Display Port Tx codec node.
 
   mediatek,hdmi-codec:
-    $ref: "/schemas/types.yaml#/definitions/phandle"
+    $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of MT8195 HDMI codec node.
 
   mediatek,adsp:
-    $ref: "/schemas/types.yaml#/definitions/phandle"
+    $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of MT8195 ADSP platform.
 
   mediatek,dai-link:
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-alc5632.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-alc5632.yaml
index 7ef774910e5c..96f2f927a6f5 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-alc5632.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-alc5632.yaml
@@ -31,10 +31,10 @@ properties:
     items:
       enum:
         # Board Connectors
-        - "Headset Stereophone"
-        - "Int Spk"
-        - "Headset Mic"
-        - "Digital Mic"
+        - Headset Stereophone
+        - Int Spk
+        - Headset Mic
+        - Digital Mic
 
         # CODEC Pins
         - SPKOUT
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.yaml
index ccc2ee77ca30..4d912458b18b 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-max98090.yaml
@@ -38,10 +38,10 @@ properties:
     items:
       enum:
         # Board Connectors
-        - "Headphones"
-        - "Speakers"
-        - "Mic Jack"
-        - "Int Mic"
+        - Headphones
+        - Speakers
+        - Mic Jack
+        - Int Mic
 
         # CODEC Pins
         - MIC1
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5640.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5640.yaml
index b1deaf271afa..2638592435b2 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5640.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5640.yaml
@@ -31,9 +31,9 @@ properties:
     items:
       enum:
         # Board Connectors
-        - "Headphones"
-        - "Speakers"
-        - "Mic Jack"
+        - Headphones
+        - Speakers
+        - Mic Jack
 
         # CODEC Pins
         - DMIC1
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5677.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5677.yaml
index a49997d6028b..09e1d0b18d27 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5677.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-rt5677.yaml
@@ -31,11 +31,11 @@ properties:
     items:
       enum:
         # Board Connectors
-        - "Headphone"
-        - "Speaker"
-        - "Headset Mic"
-        - "Internal Mic 1"
-        - "Internal Mic 2"
+        - Headphone
+        - Speaker
+        - Headset Mic
+        - Internal Mic 1
+        - Internal Mic 2
 
         # CODEC Pins
         - IN1P
@@ -47,14 +47,14 @@ properties:
         - DMIC2
         - DMIC3
         - DMIC4
-        - "DMIC L1"
-        - "DMIC L2"
-        - "DMIC L3"
-        - "DMIC L4"
-        - "DMIC R1"
-        - "DMIC R2"
-        - "DMIC R3"
-        - "DMIC R4"
+        - DMIC L1
+        - DMIC L2
+        - DMIC L3
+        - DMIC L4
+        - DMIC R1
+        - DMIC R2
+        - DMIC R3
+        - DMIC R4
         - LOUT1
         - LOUT2
         - LOUT3
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-sgtl5000.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-sgtl5000.yaml
index 943e7c01741c..e5bc6a6ade24 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-sgtl5000.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-sgtl5000.yaml
@@ -31,9 +31,9 @@ properties:
     items:
       enum:
         # Board Connectors
-        - "Headphone Jack"
-        - "Line In Jack"
-        - "Mic Jack"
+        - Headphone Jack
+        - Line In Jack
+        - Mic Jack
 
         # CODEC Pins
         - HP_OUT
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8753.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8753.yaml
index a5b431d7d0c2..3323d6a438f5 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8753.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8753.yaml
@@ -31,8 +31,8 @@ properties:
     items:
       enum:
         # Board Connectors
-        - "Headphone Jack"
-        - "Mic Jack"
+        - Headphone Jack
+        - Mic Jack
 
         # CODEC Pins
         - LOUT1
@@ -53,7 +53,7 @@ properties:
         - MIC1
         - MIC2N
         - MIC2
-        - "Mic Bias"
+        - Mic Bias
 
 required:
   - nvidia,i2s-controller
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8903.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8903.yaml
index 1b836acab980..1be25ce4514b 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8903.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm8903.yaml
@@ -35,10 +35,10 @@ properties:
     items:
       enum:
         # Board Connectors
-        - "Headphone Jack"
-        - "Int Spk"
-        - "Mic Jack"
-        - "Int Mic"
+        - Headphone Jack
+        - Int Spk
+        - Mic Jack
+        - Int Mic
 
         # CODEC Pins
         - IN1L
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm9712.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm9712.yaml
index a1448283344b..397306b8800d 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm9712.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-wm9712.yaml
@@ -31,9 +31,9 @@ properties:
     items:
       enum:
         # Board Connectors
-        - "Headphone"
-        - "LineIn"
-        - "Mic"
+        - Headphone
+        - LineIn
+        - Mic
 
         # CODEC Pins
         - MONOOUT
@@ -48,7 +48,7 @@ properties:
         - PCBEEP
         - MIC1
         - MIC2
-        - "Mic Bias"
+        - Mic Bias
 
 required:
   - nvidia,ac97-controller
diff --git a/Documentation/devicetree/bindings/sound/qcom,q6asm-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6asm-dais.yaml
index 0110b38f6de9..ce811942a9f1 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6asm-dais.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6asm-dais.yaml
@@ -56,7 +56,7 @@ patternProperties:
           Compress offload dai.
 
     dependencies:
-      is-compress-dai: ["direction"]
+      is-compress-dai: [ direction ]
 
     required:
       - reg
diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
index 12ccf29338d9..5cfe71994bf7 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
@@ -155,7 +155,7 @@ properties:
           dmas:
             maxItems: 1
           dma-names:
-            const: "tx"
+            const: tx
         required:
           - dmas
           - dma-names
diff --git a/Documentation/devicetree/bindings/sound/sgtl5000.yaml b/Documentation/devicetree/bindings/sound/sgtl5000.yaml
index 02059d66b084..1353c051488f 100644
--- a/Documentation/devicetree/bindings/sound/sgtl5000.yaml
+++ b/Documentation/devicetree/bindings/sound/sgtl5000.yaml
@@ -50,7 +50,7 @@ properties:
     description: The bias voltage to be used in mVolts. The voltage can take
       values from 1.25V to 3V by 250mV steps. If this node is not mentioned
       or the value is unknown, then the value is set to 1.25V.
-    $ref: "/schemas/types.yaml#/definitions/uint32"
+    $ref: /schemas/types.yaml#/definitions/uint32
     enum: [ 1250, 1500, 1750, 2000, 2250, 2500, 2750, 3000 ]
 
   lrclk-strength:
@@ -63,7 +63,7 @@ properties:
         1 =		1.66 mA		2.87 mA		4.02  mA
         2 =		3.33 mA		5.74 mA		8.03  mA
         3 =		4.99 mA		8.61 mA		12.05 mA
-    $ref: "/schemas/types.yaml#/definitions/uint32"
+    $ref: /schemas/types.yaml#/definitions/uint32
     enum: [ 0, 1, 2, 3 ]
 
   sclk-strength:
@@ -76,7 +76,7 @@ properties:
         1 =		1.66 mA		2.87 mA		4.02  mA
         2 =		3.33 mA		5.74 mA		8.03  mA
         3 =		4.99 mA		8.61 mA		12.05 mA
-    $ref: "/schemas/types.yaml#/definitions/uint32"
+    $ref: /schemas/types.yaml#/definitions/uint32
     enum: [ 0, 1, 2, 3 ]
 
   port:
diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
index 806e2fff165f..b05e05c81cc4 100644
--- a/Documentation/devicetree/bindings/sound/simple-card.yaml
+++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
@@ -78,7 +78,7 @@ definitions:
     $ref: /schemas/types.yaml#/definitions/uint32
 
   prefix:
-    description: "device name prefix"
+    description: device name prefix
     $ref: /schemas/types.yaml#/definitions/string
 
   label:
diff --git a/Documentation/devicetree/bindings/sound/socionext,uniphier-aio.yaml b/Documentation/devicetree/bindings/sound/socionext,uniphier-aio.yaml
index 9cf0efaed88e..8600520d7c47 100644
--- a/Documentation/devicetree/bindings/sound/socionext,uniphier-aio.yaml
+++ b/Documentation/devicetree/bindings/sound/socionext,uniphier-aio.yaml
@@ -42,7 +42,7 @@ properties:
       Specifies a phandle to soc-glue, which is used for changing mode of S/PDIF
       signal pin to output from Hi-Z. This property is optional if you use I2S
       signal pins only.
-    $ref: "/schemas/types.yaml#/definitions/phandle"
+    $ref: /schemas/types.yaml#/definitions/phandle
 
   "#sound-dai-cells":
     const: 1
-- 
2.39.2

