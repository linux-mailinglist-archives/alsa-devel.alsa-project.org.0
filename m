Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3CA831E55
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jan 2024 18:22:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C3DC1FA;
	Thu, 18 Jan 2024 18:22:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C3DC1FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705598557;
	bh=GrPaueWFVuj2nIlhecpLM8yjOxes4LcyBFVyKWotBuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=s2a5Mus8dZ42PIDJ1Apq4d/qBxUqnPQE6MwB7nFFP+qagZ1lIiL+4sugKdfYUyzWY
	 w09uz1EUtexT6HbfrnF/HHtqyCd3xkBecnTiuJ4VpobVfbg3RTa7mRAAqrZcJi8OTb
	 j3IypZ+vsE3QUf9h5YJSyRkCYGKNRaMFThJEra1w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7318DF8057B; Thu, 18 Jan 2024 18:22:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 29B8CF8057D;
	Thu, 18 Jan 2024 18:22:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 769DBF801F5; Thu, 18 Jan 2024 18:22:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 02AD3F8003A
	for <alsa-devel@alsa-project.org>; Thu, 18 Jan 2024 18:21:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02AD3F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OIZqEuFM
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5150FCE1F98;
	Thu, 18 Jan 2024 17:21:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72D6BC433F1;
	Thu, 18 Jan 2024 17:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705598513;
	bh=GrPaueWFVuj2nIlhecpLM8yjOxes4LcyBFVyKWotBuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OIZqEuFMwThZFV05+1B5orwhq1cMrqpeVflPrts+sYmnqaeg/k9K95cOK5eBQa+L2
	 20ZTDyndZtl4XwGiJq1b0cuOsg/iyIM/wVd8aMi6v8hdU0HA6YQUZ8reepERXH7HbS
	 X6sPtErW1wEWKlZPmr5LVOdvEwuZ03DngA03VRf5XRnfGomBdUSrOeBTkpP/W08/XJ
	 8CwxrvjmCk7w146GTFJgmyCkl2oMa99gVFxn36cO4Vj14hi4wq30cFc8Q8/IPILKQ/
	 fzbKhx0tPhcWBPabKjRk8CzNI1W9rkL0XgRf3kec4GyOVXnJd65j1XmQpZhEd1dgV+
	 CsPiKqj2y/Z0g==
Date: Thu, 18 Jan 2024 17:21:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v3 2/5] ASoC: codecs: wsa883x: lower default PA gain
Message-ID: <dc33e198-e202-4287-960b-7826fb0b455c@sirena.org.uk>
References: <20240118165811.13672-1-johan+linaro@kernel.org>
 <20240118165811.13672-3-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+L9BHQTIa1dUbroA"
Content-Disposition: inline
In-Reply-To: <20240118165811.13672-3-johan+linaro@kernel.org>
X-Cookie: FEELINGS are cascading over me!!!
Message-ID-Hash: IK5TIH5ONUHAKJVNRVJBYOBSRHFZS3NF
X-Message-ID-Hash: IK5TIH5ONUHAKJVNRVJBYOBSRHFZS3NF
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IK5TIH5ONUHAKJVNRVJBYOBSRHFZS3NF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--+L9BHQTIa1dUbroA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 18, 2024 at 05:58:08PM +0100, Johan Hovold wrote:
> The default PA gain is set to a pretty high level of 15 dB. Initialise
> the register to the minimum -3 dB level instead.
>=20
> This is specifically needed to allow machine drivers to use the lowest
> level as a volume limit.

> @@ -722,7 +722,7 @@ static struct reg_default wsa883x_defaults[] =3D {
>  	{ WSA883X_WAVG_PER_6_7, 0x88 },
>  	{ WSA883X_WAVG_STA, 0x00 },
>  	{ WSA883X_DRE_CTL_0, 0x70 },
> -	{ WSA883X_DRE_CTL_1, 0x08 },
> +	{ WSA883X_DRE_CTL_1, 0x1e },

This is broken, the register defaults provided to regmap need to
correspond to whatever the hardware default is since for example a
register cache sync will not write back any default values (as they
should already be there in the hardware).  Anything like this would need
to be done by writes during init.

--+L9BHQTIa1dUbroA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWpXisACgkQJNaLcl1U
h9B1XQf+MDXMPds6Vj+stJmRI6lY95AnzLcfAg38B7M3jFWq3X5LCz+QUUWei/P7
YygtokKnVOMb6pLwvHNI6s51GZQ5hqbmdFFi9mRmamIDeuYKHaOFmo4VB4WrdWoO
AklL4KvrD+3Ju6e0J4mmPjpNFUbxk6WWIKjJ4T/QOCP3PLk4TIw3sT77QMybapbA
/AgS986AbHbyBeqMmJd32I1uSBdHJW61IzKFikT1w17UNLXJMFBHtfmahwuM0aVu
4XMz+1qCqEoN8Oale+5AwJZ4ZtY/tGasp0cTClrIjnCdDO7nsjkEdVY9ZLEnOWg3
BH0YNeBArVibIrpeedgdNqcchmbTew==
=7PAi
-----END PGP SIGNATURE-----

--+L9BHQTIa1dUbroA--
