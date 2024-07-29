Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E32D93EE9B
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jul 2024 09:38:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4030AE8;
	Mon, 29 Jul 2024 09:37:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4030AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722238689;
	bh=rzRnBMAhujuPKKOHrgTq3gIWFwMYpwLxxoLovIeXZQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QJoExllqFTzXCkJS6eW8EALBYHtQnqDLrzO7NHJ+TWsTYMTM8KbIxOia7iMEM97kt
	 H5SgDfM8ag4Bsb7KLjFlEcIbWz9WGnzP9NmAIlFAxta9+k2+0LrO3HUj1YFL4U554q
	 isMn4aYFHwkCACZpsQRm0BFqKcbFfG58cfUbteuU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0252F805B4; Mon, 29 Jul 2024 09:37:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0451BF805B2;
	Mon, 29 Jul 2024 09:37:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2070F802DB; Mon, 29 Jul 2024 09:35:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 936FFF80269
	for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2024 09:30:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 936FFF80269
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ucw.cz header.i=@ucw.cz header.a=rsa-sha256
 header.s=gen1 header.b=c6btUDAK
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 29E971C0099; Mon, 29 Jul 2024 09:30:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1722238220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zTd2KlVuLTT6I8hyqN4ws/kahOabpp6ySXuCYxyp4UE=;
	b=c6btUDAKxgnJ/3zWUO+AS/0e7p5fQlDuqBAebmmjiRJ7qXbmUtfGLS7ZXgUXnid6z9ZT29
	ilQ1vI9ylveQDXZggrse+QlAbskpQRjzt8xYkqw6IFpw6LM93YWVWd4S4acCoWec0HtaVS
	rsKIR2EZx6pZQ1QU3r2u4rypxHe7Q0c=
Date: Mon, 29 Jul 2024 09:30:19 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Mark Brown <broonie@kernel.org>, cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com, peter.ujfalusi@linux.intel.com,
	ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
	perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 5.10 02/11] ASoC: Intel: sof_sdw: Add quirks for
 some new Dell laptops
Message-ID: <ZqdFCzqqkEWFl8tA@duo.ucw.cz>
References: <20240728160954.2054068-1-sashal@kernel.org>
 <20240728160954.2054068-2-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QS4mOibUoRUapvlO"
Content-Disposition: inline
In-Reply-To: <20240728160954.2054068-2-sashal@kernel.org>
Message-ID-Hash: 7K6TIXJMSIRKADZRUU7C6LYNRDJW2UZ2
X-Message-ID-Hash: 7K6TIXJMSIRKADZRUU7C6LYNRDJW2UZ2
X-MailFrom: pavel@ucw.cz
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7K6TIXJMSIRKADZRUU7C6LYNRDJW2UZ2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--QS4mOibUoRUapvlO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: Charles Keepax <ckeepax@opensource.cirrus.com>
>=20
> [ Upstream commit 91cdecaba791c74df6da0650e797fe1192cf2700 ]
>=20
> Add quirks for some new Dell laptops using Cirrus amplifiers in a bridge
> configuration.

This is queued for 5.10, but not for 6.1. Mistake?

Best regards,
								Pavel

> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Link: https://msgid.link/r/20240527193552.165567-11-pierre-louis.bossart@=
linux.intel.com
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  sound/soc/intel/boards/sof_sdw.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/so=
f_sdw.c
> index 25bf73a7e7bfa..ad3694d36d969 100644
> --- a/sound/soc/intel/boards/sof_sdw.c
> +++ b/sound/soc/intel/boards/sof_sdw.c
> @@ -234,6 +234,22 @@ static const struct dmi_system_id sof_sdw_quirk_tabl=
e[] =3D {
>  		},
>  		.driver_data =3D (void *)(RT711_JD2_100K),
>  	},
> +	{
> +		.callback =3D sof_sdw_quirk_cb,
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0CE3")
> +		},
> +		.driver_data =3D (void *)(SOF_SIDECAR_AMPS),
> +	},
> +	{
> +		.callback =3D sof_sdw_quirk_cb,
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0CE4")
> +		},
> +		.driver_data =3D (void *)(SOF_SIDECAR_AMPS),
> +	},
>  	{}
>  };
> =20

--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--QS4mOibUoRUapvlO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZqdFCwAKCRAw5/Bqldv6
8jZSAKCFb+KQBMbfj8kZhJLkt4A7CAUFdwCeKq4szws9C2/4fnVjlejX07kGBqs=
=5VIV
-----END PGP SIGNATURE-----

--QS4mOibUoRUapvlO--
