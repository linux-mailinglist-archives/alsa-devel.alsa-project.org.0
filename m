Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B91618B5D
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Nov 2022 23:25:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3D1D3E8;
	Thu,  3 Nov 2022 23:24:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3D1D3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667514315;
	bh=IaaXAbdC/V4WQUzKK70c0i3Y4VsE+5NYPi65YLHPMNw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rJHAWQyx2h74x9NbsQyt4SxF2JSSx6jU3vp+hicpyiX8/Uwq5QTpi8ZYscsKvPkn/
	 YaaM9+BQ/sk5OTZ/NIToxHvEbc8KzseGHA6rdz0BCTNIyH1WFJQLI1vGnm/VUUVF5H
	 Qt1TIf3fnMgommvyzJ1IUnrnUktWqxTW1QH/Q0kU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B2C4F8051F;
	Thu,  3 Nov 2022 23:24:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26572F8051E; Thu,  3 Nov 2022 23:24:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com
 [209.85.160.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FD80F800BF
 for <alsa-devel@alsa-project.org>; Thu,  3 Nov 2022 23:24:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FD80F800BF
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-13b6c1c89bdso3776896fac.13
 for <alsa-devel@alsa-project.org>; Thu, 03 Nov 2022 15:24:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=AOI36shM2qFISu/+jzA+JcOl1pqRzE1Kzqrcj41MDwY=;
 b=v+hhd8woMnJVOPeAEI7Xc/lCmODRaPChPTzZC076R0gRZvZDVOxNE3sbTXb3+5Qo1o
 oGMfuIh5t3UeL8/HPSUsAEXIfQknuMw6cTWx90D46W5wRqhwV+41BFFOlyDBN6L4tYCi
 T1lCs1oQcZkGD8Crz/59liHC7JRU9xpXcb1ma/1I0If1KkyknU9Rzz2lO1gYNZx3fy+e
 yxlGffw+m4SgYXrRibmcvr4isg6ANRYQZhhiFvXn9+soDGod4GxmIqY/4e1pmdOnYI7n
 HMcy8MQMGpprObV0CDxlf8g9idShjk6ZouD5kriHbMH6/6Pg5v2uFnrhepcAIBfOnSbJ
 MfVw==
X-Gm-Message-State: ACrzQf051ma1pVyItbYjgfb5s8t2/i2KvxRh2NwtEIZLMSwrLl4vtXfr
 jftFiNWhfHNLOD2NxsXUzg==
X-Google-Smtp-Source: AMsMyM66EA91nNfrRDIcdTNA2Nh0/OFN70NnT5GE9OiATuFxTVxk0FfQ6krQyiINAjezkSYrXtXX+A==
X-Received: by 2002:a05:6870:41ca:b0:12b:9637:1cda with SMTP id
 z10-20020a05687041ca00b0012b96371cdamr19055660oac.114.1667514249741; 
 Thu, 03 Nov 2022 15:24:09 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 4-20020aca0504000000b00353fe4fb4casm861322oif.48.2022.11.03.15.24.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 15:24:09 -0700 (PDT)
Received: (nullmailer pid 159590 invoked by uid 1000);
 Thu, 03 Nov 2022 22:24:10 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
In-Reply-To: <20221103182016.95808-1-marex@denx.de>
References: <20221103182016.95808-1-marex@denx.de>
Message-Id: <166751410849.156062.3606952852541846345.robh@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: fsl-sai: Convert to YAML DT schema
Date: Thu, 03 Nov 2022 17:24:10 -0500
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Xiubo Li <Xiubo.Lee@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Fabio Estevam <festevam@gmail.com>
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


On Thu, 03 Nov 2022 19:20:16 +0100, Marek Vasut wrote:
> Convert the SAI bindings to YAML DT schema to permit validation.
> Add Shengjiu as maintainer, derived from sound/soc/fsl/fsl_sai.c
> get_maintainer result.
> 
> Describe existing used combinations of compatible strings, add the
> missing imx7d-sai compatible string which is used on i.MX7 .
> 
> Properties lsb-first, fsl,sai-synchronous-rx, fsl,sai-asynchronous,
> fsl,dataline are no longer listed as required, since those are clearly
> optional, even the description says so, so does their usage.
> 
> Fix the undefined edma channel macro per arch/arm/boot/dts/vfxxx.dtsi ,
> use the value itself just like in the vfxxx.dtsi .
> 
> Document interrupts property, which was previously undocumented, but
> it is required property of this IP.
> 
> Document #sound-sai-cells, which should be zero for this IP.
> 
> Document fsl,imx6ul-iomuxc-gpr and its dependency on MX6UL and
> fsl,sai-mclk-direction-output .
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Nicolin Chen <nicoleotsuka@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: Xiubo Li <Xiubo.Lee@gmail.com>
> Cc: alsa-devel@alsa-project.org
> To: devicetree@vger.kernel.org
> ---
>  .../devicetree/bindings/sound/fsl-sai.yaml    | 188 ++++++++++++++++++
>  1 file changed, 188 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl-sai.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,sai.example.dtb: sai@30010000: fsl,dataline:0: [1, 255, 255, 2, 255, 17] is too long
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,sai.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,sai.example.dtb: sai@30010000: clock-names:1: 'mclk1' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl-sai.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,sai.example.dtb: sai@30010000: clock-names:2: 'mclk2' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl-sai.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,sai.example.dtb: sai@30010000: clock-names:3: 'mclk3' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl-sai.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,sai.example.dtb: sai@30010000: clock-names:4: 'pll8k' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl-sai.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,sai.example.dtb: sai@30010000: dma-names:0: 'tx' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl-sai.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,sai.example.dtb: sai@30010000: dma-names:1: 'rx' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl-sai.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,sai.example.dtb: sai@30010000: fsl,dataline: size is 32, expected 8
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl-sai.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl,sai.example.dtb: sai@30010000: Unevaluated properties are not allowed ('clock-names', 'dma-names', 'fsl,dataline' were unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/fsl-sai.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

