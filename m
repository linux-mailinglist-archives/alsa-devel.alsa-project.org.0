Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 284D8154D83
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Feb 2020 21:49:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A378D16E5;
	Thu,  6 Feb 2020 21:48:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A378D16E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581022142;
	bh=B4X6o5IjFZVyEBNDFJHvhV5dLwfZHDZywwSW0IAyZt8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CvG0M687cPEMjY+gJ68n1zehR/u6WMLN00IkXBRjjqcj7jgWXbG4m8PTttTylokL7
	 fFGSBExURLLqAlf9xf/wDT2pwjJkxzgflRoj4A1hyiie57OC50S2t4aN7hkDkgWauP
	 IuMzorCssapF7c6Zi0NRZVVuwp3GfvBdaOsXCqZc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70EAAF80212;
	Thu,  6 Feb 2020 21:46:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4AEEF80162; Thu,  6 Feb 2020 21:46:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F071F800AB
 for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2020 21:46:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F071F800AB
Received: by mail-pl1-f195.google.com with SMTP id c23so41039plz.4
 for <alsa-devel@alsa-project.org>; Thu, 06 Feb 2020 12:46:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5OOXYFIqEU+LJl0CSasuKCfoYnWm1dEiiEdMWamRXfA=;
 b=GDFnZlhGcv5TrmmxAo7xaYzJDRLg8nqoz05bmKGUTimYUSl3+Z4TJ+wcToQtoK2Y4B
 6nz2vr3JxBZB7lpeJLnKGwTpND/oMX9l67uhMVaAoXxRlQoyuPAgyDsBP23W+KAKcLBT
 JR8yBMUITSRVxRuadfFkUTf9S2xM+j2PrJB3Vm8UBAzi2f74lJN+T8hN2rafiv7xuQJw
 troSOfSJs9UARpZCOdLXXyFexBYq76O+AwEJE3LMA3OTGclgGBO5dVouI9p/CYjWYQMU
 /liALjY+lPXfFSlr3guYT4WW7waaxcjVZcu6kbSAGlNWEL6+KP5xAKSuVHHznXRSZyu7
 5khA==
X-Gm-Message-State: APjAAAU/Qc6LGlgJToErLZQv8LOVZXTdLekJ3xJFBJyJy0SpzZN9CR7n
 03iElmRXB804hD8qF/ITgg==
X-Google-Smtp-Source: APXvYqxMKyyGgfS4SNqE734iihQ1ZSY1xsIAJkFzRqu4B/i+hbGP+oW2VzzUFxFzAEqoHOJ1wkbqVA==
X-Received: by 2002:a17:902:7203:: with SMTP id
 ba3mr5720574plb.249.1581021985220; 
 Thu, 06 Feb 2020 12:46:25 -0800 (PST)
Received: from rob-hp-laptop (63-158-47-182.dia.static.qwest.net.
 [63.158.47.182])
 by smtp.gmail.com with ESMTPSA id x11sm283522pfn.53.2020.02.06.12.46.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 12:46:24 -0800 (PST)
Received: (nullmailer pid 21869 invoked by uid 1000);
 Thu, 06 Feb 2020 18:10:45 -0000
Date: Thu, 6 Feb 2020 18:10:45 +0000
From: Rob Herring <robh@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Message-ID: <20200206181045.GA31521@bogus>
References: <1580380422-3431-1-git-send-email-spujar@nvidia.com>
 <1580380422-3431-2-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1580380422-3431-2-git-send-email-spujar@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, jonathanh@nvidia.com, viswanathl@nvidia.com,
 sharadg@nvidia.com, broonie@kernel.org, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org, digetx@gmail.com, rlokhande@nvidia.com,
 mkumard@nvidia.com, dramesh@nvidia.com
Subject: Re: [alsa-devel] [PATCH v2 1/9] dt-bindings: sound: tegra: add DT
	binding for AHUB
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Thu, Jan 30, 2020 at 04:03:34PM +0530, Sameer Pujar wrote:
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
>  .../bindings/sound/nvidia,tegra186-dspk.yaml       | 105 +++++++++++++
>  .../bindings/sound/nvidia,tegra210-admaif.yaml     | 165 +++++++++++++++++++++
>  .../bindings/sound/nvidia,tegra210-ahub.yaml       | 130 ++++++++++++++++
>  .../bindings/sound/nvidia,tegra210-dmic.yaml       | 105 +++++++++++++
>  .../bindings/sound/nvidia,tegra210-i2s.yaml        | 112 ++++++++++++++
>  5 files changed, 617 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-dmic.yaml
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra210-i2s.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
> new file mode 100644
> index 0000000..dc9fef3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra186-dspk.yaml
> @@ -0,0 +1,105 @@
> +# SPDX-License-Identifier: (GPL-2.0)

Dual license new bindings:

(GPL-2.0-only OR BSD-2-Clause)

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
> +  compatible:
> +    oneOf:
> +      - items:

Drop 'items' for a single entry.

> +          const: nvidia,tegra186-dspk
> +      - items:
> +          - enum:
> +              - nvidia,tegra194-dspk
> +          - enum:
> +              - nvidia,tegra186-dspk

This can be a 'const'

> +
> +  reg:
> +    description: offset and length of the register set for the device.

That's every 'reg'. Drop.

> +    maxItems: 1
> +
> +  clocks:
> +    description: must contain an entry for each entry in clock-names.
> +      See ../clocks/clocks-bindings.txt for details.
> +    minItems: 1

Drop description and minItems. minItems is implied by the length of 
'items'.

> +    items:
> +      - description: Module clock
> +
> +  clock-names:
> +    description: must contain clock names for each corresponding entry in clocks.
> +      See ../clocks/clocks-bindings.txt for details.
> +    minItems: 1

ditto

> +    items:
> +      - const: dspk
> +
> +  assigned-clocks:
> +    description: list of input clocks and dividers for the audio system.
> +      See ../clocks/clock-bindings.txt for details.
> +    minItems: 1

ditto

> +    items:
> +      - description: Module clock
> +
> +  assigned-clock-parents:
> +    description: parent clock for each entry in assigned-clocks
> +      See ../clocks/clock-bindings.txt for details.
> +    minItems: 1

ditto

> +    items:
> +      - description: Parent for module clock
> +
> +  assigned-clock-rates:
> +    description: clock rate for each entry in assigned-clocks
> +      See ../clocks/clock-bindings.txt for details.

ditto

> +    items:
> +      - description: initial module clock rate
> +
> +  "#sound-dai-cells":
> +    const: 1
> +
> +  sound-name-prefix:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      Used as prefix for sink/source names of the component. Must be a
> +      unique string among multiple instances of the same component.
> +      The name can be "DSPK1" or "DSPKx", where x depends on the maximum

Sounds like a constraint.

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
> +
> +examples:
> +  - |
> +    #include<dt-bindings/clock/tegra186-clock.h>
> +
> +    tegra_dspk1: dspk@2905000 {
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
> index 0000000..a8a41ba
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-admaif.yaml
> @@ -0,0 +1,165 @@
> +# SPAT-License-Identifier: (GPL-2.0)
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
> +  compatible:
> +    oneOf:
> +      - items:
> +          const: nvidia,tegra210-admaif
> +      - items:
> +          const: nvidia,tegra186-admaif

These 2 can be a single enum.

> +      - items:
> +          - enum:
> +             - nvidia,tegra194-admaif
> +          - enum:
> +             - nvidia,tegra186-admaif
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
> +      $ref: /schemas/types.yaml#/definitions/phandle-array

Drop. Common properties already have a type.

Plus this is wrong. A '$ref' means all other keywords are ignored (until 
we move to draft8).

> +      description:
> +        Two or more DMA channel specifiers, equally divided for Tx and Rx.
> +      minItems: 2
> +      maxItems: 20
> +    dma-names:
> +      $ref: /schemas/types.yaml#/definitions/string-array

drop

> +      description:
> +        There must be at least one channel named "tx1" for transmit and "rx1"
> +        for receive. If more channels need to be specified then "tx1",
> +        "tx2" ... "tx10" can be used. Similarly for Rx channels as well.

Sounds like constraints.


Stopping there. Similar issues on the rest...
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
