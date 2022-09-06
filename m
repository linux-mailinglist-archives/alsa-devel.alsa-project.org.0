Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E61A55AE7A4
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 14:18:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88216850;
	Tue,  6 Sep 2022 14:17:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88216850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662466686;
	bh=JdDd1DVNNoegs9Y+isC5nbmP83s2iedgo/PKfo6XtQo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RAdWACOBygxxtLKXMmdjZYTyqxAeOn8b5ErcspOWxLRTqJFUPsLlSbmAEsRArpXKu
	 DUvuPC+RMngv7DUKn8MTEP2c+/4ysByrwxEH+zav50k2qbX+s4lwDWaNEMsksHnyD6
	 JAqOkIeaI7Xr/a1xGJRh9JrOhMhtm5x+225keVKQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9174F80254;
	Tue,  6 Sep 2022 14:17:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A14D9F80254; Tue,  6 Sep 2022 14:17:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A04D0F80165
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 14:17:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A04D0F80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="jsssXtnc"
Received: by mail-lf1-x134.google.com with SMTP id z25so17112106lfr.2
 for <alsa-devel@alsa-project.org>; Tue, 06 Sep 2022 05:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=atG6Q13qT72aqye5DdU2XHAaxI/9PkvW9OECNhOqjGs=;
 b=jsssXtnc0wcmQvENwTPaWWUYWwq54OmJYb0Ho39eO7oBDHnmlEiTs5LXHXcLDUb7UY
 PIjd2mQnLCJqb9tSCf4yWwHa3JKa5hV15HEHUKvZwE0wdxNIvgPJXeB6zJR8KLwI6YXD
 9EdkPu1gWe9nPoGy7/H6xpV/aLW+5Tw1u3A2nA/RI6dWMY5ve+tqoAvKawkF1qUG72qH
 YD+Hf6/8f2CjxZom00GZt0Ut9BCOebHg0ct0rOMQOQeKMDZ9NEWhMFD5ZCz3mvSD82n9
 9T6oY4e18tssNSfYp+bZD0MSzYuLMCcLcI8hmSggWjO22fpeQZny2IMQDz1Ss96jP89r
 mcow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=atG6Q13qT72aqye5DdU2XHAaxI/9PkvW9OECNhOqjGs=;
 b=xuseMYULTv33U66N0hAnb7Vm43eeutIkPJbc6U1KAplhDUyELWE2JQxwOrzC+iGkqV
 Bi1MJQdeGzZg2ZxIXDXnxIcR+uKJH41+LUMpxLuwOsgCuMUPyzQAewSy+fevJ0f68b1y
 iz3Vhq0ETZ4+kq+kZBbBaH6f83hyZDayAt2L1WOMudJCfP0vA7qka59awJb4rp35Iyfo
 +JqGnzWo2EFFC07VzN/Dh/8uBI5hpSTY5BBoCg2Kk6lNfjNiF7Nci5YfcPoVJgvce4xd
 vdKDnecbUE7dYIq2/bZzTCRc5acHhWvXbbbuK+SIWYgxGrjuU1ErMi3EoOGlkAnsSk5y
 bUng==
X-Gm-Message-State: ACgBeo0G3JSEyXLbSIE94Ns4LKhYSWtgXY+VYBD2R1r7O9yWYZxwkfbH
 wk7Imfr6ZYtVhwpxHiPr7qHQaw==
X-Google-Smtp-Source: AA6agR6kwAX2CNe3gZUiQIJU1EqskO4sjnTjjKHe/QSrhc51J/bbUCKpBgdWxTfm+S5ucS/V9tMBUw==
X-Received: by 2002:a05:6512:e99:b0:48b:2ba1:1511 with SMTP id
 bi25-20020a0565120e9900b0048b2ba11511mr19685247lfb.0.1662466618788; 
 Tue, 06 Sep 2022 05:16:58 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a05651c131100b0025df5f38da8sm1882802lja.119.2022.09.06.05.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 05:16:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH 00/12] ASoC/qcom/remoteproc/arm64: Qualcomm ADSP DTS and
 binding fixes
Date: Tue,  6 Sep 2022 14:16:43 +0200
Message-Id: <20220906121655.303693-1-krzysztof.kozlowski@linaro.org>
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

Best regards,
Krzysztof

Krzysztof Kozlowski (12):
  arm64: dts: qcom: sdm630: align APR services node names with dtschema
  arm64: dts: qcom: sdm845: align APR services node names with dtschema
  arm64: dts: qcom: sm8250: align APR services node names with dtschema
  arm64: dts: qcom: msm8996: fix APR services nodes
  arm64: dts: qcom: sdm845: align dai node names with dtschema
  arm64: dts: qcom: msm8996: align dai node names with dtschema
  arm64: dts: qcom: qrb5165-rb5: align dai node names with dtschema
  arm64: dts: qcom: sm8250: use generic name for LPASS clock controller
  dt-bindings: soc: qcom: apr: correct service children
  ASoC: dt-bindings: qcom,q6dsp-lpass-ports: cleanup example
  ASoC: dt-bindings: qcom,q6dsp-lpass-clocks: cleanup example
  dt-bindings: soc: qcom: apr: add missing properties

 .../bindings/soc/qcom/qcom,apr.yaml           | 85 ++++++++++++++++---
 .../sound/qcom,q6dsp-lpass-clocks.yaml        | 30 +++----
 .../sound/qcom,q6dsp-lpass-ports.yaml         | 30 +++----
 arch/arm64/boot/dts/qcom/msm8996.dtsi         | 10 +--
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts      |  4 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi          |  8 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts    |  2 +-
 .../boot/dts/qcom/sdm845-xiaomi-beryllium.dts |  2 +-
 .../boot/dts/qcom/sdm845-xiaomi-polaris.dts   |  4 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |  8 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi          | 10 +--
 11 files changed, 124 insertions(+), 69 deletions(-)

-- 
2.34.1

