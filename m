Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C290740FF6
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jun 2023 13:20:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5669F7F8;
	Wed, 28 Jun 2023 13:19:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5669F7F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687951202;
	bh=RKs+zTtP0MwtLb+qYU/1ukNipmhL8svWspE5kJpSUr0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vUDm63xZAEWuqBib7jy7nf8C29+WPfpKFwmC+LbHw1ig30rMEeFAZy0WCKOEc+HoK
	 XV6nEH5MhQm9EMhd9lIyesDjhe18D9jxV4kn7mjYKQbzGgZatpnz+9cSsDicrn30+K
	 gW73c3IaK1q8yoHuWqhq4bKKSRv8oruJMYB0ATD4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC98FF80169; Wed, 28 Jun 2023 13:18:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 610D3F80212;
	Wed, 28 Jun 2023 13:18:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6620EF80246; Wed, 28 Jun 2023 13:18:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 596F2F80124
	for <alsa-devel@alsa-project.org>; Wed, 28 Jun 2023 13:18:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 596F2F80124
Received: by mail-il1-f177.google.com with SMTP id
 e9e14a558f8ab-345ad2921abso12406735ab.0
        for <alsa-devel@alsa-project.org>;
 Wed, 28 Jun 2023 04:18:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687951122; x=1690543122;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+OzrKcgmF4GYT9x8rAn0YnzpplhYCV/29RHuP+s5ATo=;
        b=gBYYBnKVDuctdv936AJh4hpBkgdfvkpkQfqVfumUUfxOvikDaqUi81B4kRmrUUfPeR
         J/AsjXU3u/9kh0gObp8vOYQjhqNWykCkN6helKYvmtcOfnd6dhCGedDZ3K9lDRiq85i/
         T1eLk/gBsugMLxOvbC9qk6xN2SC1XAfFqJ7I4hpAh3mVDKSyi+BPh3WI3fZ7M/7vso6G
         A9ebdarlJ8XViLpJ/22uHcvi30umly8z6bg1d2GFIYm5+uHph1tQ3keJTKNJPZUukRoy
         KSiLRc43JPZZf1+wbSP2GEuDZyvDDU6w2p3qOZJO4kjOj52xepkyJ301m898/1ZuKr/s
         rJiw==
X-Gm-Message-State: AC+VfDxBdqfATQBAhTgAzwrR1VXBoTjKwPaKMFcF3FakoZ0QHRtYTBqt
	432cNCWDlFMm8u/r7nCcRQ==
X-Google-Smtp-Source: 
 ACHHUZ6AYZNuSN4tF0PU+00RX3K30tGmRH38o4pmpRxf5cW/evpvI6SRJve74c/2y06ZclyUSNawZw==
X-Received: by 2002:a5d:81c6:0:b0:77e:3598:e516 with SMTP id
 t6-20020a5d81c6000000b0077e3598e516mr26477428iol.2.1687951121957;
        Wed, 28 Jun 2023 04:18:41 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id
 q15-20020a02c8cf000000b0042ad6abe0bbsm1474801jao.20.2023.06.28.04.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 04:18:41 -0700 (PDT)
Received: (nullmailer pid 154565 invoked by uid 1000);
	Wed, 28 Jun 2023 11:18:36 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: ckeepax@opensource.cirrus.com, andersson@kernel.org,
 dmitry.baryshkov@linaro.org, broonie@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
 pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 tiwai@suse.com, krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, perex@perex.cz, johan+linaro@kernel.org,
 lgirdwood@gmail.com
In-Reply-To: <20230628102621.15016-2-srinivas.kandagatla@linaro.org>
References: <20230628102621.15016-1-srinivas.kandagatla@linaro.org>
 <20230628102621.15016-2-srinivas.kandagatla@linaro.org>
Message-Id: <168795111610.154546.2388306127821623760.robh@kernel.org>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: q6apm: add firmware-name
 bindings
Date: Wed, 28 Jun 2023 05:18:36 -0600
Message-ID-Hash: UXPM724YRRLT2MMOL6NRS2Z6FDYDNT5Q
X-Message-ID-Hash: UXPM724YRRLT2MMOL6NRS2Z6FDYDNT5Q
X-MailFrom: robherring2@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UXPM724YRRLT2MMOL6NRS2Z6FDYDNT5Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 28 Jun 2023 11:26:19 +0100, Srinivas Kandagatla wrote:
> Add bindings to get firmare-name from DT, this will provide more flexibility
> to specify platform specific firmware file name and location. Also this brings
> tplg firmware name inline with other board specific firmware locations.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  Documentation/devicetree/bindings/sound/qcom,q6apm.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/clock/milbeaut-clock.example.dtb: /example-2/serial@1e700010: failed to match any schema with compatible: ['socionext,milbeaut-usio-uart']
Documentation/devicetree/bindings/clock/sprd,sc9863a-clk.example.dtb: /example-1/syscon@20e00000: failed to match any schema with compatible: ['sprd,sc9863a-glbregs', 'syscon', 'simple-mfd']
Documentation/devicetree/bindings/leds/common.example.dtb: /example-2/i2c/led-controller@30: failed to match any schema with compatible: ['panasonic,an30259a']
Documentation/devicetree/bindings/sound/audio-graph-card2.example.dtb: /example-0/cpu: failed to match any schema with compatible: ['cpu-driver']
Documentation/devicetree/bindings/sound/audio-graph-card2.example.dtb: /example-0/codec: failed to match any schema with compatible: ['codec-driver']
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/qcom,q6apm.example.dtb: service@1: 'firmware-name' is a required property
	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm.yaml#
Documentation/devicetree/bindings/thermal/brcm,avs-ro-thermal.example.dtb: /example-0/avs-monitor@7d5d2000: failed to match any schema with compatible: ['brcm,bcm2711-avs-monitor', 'syscon', 'simple-mfd']
Documentation/devicetree/bindings/thermal/imx-thermal.example.dtb: /example-0/anatop@20c8000: failed to match any schema with compatible: ['fsl,imx6q-anatop', 'syscon', 'simple-mfd']
Documentation/devicetree/bindings/i2c/qcom,i2c-cci.example.dtb: /example-0/cci@ac4a000/i2c-bus@1/camera@60: failed to match any schema with compatible: ['ovti,ov7251']
Documentation/devicetree/bindings/iio/adc/ti,palmas-gpadc.example.dtb: /example-0/pmic: failed to match any schema with compatible: ['ti,twl6035-pmic', 'ti,palmas-pmic']
Documentation/devicetree/bindings/iio/adc/ti,palmas-gpadc.example.dtb: /example-0/pmic: failed to match any schema with compatible: ['ti,twl6035-pmic', 'ti,palmas-pmic']
Documentation/devicetree/bindings/input/mediatek,pmic-keys.example.dtb: /example-0/pmic: failed to match any schema with compatible: ['mediatek,mt6397']
Documentation/devicetree/bindings/input/sprd,sc27xx-vibrator.example.dtb: /example-0/pmic@0: failed to match any schema with compatible: ['sprd,sc2731']
Documentation/devicetree/bindings/dma/dma-controller.example.dtb: /example-0/dma-controller@48000000: failed to match any schema with compatible: ['ti,omap-sdma']
Documentation/devicetree/bindings/dma/dma-router.example.dtb: /example-0/dma-router@4a002b78: failed to match any schema with compatible: ['ti,dra7-dma-crossbar']
Documentation/devicetree/bindings/memory-controllers/ingenic,nemc.example.dtb: /example-0/memory-controller@13410000/ethernet@6: failed to match any schema with compatible: ['davicom,dm9000']
Documentation/devicetree/bindings/arm/hisilicon/controller/cpuctrl.example.dtb: /example-0/cpuctrl@a22000/clock@0: failed to match any schema with compatible: ['hisilicon,hix5hd2-clock']
Documentation/devicetree/bindings/arm/hisilicon/controller/hi3798cv200-perictrl.example.dtb: /example-0/peripheral-controller@8a20000/phy@850: failed to match any schema with compatible: ['hisilicon,hi3798cv200-combphy']
Documentation/devicetree/bindings/arm/hisilicon/controller/sysctrl.example.dtb: /example-0/system-controller@802000/clock@0: failed to match any schema with compatible: ['hisilicon,hi3620-clock']
Documentation/devicetree/bindings/media/rockchip-isp1.example.dtb: /example-0/parent/i2c/camera@36: failed to match any schema with compatible: ['ovti,ov5695']
Documentation/devicetree/bindings/net/marvell,mvusb.example.dtb: /example-0/usb/mdio@1/switch@0: failed to match any schema with compatible: ['marvell,mv88e6190']
Documentation/devicetree/bindings/net/qca,ar71xx.example.dtb: /example-0/ethernet@1a000000/mdio/switch@10: failed to match any schema with compatible: ['qca,ar9331-switch']
Documentation/devicetree/bindings/reset/hisilicon,hi3660-reset.example.dtb: /example-0/iomcu@ffd7e000: failed to match any schema with compatible: ['hisilicon,hi3660-iomcu', 'syscon']
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/qcom/qcom,apr.example.dtb: service@1: 'firmware-name' is a required property
	from schema $id: http://devicetree.org/schemas/sound/qcom,q6apm.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230628102621.15016-2-srinivas.kandagatla@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

