Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6C51703BA
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Feb 2020 17:04:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B24CD1674;
	Wed, 26 Feb 2020 17:03:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B24CD1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582733083;
	bh=Kp/w0cfVM+L20gzsBMf82ZPd2YC1zSvWU4qFDcd2ap8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xgis/roBqxqxQ58VZJ2sLOec2Aqm7PVHObXSuNLiPXMkZ+ARUXAQ0t3TiK2GuE9Gx
	 pQSkyLtHjZOpnU7Irdcp/6L/fgjgMF2UNSryn1oxSSEEIyGK2vAx2jcbXrY4temyMx
	 a14CztbZUSEfgTWBDowZ2Q907XERplGMXc6ocV+E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BAA05F8016F;
	Wed, 26 Feb 2020 17:03:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40397F8014E; Wed, 26 Feb 2020 17:03:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD15DF80089
 for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2020 17:02:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD15DF80089
Received: by mail-oi1-f196.google.com with SMTP id r137so3538504oie.5
 for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2020 08:02:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wLmw0G4mFTlo+pxwfHpS7rtH5YxtUBFtFesPEcoJstg=;
 b=b4jRcTCEZ3uOvWl6g/9QtasgQVl6M41zLTFYOb4dek2kDy1LAO+8Mor89+4PW4WtVs
 Q6MYvEFf5QrdM6Wn3QDze4Z3LGcUTOZTwZBXxa1f4vU8x5FVk1icgJFm5cx8kCcfhwQO
 RHH5k+3wL3muII2I6KdX4XRAEruAJaZQLBIt85TZFDHeBooC9ujSOVboHG82zXOMUZ4s
 iJnVmHEdudOzexWqHo+yKbE/wVwdg7gtuxVK3Yi+aabkv8dnzGSCaYGoFiICZnzLFYXQ
 OMvIvRC7YUksvM8sWH1rbmOFKvYmbW7d2CbtXRYgdbrEGl5tNmV1qr3qZ0t0ZGtfLW8U
 Jbjw==
X-Gm-Message-State: APjAAAW9zIw7nT+4XSwajW+Cz7dL/fwLF4c/csCgXOOsZo064h80mVEJ
 GHqEbGV61ULM96tjmv5mBw==
X-Google-Smtp-Source: APXvYqxvM7VilUPX6YwtqSvgwo1M/YWANWs8cXAUpbHnWfVJRo1zwHtoIEvYX0LvvtfTtFcfpyP3Lw==
X-Received: by 2002:aca:cdd0:: with SMTP id d199mr3686599oig.49.1582732974610; 
 Wed, 26 Feb 2020 08:02:54 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f142sm925865oig.48.2020.02.26.08.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 08:02:53 -0800 (PST)
Received: (nullmailer pid 20197 invoked by uid 1000);
 Wed, 26 Feb 2020 16:02:52 -0000
Date: Wed, 26 Feb 2020 10:02:52 -0600
From: Rob Herring <robh@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v3 01/10] dt-bindings: sound: tegra: add DT binding for
 AHUB
Message-ID: <20200226160252.GA3671@bogus>
References: <1582180492-25297-1-git-send-email-spujar@nvidia.com>
 <1582180492-25297-2-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582180492-25297-2-git-send-email-spujar@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, jonathanh@nvidia.com, viswanathl@nvidia.com,
 sharadg@nvidia.com, broonie@kernel.org, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org, digetx@gmail.com, rlokhande@nvidia.com,
 mkumard@nvidia.com, dramesh@nvidia.com
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

On Thu, Feb 20, 2020 at 12:04:43PM +0530, Sameer Pujar wrote:
> Audio Hub (AHUB) comprises a collection of hardware accelerators for audio
> pre-processing and post-processing and a programmable full crossbar for
> audio routing across these accelerators. This patch adds YAML schema for DT
> binding of AHUB and few of its following components. These devices will be
> registered as ASoC components.
>  * ADMAIF
>  * I2S
>  * DMIC
>  * DSPK
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  .../bindings/sound/nvidia,tegra186-dspk.yaml       |  88 +++++++++++
>  .../bindings/sound/nvidia,tegra210-admaif.yaml     | 163 +++++++++++++++++++++
>  .../bindings/sound/nvidia,tegra210-ahub.yaml       | 110 ++++++++++++++
>  .../bindings/sound/nvidia,tegra210-dmic.yaml       |  88 +++++++++++
>  .../bindings/sound/nvidia,tegra210-i2s.yaml        | 101 +++++++++++++
>  5 files changed, 550 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
> new file mode 100644
> index 0000000..79c720d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/nvidia,tegra186-dspk.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Tegra186 DSPK Controller Device Tree Bindings
> +
> +description: |
> +  The Digital Speaker Controller (DSPK) can be viewed as a Pulse
> +  Density Modulation (PDM) transmitter that up-samples the input to
> +  the desired sampling rate by interpolation and then converts the
> +  over sampled Pulse Code Modulation (PCM) input to the desired 1-bit
> +  output via Delta Sigma Modulation (DSM).
> +
> +maintainers:
> +  - Jon Hunter <jonathanh@nvidia.com>
> +  - Sameer Pujar <spujar@nvidia.com>
> +
> +properties:
> +  $nodename:
> +    pattern: "^dspk@[0-9a-f]*$"
> +
> +  compatible:
> +    oneOf:
> +      - const: nvidia,tegra186-dspk
> +      - items:
> +          - const: nvidia,tegra194-dspk
> +          - const: nvidia,tegra186-dspk
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description: DSPK interface clock

Needs: 

maxItems: 1

I'd drop the description too. It's pretty generic...

> +
> +  clock-names:
> +    const: dspk
> +

> +  assigned-clocks:
> +    description: DSPK interface clock
> +
> +  assigned-clock-parents:
> +    description: Parent for DSPK interface clock
> +
> +  assigned-clock-rates:
> +    description: Initial rate of DSPK interface clock

maxItems: 1 for these 3.

> +
> +  "#sound-dai-cells":
> +    const: 1
> +
> +  sound-name-prefix:
> +    pattern: "^DSPK[1-9]$"
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      Used as prefix for sink/source names of the component. Must be a
> +      unique string among multiple instances of the same component.
> +      The name can be "DSPK1" or "DSPKx", where x depends on the maximum
> +      available instances on a Tegra SoC.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - assigned-clocks
> +  - assigned-clock-parents
> +  - "#sound-dai-cells"
> +  - sound-name-prefix
> +
> +examples:
> +  - |
> +    #include<dt-bindings/clock/tegra186-clock.h>
> +
> +    dspk@2905000 {
> +        compatible = "nvidia,tegra186-dspk";
> +        reg = <0x2905000 0x100>;
> +        clocks = <&bpmp TEGRA186_CLK_DSPK1>;
> +        clock-names = "dspk";
> +        assigned-clocks = <&bpmp TEGRA186_CLK_DSPK1>;
> +        assigned-clock-parents = <&bpmp TEGRA186_CLK_PLL_A_OUT0>;
> +        assigned-clock-rates = <12288000>;
> +        #sound-dai-cells = <1>;
> +        sound-name-prefix = "DSPK1";
> +    };
> +
> +...
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
> new file mode 100644
> index 0000000..46637c6a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
> @@ -0,0 +1,163 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/nvidia,tegra210-admaif.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Tegra210 ADMAIF Device Tree Bindings
> +
> +description: |
> +  ADMAIF is the interface between ADMA and AHUB. Each ADMA channel
> +  that sends/receives data to/from AHUB must interface through an
> +  ADMAIF channel. ADMA channel sending data to AHUB pairs with ADMAIF
> +  Tx channel and ADMA channel receiving data from AHUB pairs with
> +  ADMAIF Rx channel.
> +
> +maintainers:
> +  - Jon Hunter <jonathanh@nvidia.com>
> +  - Sameer Pujar <spujar@nvidia.com>
> +
> +properties:
> +  $nodename:
> +    pattern: "^admaif@[0-9a-f]*$"
> +
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - nvidia,tegra210-admaif
> +          - nvidia,tegra186-admaif
> +      - items:
> +          - const: nvidia,tegra194-admaif
> +          - const: nvidia,tegra186-admaif
> +
> +  reg:
> +    maxItems: 1
> +
> +  dmas: true
> +
> +  dma-names: true
> +
> +  "#sound-dai-cells":
> +    const: 1
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: nvidia,tegra210-admaif
> +
> +then:
> +  properties:
> +    dmas:
> +      description:
> +        DMA channel specifiers, equally divided for Tx and Rx.
> +      minItems: 1
> +      maxItems: 20
> +    dma-names:
> +      items:
> +        pattern: "^[rt]x(10|[1-9])$"
> +      description:
> +        Should be "rx1", "rx2" ... "rx10" for DMA Rx channel
> +        Should be "tx1", "tx2" ... "tx10" for DMA Tx channel
> +      minItems: 1
> +      maxItems: 20
> +
> +else:
> +  properties:
> +    dmas:
> +      description:
> +        DMA channel specifiers, equally divided for Tx and Rx.
> +      minItems: 1
> +      maxItems: 40
> +    dma-names:
> +      items:
> +        pattern: "^[rt]x(1[0-9]|[1-9]|20)$"
> +      description:
> +        Should be "rx1", "rx2" ... "rx20" for DMA Rx channel
> +        Should be "tx1", "tx2" ... "tx20" for DMA Tx channel
> +      minItems: 1
> +      maxItems: 40
> +
> +required:
> +  - compatible
> +  - reg
> +  - dmas
> +  - dma-names
> +  - "#sound-dai-cells"
> +
> +examples:
> +  - |
> +    admaif@702d0000 {
> +        compatible = "nvidia,tegra210-admaif";
> +        reg = <0x702d0000 0x800>;
> +        dmas = <&adma 1>,  <&adma 1>,
> +               <&adma 2>,  <&adma 2>,
> +               <&adma 3>,  <&adma 3>,
> +               <&adma 4>,  <&adma 4>,
> +               <&adma 5>,  <&adma 5>,
> +               <&adma 6>,  <&adma 6>,
> +               <&adma 7>,  <&adma 7>,
> +               <&adma 8>,  <&adma 8>,
> +               <&adma 9>,  <&adma 9>,
> +               <&adma 10>, <&adma 10>;
> +        dma-names = "rx1",  "tx1",
> +                    "rx2",  "tx2",
> +                    "rx3",  "tx3",
> +                    "rx4",  "tx4",
> +                    "rx5",  "tx5",
> +                    "rx6",  "tx6",
> +                    "rx7",  "tx7",
> +                    "rx8",  "tx8",
> +                    "rx9",  "tx9",
> +                    "rx10", "tx10";
> +        #sound-dai-cells = <1>;
> +    };
> +
> +  - |
> +    admaif@290f000 {
> +        compatible = "nvidia,tegra186-admaif";
> +        reg = <0x0290f000 0x1000>;
> +        dmas = <&adma 1>, <&adma 1>,
> +               <&adma 2>, <&adma 2>,
> +               <&adma 3>, <&adma 3>,
> +               <&adma 4>, <&adma 4>,
> +               <&adma 5>, <&adma 5>,
> +               <&adma 6>, <&adma 6>,
> +               <&adma 7>, <&adma 7>,
> +               <&adma 8>, <&adma 8>,
> +               <&adma 9>, <&adma 9>,
> +               <&adma 10>, <&adma 10>,
> +               <&adma 11>, <&adma 11>,
> +               <&adma 12>, <&adma 12>,
> +               <&adma 13>, <&adma 13>,
> +               <&adma 14>, <&adma 14>,
> +               <&adma 15>, <&adma 15>,
> +               <&adma 16>, <&adma 16>,
> +               <&adma 17>, <&adma 17>,
> +               <&adma 18>, <&adma 18>,
> +               <&adma 19>, <&adma 19>,
> +               <&adma 20>, <&adma 20>;
> +        dma-names = "rx1", "tx1",
> +                    "rx2", "tx2",
> +                    "rx3", "tx3",
> +                    "rx4", "tx4",
> +                    "rx5", "tx5",
> +                    "rx6", "tx6",
> +                    "rx7", "tx7",
> +                    "rx8", "tx8",
> +                    "rx9", "tx9",
> +                    "rx10", "tx10",
> +                    "rx11", "tx11",
> +                    "rx12", "tx12",
> +                    "rx13", "tx13",
> +                    "rx14", "tx14",
> +                    "rx15", "tx15",
> +                    "rx16", "tx16",
> +                    "rx17", "tx17",
> +                    "rx18", "tx18",
> +                    "rx19", "tx19",
> +                    "rx20", "tx20";
> +        #sound-dai-cells = <1>;
> +    };

I don't see a lot of value in having 2 examples.

> +
> +...
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
> new file mode 100644
> index 0000000..5f3e1ed
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml

Same prior comments apply here.

> @@ -0,0 +1,110 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/nvidia,tegra210-ahub.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Tegra210 AHUB Device Tree Bindings
> +
> +description: |
> +  The Audio Hub (AHUB) comprises a collection of hardware accelerators
> +  for audio pre-processing, post-processing and a programmable full
> +  crossbar for routing audio data across these accelerators. It has
> +  external interfaces such as I2S, DMIC, DSPK. It interfaces with ADMA
> +  engine through ADMAIF.
> +
> +maintainers:
> +  - Jon Hunter <jonathanh@nvidia.com>
> +  - Sameer Pujar <spujar@nvidia.com>
> +
> +properties:
> +  $nodename:
> +    pattern: "^ahub@[0-9a-f]*$"
> +
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - nvidia,tegra210-ahub
> +          - nvidia,tegra186-ahub
> +      - items:
> +          - const: nvidia,tegra194-ahub
> +          - const: nvidia,tegra186-ahub
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description: AHUB module clock
> +
> +  clock-names:
> +    const: ahub
> +
> +  assigned-clocks:
> +    description: AHUB module clock
> +
> +  assigned-clock-parents:
> +    description: parent for AHUB module clock
> +
> +  assigned-clock-rates:
> +    description: AHUB module clock rate
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array

ranges already has a type.

> +    description: Specify address range for the node and its children

Drop. That's every 'ranges'.

> +    minItems: 1
> +
> +  "#sound-dai-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - assigned-clocks
> +  - assigned-clock-parents
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges
> +  - "#sound-dai-cells"
> +
> +examples:
> +  - |
> +    #include<dt-bindings/clock/tegra210-car.h>
> +
> +    ahub@702d0800 {
> +        compatible = "nvidia,tegra210-ahub";
> +        reg = <0x702d0800 0x800>;
> +        clocks = <&tegra_car TEGRA210_CLK_D_AUDIO>;
> +        clock-names = "ahub";
> +        assigned-clocks = <&tegra_car TEGRA210_CLK_D_AUDIO>;
> +        assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_A_OUT0>;

> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges = <0x702d0000 0x702d0000 0x0000e400>;

These properties imply you have child nodes, but none are defined.

> +        #sound-dai-cells = <1>;
> +    };
> +
> +  - |
> +    #include<dt-bindings/clock/tegra186-clock.h>
> +
> +    ahub@2900800 {
> +        compatible = "nvidia,tegra186-ahub";
> +        reg = <0x02900800 0x800>;
> +        clocks = <&bpmp TEGRA186_CLK_AHUB>;
> +        clock-names = "ahub";
> +        assigned-clocks = <&bpmp TEGRA186_CLK_AHUB>;
> +        assigned-clock-parents = <&bpmp TEGRA186_CLK_PLL_A_OUT0>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges = <0x02900800 0x02900800 0x11800>;
> +        #sound-dai-cells = <1>;
> +    };

Really need 2 examples?

> +
> +...

Same comments apply to the rest.
