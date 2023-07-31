Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 099D1769F5E
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 19:22:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D6A31E7;
	Mon, 31 Jul 2023 19:21:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D6A31E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690824127;
	bh=mftMsYiz9ZJ4o2udCBL/LK6NqmaRzMvUrLtaxc6+ExM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KoDOkaHrwdS4tcfDaZSh+zNIKOzbwmntoACuIzL7TxmhNVwRK8ojZx8C46hZHvlIc
	 VEV/RqXM2StTqOquVjMybw+UM8j+W0xR1COxsym7ztAz8PWS+zh5IguZFOVYctJESX
	 y90aoWF7R0IZmMRi6Ed2Xl3oXcEbLFgXq4oIdWUU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DCBD3F80520; Mon, 31 Jul 2023 19:21:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FF29F80163;
	Mon, 31 Jul 2023 19:21:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F9C8F8016D; Mon, 31 Jul 2023 19:21:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C8741F8015B
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 19:21:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8741F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SIuH/vWC
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6234E6124B;
	Mon, 31 Jul 2023 17:21:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57DD2C433C8;
	Mon, 31 Jul 2023 17:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690824060;
	bh=mftMsYiz9ZJ4o2udCBL/LK6NqmaRzMvUrLtaxc6+ExM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SIuH/vWC0Z//bAHS2Y+ReRPL+XB6AshDM0VvyslpumMHkUh8btF1eBGmB+FVDNt2W
	 qm0tF94AwLtjbT/FtCTVDhM46eCHLOAXbsZYUTJtv7LyR/HrEWEphMZnZ7qKlGxkS0
	 1olJzc+vrxjV93iG+bTpCewIXkEnpr3fmc7cUV+zDrgq77F7ANAF1s+FHa8JxRJTQf
	 CrczT9BjPicytrwXkddCggE8BewLAKcejC+rpo1OwtcrZN13PtffSpA6r7b7VrYut0
	 PUhb+fLowx3LEBj6zKV+E8RhBYkBXxXGSeGYfN2RjgUK1+3pzQnmilsKv3Ax/zlPWN
	 1igMAnbI+UiIw==
Date: Mon, 31 Jul 2023 18:20:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andrey Utkin <andrey_utkin@fastmail.com>,
	Anton Sviridenko <anton@corp.bluecherry.net>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Ismael Luceno <ismael@iodev.co.uk>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-media@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 00/24] ALSA: Generic PCM copy ops using sockptr_t
Message-ID: <b906d60b-ece4-45b5-8167-2046c8dc00f4@sirena.org.uk>
References: <20230731154718.31048-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qMccpUQ9T4oLw/AQ"
Content-Disposition: inline
In-Reply-To: <20230731154718.31048-1-tiwai@suse.de>
X-Cookie: Single tasking: Just Say No.
Message-ID-Hash: LXHYELGL4QUJ3NP7XIGZGWDYBYN3I6TA
X-Message-ID-Hash: LXHYELGL4QUJ3NP7XIGZGWDYBYN3I6TA
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LXHYELGL4QUJ3NP7XIGZGWDYBYN3I6TA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--qMccpUQ9T4oLw/AQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 31, 2023 at 05:46:54PM +0200, Takashi Iwai wrote:

> this is a patch set to clean up the PCM copy ops using sockptr_t as a
> "universal" pointer, inspired by the recent patch from Andy
> Shevchenko:
>   https://lore.kernel.org/r/20230721100146.67293-1-andriy.shevchenko@linux.intel.com

> Even though it sounds a bit weird, sockptr_t is a generic type that is
> used already in wide ranges, and it can fit our purpose, too.  With
> sockptr_t, the former split of copy_user and copy_kernel PCM ops can
> be unified again gracefully.

It really feels like we ought to rename, or add an alias for, the type
if we're going to start using it more widely - it's not helping to make
the code clearer.

--qMccpUQ9T4oLw/AQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTH7XUACgkQJNaLcl1U
h9DwvAf+MAtXkGii5+gytkR+D3QTsuA6sY3aBk9dt1dWPILYWbXmsLkkIbGCtvq+
KIRLogTAKw9JbmzspD9GP/aj49lZi+dMH3wj9bfNKb9tJ1kfu5sSa8Bmr73fU/gy
tSYcApUWSN+uSIqVD6z7zDJj+BOa0gIUUQNbJxaPxp8YfsNTZAgCtB6forR7hI3h
OrPzmZkmMgkVjA1N/rHbWeubemc68OgSpUdUO1JF8wrGySsBmwXr/5VoVbBex+cK
Xg1f+g849RnopbiTFg1H7lfkp6wk1nQPWbtdq7y0Ws2HUkNqHS3Kmm4oVamjvlwP
ZmnL1wekh8FNsZS/jWPCv7xMdle/MQ==
=2oaj
-----END PGP SIGNATURE-----

--qMccpUQ9T4oLw/AQ--
