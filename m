Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8734831A6
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jan 2022 15:00:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 37182176B;
	Mon,  3 Jan 2022 14:59:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 37182176B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641218420;
	bh=n5/ffVGdKhgUcaJT9Gz5BXgZMycTUwLG711xFUvNOsQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EaI4IWEyp8mnhFSxee/MX6pn56+T6Emi4pTi/bej5bFcwqpvjmSM/gQPSgNfO9UfK
	 nSjD85x91V/jhKMQOfOfLzLPPSl8+SpjvgsKYRgE2BmBcfg4NbsOabQ6ehs5iJZAEV
	 FuJU9xrA9eYXxlqk2xEceCF2IEaG3chq38DzKfO0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 984B4F8013F;
	Mon,  3 Jan 2022 14:59:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06C0BF800C8; Mon,  3 Jan 2022 14:59:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25F39F800C8
 for <alsa-devel@alsa-project.org>; Mon,  3 Jan 2022 14:59:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25F39F800C8
Received: by mail-oi1-f171.google.com with SMTP id t23so55017888oiw.3
 for <alsa-devel@alsa-project.org>; Mon, 03 Jan 2022 05:59:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=wzDM9gjQL9KJfKSfYGCQK2zI/KnBbFjyptgpSxeAvX8=;
 b=lKSyo3QDMvPJgf1AqPJjHG3bTy7OLG1N8+z8H/1nS+lpPqJiJ5Wyw/lMXkajcTApQv
 rvUQLsSnQprYq6FHS4Tqrwi1TVU63neHJwUTPVGBtDSU45evNf1R1ZcU8z/Y6UbVBSYq
 QIeaDs21eyaRGizhwm1uLLWmhJaU1C/JVg/CzcwfG8GLhrT/rDKsYRkZIBjOWn/AcBUS
 8r8hjQNba6Sve72NvIWneUqqzW2Nuhhxojfq4FL/WyET9PlZIlR3FJ9x5PF123Pd1JIV
 KrkNRdkhvCgKd26maKO1Hyl4mKsPZNkKtpFd+d95F3VcPigRzTbRvIyLoI1LsYq1Cf5t
 +skA==
X-Gm-Message-State: AOAM531PoIFOPxohVnRYYwHi6u+fL3hI7tsomLDByKaKbWH3xjaOI278
 t2q+usnQf5Hih/WdsKGQAg==
X-Google-Smtp-Source: ABdhPJw7S2QyvbSVgsDRCOh58ieaDF4BWKOnY006IkcKhBMkOI0VpUV+B5SwjktePQEdZqXq20LIlQ==
X-Received: by 2002:a05:6808:2309:: with SMTP id
 bn9mr34944786oib.42.1641218341421; 
 Mon, 03 Jan 2022 05:59:01 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id t66sm8264920oie.39.2022.01.03.05.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 05:59:00 -0800 (PST)
Received: (nullmailer pid 2378537 invoked by uid 1000);
 Mon, 03 Jan 2022 13:58:59 -0000
From: Rob Herring <robh@kernel.org>
To: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <20220103074427.4233-1-j-choudhary@ti.com>
References: <20220103074427.4233-1-j-choudhary@ti.com>
Subject: Re: [PATCH v5] ASoC: dt-bindings: davinci-mcasp: convert McASP
 bindings to yaml schema
Date: Mon, 03 Jan 2022 07:58:59 -0600
Message-Id: <1641218339.997415.2378536.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com,
 broonie@kernel.org, peter.ujfalusi@gmail.com
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

On Mon, 03 Jan 2022 13:14:27 +0530, Jayesh Choudhary wrote:
> Convert the bindings for McASP controllers for TI SOCs from txt
> to YAML schema.
> 
> Adds additional properties 'clocks', 'clock-names', 'power-domains',
> '#sound-dai-cells' and 'port' which were missing from the txt file.
> Removes properties 'sram-size-playback' and 'sram-size-capture'
> since they are not used.
> Adds 'dmas' and 'dma-names' in the example which were missing from
> the txt file.
> Changes 'interrupts' and 'interrupt-names' from optional to
> required properties.
> Changes 'op-modes', 'serial-dir' to optional properties as they are
> not needed if the McASP is used only as GPIO.
> Changes 'tdm-slots' to required property only for I2S operation mode.
> 
> Adds the yaml file in the 'MAINTAINERS' under the heading 'TEXAS
> INSTRUMENTS ASoC DRIVERS'
> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
> Changelog:
> v5:
> - changes the commit message
> - changes description for 'reg', 'op-mode', 'tx-num-evt',
>   'rx-num-evt' and 'interrupts'
> - adds minimum and maximum for 'tdm-slots'
> - removes default from 'serial-dir'
> - removes maxItems from 'tdm-slots', 'tx-num-evt', 'rx-num-evt' and
>   'auxclk-fs-ratio' as they are of type uint32
> - adds 'tdm-slots' as conditionally required property for I2S mode
>   of operation
> 
> v4:
> - changes the commit message
> - adds type and description to relevant properties
> - changes maxItems for 'serial-dir'
> - removes properties 'sram-size-playback' and 'sram-size-capture'
>   as they are not used
> - removes 'function-gpios'
> - removes 'num-serializer'
> - marks 'tdm-slots', 'op-mode' and 'serial-dir' as optional properties
> - adds the yaml file in MAINTAINERS
> 
> v3:
> - remove maxItems from 'clock-names'
> 
> v2:
> - changes the commit message
> - modifies the properties 'clocks', 'clock-names', 'dma-names',
>   'dmas', 'interrupts' and 'interrupt-names' according to the
>   arm SOCs
> - adds 'ports' and 'num-serializer' as node properties
> 
>  .../bindings/sound/davinci-mcasp-audio.txt    |  86 --------
>  .../bindings/sound/davinci-mcasp-audio.yaml   | 201 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  3 files changed, 202 insertions(+), 86 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/davinci-mcasp-audio.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1574696


mcasp@0: 'num-serializer' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am335x-cm-t335.dt.yaml
	arch/arm/boot/dts/am335x-sbc-t335.dt.yaml

mcasp@0: 'rt-num-evt' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am335x-wega-rdk.dt.yaml

mcasp@2b00000: 'tdm-slots' is a required property
	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic-pg2.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-pg2.dt.yaml

mcasp@2b10000: 'tdm-slots' is a required property
	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic-pg2.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-pg2.dt.yaml

mcasp@2b20000: 'tdm-slots' is a required property
	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic-pg2.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-pg2.dt.yaml

