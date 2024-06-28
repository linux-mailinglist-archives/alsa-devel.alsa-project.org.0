Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C12291C83B
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jun 2024 23:39:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45E60233B;
	Fri, 28 Jun 2024 23:39:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45E60233B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719610784;
	bh=TQSYZSsDtzsMcr8D2e2z9zHsl5dNXJP4IAvQWDj6Sgw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g0dasNYVXfK53luTWTyWd4WWxMDAn3gjO+M4IMPsrMJz0OFVu6rAkQtQeUez9YJaN
	 7xqXkP0Pi62MjpduPO4rJy3FNcOOE3H2vqQ0a/+xuaW0gbKCJlxEXUbKZGje5mVzmw
	 STxJYku4W4VSoMrFOb2eQpvz7TxO0Pm8apQ8soOY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 643FEF805B0; Fri, 28 Jun 2024 23:39:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ACF3EF805B0;
	Fri, 28 Jun 2024 23:39:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2085AF80423; Fri, 28 Jun 2024 23:35:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0F5E3F8013D
	for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2024 23:35:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F5E3F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Q+Ixt1Tr
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C0410CE3C5A;
	Fri, 28 Jun 2024 21:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5CFDC116B1;
	Fri, 28 Jun 2024 21:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719610520;
	bh=TQSYZSsDtzsMcr8D2e2z9zHsl5dNXJP4IAvQWDj6Sgw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q+Ixt1TryhrnJ6NBZK+ofuKGvY4vXaT8TcLw6X4GD9WWrdch5TtpcAqDhExQ6FPCi
	 LFyBnOxvYZfsEnh3k87aspOCmC5/xr+Osj3E8QfqqVx294jt1/A5T47WaVI/bvX2+G
	 hUWfMxlCKxeODdivD1rvWGCCZW4/yEJ2KlxhKsDnU9hkhSdRE5uKBLdptl4o72PxFe
	 QZkv7xqa8Ty+y87+5OYOkTs3P70xwEaO+kZJbK55SQpzWJf5VANqpkrzVKah6WsYWd
	 fKh4uoGtaYaMJ6n14xsyR9yNOuX+70SVuaB23qng+cZ/xMiANl4Bcd/IK4JPZ87mhL
	 SXMTdxQMDibZw==
Date: Fri, 28 Jun 2024 15:35:17 -0600
From: Rob Herring <robh@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Cc: fabrice.gasnier@foss.st.com,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	alsa-devel@alsa-project.org, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/8] dt-bindings: iio: dfsdm: move to backend framework
Message-ID: <20240628213517.GA225013-robh@kernel.org>
References: <20240625150717.1038212-1-olivier.moysan@foss.st.com>
 <20240625150717.1038212-5-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625150717.1038212-5-olivier.moysan@foss.st.com>
Message-ID-Hash: HPQ6KI5YVWH3V52PK5LDBGFIF5ZGMVBB
X-Message-ID-Hash: HPQ6KI5YVWH3V52PK5LDBGFIF5ZGMVBB
X-MailFrom: robh@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HPQ6KI5YVWH3V52PK5LDBGFIF5ZGMVBB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jun 25, 2024 at 05:07:12PM +0200, Olivier Moysan wrote:
> Change the DFSDM binding to use the new IIO backend framework,
> along with the adoption of IIO generic channels.
> This binding change allows to add scaling support to the DFSDM.
> 
> Keep the legacy binding as deprecated for backward compatibility.
> 
> The io-backends property is supported only in generic IIO channel
> binding.
> 
> - Channel description with the generic binding (Audio and Analog):
> 
>   Properties superseded by generic properties:
>     st,adc-channels: becomes "reg" property in channel node
>     st,adc-channel-names: becomes "label" property in channel node
>   Properties moved to channel child node:
>     st,adc-channel-types: becomes st,adc-channel-type
>     st,adc-channel-clk-src, st,adc-alt-channel
> 
> - Analog binding:
> 
>   DFSDM filter channel is configured as an IIO backend consumer.
>   Add io-backends property in channel child nodes.
> 
>   DFSDM is no more configured as a channel consumer from SD modulator.
>   Use of io-channels in DFSDM node is deprecated.
> 
> - Audio binding:
> 
>   DFSDM audio DAI is configured as a channel consumer from DFSDM filter.
>   No change compare to legacy.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---
>  .../bindings/iio/adc/st,stm32-dfsdm-adc.yaml  | 157 +++++++++++++++++-
>  1 file changed, 151 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
> index c1b1324fa132..1802120b16b0 100644
> --- a/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml
> @@ -102,9 +102,11 @@ patternProperties:
>          items:
>            minimum: 0
>            maximum: 7
> +        deprecated: true
>  
>        st,adc-channel-names:
>          description: List of single-ended channel names.
> +        deprecated: true
>  
>        st,filter-order:
>          description: |
> @@ -118,6 +120,12 @@ patternProperties:
>        "#io-channel-cells":
>          const: 1
>  
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
>        st,adc-channel-types:
>          description: |
>            Single-ended channel input type.
> @@ -128,6 +136,7 @@ patternProperties:
>          items:
>            enum: [ SPI_R, SPI_F, MANCH_R, MANCH_F ]
>          $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +        deprecated: true
>  
>        st,adc-channel-clk-src:
>          description: |
> @@ -139,6 +148,7 @@ patternProperties:
>          items:
>            enum: [ CLKIN, CLKOUT, CLKOUT_F, CLKOUT_R ]
>          $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +        deprecated: true
>  
>        st,adc-alt-channel:
>          description:
> @@ -147,6 +157,7 @@ patternProperties:
>            If not set, channel n is connected to SPI input n.
>            If set, channel n is connected to SPI input n + 1.
>          type: boolean
> +        deprecated: true
>  
>        st,filter0-sync:
>          description:
> @@ -165,11 +176,64 @@ patternProperties:
>        - compatible
>        - reg
>        - interrupts
> -      - st,adc-channels
> -      - st,adc-channel-names
>        - st,filter-order
>        - "#io-channel-cells"
>  
> +    patternProperties:
> +      "^channel@([0-9]|1[0-9])$":

Unit-addresses are normally hex. And according to reg below, the max 
value is 8.

> +        type: object
> +        $ref: adc.yaml
> +        description: Represents the external channels which are connected to the DFSDM.
> +
> +        properties:
> +          reg:
> +            items:
> +              minimum: 0
> +              maximum: 8

More than 1 reg entry valid? Either way, you need maxItems. Or you can 
just drop 'items'

> +
> +          label:
> +            description:
> +              Unique name to identify which channel this is.
> +
> +          st,adc-channel-type:
> +            description: |
> +              Single-ended channel input type.
> +              - "SPI_R": SPI with data on rising edge (default)
> +              - "SPI_F": SPI with data on falling edge
> +              - "MANCH_R": manchester codec, rising edge = logic 0, falling edge = logic 1
> +              - "MANCH_F": manchester codec, rising edge = logic 1, falling edge = logic 0
> +            items:

'items' is for arrays, but...

> +              enum: [ SPI_R, SPI_F, MANCH_R, MANCH_F ]
> +            $ref: /schemas/types.yaml#/definitions/string

not an array.

> +
> +          st,adc-channel-clk-src:
> +            description: |
> +              Conversion clock source.
> +              - "CLKIN": external SPI clock (CLKIN x)
> +              - "CLKOUT": internal SPI clock (CLKOUT) (default)
> +              - "CLKOUT_F": internal SPI clock divided by 2 (falling edge).
> +              - "CLKOUT_R": internal SPI clock divided by 2 (rising edge).
> +            items:

ditto

> +              enum: [ CLKIN, CLKOUT, CLKOUT_F, CLKOUT_R ]
> +            $ref: /schemas/types.yaml#/definitions/string
> +
> +          st,adc-alt-channel:
> +            description:
> +              Must be defined if two sigma delta modulators are
> +              connected on same SPI input.
> +              If not set, channel n is connected to SPI input n.
> +              If set, channel n is connected to SPI input n + 1.
> +            type: boolean
> +
> +          io-backends:
> +            description:
> +              Used to pipe external sigma delta modulator or internal ADC backend to DFSDM channel.

How many entries (maxItems)?

> +
> +        required:
> +          - reg
> +
> +        additionalProperties: false

Put this next to the $ref for the node. And switch to 
unevaluatedProperties and drop 'label' from here.

> +
>      allOf:
>        - if:
>            properties:
> @@ -199,9 +263,19 @@ patternProperties:
>                description:
>                  From common IIO binding. Used to pipe external sigma delta
>                  modulator or internal ADC output to DFSDM channel.
> +              deprecated: true
>  
> -          required:
> -            - io-channels
> +          if:
> +            required:
> +              - st,adc-channels
> +          then:
> +            required:
> +              - io-channels
> +
> +          patternProperties:
> +            "^channel@([0-9]|1[0-9])$":
> +              required:
> +                - io-backends

Don't think this is needed here. If channel node is present, the 
io-backends should always be required, right? Then this can go under the 
node schema.

Rob

