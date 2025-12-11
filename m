Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AC8CB65BF
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Dec 2025 16:39:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 328C160218;
	Thu, 11 Dec 2025 16:39:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 328C160218
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765467562;
	bh=MJ1gyPr6loaROZIhwYVOWWE3NQ2VnakiFje9rVBA03A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q4kEmI168ZxOBJ0XiTkHVuT2LQetVSetfVhRBOYcDVedvyK26p9rwz6SlPYq0Kvfp
	 8k7ZY3P/6fnziftgnOpxZ+fli7I54oKEXtqS4eOqec2phNT56lodh5W/B49rA7+gGL
	 ZQyeVPO4O3gCul3jHlN1nMjUqVwayKqiCstNmJbo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40553F80095; Thu, 11 Dec 2025 16:38:48 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 18BF1F805D3;
	Thu, 11 Dec 2025 16:38:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5AB9F804CC; Thu, 11 Dec 2025 16:38:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2C226F80095
	for <alsa-devel@alsa-project.org>; Thu, 11 Dec 2025 16:38:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C226F80095
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iYmsbdks
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EA3F46013A;
	Thu, 11 Dec 2025 15:38:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7135FC4CEF7;
	Thu, 11 Dec 2025 15:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765467517;
	bh=MJ1gyPr6loaROZIhwYVOWWE3NQ2VnakiFje9rVBA03A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iYmsbdksd51pbb6IQ5HDxAIc00S35FJfwV8+PYbKjb3iBFHNPjIYoDxgNeeuqZWnG
	 xmc5H/BpzfZLNf1BNrVf7DdYDzkfHAH0RsF+6gFzS017zmuj7wTAcTlfrlmx4IFPAS
	 MulEDVczs4nwE9MxPpdye46j0CI468/+L0ABzIBYWZpHA/1vjl7SXOnPmDBQo9eixs
	 +28mf7NwhritHgY6wPYy3/ags07NcAR9/d9Gva42e1ZJHO+nbN3RDtUfWZ0Wnw65xO
	 eRYn/+vPepXOnS8k0pQ2pdi0sjyT2XoAjQAWecvZhSWuPCyrSWZJgB5CA8GcAJuVOx
	 fX5Gg+6YoKpvg==
Date: Thu, 11 Dec 2025 09:38:35 -0600
From: Rob Herring <robh@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>
Cc: cezary.rojewski@intel.com, broonie@kernel.org, lgirdwood@gmail.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	alsa-devel@alsa-project.org, flove@realtek.com,
	shumingf@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com
Subject: Re: [PATCH v9 1/2] ASoC: dt-bindings: realtek,rt5575: add support
 for ALC5575
Message-ID: <20251211153835.GA1251928-robh@kernel.org>
References: <20251211110130.2925541-1-oder_chiou@realtek.com>
 <20251211110130.2925541-2-oder_chiou@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211110130.2925541-2-oder_chiou@realtek.com>
Message-ID-Hash: XKSFBJCQNWE3X6CSV73CSVKAVMQBFYRG
X-Message-ID-Hash: XKSFBJCQNWE3X6CSV73CSVKAVMQBFYRG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XKSFBJCQNWE3X6CSV73CSVKAVMQBFYRG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Dec 11, 2025 at 07:01:29PM +0800, Oder Chiou wrote:
> Audio codec with I2S, I2C and SPI.
> 
> Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
> ---
>  .../bindings/sound/realtek,rt5575.yaml        | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt5575.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5575.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5575.yaml
> new file mode 100644
> index 000000000000..60f9af399dd2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/realtek,rt5575.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/realtek,rt5575.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ALC5575 audio CODEC
> +
> +maintainers:
> +  - Oder Chiou <oder_chiou@realtek.com>
> +
> +description:
> +  The device supports both I2C and SPI. I2C is mandatory, while SPI is
> +  optional depending on the hardware configuration.
> +
> +allOf:
> +  - $ref: /schemas/spi/spi-peripheral-props.yaml#
> +  - $ref: dai-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - realtek,rt5575
> +      - realtek,rt5575-use-spi
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        codec@57 {
> +            compatible = "realtek,rt5575";
> +            reg = <0x57>;
> +        };
> +    };

It is completely unclear what you are doing in the SPI case. I 
deciphered it studying the driver. I shouldn't have to do that, your 
binding should make that clear. 

So your DT must look like this:

i2c {
	codec@57 {
		compatible = "realtek,rt5575-use-spi";
		reg = <0x57>;
	};
};

spi {
	codec@1 {
		compatible = "realtek,rt5575";
		reg = <0x1>;
	};
};

First, there's no need for "-use-spi" because you can just check if 
there is a rt5575 SPI device and use it if there is. Why would you have 
the SPI device and not use it?

But really it is not ideal having 2 device nodes for a single device. It 
would be much simpler to just have something like this in the i2c node:

spi-parent = <&spi0 1>;

Where the cell is the chip-select #.

We have an 'i2c-parent' already for similar reasons when there are 2 
bus connections.

Rob
