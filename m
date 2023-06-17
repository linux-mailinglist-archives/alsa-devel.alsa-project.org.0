Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFC97342B1
	for <lists+alsa-devel@lfdr.de>; Sat, 17 Jun 2023 19:40:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 947E9839;
	Sat, 17 Jun 2023 19:39:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 947E9839
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687023643;
	bh=PojzvkhFGso2oFGP3uveYEqnxdHTa1uQXua16K3xhkM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=O0FKfabjNfsq1WDFVIB9c7oNceIAHToImRReUtj4VZq2ZygOrYUUsYAm24FP6mTF+
	 CVLiFFRh9xEzm7/4Zf65pqbabkbtlqgu7NFGR0JFjvvyzFlT9S80eJaYYsMhomO1XN
	 r79hma5ZSBpLJ0I1dv5OsuIVUibCr+QNGXO+OG9o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E437F80544; Sat, 17 Jun 2023 19:39:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FDC9F80149;
	Sat, 17 Jun 2023 19:39:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48514F80155; Sat, 17 Jun 2023 19:39:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 83B13F800ED
	for <alsa-devel@alsa-project.org>; Sat, 17 Jun 2023 19:39:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83B13F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=l4SKCwL4
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 74C3F60BFA;
	Sat, 17 Jun 2023 17:39:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FFD5C433C0;
	Sat, 17 Jun 2023 17:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687023582;
	bh=PojzvkhFGso2oFGP3uveYEqnxdHTa1uQXua16K3xhkM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=l4SKCwL4R96I3XzB3D1Vjv3+FXmFQKHQPQY9k0otaA0a89GAdCn5HguiljZAwpv4r
	 HTTlmUmB1VaZi1gRKZ34Fm7nLw/o4hxZr0aPm0TggWh09GnhhbGW6QoYUdzQlAwHLE
	 Yn/BUTJ+WpTJFFrphpYJ7rCG13xuvrXhxFjmunmwJ3Vu1UrADW+q3DjzwH20cYiTQc
	 ZuNqNrTTjCShCdDDTAfngaaDsu1g9XlFb3fzO6bLpAuXKL5hrarrPaDI1epOBaV5Rs
	 6Qosz1mFLBwPIlNRoujoAXcI2Yuh5S+Z5tyzjnAq5/Ab+WgkHLE4C+RUHLgmXsAcjq
	 KnhM0t8cMEB5Q==
Date: Sat, 17 Jun 2023 18:39:32 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>, Andy Shevchenko
 <andy.shevchenko@gmail.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v5 02/13] ASoC: dt-bindings: simple-card: Add
 additional-devs subnode
Message-ID: <20230617183932.43122069@jic23-huawei>
In-Reply-To: <20230615152631.224529-3-herve.codina@bootlin.com>
References: <20230615152631.224529-1-herve.codina@bootlin.com>
	<20230615152631.224529-3-herve.codina@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Message-ID-Hash: NODK2TNYN6HNAGOF45G3MTRU3272SRQG
X-Message-ID-Hash: NODK2TNYN6HNAGOF45G3MTRU3272SRQG
X-MailFrom: jic23@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NODK2TNYN6HNAGOF45G3MTRU3272SRQG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 15 Jun 2023 17:26:20 +0200
Herve Codina <herve.codina@bootlin.com> wrote:

> The additional-devs subnode allows to declared some virtual devices
> as sound card children.
> These virtual devices can then be used by the sound card and so be
> present in the audio path.
> 
> The first virtual device supported is the audio IIO auxiliary device
> in order to support an IIO device as an audio auxiliary device.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Looks fine to me, but given it's not an area I know that much about
(other than the iio consumer bits) take that with a pinch of salt.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  .../bindings/sound/simple-card.yaml           | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
> index b05e05c81cc4..59ac2d1d1ccf 100644
> --- a/Documentation/devicetree/bindings/sound/simple-card.yaml
> +++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
> @@ -148,6 +148,15 @@ definitions:
>      required:
>        - sound-dai
>  
> +  additional-devs:
> +    type: object
> +    description:
> +      Additional devices used by the simple audio card.
> +    patternProperties:
> +      '^iio-aux(-.+)?$':
> +        type: object
> +        $ref: audio-iio-aux.yaml#
> +
>  properties:
>    compatible:
>      contains:
> @@ -187,6 +196,8 @@ properties:
>      $ref: "#/definitions/mclk-fs"
>    simple-audio-card,aux-devs:
>      $ref: "#/definitions/aux-devs"
> +  simple-audio-card,additional-devs:
> +    $ref: "#/definitions/additional-devs"
>    simple-audio-card,convert-rate:
>      $ref: "#/definitions/convert-rate"
>    simple-audio-card,convert-channels:
> @@ -359,6 +370,48 @@ examples:
>          };
>      };
>  
> +# --------------------
> +# route audio to/from a codec through an amplifier
> +# designed with a potentiometer driven by IIO:
> +# --------------------
> +  - |
> +    sound {
> +        compatible = "simple-audio-card";
> +
> +        simple-audio-card,aux-devs = <&amp_in>, <&amp_out>;
> +        simple-audio-card,routing =
> +            "CODEC LEFTIN", "AMP_IN LEFT OUT",
> +            "CODEC RIGHTIN", "AMP_IN RIGHT OUT",
> +            "AMP_OUT LEFT IN", "CODEC LEFTOUT",
> +            "AMP_OUT RIGHT IN", "CODEC RIGHTOUT";
> +
> +        simple-audio-card,additional-devs {
> +            amp_out: iio-aux-out {
> +                compatible = "audio-iio-aux";
> +                io-channels = <&pot_out 0>, <&pot_out 1>;
> +                io-channel-names = "LEFT", "RIGHT";
> +                snd-control-invert-range = <1 1>;
> +                sound-name-prefix = "AMP_OUT";
> +            };
> +
> +            amp_in: iio_aux-in {
> +                compatible = "audio-iio-aux";
> +                io-channels = <&pot_in 0>, <&pot_in 1>;
> +                io-channel-names = "LEFT", "RIGHT";
> +                sound-name-prefix = "AMP_IN";
> +            };
> +        };
> +
> +        simple-audio-card,cpu {
> +            sound-dai = <&cpu>;
> +        };
> +
> +        simple-audio-card,codec {
> +            sound-dai = <&codec>;
> +            clocks = <&clocks>;
> +        };
> +    };
> +
>  # --------------------
>  # Sampling Rate Conversion
>  # --------------------

