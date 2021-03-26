Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 381FD34B036
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Mar 2021 21:35:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC121167A;
	Fri, 26 Mar 2021 21:35:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC121167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616790952;
	bh=plc1nBASV18dS4fwBwU/djUhCnGQQONWmj1MU0HyzAk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GFzOz27DDvuKH1oWIepwU4lBX+zul11blgZPrQdkly69O0cAwx2n8Gi3LO1K/X9IE
	 vntO2pl0dWiPaUe3jJEWn778lR1k29NM1wXXXiIt7x3qDwIk8NIq/Q5fwLNPUxa9CD
	 VMOp3aCx7a4k21cskV5n2LNhh5H+mGoH8swtk52k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07DC5F801D5;
	Fri, 26 Mar 2021 21:34:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E338F8016B; Fri, 26 Mar 2021 21:34:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53CA5F80103
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 21:34:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53CA5F80103
Received: by mail-il1-f182.google.com with SMTP id j11so6039760ilu.13
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 13:34:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nVKeuOYq4ZRrIsp37jdBb4vtF9hhEECTQSIn1HZx5iA=;
 b=Fl5eJ+O69jBDttIF8DGEx5aiTy7QmeB9gBWZJEc6yckhJhuvstjoP6zpFhn2BkQYfG
 VHnPLZz+D5z1Iqpy03pfuGSIoBiIuWS08mfX7Vk52cZYZBcyCCUYNq7MQ3iXiyB8lHaP
 mGaXohMIppRO8+RgV1x6m5ufMxELgzQGkyXe7LIJD+87D4v3oBANuJoKQo2K8be0IZPa
 OkGHMrduKc21wZ/Y0+p6+7LoLo7Y40zCyTURJhqw0xzGaiWDuWaukn0pVe3Zoj1id0uG
 D4uJgvrHvGVnkKA6Id9kYIYD3jq4CG/c8OFbd/odswzF3dac5pc/3fIP5ix328fe4cui
 BdNg==
X-Gm-Message-State: AOAM533f5gQ4dJgEeYWPXdoxjBm9b+nfnrdJjhJGDGlN75tXw5bucIug
 HQa7Fyvqbeter8/Bl5fAQQ==
X-Google-Smtp-Source: ABdhPJwiyitomT/BLbYWZO7Cv/DV/H/+KIHIojxicIpsVz/SK78peRh9juaS9j1piU83sHJE1203FA==
X-Received: by 2002:a92:d7cd:: with SMTP id g13mr7749033ilq.190.1616790850569; 
 Fri, 26 Mar 2021 13:34:10 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id k12sm4906388ios.2.2021.03.26.13.34.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 13:34:09 -0700 (PDT)
Received: (nullmailer pid 3819515 invoked by uid 1000);
 Fri, 26 Mar 2021 20:34:07 -0000
Date: Fri, 26 Mar 2021 14:34:07 -0600
From: Rob Herring <robh@kernel.org>
To: jack.yu@realtek.com
Subject: Re: [PATCH v2] ASoC: rt1019: add rt1019 amplifier driver
Message-ID: <20210326203407.GA3815424@robh.at.kernel.org>
References: <20210311025809.31852-1-jack.yu@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210311025809.31852-1-jack.yu@realtek.com>
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org, lars@metafoo.de,
 kent_chen@realtek.com, kenny_chen@realtek.com, lgirdwood@gmail.com,
 broonie@kernel.org, derek.fang@realtek.com, shumingf@realtek.com,
 flove@realtek.com
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

On Thu, Mar 11, 2021 at 10:58:09AM +0800, jack.yu@realtek.com wrote:
> From: Jack Yu <jack.yu@realtek.com>
> 
> This is initial amplifier driver for rt1019.
> 
> Signed-off-by: Jack Yu <jack.yu@realtek.com>
> ---
>  .../devicetree/bindings/sound/rt1019.yaml     |  33 +

Bindings should be a separate patch. checkpatch.pl will tell you this.

Bindings should also be sent to the DT list. get_maintainer.pl will tell 
you this.

Now this causes warnings in linux-next:

Documentation/devicetree/bindings/sound/rt1019.example.dt.yaml: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/sound/rt1019.example.dt.yaml: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/sound/rt1019.example.dt.yaml: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/sound/rt1019.example.dts:19.13-24.11: Warning (i2c_bus_bridge): /example-0/i2c: incorrect #address-cells for I2C bus
Documentation/devicetree/bindings/sound/rt1019.example.dts:19.13-24.11: Warning (i2c_bus_bridge): /example-0/i2c: incorrect #size-cells for I2C bus
Documentation/devicetree/bindings/sound/rt1019.example.dt.yaml: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/sound/rt1019.example.dt.yaml: Warning (i2c_bus_reg): Failed prerequisite 'i2c_bus_bridge'
Documentation/devicetree/bindings/sound/rt1019.example.dt.yaml: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/sound/rt1019.example.dts:20.30-23.15: Warning (avoid_default_addr_size): /example-0/i2c/codec@28: Relying on default #address-cells value
Documentation/devicetree/bindings/sound/rt1019.example.dts:20.30-23.15: Warning (avoid_default_addr_size): /example-0/i2c/codec@28: Relying on default #size-cells value
Documentation/devicetree/bindings/sound/rt1019.example.dt.yaml: Warning (unique_unit_address): Failed prerequisite 'avoid_default_addr_size'

>  sound/soc/codecs/Kconfig                      |   7 +
>  sound/soc/codecs/Makefile                     |   2 +
>  sound/soc/codecs/rt1019.c                     | 940 ++++++++++++++++++
>  sound/soc/codecs/rt1019.h                     | 320 ++++++
>  5 files changed, 1302 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/rt1019.yaml
>  create mode 100644 sound/soc/codecs/rt1019.c
>  create mode 100644 sound/soc/codecs/rt1019.h
