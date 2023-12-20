Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0084881A91A
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Dec 2023 23:26:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CECD9857;
	Wed, 20 Dec 2023 23:26:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CECD9857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703111204;
	bh=1W+/BlCYRBWNRRrkM97ARP2nwR2lz+YRFgCUZtpqkN8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZcvEIA0KykUPGw6Rsbn6lMLm3MbPSKOVtE0jzwLqTUcixx2f0iCaf4fXtPJiKqk4b
	 FLI12xGDBH6QRgib6jADV0Z09C1JHtRzG7d61YkjBHsHclgGvrglbPOzhsaQ1/CIu/
	 tPfSds5LTPDeY8KdiAmjGlkHIddcYwK5/iK0EqcU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E825EF8058C; Wed, 20 Dec 2023 23:26:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A1FBF80571;
	Wed, 20 Dec 2023 23:26:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05559F8016E; Wed, 20 Dec 2023 23:26:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 92C8EF800D2
	for <alsa-devel@alsa-project.org>; Wed, 20 Dec 2023 23:25:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92C8EF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Ix6Sr9v7
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BD2CACE1819;
	Wed, 20 Dec 2023 22:25:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F192C433C8;
	Wed, 20 Dec 2023 22:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703111153;
	bh=1W+/BlCYRBWNRRrkM97ARP2nwR2lz+YRFgCUZtpqkN8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ix6Sr9v7aw0PTbt2XOtlQZh/iXeGLJYw1/NpnOXYP78dPf5N30NFmShIzimCfTOei
	 +4Gl7fC7H5o6pjGsQzBNxS7rto/V4+rmBHZUFeoUcaCFyXSPdBEaIT/kJdh7BlcpxU
	 xLyYUwauttasDqPy9pz4cj52MVaA8NZqwtG4/DrTEzswiCp5qxF8VLBspJwdhvj1JJ
	 omAOry4wDGpkQc3VIgkMBUr+XZ2uUuZhkFm/Kp4NitzqwiU0pwyphpbMyaSzEGqvxB
	 DI2urkt2cLKypkUwnDmxiwXbUoqxoujasKuOONvCn1vkFFBuTn5fv2tmjTUApwniVq
	 6gPf/UbsMRO0Q==
Received: (nullmailer pid 1236168 invoked by uid 1000);
	Wed, 20 Dec 2023 22:25:50 -0000
Date: Wed, 20 Dec 2023 16:25:50 -0600
From: Rob Herring <robh@kernel.org>
To: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 Philip-Dylan <philip-dylan.gleonec@savoirfairelinux.com>
Subject: Re: [PATCHv3 RESEND 10/10] ASoC: dt-bindings: fsl-asoc-card: add
 compatible for generic codec
Message-ID: <20231220222550.GA1232936-robh@kernel.org>
References: <20231218124058.2047167-1-elinor.montmasson@savoirfairelinux.com>
 <20231218124058.2047167-11-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <20231218124058.2047167-11-elinor.montmasson@savoirfairelinux.com>
Message-ID-Hash: ZBSUDUHNEBO5PDACOSVL7PI5VKF27OML
X-Message-ID-Hash: ZBSUDUHNEBO5PDACOSVL7PI5VKF27OML
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZBSUDUHNEBO5PDACOSVL7PI5VKF27OML/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Dec 18, 2023 at 01:40:58PM +0100, Elinor Montmasson wrote:
> Add documentation about new dts bindings following new support
> for compatible "fsl,imx-audio-generic".
> 
> Some CPU DAI don't require a real audio codec. The new compatible
> "fsl,imx-audio-generic" allows using the driver with codec drivers
> SPDIF DIT and SPDIF DIR as dummy codecs.
> It also allows using not pre-configured audio codecs which
> don't require specific control through a codec driver.
> 
> The new dts properties give the possibility to set some parameters
> about the CPU DAI usually set through the codec configuration.
> 
> Signed-off-by: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
> Co-authored-by: Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelinux.com>
> ---
>  .../bindings/sound/fsl-asoc-card.txt          | 28 ++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt b/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt
> index 4e8dbc5abfd1..f137ef2154e3 100644
> --- a/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt
> +++ b/Documentation/devicetree/bindings/sound/fsl-asoc-card.txt
> @@ -17,6 +17,9 @@ Note: The card is initially designed for those sound cards who use AC'97, I2S
>        and PCM DAI formats. However, it'll be also possible to support those non
>        AC'97/I2S/PCM type sound cards, such as S/PDIF audio and HDMI audio, as
>        long as the driver has been properly upgraded.
> +      To use CPU DAIs that do not require a codec such as an S/PDIF controller,
> +      or to use a DAI to output or capture raw I2S/TDM data, you can
> +      use the compatible "fsl,imx-audio-generic".
>  
>  
>  The compatible list for this generic sound card currently:
> @@ -48,6 +51,8 @@ The compatible list for this generic sound card currently:
>  
>   "fsl,imx-audio-nau8822"
>  
> + "fsl,imx-audio-generic"
> +
>  Required properties:
>  
>    - compatible		: Contains one of entries in the compatible list.
> @@ -56,7 +61,11 @@ Required properties:
>  
>    - audio-cpu		: The phandle of an CPU DAI controller
>  
> -  - audio-codec		: The phandle of an audio codec
> +  - audio-codec		: The phandle of an audio codec.
> +			  If using the "fsl,imx-audio-generic" compatible,
> +			  give instead a pair of phandles with the
> +			  spdif_transmitter first (driver SPDIF DIT) and the
> +			  spdif_receiver second (driver SPDIF DIR).
>  
>  Optional properties:
>  
> @@ -87,6 +96,23 @@ Optional properties:
>    - frame-inversion	: dai-link uses frame clock inversion, for details see simple-card.yaml.
>    - bitclock-inversion	: dai-link uses bit clock inversion, for details see simple-card.yaml.
>    - mclk-id		: main clock id, specific for each card configuration.
> +			  For multi-codec configurations, an array of ids can be
> +			  given, one for each codec.
> +
> +Optional, relevant only with the "fsl,imx-audio-generic" compatible:
> +
> +  - cpu-slot-width	: Indicates a specific TDM slot width in bits.
> +  - cpu-slot-num	: Indicates a specific number of TDM slots per frame.

Pretty sure I've seen other bindings with TDM slot properties. A sign we 
need something common if we don't already have something.

> +
> +  - cpu-sysclk-freq-rx	: Frequency of the CPU DAI sys clock for Rx.
> +  - cpu-sysclk-freq-tx	: Frequency of the CPU DAI sys clock for Tx.
> +
> +  - cpu-sysclk-dir-rx-out	: Boolean property. Specifies sys clock direction
> +				  as 'out' on initialization for Rx.
> +				  If not set, default direction is 'in'.
> +  - cpu-sysclk-dir-tx-out	: Boolean property. Specifies sys clock direction
> +				  as 'out' on initialization for Tx.
> +				  If not set, default direction is 'in'.

Looks like clock stuff. Use the clock binding.

Rob
