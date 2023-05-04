Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE556F6D08
	for <lists+alsa-devel@lfdr.de>; Thu,  4 May 2023 15:40:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 656721F9B;
	Thu,  4 May 2023 15:39:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 656721F9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683207612;
	bh=EBCeEkKBKZh7TzZoU15KoO4iQvBZ3RDH7HkzJ/gpjuM=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tKPUfIbaBq0ede9FkuoR4NoSymzFpoDDf8ummvtW3hzYspUf2zphfEABQjMUn5TfJ
	 6RP0s+zlH69jzISKHqiP6F8ZfZetfFsg2JAl7/yr2hfZEJjKks5VY0IvOS+BezfG86
	 4i7xbJvuQjG6scMlJtEvcLoHR/5GET1Rjn8iAdNQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C0350F80529;
	Thu,  4 May 2023 15:39:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98F3AF8052D; Thu,  4 May 2023 15:39:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5BAC2F80520
	for <alsa-devel@alsa-project.org>; Thu,  4 May 2023 15:39:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BAC2F80520
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=C0hrSeXB
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BA1C76177A;
	Thu,  4 May 2023 13:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDDB6C433EF;
	Thu,  4 May 2023 13:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683207547;
	bh=EBCeEkKBKZh7TzZoU15KoO4iQvBZ3RDH7HkzJ/gpjuM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C0hrSeXBWPbpxIfnIVlhJFqbN7odAPY/ldY/Ly8L0RiLUEszWgTjNkB/fJKZNJr3O
	 AhA4TbzapWLDYNpIjBa6eqgODB4CEqkMBRJF+ik9bHAGCE5yKmauxlIeK8xdFS7bHp
	 yVgJBLbmyGV9uH1iObYbCj8X4L2cg5CFRq9RdIh1yilRbfQ9ZunX/6IHFniHneewea
	 eNJx7Tj9V25rczVEwz0nzqdv/x36ZmZptWkKLZBbYMWa3ATlm2QDaU7hVnCs7IpixW
	 XAzf0gyc9vQonWJRL7XG6PnzBMsUiyBD011fDXPUW4DufRQeVLDtL//JLOgd6Qw/ii
	 lvPfoYvPgXlOg==
Date: Thu, 4 May 2023 22:39:04 +0900
From: Mark Brown <broonie@kernel.org>
To: David Rau <David.Rau.opensource@dm.renesas.com>
Subject: Re: [PATCH] ASoC: da7219: Add Jack insertion detection polarity
 selection
Message-ID: <ZFO1eLaz11iLo1Td@finisterre.sirena.org.uk>
References: <20230504082218.24059-1-David.Rau.opensource@dm.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RTvU0e3/Lk+teMVd"
Content-Disposition: inline
In-Reply-To: <20230504082218.24059-1-David.Rau.opensource@dm.renesas.com>
X-Cookie: Avoid contact with eyes.
Message-ID-Hash: GSXPQMSQ3X5XTN4OINL33JJURHIVVUYQ
X-Message-ID-Hash: GSXPQMSQ3X5XTN4OINL33JJURHIVVUYQ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: support.opensource@diasemi.com, lgirdwood@gmail.com, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GSXPQMSQ3X5XTN4OINL33JJURHIVVUYQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--RTvU0e3/Lk+teMVd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 04, 2023 at 08:22:18AM +0000, David Rau wrote:

> +choice
> +	bool "DA7219 Jack insertion detection polarity selection"
> +	default DA7219_DEFAULT_JACK_INSERTION_POLARITY if (SND_SOC_DA7219)
> +
> +config DA7219_DEFAULT_JACK_INSERTION_POLARITY
> +    bool "Default polarity"
> +	depends on SND_SOC_DA7219
> +    help
> +	  Select this option if your DA7219 codec with default Jack insertion d=
etection polarity (Low).
> +
> +config DA7219_INVERTED_JACK_INSERTION_POLARITY
> +    bool "Inverted polarity"
> +	depends on SND_SOC_DA7219
> +    help
> +	  Select this option if your DA7219 codec with inverted Jack insertion =
detection polarity (High).

I would expect these things to be fixed for a given board and therefore
configured with a DT property rather than a kernel config.  It should be
possible to use the same kernel on multiple boards.

> +
> +endchoice
> +
> +endif # SND_SOC_DA7219
> +
>  config SND_SOC_DA732X
>  	tristate
>  	depends on I2C
> diff --git a/sound/soc/codecs/da7219-aad.c b/sound/soc/codecs/da7219-aad.c
> index 993a0d00bc48..9d16112cff6b 100644
> --- a/sound/soc/codecs/da7219-aad.c
> +++ b/sound/soc/codecs/da7219-aad.c
> @@ -879,6 +879,18 @@ static void da7219_aad_handle_gnd_switch_time(struct=
 snd_soc_component *componen
>  	}
>  }
> =20
> +static void da7219_aad_handle_polarity(struct snd_soc_component *compone=
nt)
> +{
> +	snd_soc_component_write(component, 0xF0, 0x8B);
> +
> +	if (IS_ENABLED(CONFIG_DA7219_DEFAULT_JACK_INSERTION_POLARITY))
> +		snd_soc_component_write(component, 0x75, 0x80);
> +	else if (IS_ENABLED(CONFIG_DA7219_INVERTED_JACK_INSERTION_POLARITY))
> +		snd_soc_component_write(component, 0x75, 0x00);
> +
> +	snd_soc_component_write(component, 0xF0, 0x00);
> +}
> +
>  /*
>   * Suspend/Resume
>   */
> @@ -955,8 +967,12 @@ int da7219_aad_init(struct snd_soc_component *compon=
ent)
>  	snd_soc_component_update_bits(component, DA7219_ACCDET_CONFIG_1,
>  			    DA7219_BUTTON_CONFIG_MASK, 0);
> =20
> +	/* Handle the default ground switch delay time */
>  	da7219_aad_handle_gnd_switch_time(component);
> =20
> +	/* Handle the Jack insertion detection polarity */
> +	da7219_aad_handle_polarity(component);
> +
>  	da7219_aad->aad_wq =3D create_singlethread_workqueue("da7219-aad");
>  	if (!da7219_aad->aad_wq) {
>  		dev_err(component->dev, "Failed to create aad workqueue\n");
> --=20
> 2.17.1
>=20

--RTvU0e3/Lk+teMVd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRTtXcACgkQJNaLcl1U
h9BROAf/R5bC3tWhqt5LiZEGi6Yfu2H9vpKtyvR4cgFX3QyBZJ7HM12S8ZQpU+KJ
6LsYk5SKJnC5IzYu8CjM9ueep1VaCPy8iyMvF9CvtHPs4qVXUI8pcRRv9lbUX5kT
MfvoxcDtfgd4JaYKDQOTj0c9us1Hf0Bhn6M7g7quEMmRB8N9lUMNyeiRK9gg6L8S
kJrOAY8Wr343zHW72bTDZRNs6RQepytulq50yHmGYkRht62Er2Nrl30w6OQ7ubFo
q0WccPcGOND0E2aMUM2/Ci2XEP31S6QXKHHFLDF58BDW8BaYjrfSig6Y+oRLiXhH
0WZArGUQB7GdDW/KQVEIuA6m18KQ5g==
=9rld
-----END PGP SIGNATURE-----

--RTvU0e3/Lk+teMVd--
