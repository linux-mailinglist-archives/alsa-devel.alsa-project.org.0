Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2BECA6B4D
	for <lists+alsa-devel@lfdr.de>; Fri, 05 Dec 2025 09:31:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D41706019D;
	Fri,  5 Dec 2025 09:31:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D41706019D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1764923514;
	bh=kQt1HdhZmTbIG9W7AxCo2bVlUBbx56TCPI0/Qxmog5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=txnUXux8cvc6dqkWTX4nZaP/co7vl9ZoBM2uhRd+H/pyJhptMR8/bWofqWntmN9qq
	 ubyvjTCdneKvbociadM5kuQhieITMsN8XtzcHsnOJiDv43Gu6ylEwd+P+nWz0nuIGi
	 6LOXtBIdwkd+azl2a/+aW8uWXzpKjZDls8OfDBAw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E780F805D3; Fri,  5 Dec 2025 09:31:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4ADF0F805C4;
	Fri,  5 Dec 2025 09:31:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5FF9BF8016E; Fri,  5 Dec 2025 09:31:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 44352F800BF
	for <alsa-devel@alsa-project.org>; Fri,  5 Dec 2025 09:31:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44352F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ureTOT+X
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 35A27417E1;
	Fri,  5 Dec 2025 08:31:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CDA5C4CEF1;
	Fri,  5 Dec 2025 08:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764923465;
	bh=kQt1HdhZmTbIG9W7AxCo2bVlUBbx56TCPI0/Qxmog5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ureTOT+XuvzaF8gcHwTFY9idv1nWMGd/KSr/AJC9A6+sVXvLZa14JVueHBWcG30xY
	 CBtQ8EpVY54zUzFENGwVVfZZvyxyV7gWoFSnBUrWlz0w+Kb5JY8XmTmmD/jX46V/LO
	 J1iFZOSYNvQT4Wfes69tS8Zag4782HA5/yKB2l84UWBtTNEqA5zeMZczx+fGYkXRQP
	 ywydh0XY90wVRylxudlqo5GCUFwrmqX0Knl7j16uVLinexVy5D3qpmwmEE8uG17ip/
	 0XE1tVNCLG0GpRhbK1BenYL75jM29wvreYzcDCVX8kOSfo8yzoDJY/V4c72Ix0J6a2
	 u8JYpqryEjrjQ==
Date: Fri, 5 Dec 2025 09:31:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>
Cc: cezary.rojewski@intel.com, broonie@kernel.org, lgirdwood@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org,
	flove@realtek.com, shumingf@realtek.com, jack.yu@realtek.com,
	derek.fang@realtek.com
Subject: Re: [PATCH v8 2/2] ASoC: dt-bindings: realtek,rt5575: add bindings
 for ALC5575
Message-ID: <20251205-stylish-numbat-of-awe-10edcd@quoll>
References: <20251201105926.1714341-1-oder_chiou@realtek.com>
 <20251201105926.1714341-3-oder_chiou@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251201105926.1714341-3-oder_chiou@realtek.com>
Message-ID-Hash: 5QX7GJLDK4M3FTB7UILAMPHFPNN4QSPI
X-Message-ID-Hash: 5QX7GJLDK4M3FTB7UILAMPHFPNN4QSPI
X-MailFrom: krzk@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5QX7GJLDK4M3FTB7UILAMPHFPNN4QSPI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Dec 01, 2025 at 06:59:26PM +0800, Oder Chiou wrote:
> Realtek ALC5575 is a highly advanced DSP and microphone CODEC that has
> been designed for AI audio technology. Its impressive features include
> an advanced HiFi-5 DSP core, a Neural Network Processing Unit (NPU)
> owned by Realtek, and embedded 4MB memory, which enables it to operate
> highly advanced AI audio algorithms. The ALC5575 supports 4xA-mic input
> and 8xD-mic input, as well as a rich set of interfaces such as I2S, I2C,
> SPI, and UART.

When I asked to describe hardware, I did not meant marketing junk! Drop
all impressive features and simply describe hardware in basic terms.
This is not advanced DSP, not designed for AI audio (AI is the easiest way to
get a grumpy review), not "highly advanced AI audio algorithms" and does
not have "as a rich set of interfaces".

Use simple terms what is this. Audio codec with I2S.... interfaces.
> 
> Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
> ---
>  .../bindings/sound/realtek,rt5575.yaml        | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt5575.yaml
> 
> diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5575.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5575.yaml
> new file mode 100644
> index 000000000000..83ccc79e6769
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
> +      - realtek,rt5575-with-spi

Drop the second compatible. It's the same device. Whether it supports
SPI it is already known and obvious - you cannot place non-SPI chip on
SPI bus and expect it to work.

> +
> +  reg:
> +    maxItems: 1
> +

You listed so many "impressive" and "rich" features that for sure this
is incomplete.

Please post complete bindings for "impressive" device.

You miss supplies, you miss all the AI related hype (no clue what that
would be, but for sure NPU feels like needing remoteproc or at least
some other way to communicate). We all know that AI is power hungry, so
it is impossible to run it without electricity (thus supplies).

Best regards,
Krzysztof

