Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED59472BDFD
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 11:58:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04402FA;
	Mon, 12 Jun 2023 11:57:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04402FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686563925;
	bh=wmP80I6FyqlQ+8A8rYsZmyODnLn517wXgyvsZU4MkDk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=n2uPWh/5sfoOxVAqVBhGIOpuFTSvLGGS2Dg4LyUhogaWI6Im51698wFk47/kmVmzG
	 +uqBaX8KlvIXtObMCr5eGRnq054/WB7o4KSL2gK2ePTaJDnYiy45L+Nd2KR+MNdB6B
	 Cfl4TqRNXA000oy1Z+NYvmCujLJoWUX9hk1oEn2U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43FE1F80567; Mon, 12 Jun 2023 11:57:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B410EF8052E;
	Mon, 12 Jun 2023 11:57:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66311F80301; Mon, 12 Jun 2023 11:57:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DD1F1F80149
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 11:57:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD1F1F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=pRDueYu/
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-970056276acso627992366b.2
        for <alsa-devel@alsa-project.org>;
 Mon, 12 Jun 2023 02:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686563842; x=1689155842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PJzV8k8PINg1fP+cCISdw3LZJs7BP96rMaIUJI+fFlI=;
        b=pRDueYu/tRrKVqAPFSh1p62giJ9RVa7Yo9TLHpe2QX9ej46v2Wogo2mbh8849n8ogB
         dPaaUGzBADFJyl2t/WTZoC9MXCBEcexqjVbxR6vrW6EIOjo7OcwcMmGnoeQHS9tsuP3V
         +SV3tFKnreUnzF5WizOcX6cgvGNUFx7u/HP4ksaOqhr9Y/xKjqqHkronwZocWhANGLnQ
         u7uGuobDV9pirCr16hxp4/FuXchXADQaY/oUHuBvvblot3QCIG/e399R+nOEQkAxRb79
         28F3DN+VoBrvYWoaQVzB68j0CNl6cshrt9LPh3QcFnNB9W7cQ9bra0Iff70wbfJu698t
         M1pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686563842; x=1689155842;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PJzV8k8PINg1fP+cCISdw3LZJs7BP96rMaIUJI+fFlI=;
        b=EGG3zDuEMxVAwvS500rGyOmrToazh7F5JSTlKTY/Cf+IHIBp4/0+8MOErwyivk9ymb
         418braQ/WNk7NFj8EemA1KJT7UkPY5kkcKjwO6aPndPNsWKFIGfLdUI/OdANoPJ1N6+m
         4rqRqsa422W7FMgDE1fEnLfJlEMuwp1F9zj+cNSoY4fGO3lj1oWd/iC2jB0L0dt/HDx6
         0p4rv6/Zc3LvIcSbNqxvEuKc3WLEgr0tbXWAumT1I0ExE8Jp89tGI/5j6U9sSNPpOUwg
         4XGzCHR4LLNk8eUAgpjS1qt60Kr1P36MMm6mgyblcrU7u/WXRKlU7HyCj434HhUzwpXw
         zj0Q==
X-Gm-Message-State: AC+VfDzoBeOS4LVWf8BcMLVmSyjrdu2S/o4+0ySk3ayPEdjZX+y0vY/k
	ZwYMWo3Cu6ObVZFRRU3YtG+7jw==
X-Google-Smtp-Source: 
 ACHHUZ6pRYxendYgoWbyLTl7w4hnUEIQzwT9hEIK8twkyXzDMp6cMGP7pSNdEbVfvpmiucwLWMNLKQ==
X-Received: by 2002:a17:907:3182:b0:974:1eb9:f74f with SMTP id
 xe2-20020a170907318200b009741eb9f74fmr7847298ejb.15.1686563842037;
        Mon, 12 Jun 2023 02:57:22 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 u1-20020a170906780100b00977cad140a8sm4949175ejm.218.2023.06.12.02.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 02:57:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Patrick Lai <quic_plai@quicinc.com>
Subject: [PATCH v3 1/2] ASoC: dt-bindings: qcom,wsa8840: Add WSA884x family of
 speakers
Date: Mon, 12 Jun 2023 11:57:15 +0200
Message-Id: <20230612095716.118631-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BGH2IRKCKE33F23EVHVWWN5BR2Z64X52
X-Message-ID-Hash: BGH2IRKCKE33F23EVHVWWN5BR2Z64X52
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BGH2IRKCKE33F23EVHVWWN5BR2Z64X52/>
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

