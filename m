Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D09293109
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Oct 2020 00:18:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BBE016F5;
	Tue, 20 Oct 2020 00:17:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BBE016F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603145885;
	bh=uX4maItsqDG18cfvewtCdQzqtCHtz4s8dlLHWRZfQgY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KcBjKvwyUGQ/aFbbfbMYf9Udg499uKM02SKvnLCv39sYBgNzPXR05rtaqIBNWuOoS
	 R77uU2MD2aefCW3HMmPqGRJlJp6Ju0rn9q4QtL6J8kBwH3/S+dEKVDmdbVlADZ2SrD
	 FMR4VPZlnyCbxNQ0bh60n5NV1pYicqLzdhALvFqc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91B5FF801A3;
	Tue, 20 Oct 2020 00:16:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FD63F80247; Tue, 20 Oct 2020 00:16:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0DEF3F801A3
 for <alsa-devel@alsa-project.org>; Tue, 20 Oct 2020 00:16:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DEF3F801A3
Received: by mail-ot1-f66.google.com with SMTP id h62so1327203oth.9
 for <alsa-devel@alsa-project.org>; Mon, 19 Oct 2020 15:16:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7ro/YQVjz81P9SXrPqBg+aSAZ3CY21lcJ/N+W67/ad0=;
 b=CQjHELfh1cQCRJc65sSjP8nCdF628vJzIZRtNCNK+DIQkVj54wSQql5IEla5BhRt5X
 UD4KuYVwOb/efO7w4eSHinmNzw45xMQuDne8r42qvElAx4hN5gc66MybbDLYf//gkDt5
 0s24njtv09dMo4QxzUMc+//u8JxKGDb1oICl7fxaSEP/DS9YFcmWnuHmsyJUsEkKf4Yz
 TNsuzUeAzbnWE5MhfTD4VdKqrcceIzJaXtLFWEvUsYookpbaUQpjsxdZ8lQgz5bjxm8h
 4coG1CoZVJLSlvgWYWCnrv4MdFWEOmyKIXgoXuC00dKluXBh2c7eS9ReW/S0gk2D1S9y
 yf2Q==
X-Gm-Message-State: AOAM530EbIzVTsX/kvYKACLtL9XkeGEkeEjeafmxoTPS4FSLhcWdHZF/
 avZXTKmlpBkccjE88uwhZw==
X-Google-Smtp-Source: ABdhPJwToqJ2946gzDsGsazKbQCSDFHji8pzyB1wMCh7IO4Irb4cjEHJvy/roabKqFJ7wELd+1le8w==
X-Received: by 2002:a9d:42e:: with SMTP id 43mr1489058otc.199.1603145774004;
 Mon, 19 Oct 2020 15:16:14 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p10sm312216oig.37.2020.10.19.15.16.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 15:16:13 -0700 (PDT)
Received: (nullmailer pid 3695429 invoked by uid 1000);
 Mon, 19 Oct 2020 22:16:12 -0000
Date: Mon, 19 Oct 2020 17:16:12 -0500
From: Rob Herring <robh@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v4 11/15] ASoC: dt-bindings: tegra: Add json-schema for
 Tegra audio graph card
Message-ID: <20201019221612.GA3690258@bogus>
References: <1602859382-19505-1-git-send-email-spujar@nvidia.com>
 <1602859382-19505-12-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1602859382-19505-12-git-send-email-spujar@nvidia.com>
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 atalambedu@nvidia.com, linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 rlokhande@nvidia.com, swarren@nvidia.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, jonathanh@nvidia.com,
 devicetree@vger.kernel.org, nicoleotsuka@gmail.com, broonie@kernel.org,
 linux-tegra@vger.kernel.org, mkumard@nvidia.com, viswanathl@nvidia.com,
 lgirdwood@gmail.com, nwartikar@nvidia.com, p.zabel@pengutronix.de,
 sharadg@nvidia.com, dramesh@nvidia.com
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

On Fri, Oct 16, 2020 at 08:12:58PM +0530, Sameer Pujar wrote:
> Add YAML schema for Tegra audio graph sound card DT bindings. It uses the
> same DT bindings provided by generic audio graph driver. Along with this
> few standard clock DT bindings are added which are specifically required
> for Tegra audio.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  .../sound/nvidia,tegra-audio-graph-card.yaml       | 158 +++++++++++++++++++++
>  1 file changed, 158 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml
> new file mode 100644
> index 0000000..284d185
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml
> @@ -0,0 +1,158 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-graph-card.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Audio Graph based Tegra sound card driver
> +
> +description: |
> +  This is based on generic audio graph card driver along with additional
> +  customizations for Tegra platforms. It uses the same bindings with
> +  additional standard clock DT bindings required for Tegra.
> +
> +  See{LINUX}/Documentation/devicetree/bindings/sound/audio-graph-card.yaml

You should be able to just $ref this at the top level.

> +
> +maintainers:
> +  - Jon Hunter <jonathanh@nvidia.com>
> +  - Sameer Pujar <spujar@nvidia.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - nvidia,tegra210-audio-graph-card
> +          - nvidia,tegra186-audio-graph-card
> +

> +  dais:
> +    $ref: /schemas/sound/audio-graph-card.yaml#/properties/dais
> +
> +  label:
> +    $ref: /schemas/sound/simple-card.yaml#/properties/label
> +
> +  pa-gpios:
> +    $ref: /schemas/sound/audio-graph-card.yaml#/properties/pa-gpios
> +
> +  widgets:
> +    $ref: /schemas/sound/simple-card.yaml#/definitions/widgets
> +
> +  routing:
> +    $ref: /schemas/sound/simple-card.yaml#/definitions/routing
> +
> +  mclk-fs:
> +    $ref: /schemas/sound/simple-card.yaml#/definitions/mclk-fs
> +
> +  prefix:
> +    $ref: /schemas/sound/simple-card.yaml#/definitions/prefix

And drop all of these.

> +
> +  clocks:
> +   minItems: 2
> +
> +  clock-names:
> +   minItems: 2

Don't need this.

> +   items:
> +     - const: pll_a
> +     - const: plla_out0
> +
> +  assigned-clocks:
> +    minItems: 1
> +    maxItems: 3
> +
> +  assigned-clock-parents:
> +    minItems: 1
> +    maxItems: 3
> +
> +  assigned-clock-rates:
> +    minItems: 1
> +    maxItems: 3
> +
> +  ports:
> +    $ref: /schemas/sound/audio-graph-card.yaml#/properties/ports
> +
> +patternProperties:
> +  "^port(@[0-9a-f]+)?$":
> +    $ref: /schemas/sound/audio-graph-card.yaml#/definitions/port

And these can be dropped. Unless what each port is is Tegra specific.

> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - dais
> +  - clocks
> +  - clock-names
> +  - assigned-clocks
> +  - assigned-clock-parents
> +
> +examples:
> +  - |
> +    #include<dt-bindings/clock/tegra210-car.h>
> +
> +    tegra_sound {
> +        compatible = "nvidia,tegra210-audio-graph-card";
> +
> +        clocks = <&tegra_car TEGRA210_CLK_PLL_A>,
> +                 <&tegra_car TEGRA210_CLK_PLL_A_OUT0>;
> +        clock-names = "pll_a", "plla_out0";
> +
> +        assigned-clocks = <&tegra_car TEGRA210_CLK_PLL_A>,
> +                          <&tegra_car TEGRA210_CLK_PLL_A_OUT0>,
> +                          <&tegra_car TEGRA210_CLK_EXTERN1>;
> +        assigned-clock-parents = <0>, <0>, <&tegra_car TEGRA210_CLK_PLL_A_OUT0>;
> +        assigned-clock-rates = <368640000>, <49152000>, <12288000>;
> +
> +        dais = /* FE */
> +               <&admaif1_port>,
> +               /* Router */
> +               <&xbar_i2s1_port>,
> +               /* I/O DAP Ports */
> +               <&i2s1_port>;
> +
> +        label = "jetson-tx1-ape";
> +    };
> +
> +    tegra_ahub: ahub@702d0800 {
> +        // ...
> +
> +        reg = <0x702d0800 0x800>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            xbar_i2s1_port: port@a {
> +                reg = <0xa>;
> +                xbar_i2s1_ep: endpoint {
> +                    remote-endpoint = <&i2s1_cif_ep>;
> +                };
> +            };
> +        };
> +    };
> +
> +    tegra_i2s1: i2s@702d1000 {
> +        // ...
> +
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        reg = <0x702d1000 0x100>;
> +
> +        port@0 {
> +            reg = <0>;
> +
> +            i2s1_cif_ep: endpoint {
> +                remote-endpoint = <&xbar_i2s1_ep>;
> +            };
> +        };
> +
> +        i2s1_port: port@1 {
> +            reg = <1>;
> +
> +            i2s1_dap: endpoint {
> +                dai-format = "i2s";
> +
> +                // ...
> +            };
> +        };
> +    };
> +
> +...
> -- 
> 2.7.4
> 
