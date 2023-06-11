Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA6372B15D
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Jun 2023 12:28:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CA7F3E8;
	Sun, 11 Jun 2023 12:27:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CA7F3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686479285;
	bh=ut1qFD8hjTc+0rVUYEG8q28AjQURqZcvrjGI5vw1T3E=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=YWv9afMSwsHx6ey7pqQN4W3rn0aJBrqKkYw6lpcV5WwLM+9qyVWHp06V4SwWPwRTw
	 9CFWVXzrShzochIDe6epYTOVg/WaGNui7NwPamU7pD4VifjqFfR7zWAglQadf+K23U
	 rNqb3wB8zUJ1bDgyX4cKqqHjFO9Ry4puVwPae3cM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65A07F80155; Sun, 11 Jun 2023 12:27:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E21DF80149;
	Sun, 11 Jun 2023 12:27:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0107DF80155; Sun, 11 Jun 2023 12:27:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EA7F8F80093
	for <alsa-devel@alsa-project.org>; Sun, 11 Jun 2023 12:27:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA7F8F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=RnUfUrdL
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-970028cfb6cso608272666b.1
        for <alsa-devel@alsa-project.org>;
 Sun, 11 Jun 2023 03:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686479221; x=1689071221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a22HjzVjSoWXGTL9TglCphqPmf2Pi6NIr/Is0weeN9o=;
        b=RnUfUrdL6sWZr9D4mK3Vi1cDtRMbQk0vZDIGXp3858j7hX63QeV1fZGs5lGNF3DSL6
         3W8fE/ccu5d+BXkN87POWFmUVROI6PtlM2Fm8zCBb0nzH8Mh5PLUVHcTmTqQmVsNig9g
         l+If9Dfu5ZdHY7ocfMPmZz7WZsIswIPrr3K4WynmSHM8f/1XtYKBrXMFRLrLxC6XKei1
         XK2ESw/LBWa45tjg5jEBqTObFAQf0k1Y8daB1+TPsrgWmnsu8kytDnAmD+528j8fN/LH
         yZDiFKPlLrSxLRBYp5dS+VjRcLPcYhDC0JlVtBHuwwVb27023L5nLC7ah8+mwgiZwT+L
         ADBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686479221; x=1689071221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a22HjzVjSoWXGTL9TglCphqPmf2Pi6NIr/Is0weeN9o=;
        b=iRNElgOjSMzfWI1wZ/wsEHS0m5q1iMJ7DFcbupq63qO4MCmQi80lMeMoSajmovoLGJ
         CbXRXrJVriZVq6LMdHN6s8Q5IgMCSYF9SuQtLl2NWHP3T5S4sPw5sqqWcsDuwSRS9e+z
         YFsafpP5yr4Nh6RQz9hTdA5K8j0Llg0aTmKwbubKG4oPms2/tOzyFEvCGa6C9MXg4Ye/
         Z1Gv+00GrquPnmqHxH+IgbWRkagrIu31JEcWjERgNr9EvsQGm/FKsTy+vwXC8Ny7UCo4
         mux4Tkn5+a9xZNrF3dbdtFCL4WuFGNFLE78QGw67MGg5hg1PaT2dwIwdhZst1yfe4nnL
         vLXA==
X-Gm-Message-State: AC+VfDzLvsLydNXbqbft+4oa8pcsqLXX8Y61CIm5Bmuz5WUsv02o4xnk
	cSyEVye6H4OW4Pad9RmxGQpOiw==
X-Google-Smtp-Source: 
 ACHHUZ6E9ylSdo9+OY0Zw2a+lCirUbPbGQZJDOrHG+7A7s72zMIAZ4Fbk9IzFifcsPKHY7jJpdVOYQ==
X-Received: by 2002:a17:907:928a:b0:973:940e:a01d with SMTP id
 bw10-20020a170907928a00b00973940ea01dmr7870043ejc.67.1686479220830;
        Sun, 11 Jun 2023 03:27:00 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 a12-20020a17090680cc00b0096f7105b3a6sm3666806ejx.189.2023.06.11.03.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 03:27:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Patrick Lai <quic_plai@quicinc.com>
Subject: [PATCH v2 1/2] ASoC: dt-bindings: qcom,wsa8840: Add WSA884x family of
 speakers
Date: Sun, 11 Jun 2023 12:26:56 +0200
Message-Id: <20230611102657.74714-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WYYZXOIYLA3PKU5KH45W4KKCBWFEVUOQ
X-Message-ID-Hash: WYYZXOIYLA3PKU5KH45W4KKCBWFEVUOQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WYYZXOIYLA3PKU5KH45W4KKCBWFEVUOQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add binding for WSA8840/WSA8845/WSA8845H smart speaker amplifiers used
in Qualcomm QRD8550 board with SM8550 SoC.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Correct compatible (sdw version 1 -> 2).

Cc: Patrick Lai <quic_plai@quicinc.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../bindings/sound/qcom,wsa8840.yaml          | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
new file mode 100644
index 000000000000..e6723c9e312a
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,wsa8840.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm WSA8840/WSA8845/WSA8845H smart speaker amplifier
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+description:
+  WSA884X is a family of Qualcomm Aqstic smart speaker amplifiers using
+  SoundWire digital audio interface.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: sdw20217020400
+
+  reg:
+    maxItems: 1
+
+  powerdown-gpios:
+    description: Powerdown/Shutdown line to use (pin SD_N)
+    maxItems: 1
+
+  '#sound-dai-cells':
+    const: 0
+
+  vdd-1p8-supply: true
+  vdd-io-supply: true
+
+required:
+  - compatible
+  - reg
+  - powerdown-gpios
+  - '#sound-dai-cells'
+  - vdd-1p8-supply
+  - vdd-io-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    soundwire-controller {
+        #address-cells = <2>;
+        #size-cells = <0>;
+
+        speaker@0,1 {
+            compatible = "sdw20217020400";
+            reg = <0 1>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&spkr_2_sd_n_active>;
+            powerdown-gpios = <&lpass_tlmm 18 GPIO_ACTIVE_LOW>;
+            #sound-dai-cells = <0>;
+            sound-name-prefix = "SpkrRight";
+            vdd-1p8-supply = <&vreg_l15b_1p8>;
+            vdd-io-supply = <&vreg_l3g_1p2>;
+        };
+    };
-- 
2.34.1

