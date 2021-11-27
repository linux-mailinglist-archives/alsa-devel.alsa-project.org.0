Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3887460252
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Nov 2021 00:15:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C1021701;
	Sun, 28 Nov 2021 00:14:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C1021701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638054942;
	bh=am45wugowQoauaAfnlXc9z9zNlYSoGFaaI6YNreLGXY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UrBeKaG2ZOpMHIn6SlK2BIY1bVz9OmAAKZ2etbHCjRtBgzMMeF3F58HYkwhHnrjUo
	 gH3Hs86VE800eGOOr/+DBJcw8Bmw5TY3ghJxGhX2TdrPqW+5+9Sc/fP7Sf5IEZ7VvS
	 C/+NlxcWIr/XOTbNgqOK2BTtgmALuHp1N1IGXO7s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9A9EAF80087;
	Sun, 28 Nov 2021 00:14:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DC91EF804AB; Sun, 28 Nov 2021 00:14:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9C584F80149
 for <alsa-devel@alsa-project.org>; Sun, 28 Nov 2021 00:13:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C584F80149
Received: by mail-oi1-f172.google.com with SMTP id o4so26377306oia.10
 for <alsa-devel@alsa-project.org>; Sat, 27 Nov 2021 15:13:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=mNLXmAuw2le1DMdoTmdRUdw966ZM06MjQHIDAN6H6sc=;
 b=prfFth1yGLAgeclP+b1UVUfdMTynaBxyxgYgTTJU9DRaQGLiF2muaFmUE7eu8BOzly
 VAJnv74djTAjrqNM7Ja3KJxCaMOEPRbRQEZEMPTL4w+Ed2Z7qIqEMCPiVD/LXooQ7xSN
 embQOE976bI11oxPmQjGUy1YD29u8i/DOvPAjpTe9H+5Q2X+yVBvm0VI42Cbc3/oVHeL
 QHcl5ahfiiBEELsc6LRg/X2IfAlMq82s7KXmI2p8QcJXDI3J3yCTDYD935Hsb+91mHWG
 RhG1FtjVPsz4/sqYSZhvZpNqlxSFsOR7uYj2jAVyQ1FXf1IhqPWQ77CQpqPAoI4tdHvp
 XRPw==
X-Gm-Message-State: AOAM533lha5QVAcXu/QtVEKOxSeiYS9FYs6tfK4JkyVVZQsICxc4bnIy
 CQn4tygeq9LU76aFYn1XdQ==
X-Google-Smtp-Source: ABdhPJwLzQha3gR0/9AGa/spXfNJ2uRy6JioEynsPKhT3FucyEg7mQhtiD3wb4/JGxTbSDFwVYB9uQ==
X-Received: by 2002:a05:6808:3b7:: with SMTP id
 n23mr32525918oie.160.1638054814398; 
 Sat, 27 Nov 2021 15:13:34 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id j5sm1694720oou.23.2021.11.27.15.13.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Nov 2021 15:13:33 -0800 (PST)
Received: (nullmailer pid 1973545 invoked by uid 1000);
 Sat, 27 Nov 2021 23:13:22 -0000
From: Rob Herring <robh@kernel.org>
To: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <20211126050228.6257-1-j-choudhary@ti.com>
References: <20211126050228.6257-1-j-choudhary@ti.com>
Subject: Re: [PATCH v3] ASoC: dt-bindings: davinci-mcasp: convert McASP
 bindings to yaml schema
Date: Sat, 27 Nov 2021 16:13:22 -0700
Message-Id: <1638054802.120379.1973544.nullmailer@robh.at.kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, broonie@kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, robh+dt@kernel.org
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

On Fri, 26 Nov 2021 10:32:28 +0530, Jayesh Choudhary wrote:
> Convert the bindings for McASP controllers for TI SOCs
> from txt to YAML schema.
> 
> Adds additional properties 'clocks', 'clock-names', 'power-domains',
> '#sound-dai-cells', 'num-serializer' and 'port' which were not there
> in the txt file.
> Adds 'dmas' and 'dma-names' in the example which were not there in
> the txt file.
> Changes 'interrupts' and 'interrupt-names' from optional to
> required properties.
> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
> Changelog:
> v3:
> - removes maxItems from 'clock-names'
> 
> v2:
> - changes the commit message
> - modifies the properties 'clocks', 'clock-names', 'dma-names',
>   'dmas', 'interrupts' and 'interrupt-names' according to the
>   arm SOCs
> - adds 'port' and 'num-serializer' as node properties
> 
>  .../bindings/sound/davinci-mcasp-audio.txt    |  86 ---------
>  .../bindings/sound/davinci-mcasp-audio.yaml   | 178 ++++++++++++++++++
>  2 files changed, 178 insertions(+), 86 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/davinci-mcasp-audio.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1559951


mcasp@0: 'rt-num-evt' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm/boot/dts/am335x-wega-rdk.dt.yaml

mcasp@2b00000: 'op-mode' is a required property
	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic-pg2.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-pg2.dt.yaml

mcasp@2b00000: 'serial-dir' is a required property
	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic-pg2.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-pg2.dt.yaml

mcasp@2b00000: 'tdm-slots' is a required property
	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic-pg2.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-pg2.dt.yaml

mcasp@2b10000: 'op-mode' is a required property
	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic-pg2.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-pg2.dt.yaml

mcasp@2b10000: 'serial-dir' is a required property
	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic-pg2.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-pg2.dt.yaml

mcasp@2b10000: 'tdm-slots' is a required property
	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic-pg2.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-pg2.dt.yaml

mcasp@2b20000: 'op-mode' is a required property
	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic-pg2.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-pg2.dt.yaml

mcasp@2b20000: 'serial-dir' is a required property
	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic-pg2.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-pg2.dt.yaml

mcasp@2b20000: 'tdm-slots' is a required property
	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6528-iot2050-basic-pg2.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced.dt.yaml
	arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-pg2.dt.yaml

