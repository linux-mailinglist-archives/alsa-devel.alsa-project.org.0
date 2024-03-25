Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2884188B47F
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 23:49:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1F542392;
	Mon, 25 Mar 2024 23:49:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1F542392
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711406997;
	bh=j5QIHPHRdNPGCUAt2I/D/pju3UaGGamlyiXm1vob6Vo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q25lYG31i6ZCpzcsWWkD08WPGS3P+9XaMbJetc44i/YR76WziMaVE8ly60bA7+/nd
	 UTY6cgj1uy3AXmerlbHXDhOvXoWWbI3Bwj5XQUYa5oAsFUYSfDNAAJAmWDfZYDaWMa
	 bv0m7LSa9Sr7/gHj8iXEkp5m8/3K4+Y5hccnjNzI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57419F805A8; Mon, 25 Mar 2024 23:49:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8422CF805A1;
	Mon, 25 Mar 2024 23:49:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B190EF80236; Mon, 25 Mar 2024 23:49:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2D2A9F80074
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 23:49:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D2A9F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ZO8UcII5
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A4FC8611E2;
	Mon, 25 Mar 2024 22:49:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C889CC433C7;
	Mon, 25 Mar 2024 22:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711406953;
	bh=j5QIHPHRdNPGCUAt2I/D/pju3UaGGamlyiXm1vob6Vo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZO8UcII5wtl7nM5TdOwMLKgNWkRgDYHyvG8nUZVCFhWNTzEV4cKEFYGIfxbdamrhR
	 qjri35hpItnkYqurAER9RUQDTpfzbfelz5NIRhpu9AemBkuciNItfQJFW0gdCiQVLv
	 dufWifWKbgY3qwc73DXBQw5T9KAFx4T1mQgLN5j3BWfAsgwG4AVayH9omqFosFPMvE
	 Z9iMaYRiJeYfIteFBEhvo7flqIqxlYV9D1VRRjxqoQP5mGzpv32qPWZJAAiFPJPGO1
	 wqy+4Rsi9EPcRSE+nxQ6hWDPVn+bMN84e/4wlPVPxX7AuZOLYQdB4BBjHaD2S5TK8/
	 5M8VS/uxCWf0A==
Date: Mon, 25 Mar 2024 22:49:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.de,
	Shuming Fan <shumingf@realtek.com>,
	Derek Fang <derek.fang@realtek.com>, Jack Yu <jack.yu@realtek.com>
Subject: Re: [PATCH 0/6] ASoC: rt-sdw: fix locking and improve error logs
Message-ID: <5f39e69c-00ce-4436-ad4c-3edcfcc00e62@sirena.org.uk>
References: <20240325221817.206465-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Sy8oTdvmjq+l7VNK"
Content-Disposition: inline
In-Reply-To: <20240325221817.206465-1-pierre-louis.bossart@linux.intel.com>
X-Cookie: Evil isn't all bad.
Message-ID-Hash: VLJXBQUU5QSV3KE7FYZSDES5KCLXT2K6
X-Message-ID-Hash: VLJXBQUU5QSV3KE7FYZSDES5KCLXT2K6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VLJXBQUU5QSV3KE7FYZSDES5KCLXT2K6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--Sy8oTdvmjq+l7VNK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2024 at 05:18:11PM -0500, Pierre-Louis Bossart wrote:
> Fix a set of problematic locking sequences and update error messages,
> tested on SOF/SoundWire platforms.
>=20
> Pierre-Louis Bossart (6):
>   ASoC: rt5682-sdw: fix locking sequence
>   ASoC: rt711-sdca: fix locking sequence
>   ASoC: rt711-sdw: fix locking sequence
>   ASoC: rt712-sdca-sdw: fix locking sequence
>   ASoC: rt722-sdca-sdw: fix locking sequence
>   ASoC: rt-sdw*: add __func__ to all error logs

Copying some of the Realtek people for review.

--Sy8oTdvmjq+l7VNK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYB/2QACgkQJNaLcl1U
h9BbdAf/Rlmx+L1L98ocIYTDmFklZGo9WLJH92hXP3EDW6n41XfRAqsJoBKfpZ59
h8FLDtUYchrMGqWiHnuEU/1fE+4+OzcBM2R5zxTucMMdR2e9N9PmaVQVW25pVBQH
nSX9wA5qogWzXzbAdjGeO7/r5woUiTDTvMayBY+MrP35cWRD21ymlT95iV+2y4mv
o0Zj3pul3PD4D4X1+T4+f5lGUVHr3VYse0AuiR/WniO8+lBoXtJZzsnQWXYvHgaP
79G/RjYt/03/VErhyV9sG7W0ge0sPAlrSh86vvfomVx8Jd+3jR+gjXORIGk1AmRc
hrcF0UKzAiDqIOt3M6jXpXPvTiW9gA==
=Zgpw
-----END PGP SIGNATURE-----

--Sy8oTdvmjq+l7VNK--
