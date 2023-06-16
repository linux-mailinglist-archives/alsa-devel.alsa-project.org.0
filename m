Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC85733097
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 13:59:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEEAD82C;
	Fri, 16 Jun 2023 13:58:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEEAD82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686916764;
	bh=HD7GjSI1mE5jvDx6YUBf5s53VuOmTilCTScXEIy9MF4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=QNH4jDwC9kScBXJjnaGFs4GfddAKTDpkQwYg0TS6PkszMhO5aPis5luXaw0QnJqvr
	 7BJ040AT2PcTYrkOteKXH4rNQIDXxsEo+d7GAk70dqvntQNyOv/qjXH8MX9JFxeUOh
	 zNyG58NZzcviLqdycgsCtKFL4L0Ib6McRB22bHv8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC104F80549; Fri, 16 Jun 2023 13:58:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 75AD1F80132;
	Fri, 16 Jun 2023 13:58:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48E27F80246; Fri, 16 Jun 2023 13:58:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0B023F80132
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 13:57:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B023F80132
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=gqCyE0hm
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9786fc23505so83818866b.2
        for <alsa-devel@alsa-project.org>;
 Fri, 16 Jun 2023 04:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686916677; x=1689508677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aCcBymWVvFUYBpDZiz8yU1Vny7cOsw1jZWNc7ndk0g0=;
        b=gqCyE0hmXsh5+SvPr4OtsUuNGaxP4q3VKwqLomoxeLqsyxVvM54E9sDqWkU7Bh1nJ1
         Mzqu5MZLDqSPGBAQFRES9i88e7cqUWq6rnwxNXNL7tzsoi2f7mRzHtt2Gm+WzMzSR/Qh
         cssftCLEP0z0dXLpUOSEog8oIUg3lBKoxv9LrW3+Sq8+zyzfo8n5twzwQrkonoMRcCe2
         Ct9CrZ4L3ceZ5ReVNuxtBnJJmZQkhd9ltJBbHgzZaemGxAxeaoHPWQqPpNRF62TRAEft
         bz9A1iWyo9/1VRN/1G5UC3rpjbV1w3tMVut/aeuWu8n3DiLa7AQQj3Ed59gUf88Hx2QT
         //PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686916677; x=1689508677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aCcBymWVvFUYBpDZiz8yU1Vny7cOsw1jZWNc7ndk0g0=;
        b=aRVL3/evE62NYy/kt7KfXuOOAMGyYqOwoa6/LAAWRhHPJsvGqAzk8Aqr/RLqitS73X
         o6665OnCw/hliq3NA1m8eKHnAPLy1wuYCfMiX+Mr60I0L+/zXTL6XzBWgnJfiSVCSavP
         lk+XytUgN31XNu712i7rJVpdQx+hcJ/VV9xPexzKp+CSnwq/gAkDbPt2bTXSvTix+ZC6
         Bb88NIRPYSVARRmJtEFcB65D/PUFStgzHGC1A7MWwxFBUcV/obkilLnwjDtIAE1dkGEx
         DAx9o2WyqDu7XFr1mKsksVWUl17QYNCcU4P6Mwgjj2bmehXA7j/L6nv43SzM/aw6XqDv
         o7ig==
X-Gm-Message-State: AC+VfDxsm9isTtUkKBBD4nCLknSZi1asOt17WTpZEeHn5/TtXfOqCm+5
	JUkgNR1igNEiicHBcxdKnaDHxA==
X-Google-Smtp-Source: 
 ACHHUZ6vE3R7qCnh2PCNxWO4ZDi/LEFRqmkN2EuSjzOX5wnWLJIPzyKm2jXbyfA+JjRibTxAsX8UkA==
X-Received: by 2002:a17:906:f1c3:b0:974:419d:7837 with SMTP id
 gx3-20020a170906f1c300b00974419d7837mr1304247ejb.34.1686916676767;
        Fri, 16 Jun 2023 04:57:56 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 g19-20020a17090613d300b0097889c33582sm10723823ejc.215.2023.06.16.04.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 04:57:56 -0700 (PDT)
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
Subject: [PATCH v4 1/2] ASoC: dt-bindings: qcom,wsa8840: Add WSA884x family of
 speakers
Date: Fri, 16 Jun 2023 13:57:50 +0200
Message-Id: <20230616115751.392886-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KHA4ZQGWPQHMFAGGB25ZVERDX7DCRJUM
X-Message-ID-Hash: KHA4ZQGWPQHMFAGGB25ZVERDX7DCRJUM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KHA4ZQGWPQHMFAGGB25ZVERDX7DCRJUM/>
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

Changes in v4:
1. None.

Changes in v3:
1. None.

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

