Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0115E7F7D
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Sep 2022 18:17:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C0BA820;
	Fri, 23 Sep 2022 18:16:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C0BA820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663949830;
	bh=ApNAbIysxxu/OPpHAmC2Uw8Cstg+gAiad6vR8rhqz9Y=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nRDwmu3CNAkxJqHWL+kYHqro5+Eo7HleuxUS6RzPCkdjFIDSBA2e7rQiZKeqB+Avm
	 kH7TMMK9464VWsdCu532d/XsWugwlgNJgioIK66+mE48n2dqHvgGb8YLzO6i0PQoDa
	 ffCvR5fx9Z0xrfbgpImpfg1zuopmBLcc98/hEy3U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BE75F804E4;
	Fri, 23 Sep 2022 18:16:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F14A1F80431; Fri, 23 Sep 2022 18:16:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46732F80124
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 18:16:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46732F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="qqV26RwC"
Received: by mail-lf1-x131.google.com with SMTP id i26so1013180lfp.11
 for <alsa-devel@alsa-project.org>; Fri, 23 Sep 2022 09:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=4ZxFhAtlkmVi+zyjgne0H/PaIcc4S2ELDkPdgjxjFQI=;
 b=qqV26RwCK1Rl2eHTO4j/EIi2hWLVPqcd6bL061LH0aVd0FEdQOjsCOPHBaiBLaEXv7
 f18WO40/a17eQX9Z2uvUZkpbqN5j0q5B5Nixg5PokmYn9Dy4JeIy/YXUEu5FzX92L/9f
 qwGg+jamXznw56s4ta4p1k3j0F7pElYUNcbQDO7IdCoWCqGGLvGtKAYRBVqziF7jGn7f
 jVtGVC6XktFQnD0IuFB7xLzp4eja/6GuaHgrrFM6aWxihT3VhPrD+YjUlPkmXnI3sxJD
 V4UJZLVkZJCHth2oq0doFxfFBxLErNzGuipIYBnm/uHqrhB63Ysy64xmFr9ZEF2/iBmV
 V5WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=4ZxFhAtlkmVi+zyjgne0H/PaIcc4S2ELDkPdgjxjFQI=;
 b=ctkoSLH18CQ7PRDWAkiQelNCAe0vKkK5g5WluiOxAj9fteqNHUcDlSyAk7vef1b+M2
 cOPRNPhU4u0P0dL/woou+1XecfR6vpq1fc9k9SK8+epz7VNoaqFSJhbE2rB3J7DX7Fz0
 Xog7WZeCZ3qrgCzPnNxygVfbntjKyvvjKJtjkTg3IJHFWwu9UhqOJk1JiUjcOim6L3eQ
 0wV6AoZtTdyNCds0tIqvJXO+5miT210HRWBatA+OQl+GuWA5Tkzzf6V5f6aZoa/cVdi3
 eYL+xz6OsXOWJ1/oS6ROpX8KMQ++YSP9SvhnCHZPWdTwSyG9Zuccbh1RrcjO2eemIHtT
 De7g==
X-Gm-Message-State: ACrzQf22q82SvOeLp4VlgG3t2JF+iZ2rs7LPAA3j1JOWgyMqRfrztHtV
 WSuaQPYO3nfPvI77vuaAr2hM7A==
X-Google-Smtp-Source: AMsMyM6RJAQLHoe8yznAY7iJUvmbip9ShKX8pvPR2ghx8rYTi8cfMFRZI5+EFgBrkzxtHjbVox0GXw==
X-Received: by 2002:ac2:5469:0:b0:497:ed1:97c6 with SMTP id
 e9-20020ac25469000000b004970ed197c6mr3344005lfn.248.1663949766969; 
 Fri, 23 Sep 2022 09:16:06 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 f9-20020ac25cc9000000b00492f45cbbfcsm1493491lfq.302.2022.09.23.09.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 09:16:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH 00/11] arm64/slimbus/dt-bindings: convert to DT Schema,
 minor cleanups
Date: Fri, 23 Sep 2022 18:14:42 +0200
Message-Id: <20220923161453.469179-1-krzysztof.kozlowski@linaro.org>
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

Shall slimbus.yaml go to dtschema repo?

Dependencies
============
1. Binding patches are independent from DTS.

Best regards,
Krzysztof

Krzysztof Kozlowski (11):
  arm64: dts: qcom: sdm845: drop unused slimbus properties
  arm64: dts: qcom: msm8996: drop unused slimbus reg-mames
  arm64: dts: qcom: sdm845: correct slimbus children unit addresses
  arm64: dts: qcom: mms8996: correct slimbus children unit addresses
  arm64: dts: qcom: sdm845: drop unused slimbus dmas
  arm64: dts: qcom: msm8996: drop unused slimbus dmas
  arm64: dts: qcom: sdm8458: align node names with DT schema
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

