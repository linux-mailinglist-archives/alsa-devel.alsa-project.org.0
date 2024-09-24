Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB0B984150
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2024 11:00:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6C48E65;
	Tue, 24 Sep 2024 11:00:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6C48E65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727168431;
	bh=TLrkBFemfelhj1kiLCKREGu0cq6ty1MyW7kJpC8QUvY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rxHQjWPxWgtAnv7YYwghU8CjarxDScFfe7mKVZC5gnj34AK7FeCGNPj24MQeqt/GC
	 Y6Try2veetpqM47flzYYe8W45qAPI4umvb+ojqPJGgaWsI38lmo5m/obC5n6fJC9si
	 Zk91U+SnnGktrMvs9CHOO8eFpPHbp0L2sramin9g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB8CFF805B6; Tue, 24 Sep 2024 11:00:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8764EF805B1;
	Tue, 24 Sep 2024 10:59:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91B18F802DB; Tue, 24 Sep 2024 10:59:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C86C5F8010B
	for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2024 10:59:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C86C5F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gZ+eP0No
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4A6F95C5B62;
	Tue, 24 Sep 2024 08:59:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7829FC4CEC4;
	Tue, 24 Sep 2024 08:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727168391;
	bh=TLrkBFemfelhj1kiLCKREGu0cq6ty1MyW7kJpC8QUvY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gZ+eP0NoOfTUNQ66K/UIvuJN7Z3zonhi9zGaftGYcUuK2cGkUyHjbq4THcYa8Wq4T
	 YwMj9qxVtq7i8TqRZbvWH1mSsXpXs9a0EdXBYrZcLZgGTtaXSBDUIYIhZsAfcn5NtC
	 Q2I8e9nJHzk6CY1ccc57tTmLlByHTC7LsoK45I+75817AWfYA6+DEKw5BTcguQgJO0
	 Y7JbPcwppqCSTucP/rhmG/JQHU2sjVEwrCp51PjqXM+M+VeYPwtdHgSX8oA60PXyLu
	 SPg/ohOUFBU3qtZkdu9aETjIHGzNCWqar0lSkAW1/CJn3zhAUvFoWvz3D6OSBm7JAx
	 Rkx+BzaQzd9Pw==
Date: Tue, 24 Sep 2024 10:59:48 +0200
From: Mark Brown <broonie@kernel.org>
To: Andrei Simion <andrei.simion@microchip.com>
Cc: claudiu.beznea@tuxon.dev, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: atmel: mchp-pdmc: Skip ALSA restoration if
 substream runtime is uninitialized
Message-ID: <ZvJ_ZFpIiRpD_uzO@finisterre.sirena.org.uk>
References: <20240924081237.50046-1-andrei.simion@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2muQ5kptOkRWm/ZR"
Content-Disposition: inline
In-Reply-To: <20240924081237.50046-1-andrei.simion@microchip.com>
X-Cookie: Editing is a rewording activity.
Message-ID-Hash: I2JCK3VUUVHP3X4VJBUQLK2NUTHWBQPU
X-Message-ID-Hash: I2JCK3VUUVHP3X4VJBUQLK2NUTHWBQPU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I2JCK3VUUVHP3X4VJBUQLK2NUTHWBQPU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--2muQ5kptOkRWm/ZR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2024 at 11:12:38AM +0300, Andrei Simion wrote:

> Update the driver to prevent alsa-restore.service from failing when
> reading data from /var/lib/alsa/asound.state at boot. Ensure that the
> restoration of ALSA mixer configurations is skipped if substream->runtime
> is NULL.

> +++ b/sound/soc/atmel/mchp-pdmc.c
> @@ -302,6 +302,9 @@ static int mchp_pdmc_chmap_ctl_put(struct snd_kcontro=
l *kcontrol,
>  	if (!substream)
>  		return -ENODEV;
> =20
> +	if (!substream->runtime)
> +		return 0; /* just for avoiding error from alsactl restore */
> +

This then means that control writes are just discarded which presumably
is going to upset things if they actually saved a value here.  Why is
that a good choice, rather than either fixing the race so the card
doesn't come up too early or removing the need for the runtime?

--2muQ5kptOkRWm/ZR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbyf4MACgkQJNaLcl1U
h9Aj1wf9GqdcLwKUvMJqTKMQBr+Edfse4rBuLYpHdRKFkhzXt8AU5W9nPdEuQmC0
AMYaMRv1ego8rh+/0Ie8uhvT8Pn3iXSscTilOmGdqARKSrVY1BjvKT9emM/fElT8
/rFFhWqfCc7nUI+0ICvuDizt6SCd3o9HuyQGSHso1diRrLFWTK0ZCfGhL127ibV5
AQG9W52l/WZ6E5Ter27tUYTzyh5Mh5xGeIxlr49tsZk7kW653CHb3lwYDkKIsQFk
lfeafCz5f8fv6AtlwJ7LSXawYM/9Wx67WawjCpOc9hwP+eCCLnMemZzIDug1Db0s
+bIiayW9Pjhpa7gkDR/JRrfvlj2TvQ==
=AXYI
-----END PGP SIGNATURE-----

--2muQ5kptOkRWm/ZR--
