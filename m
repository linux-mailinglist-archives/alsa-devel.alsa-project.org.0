Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D8C43B04C
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 12:39:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 086B5844;
	Tue, 26 Oct 2021 12:39:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 086B5844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635244798;
	bh=cinCTm5fcIJq9gzZ2LKqynCXE0BCgU8gGocs0cx4xUA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LzCCEmXtTUzYeUEWeSZ9s12zsrI80hR1rf71iP5msgwN/sHX1cHclV4nBm5tau/2p
	 5SZhg4PfejHkPElt2dr+wmEw10jgDmoVbISzOo2S9wcG51r8iScusCKFZCLyuOp9ol
	 wXwPv2bS5e3L1rr7IxgSkVi9n2IAjXfCaJ2jimIQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67728F804E3;
	Tue, 26 Oct 2021 12:38:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42F0FF804AE; Tue, 26 Oct 2021 12:38:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2CC3F8014D
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 12:38:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2CC3F8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="XdYyIloz"
Received: by mail-wm1-x336.google.com with SMTP id
 z81-20020a1c7e54000000b0032cc97975e4so1281007wmc.4
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 03:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0sqozBq+aXNpDnMO1F1fpUtm2LewFLxPBuJo7vey+3c=;
 b=XdYyIlozntu9uaF7TUBso909TcfRWRio28llS3AJuh7mxJhY9YQXlsPvJDzPVFER9r
 RmGc1m9cYN0SeJ1KsacICX+FChoDiwXfiqHD3VEdPvw7rpS45y1u+VeeRuhsO7HVYC0S
 oYzHf8lZ2r9ksys1YAn7n61xsSXEMPKtholBzxuyWsSvMqre6/s0bXplzHl265MVQlW/
 kQh+AVPjzgixHRTOgOIQBhzIqm9QFRmr6nkXSVjn42HevN75y8haSkhC7IHq7rvwA7am
 ibTz+85TIT8HIS7yv8xxMYYNB8/3CywHrItC12hx+r4tqb6/eB9R1qCNxYatjLdyedV0
 WJgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0sqozBq+aXNpDnMO1F1fpUtm2LewFLxPBuJo7vey+3c=;
 b=QOFCp3arOkE7Hmu7VD6VsRWduqDIVg4cP79HGbE+EAWJTluOp0DEB4d+wLhkmZpXO3
 VHKcsvfQCGW2NDTvLZ3fd1eHQelD/jymfTEKFhmag1GZTafMj7PyXUge5fMzTuvA2OIU
 AvvGzfac4XnOQnneKE3PRNrqtvNzmqx4L5EA8GwNeUeW6evNQouwnh8xVPbQmDlGsKSB
 6clLGWwyrtsOhbyY7tRHoEsWZpajChOr0VSGPSWe4BFgjL/UufylvM8DCR9aNtsCej3N
 +h0gLeFMKnuSh1yiUoVYE30ZNuIqTfBccKDFa5gzUVBe04Tl+9kWVYtFrlrDXDFN3m29
 zPSQ==
X-Gm-Message-State: AOAM531Ms6sb1GufqE8WQnHwSgnFlPK3Tld8Vjtbx2AVEB2hxvmQbZZb
 K1Vs1l9Rpw+SU0LXEz2lT4ho/g==
X-Google-Smtp-Source: ABdhPJyvn8anvb3RTdJv6AWb7n8uCxlx/ebJzPsnzVjzxsdHlF2kXpgTLoFGHsThvSkFKMHT3uWR9A==
X-Received: by 2002:a05:600c:c7:: with SMTP id u7mr9283122wmm.42.1635244710509; 
 Tue, 26 Oct 2021 03:38:30 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id x21sm221397wmc.14.2021.10.26.03.38.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 03:38:30 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	bjorn.andersson@linaro.org,
	robh@kernel.org
Subject: [RESEND PATCH v10 01/17] ASoC: dt-bindings: move LPASS dai related
 bindings out of q6afe
Date: Tue, 26 Oct 2021 11:37:59 +0100
Message-Id: <20211026103815.19468-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20211026103815.19468-1-srinivas.kandagatla@linaro.org>
References: <20211026103815.19468-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, lgirdwood@gmail.com, tiwai@suse.de,
 plai@codeaurora.org, pierre-louis.bossart@linux.intel.com
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

q6afe (Audio Front End) is one of the DSP service that handles both
LPASS (Low Power Audio SubSystem) Audio ports and LPASS clocks.
As LPASS is a hardwware IP and commonly used by Qualcomm Audio DSP.
In order to allow  multiple DSP frameworks to use these bindings
its best to move it out from the dsp specific bindings.

For compatibility reasons and not breaking which is already working
we still maintain same compatible string "qcom,q6afe-dais"

Also as part of this change convert these LPASS dai related bindings
into yaml format.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/sound/qcom,q6afe.txt  | 158 ----------------
 .../sound/qcom,q6dsp-lpass-ports.yaml         | 178 ++++++++++++++++++
 2 files changed, 178 insertions(+), 158 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6afe.txt b/Documentation/devicetree/bindings/sound/qcom,q6afe.txt
index 1677448347da..fcf81058504c 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6afe.txt
+++ b/Documentation/devicetree/bindings/sound/qcom,q6afe.txt
@@ -12,92 +12,6 @@ used by all apr services. Must contain the following properties.
 		  from DSP.
 		  example "qcom,q6afe"
 
-= AFE DAIs (Digital Audio Interface)
-"dais" subnode of the AFE node. It represents afe dais, each afe dai is a
-subnode of "dais" representing board specific dai setup.
-"dais" node should have following properties followed by dai children.
-
-- compatible:
-	Usage: required
-	Value type: <stringlist>
-	Definition: must be "qcom,q6afe-dais"
-
-- #sound-dai-cells
-	Usage: required
-	Value type: <u32>
-	Definition: Must be 1
-
-- #address-cells
-	Usage: required
-	Value type: <u32>
-	Definition: Must be 1
-
-- #size-cells
-	Usage: required
-	Value type: <u32>
-	Definition: Must be 0
-
-== AFE DAI is subnode of "dais" and represent a dai, it includes board specific
-configuration of each dai. Must contain the following properties.
-
-- reg
-	Usage: required
-	Value type: <u32>
-	Definition: Must be dai id
-
-- qcom,sd-lines
-	Usage: required for mi2s interface
-	Value type: <prop-encoded-array>
-	Definition: Must be list of serial data lines used by this dai.
-	should be one or more of the 0-3 sd lines.
-
- - qcom,tdm-sync-mode:
-	Usage: required for tdm interface
-	Value type: <prop-encoded-array>
-	Definition: Synchronization mode.
-		0 - Short sync bit mode
-		1 - Long sync mode
-		2 - Short sync slot mode
-
- - qcom,tdm-sync-src:
-	Usage: required for tdm interface
-	Value type: <prop-encoded-array>
-	Definition: Synchronization source.
-		0 - External source
-		1 - Internal source
-
- - qcom,tdm-data-out:
-	Usage: required for tdm interface
-	Value type: <prop-encoded-array>
-	Definition: Data out signal to drive with other masters.
-		0 - Disable
-		1 - Enable
-
- - qcom,tdm-invert-sync:
-	Usage: required for tdm interface
-	Value type: <prop-encoded-array>
-	Definition: Invert the sync.
-		0 - Normal
-		1 - Invert
-
- - qcom,tdm-data-delay:
-	Usage: required for tdm interface
-	Value type: <prop-encoded-array>
-	Definition: Number of bit clock to delay data
-		with respect to sync edge.
-		0 - 0 bit clock cycle
-		1 - 1 bit clock cycle
-		2 - 2 bit clock cycle
-
- - qcom,tdm-data-align:
-	Usage: required for tdm interface
-	Value type: <prop-encoded-array>
-	Definition: Indicate how data is packed
-		within the slot. For example, 32 slot width in case of
-		sample bit width is 24.
-		0 - MSB
-		1 - LSB
-
 = AFE CLOCKSS
 "clocks" subnode of the AFE node. It represents q6afe clocks
 "clocks" node should have following properties.
@@ -122,78 +36,6 @@ apr-service@4 {
 	compatible = "qcom,q6afe";
 	reg = <APR_SVC_AFE>;
 
-	dais {
-		compatible = "qcom,q6afe-dais";
-		#sound-dai-cells = <1>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		dai@1 {
-			reg = <HDMI_RX>;
-		};
-
-		dai@24 {
-			reg = <PRIMARY_TDM_RX_0>;
-			qcom,tdm-sync-mode = <1>:
-			qcom,tdm-sync-src = <1>;
-			qcom,tdm-data-out = <0>;
-			qcom,tdm-invert-sync = <1>;
-			qcom,tdm-data-delay = <1>;
-			qcom,tdm-data-align = <0>;
-
-		};
-
-		dai@25 {
-			reg = <PRIMARY_TDM_TX_0>;
-			qcom,tdm-sync-mode = <1>:
-			qcom,tdm-sync-src = <1>;
-			qcom,tdm-data-out = <0>;
-			qcom,tdm-invert-sync = <1>;
-			qcom,tdm-data-delay <1>:
-			qcom,tdm-data-align = <0>;
-		};
-
-		dai@16 {
-			reg = <PRIMARY_MI2S_RX>;
-			qcom,sd-lines = <0 2>;
-		};
-
-		dai@17 {
-			reg = <PRIMARY_MI2S_TX>;
-			qcom,sd-lines = <1>;
-		};
-
-		dai@18 {
-			reg = <SECONDARY_MI2S_RX>;
-			qcom,sd-lines = <0 3>;
-		};
-
-		dai@19 {
-			reg = <SECONDARY_MI2S_TX>;
-			qcom,sd-lines = <1>;
-		};
-
-		dai@20 {
-			reg = <TERTIARY_MI2S_RX>;
-			qcom,sd-lines = <1 3>;
-		};
-
-		dai@21 {
-			reg = <TERTIARY_MI2S_TX>;
-			qcom,sd-lines = <0>;
-		};
-
-		dai@22 {
-			reg = <QUATERNARY_MI2S_RX>;
-			qcom,sd-lines = <0>;
-		};
-
-		dai@23 {
-			reg = <QUATERNARY_MI2S_TX>;
-			qcom,sd-lines = <1>;
-		};
-	};
-
 	clocks {
 		compatible = "qcom,q6afe-clocks";
 		#clock-cells = <2>;
diff --git a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
new file mode 100644
index 000000000000..e6148c17419b
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
@@ -0,0 +1,178 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/sound/qcom,q6dsp-lpass-ports.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm DSP LPASS(Low Power Audio SubSystem) Audio Ports binding
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description: |
+  This binding describes the Qualcomm DSP LPASS Audio ports
+
+properties:
+  compatible:
+    enum:
+      - qcom,q6afe-dais
+
+  reg:
+    maxItems: 1
+
+  '#sound-dai-cells':
+    const: 1
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+#Digital Audio Interfaces
+patternProperties:
+  '^dai@[0-9]+$':
+    type: object
+    description:
+      Q6DSP Digital Audio Interfaces.
+
+    properties:
+      reg:
+        description:
+          Digital Audio Interface ID
+
+      qcom,sd-lines:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description:
+          List of serial data lines used by this dai.should be one or more of the 0-3 sd lines.
+        minItems: 1
+        maxItems: 4
+        uniqueItems: true
+        items:
+          minimum: 0
+          maximum: 3
+
+      qcom,tdm-sync-mode:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2]
+        description:
+          TDM Synchronization mode
+            0 = Short sync bit mode
+            1 = Long sync mode
+            2 = Short sync slot mode
+
+      qcom,tdm-sync-src:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1]
+        description:
+          TDM Synchronization source
+            0 = External source
+            1 = Internal source
+
+      qcom,tdm-data-out:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1]
+        description:
+          TDM Data out signal to drive with other masters
+            0 = Disable
+            1 = Enable
+
+      qcom,tdm-invert-sync:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1]
+        description:
+          TDM Invert the sync
+            0 = Normal
+            1 = Invert
+
+      qcom,tdm-data-delay:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2]
+        description:
+          TDM Number of bit clock to delay data
+            0 = 0 bit clock cycle
+            1 = 1 bit clock cycle
+            2 = 2 bit clock cycle
+
+      qcom,tdm-data-align:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1]
+        description:
+          Indicate how data is packed within the slot. For example, 32 slot
+          width in case of sample bit width is 24TDM Invert the sync.
+            0 = MSB
+            1 = LSB
+
+    required:
+      - reg
+
+    allOf:
+      - if:
+          properties:
+            reg:
+              contains:
+                # TDM DAI ID range from PRIMARY_TDM_RX_0 - QUINARY_TDM_TX_7
+                items:
+                  minimum: 24
+                  maximum: 103
+        then:
+          required:
+            - qcom,tdm-sync-mode
+            - qcom,tdm-sync-src
+            - qcom,tdm-data-out
+            - qcom,tdm-invert-sync
+            - qcom,tdm-data-delay
+            - qcom,tdm-data-align
+
+      - if:
+          properties:
+            reg:
+              contains:
+                # MI2S DAI ID range PRIMARY_MI2S_RX - QUATERNARY_MI2S_TX and
+                # QUINARY_MI2S_RX - QUINARY_MI2S_TX
+                items:
+                  oneOf:
+                    - minimum: 16
+                      maximum: 23
+                    - minimum: 127
+                      maximum: 128
+        then:
+          required:
+            - qcom,sd-lines
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - "#sound-dai-cells"
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/soc/qcom,apr.h>
+    #include <dt-bindings/sound/qcom,q6afe.h>
+    apr {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        apr-service@4 {
+            reg = <APR_SVC_AFE>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            q6afedai@1 {
+              compatible = "qcom,q6afe-dais";
+              reg = <1>;
+              #address-cells = <1>;
+              #size-cells = <0>;
+              #sound-dai-cells = <1>;
+
+              dai@22 {
+                reg = <QUATERNARY_MI2S_RX>;
+                qcom,sd-lines = <0 1 2 3>;
+              };
+            };
+        };
+      };
-- 
2.21.0

