Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70177727A7B
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jun 2023 10:52:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96D2A6C1;
	Thu,  8 Jun 2023 10:51:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96D2A6C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686214330;
	bh=Wi9tUY/ZZ5NW2sYL/SDdJj19DbpFAbB+7oBekHR15jI=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rb8ga5FeRN/CK6b6HU0A1zQ2hhLNSr3V+3o07OkvzD8xNn4m6jjQkDTE1P0Kt6fVz
	 2lUqcQQr57GIUWE4GJHXD48laOJkE9uDdBE6HgPcYcaKuVW/fbfAyoAYQexsofFHLq
	 ntI3hEpNBMqY5qE7OvDN7KP09TxW4GkiFOv6P0CQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95645F8056F; Thu,  8 Jun 2023 10:50:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0562CF800ED;
	Thu,  8 Jun 2023 10:50:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0050CF8055A; Thu,  8 Jun 2023 10:50:55 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 36B20F80549
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 10:50:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36B20F80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ZGzz5r4b
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-97668583210so57849966b.1
        for <alsa-devel@alsa-project.org>;
 Thu, 08 Jun 2023 01:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686214231; x=1688806231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jVm0fhsNyk10WhIekiGem2q5QIQ6o6txtC4ntkrd51Q=;
        b=ZGzz5r4b575ZzlWyig0XGGzxar6+zK8gw7Jyz0wDHVB9LFFbul3V1P87N+8nYaYXQI
         MBmcg30HbUj50Lrc0QCi+Nv37lgqcOdyPK9/J4EXa6eXcnNOMkeh84/ofONzkYEG2fRf
         IPtGqxc4wQJ5h72vACNtcnXEbae9MxmdHiTMfXJmIpomgeY10r01oXFsnjKZAYb8G5LA
         HAIK8Ur2SF/J3z6Ydqjesotxs4SQLvskd+JlbW+oiVxWTBBrf8UoyH7APR5Q+7HXkY+u
         ZbVxmplqpBFm1cujdheR8PS17ZPMoJl6gVBcqh0I905CDBGvMXLP6qUolqwMq7L7S8Nq
         Jk0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686214231; x=1688806231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jVm0fhsNyk10WhIekiGem2q5QIQ6o6txtC4ntkrd51Q=;
        b=Z/hpuRxDZBFEc+OXtbtoNbJeDo25ZIB/+IcGeuWNlkjgvFKxojb6aQIAYHkTZYJDKT
         Og1bjppHjZilGz5AqMXr84ogsnnFoli6hCiJ6aATrb9ZjtCwPyDuagwtpEX8yOA/Paty
         smsOOP5tlkPEQPMgIWx8e21jZdDo9Iv6GKq5bdfF9Gb6R8arCxLmdtrB02SzLnL5oinj
         5JXxzfuaNT+1hCuS80qyrABDs/hWYdpRmmkW9Ua8+fL4Oyl3FxNkQhVQp4DwrWOr6fUb
         Ai4vfGVHTN4buqWxJ+iWMtrpslQVlxR57+npDKISIFdnkuZ4I8L8yFJPbuVnG0UE8skm
         mmHw==
X-Gm-Message-State: AC+VfDyrYlgxbmCjLyvHvz10KG5INYCRpD+RhSG+tbCCNr45Jpmr6yjk
	ubghvLTYgKHRMsPMWcDzypKRag==
X-Google-Smtp-Source: 
 ACHHUZ4pnN5cAyFjYUsGInH/tdkVvDcSKcCSn4zKfvrsA6R6pzv5+PGqhAmrFI8c2EPYKNODjDdUQQ==
X-Received: by 2002:a17:907:d29:b0:973:ea73:b883 with SMTP id
 gn41-20020a1709070d2900b00973ea73b883mr11133516ejc.66.1686214231091;
        Thu, 08 Jun 2023 01:50:31 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 gg24-20020a170906e29800b00974638e4a98sm410173ejb.24.2023.06.08.01.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 01:50:30 -0700 (PDT)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] ASoC: dt-bindings: qcom,wsa8840: Add WSA884x family of
 speakers
Date: Thu,  8 Jun 2023 10:50:22 +0200
Message-Id: <20230608085023.141745-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SIYRLU34SPQWGAVOTJCRXKWUGLMUB4FX
X-Message-ID-Hash: SIYRLU34SPQWGAVOTJCRXKWUGLMUB4FX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SIYRLU34SPQWGAVOTJCRXKWUGLMUB4FX/>
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
 .../bindings/sound/qcom,wsa8840.yaml          | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml b/Documentation/devicetree/bindings/sound/qcom,wsa8840.yaml
new file mode 100644
index 000000000000..a999f787aa4d
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
+    const: sdw10217020400
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
+            compatible = "sdw10217020400";
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

