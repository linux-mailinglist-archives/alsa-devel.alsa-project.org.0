Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 555D0DA429
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Oct 2019 05:09:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD5A7166F;
	Thu, 17 Oct 2019 05:08:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD5A7166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571281757;
	bh=APbxzTH+qMpQn+0XxoMUGTX+egJ6T+xL7gv7ASbxTjg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vm9PlRr/pdiQR0IkhXMJ0Oe/NIzQ+EjTI6bBwNL4GgROTwDSKZRP2R6Y/JQH+Dknk
	 IKUbBYV7cWRKdNLYAQnBJhabAhNPvjSqrZm+zBQTslYCMBsZSF506foweQOcLcck7R
	 +QjssCTc145IHcQJlJxt5T5iDGLqluCSQm8affIU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA5F1F804AB;
	Thu, 17 Oct 2019 05:07:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9888CF804AA; Thu, 17 Oct 2019 05:07:29 +0200 (CEST)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id 36ED0F802A0
 for <alsa-devel@alsa-project.org>; Thu, 17 Oct 2019 05:07:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36ED0F802A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="cmOrM9Wh"
Received: by mail-pg1-x542.google.com with SMTP id e13so432799pga.7
 for <alsa-devel@alsa-project.org>; Wed, 16 Oct 2019 20:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KTFtxZWUiTYJpaSQJ40/68ZXAzUIZdoELBfsk84v/dU=;
 b=cmOrM9Whxk4C0Tv6yhZEoY2DaawAKw1kETwNd+i4BmUcvaPI7+ENbykiQEjMddJQ42
 G4OYhCTF/OadnzpUxCReLOtyUR2Tw5/UPtE5GcRoUHm7Z4suC3PZlaIwiKoYj8rkI5Ze
 QczzUmg/Hl6US9GE+v6s3HqZgwk8B//EU5OK6EJxy6Uvt2omRgmeevVMrL03do1FFKnO
 uzBNKi7kDgWU2HH6HZajhf/CrUAd1PLvk18QaRSMCXPmPW8vABifWRIAKMn7BEUGBWex
 Og9A9cJbpaQHWrhZgTUUe9cz+23Y8nF4eRpYhQKWL694fizwd+UWfmRW/xfrxlsoGwY+
 CjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KTFtxZWUiTYJpaSQJ40/68ZXAzUIZdoELBfsk84v/dU=;
 b=f9PPpgODCYoQ/u0WNsyixZ5DTTZth/xwzrMg33PCmHP/wdypxuIZ90XYOppNIlCONC
 EhGfjyoMHM/qavPicBQlB75wJueUP6sZ/VMx5i58a2ZsPkwpNCzofExgasYtGBzogbOu
 GZ0PVsolKjnqh1AM1FSDSq8xsYudQ2zJ5+UVYoE2eL6WfpBngamPR1xezy7OnTD+Va3W
 hZrR+jT0/oezGLc93IYNTpj3yWB6V+sLLjwVnWMu6XGw6mEr92d4JCJXK2v9kCsa+exL
 Y/0of79v8d+fnB1pFzXJrJX3htsFQgQDZ/ELidm+RhAqer89MnnVDJR+kCHzLhqUmeA6
 wDOA==
X-Gm-Message-State: APjAAAUPVx1/2jBQvSXgoKrc+X+ZcPCdPpmF1HMOIdTsezcHRfQG7JBn
 uqoIF4+LAYFwpqPRksXi3+Goiw==
X-Google-Smtp-Source: APXvYqw/b14sA0N/0grsvirjONGwcqjGUivg3DcbdXo//zLwyjheZwvwp1kvH4lfXI7SGA9nRI9z6Q==
X-Received: by 2002:a63:5423:: with SMTP id i35mr1638361pgb.128.1571281643033; 
 Wed, 16 Oct 2019 20:07:23 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:bc61:d85d:eb16:9036])
 by smtp.gmail.com with ESMTPSA id e10sm569507pfh.77.2019.10.16.20.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 20:07:22 -0700 (PDT)
Date: Wed, 16 Oct 2019 20:07:17 -0700
From: Benson Leung <bleung@google.com>
To: Tzung-Bi Shih <tzungbi@google.com>
Message-ID: <20191017030717.GC72195@google.com>
References: <20191014102022.236013-1-tzungbi@google.com>
 <20191014180059.05.Id4657c864d544634f2b5c1c9b34fa8232ecba44d@changeid>
MIME-Version: 1.0
In-Reply-To: <20191014180059.05.Id4657c864d544634f2b5c1c9b34fa8232ecba44d@changeid>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: gwendal@google.com, devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 cychiang@google.com, drinkcat@google.com, robh+dt@kernel.org,
 broonie@kernel.org, enric.balletbo@collabora.com, dgreid@google.com,
 Rob Herring <robh@kernel.org>
Subject: Re: [alsa-devel] [PATCH v3 05/10] ASoC: cros_ec_codec: read max
 DMIC gain from EC codec
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
Content-Type: multipart/mixed; boundary="===============6346997756669809984=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6346997756669809984==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZmUaFz6apKcXQszQ"
Content-Disposition: inline


--ZmUaFz6apKcXQszQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2019 at 06:20:17PM +0800, Tzung-Bi Shih wrote:
> Read max DMIC gain from EC codec instead of DTS.  Also removes the
> dt-binding of max-dmic-gain.
>=20
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>

Acked-By: Benson Leung <bleung@chromium.org>


> ---
>  .../bindings/sound/google,cros-ec-codec.txt   |  4 +-
>  .../linux/platform_data/cros_ec_commands.h    | 43 +++++++++++----
>  sound/soc/codecs/cros_ec_codec.c              | 53 ++++++++++++++-----
>  3 files changed, 73 insertions(+), 27 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/sound/google,cros-ec-codec=
=2Etxt b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.txt
> index 1084f7f22eea..0ce9fafc78e2 100644
> --- a/Documentation/devicetree/bindings/sound/google,cros-ec-codec.txt
> +++ b/Documentation/devicetree/bindings/sound/google,cros-ec-codec.txt
> @@ -1,4 +1,4 @@
> -* Audio codec controlled by ChromeOS EC
> +Audio codec controlled by ChromeOS EC
> =20
>  Google's ChromeOS EC codec is a digital mic codec provided by the
>  Embedded Controller (EC) and is controlled via a host-command interface.
> @@ -9,7 +9,6 @@ Documentation/devicetree/bindings/mfd/cros-ec.txt).
>  Required properties:
>  - compatible: Must contain "google,cros-ec-codec"
>  - #sound-dai-cells: Should be 1. The cell specifies number of DAIs.
> -- max-dmic-gain: A number for maximum gain in dB on digital microphone.
> =20
>  Example:
> =20
> @@ -21,6 +20,5 @@ cros-ec@0 {
>  	cros_ec_codec: ec-codec {
>  		compatible =3D "google,cros-ec-codec";
>  		#sound-dai-cells =3D <1>;
> -		max-dmic-gain =3D <43>;
>  	};
>  };
> diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/lin=
ux/platform_data/cros_ec_commands.h
> index 3ca0fa9e92a7..21db0d4d4025 100644
> --- a/include/linux/platform_data/cros_ec_commands.h
> +++ b/include/linux/platform_data/cros_ec_commands.h
> @@ -4530,30 +4530,53 @@ struct __ec_align4 ec_response_ec_codec_get_shm_a=
ddr {
>  #define EC_CMD_EC_CODEC_DMIC 0x00BD
> =20
>  enum ec_codec_dmic_subcmd {
> -	EC_CODEC_DMIC_SET_GAIN =3D 0x0,
> -	EC_CODEC_DMIC_GET_GAIN =3D 0x1,
> +	EC_CODEC_DMIC_GET_MAX_GAIN =3D 0x0,
> +	EC_CODEC_DMIC_SET_GAIN_IDX =3D 0x1,
> +	EC_CODEC_DMIC_GET_GAIN_IDX =3D 0x2,
>  	EC_CODEC_DMIC_SUBCMD_COUNT,
>  };
> =20
> -struct __ec_align1 ec_param_ec_codec_dmic_set_gain {
> -	uint8_t left;
> -	uint8_t right;
> +enum ec_codec_dmic_channel {
> +	EC_CODEC_DMIC_CHANNEL_0 =3D 0x0,
> +	EC_CODEC_DMIC_CHANNEL_1 =3D 0x1,
> +	EC_CODEC_DMIC_CHANNEL_2 =3D 0x2,
> +	EC_CODEC_DMIC_CHANNEL_3 =3D 0x3,
> +	EC_CODEC_DMIC_CHANNEL_4 =3D 0x4,
> +	EC_CODEC_DMIC_CHANNEL_5 =3D 0x5,
> +	EC_CODEC_DMIC_CHANNEL_6 =3D 0x6,
> +	EC_CODEC_DMIC_CHANNEL_7 =3D 0x7,
> +	EC_CODEC_DMIC_CHANNEL_COUNT,
> +};
> +
> +struct __ec_align1 ec_param_ec_codec_dmic_set_gain_idx {
> +	uint8_t channel; /* enum ec_codec_dmic_channel */
> +	uint8_t gain;
>  	uint8_t reserved[2];
>  };
> =20
> +struct __ec_align1 ec_param_ec_codec_dmic_get_gain_idx {
> +	uint8_t channel; /* enum ec_codec_dmic_channel */
> +	uint8_t reserved[3];
> +};
> +
>  struct __ec_align4 ec_param_ec_codec_dmic {
>  	uint8_t cmd; /* enum ec_codec_dmic_subcmd */
>  	uint8_t reserved[3];
> =20
>  	union {
> -		struct ec_param_ec_codec_dmic_set_gain
> -				set_gain_param;
> +		struct ec_param_ec_codec_dmic_set_gain_idx
> +				set_gain_idx_param;
> +		struct ec_param_ec_codec_dmic_get_gain_idx
> +				get_gain_idx_param;
>  	};
>  };
> =20
> -struct __ec_align1 ec_response_ec_codec_dmic_get_gain {
> -	uint8_t left;
> -	uint8_t right;
> +struct __ec_align1 ec_response_ec_codec_dmic_get_max_gain {
> +	uint8_t max_gain;
> +};
> +
> +struct __ec_align1 ec_response_ec_codec_dmic_get_gain_idx {
> +	uint8_t gain;
>  };
> =20
>  /***********************************************************************=
******/
> diff --git a/sound/soc/codecs/cros_ec_codec.c b/sound/soc/codecs/cros_ec_=
codec.c
> index c19c7fe42e2e..3d4f9e82d6e9 100644
> --- a/sound/soc/codecs/cros_ec_codec.c
> +++ b/sound/soc/codecs/cros_ec_codec.c
> @@ -65,18 +65,26 @@ static int dmic_get_gain(struct snd_kcontrol *kcontro=
l,
>  	struct cros_ec_codec_priv *priv =3D
>  		snd_soc_component_get_drvdata(component);
>  	struct ec_param_ec_codec_dmic p;
> -	struct ec_response_ec_codec_dmic_get_gain r;
> +	struct ec_response_ec_codec_dmic_get_gain_idx r;
>  	int ret;
> =20
> -	p.cmd =3D EC_CODEC_DMIC_GET_GAIN;
> +	p.cmd =3D EC_CODEC_DMIC_GET_GAIN_IDX;
> +	p.get_gain_idx_param.channel =3D EC_CODEC_DMIC_CHANNEL_0;
>  	ret =3D send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_DMIC,
>  				   (uint8_t *)&p, sizeof(p),
>  				   (uint8_t *)&r, sizeof(r));
>  	if (ret < 0)
>  		return ret;
> +	ucontrol->value.integer.value[0] =3D r.gain;
> =20
> -	ucontrol->value.integer.value[0] =3D r.left;
> -	ucontrol->value.integer.value[1] =3D r.right;
> +	p.cmd =3D EC_CODEC_DMIC_GET_GAIN_IDX;
> +	p.get_gain_idx_param.channel =3D EC_CODEC_DMIC_CHANNEL_1;
> +	ret =3D send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_DMIC,
> +				   (uint8_t *)&p, sizeof(p),
> +				   (uint8_t *)&r, sizeof(r));
> +	if (ret < 0)
> +		return ret;
> +	ucontrol->value.integer.value[1] =3D r.gain;
> =20
>  	return 0;
>  }
> @@ -94,15 +102,24 @@ static int dmic_put_gain(struct snd_kcontrol *kcontr=
ol,
>  	int left =3D ucontrol->value.integer.value[0];
>  	int right =3D ucontrol->value.integer.value[1];
>  	struct ec_param_ec_codec_dmic p;
> +	int ret;
> =20
>  	if (left > max_dmic_gain || right > max_dmic_gain)
>  		return -EINVAL;
> =20
>  	dev_dbg(component->dev, "set mic gain to %u, %u\n", left, right);
> =20
> -	p.cmd =3D EC_CODEC_DMIC_SET_GAIN;
> -	p.set_gain_param.left =3D left;
> -	p.set_gain_param.right =3D right;
> +	p.cmd =3D EC_CODEC_DMIC_SET_GAIN_IDX;
> +	p.set_gain_idx_param.channel =3D EC_CODEC_DMIC_CHANNEL_0;
> +	p.set_gain_idx_param.gain =3D left;
> +	ret =3D send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_DMIC,
> +				   (uint8_t *)&p, sizeof(p), NULL, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	p.cmd =3D EC_CODEC_DMIC_SET_GAIN_IDX;
> +	p.set_gain_idx_param.channel =3D EC_CODEC_DMIC_CHANNEL_1;
> +	p.set_gain_idx_param.gain =3D right;
>  	return send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_DMIC,
>  				    (uint8_t *)&p, sizeof(p), NULL, 0);
>  }
> @@ -125,19 +142,27 @@ static int dmic_probe(struct snd_soc_component *com=
ponent)
>  	struct cros_ec_codec_priv *priv =3D
>  		snd_soc_component_get_drvdata(component);
>  	struct device *dev =3D priv->dev;
> -	int ret, val;
>  	struct soc_mixer_control *control;
> +	struct ec_param_ec_codec_dmic p;
> +	struct ec_response_ec_codec_dmic_get_max_gain r;
> +	int ret;
> =20
> -	ret =3D device_property_read_u32(dev, "max-dmic-gain", &val);
> -	if (ret) {
> -		dev_err(dev, "Failed to read 'max-dmic-gain'\n");
> -		return ret;
> +	p.cmd =3D EC_CODEC_DMIC_GET_MAX_GAIN;
> +
> +	ret =3D send_ec_host_command(priv->ec_device, EC_CMD_EC_CODEC_DMIC,
> +				   (uint8_t *)&p, sizeof(p),
> +				   (uint8_t *)&r, sizeof(r));
> +	if (ret < 0) {
> +		dev_warn(dev, "get_max_gain() unsupported\n");
> +		return 0;
>  	}
> =20
> +	dev_dbg(dev, "max gain =3D %d\n", r.max_gain);
> +
>  	control =3D (struct soc_mixer_control *)
>  		dmic_controls[DMIC_CTL_GAIN].private_value;
> -	control->max =3D val;
> -	control->platform_max =3D val;
> +	control->max =3D r.max_gain;
> +	control->platform_max =3D r.max_gain;
> =20
>  	return snd_soc_add_component_controls(component,
>  			&dmic_controls[DMIC_CTL_GAIN], 1);
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

--ZmUaFz6apKcXQszQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCXafa5QAKCRBzbaomhzOw
wr4mAQDuC5y7ZMEeY8/PgCSIspIVZSHeEdSxMUMU9MJFpkHGnAD/XI/NmylzfEeZ
iMtw43rtMbtr2tTa9rBtrTxQ8eUdgQY=
=42mO
-----END PGP SIGNATURE-----

--ZmUaFz6apKcXQszQ--

--===============6346997756669809984==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6346997756669809984==--
