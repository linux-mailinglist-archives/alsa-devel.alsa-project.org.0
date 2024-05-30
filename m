Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E898D4B18
	for <lists+alsa-devel@lfdr.de>; Thu, 30 May 2024 13:55:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCFB17F8;
	Thu, 30 May 2024 13:55:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCFB17F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717070140;
	bh=X18EbHHf01kjlc7qyYc/AnhLH3W6o/0twwLLtCjgCeE=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NrM4G/lUwfyhDmySOnD5an5+GN4D4Jom2xtfPt0WFs2L5dP/9dORw6LtbI5wDjoUv
	 Ud1RR5rC2BMqoCva+pVpaG9W8T348g0TVjJwjMPAPshuYJQSFkusTJ1HPY4lOxIGYg
	 bcVvhkCAUIzNWPSrVEygC0ckulrulFMSxZyWlkzA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03D15F8059F; Thu, 30 May 2024 13:55:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CB4BF80494;
	Thu, 30 May 2024 13:55:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ECADAF80149; Thu, 30 May 2024 13:55:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4EA04F800BA
	for <alsa-devel@alsa-project.org>; Thu, 30 May 2024 13:54:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EA04F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hNq1X7FF
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a667e104375so40379566b.1
        for <alsa-devel@alsa-project.org>;
 Thu, 30 May 2024 04:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717070088; x=1717674888;
 darn=alsa-project.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wOSm7v/LmRipwiItJ5QpPAXjkVuAMgnSrFrvzC6A97U=;
        b=hNq1X7FF/eT2hi4mXK+v8hqjxls2MpTmgug+FN5eceaBXnRBevs4Y1Pt4q+Wqx7eWs
         pDN/3EdwgXHr11dkqJhj8WmC8M/+XbLt8HxSlUrFI3pnDQpD25kn75EseiZvEp8jA5vX
         cKZUBDVD77UHCpuB7hvny00NgL+xxQRpayGfpfjCPS+uQO+ArcUlPs1jY2ydWcG8+eAo
         hjoEMfdOY1MMsvyqoYRQnGz+NEdB/00MecpxH34PzQWiiP7paSlIjMniP8+k5pbY2a9I
         50+lTZk8iDCc4Dyc5OuKSdsQcN/uvGPtRFCgwQ4FhhAFzR5V8DCfBYd9ZaEKu+UsU5I7
         h0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717070088; x=1717674888;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wOSm7v/LmRipwiItJ5QpPAXjkVuAMgnSrFrvzC6A97U=;
        b=wnOfXU0np3XWY7H/b3NcJA1fb7dBOr6mjOHxb/eOW7LkQwxUkr3blYgF2SkBK9wLtr
         Sl0BztE2iGH88eLxQW4SYCKUkju5otJCSP6acsL1H3B+FvWAZ3hlqrm5MJwNhSwZ3ma4
         WlTOhLgctoy7Z3G23Se0mcg4zt6H7pMnjEKMR8aTZ7lOa1foOAA2nRk32byhYce1PFZE
         ntCzTl6JFc1cEt4O6Vp4mYPyrPnyqSGLSrYb5P0UMvFHwAXmOZ0FzoMUAKVNx/GRiWG5
         knXdMeAPp+Qqb9nhJfyOhmjXraSbkIp3tzMr1A/YiD5ea7YfEMR/NdRC5oLlF2P7seST
         Anlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfx9/VGDDPa8BxJc+QvI1+nCWg1JBP72+gYPbskOWRJpRfmtElcKtDhdMerpr9JQrVTtJ45J2Ais8+FyZp8ZN3rzJPwl2ssyG25Zc=
X-Gm-Message-State: AOJu0Yx/BNIDjmW144o0wmtMirjmUZBscMCIBzP2WjOqzt10snQ/dBPN
	NfEBQPmHJx3h0algv1lCsuJcUZ+8aTl8RtFnbAVIXiZl/6h7UN1e
X-Google-Smtp-Source: 
 AGHT+IEbtpn+V9rpWu/ZtIFAxLT/8ryUslfmVBQGHX473y0Ey2SRaClvHeiz+zNE53rxTl+D29q8AQ==
X-Received: by 2002:a17:906:a00e:b0:a5c:d67a:e8ef with SMTP id
 a640c23a62f3a-a65e8e5110cmr110199966b.31.1717070087430;
        Thu, 30 May 2024 04:54:47 -0700 (PDT)
Received: from localhost
 (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626cc4f465sm807799366b.120.2024.05.30.04.54.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 04:54:46 -0700 (PDT)
Content-Type: multipart/signed;
 boundary=c36ba65ae5685a90b9c402ee13e51faac5cd8adb9819317905f87ee770dc;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Mime-Version: 1.0
Date: Thu, 30 May 2024 13:54:46 +0200
Message-Id: <D1MYJNZF5IKE.38D65NZ0PJS4A@gmail.com>
Cc: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <lgirdwood@gmail.com>, <jonathanh@nvidia.com>, <mkumard@nvidia.com>
Subject: Re: [PATCH v2 2/2] ASoC: tegra: I2S client convert formats handling
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Sameer Pujar" <spujar@nvidia.com>, <broonie@kernel.org>,
 <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240527125608.2461300-1-spujar@nvidia.com>
 <20240527125608.2461300-3-spujar@nvidia.com>
In-Reply-To: <20240527125608.2461300-3-spujar@nvidia.com>
Message-ID-Hash: DQPBQ5BJB46APNUMUHNPFBTBCOJSW26A
X-Message-ID-Hash: DQPBQ5BJB46APNUMUHNPFBTBCOJSW26A
X-MailFrom: thierry.reding@gmail.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DQPBQ5BJB46APNUMUHNPFBTBCOJSW26A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

--c36ba65ae5685a90b9c402ee13e51faac5cd8adb9819317905f87ee770dc
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon May 27, 2024 at 2:56 PM CEST, Sameer Pujar wrote:
> From: Mohan Kumar <mkumard@nvidia.com>
>
> The AHUB HW modules are interconnected with CIF which are capable of
> supporting Channel and Sample bit format conversion. Due to this, the
> I2S Client can have different Channel and Sample bit from the hw_params()
> and this config is passed from CIF port of I2S DT node which can help to
> perform this conversion.
>
> For e.g. HFP usecase consists of BT SCO with 1ch and 8k audio data
> which needs to be converted and mixed with external codec playback and
> capture path which is of 2ch and 48k format.
>
> For HFP Playback:
>   The path includes mono to stereo and 8k to 48k conversion
>     _ _ _ _       _ _ _          _ _ _        _ _ _ _ _       _ _ _ _ _ _
>    |       |1ch  |      | 1ch   |     |2ch   | SFC     | 2ch |           =
|
>    |BT SCO |---->| I2Sx |------>| CIF |----->| 8k->48k |---->| Codec I2Sy=
|
>    |_ _ _ _|     |_ _ __|client |_ _ _|audio |_ _ _ _ _|     |_ _ _ _ _ _=
|
>
> For HFP Capture:
>   The path includes stereo to mono and 48k to 8k conversion
>     _ _ _ _ _ _       _ _ _ _ _        _ _ _         _ _ _ _       _ _ _ =
_
>    |           | 2ch | SFC     | 2ch  |     | 1ch   |       | 1ch |      =
 |
>    | codec I2Sy|---->| 48k->8k |----->| CIF |------>| I2Sx  |---->| BT SC=
O|
>    |_ _ _ _ _ _|     |_ _ _ _ _| audio|_ _ _|client |_ _ _ _|     |_ _ _ =
_|
>
> For above two path, I2S client channel uses existing DT binding to pass
> channels and format conversion in I2Sx CIF Port.
>
> Signed-off-by: Mohan Kumar <mkumard@nvidia.com>
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  sound/soc/tegra/tegra210_i2s.c | 71 ++++++++++++++++++++++++++++++++--
>  sound/soc/tegra/tegra210_i2s.h |  2 +
>  2 files changed, 69 insertions(+), 4 deletions(-)
>
> diff --git a/sound/soc/tegra/tegra210_i2s.c b/sound/soc/tegra/tegra210_i2=
s.c
> index ba7fdd7405ac..fe4fde844d86 100644
> --- a/sound/soc/tegra/tegra210_i2s.c
> +++ b/sound/soc/tegra/tegra210_i2s.c
> @@ -8,11 +8,13 @@
>  #include <linux/device.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> +#include <linux/of_graph.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <sound/core.h>
>  #include <sound/pcm_params.h>
> +#include <sound/simple_card_utils.h>
>  #include <sound/soc.h>
>  #include "tegra210_i2s.h"
>  #include "tegra_cif.h"
> @@ -603,6 +605,7 @@ static int tegra210_i2s_hw_params(struct snd_pcm_subs=
tream *substream,
>  	struct tegra210_i2s *i2s =3D snd_soc_dai_get_drvdata(dai);
>  	unsigned int sample_size, channels, srate, val, reg, path;
>  	struct tegra_cif_conf cif_conf;
> +	snd_pcm_format_t sample_format;
> =20
>  	memset(&cif_conf, 0, sizeof(struct tegra_cif_conf));
> =20
> @@ -615,28 +618,51 @@ static int tegra210_i2s_hw_params(struct snd_pcm_su=
bstream *substream,
> =20
>  	cif_conf.audio_ch =3D channels;
>  	cif_conf.client_ch =3D channels;
> +	if (i2s->client_channels)
> +		cif_conf.client_ch =3D i2s->client_channels;
> =20
> +	/* AHUB CIF Audio bits configs */
>  	switch (params_format(params)) {
> +	case SNDRV_PCM_FORMAT_S8:
> +		cif_conf.audio_bits =3D TEGRA_ACIF_BITS_8;
> +		break;
> +	case SNDRV_PCM_FORMAT_S16_LE:
> +		cif_conf.audio_bits =3D TEGRA_ACIF_BITS_16;
> +		break;
> +	case SNDRV_PCM_FORMAT_S32_LE:
> +		cif_conf.audio_bits =3D TEGRA_ACIF_BITS_32;
> +		break;
> +	default:
> +		dev_err(dev, "unsupported params audio bit format!\n");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	sample_format =3D params_format(params);

Maybe you can move this before the switch and then reuse sample_format
in the switch?

> +	if (i2s->client_sample_format >=3D 0)
> +		sample_format =3D (snd_pcm_format_t)i2s->client_sample_format;
> +
> +	/*
> +	 * Format of the I2S for sending/receiving the audio
> +	 * to/from external device.
> +	 */
> +	switch (sample_format) {
>  	case SNDRV_PCM_FORMAT_S8:
>  		val =3D I2S_BITS_8;
>  		sample_size =3D 8;
> -		cif_conf.audio_bits =3D TEGRA_ACIF_BITS_8;
>  		cif_conf.client_bits =3D TEGRA_ACIF_BITS_8;
>  		break;
>  	case SNDRV_PCM_FORMAT_S16_LE:
>  		val =3D I2S_BITS_16;
>  		sample_size =3D 16;
> -		cif_conf.audio_bits =3D TEGRA_ACIF_BITS_16;
>  		cif_conf.client_bits =3D TEGRA_ACIF_BITS_16;
>  		break;
>  	case SNDRV_PCM_FORMAT_S32_LE:
>  		val =3D I2S_BITS_32;
>  		sample_size =3D 32;
> -		cif_conf.audio_bits =3D TEGRA_ACIF_BITS_32;
>  		cif_conf.client_bits =3D TEGRA_ACIF_BITS_32;
>  		break;
>  	default:
> -		dev_err(dev, "unsupported format!\n");
> +		dev_err(dev, "unsupported client bit format!\n");
>  		return -EOPNOTSUPP;
>  	}
> =20
> @@ -872,6 +898,40 @@ static const struct regmap_config tegra210_i2s_regma=
p_config =3D {
>  	.cache_type		=3D REGCACHE_FLAT,
>  };
> =20
> +/*
> + * The AHUB HW modules are interconnected with CIF which are capable of
> + * supporting Channel and Sample bit format conversion. This needs diffe=
rent
> + * CIF Audio and client configuration. As one of the config comes from
> + * params_channels() or params_format(), the extra configuration is pass=
ed from
> + * CIF Port of DT I2S node which can help to perform this conversion.
> + *
> + *    4ch          audio =3D 4ch      client =3D 2ch       2ch
> + *   -----> ADMAIF -----------> CIF -------------> I2S ---->
> + */
> +static void tegra210_parse_client_convert(struct device *dev)
> +{
> +	struct tegra210_i2s *i2s =3D dev_get_drvdata(dev);
> +	struct device_node *ports, *ep;
> +	struct simple_util_data data =3D {};
> +	int cif_port =3D 0;
> +
> +	ports =3D of_get_child_by_name(dev->of_node, "ports");
> +	if (ports) {
> +		ep =3D of_graph_get_endpoint_by_regs(ports, cif_port, -1);
> +		if (ep) {
> +			simple_util_parse_convert(ep, NULL, &data);
> +			of_node_put(ep);
> +		}
> +		of_node_put(ports);

You could maybe try to use the "new" __free() anotation here to have
this cleaned up automatically. It'd look something like this:

	struct device_node *ports __free(device_node), *ep __free(device_node);

And then you should be able to omit both of those of_node_put() calls.
It may not be worth doing in this case because the declaration becomes
unwieldy and there aren't a lot of these calls.

> +	}
> +
> +	if (data.convert_channels)
> +		i2s->client_channels =3D data.convert_channels;
> +
> +	if (data.convert_sample_format)
> +		i2s->client_sample_format =3D simple_util_get_sample_fmt(&data);
> +}
> +
>  static int tegra210_i2s_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
> @@ -887,6 +947,7 @@ static int tegra210_i2s_probe(struct platform_device =
*pdev)
>  	i2s->tx_mask =3D DEFAULT_I2S_SLOT_MASK;
>  	i2s->rx_mask =3D DEFAULT_I2S_SLOT_MASK;
>  	i2s->loopback =3D false;
> +	i2s->client_sample_format =3D -EINVAL;
> =20
>  	dev_set_drvdata(dev, i2s);
> =20
> @@ -916,6 +977,8 @@ static int tegra210_i2s_probe(struct platform_device =
*pdev)
>  		return PTR_ERR(i2s->regmap);
>  	}
> =20
> +	tegra210_parse_client_convert(dev);
> +
>  	regcache_cache_only(i2s->regmap, true);
> =20
>  	err =3D devm_snd_soc_register_component(dev, &tegra210_i2s_cmpnt,
> diff --git a/sound/soc/tegra/tegra210_i2s.h b/sound/soc/tegra/tegra210_i2=
s.h
> index 030d70c45e18..fe478f3d8435 100644
> --- a/sound/soc/tegra/tegra210_i2s.h
> +++ b/sound/soc/tegra/tegra210_i2s.h
> @@ -112,6 +112,8 @@ struct tegra210_i2s {
>  	struct clk *clk_i2s;
>  	struct clk *clk_sync_input;
>  	struct regmap *regmap;
> +	int client_sample_format;

Given that snd_pcm_format_t is defined to be int, can you store that in
here directly? That way you only need to cast when getting the sample
format.

Anyway, very small nitpicks, so either way:

Reviewed-by: Thierry Reding <treding@nvidia.com>

--c36ba65ae5685a90b9c402ee13e51faac5cd8adb9819317905f87ee770dc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmZYaQYACgkQ3SOs138+
s6EaQQ/+OQJdi6IxMnw7oyVPO/wFKn2rjdft8JvcS5vN8NiB3mmBn1hSVSRzsZIo
rh6hi3plMrExw7CUhOilBfynE/xqJ2cUm8Pa83pyOEXVpXuXEWha/dYnNS5xMleO
qYxHkj+Qi7aTCu48OwhJ6usYpBs6DNYU/SFnQSdt3/rRng7DqgiJ0JTe+jKf2nz9
rg7wD5UUGOnKSaG+Yga+xQNcfmtTxCXxnbzpUwLW01bmFPyPp8WgJCgsRs2AZP6v
SgMnqrN9P+QfXLBNNpP1OMoKTgiy6ESqObW1T6hJkDOaRSu1xX4hjIsXyC4zUoeG
ePgvbxYO0LTlf1E33SBJmD1JD0XtzHfd2pz2hmo+GbRHMMW5zCxyIqvIOjdULucS
m1E4X2kdEq2KEpGZEq+Z71/bOcUOfixBce3w8+409fZhnZ46FzR3NHYQGs+StIoB
e9gdippmKRjxoMt5ZkQdCwVRbbWbAb8J4sItjRG6fBWYGbxmmiosP+mGnxmNQkEF
kvRp1Z6//7Ot+SKO1AcCyHIOAKZAZgc7xkuS+AiGCVHUZGttCL5sEnJfCxQN3Zo5
QWioOTeda3jp14uFw75eoVai3cLN8Jd8phUIDE5LoWLigVIHKSOZPkoh0v28knXu
RJEKkSgNEEo5U1yFFkstyWxqOqpL7eKIf+5DDFjBORQc3XwzRAE=
=4R5E
-----END PGP SIGNATURE-----

--c36ba65ae5685a90b9c402ee13e51faac5cd8adb9819317905f87ee770dc--
