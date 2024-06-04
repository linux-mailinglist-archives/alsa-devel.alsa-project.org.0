Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8F28FB65C
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2024 16:58:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 151B074C;
	Tue,  4 Jun 2024 16:58:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 151B074C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717513093;
	bh=Lj9qAnLR2AFw/O7NEn03XeJc7aJX3ehILngKK6g72J0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Bna+WOr1cP9SA9e6D5YDGQnhgGLTmi6C5+hSUXuKPo5Kts0drDuOYimOTfinCDrD1
	 EtVXJrAtacnpKMi0XEj5YuabARdl4RCZCq7OWoG05oYuSSonczIJt5Pkv5S7qACKr1
	 W/qf4ivjHMJ86jtviuRAtYoJnJypHcgBO9ekl5zo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C51DCF805AE; Tue,  4 Jun 2024 16:57:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F63EF8055C;
	Tue,  4 Jun 2024 16:57:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C48A2F802DB; Tue,  4 Jun 2024 16:57:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0E4D5F8003A
	for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2024 16:57:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E4D5F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Q2vRQEO4
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E62B26131B;
	Tue,  4 Jun 2024 14:57:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45940C2BBFC;
	Tue,  4 Jun 2024 14:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717513047;
	bh=Lj9qAnLR2AFw/O7NEn03XeJc7aJX3ehILngKK6g72J0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q2vRQEO4ig5t1bFS3ootCTEDZZPubmDesUBXfVVXUPvxM8HpZ18tqF8jkX5kXMD7j
	 RhmLHYH2WscWY7s7/ud0dNDx0Frwvk5UG9YpAkgNivn3hI/iS64aZG6EZHVKehVb3+
	 lCTJu34AIhDOEsB6/gpT7WNJ1bHwOo30NM45/Rw62G/C0ecr+mc1es6JhJeIJM2O91
	 +HQncN2B5y3U2ytz0GxWcidFEkUb3Hhc3i+znzLDN1AP4xU0M5C5nskntoK8nIS477
	 Aa9THm8riSYSCbdCMMHfz9BxtAnWUdkH23X/G5TFIgtE63x9gBG5uHMCFejJGNZIFY
	 uxEDklcSNX9ow==
Date: Tue, 4 Jun 2024 09:57:25 -0500
From: Rob Herring <robh@kernel.org>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ricard Wanderlof <ricardw@axis.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@axis.com
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: tlv320adc3xxx: Add MICBIAS-as-GPO
 properties
Message-ID: <20240604145725.GA588460-robh@kernel.org>
References: <20240529-tlv320adc3xxx-micbias-gpo-v1-0-300d39cecc55@axis.com>
 <20240529-tlv320adc3xxx-micbias-gpo-v1-1-300d39cecc55@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529-tlv320adc3xxx-micbias-gpo-v1-1-300d39cecc55@axis.com>
Message-ID-Hash: DD7Y44ZB3AE3HCEHSKDOYYFTDGXYWQV6
X-Message-ID-Hash: DD7Y44ZB3AE3HCEHSKDOYYFTDGXYWQV6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DD7Y44ZB3AE3HCEHSKDOYYFTDGXYWQV6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

yOn Wed, May 29, 2024 at 06:33:44PM +0200, Ricard Wanderlof wrote:
> Add properties for configuring the MICBIAS pins as general purpose
> outputs, with some limitations: The voltage on the pin when activated
> may be set using another property to 2.0 V, 2.5 V or AVDD.
> When deactivated the pin will float.
> 
> Signed-off-by: Ricard Wanderlof <ricard.wanderlof@axis.com>
> ---
>  .../devicetree/bindings/sound/ti,tlv320adc3xxx.yaml  | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/ti,tlv320adc3xxx.yaml b/Documentation/devicetree/bindings/sound/ti,tlv320adc3xxx.yaml
> index ede14ca2c07a..4172aced1386 100644
> --- a/Documentation/devicetree/bindings/sound/ti,tlv320adc3xxx.yaml
> +++ b/Documentation/devicetree/bindings/sound/ti,tlv320adc3xxx.yaml
> @@ -82,6 +82,26 @@ properties:
>        Note that there is currently no support for reading the GPIO pins as
>        inputs.
>  
> +  ti,micbias1-gpo:
> +    type: boolean
> +    description: |
> +      When set, the MICBIAS1 pin may be controlled via the GPIO framework,
> +      as pin number 3 on the device.
> +
> +      In this mode, when the pin is activated, it will be set to the voltage
> +      specified by the ti,micbias1-vg property. When deactivated, the pin will
> +      float.
> +
> +  ti,micbias2-gpo:
> +    type: boolean
> +    description: |
> +      When set, the MICBIAS2 pin may be controlled via the GPIO framework,
> +      as pin number 4 on the device.
> +
> +      In this mode, when the pin is activated, it will be set to the voltage
> +      specified by the ti,micbias1-vg property. When deactivated, the pin will
> +      float.

Typo and sounds like a dependency between properties:

dependencies:
  ti,micbias2-gpio: [ti,micbias2-vg]

> +
>    ti,micbias1-vg:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      enum:
> 
> -- 
> 2.30.2
> 
