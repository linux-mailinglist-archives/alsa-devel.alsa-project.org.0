Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BB25B4587
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Sep 2022 11:15:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D474B169D;
	Sat, 10 Sep 2022 11:14:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D474B169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662801343;
	bh=ngaJugOClaP7qWA6RPY8cfMUgZYlNCgq2WpZNfc/VU0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=P7NlmORBLEIpPQu3l6/sNW4yDKtZbEzHt33I5bnvRHWA12QYH0CL2qwBYBTBtylax
	 1LqJPhpZfn0/zHOHsNADcRgRoo56g5Mh+w/ZGnXj3PoL2FGQ7gwRFW31LEp/Sd3wUU
	 87RXjFvmP2tJvVOZ6ey3F5nUicOD2OSV6EAFRv5A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FEA0F80494;
	Sat, 10 Sep 2022 11:14:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCFC0F8042F; Sat, 10 Sep 2022 11:14:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C2E0F800B8
 for <alsa-devel@alsa-project.org>; Sat, 10 Sep 2022 11:14:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C2E0F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="qEGQSAJ0"
Received: by mail-lf1-x130.google.com with SMTP id f14so5739442lfg.5
 for <alsa-devel@alsa-project.org>; Sat, 10 Sep 2022 02:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=MnFJqajPs9w5f0wSrYoTrh6QdL6OalF/XG7fSTrJrsM=;
 b=qEGQSAJ0Y1+A6G7HzR8kqLHxF5qrjFTyfOvB05i+lVHQbXe5GSugzi3ybCXHJKqEIP
 VJPe15RWqRUPEhcDFXZKOModnP6is6ycQRrOqhb6JzUmyzriOM7POX2QWmolnWx2iK6k
 yqd6lAj+dHCSzO+nSl1BT4qvbPkzTO7t9Zyv5ejy585AxhjVfTaqxRK7x1JOQTILiMIq
 /A0svW5ueD32DTuKGQRZwXiM9lmDlvszd0VLC9JVtc1Wx8wdoR4jMP1c/Lmk0klsw7GT
 u92ApASb2ZfXAe9ArYkL64jbRuDZa7sPEMt6usf789GGChiYeln0eepXRjnDGCLxU2im
 xAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=MnFJqajPs9w5f0wSrYoTrh6QdL6OalF/XG7fSTrJrsM=;
 b=0GBhXUT3m8kvt0zgC77jr+cbWUeMdudt19HKYhph+38WwivDEtLUVjbXtytUaFuA/u
 f23EvJUaabfVjlRzvVqwmstaptAxSLQFx4VkkJ3g8P8mKGtHpLfQFfdUyNqKr+65aw1C
 wFJw03ID915SL1x1j3re3l6TexhHhtpsJvfL0VtHUWskDtRJBwLJal/yKEIm173wSLND
 1dMpija1r0uCLZT00kvFt4WVPLXzSbF5Clltl1YyEq/TB3h+n/sldtKY0Mht3/FRc7jr
 tKV8ZtdJ9rec38JKbWBeABFbDig41pPu4UhqVqkkkNVOxsGKXXBupE2eym4bUtToBjoo
 1PCw==
X-Gm-Message-State: ACgBeo3ngP2k1KHen5fqnLfDHMWfyLwEqHT0upAoIKqV2magI6skW/3c
 NI8DaTRZ3/EgrYNUgiB5IuWQPQ==
X-Google-Smtp-Source: AA6agR7rvJSireVLEoJSasVipDhF0WWaCEg/d89wEbc83LWJO0cFxfvR1RYvLyQYSOsDVa+/rrGoFg==
X-Received: by 2002:a05:6512:3292:b0:497:e864:d913 with SMTP id
 p18-20020a056512329200b00497e864d913mr4550224lfe.132.1662801276977; 
 Sat, 10 Sep 2022 02:14:36 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 x22-20020a19e016000000b0048b26d4bb64sm201552lfg.40.2022.09.10.02.14.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Sep 2022 02:14:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 00/15] ASoC/qcom/arm64: Qualcomm ADSP DTS and binding fixes
Date: Sat, 10 Sep 2022 11:14:13 +0200
Message-Id: <20220910091428.50418-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

Hi,

Dependencies/merging
====================
1. The DTS patches are independent.
2. The binding patches should come together, because of context changes. Could
   be one of: Qualcomm SoC, ASoC or DT tree.

Changes since v3
================
1. Patch 9-10: re-order, so first apr.yaml is corrected and then we convert to
   DT schema. This makes patchset fully bisectable in expense of changing the same
   lines twice.
2. Patch 11: New patch.

Changes since v2
================
1. Patch 9: rename and extend commit msg.
2. Add Rb tags.

Changes since v1
================
1. Patch 9: New patch.
2. Patch 10: Correct also sound/qcom,q6apm-dai.yaml (Rob).
2. Patch 13: New patch.
3. Add Rb/Tb tags.

Best regards,
Krzysztof

Krzysztof Kozlowski (15):
  arm64: dts: qcom: sdm630: align APR services node names with dtschema
  arm64: dts: qcom: sdm845: align APR services node names with dtschema
  arm64: dts: qcom: sm8250: align APR services node names with dtschema
  arm64: dts: qcom: msm8996: fix APR services nodes
  arm64: dts: qcom: sdm845: align dai node names with dtschema
  arm64: dts: qcom: msm8996: align dai node names with dtschema
  arm64: dts: qcom: qrb5165-rb5: align dai node names with dtschema
  arm64: dts: qcom: sm8250: use generic name for LPASS clock controller
  dt-bindings: soc: qcom: apr: correct service children
  ASoC: dt-bindings: qcom,q6asm: convert to dtschema
  ASoC: dt-bindings: qcom,q6adm: convert to dtschema
  ASoC: dt-bindings: qcom,q6dsp-lpass-ports: cleanup example
  ASoC: dt-bindings: qcom,q6dsp-lpass-clocks: cleanup example
  ASoC: dt-bindings: qcom,q6apm-dai: adjust indentation in example
  dt-bindings: soc: qcom: apr: add missing properties

 .../bindings/soc/qcom/qcom,apr.yaml           | 112 ++++++++++++++++--
 .../bindings/sound/qcom,q6adm-routing.yaml    |  52 ++++++++
 .../devicetree/bindings/sound/qcom,q6adm.txt  |  39 ------
 .../bindings/sound/qcom,q6apm-dai.yaml        |  21 ++--
 .../bindings/sound/qcom,q6asm-dais.yaml       | 112 ++++++++++++++++++
 .../devicetree/bindings/sound/qcom,q6asm.txt  |  70 -----------
 .../sound/qcom,q6dsp-lpass-clocks.yaml        |  36 +++---
 .../sound/qcom,q6dsp-lpass-ports.yaml         |  64 +++++-----
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |  10 +-
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts      |   4 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi          |   8 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts    |   2 +-
 .../boot/dts/qcom/sdm845-xiaomi-beryllium.dts |   2 +-
 .../boot/dts/qcom/sdm845-xiaomi-polaris.dts   |   4 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |   8 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi          |  10 +-
 16 files changed, 346 insertions(+), 208 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6adm-routing.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,q6adm.txt
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6asm-dais.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,q6asm.txt

-- 
2.34.1

