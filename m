Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A01D5B01A0
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 12:17:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8D721697;
	Wed,  7 Sep 2022 12:16:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8D721697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662545862;
	bh=qEBMgmyeZaKnxoZw0KHqBN1aCiDUkVTtzzaZREz2b0I=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SVGcbhbi+vHckPLFjTS966jbEq6D9chu5DJL2eWaIeu7sXjQ6ci8o8071etGgmIvz
	 gajkXdLVUdl2vEV7YD6unTU9hIb8b5Jf0HJIPhDg9UPxzIz+u1iUmqaa1Gn/PxODAq
	 B+Wi0NmU8Ey6q3PVD6vtUNinO05AvSPFd6Jj5iuQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D609F8053A;
	Wed,  7 Sep 2022 12:16:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4AAC7F804FC; Wed,  7 Sep 2022 12:16:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D01F8F8023B
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 12:16:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D01F8F8023B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Hy6HBAQe"
Received: by mail-lj1-x233.google.com with SMTP id z20so15397339ljq.3
 for <alsa-devel@alsa-project.org>; Wed, 07 Sep 2022 03:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=3cA7dqgK29hXFF6uJvQ4BHeA+tHJfj6koNcu22+1Hr8=;
 b=Hy6HBAQezdf60tWZN7LIjziTj7M5/9xzdLhTneso24T91epLE3nPn9M8nxyWLbW3il
 Q19WX3z+2P+rJzT7gZ7RysB5pIGPedgOjzYPe1GNmlgSIW4IhKgsGWvaF0uKalQLJmNC
 sIKZY0M9eXiTUWMoH8SQ+sbPS+PjyFd7bwoxV1Vx6uD7kFv3tZAHuPWcCc93bFlVqqgz
 ffvw96bh2JvBb8zkJ07L+PpwTfVW309r0MSM6cioLCDhaFaVj8tfzN+8w05a4x3BwnbB
 LLbicUcFjmSf3QtHvhInoZ4q3uuC1hRUFVAT2BbW2w454cw8bNypO+Hm/AeVTZj3Tn/D
 vuzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=3cA7dqgK29hXFF6uJvQ4BHeA+tHJfj6koNcu22+1Hr8=;
 b=HvX4Ow4nXfcHL1l0BObIawfS7V+CRRwTlmMXtuUbHTPArcZFMg9D/fJxm8mHYw3Vt/
 6JyADQT8hlzsYFmflrIVG2NPzDyYG5mcdkIMpGmB7Qy9rukCf2p6LSECV59EwJnctRIR
 voR2OtNxtbNfN7HTQgKcX/RTQT1PubjKHN+PZ8/E2545c73kCM455uBEnJhkv8PVN5xO
 cbBOgfo3pu4ex6m3DBUcu+5opF3plJCTOBCQG8YZYXjh9UCOwFgHwbPbmnUcpw2pvmHC
 8n7Qvg+xPubViK/q5k5a2qHnikO8/q7Fx+cyzVDS2yX6GQ4ysKlIQiN2pm3ZyrreJ3iN
 Un8A==
X-Gm-Message-State: ACgBeo2fLlfDdXzHUaRu3OCVmJTUcmyGIO8OU2/iPV4AjphqeotCIhe2
 msej6dzUDFH7Nr8uDwA3ikU16g==
X-Google-Smtp-Source: AA6agR5kMxBjpX/4YyjspCvud2EcoThLtvD9lUV+btA0OeIkvy3ClJ+phX0euGGDKW9B8lVVVSNYJw==
X-Received: by 2002:a2e:a309:0:b0:26a:c623:264 with SMTP id
 l9-20020a2ea309000000b0026ac6230264mr717373lje.267.1662545764599; 
 Wed, 07 Sep 2022 03:16:04 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a2ea169000000b0026ab0e480bcsm960734ljl.39.2022.09.07.03.16.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 03:16:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH v2 00/14] ASoC/qcom/arm64: Qualcomm ADSP DTS and binding fixes
Date: Wed,  7 Sep 2022 12:15:42 +0200
Message-Id: <20220907101556.37394-1-krzysztof.kozlowski@linaro.org>
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

Changes since v1
================
1. Patch 9: New patch.
2. Patch 10: Correct also sound/qcom,q6apm-dai.yaml (Rob).
2. Patch 13: New patch.
3. Add Rb/Tb tags.

Best regards,
Krzysztof

Krzysztof Kozlowski (14):
  arm64: dts: qcom: sdm630: align APR services node names with dtschema
  arm64: dts: qcom: sdm845: align APR services node names with dtschema
  arm64: dts: qcom: sm8250: align APR services node names with dtschema
  arm64: dts: qcom: msm8996: fix APR services nodes
  arm64: dts: qcom: sdm845: align dai node names with dtschema
  arm64: dts: qcom: msm8996: align dai node names with dtschema
  arm64: dts: qcom: qrb5165-rb5: align dai node names with dtschema
  arm64: dts: qcom: sm8250: use generic name for LPASS clock controller
  ASoC: dt-bindings:: qcom,q6asm: convert to dtschema
  dt-bindings: soc: qcom: apr: correct service children
  ASoC: dt-bindings: qcom,q6dsp-lpass-ports: cleanup example
  ASoC: dt-bindings: qcom,q6dsp-lpass-clocks: cleanup example
  ASoC: dt-bindings: qcom,q6apm-dai: adjust indentation in example
  dt-bindings: soc: qcom: apr: add missing properties

 .../bindings/soc/qcom/qcom,apr.yaml           | 111 +++++++++++++++--
 .../bindings/sound/qcom,q6apm-dai.yaml        |  21 ++--
 .../devicetree/bindings/sound/qcom,q6asm.txt  |  70 -----------
 .../devicetree/bindings/sound/qcom,q6asm.yaml | 112 ++++++++++++++++++
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
 14 files changed, 293 insertions(+), 169 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/qcom,q6asm.txt
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6asm.yaml

-- 
2.34.1

