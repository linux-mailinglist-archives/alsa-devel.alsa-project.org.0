Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB6E3B9726
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jul 2021 22:20:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4973F1670;
	Thu,  1 Jul 2021 22:19:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4973F1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625170831;
	bh=QO/bsSnyl/y4Um65lA6wPo621NyCX90OA6KZ7FFpqxQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j+xS45ask8NLo42ZJ2feVMP4V8y+S2A2L5eZfV6Zi09xfAKBBaAzL/+4Y03V9+Mft
	 Gsw+PECAQddI9/c6/0XVKs91mqSqk595qwZBG2NGg9ytSLIcA/3kTtl709jtp3ZjCo
	 WWS2DCQNVxKrq6cmv/voVnTCjJFbZoW/6ET9vjmo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5F20F804AE;
	Thu,  1 Jul 2021 22:19:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E6CFF802D2; Thu,  1 Jul 2021 22:19:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 655A3F800E3
 for <alsa-devel@alsa-project.org>; Thu,  1 Jul 2021 22:18:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 655A3F800E3
Received: by mail-il1-f181.google.com with SMTP id v5so7652226ilo.5
 for <alsa-devel@alsa-project.org>; Thu, 01 Jul 2021 13:18:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jkKNz83v8bTKAmVdHO7nGUak++aeSsOWlXuVgcISOl0=;
 b=dUJj0Xh45tc6SnCG+hXl7xdv3ThBbv5MMRn91+nSD2cZ81Wu2KhV+BsIWNdbU5aHGT
 YGaOhTjQKx6IJ8N0XQhUrL2oZ163wuVGP3Qgl7voEcCYb0Feo9U9EC6ASBZH4qKxR7C7
 ht+BNP0Flx2yaLUfQElVe47suQM4gmJpWwCMnrWhoImx6LMBubBmuJ4wfyFjEYP6YVbN
 IGkLzIbpWnqKR2WaHmp9GTDVIb16qLaIdyqMz0IzVT6vtXSUtJ3BrvaQO/jWTc6yk1Cc
 chyWxgC85kqQoAVzBj3mw4gmHIyUiIXoE2wusJmjB4S8ujWhKTHKGxG+cROwOsL/LEtV
 W08w==
X-Gm-Message-State: AOAM53339uixjJM4QX5kzOulO0zuwzh0WzZpO41gKRJmTqbtuQZz1u1f
 AygTG3rhr3x6cZujNz0iVw==
X-Google-Smtp-Source: ABdhPJxtxgEA4kNkOytbyFpCO9NEcYOLLKLdFA7tA79AD7cIrlqW3i8z2e3RRRGjRSL7hT+sxY+b4g==
X-Received: by 2002:a05:6e02:1292:: with SMTP id
 y18mr896855ilq.30.1625170732037; 
 Thu, 01 Jul 2021 13:18:52 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id u16sm419388iob.41.2021.07.01.13.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 13:18:51 -0700 (PDT)
Received: (nullmailer pid 2858275 invoked by uid 1000);
 Thu, 01 Jul 2021 20:18:46 -0000
Date: Thu, 1 Jul 2021 14:18:46 -0600
From: Rob Herring <robh@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Subject: Re: [PATCH v2 6/8] dt-bindings: mediatek: mt8195: add audio afe
 document
Message-ID: <20210701201846.GA2783836@robh.at.kernel.org>
References: <20210629014736.31153-1-trevor.wu@mediatek.com>
 <20210629014736.31153-7-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210629014736.31153-7-trevor.wu@mediatek.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, bicycle.tsai@mediatek.com, tiwai@suse.com,
 jiaxin.yu@mediatek.com, linux-kernel@vger.kernel.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, aaronyu@google.com,
 linux-arm-kernel@lists.infradead.org
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

On Tue, Jun 29, 2021 at 09:47:34AM +0800, Trevor Wu wrote:
> This patch adds mt8195 audio afe document.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
> This patch depends on the following series that have not been accepted.
> 
> [1] Mediatek MT8195 clock support
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=501923
> (dt-bindings/clock/mt8195-clk.h is included)
> 
> [2] Mediatek MT8195 power domain support
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=500709
> (dt-bindings/power/mt8195-power.h is included)
> ---
>  .../bindings/sound/mt8195-afe-pcm.yaml        | 136 ++++++++++++++++++
>  1 file changed, 136 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml
> new file mode 100644
> index 000000000000..a4fb5c7dd022
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mt8195-afe-pcm.yaml
> @@ -0,0 +1,136 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mt8195-afe-pcm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek AFE PCM controller for mt8195
> +
> +maintainers:
> +  - Trevor Wu <trevor.wu@mediatek.com>
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8195-audio
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  mediatek,topckgen:
> +    $ref: "/schemas/types.yaml#/definitions/phandle"
> +    description: The phandle of the mediatek topckgen controller
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: audio 26M clock
> +      - description: AFE clock
> +      - description: audio infra sys clock
> +      - description: audio infra 26M clock
> +
> +  clock-names:
> +    items:
> +      - const: clk26m
> +      - const: aud_afe
> +      - const: infra_ao_audio
> +      - const: infra_ao_audio_26m_b
> +
> +  etdm-in1-chn-disabled:

Needs a vendor prefix.

> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    maxItems: 24
> +    description: Specify which input channel should be disabled.
> +
> +  etdm-in2-chn-disabled:

Needs a vendor prefix.

> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    maxItems: 16
> +    description: Specify which input channel should be disabled.
> +
> +patternProperties:
> +  "^etdm-in[1-2]-mclk-source$":

And all these need a vendor prefix.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Specify etdm in mclk source clock.
> +    enum:
> +      - 0 # xtal_26m_ck
> +      - 1 # apll1_ck
> +      - 2 # apll2_ck
> +      - 3 # apll3_ck
> +      - 4 # apll4_ck
> +      - 5 # apll5_ck
> +      - 6 # hdmirx_apll_ck
> +
> +  "^etdm-out[1-3]-mclk-source$":
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Specify etdm out mclk source clock.
> +
> +  "^etdm-in[1-2]-mclk-alwasys-on-rate$":
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Specify etdm in mclk output rate for always on case.

Hz? If so, '-hz' unit suffix and drop the type ref.

> +
> +  "^etdm-out[1-3]-mclk-alwasys-on-rate$":

typo: alwasys

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Specify etdm out mclk output rate for always on case.

Hz?

> +
> +  "^etdm-in[1-2]-data-mode$":
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Specify etdm in data mode.
> +    enum:
> +      - 0 # one pin (TDM)
> +      - 1 # multi pin (I2S)

Can be boolean?

> +
> +  "^etdm-out[1-3]-data-mode$":
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Specify etdm out data mode.

Constraints on values?

> +
> +  "^etdm-in[1-2]-cowork-source$":
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      etdm modules can share the same external clock pin. Specify
> +      which etdm clock source is required by this etdm in moudule.
> +    enum:
> +      - 0 # etdm1_in
> +      - 1 # etdm2_in
> +      - 2 # etdm1_out
> +      - 3 # etdm2_out
> +      - 4 # etdm3_out
> +
> +  "^etdm-out[1-3]-cowork-source$":
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      etdm modules can share the same external clock pin. Specify
> +      which etdm clock source is required by this etdm out moudule.

Constraints?

> +
> +required:
> +  - compatible
> +  - interrupts
> +  - mediatek,topckgen
> +  - power-domains
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8195-clk.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/power/mt8195-power.h>
> +
> +    afe: mt8195-afe-pcm {
> +        compatible = "mediatek,mt8195-audio";
> +        interrupts = <GIC_SPI 822 IRQ_TYPE_LEVEL_HIGH 0>;
> +        mediatek,topckgen = <&topckgen>;
> +        power-domains = <&spm MT8195_POWER_DOMAIN_AUDIO>;
> +        clocks = <&clk26m>,
> +                 <&audsys CLK_AUD_AFE>,
> +                 <&infracfg_ao CLK_INFRA_AO_AUDIO>,
> +                 <&infracfg_ao CLK_INFRA_AO_AUDIO_26M_B>;
> +        clock-names = "clk26m",
> +                      "aud_afe",
> +                      "infra_ao_audio",
> +                      "infra_ao_audio_26m_b";
> +    };
> +
> +...
> -- 
> 2.18.0
> 
> 
