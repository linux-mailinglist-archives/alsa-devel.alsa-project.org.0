Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2E4545547
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 22:04:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52E491EE6;
	Thu,  9 Jun 2022 22:03:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52E491EE6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654805068;
	bh=omCqmKBYKKmVs6TAU+LiZ3tp3LFpOsYTSOZ+VCJdL9M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pZU/bkn6HRdWLdF9gpjHEApviPexGlNDBINzxQpKb1RFdYWBg532uDXrz5+ksjKrZ
	 mbYOcfB2XX2z4JHiisBWw9IeGHCr6q+kzclsJ3GdedY7jfDuf6jKAczbrEPrHhRA05
	 armD6A1q8SRtSopuXCsoQfuF8mStwP/ulDaK6Z9U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C714CF80240;
	Thu,  9 Jun 2022 22:03:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4E5DF801F5; Thu,  9 Jun 2022 22:03:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D71D2F800C7
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 22:03:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D71D2F800C7
Received: by mail-io1-f54.google.com with SMTP id p69so4488696iod.0
 for <alsa-devel@alsa-project.org>; Thu, 09 Jun 2022 13:03:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=YIBDdnaZYLksYYYPf5RgtDeURkWNaVlTx9hps6JOyrA=;
 b=UOzp72S9tzj66DB51pgIfDhdzHzWDe8c7F//6s4JXoZzgg1eFfydXDc9qfiqRG9/j2
 r1IMKmB03y2yBWYHK7iF5B4ChCoBKy4Lp76i3zWYFERrs6/U66uH60h0r4o9UPsYjfd4
 CQPohqx6aX3TMIe/U793BHII8a8BYDq1G1LlshYo/LSlssd64uvIGfkLpvDFKUiKd+y6
 5SbD+sQrLHb2BDgB3gltT0gfUlFRm3z+MwsFVWhfN9teLwsF1RaG0SXdt3UCOMQ9LqiN
 D+vhJvsCeAweiSD4AnN5Bcpy0b8H8nZowvj0R8XiaXR7tKGwNbGBBkd5R0TuHehgzH6h
 UKsQ==
X-Gm-Message-State: AOAM530/yjI3Xz31+3ObxIW4s7UlOtTo836BfLc/U7GU23zPIZ4wzVCc
 jEvYqaAi0TjYQjoRky4C/A==
X-Google-Smtp-Source: ABdhPJy0vfyMpwM45x4ogND18CT2vn+ZjeUa7zjShMYEiRxo1t+KyCiUektlzUYCaCXcm2mJGqeGzA==
X-Received: by 2002:a05:6602:2a48:b0:669:3d64:c53b with SMTP id
 k8-20020a0566022a4800b006693d64c53bmr13824103iov.77.1654804997929; 
 Thu, 09 Jun 2022 13:03:17 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a6b6d12000000b0066938e02579sm7471108iod.38.2022.06.09.13.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 13:03:17 -0700 (PDT)
Received: (nullmailer pid 12357 invoked by uid 1000);
 Thu, 09 Jun 2022 20:03:16 -0000
Date: Thu, 9 Jun 2022 14:03:16 -0600
From: Rob Herring <robh@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: Re: [RFC PATCH v2 2/5] dt-bindings: sound: Add Apple Macs sound
 peripherals
Message-ID: <20220609200316.GA4097800-robh@kernel.org>
References: <20220606191910.16580-1-povik+lin@cutebit.org>
 <20220606191910.16580-3-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220606191910.16580-3-povik+lin@cutebit.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sven Peter <sven@svenpeter.dev>, linux-kernel@vger.kernel.org,
 Hector Martin <marcan@marcan.st>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 asahi@lists.linux.dev, Mark Kettenis <kettenis@openbsd.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
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

On Mon, Jun 06, 2022 at 09:19:07PM +0200, Martin Povišer wrote:
> Add binding for Apple Silicon Macs' machine-level integration of sound
> peripherals.
> 
> Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
> ---
>  .../bindings/sound/apple,macaudio.yaml        | 157 ++++++++++++++++++
>  1 file changed, 157 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/apple,macaudio.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/apple,macaudio.yaml b/Documentation/devicetree/bindings/sound/apple,macaudio.yaml
> new file mode 100644
> index 000000000000..f7c12697beab
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/apple,macaudio.yaml
> @@ -0,0 +1,157 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/apple,macaudio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple Silicon Macs integrated sound peripherals
> +
> +description: |
> +  This binding represents the overall machine-level integration of sound
> +  peripherals on 'Apple Silicon' machines by Apple.
> +
> +maintainers:
> +  - Martin Povišer <povik+lin@cutebit.org>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - apple,j274-macaudio
> +          - apple,j293-macaudio
> +          - apple,j314-macaudio
> +      - const: apple,macaudio
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  model:
> +    description: |

Don't need '|' if there's no formatting to preserve.

> +      Model name for presentation to users
> +    $ref: /schemas/types.yaml#/definitions/string
> +
> +patternProperties:
> +  "^dai-link(@[0-9a-f]+)?$":
> +    description: |
> +      Node for each sound peripheral such as the speaker array, headphones jack,
> +      or microphone.
> +    type: object

blank line

> +    properties:
> +      reg:
> +        maxItems: 1
> +
> +      link-name:
> +        description: |
> +          Name for the peripheral, expecting 'Speaker' or 'Speakers' if this is
> +          the speaker array.
> +        $ref: /schemas/types.yaml#/definitions/string
> +
> +      cpu:
> +        type: object

           additionalProperties: false

blank line before properties.

> +        properties:
> +          sound-dai:
> +            description: |
> +              DAI list with CPU-side I2S ports involved in this peripheral.
> +            minItems: 1
> +            maxItems: 2

blank line

> +        required:
> +          - sound-dai
> +
> +      codec:
> +        type: object

blank line

> +        properties:
> +          sound-dai:
> +            description: |
> +              DAI list with the CODEC-side DAIs connected to the above CPU-side
> +              DAIs and involved in this sound peripheral.
> +
> +              The list is in left/right order if applicable. If there are more
> +              than one CPU-side DAIs (there can be two), the CODECs must be
> +              listed first those connected to the first CPU, then those
> +              connected to the second.
> +
> +              In addition, on some machines with many speaker codecs, the CODECs
> +              are listed in this fixed order:
> +
> +              J293: Left Front, Left Rear, Right Front, Right Rear
> +              J314: Left Woofer 1, Left Tweeter, Left Woofer 2,
> +                    Right Woofer 1, Right Tweeter, Right Woofer 2
> +            minItems: 1
> +            maxItems: 8

blank line

> +        required:
> +          - sound-dai
> +
> +    required:
> +      - reg
> +      - cpu
> +      - codec
> +
> +    additionalProperties: false

I prefer this to be above 'properties' in the indented cases. 

> +
> +required:
> +  - compatible
> +  - model
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    mca: mca@9b600000 {
> +      compatible = "apple,t6000-mca", "apple,mca";
> +      reg = <0x9b600000 0x10000>,
> +            <0x9b500000 0x20000>;
> +
> +      clocks = <&nco 0>, <&nco 1>, <&nco 2>, <&nco 3>;
> +      power-domains = <&ps_audio_p>, <&ps_mca0>, <&ps_mca1>,
> +                      <&ps_mca2>, <&ps_mca3>;
> +      dmas = <&admac 0>, <&admac 1>, <&admac 2>, <&admac 3>,
> +             <&admac 4>, <&admac 5>, <&admac 6>, <&admac 7>,
> +             <&admac 8>, <&admac 9>, <&admac 10>, <&admac 11>,
> +             <&admac 12>, <&admac 13>, <&admac 14>, <&admac 15>;
> +      dma-names = "tx0a", "rx0a", "tx0b", "rx0b",
> +                  "tx1a", "rx1a", "tx1b", "rx1b",
> +                  "tx2a", "rx2a", "tx2b", "rx2b",
> +                  "tx3a", "rx3a", "tx3b", "rx3b";
> +
> +      #sound-dai-cells = <1>;
> +    };
> +
> +    sound {
> +      compatible = "apple,j314-macaudio", "apple,macaudio";
> +      model = "MacBook Pro J314 integrated audio";
> +
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      dai-link@0 {
> +        reg = <0>;
> +        link-name = "Speakers";
> +
> +        cpu {
> +          sound-dai = <&mca 0>, <&mca 1>;
> +        };
> +        codec {
> +          sound-dai = <&speaker_left_woof1>,
> +                      <&speaker_left_tweet>,
> +                      <&speaker_left_woof2>,
> +                      <&speaker_right_woof1>,
> +                      <&speaker_right_tweet>,
> +                      <&speaker_right_woof2>;
> +        };
> +      };
> +
> +      dai-link@1 {
> +        reg = <1>;
> +        link-name = "Headphones Jack";
> +
> +        cpu {
> +          sound-dai = <&mca 2>;
> +        };
> +        codec {
> +          sound-dai = <&jack_codec>;
> +        };
> +      };
> +    };
> -- 
> 2.33.0
> 
> 
