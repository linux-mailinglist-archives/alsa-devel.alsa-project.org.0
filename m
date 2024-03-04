Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0108703F6
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Mar 2024 15:24:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA32886F;
	Mon,  4 Mar 2024 15:24:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA32886F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709562279;
	bh=XXxnvR6/7pWjgGR4OrSNwADlQ09xHuL0Usz9cO3xdU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kyfTrSrabBlmxQAgTJ7soTJaOLUMaxtp0nfcPKGtzk+ZWHFTW8hQNXfpBRXAs6DLI
	 13dLIOhir3xeYbjfLn/c6dwESrNGvNPVMohwrG/OX/qL8eVesiL0FmG8Hv1xLqNZBl
	 F1gQ4h1CyHgTdfARQnZUnjgQMQFyR8Dna3R4FA+g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35910F805A9; Mon,  4 Mar 2024 15:24:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9E66F80571;
	Mon,  4 Mar 2024 15:24:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74327F802E8; Mon,  4 Mar 2024 15:24:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CBABEF8014B
	for <alsa-devel@alsa-project.org>; Mon,  4 Mar 2024 15:23:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBABEF8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AsPt8hoD
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A84D6CE1386;
	Mon,  4 Mar 2024 14:23:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90565C43390;
	Mon,  4 Mar 2024 14:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709562223;
	bh=XXxnvR6/7pWjgGR4OrSNwADlQ09xHuL0Usz9cO3xdU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AsPt8hoDUStklKvbr9l5y2fCjUGifbeJjU76gbjhnARANwQXeq28a2bR771tR8nGT
	 noq991Wu1u/PCmt4GmXY7fDKquRwzL5iof/dZkzUfh9seVFkRx739pgn8PWheEu6SG
	 UWs0JrRh19UszyusQy3QxyfcQm8/sMHN5c88pWXSH+PdSW3/3avE5HPVXoLb9tKBdF
	 TTIhXfxcJX8lBh50VfYt0ukdtiFqg/8esZM4/Etf2qaOf17eYQFv2EsnRZg7uqsvSu
	 YR364dIhms7VAjpVoZ2rKs1VYiEaI6QPd6KwtY0QFiCXusYMaYeO3bErFJyEXF+YuE
	 Zek//seAJQ1FA==
Date: Mon, 4 Mar 2024 08:23:41 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: broonie@kernel.org, wenst@chromium.org, lgirdwood@gmail.com,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, perex@perex.cz, tiwai@suse.com,
	trevor.wu@mediatek.com, maso.huang@mediatek.com,
	xiazhengqiao@huaqin.corp-partner.google.com, arnd@arndb.de,
	kuninori.morimoto.gx@renesas.com, shraash@google.com,
	amergnat@baylibre.com, nicolas.ferre@microchip.com,
	u.kleine-koenig@pengutronix.de, dianders@chromium.org,
	frank.li@vivo.com, allen-kh.cheng@mediatek.com,
	eugen.hristev@collabora.com, claudiu.beznea@tuxon.dev,
	jarkko.nikula@bitmer.com, jiaxin.yu@mediatek.com,
	alpernebiyasak@gmail.com, ckeepax@opensource.cirrus.com,
	zhourui@huaqin.corp-partner.google.com, nfraprado@collabora.com,
	alsa-devel@alsa-project.org, shane.chien@mediatek.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH 19/22] ASoC: dt-bindings: mt8192: Document audio-routing
 and dai-link subnode
Message-ID: <20240304142341.GA156846-robh@kernel.org>
References: <20240227120939.290143-1-angelogioacchino.delregno@collabora.com>
 <20240227120939.290143-20-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <20240227120939.290143-20-angelogioacchino.delregno@collabora.com>
Message-ID-Hash: ZP4N3VK5XNWPRKVIG2L4DPRX2TZDYYBD
X-Message-ID-Hash: ZP4N3VK5XNWPRKVIG2L4DPRX2TZDYYBD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZP4N3VK5XNWPRKVIG2L4DPRX2TZDYYBD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Feb 27, 2024 at 01:09:36PM +0100, AngeloGioacchino Del Regno wrote:
> Document the dai-link subnodes and the audio-routing property, allowing
> to describe machine specific audio hardware and links in device tree.
> 
> While at it, also deprecate the old properties which were previously
> used with the driver's partially hardcoded configuration.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../sound/mt8192-mt6359-rt1015-rt5682.yaml    | 129 ++++++++++++++++--
>  1 file changed, 121 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
> index 7e50f5d65c8f..78e221003750 100644
> --- a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
> +++ b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
> @@ -20,6 +20,15 @@ properties:
>        - mediatek,mt8192_mt6359_rt1015p_rt5682
>        - mediatek,mt8192_mt6359_rt1015p_rt5682s
>  
> +  audio-routing:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array

Already defined in sound-card-common.yaml. Add a $ref.

> +    description:
> +      A list of the connections between audio components. Each entry is a
> +      pair of strings, the first being the connection's sink, the second
> +      being the connection's source.
> +      Valid names could be the input or output widgets of audio components,
> +      power supplies, MicBias of codec and the software switch.

Generally the names are defined here.

> +
>    mediatek,platform:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description: The phandle of MT8192 ASoC platform.
> @@ -27,10 +36,12 @@ properties:
>    mediatek,hdmi-codec:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description: The phandle of HDMI codec.
> +    deprecated: true
>  
>    headset-codec:
>      type: object
>      additionalProperties: false
> +    deprecated: true
>  
>      properties:
>        sound-dai:
> @@ -41,6 +52,7 @@ properties:
>    speaker-codecs:
>      type: object
>      additionalProperties: false
> +    deprecated: true
>  
>      properties:
>        sound-dai:
> @@ -51,13 +63,83 @@ properties:
>      required:
>        - sound-dai
>  
> +patternProperties:
> +  ".*-dai-link$":
> +    type: object
> +    description:
> +      Container for dai-link level properties and CODEC sub-nodes.
> +
> +    properties:
> +      link-name:
> +        description: Indicates dai-link name and PCM stream name
> +        items:
> +          enum:
> +            - I2S0
> +            - I2S1
> +            - I2S2
> +            - I2S3
> +            - I2S4
> +            - I2S5
> +            - I2S6
> +            - I2S7
> +            - I2S8
> +            - I2S9
> +            - TDM
> +
> +      codec:
> +        description: Holds subnode which indicates codec dai.
> +        type: object
> +        additionalProperties: false
> +        properties:
> +          sound-dai:
> +            minItems: 1
> +            maxItems: 2
> +        required:
> +          - sound-dai
> +
> +      dai-format:
> +        description: audio format
> +        items:
> +          enum:
> +            - i2s
> +            - right_j
> +            - left_j
> +            - dsp_a
> +            - dsp_b
> +
> +      mediatek,clk-provider:
> +        $ref: /schemas/types.yaml#/definitions/string
> +        description: Indicates dai-link clock master.
> +        items:
> +          enum:
> +            - cpu
> +            - codec
> +
> +    additionalProperties: false

Move this before properties.

> +
> +    required:
> +      - link-name
> +
>  additionalProperties: false
>  
>  required:
>    - compatible
>    - mediatek,platform
> -  - headset-codec
> -  - speaker-codecs
> +
> +allOf:
> +  # Disallow dai-link-xxx nodes if the legacy properties are specified

xxx-dai-link?

> +  - if:
> +      patternProperties:
> +        ".*-dai-link$": false
> +    then:
> +      required:
> +        - headset-codec
> +        - speaker-codecs
> +    else:
> +      properties:
> +        headset-codec: false
> +        speaker-codecs: false
> +        mediatek,hdmi-codec: false

Allowing both would preserve compatibility. That's not needed? If so, 
say why in the commit msg.

>  
>  examples:
>    - |
> @@ -65,19 +147,50 @@ examples:
>      sound: mt8192-sound {
>          compatible = "mediatek,mt8192_mt6359_rt1015_rt5682";
>          mediatek,platform = <&afe>;
> -        mediatek,hdmi-codec = <&anx_bridge_dp>;
>          pinctrl-names = "aud_clk_mosi_off",
>                          "aud_clk_mosi_on";
>          pinctrl-0 = <&aud_clk_mosi_off>;
>          pinctrl-1 = <&aud_clk_mosi_on>;
>  
> -        headset-codec {
> -            sound-dai = <&rt5682>;
> +        audio-routing =
> +                "Headphone Jack", "HPOL",
> +                "Headphone Jack", "HPOR",
> +                "IN1P", "Headset Mic",
> +                "Speakers", "Speaker";
> +
> +        spk-playback-dai-link {
> +                link-name = "I2S3";
> +                dai-format = "i2s";
> +                mediatek,clk-provider = "cpu";
> +                codec {
> +                        sound-dai = <&rt1015p>;
> +                };
> +        };
> +
> +        hs-playback-dai-link {
> +                link-name = "I2S8";
> +                dai-format = "i2s";
> +                mediatek,clk-provider = "cpu";
> +                codec {
> +                        sound-dai = <&rt5682 0>;
> +                };
> +        };
> +
> +        hs-capture-dai-link {
> +                link-name = "I2S9";
> +                dai-format = "i2s";
> +                mediatek,clk-provider = "cpu";
> +                codec {
> +                        sound-dai = <&rt5682 0>;
> +                };
>          };
>  
> -        speaker-codecs {
> -            sound-dai = <&rt1015_l>,
> -                        <&rt1015_r>;
> +        displayport-dai-link {
> +                link-name = "TDM";
> +                dai-format = "dsp_a";
> +                codec {
> +                        sound-dai = <&anx_bridge_dp>;
> +                };
>          };
>      };
>  
> -- 
> 2.44.0
> 
