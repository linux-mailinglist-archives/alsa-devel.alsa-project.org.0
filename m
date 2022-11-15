Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 859E362980B
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Nov 2022 13:03:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25FD01680;
	Tue, 15 Nov 2022 13:02:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25FD01680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668513828;
	bh=KhsjBVyj2oyNO1Y4KXEfBb1d+D3KX0o+H0z1pfjVsws=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DJp27R4O6ZMkBALH0rBB5djfSemPcGQBBZhdQeVgr20+qFozi2Da2RxwFBVWWrLZG
	 ixj851mbwO29SyeXYG+gMcRCPCHYilkN5zxTADcteMWWcQl0c/MCARK9dY3hMinPrb
	 /m6FgyRMyW597j6B/CmTur2qfuGTzIjZjQsS6tA4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7D4DF80557;
	Tue, 15 Nov 2022 13:02:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5DF7F804C2; Tue, 15 Nov 2022 13:02:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69450F800B8
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 13:02:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69450F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="jc/2P1sO"
Received: by mail-lj1-x235.google.com with SMTP id c25so17218248ljr.8
 for <alsa-devel@alsa-project.org>; Tue, 15 Nov 2022 04:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Tr0hsDbh9KbOdv41EiPQ4QS/cPO20otloy2LEsAs9hg=;
 b=jc/2P1sOGoD4Nibn4NzcXND68JKBva0ib4bhOvNqC4Z0V/WDjcEVt+/X/0w5HJPxGj
 op2lkoIm8gbCQTA5W0MWZPZMzlFS0W0hSgTMnf7iE0heXpa4aL95DaEapG5KP0Jhcl5R
 DNPUzU36b10NQu7trgOD1Fh4EfBhu5Mb1G+VwMh4Msh1ZkFisr3ixNlx+IP7N6QzmqTm
 LtirX6gefbCRgNPEzhRMDfrTVIs30rbVaYV8sGtgXfGG3HpC9yv4RC/hc+uqS8R1d444
 I3XfAfIcOaRpKLjMAamtlsOIPZanWBlvewZLpKN8vHS+8HIqRy77eHctf45HvIZMSxu+
 Kasw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tr0hsDbh9KbOdv41EiPQ4QS/cPO20otloy2LEsAs9hg=;
 b=xmP/lGsecXjg9OgSpjdBE1BnHRwdzT1QKcvc2+E1dms0N0JetjgPPxfTH0R2vhcnWg
 qEE2kk0ngdUPMArkYTEz1BOylGfPLWX0OqCszyO7b8s8eQFvy5anwc2+Sh24ttq8rfye
 XJQKG2v8z/sDqiCYa9qBV0tweZeTdsCyiQyCi8Oa/OPZbCC+O7GfZQQANKjZ1JrraTtZ
 Bh6anOFG3p1/+BNFu+g+ylrgFZnMYAprIXDiUJv3Z+vcLlCN/zcAjEoH+IK4J+zStN3X
 qQTzT2lxrEAIAaxrlGFjky6bl5K/2QKY7pSs12lao5o3ifIhn2qLuW8VYXTeLcK1O21Q
 itWA==
X-Gm-Message-State: ANoB5pksVTv/FxrpYaMfpGifWSu3kw84gLRBpw3Ni9/xdmTEEZf/XAJe
 jJ/7sHN41ZhU6tS8K+TjGi9RoomXopq79Y3N
X-Google-Smtp-Source: AA0mqf4miB7J+UneSWRJUhg/zWhjzQYvGpn15eoi+YcAzUm8Mnhba1PaF57rVkTCb7Qvw+ETuQLwMQ==
X-Received: by 2002:a2e:a90c:0:b0:277:4e4:d21a with SMTP id
 j12-20020a2ea90c000000b0027704e4d21amr5818347ljq.196.1668513763136; 
 Tue, 15 Nov 2022 04:02:43 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 i13-20020ac25d2d000000b004b0b2212315sm2176233lfb.121.2022.11.15.04.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 04:02:42 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/11] ASoC: dt-bindings: Rework Qualcomm APR/GPR Sound
 nodes for SM8450
Date: Tue, 15 Nov 2022 13:02:24 +0100
Message-Id: <20221115120235.167812-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: quic_plai@quicinc.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 quic_srivasam@quicinc.com
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

Changes since v1
================
1. Patch 2: Keep compatibles in qcom,apr.yaml.
2. Patch 3: New patch.

Description
===========
Adding sound support for Qualcomm SM8450 SoC (and later for SC8280XP) brought
some changes to APR/GPR services bindings.  These bindings are part of
qcom,apr.yaml:

  apr-or-gpr-device-node <- qcom,apr.yaml
    apr-gpr-service@[0-9] <- qcom,apr.yaml
      service-specific-components <- /schemas/sound/qcom,q6*.yaml

The schema for services (apr-gpr-service@[0-9]) was not complete and is still
quite not specific.  It allows several incorrect combinations, like adding a
clock-controller to a APM device.  Restricting it would complicate the schema
even more.  Bringing new support for sound on Qualcomm SM8450 and SC8280XP SoC
would grow it as well.

Refactor the bindings before extending them for Qualcomm SM8450 SoC.

DTS was sent here:
https://lore.kernel.org/linux-arm-msm/20221115110053.110319-1-krzysztof.kozlowski@linaro.org/T/#t

Best regards,
Krzysztof

---

Cc: quic_srivasam@quicinc.com
Cc: quic_plai@quicinc.com

Krzysztof Kozlowski (11):
  ASoC: dt-bindings: qcom,apr: Add GLINK channel name for SM8450
  ASoC: dt-bindings: qcom,apr: Split services to shared schema
  ASoC: dt-bindings: qcom,apr: Correct and extend example
  ASoC: dt-bindings: qcom,q6afe: Split to separate schema
  ASoC: dt-bindings: qcom,q6apm: Split to separate schema
  ASoC: dt-bindings: qcom,q6adm: Split to separate schema
  ASoC: dt-bindings: qcom,q6asm: Split to separate schema
  ASoC: dt-bindings: qcom,q6prm: Split to separate schema
  ASoC: dt-bindings: qcom,q6core: Split to separate schema
  ASoC: dt-bindings: qcom,q6apm-lpass-dais: Split to separate schema
  ASoC: dt-bindings: qcom,q6apm: Add SM8450 bedais node

 .../bindings/soc/qcom/qcom,apr-services.yaml  |  54 ++++++
 .../bindings/soc/qcom/qcom,apr.yaml           | 170 ++++++------------
 .../bindings/sound/qcom,q6adm-routing.yaml    |  22 +--
 .../devicetree/bindings/sound/qcom,q6adm.yaml |  51 ++++++
 .../devicetree/bindings/sound/qcom,q6afe.yaml |  68 +++++++
 .../bindings/sound/qcom,q6apm-dai.yaml        |  19 +-
 .../bindings/sound/qcom,q6apm-lpass-dais.yaml |  32 ++++
 .../devicetree/bindings/sound/qcom,q6apm.yaml |  67 +++++++
 .../bindings/sound/qcom,q6asm-dais.yaml       |  48 ++---
 .../devicetree/bindings/sound/qcom,q6asm.yaml |  68 +++++++
 .../bindings/sound/qcom,q6core.yaml           |  39 ++++
 .../sound/qcom,q6dsp-lpass-clocks.yaml        |  40 +----
 .../sound/qcom,q6dsp-lpass-ports.yaml         |  57 +-----
 .../devicetree/bindings/sound/qcom,q6prm.yaml |  50 ++++++
 MAINTAINERS                                   |   2 +-
 15 files changed, 515 insertions(+), 272 deletions(-)
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

