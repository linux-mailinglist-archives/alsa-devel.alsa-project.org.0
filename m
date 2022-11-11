Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E01FE625B49
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Nov 2022 14:31:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76FB61670;
	Fri, 11 Nov 2022 14:30:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76FB61670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668173490;
	bh=5BBw08O0LONrvacN2KTi6OtdleZneUbvj+x6i62/9lE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aJVRWMhKsOb+XyzOCcaUPTuGmnMv9p6ufhE4uA3qH2O+uy0t8BPNcVZPzlcn8w4Zk
	 PzqHX8uPbUaG7/b1MPZBv5rrnjmC0hN0Few5vdmLW+eLqIMaHOqQHIH8f7b7wrCrET
	 bX3MKO34a22+AdgjITnopti3JeD3wbYaNR4xZJnc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CF60F800CC;
	Fri, 11 Nov 2022 14:30:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B29E2F8028D; Fri, 11 Nov 2022 14:30:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
 [209.85.160.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95941F800CC
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 14:30:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95941F800CC
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-1322d768ba7so5422987fac.5
 for <alsa-devel@alsa-project.org>; Fri, 11 Nov 2022 05:30:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Lo2p58cHEgV1SDnl6XTUQGUtHBgdDU1qqKkHovtNXaI=;
 b=i91c/J2c240jwfpotfbzohy5GzXPSN8ZMgyyH5aveFFkNsQd+YQ9OyFhhXI9kJ0VMP
 O85zlZWEhA1QaOaxDEeQRtuW1rpjXdxCvXU8zoEw+uG8Coyd6/SB9abD6HeDEaF8eg/r
 HqXVQzIJRWDr+sxm0cvgi8hljwvtE+pWSgOgnptu+2puLcdUS0RSIVlyDYv3sM8+thPG
 nDs+sEYX632YI+Otmuvldk5sISzWdPj2z5K6os5gUk5UdATYhcdzcjqEkZtK/yjTSK3c
 9WMjMvkLoi4445im3cFUf7wY5PNxTopygI21lfQ14TUpjNjpiCsRSxkrpIAPXaF4zpkU
 kmYw==
X-Gm-Message-State: ANoB5pnYqpu02EdLHPapvoDcmXM6z4IMGRDaeRns2KY0h7i31edwhG7q
 dsk2/guLpVh9F2VPR8mgAg==
X-Google-Smtp-Source: AA0mqf71ZDnvJcVvYaHMWcT9ADtsziN74fdU+bu2Y8OC6CWAn6wtqLDgukiurl08AE4CGWhs2VIu8g==
X-Received: by 2002:a05:6870:1708:b0:13c:59d5:3f5e with SMTP id
 h8-20020a056870170800b0013c59d53f5emr879353oae.129.1668173424622; 
 Fri, 11 Nov 2022 05:30:24 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 g14-20020a4adc8e000000b004768f725b7csm798456oou.23.2022.11.11.05.30.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 05:30:24 -0800 (PST)
Received: (nullmailer pid 3073770 invoked by uid 1000);
 Fri, 11 Nov 2022 13:30:24 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221111113547.100442-3-krzysztof.kozlowski@linaro.org>
References: <20221111113547.100442-1-krzysztof.kozlowski@linaro.org>
 <20221111113547.100442-3-krzysztof.kozlowski@linaro.org>
Message-Id: <166817308876.3060199.17933327732327950670.robh@kernel.org>
Subject: Re: [PATCH 02/10] ASoC: dt-bindings: qcom,apr: Split services to
 shared schema
Date: Fri, 11 Nov 2022 07:30:24 -0600
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Andy Gross <agross@kernel.org>, Banajit Goswami <bgoswami@quicinc.com>,
 Patrick Lai <plai@qti.qualcomm.com>,
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


On Fri, 11 Nov 2022 12:35:39 +0100, Krzysztof Kozlowski wrote:
> The APR/GPR nodes are organized like:
> 
>   apr-or-gpr-device-node <- qcom,apr.yaml
>     apr-gpr-service@[0-9] <- qcom,apr.yaml
>       service-specific-components <- /schemas/sound/qcom,q6*.yaml
> 
> The schema for services (apr-gpr-service@[0-9]) already grows
> considerably and is still quite not specific.  It allows several
> incorrect combinations, like adding a clock-controller to a APM device.
> Restricting it would complicate the schema even more.  Bringing new
> support for sound on Qualcomm SM8450 and SC8280XP SoC would grow it as
> well.
> 
> Simplify the qcom,apr.yaml by splitting the services to a shared file
> which will be:
> 1. Referenced by qcom,apr.yaml with additionalProperties:true,
> 2. Referenced by specific bindings for services with
>    additionalProperties:false (not yet in this commit).
> 
> While moving the code, add also required 'reg' and
> 'qcom,protection-domain' to further constrain the bindings.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/soc/qcom/qcom,apr-services.yaml  |  54 +++++++++
>  .../bindings/soc/qcom/qcom,apr.yaml           | 108 +-----------------
>  MAINTAINERS                                   |   2 +-
>  3 files changed, 58 insertions(+), 106 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,apr-services.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/soc/qcom/qcom,apr.example.dtb:0:0: /example-0/apr/service@3: failed to match any schema with compatible: ['qcom,q6core']
Documentation/devicetree/bindings/soc/qcom/qcom,apr.example.dtb:0:0: /example-0/apr/service@4: failed to match any schema with compatible: ['qcom,q6afe']
Documentation/devicetree/bindings/soc/qcom/qcom,apr.example.dtb:0:0: /example-0/apr/service@7: failed to match any schema with compatible: ['qcom,q6asm']
Documentation/devicetree/bindings/soc/qcom/qcom,apr.example.dtb:0:0: /example-0/apr/service@8: failed to match any schema with compatible: ['qcom,q6adm']
Documentation/devicetree/bindings/soc/qcom/qcom,apr.example.dtb:0:0: /example-1/gpr/service@1: failed to match any schema with compatible: ['qcom,q6apm']
Documentation/devicetree/bindings/sound/qcom,q6adm-routing.example.dtb:0:0: /example-0/apr/service@8: failed to match any schema with compatible: ['qcom,q6adm']
Documentation/devicetree/bindings/sound/qcom,q6asm-dais.example.dtb:0:0: /example-0/apr/service@7: failed to match any schema with compatible: ['qcom,q6asm']
Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-clocks.example.dtb:0:0: /example-0/apr/service@4: failed to match any schema with compatible: ['qcom,q6afe']
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-clocks.example.dtb: gpr: service@2: 'qcom,protection-domain' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-clocks.example.dtb:0:0: /example-1/gpr/service@2: failed to match any schema with compatible: ['qcom,q6prm']
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.example.dtb: gpr: service@1: 'qcom,protection-domain' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
Documentation/devicetree/bindings/sound/qcom,q6apm-dai.example.dtb:0:0: /example-0/gpr/service@1: failed to match any schema with compatible: ['qcom,q6apm']
Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.example.dtb:0:0: /example-0/apr/service@4: failed to match any schema with compatible: ['qcom,q6afe']
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.example.dtb: gpr: service@1: 'qcom,protection-domain' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.example.dtb:0:0: /example-1/gpr/service@1: failed to match any schema with compatible: ['qcom,q6apm']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

