Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C55D66FD3C8
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 04:17:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD5A81076;
	Wed, 10 May 2023 04:16:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD5A81076
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683685049;
	bh=U6aBhk/Q3uUnMk2O77E0L4T+7y5ww55Q2QBKyfZlPTc=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=emoE7fJx8no672gcwcnG6mS1DF6ETsvYYcjv36FA/AjSbSNLw8G8yZuFgt3np/Ev8
	 BbeD98wrftBNJ3oxAXBHSyJMWASYGCNOfrH+T4/3aKNRgFM51z76Bm5g5/o21Gu7fi
	 m8rY5zFeDBvV28fg6Szr8l2t4s91/Z+U3BWZqRpw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17D65F80310;
	Wed, 10 May 2023 04:16:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9AD0F8032D; Wed, 10 May 2023 04:16:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C6F38F802E8
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 04:16:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6F38F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tDCHGHa1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 15034638C2;
	Wed, 10 May 2023 02:16:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 694C8C433D2;
	Wed, 10 May 2023 02:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683684990;
	bh=U6aBhk/Q3uUnMk2O77E0L4T+7y5ww55Q2QBKyfZlPTc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tDCHGHa1qYxnTXFB9bLTFz3ZHJo8VAlcbicvPIppEAzkjn81E/RYICcNwlrTXS7/B
	 uRj0Ye9WtzJkHlYqxCnoihSBRvP7GvAHmpVqW0WoxUi0eLiytI0L5h6JCzuaCnHxWO
	 2SOj0DD3FSyqSxNYCIWlr1xs81rnVgtnKrMF0l/VRuW9Nk+kc25yOpstF6Dm2hQJ8w
	 Zy8Tc8kWUygooW27RI8L9+P6W7rxQQ9H7Agj3FRWdWwVxpOy+qJJqdAtIXL2Yp/Xg7
	 aNI62wk69cxWOEImf+ALmOuABH3AOoUmCxdeYPTJStTkSsjtf2d2RxRf1hG+VU68Y2
	 AKOEO/Xrtww2A==
Date: Wed, 10 May 2023 11:16:27 +0900
From: Mark Brown <broonie@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: Re: [PATCH 2/2] ASoC: ssm3515: Add new amp driver
Message-ID: <ZFr+e+bM86Rwj2LH@finisterre.sirena.org.uk>
References: <20230509163828.86003-1-povik+lin@cutebit.org>
 <20230509163828.86003-2-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cxYPFokHHwYbjCKb"
Content-Disposition: inline
In-Reply-To: <20230509163828.86003-2-povik+lin@cutebit.org>
X-Cookie: Avoid contact with eyes.
Message-ID-Hash: SZTHARBBE3VNB67AG7OAY4TUQGG3L4CL
X-Message-ID-Hash: SZTHARBBE3VNB67AG7OAY4TUQGG3L4CL
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>, asahi@lists.linux.dev,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SZTHARBBE3VNB67AG7OAY4TUQGG3L4CL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--cxYPFokHHwYbjCKb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 09, 2023 at 06:38:28PM +0200, Martin Povi=C5=A1er wrote:

> +static int ssm3515_setup(struct snd_soc_component *component)
> +{
> +	struct ssm3515_data *data =3D
> +			snd_soc_component_get_drvdata(component);
> +	int ret;
> +
> +	ret =3D snd_soc_component_update_bits(component, SSM3515_GEC,
> +			SSM3515_GEC_ANA_GAIN,
> +			FIELD_PREP(SSM3515_GEC_ANA_GAIN, data->ana_gain));
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Start out muted */
> +	ret =3D snd_soc_component_update_bits(component, SSM3515_DAC,
> +			SSM3515_DAC_MUTE, SSM3515_DAC_MUTE);
> +	if (ret < 0)
> +		return ret;

Why are we not using the chip defaults here?  We use those for most
things as what's appropraite for one user might not be appropriate for
another and it's easier to agree to follow what the chip does than to
select things.  There's some exceptions like for zero cross options but
not typically for gains and mutes.

> +static int ssm3515_probe(struct snd_soc_component *component)
> +{
> +	struct ssm3515_data *data =3D
> +			snd_soc_component_get_drvdata(component);
> +	int ret;
> +
> +	ret =3D ssm3515_reset(component);
> +	if (ret < 0)
> +		return ret;
> +	regmap_reinit_cache(data->regmap, &ssm3515_i2c_regmap);
> +
> +	return ssm3515_setup(component);
> +}

We don't normally reset things on component probe, only on bus level
probe...

--cxYPFokHHwYbjCKb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRa/nsACgkQJNaLcl1U
h9AK2Qf/bWiXFzpCWnZoxxEX3Xk0rhx83Vd2brRM+A9E0ZKdJuHIjfT9W31cWaMH
SrpE3KzlpOaGr6c1s89QhCT8/EA0gNUBcrOOkiALAlkQVMPrDaUq890JRPvmj40B
NL4Eh4Y2JeW8vcFL0v66NbpTTlko6z+M5vX9geeQMcujYzzf4XynRk2VvOOaaXim
aRuM7+COfpF5mwUfOY7AMNjbTtO0L60++LcU04oH2kUnEpOyAy5PPcn1oFg8DirS
ioTe1/rpDimXpt6+vp/VzMSF0StpKCstmx95qPxJxv8C3w6nqWOGhcwYVBunD9vW
/MS3OS0aTvfjAvOoYz2w4oli8jc+jA==
=tvnt
-----END PGP SIGNATURE-----

--cxYPFokHHwYbjCKb--
