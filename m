Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B23675AF306
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 19:47:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F37584C;
	Tue,  6 Sep 2022 19:47:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F37584C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662486474;
	bh=XRTho8tm2BJBtgjtoaasnDvrBosNXoLPwzKyXS2rtr8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DQ0XF57aYAGhtcHRQRvjGSCHTDev5x8nbMvDfZrxQy915sO5Avd8pEcxfwTDpQ0PE
	 EgDNZ51jhHG7jyK0MUhVxc5rmJVjiQNQ9607AS9jX7oOD7EcyGaNTCg8xy9lMpQ4Zf
	 DghIekIDIgwZL8M2sOlsJupJaCu8JBeyElCCkhK4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96B0EF8024C;
	Tue,  6 Sep 2022 19:46:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68798F80165; Tue,  6 Sep 2022 19:46:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com
 [209.85.160.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28389F800E9
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 19:46:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28389F800E9
Received: by mail-oa1-f54.google.com with SMTP id
 586e51a60fabf-127ba06d03fso6441675fac.3
 for <alsa-devel@alsa-project.org>; Tue, 06 Sep 2022 10:46:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:references:in-reply-to:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date;
 bh=HzG5COCo19lT3oBLgm1nvDwcIQQgyJlzuG7SNbHTaDU=;
 b=UJ8Ubnzc14NuMq/WTtU40UgBWxG08aSJY+c4ZTlIMf+z+/kFB/A+uhs4QZSQ01XR6h
 MG7lFicz5ZIUx7XZRLKuxkbZ7mHbUdxm+X3m7P3DTILrg0hJOxWz+bJnGkdxwrVaddsZ
 BHLIaxvPNtvapjrD6lxP1G1taegP0LXIW1tU+VmoJxM3EL5Hsx3l9+sumcL5qCNVR4ba
 UrnMw5mcNgNweCVZZh6ml1xwCINhISKj5J5XYFtUSi5wlDTpMOf6OSpmXn5ogOgZOqL/
 eQcEjY3y8YtIyWabLfKXGzpGEzCovZ2Ng0fniCFWYb65XlfYWJLyzWeIvuWzwC70Iov9
 JvxA==
X-Gm-Message-State: ACgBeo0Qp7JfvVEofe7+HA5Y6H0PyME8Yx5hHsKYkwBuZD3nljh1zqUR
 nnQ7n4LAhvfYa57b6mBnvQ==
X-Google-Smtp-Source: AA6agR6RDLZuCPdeXtZwiyPUodQixHiTacheiSfTh+HaN2WJ01ett6hG3ahw/odd+L270KgcOrJkyA==
X-Received: by 2002:a05:6870:430b:b0:101:3d98:ba41 with SMTP id
 w11-20020a056870430b00b001013d98ba41mr12501688oah.46.1662486404036; 
 Tue, 06 Sep 2022 10:46:44 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 22-20020aca0916000000b00344adbc3492sm5583872oij.24.2022.09.06.10.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 10:46:43 -0700 (PDT)
Received: (nullmailer pid 780017 invoked by uid 1000);
 Tue, 06 Sep 2022 17:46:42 -0000
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220906121655.303693-10-krzysztof.kozlowski@linaro.org>
References: <20220906121655.303693-1-krzysztof.kozlowski@linaro.org>
 <20220906121655.303693-10-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 09/12] dt-bindings: soc: qcom: apr: correct service
 children
Date: Tue, 06 Sep 2022 12:46:42 -0500
Message-Id: <1662486402.667876.780014.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>
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

On Tue, 06 Sep 2022 14:16:52 +0200, Krzysztof Kozlowski wrote:
> The APR bindings were not describing properly children nodes for DAIs.
> None of the DTSes use unit addresses for the children, so correct the
> nodes and reference their schema: clock-controller, dais and routing.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/soc/qcom/qcom,apr.yaml           | 38 +++++++++++++------
>  .../sound/qcom,q6dsp-lpass-clocks.yaml        | 16 ++------
>  .../sound/qcom,q6dsp-lpass-ports.yaml         | 16 ++------
>  3 files changed, 35 insertions(+), 35 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.example.dtb: gpr: service@1: '#address-cells', '#size-cells', 'apm-dai@1' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

