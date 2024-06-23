Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2169139BC
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Jun 2024 13:08:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31EE384A;
	Sun, 23 Jun 2024 13:08:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31EE384A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719140921;
	bh=+M4chnujTGXjSxADVGgYQyDo0ZhysUpMH08sqJDaoIA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pj1PCXJfKAGXjNwfzFUIXVM2khzb3n1JYKGnM7fC0AZ0bBAFTwhJz48Em0lA5B1rW
	 NYu/eOqijxShnAaXQwnVmp3hqPLQybDy9EzgJLOAbGnsZsi5Pjgjzd6FDxEB28YvaN
	 LBf/Vdg493IAS0ozwjYsuf3vqO0L2CxLHbxsKv/E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 470EEF805AF; Sun, 23 Jun 2024 13:08:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A0FF9F80588;
	Sun, 23 Jun 2024 13:08:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31C92F80495; Sun, 23 Jun 2024 13:08:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E18C5F8013D
	for <alsa-devel@alsa-project.org>; Sun, 23 Jun 2024 13:08:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E18C5F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aj7KS6CL
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 47025CE01F9;
	Sun, 23 Jun 2024 11:07:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B726DC2BD10;
	Sun, 23 Jun 2024 11:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719140876;
	bh=+M4chnujTGXjSxADVGgYQyDo0ZhysUpMH08sqJDaoIA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aj7KS6CLYgjKAVhpExivrjQ98PXJ8c4eFVrJQ0JRTTnW5AnN9PfbPjqYAp3I3szV8
	 gLeuBUMMTNQqUMqdgM7r+DClmt02oGIWbfzOIE0TNzPYujhQfqHM63IriO142XKuLx
	 79hf8O22EoKcJAonpkW7VD5ZTZ8GJ2lm+AJr27bpMG+GwnfBHTv5L3K7t4SClRR6wO
	 A2kwqWdXl815dH/x5LGqz0aH15Nkgll4/ECCbywslTtKt9yH5eGYIXojqhlJA4HBFH
	 PrgKNQzr0Oy8KIN4J6dJ2MoZm4+fsPHv5bNZGimj5a/YzLdSuS43+pFqKAskLOkCAd
	 M4G6y6ZfBc43w==
Message-ID: <6fcbd97b-4172-48a9-bcdb-3bdf35aba8f7@kernel.org>
Date: Sun, 23 Jun 2024 13:07:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv5 6/9] ASoC: dt-bindings: fsl-asoc-card: add compatible
 string for spdif
To: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org,
 Philip-Dylan <philip-dylan.gleonec@savoirfairelinux.com>
References: <20240620132511.4291-1-elinor.montmasson@savoirfairelinux.com>
 <20240620132511.4291-7-elinor.montmasson@savoirfairelinux.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240620132511.4291-7-elinor.montmasson@savoirfairelinux.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: TUDNVECLQVEHHROVDIFMALD6MZPTD32C
X-Message-ID-Hash: TUDNVECLQVEHHROVDIFMALD6MZPTD32C
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TUDNVECLQVEHHROVDIFMALD6MZPTD32C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 20/06/2024 15:25, Elinor Montmasson wrote:
> The S/PDIF audio card support was merged from imx-spdif into the
> fsl-asoc-card driver, making it possible to use an S/PDIF with an ASRC.
> Add the new compatible and update properties.

Please use standard email subjects, so with the PATCH keyword in the
title. `git format-patch -v5` helps here to create proper versioned
patches. Another useful tool is b4.

> 
> Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
> ---
>  .../bindings/sound/fsl-asoc-card.yaml         | 30 ++++++++++++++++---
>  1 file changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl-asoc-card.yaml b/Documentation/devicetree/bindings/sound/fsl-asoc-card.yaml
> index 9922664d5ccc..f2e28b32808e 100644
> --- a/Documentation/devicetree/bindings/sound/fsl-asoc-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/fsl-asoc-card.yaml
> @@ -33,6 +33,7 @@ properties:
>        - items:
>            - enum:
>                - fsl,imx-sgtl5000
> +              - fsl,imx-sabreauto-spdif
>                - fsl,imx25-pdk-sgtl5000
>                - fsl,imx53-cpuvo-sgtl5000
>                - fsl,imx51-babbage-sgtl5000
> @@ -54,6 +55,7 @@ properties:
>                - fsl,imx6q-ventana-sgtl5000
>                - fsl,imx6sl-evk-wm8962
>                - fsl,imx6sx-sdb-mqs
> +              - fsl,imx6sx-sdb-spdif
>                - fsl,imx6sx-sdb-wm8962
>                - fsl,imx7d-evk-wm8960
>                - karo,tx53-audio-sgtl5000
> @@ -65,6 +67,7 @@ properties:
>                - fsl,imx-audio-sgtl5000
>                - fsl,imx-audio-wm8960
>                - fsl,imx-audio-wm8962
> +              - fsl,imx-audio-spdif

This does not look right. It's quite generic, so now you allow any
variant to be used with this fallback.

Please do not grow more this list of all possible combinations and
instead add specific lists. Otherwise, please explain why this is valid
hardware:
"fsl,imx7d-evk-wm8960", "fsl,imx-audio-spdif"


>        - items:
>            - enum:
>                - fsl,imx-audio-ac97
> @@ -81,6 +84,7 @@ properties:
>                - fsl,imx-audio-wm8960
>                - fsl,imx-audio-wm8962
>                - fsl,imx-audio-wm8958
> +              - fsl,imx-audio-spdif

Fallbacks should not be used alone. Why this is needed? The compatible
is already documented, so now you create duplicated binding.

This is very confusing.

>  
>    model:
>      $ref: /schemas/types.yaml#/definitions/string
> @@ -93,8 +97,15 @@ properties:
>        need to add ASRC support via DPCM.
>  
>    audio-codec:
> -    $ref: /schemas/types.yaml#/definitions/phandle
> -    description: The phandle of an audio codec
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: |
> +      The phandle of an audio codec.
> +      With "fsl,imx-audio-spdif", either SPDIF audio codec spdif_transmitter,
> +      spdif_receiver or both.
> +    minItems: 1
> +    maxItems: 2
> +    items:
> +      maxItems: 1
>  
>    audio-cpu:
>      $ref: /schemas/types.yaml#/definitions/phandle
> @@ -150,8 +161,10 @@ properties:
>      description: dai-link uses bit clock inversion.
>  
>    mclk-id:
> -    $ref: /schemas/types.yaml#/definitions/uint32
> -    description: main clock id, specific for each card configuration.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description: Main clock id for each codec, specific for each card configuration.
> +    minItems: 1
> +    maxItems: 2
>  
>    mux-int-port:
>      $ref: /schemas/types.yaml#/definitions/uint32
> @@ -195,3 +208,12 @@ examples:
>               "AIN2L", "Line In Jack",
>               "AIN2R", "Line In Jack";
>      };
> +
> +  - |
> +    sound-spdif-asrc {
> +      compatible = "fsl,imx-audio-spdif";
> +      model = "spdif-asrc-audio";
> +      audio-cpu = <&spdif>;
> +      audio-asrc = <&easrc>;
> +      audio-codec = <&spdifdit>, <&spdifdir>;
> +    };

Do not introduce another indentation style. Look what is above.


Best regards,
Krzysztof

