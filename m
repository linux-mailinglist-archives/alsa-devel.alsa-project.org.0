Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBF3814B1F
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Dec 2023 16:03:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68F9CDEB;
	Fri, 15 Dec 2023 16:03:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68F9CDEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702652598;
	bh=7Uq12NB3Lqmbyv5BBuMWFV0Ip7hUgad8tYf8ESmKAd4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UblZ9XJwi1nAghvfcZTAEiCUSTvyaSvLJWnYtEVeQ2cjtKdt1WXV+HFrfOqE1AlNX
	 TlsnbjTNnU4tprBoiCQvhiiWU24tHYxofwKhE3natkXJGf1t3RFs4JaoHs0ZP2dhb7
	 QMeBZROqESOvogU6oBh72MKqY36N8Po19TX+Qy7Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4A00CF80578; Fri, 15 Dec 2023 16:02:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A2A5F80578;
	Fri, 15 Dec 2023 16:02:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26D20F8016E; Fri, 15 Dec 2023 16:02:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B3F68F8001F
	for <alsa-devel@alsa-project.org>; Fri, 15 Dec 2023 16:02:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3F68F8001F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gmt/0byx
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 59FCBCE2F5A;
	Fri, 15 Dec 2023 15:02:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91D9EC433C7;
	Fri, 15 Dec 2023 15:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702652546;
	bh=7Uq12NB3Lqmbyv5BBuMWFV0Ip7hUgad8tYf8ESmKAd4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gmt/0byxqdwxs1tIKjUxtRAvGv1Lixtlv6Svzfa1IYAnHHWZi12E9s5m0y6sDh+86
	 wnT3cvE3mCaqBEViRK8vFTkffUFmqilB+aEismErN70gta3lMn4YTSyH5UERIwMPEz
	 64RCbSbd9GDfFzmXRtmPlJVCFBC4wHQUBjxSlwxXmO99ikm/s2fhUYfaosusaTLczK
	 jrIyftKCgAS5jDWH04h14OXed/QxqgkA9q0/JDOqB2SFovtYI5lo/x8jjTzlyGdcMi
	 bPmp9pudhOmkdMX58WT49ICJ+Cac5I47zj2AeeTg9uu2ta2AaXcIObAUU4xNxrXvND
	 o9YELesNRPFIA==
Date: Fri, 15 Dec 2023 15:02:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Gergo Koteles <soyer@irl.hu>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH 03/16] ASoC: tas2781: disable regmap regcache
Message-ID: <e5ee2ef9-2cf5-46aa-adae-27040faccc3d@sirena.org.uk>
References: <cover.1701906455.git.soyer@irl.hu>
 <21a183b5a08cb23b193af78d4b1114cc59419272.1701906455.git.soyer@irl.hu>
 <0b836c10-b21b-4275-8dd0-254dd5467497@sirena.org.uk>
 <47097f19398808b64f4cc87c2a3c7cc462fb2416.camel@irl.hu>
 <5f3f0306-799f-4f3b-9e05-fbd300c59d5d@sirena.org.uk>
 <b0ab21657f2e4f0825579de97ca012e294d1e743.camel@irl.hu>
 <bf24488f-e4e1-4d3e-a67e-fe74c05acda4@sirena.org.uk>
 <9a2b85a8a19e002093e2471a97850d26e335900f.camel@irl.hu>
 <5b2eb7eb-761e-406d-8d55-b7ea8cddefa8@sirena.org.uk>
 <f135963cb14d9bef6cddbe0bd1ce0aaa6d4ac7d9.camel@irl.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NJ1n80rz/G09dKBQ"
Content-Disposition: inline
In-Reply-To: <f135963cb14d9bef6cddbe0bd1ce0aaa6d4ac7d9.camel@irl.hu>
X-Cookie: PARDON me, am I speaking ENGLISH?
Message-ID-Hash: 6BXJSNAXICE7DWEN5WWHBLMBVMZ6WSR3
X-Message-ID-Hash: 6BXJSNAXICE7DWEN5WWHBLMBVMZ6WSR3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6BXJSNAXICE7DWEN5WWHBLMBVMZ6WSR3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--NJ1n80rz/G09dKBQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 15, 2023 at 03:42:43PM +0100, Gergo Koteles wrote:
> On Fri, 2023-12-15 at 12:55 +0000, Mark Brown wrote:

> > No, I mean that the amplifiers don't talk to each other at a hardware
> > level and the grouping is all in software.

> No, they don't talk to each other. But they have a global i2c address
> to speed up configuration, but the module doesn't use it yet.

That's hardware level synchronisation between the devices, that makes
all this a bit less horrifying though it seems like a lot of the issues
would go away if the broadcast write address were actually being used
more.

--NJ1n80rz/G09dKBQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmV8anwACgkQJNaLcl1U
h9A4aQf/cqN2aD+4gfz7tn5+zGNcYbOnxBwjcif5LeQFESiiPswlZkYhCE9WaV7T
6TiNXejvAQgg4B68jz095xef6UA3iZLlWiBmIjUywYNHfaODdrn8sYAbvzPwn1gC
zVd2mvNaMpUPfEuvlLinLm4+f5t2Ij5n+6v0yfPPpPgXr+Ej+mpX6hwgeV792uBB
hYoPyJP0pBF30PuIA8Hwh8ur1SmGxEUb/jdud2q9BY3L1tsNPC45LfyeNqyWtCkP
crWfXJzmr99txwkARhkybS8d7vzjuYchJsg6W9oDE0pCUSGPK4Yjz4Duor6Z2qT5
w1lTECv+bXmgRL2bcs5iAmKwl+K+KQ==
=bLE1
-----END PGP SIGNATURE-----

--NJ1n80rz/G09dKBQ--
