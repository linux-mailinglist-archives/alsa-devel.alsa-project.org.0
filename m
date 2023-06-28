Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B947C740D39
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jun 2023 11:40:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B1AF83E;
	Wed, 28 Jun 2023 11:39:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B1AF83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687945229;
	bh=b1VYxIMLIeAkca5lkuCvB2iaiJkaSWmgIWbSwd4xIt8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KfKUAuJI8183WOySzr0zaBmSPtAfJErz98yTBRD5iM6tTalsh67HrYWYKLsGxZOSi
	 nvmlgNk2ATHvSfP0NBcoAqp9lBRcueKoA0x+spytl5rAu5SuimWCIBXH/rRLrBrg+f
	 sCLS8xGEZeSRSdJklXaF7AmtMaChnp7nAcnL/yiw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16960F80557; Wed, 28 Jun 2023 11:38:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 46525F80544;
	Wed, 28 Jun 2023 11:38:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ADA6BF80246; Wed, 28 Jun 2023 11:38:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 858BFF80093
	for <alsa-devel@alsa-project.org>; Wed, 28 Jun 2023 11:38:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 858BFF80093
Received: by mail-io1-f53.google.com with SMTP id
 ca18e2360f4ac-78362f57500so112625239f.3
        for <alsa-devel@alsa-project.org>;
 Wed, 28 Jun 2023 02:38:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687945105; x=1690537105;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1UpWa5+A+kmLbkjpGcGVFWBo61zYo79kFlUi3Wf7gqc=;
        b=hk+eMssl860wg3kokoKPQqNuwZCQ5vDoMPp3yNO06SJsgDmWS/wGv+ckg4nVKqabPM
         ssS1Gy/IP1xbd8hIXWI1gheKOiv4mA7fZXwMM/JEA6d10Hv0+4p2iDTMk/QePDqd8Qe0
         4HugczBoW+xYS+l/lHtabGlUc3AiA/i5F4bqeDHfc4LJPo49baU3uBcfTNrRR+UDIPXz
         bGQ2u0ADfE5KNItfTwM9vdPtLvr02yDb/BD5b+Kj8uyKR5HhocUc6wqAnCpcY7NGhmbK
         kn/yjOXK2XGvrgRvQMelRz+ZiCqNPcnkqjedTJW43fVEB+SxRCtlMHY2f6bskhZ9Y4FO
         MtFQ==
X-Gm-Message-State: AC+VfDxLJI6sSXhzpuBCHu/r+rQk44EYpJvsxDaHAUzcQ7wlwaZG9e5c
	ORWm9qZOhg5Wqaua5YDujg==
X-Google-Smtp-Source: 
 ACHHUZ6lzMkMoU6ElEm6Lq68Puq+JoTK6rfxkhnG8wu2dkqCZ1OUrEnRlAD/dzB4zIXhiW1LtRubIg==
X-Received: by 2002:a5e:8a0d:0:b0:780:d8ef:8b06 with SMTP id
 d13-20020a5e8a0d000000b00780d8ef8b06mr18890628iok.17.1687945105034;
        Wed, 28 Jun 2023 02:38:25 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id
 q7-20020a02cf07000000b0042acdb441a2sm1727097jar.137.2023.06.28.02.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 02:38:24 -0700 (PDT)
Received: (nullmailer pid 4181075 invoked by uid 1000);
	Wed, 28 Jun 2023 09:38:17 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Seven Lee <wtli@nuvoton.com>
Cc: robh+dt@kernel.org, alsa-devel@alsa-project.org, scott6986@gmail.com,
 supercraig0719@gmail.com, broonie@kernel.org, linux-kernel@vger.kernel.org,
 WTLI@nuvoton.com, devicetree@vger.kernel.org, CTLIN0@nuvoton.com,
 KCHSU0@nuvoton.com, dardar923@gmail.com, YHCHuang@nuvoton.com,
 SJLIN0@nuvoton.com, lgirdwood@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org
In-Reply-To: <20230628085009.1130318-1-wtli@nuvoton.com>
References: <20230628085009.1130318-1-wtli@nuvoton.com>
Message-Id: <168794509789.4181033.630544988903150718.robh@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: nau8821: Convert to dtschema
Date: Wed, 28 Jun 2023 03:38:17 -0600
Message-ID-Hash: ONAOJWOWJMXVMUBVDWTJ5KIUQA4Y6IQ7
X-Message-ID-Hash: ONAOJWOWJMXVMUBVDWTJ5KIUQA4Y6IQ7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ONAOJWOWJMXVMUBVDWTJ5KIUQA4Y6IQ7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Wed, 28 Jun 2023 16:50:09 +0800, Seven Lee wrote:
> Convert the NAU8821 audio CODEC bindings to DT schema.
> 
> Signed-off-by: Seven Lee <wtli@nuvoton.com>
> ---
>  .../devicetree/bindings/sound/nau8821.txt     |  55 --------
>  .../bindings/sound/nuvoton,nau8821.yaml       | 125 ++++++++++++++++++
>  2 files changed, 125 insertions(+), 55 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/nau8821.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau8821.yaml
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
Documentation/devicetree/bindings/arm/hisilicon/controller/hi3798cv200-perictrl.example.dtb: /example-0/peripheral-controller@8a20000/phy@850: failed to match any schema with compatible: ['hisilicon,hi3798cv200-combphy']
Documentation/devicetree/bindings/arm/hisilicon/controller/sysctrl.example.dtb: /example-0/system-controller@802000/clock@0: failed to match any schema with compatible: ['hisilicon,hi3620-clock']
Documentation/devicetree/bindings/arm/hisilicon/controller/cpuctrl.example.dtb: /example-0/cpuctrl@a22000/clock@0: failed to match any schema with compatible: ['hisilicon,hix5hd2-clock']
Documentation/devicetree/bindings/media/rockchip-isp1.example.dtb: /example-0/parent/i2c/camera@36: failed to match any schema with compatible: ['ovti,ov5695']
Documentation/devicetree/bindings/net/marvell,mvusb.example.dtb: /example-0/usb/mdio@1/switch@0: failed to match any schema with compatible: ['marvell,mv88e6190']
Documentation/devicetree/bindings/net/qca,ar71xx.example.dtb: /example-0/ethernet@1a000000/mdio/switch@10: failed to match any schema with compatible: ['qca,ar9331-switch']
Documentation/devicetree/bindings/reset/hisilicon,hi3660-reset.example.dtb: /example-0/iomcu@ffd7e000: failed to match any schema with compatible: ['hisilicon,hi3660-iomcu', 'syscon']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230628085009.1130318-1-wtli@nuvoton.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

