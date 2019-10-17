Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A88ADA405
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2019 04:50:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03823950;
	Thu, 17 Oct 2019 04:49:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03823950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571280648;
	bh=7WgnlyueFbgpeppyUpkQ1nNC+6duicb1Yi2bdd1UKds=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IB+ZDbovZS77sb+7lxDPkED/5MH8dvXSbEZKo8y4mzJVL5IdkP6AL2P7mNqmYXHoo
	 MxDdWSBR32jhRS9hj4SLG7f9iMCNjQSWNHyOcmkyLaxvitn9hRDkjbYMgLik4qIL7L
	 fMLukdvVOkagTPJ1CT55OVSMgZVyqGKkkTEm3Pag=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50A7BF804A9;
	Thu, 17 Oct 2019 04:49:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F794F804AA; Thu, 17 Oct 2019 04:49:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,FSL_HELO_FAKE,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6B66F802A0
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 04:48:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6B66F802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="c5rMbP4K"
Received: by mail-pg1-x542.google.com with SMTP id p1so418270pgi.4
 for <alsa-devel@alsa-project.org>; Wed, 16 Oct 2019 19:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GEcAwRqrvwXriRUO3mrk2vqESCraFhzLpSjO7bHmOVw=;
 b=c5rMbP4KPMj+mydbTULOWDyXGSLnKCu/8XVeP1C3l3yvLbpIUb7AT3qBQPRgx+JE/b
 2mwIImBGHsIKpEILQIB6YFqZbZOjaaSwvGK0JeRiCNuDEtviWC0JV+J4oy973BBeOEoC
 Myei4Dal+BYRyCzie27yfy4fhR6e8KuzE3cyDtZfYQzcQZpzGvRg55W3+YVvWxbTCr3m
 YCvBMSinYJfcQonLX4mIAIiXBexu2y4SwzZ/IidTHvXzk4/ZNIvt1kFhuZxtyPv7x/4z
 keuM5u7c+diUpfgyBqLMpOfXsYxpx4NMhLM81JFhuABZ8RZ/UvUlq9bKJKHYgREj1Rmf
 DvSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GEcAwRqrvwXriRUO3mrk2vqESCraFhzLpSjO7bHmOVw=;
 b=idZiq8UcQnd3Dyu45M52CHPQqYdWegKMV47IbjzOy5bKDGFIHBoBcT0IyTEhLgJrh3
 /5r6ByetQfaedFxU8Jmk+olc+zjF1ye3Wa8qNdfed3DTDgUVyE3Hlnw9o1bggfQmjT1U
 8Wq+vuHBGeZCjq1jnchcMAltiy+FWgicbKU1VfI4lKUUBSwXSKhH040T/PIsi82ivAPs
 zpNZzSoK8kuJahx1VzPxj3Um3Nv2NMDYGDbI8uOS/z1zU6qku1L7i5kF80eEOnb4oxSI
 dDrdTlhBjmLzR2RL5ZVGmUSqC0dCKDgqx010CLKq49J6YeUKT5qQZTK4gj4f70YWsZgx
 G71w==
X-Gm-Message-State: APjAAAV9KLuViLC2+m7MI8BgMlB32lKD9ac6XkoJX7OEo80tKYxnyEi/
 9KICK8tj4hniU6mSkXLLXRd2Dg==
X-Google-Smtp-Source: APXvYqzsXEWymb05WYzGrrZ4jIY+YMScDnC9RMocI6CbCNyqdEatUBDp97Si4YILokppgkmUZ/fODw==
X-Received: by 2002:a62:6d81:: with SMTP id i123mr1015709pfc.57.1571280533339; 
 Wed, 16 Oct 2019 19:48:53 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:bc61:d85d:eb16:9036])
 by smtp.gmail.com with ESMTPSA id a8sm471863pff.5.2019.10.16.19.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 19:48:52 -0700 (PDT)
Date: Wed, 16 Oct 2019 19:48:47 -0700
From: Benson Leung <bleung@google.com>
To: Tzung-Bi Shih <tzungbi@google.com>
Message-ID: <20191017024847.GA72195@google.com>
References: <20191014102022.236013-1-tzungbi@google.com>
 <20191014180059.03.I93d9c65964f3c30f85a36d228e31150ff1917706@changeid>
MIME-Version: 1.0
In-Reply-To: <20191014180059.03.I93d9c65964f3c30f85a36d228e31150ff1917706@changeid>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: gwendal@google.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, drinkcat@google.com, robh+dt@kernel.org,
 broonie@kernel.org, enric.balletbo@collabora.com, dgreid@google.com
Subject: Re: [alsa-devel] [PATCH v3 03/10] ASoC: cros_ec_codec: extract DMIC
 EC command from I2S RX
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0893427951407994616=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0893427951407994616==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MGYHOYXEY6WxJCY8"
Content-Disposition: inline


--MGYHOYXEY6WxJCY8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Tzung-Bi,

On Mon, Oct 14, 2019 at 06:20:15PM +0800, Tzung-Bi Shih wrote:
> Extract DMIC EC command from I2S RX.  Setting and getting
> microphone gains is common features.
>=20
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>

Acked-By: Benson Leung <bleung@chromium.org>

Thanks,
Benson

> ---
>  drivers/platform/chrome/cros_ec_trace.c       |  1 +
>  .../linux/platform_data/cros_ec_commands.h    | 49 +++++++++++-----
>  sound/soc/codecs/cros_ec_codec.c              | 57 ++++++++++---------
>  3 files changed, 68 insertions(+), 39 deletions(-)
>=20
> diff --git a/drivers/platform/chrome/cros_ec_trace.c b/drivers/platform/c=
hrome/cros_ec_trace.c
> index 901850004b2b..e73bb6a8b00e 100644
> --- a/drivers/platform/chrome/cros_ec_trace.c
> +++ b/drivers/platform/chrome/cros_ec_trace.c
> @@ -98,6 +98,7 @@
>  	TRACE_SYMBOL(EC_CMD_SB_READ_BLOCK), \
>  	TRACE_SYMBOL(EC_CMD_SB_WRITE_BLOCK), \
>  	TRACE_SYMBOL(EC_CMD_BATTERY_VENDOR_PARAM), \
> +	TRACE_SYMBOL(EC_CMD_EC_CODEC_DMIC), \
>  	TRACE_SYMBOL(EC_CMD_EC_CODEC_I2S_RX), \
>  	TRACE_SYMBOL(EC_CMD_REBOOT_EC), \
>  	TRACE_SYMBOL(EC_CMD_GET_PANIC_INFO), \
> diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/lin=
ux/platform_data/cros_ec_commands.h
> index 261ac83bd007..58e460c015ef 100644
> --- a/include/linux/platform_data/cros_ec_commands.h
> +++ b/include/linux/platform_data/cros_ec_commands.h
> @@ -4466,18 +4466,48 @@ enum mkbp_cec_event {
> =20
>  /***********************************************************************=
******/
> =20
> +/* Commands for DMIC on audio codec. */
> +#define EC_CMD_EC_CODEC_DMIC 0x00BC
> +
> +enum ec_codec_dmic_subcmd {
> +	EC_CODEC_DMIC_SET_GAIN =3D 0x0,
> +	EC_CODEC_DMIC_GET_GAIN =3D 0x1,
> +	EC_CODEC_DMIC_SUBCMD_COUNT,
> +};
> +
> +struct __ec_align1 ec_param_ec_codec_dmic_set_gain {
> +	uint8_t left;
> +	uint8_t right;
> +	uint8_t reserved[2];
> +};
> +
> +struct __ec_align4 ec_param_ec_codec_dmic {
> +	uint8_t cmd; /* enum ec_codec_dmic_subcmd */
> +	uint8_t reserved[3];
> +
> +	union {
> +		struct ec_param_ec_codec_dmic_set_gain
> +				set_gain_param;
> +	};
> +};
> +
> +struct __ec_align1 ec_response_ec_codec_dmic_get_gain {
> +	uint8_t left;
> +	uint8_t right;
> +};
> +
> +/***********************************************************************=
******/
> +
>  /* Commands for I2S RX on audio codec. */
> =20
> -#define EC_CMD_EC_CODEC_I2S_RX 0x00BC
> +#define EC_CMD_EC_CODEC_I2S_RX 0x00BD
> =20
>  enum ec_codec_i2s_rx_subcmd {
>  	EC_CODEC_I2S_RX_ENABLE =3D 0x0,
>  	EC_CODEC_I2S_RX_DISABLE =3D 0x1,
> -	EC_CODEC_I2S_RX_SET_GAIN =3D 0x2,
> -	EC_CODEC_I2S_RX_GET_GAIN =3D 0x3,
> -	EC_CODEC_I2S_RX_SET_SAMPLE_DEPTH =3D 0x4,
> -	EC_CODEC_I2S_RX_SET_DAIFMT =3D 0x5,
> -	EC_CODEC_I2S_RX_SET_BCLK =3D 0x6,
> +	EC_CODEC_I2S_RX_SET_SAMPLE_DEPTH =3D 0x2,
> +	EC_CODEC_I2S_RX_SET_DAIFMT =3D 0x3,
> +	EC_CODEC_I2S_RX_SET_BCLK =3D 0x4,
>  	EC_CODEC_I2S_RX_SUBCMD_COUNT,
>  };
> =20
> @@ -4521,8 +4551,6 @@ struct __ec_align4 ec_param_ec_codec_i2s_rx {
>  	union {
>  		struct ec_param_ec_codec_i2s_rx_set_sample_depth
>  				set_sample_depth_param;
> -		struct ec_param_ec_codec_i2s_rx_set_gain
> -				set_gain_param;
>  		struct ec_param_ec_codec_i2s_rx_set_daifmt
>  				set_daifmt_param;
>  		struct ec_param_ec_codec_i2s_rx_set_bclk
> @@ -4530,11 +4558,6 @@ struct __ec_align4 ec_param_ec_codec_i2s_rx {
>  	};
>  };
> =20
> -struct __ec_align1 ec_response_ec_codec_i2s_rx_get_gain {
> -	uint8_t left;
> -	uint8_t right;
> -};
> -
>  /***********************************************************************=
******/
>  /* System commands */
> =20
> diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_=
codec.c
> index 179fa77291cd..c19c7fe42e2e 100644
> --- a/sound/soc/codecs/cros_ec_codec.c
> +++ b/sound/soc/codecs/cros_ec_codec.c
> @@ -64,12 +64,12 @@ static int dmic_get_gain(struct snd_kcontrol *kcontro=
l,
>  		snd_soc_kcontrol_component(kcontrol);
>  	struct cros_ec_codec_priv *priv =3D
>  		snd_soc_component_get_drvdata(component);
> -	struct ec_param_ec_codec_i2s_rx p;
> -	struct ec_response_ec_codec_i2s_rx_get_gain r;
> +	struct ec_param_ec_codec_dmic p;
> +	struct ec_response_ec_codec_dmic_get_gain r;
>  	int ret;
> =20
> -	p.cmd =3D EC_CODEC_I2S_RX_GET_GAIN;
> -	ret =3D send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_I2S_RX,
> +	p.cmd =3D EC_CODEC_DMIC_GET_GAIN;
> +	ret =3D send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_DMIC,
>  				   (uint8_t *)&p, sizeof(p),
>  				   (uint8_t *)&r, sizeof(r));
>  	if (ret < 0)
> @@ -93,17 +93,17 @@ static int dmic_put_gain(struct snd_kcontrol *kcontro=
l,
>  	int max_dmic_gain =3D control->max;
>  	int left =3D ucontrol->value.integer.value[0];
>  	int right =3D ucontrol->value.integer.value[1];
> -	struct ec_param_ec_codec_i2s_rx p;
> +	struct ec_param_ec_codec_dmic p;
> =20
>  	if (left > max_dmic_gain || right > max_dmic_gain)
>  		return -EINVAL;
> =20
>  	dev_dbg(component->dev, "set mic gain to %u, %u\n", left, right);
> =20
> -	p.cmd =3D EC_CODEC_I2S_RX_SET_GAIN;
> +	p.cmd =3D EC_CODEC_DMIC_SET_GAIN;
>  	p.set_gain_param.left =3D left;
>  	p.set_gain_param.right =3D right;
> -	return send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_I2S_RX,
> +	return send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_DMIC,
>  				    (uint8_t *)&p, sizeof(p), NULL, 0);
>  }
> =20
> @@ -120,6 +120,29 @@ static struct snd_kcontrol_new dmic_controls[] =3D {
>  				   dmic_gain_tlv),
>  };
> =20
> +static int dmic_probe(struct snd_soc_component *component)
> +{
> +	struct cros_ec_codec_priv *priv =3D
> +		snd_soc_component_get_drvdata(component);
> +	struct device *dev =3D priv->dev;
> +	int ret, val;
> +	struct soc_mixer_control *control;
> +
> +	ret =3D device_property_read_u32(dev, "max-dmic-gain", &val);
> +	if (ret) {
> +		dev_err(dev, "Failed to read 'max-dmic-gain'\n");
> +		return ret;
> +	}
> +
> +	control =3D (struct soc_mixer_control *)
> +		dmic_controls[DMIC_CTL_GAIN].private_value;
> +	control->max =3D val;
> +	control->platform_max =3D val;
> +
> +	return snd_soc_add_component_controls(component,
> +			&dmic_controls[DMIC_CTL_GAIN], 1);
> +}
> +
>  static int i2s_rx_hw_params(struct snd_pcm_substream *substream,
>  			    struct snd_pcm_hw_params *params,
>  			    struct snd_soc_dai *dai)
> @@ -265,25 +288,7 @@ static struct snd_soc_dai_driver i2s_rx_dai_driver =
=3D {
> =20
>  static int i2s_rx_probe(struct snd_soc_component *component)
>  {
> -	struct cros_ec_codec_priv *priv =3D
> -		snd_soc_component_get_drvdata(component);
> -	struct device *dev =3D priv->dev;
> -	int ret, val;
> -	struct soc_mixer_control *control;
> -
> -	ret =3D device_property_read_u32(dev, "max-dmic-gain", &val);
> -	if (ret) {
> -		dev_err(dev, "Failed to read 'max-dmic-gain'\n");
> -		return ret;
> -	}
> -
> -	control =3D (struct soc_mixer_control *)
> -			dmic_controls[DMIC_CTL_GAIN].private_value;
> -	control->max =3D val;
> -	control->platform_max =3D val;
> -
> -	return snd_soc_add_component_controls(component,
> -			&dmic_controls[DMIC_CTL_GAIN], 1);
> +	return dmic_probe(component);
>  }
> =20
>  static const struct snd_soc_component_driver i2s_rx_component_driver =3D=
 {
> --=20
> 2.23.0.700.g56cf767bdb-goog
>=20

--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--MGYHOYXEY6WxJCY8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCXafWjwAKCRBzbaomhzOw
wkqUAQCjNXfPQLx1/7vYnUi8icMjAYjf8Tw1M0WglUob4tOZiwEAq5czQOFBMspS
88RNFvoyz6BQrUNPhAzj9IdQp/eviAI=
=SxxD
-----END PGP SIGNATURE-----

--MGYHOYXEY6WxJCY8--

--===============0893427951407994616==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0893427951407994616==--
