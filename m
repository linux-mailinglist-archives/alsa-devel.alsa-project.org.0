Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F6D63386E
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Nov 2022 10:29:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4463E167A;
	Tue, 22 Nov 2022 10:28:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4463E167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669109344;
	bh=4D6SR4ohQ/SepujXLEaX/DxKv50tnymhZz4omAGEe8s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UkQEG1oP5oI7sQ3J41aJA5dl4+6URmp7uESq1uKBqH3SJAxHHfJqR4R9wtwwk/vdF
	 JAh+flyK6Jhm6zTfVoLRooYrD9RbML72o1ktUvKGMrkLkFFwgooa5e+1ydJBm09y8F
	 puVDU8vQ8uv0/v9iCfBJrXrENZ9cN7NOrKqdMTYA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 473EEF80559;
	Tue, 22 Nov 2022 10:27:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0139CF8026A; Sun, 20 Nov 2022 14:53:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_26,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A97A1F80155
 for <alsa-devel@alsa-project.org>; Sun, 20 Nov 2022 14:53:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A97A1F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="JIVFY4ro"
Received: by mail-qk1-x72c.google.com with SMTP id d8so6488179qki.13
 for <alsa-devel@alsa-project.org>; Sun, 20 Nov 2022 05:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=R3o7MxftPnsiuByCDpeTAo1VzY2DRAHijDZ+Q9Ek5VE=;
 b=JIVFY4robx7oRRUQfCLInbCxqPNNQRhFvRFnSzYIldrdG2Je2WB2jAJK7by2FAyGkd
 AclJ4+pXvNKd3bNZrE1MOULb31JbFqHgy5mXs4qao1kSwz+0d7uXTIk7E8t7rzKZgE+C
 svWAWmtiT1mr6y8ZLgSxKiiFC+DqvkDkZWvb5uAqYhf01luNS1B3nwOfHl/0VuJ+eZEN
 NMvaeM7Mfii8P4clfnTRfFf0udrY44fA0mGlLxkhnv7c0dDeJ/eVlbkxawEYq9dBiQw5
 tKxoSnSrS2k7jerbcuo6Vzh9DzzMOXTXQWwsaWsJYrGVMPtjX3UyjfW1PyvR/BacjkLC
 Z5lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R3o7MxftPnsiuByCDpeTAo1VzY2DRAHijDZ+Q9Ek5VE=;
 b=DPOGxF26nBkiBfQCqkCAmxTSJZWJflT0T5HuAYbZH63kPh7vrrJuhOChLLUEl3iafx
 WnKz7YC/0HaWDRAv6RlQDqRgOXrp5ccxeFpfmPVVmfYKKa61ji8AP/5M0UKp1O738wXk
 1jTHRQZIqCFuvI8oKjrUbdM1En2yGczGwoFQ5RgOt9zqOUriyH3w+EX/+uJu+CXv7QxT
 llDdFtDdast6ZGuYqtV/E8y8GBIjbybEwAtFjhI81McEek0kTJiJF/h72v1tbiucLfQR
 Quk9srZ/xHpuoR3QKvvLnSbpn0/0Le7zS2Z81ixWTNuGyII/5CfVqIjh2kGSyfDXmBM+
 rNww==
X-Gm-Message-State: ANoB5plL621V1nC5bperP+ThiCVS0w6zeBGwj1jqqtAwLxXB+1bbiI+h
 Lv63aMFJQ3ePMJ3o8MdOpnM=
X-Google-Smtp-Source: AA0mqf6lqRt0pi9+3h33Jkhzmoe8fof4ax9VZl7N0LFXcDLx5t4h1eFk7Zl7LZYKqldtMBKSAXnLLA==
X-Received: by 2002:a05:620a:1427:b0:6f9:ffc7:a9e4 with SMTP id
 k7-20020a05620a142700b006f9ffc7a9e4mr838228qkj.277.1668952390120; 
 Sun, 20 Nov 2022 05:53:10 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 s6-20020a05620a254600b006e07228ed53sm6523055qko.18.2022.11.20.05.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Nov 2022 05:53:09 -0800 (PST)
Date: Sun, 20 Nov 2022 05:53:08 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Add missing start and/or end of line regex
 anchors
Message-ID: <20221120135308.GA1787641@roeck-us.net>
References: <20221118223728.1721589-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221118223728.1721589-1-robh@kernel.org>
X-Mailman-Approved-At: Tue, 22 Nov 2022 10:27:19 +0100
Cc: Nishanth Menon <nm@ti.com>, alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Yangtao Li <tiny.windzz@gmail.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-spi@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Samuel Holland <samuel@sholland.org>,
 Ilia Lin <ilia.lin@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>,
 linux-pci@vger.kernel.org, Javier Martinez Canillas <javier@dowhile0.org>,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Bjorn Helgaas <bhelgaas@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Daniel Mack <zonque@gmail.com>,
 linux-renesas-soc@vger.kernel.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
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

On Fri, Nov 18, 2022 at 04:37:27PM -0600, Rob Herring wrote:
> json-schema patterns by default will match anywhere in a string, so
> typically we want at least the start or end anchored. Fix the obvious
> cases where the anchors were forgotten.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> Acked-by: Mark Brown <broonie@kernel.org>
> ---
>  .../devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml       | 2 +-
>  Documentation/devicetree/bindings/hwmon/adt7475.yaml          | 4 ++--

For hwmon: 

Acked-by: Guenter Roeck <linux@roeck-us.net>

>  .../bindings/opp/allwinner,sun50i-h6-operating-points.yaml    | 4 ++--
>  .../devicetree/bindings/pci/mediatek,mt7621-pcie.yaml         | 2 +-
>  .../devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml        | 2 +-
>  Documentation/devicetree/bindings/regulator/max8660.yaml      | 2 +-
>  .../devicetree/bindings/regulator/maxim,max77802.yaml         | 2 +-
>  Documentation/devicetree/bindings/regulator/regulator.yaml    | 2 +-
>  .../devicetree/bindings/regulator/rohm,bd9576-regulator.yaml  | 2 +-
>  Documentation/devicetree/bindings/sound/renesas,rsnd.yaml     | 2 +-
>  .../devicetree/bindings/spi/nvidia,tegra210-quad.yaml         | 2 +-
>  11 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
> index a11e1b867379..3c00ad09eeaa 100644
> --- a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
> +++ b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
> @@ -38,7 +38,7 @@ properties:
>      type: object
>  
>      patternProperties:
> -      'cpu@[0-9a-f]+':
> +      '^cpu@[0-9a-f]+$':
>          type: object
>  
>          properties:
> diff --git a/Documentation/devicetree/bindings/hwmon/adt7475.yaml b/Documentation/devicetree/bindings/hwmon/adt7475.yaml
> index ea595102a86e..051c976ab711 100644
> --- a/Documentation/devicetree/bindings/hwmon/adt7475.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/adt7475.yaml
> @@ -61,7 +61,7 @@ patternProperties:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      enum: [0, 1]
>  
> -  "adi,pin(5|10)-function":
> +  "^adi,pin(5|10)-function$":
>      description: |
>        Configures the function for pin 5 on the adi,adt7473 and adi,adt7475. Or
>        pin 10 on the adi,adt7476 and adi,adt7490.
> @@ -70,7 +70,7 @@ patternProperties:
>        - pwm2
>        - smbalert#
>  
> -  "adi,pin(9|14)-function":
> +  "^adi,pin(9|14)-function$":
>      description: |
>        Configures the function for pin 9 on the adi,adt7473 and adi,adt7475. Or
>        pin 14 on the adi,adt7476 and adi,adt7490
> diff --git a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml b/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
> index 385b0692261c..51f62c3ae194 100644
> --- a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
> +++ b/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating-points.yaml
> @@ -41,7 +41,7 @@ required:
>    - nvmem-cells
>  
>  patternProperties:
> -  "opp-[0-9]+":
> +  "^opp-[0-9]+$":
>      type: object
>  
>      properties:
> @@ -49,7 +49,7 @@ patternProperties:
>        clock-latency-ns: true
>  
>      patternProperties:
> -      "opp-microvolt-.*": true
> +      "^opp-microvolt-speed[0-9]$": true
>  
>      required:
>        - opp-hz
> diff --git a/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml b/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml
> index d60f43fd9c5a..e63e6458cea8 100644
> --- a/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml
> @@ -31,7 +31,7 @@ properties:
>      maxItems: 2
>  
>  patternProperties:
> -  'pcie@[0-2],0':
> +  '^pcie@[0-2],0$':
>      type: object
>      $ref: /schemas/pci/pci-bus.yaml#
>  
> diff --git a/Documentation/devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml b/Documentation/devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml
> index 0f18cceba3d5..5a0d64d3ae6b 100644
> --- a/Documentation/devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml
> +++ b/Documentation/devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml
> @@ -65,7 +65,7 @@ properties:
>      maxItems: 1
>  
>  patternProperties:
> -  'usb@[0-1],0':
> +  '^usb@[0-1],0$':
>      type: object
>  
>      description:
> diff --git a/Documentation/devicetree/bindings/regulator/max8660.yaml b/Documentation/devicetree/bindings/regulator/max8660.yaml
> index 9c038698f880..4d550ca396eb 100644
> --- a/Documentation/devicetree/bindings/regulator/max8660.yaml
> +++ b/Documentation/devicetree/bindings/regulator/max8660.yaml
> @@ -24,7 +24,7 @@ properties:
>      type: object
>  
>      patternProperties:
> -      "regulator-.+":
> +      "^regulator-.+$":
>          $ref: "regulator.yaml#"
>  
>      additionalProperties: false
> diff --git a/Documentation/devicetree/bindings/regulator/maxim,max77802.yaml b/Documentation/devicetree/bindings/regulator/maxim,max77802.yaml
> index 71138c611b6c..b704f05ea454 100644
> --- a/Documentation/devicetree/bindings/regulator/maxim,max77802.yaml
> +++ b/Documentation/devicetree/bindings/regulator/maxim,max77802.yaml
> @@ -77,7 +77,7 @@ patternProperties:
>        regulator-initial-mode: false
>  
>      patternProperties:
> -      regulator-state-(standby|mem|disk):
> +      "^regulator-state-(standby|mem|disk)$":
>          type: object
>          additionalProperties: true
>          properties:
> diff --git a/Documentation/devicetree/bindings/regulator/regulator.yaml b/Documentation/devicetree/bindings/regulator/regulator.yaml
> index 6e8aa9eed3aa..53b81d8a2d41 100644
> --- a/Documentation/devicetree/bindings/regulator/regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/regulator.yaml
> @@ -231,7 +231,7 @@ patternProperties:
>    ".*-supply$":
>      description: Input supply phandle(s) for this node
>  
> -  regulator-state-(standby|mem|disk):
> +  "^regulator-state-(standby|mem|disk)$":
>      type: object
>      description:
>        sub-nodes for regulator state in Standby, Suspend-to-RAM, and
> diff --git a/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml b/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml
> index 7cb74cc8c5d9..54be194bb244 100644
> --- a/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml
> @@ -21,7 +21,7 @@ description: |
>    regulator-voutl1, regulator-vouts1
>  
>  patternProperties:
> -  "regulator-.+":
> +  "^regulator-.+$":
>      type: object
>      description:
>        Properties for single regulator.
> diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> index 679a246dd666..7df40c38e865 100644
> --- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> +++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> @@ -115,7 +115,7 @@ properties:
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>      patternProperties:
> -      port(@[0-9a-f]+)?:
> +      '^port(@[0-9a-f]+)?$':
>          $ref: audio-graph-port.yaml#
>          unevaluatedProperties: false
>  
> diff --git a/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml b/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml
> index 6b733e5c1163..899100e783c9 100644
> --- a/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml
> +++ b/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad.yaml
> @@ -48,7 +48,7 @@ properties:
>        - const: tx
>  
>  patternProperties:
> -  "@[0-9a-f]+":
> +  "@[0-9a-f]+$":
>      type: object
>  
>      properties:
