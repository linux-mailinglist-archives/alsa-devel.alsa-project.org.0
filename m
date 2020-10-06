Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3A128532F
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Oct 2020 22:36:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D927916D6;
	Tue,  6 Oct 2020 22:35:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D927916D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602016586;
	bh=CxlGuJtgwZDj6aScaFk/pY6ggvjWCQI3GmYPSd+uBos=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GkAxtwjbZbf1N+SwWZ7PFV8u8lJrNiXljdpD5wBOf/hdNF1z55v/oio6vX/MngeFf
	 YmQ8VdI7AKyxNz3D+Pag9z1ix0xIr6E7MdIjDpcrs2LYWIAaRlPesZfiWLlkTyH/ak
	 ys1kPsDQihtujDOmnlGYARLohVj2VSmkSwnUGYLU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3145DF8012B;
	Tue,  6 Oct 2020 22:34:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFFBFF8012A; Tue,  6 Oct 2020 22:34:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 163F3F80127
 for <alsa-devel@alsa-project.org>; Tue,  6 Oct 2020 22:34:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 163F3F80127
Received: by mail-ot1-f66.google.com with SMTP id d28so98260ote.1
 for <alsa-devel@alsa-project.org>; Tue, 06 Oct 2020 13:34:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9Bl8Ef7MsrCUl5Y6fQNE2hvCJzehQ4qg3g3ESvM80Lc=;
 b=qFrkooCl3WW+Naq6lb2xq0gJMA949qm+uezxUxXxfXIup7SsKlrBAuHqbyn67JQgRH
 fY/ZMKkGFmi9vmEJO/AjOQ9Wxulbad9JK1LggsiHCL08OZSeiq7eXvVPPxllVmP6+QXC
 10OXGWRvzYyC6oHnVz003hniyTFpbFmuZYytk6JqLkyh6VXCNm1obkFmDcSNdc6+olGf
 jF/vhVk4aXN15zNTlHTP+e8ojz2eDL2/hOMIhp10+2FOAMPlWFdcljWRLezTur2GCZHx
 TTRSvNw+DTLmCnigKZW1FOvCYnUgRH/uODKD+7udWOeHqhHEoTAGhHGQNLzwKgDRQX/R
 sxsw==
X-Gm-Message-State: AOAM532Ey1aZ+50MlqHyeBhA9DwBfAVCt1DTIn9seXYqGNSUT3Kb0ZwV
 NMtndRhGOCQ53dJ9avvnvg==
X-Google-Smtp-Source: ABdhPJysTVo6aPJYaCescnoWvcltcz2t7AvkaOwyZJCnYE7pLEiVUUXMPN/uFUEiRDTj2GvBxcP5TQ==
X-Received: by 2002:a9d:77d1:: with SMTP id w17mr3473086otl.27.1602016475621; 
 Tue, 06 Oct 2020 13:34:35 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v21sm1605218ots.29.2020.10.06.13.34.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 13:34:34 -0700 (PDT)
Received: (nullmailer pid 2790213 invoked by uid 1000);
 Tue, 06 Oct 2020 20:34:33 -0000
Date: Tue, 6 Oct 2020 15:34:33 -0500
From: Rob Herring <robh@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH v3 09/13] ASoC: dt-bindings: tegra: Add schema for audio
 graph card
Message-ID: <20201006203433.GA2786434@bogus>
References: <1601573587-15288-1-git-send-email-spujar@nvidia.com>
 <1601573587-15288-10-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1601573587-15288-10-git-send-email-spujar@nvidia.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 atalambedu@nvidia.com, swarren@nvidia.com, kuninori.morimoto.gx@renesas.com,
 lgirdwood@gmail.com, nicoleotsuka@gmail.com, linux-kernel@vger.kernel.org,
 nwartikar@nvidia.com, tiwai@suse.com, viswanathl@nvidia.com,
 sharadg@nvidia.com, devicetree@vger.kernel.org, broonie@kernel.org,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org, jonathanh@nvidia.com,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
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

On Thu, Oct 01, 2020 at 11:03:03PM +0530, Sameer Pujar wrote:
> Add YAML schema for Tegra audio graph sound card DT bindings. It uses the
> same DT bindings provided by generic audio graph driver. Along with this
> few standard clock DT bindings are added which are specifically required
> for Tegra audio.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  .../sound/nvidia,tegra-audio-graph-card.yaml       | 70 ++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml
> new file mode 100644
> index 0000000..b73fbe5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra-audio-graph-card.yaml
> @@ -0,0 +1,70 @@
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
> +  See{LINUX}/Documentation/devicetree/bindings/sound/audio-graph-card.txt
> +
> +maintainers:
> +  - Jon Hunter <jonathanh@nvidia.com>
> +  - Sameer Pujar <spujar@nvidia.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: nvidia,tegra210-audio-graph-card
> +      - const: nvidia,tegra186-audio-graph-card
> +
> +  clocks:
> +   minItems: 2
> +
> +  clock-names:
> +   minItems: 2
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
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +  - assigned-clocks
> +  - assigned-clock-parents

Where's the graph? You need to define the ports and reference the common 
schema.

> +
> +examples:
> +  - |
> +    #include<dt-bindings/clock/tegra210-car.h>
> +
> +    tegra_sound {
> +        compatible = "nvidia,tegra210-audio-graph-card";
> +        clocks = <&tegra_car TEGRA210_CLK_PLL_A>,
> +                 <&tegra_car TEGRA210_CLK_PLL_A_OUT0>;
> +        clock-names = "pll_a", "plla_out0";
> +        assigned-clocks = <&tegra_car TEGRA210_CLK_PLL_A>,
> +                          <&tegra_car TEGRA210_CLK_PLL_A_OUT0>,
> +                          <&tegra_car TEGRA210_CLK_EXTERN1>;
> +        assigned-clock-parents = <0>, <0>, <&tegra_car TEGRA210_CLK_PLL_A_OUT0>;
> +        assigned-clock-rates = <368640000>, <49152000>, <12288000>;
> +    };
> +
> +...
> -- 
> 2.7.4
> 
