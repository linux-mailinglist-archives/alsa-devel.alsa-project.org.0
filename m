Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 370868CA203
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 20:32:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 747181DA;
	Mon, 20 May 2024 20:32:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 747181DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716229966;
	bh=ISFqQFg2dWPpWxVMb6R1UO5fAM7F17S5PwtQ+ZCbKVo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jzrEA1n5y7j7lekaonNklpF0KtuPmKoreOMu3AMrVpBzUT3aPKzUfJcVkrwnlIjlz
	 cWJgChHPlfXu8mXUAinFFOb6p2VLv71JLH3+pMfPf5lgR+xIEzMZBqQkbUftzVUaJT
	 H0pl985dwgbUlYuLVUdOMCkrOM+XGb1nXKkO2qU4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D33C4F8059F; Mon, 20 May 2024 20:32:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7801EF804B2;
	Mon, 20 May 2024 20:32:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 386E4F8026A; Mon, 20 May 2024 20:32:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D5947F8016B
	for <alsa-devel@alsa-project.org>; Mon, 20 May 2024 20:31:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5947F8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FhcXFtDo
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0E0D8CE0C2F;
	Mon, 20 May 2024 18:31:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD2C3C2BD10;
	Mon, 20 May 2024 18:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716229910;
	bh=ISFqQFg2dWPpWxVMb6R1UO5fAM7F17S5PwtQ+ZCbKVo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FhcXFtDoIzsT0MCGbOkZZoR/pC7oFA/BDxaYVi169NbMM292SKzU9n5C8O9bzokoG
	 CnBWf0vMg4qTSGromsK0gkdRbSomu1l5Z669wDLWPpYsgsrwQ0mHa0LM2SP4COLt4Q
	 dtELS5dPU8SzjLP6trn33G5xKWEu6+BRv81oqdqnOgprnIZ2sPRANlm7sJG032py+C
	 LMVhmPSBsX8s11fmE4Yq7MfiursM0RK6hWyp63/FLBg7HlLTl8ka7RSkDT80/pkemT
	 MlNwOZBWDw5BL8MXxPBGaVQI6u+oRFAZs8QpPkKmVEEUKUUhbYdvXypVErXXQE80Tg
	 cgQftxWzLDtfw==
Date: Mon, 20 May 2024 13:31:48 -0500
From: Rob Herring <robh@kernel.org>
To: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCHv4 9/9] ASoC: dt-bindings: fsl-asoc-card: add compatible
 for generic codec
Message-ID: <20240520183148.GA1250699-robh@kernel.org>
References: <20240515135411.343333-1-elinor.montmasson@savoirfairelinux.com>
 <20240515135411.343333-10-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240515135411.343333-10-elinor.montmasson@savoirfairelinux.com>
Message-ID-Hash: BFQ6ZOWSJCONP73QUFYOMZDOWCDIXUYD
X-Message-ID-Hash: BFQ6ZOWSJCONP73QUFYOMZDOWCDIXUYD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BFQ6ZOWSJCONP73QUFYOMZDOWCDIXUYD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, May 15, 2024 at 03:54:11PM +0200, Elinor Montmasson wrote:
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
> ---
>  .../bindings/sound/fsl-asoc-card.yaml         | 96 ++++++++++++++++++-
>  1 file changed, 92 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/fsl-asoc-card.yaml b/Documentation/devicetree/bindings/sound/fsl-asoc-card.yaml
> index 9922664d5ccc..332d8bf96e06 100644
> --- a/Documentation/devicetree/bindings/sound/fsl-asoc-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/fsl-asoc-card.yaml
> @@ -23,6 +23,16 @@ description:
>    and PCM DAI formats. However, it'll be also possible to support those non
>    AC'97/I2S/PCM type sound cards, such as S/PDIF audio and HDMI audio, as
>    long as the driver has been properly upgraded.
> +  To use CPU DAIs that do not require a codec such as an S/PDIF controller,
> +  or to use a DAI to output or capture raw I2S/TDM data, you can
> +  use the compatible "fsl,imx-audio-generic".
> +
> +definitions:
> +  imx-audio-generic-dependency:
> +    properties:
> +      compatible:
> +        contains:
> +          const: fsl,imx-audio-generic
>  
>  maintainers:
>    - Shengjiu Wang <shengjiu.wang@nxp.com>
> @@ -81,6 +91,7 @@ properties:
>                - fsl,imx-audio-wm8960
>                - fsl,imx-audio-wm8962
>                - fsl,imx-audio-wm8958
> +              - fsl,imx-audio-generic
>  
>    model:
>      $ref: /schemas/types.yaml#/definitions/string
> @@ -93,8 +104,14 @@ properties:
>        need to add ASRC support via DPCM.
>  
>    audio-codec:
> -    $ref: /schemas/types.yaml#/definitions/phandle
> -    description: The phandle of an audio codec
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: |
> +      The phandle of an audio codec.
> +      If using the "fsl,imx-audio-generic" compatible, give instead a pair of
> +      phandles with the spdif_transmitter first (driver SPDIF DIT) and the
> +      spdif_receiver second (driver SPDIF DIR).

       minItems: 1
       maxItems: 2

> +    items:
> +      maxItems: 1
>  
>    audio-cpu:
>      $ref: /schemas/types.yaml#/definitions/phandle
> @@ -150,8 +167,8 @@ properties:
>      description: dai-link uses bit clock inversion.
>  
>    mclk-id:
> -    $ref: /schemas/types.yaml#/definitions/uint32
> -    description: main clock id, specific for each card configuration.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description: Main clock id for each codec, specific for each card configuration.

       minItems: 1
       maxItems: 2
>  
>    mux-int-port:
>      $ref: /schemas/types.yaml#/definitions/uint32
> @@ -167,10 +184,68 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description: The phandle of an CPU DAI controller
>  
> +  # Properties relevant only with "fsl,imx-audio-generic" compatible
> +  dai-tdm-slot-width:
> +    description: See tdm-slot.txt.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  dai-tdm-slot-num:
> +    description: See tdm-slot.txt.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  clocks:
> +    description: |
> +      The CPU DAI system clock, used to retrieve
> +      the CPU DAI system clock frequency with the generic codec.
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: cpu_sysclk
> +
> +  cpu-system-clock-direction-out:
> +    description: |
> +      Specifies cpu system clock direction as 'out' on initialization.
> +      If not set, direction is 'in'.
> +    $ref: /schemas/types.yaml#/definitions/flag
> +
> +dependencies:
> +  dai-tdm-slot-width:
> +    $ref: "#/definitions/imx-audio-generic-dependency"
> +  dai-tdm-slot-num:
> +    $ref: "#/definitions/imx-audio-generic-dependency"
> +  clocks:
> +    $ref: "#/definitions/imx-audio-generic-dependency"
> +  cpu-system-clock-direction-out:
> +    $ref: "#/definitions/imx-audio-generic-dependency"

This works, but is an unusual pattern...

> +
>  required:
>    - compatible
>    - model
>  
> +allOf:
> +  - if:
> +      $ref: "#/definitions/imx-audio-generic-dependency"
> +    then:
> +      properties:
> +        audio-codec:
> +          items:
> +            - description: SPDIF DIT phandle
> +            - description: SPDIF DIR phandle
> +        mclk-id:
> +          maxItems: 1
> +          items:
> +            minItems: 1
> +            maxItems: 2
> +    else:
> +      properties:
> +        audio-codec:
> +          maxItems: 1
> +        mclk-id:
> +          maxItems: 1
> +          items:
> +            maxItems: 1


You can handle the dependency like this instead:

           dai-tdm-slot-width: false
           dai-tdm-slot-num: false


And then you don't need the definitions.

> +
>  unevaluatedProperties: false
>  
>  examples:
> @@ -195,3 +270,16 @@ examples:
>               "AIN2L", "Line In Jack",
>               "AIN2R", "Line In Jack";
>      };
> +
> +  - |
> +    #include <dt-bindings/clock/imx8mn-clock.h>
> +    sound-spdif-asrc {
> +      compatible = "fsl,imx-audio-generic";
> +      model = "spdif-asrc-audio";
> +      audio-cpu = <&spdif>;
> +      audio-asrc = <&easrc>;
> +      audio-codec = <&spdifdit>, <&spdifdir>;
> +      clocks = <&clk IMX8MN_CLK_SAI5_ROOT>;
> +      clock-names = "cpu_sysclk";
> +      cpu-system-clock-direction-out;
> +    };
> -- 
> 2.34.1
> 
