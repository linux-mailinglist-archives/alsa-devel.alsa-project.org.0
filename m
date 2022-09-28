Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEA05EE01B
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Sep 2022 17:21:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FA8285D;
	Wed, 28 Sep 2022 17:20:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FA8285D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664378495;
	bh=4MQbLIbYdFOQrtDhtZhoSkL/M7RtjtOSMP+9Gvw84RY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AWpmZWIdcaUWMfFu6rSsxLnBdBTWOm1rE/vyPY6IIYszJhffO/J2O+aOnkhkjeEKF
	 jZFFHNeeU5UNOKI8cFAjuZQhM70JXsA9QQBSUWGoXzReJ7PnX1aXVGRNiX8oxDhWfL
	 s+PNJa83Z8uQ54SdiI3YJ4r0LSqQSGMsV4hMceyU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B5278F804D6;
	Wed, 28 Sep 2022 17:20:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D399F80310; Wed, 28 Sep 2022 17:20:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7278F80109
 for <alsa-devel@alsa-project.org>; Wed, 28 Sep 2022 17:20:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7278F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="PkBVVwPB"
Received: by mail-lf1-x136.google.com with SMTP id k10so20894194lfm.4
 for <alsa-devel@alsa-project.org>; Wed, 28 Sep 2022 08:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=+AW8Is1FVTDso//LQSgbOHL1fMk2euaPSX4JNKxWqmE=;
 b=PkBVVwPBc/ukSWATfGW4f47280k0JWhj5Oq60rhLuWqSQ7crRaBJGhiBuyCXUnz628
 eBM6jXnKh7zjygxkIW8+gU+OvLeVxexNCa8xDJadVukAebqyJGlzr8N3UEHzwaMwaQyI
 t2Zdq3WrRT7Riz8Y/sNbmjfvw31yfzlnuCxBteJM/D/+xOVZLd6czNDWQ4fp76YBBgrF
 2voisIdVU3NErGEytTsItUC+0HmimUzJkCWdRr3OWfsKtpEej4fepQpquDwaiu2LdTTB
 ni0sK/oXfzmOstty93omDfa+d0+oHw21TV3XBaGFkeEuhphOMZTvmpRjYus4m2jm757+
 973Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=+AW8Is1FVTDso//LQSgbOHL1fMk2euaPSX4JNKxWqmE=;
 b=tWy4uHnaf3xcqRYWZhqYh1Gq1I9DXee2Y7Fd/6QXj7ccYbRR2fvBrOLnYUTWMPI3aH
 9zuMho3bipQelrd3CSi9yVcP6+lGdBdiShQCif61NPrikJUdIRJoQuNz4xQMchV16SKt
 5YvrffoDC4RfYG1vZ4fQuRStDaUcVNfaYcd6FKKbDU+Ec2HQ9uXfOqWp3CR+CAJa4qsd
 9k6RlH2NTy5JOZoX5qxZvIZZ4NSjyzX/D7zwxHQ/bb/dBv6afjFMUuSpFO7QIFkX7Luq
 o3tgIe18ltKQB+04GUiOZgNo1PT+xZKKhYvLIxNFTmaRc0/ah4Tx6UexTKJBgIuAwmVO
 jh7g==
X-Gm-Message-State: ACrzQf2x8H1fTgBiG5GV15fQkA5r4gMtXLJeor0I+swndVtlbVhKMQST
 NoDJKBlekJfUhA894kV4WkMjzg==
X-Google-Smtp-Source: AMsMyM5YtSktaVdhZs9z/wCj0AI6G8xAEWaPYa5/QuIed9G0+M5ewA4ekcCzfhAvb/UC+7hzod/Ddw==
X-Received: by 2002:a19:5e4f:0:b0:497:aa47:86b8 with SMTP id
 z15-20020a195e4f000000b00497aa4786b8mr12346955lfi.261.1664378431688; 
 Wed, 28 Sep 2022 08:20:31 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a056512048200b00497a41b3a42sm503023lfq.88.2022.09.28.08.20.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Sep 2022 08:20:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 00/11] arm64/slimbus/dt-bindings: convert to DT Schema,
 minor cleanups
Date: Wed, 28 Sep 2022 17:20:16 +0200
Message-Id: <20220928152027.489543-1-krzysztof.kozlowski@linaro.org>
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

Changes since v1
================
1. Fix commit title typo (Steev).
2. Add Rb/Tb tags.

Dependencies
============
No dependencies. Binding patches are independent from DTS.

Best regards,
Krzysztof

Krzysztof Kozlowski (11):
  arm64: dts: qcom: sdm845: drop unused slimbus properties
  arm64: dts: qcom: msm8996: drop unused slimbus reg-mames
  arm64: dts: qcom: sdm845: correct slimbus children unit addresses
  arm64: dts: qcom: mms8996: correct slimbus children unit addresses
  arm64: dts: qcom: sdm845: drop unused slimbus dmas
  arm64: dts: qcom: msm8996: drop unused slimbus dmas
  arm64: dts: qcom: sdm845: align node names with DT schema
  arm64: dts: qcom: msm8996: align node names with DT schema
  dt-bindings: slimbus: convert bus description to DT schema
  dt-bindings: slimbus: qcom,slim: convert to DT schema
  dt-bindings: slimbus: qcom,slim-ngd: convert to DT schema

 .../devicetree/bindings/slimbus/bus.txt       |  60 ---------
 .../bindings/slimbus/qcom,slim-ngd.yaml       | 120 ++++++++++++++++++
 .../bindings/slimbus/qcom,slim.yaml           |  86 +++++++++++++
 .../bindings/slimbus/slim-ngd-qcom-ctrl.txt   |  84 ------------
 .../bindings/slimbus/slim-qcom-ctrl.txt       |  39 ------
 .../devicetree/bindings/slimbus/slimbus.yaml  |  95 ++++++++++++++
 arch/arm64/boot/dts/qcom/msm8996.dtsi         |  18 ++-
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  16 +--
 8 files changed, 315 insertions(+), 203 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/slimbus/bus.txt
 create mode 100644 Documentation/devicetree/bindings/slimbus/qcom,slim-ngd.yaml
 create mode 100644 Documentation/devicetree/bindings/slimbus/qcom,slim.yaml
 delete mode 100644 Documentation/devicetree/bindings/slimbus/slim-ngd-qcom-ctrl.txt
 delete mode 100644 Documentation/devicetree/bindings/slimbus/slim-qcom-ctrl.txt
 create mode 100644 Documentation/devicetree/bindings/slimbus/slimbus.yaml

-- 
2.34.1

