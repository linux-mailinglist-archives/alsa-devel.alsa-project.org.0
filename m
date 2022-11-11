Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 983EC625987
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 12:37:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2796115CC;
	Fri, 11 Nov 2022 12:36:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2796115CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668166633;
	bh=Jm97NU5u5YrycvAxcCLz0wI6aXP9yOiT8MtjFloYndg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QorQE8efSOLnuprUMuzSBpEYGVb9M69Ml3RqGznN9qktjW6nGTS2RDZPGfBXbAZc8
	 TRXBJZtVFau+Jxs16KRGQAxY5zPq+lmVP3d5txolKcsEPkCkc1xXWBP2C+JydtqfxA
	 j82Bqb7JXcxS+DImVevV54EBep3SdxzazW1i0ywY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB7D0F80549;
	Fri, 11 Nov 2022 12:36:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A21BF800CC; Fri, 11 Nov 2022 12:36:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46350F800CC
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 12:36:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46350F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="zqzPwf0V"
Received: by mail-lj1-x22d.google.com with SMTP id c25so4216579ljr.8
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 03:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8+lo+EYchQIrutfVK7r/d71O1gZIvEmM22KyAmAwjKs=;
 b=zqzPwf0VhpEKqnCJQeB0cnMdP0hokvV0Xjbk46zcHBaH/WGMkK0ilcn5ZTjIoEjERy
 R+fU8Ifo5B5st2HNnfBFhjhkdVUcahN9cnzJaFzXWQZ/qBD8erQsfNDYiuZv2infQ/2N
 FFWRDmTX+5xIafMQpS5yIKM0Iw0zBUF4U62f5eLnlkO6HaT18V2lBXUNRJ9miqTJUcf/
 JBakGu05Diiy1F6bjHIS2+PSoa4zRdL6a3idwVYdgF4wIhrzSHpuz/Hy5XI6wkR+rLC+
 WwFppQTw8eTdo7P5I4hysvzkWWWwzXLvyXaajXneXiGLptSWzl47/ZerTddPm+9fFVz1
 WYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8+lo+EYchQIrutfVK7r/d71O1gZIvEmM22KyAmAwjKs=;
 b=vi7uYv+S5fmrPJb1deMde+nYmKWGeHBRZ327GBU+mj9HRECPppja0ayUUnSJfPx21A
 cAA4xKzLtBGOJ78pkubNk/yb7Evkq47q5rYtfmzKHYGEOuj4oBvUAw0PDyxqIRmQuKvV
 8Z5JWu9Q6BkYKO4653sTKW5Gi9ccMa1BQ01XzEG/k9jRRcjVMHwVUdCvO/QoNWuXKS1Z
 Tp+nYLVGIjmasPMc29uoydI5kEmdFpycIpRfj/fKACmVdKrk9kxxg6avLdt8qPR2+VkW
 iBGNH7vBlelr6UeMEg1cpdtOxgTHltuRbI/BRciELSwIISKQFAWB1wRqct/MfP7imk1v
 bqcg==
X-Gm-Message-State: ANoB5pk0AhTcH0kMiIIDVqJnGq3iwWk57D8fv5q1PvNMubkoFgYlLgyO
 7efvVBgxUdkxZeBqqwF5jb/sQA==
X-Google-Smtp-Source: AA0mqf7Af5u4htDHYrs+2hewvDJau4fu8DLkLCe3TaU8xXrl/EP9cN9v5Txbclnj1xYPEGYOF2lwPA==
X-Received: by 2002:a2e:960c:0:b0:278:eab6:7542 with SMTP id
 v12-20020a2e960c000000b00278eab67542mr300253ljh.400.1668166568655; 
 Fri, 11 Nov 2022 03:36:08 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
 by smtp.gmail.com with ESMTPSA id
 bi30-20020a0565120e9e00b004acb2adfa1fsm274970lfb.307.2022.11.11.03.36.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 03:36:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 00/10] ASoC: dt-bindings: Rework Qualcomm APR/GPR Sound nodes
 for SM8450
Date: Fri, 11 Nov 2022 12:35:37 +0100
Message-Id: <20221111113547.100442-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Patrick Lai <plai@qti.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Srinivasa Rao Mandadapu <srivasam@qti.qualcomm.com>
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

Adding sound support for Qualcomm SM8450 SoC (and later for SC8280XP) brought
some changes to APR/GPR services bindings.  These bindings are part of
qcom,apr.yaml:

  apr-or-gpr-device-node <- qcom,apr.yaml
    apr-gpr-service@[0-9] <- qcom,apr.yaml
      service-specific-components <- /schemas/sound/qcom,q6*.yaml

The schema for services (apr-gpr-service@[0-9]) already grows considerably and
is still quite not specific.  It allows several incorrect combinations, like
adding a clock-controller to a APM device.  Restricting it would complicate the
schema even more.  Bringing new support for sound on Qualcomm SM8450 and
SC8280XP SoC would grow it as well.

Refactor the bindings before extending them for Qualcomm SM8450 SoC.

Best regards,
Krzysztof

Krzysztof Kozlowski (10):
  ASoC: dt-bindings: qcom,apr: Add GLINK channel name for SM8450
  ASoC: dt-bindings: qcom,apr: Split services to shared schema
  ASoC: dt-bindings: qcom,q6afe: Split to separate schema
  ASoC: dt-bindings: qcom,q6apm: Split to separate schema
  ASoC: dt-bindings: qcom,q6adm: Split to separate schema
  ASoC: dt-bindings: qcom,q6asm: Split to separate schema
  ASoC: dt-bindings: qcom,q6prm: Split to separate schema
  ASoC: dt-bindings: qcom,q6core: Split to separate schema
  ASoC: dt-bindings: qcom,q6apm-lpass-dais: Split to separate schema
  ASoC: dt-bindings: qcom,q6apm: Add SM8450 bedais node

 .../bindings/soc/qcom/qcom,apr-services.yaml  |  54 ++++++++
 .../bindings/soc/qcom/qcom,apr.yaml           | 119 ++----------------
 .../bindings/sound/qcom,q6adm-routing.yaml    |  22 +---
 .../devicetree/bindings/sound/qcom,q6adm.yaml |  51 ++++++++
 .../devicetree/bindings/sound/qcom,q6afe.yaml |  69 ++++++++++
 .../bindings/sound/qcom,q6apm-dai.yaml        |  19 +--
 .../bindings/sound/qcom,q6apm-lpass-dais.yaml |  32 +++++
 .../devicetree/bindings/sound/qcom,q6apm.yaml |  67 ++++++++++
 .../bindings/sound/qcom,q6asm-dais.yaml       |  48 +++----
 .../devicetree/bindings/sound/qcom,q6asm.yaml |  68 ++++++++++
 .../bindings/sound/qcom,q6core.yaml           |  39 ++++++
 .../sound/qcom,q6dsp-lpass-clocks.yaml        |  40 +-----
 .../sound/qcom,q6dsp-lpass-ports.yaml         |  57 ++-------
 .../devicetree/bindings/sound/qcom,q6prm.yaml |  50 ++++++++
 MAINTAINERS                                   |   2 +-
 15 files changed, 477 insertions(+), 260 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,apr-services.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6adm.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6afe.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6apm.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6asm.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6core.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,q6prm.yaml

-- 
2.34.1

