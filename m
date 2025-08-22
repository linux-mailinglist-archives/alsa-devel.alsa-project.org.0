Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 263A1B32387
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Aug 2025 22:21:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BC5A6024E;
	Fri, 22 Aug 2025 22:20:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BC5A6024E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1755894062;
	bh=tdtNSs8Kpu/sExAf4TXBpIT5C7B1P4VkLkgrDCZvGXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eAjTXOpdAjh3s8dipB5uIw/7kD0c4osbgeNbvsdNrbZOLqk6tB+JIQ17zRMhKfPpr
	 YShNl3izkEqRrEuHlrp8xDiasFLTirfDSKN7Xl+rSc+QYgjH7hpSvcOEXiyovOKmrF
	 FsTQ1NYe71iJIU0vXyYYUVXYBIEU2Jfn7zsqEnig=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4213F805CA; Fri, 22 Aug 2025 22:20:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 756B9F805C4;
	Fri, 22 Aug 2025 22:20:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A54AF8042F; Fri, 22 Aug 2025 22:20:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EF00CF80254
	for <alsa-devel@alsa-project.org>; Fri, 22 Aug 2025 22:20:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF00CF80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lzO9EgdR
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A7459431FF;
	Fri, 22 Aug 2025 20:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 465F5C4CEED;
	Fri, 22 Aug 2025 20:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755894017;
	bh=tdtNSs8Kpu/sExAf4TXBpIT5C7B1P4VkLkgrDCZvGXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lzO9EgdR7yAAuw4MAy6NAMcNJzNOxchSLb3UDks+Vx5t7khko1bBwoZ/Hmcha3ssz
	 k79MgQNMwMESniJJjNMVsXab1fagt/Zhnujwgfprcjsbz9vFPTX5GQRCKq2IpNRXap
	 qw5mPkeerbyapNE6B1EGb+o/IOJQJYILe4/RYgB15qVc9u72TV/X5C4xf6dZ1b6ZL3
	 3it0/Qlz2keHGvwb8gfbXrsHyuAkZViFeamL0PN9tAZqAqk9C383YnnfwhfeI992KG
	 sBg8dhwAUePwlIhTc1eid85HyubEsiiz7yNyDZKt6Ur/KW5Fayyr7DcaP8NluVVLld
	 tNg2tK94rkk5g==
Date: Fri, 22 Aug 2025 15:20:16 -0500
From: Rob Herring <robh@kernel.org>
To: Baojun Xu <baojun.xu@ti.com>
Cc: broonie@kernel.org, tiwai@suse.de, andriy.shevchenko@linux.intel.com,
	13916275206@139.com, alsa-devel@alsa-project.org,
	shenghao-ding@ti.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	k-yi@ti.com, henry.lo@ti.com, robinchen@ti.com, jesse-ji@ti.com,
	will-wang@ti.com
Subject: Re: [PATCH v2 2/2] ASoC: tas2781: Add tas2118, tas2x20, tas5825
 support
Message-ID: <20250822202016.GA297320-robh@kernel.org>
References: <20250822051410.1732-1-baojun.xu@ti.com>
 <20250822051410.1732-2-baojun.xu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822051410.1732-2-baojun.xu@ti.com>
Message-ID-Hash: 37DOOJSIIMTYXQUJJUJS7ATJOJFQ3IVA
X-Message-ID-Hash: 37DOOJSIIMTYXQUJJUJS7ATJOJFQ3IVA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/37DOOJSIIMTYXQUJJUJS7ATJOJFQ3IVA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Aug 22, 2025 at 01:14:09PM +0800, Baojun Xu wrote:
> Update ti,tas2781.yaml for added tas2118, tas2x20, tas5825.
> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>
> 
> ---
> v2:
>  - Update the mail list for maintainers of yaml file
> ---
>  .../devicetree/bindings/sound/ti,tas2781.yaml | 73 ++++++++++++++++++-
>  1 file changed, 72 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/ti,tas2781.yaml b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
> index 5ea1cdc593b5..fb57b63a00a2 100644
> --- a/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
> +++ b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> -# Copyright (C) 2022 - 2023 Texas Instruments Incorporated
> +# Copyright (C) 2022 - 2025 Texas Instruments Incorporated
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/sound/ti,tas2781.yaml#
> @@ -11,30 +11,62 @@ maintainers:
>    - Shenghao Ding <shenghao-ding@ti.com>
>  
>  description: |
> +  The TAS2118/TAS2X20 is mono, digital input Class-D audio amplifier
> +  optimized for efficiently driving high peak power into small loudspeakers.
> +  Integrated speaker voltage and current sense provides for
> +  real time monitoring of loudspeaker behavior.
>    The TAS2563/TAS2781 is a mono, digital input Class-D audio
>    amplifier optimized for efficiently driving high peak power into
>    small loudspeakers. An integrated on-chip DSP supports Texas
>    Instruments Smart Amp speaker protection algorithm. The
>    integrated speaker voltage and current sense provides for real time
>    monitoring of loudspeaker behavior.
> +  The TAS5825 is a stereo, digital input Class-D audio
> +  amplifier optimized for efficiently driving high peak power into
> +  small loudspeakers. An integrated on-chip DSP supports Texas
> +  Instruments Smart Amp speaker protection algorithm. The
> +  integrated speaker voltage and current sense provides for real time
> +  monitoring of loudspeaker behavior.
>  
>    Specifications about the audio amplifier can be found at:
> +    https://www.ti.com/lit/gpn/tas2120
> +    https://www.ti.com/lit/gpn/tas2320
>      https://www.ti.com/lit/gpn/tas2563
>      https://www.ti.com/lit/gpn/tas2781
> +    https://www.ti.com/lit/gpn/tas5825m
>  
>  properties:
>    compatible:
>      description: |
> +      ti,tas2020: 3.2-W Mono Digital Input Class-D Speaker Amp with 5.5V PVDD
> +      Support.
> +
> +      ti,tas2118: 5-W Mono Digital Input Class-D Speaker Amp with Integrated
> +      8.4-V Class-H Boost.
> +
> +      ti,tas2120: 8.2-W Mono Digital Input Class-D Speaker Amp with
> +      Integrated 14.75V Class-H Boost.
> +
> +      ti,tas2320: 15-W Mono Digital Input Class-D Speaker Amp with 15V Support.
> +
>        ti,tas2563: 6.1-W Boosted Class-D Audio Amplifier With Integrated
>        DSP and IV Sense, 16/20/24/32bit stereo I2S or multichannel TDM.
>  
>        ti,tas2781: 24-V Class-D Amplifier with Real Time Integrated Speaker
>        Protection and Audio Processing, 16/20/24/32bit stereo I2S or
>        multichannel TDM.
> +
> +      ti,tas5825: 38-W Stereo, Inductor-Less, Digital Input, Closed-Loop 4.5V
> +      to 26.4V Class-D Audio Amplifier with 192-kHz Extended Audio Processing.
>      oneOf:
>        - items:
>            - enum:
> +              - ti,tas2020
> +              - ti,tas2118
> +              - ti,tas2120
> +              - ti,tas2320
>                - ti,tas2563
> +              - ti,tas5825
>            - const: ti,tas2781
>        - enum:
>            - ti,tas2781
> @@ -61,6 +93,27 @@ required:
>  
>  allOf:
>    - $ref: dai-common.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - ti,tas2020
> +              - ti,tas2118
> +              - ti,tas2120
> +              - ti,tas2320
> +    then:
> +      properties:
> +        reg:
> +          description:
> +            I2C address, in multiple-AMP case, all the i2c address
> +            aggregate as one Audio Device to support multiple audio slots.
> +          maxItems: 4
> +          minItems: 1

1 is already the min items, so drop.

> +          items:
> +            minimum: 0x48
> +            maximum: 0x4b
> +
>    - if:
>        properties:
>          compatible:
> @@ -97,6 +150,24 @@ allOf:
>              minimum: 0x38
>              maximum: 0x3f
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - ti,tas5825
> +    then:
> +      properties:
> +        reg:
> +          description:
> +            I2C address, in multiple-AMP case, all the i2c address
> +            aggregate as one Audio Device to support multiple audio slots.

You've duplicated this. Does it belong at the top level 'reg'?

> +          maxItems: 4
> +          minItems: 1

Same here.

> +          items:
> +            minimum: 0x4c
> +            maximum: 0x4f
> +
>  additionalProperties: false
>  
>  examples:
> -- 
> 2.43.0
> 
