Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C39305BED26
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 20:51:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53960852;
	Tue, 20 Sep 2022 20:50:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53960852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663699877;
	bh=dOYzWRMQWTrZbt6u0ynOkDPBKV+hg47zMmG+PHOrkLw=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M7Tfq55syFI/HO2jUGp16S3PvuaFGgC2aRlAnd4KEer3OELNWWPznBd36ivQaoEBo
	 qEq5MZKrNWDjXAtrJQvJpZKYtQ7LNM66Q/EyYQBzXaG7aFUSFufBKwVuPvXyzSSUPE
	 odJ4P8FAst5HruiPo2MpgdszZJOX7xiWG7eA+2PY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A08B6F8012B;
	Tue, 20 Sep 2022 20:50:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1E0BF80155; Tue, 20 Sep 2022 20:50:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79EA3F8012B
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 20:50:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79EA3F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KVbuXEeq"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9B0FE62BAE;
 Tue, 20 Sep 2022 18:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92B5DC433D6;
 Tue, 20 Sep 2022 18:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663699812;
 bh=dOYzWRMQWTrZbt6u0ynOkDPBKV+hg47zMmG+PHOrkLw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KVbuXEeqQCjsPYr4c9Ry528aOYGUQGjvDXKCIx5VMK62fu3CmQKR6qNhFA2F1OwZP
 Lid16WWkb8EhJ5Bk+EjHqs2jILZqSKYFa1LJMaKBWJ2ITh8GTLYcCf9UaG9Uqj92Yb
 HA3rsYTEu61DYQUEu3a9VqOBDJdoQfIwBHUQ5XW5aFHKwHMEE5lA1bELKCQ/Mc8dBv
 CO5EDc+Z4yHHdA0w9ShA59XGpTPzasybk5vClgqiFMHKhhW/qBTAuvEAPkGEO8Miq7
 AxJrab5JSNX6GWhKyHYI4+0TJWYE+qfaH7uZCJ+t6RFTmk+kCTNvhRsciw+Vq323Jz
 JRblVB8kx5DDQ==
Date: Tue, 20 Sep 2022 19:50:09 +0100
From: Mark Brown <broonie@kernel.org>
To: "Limonciello, Mario" <mario.limonciello@amd.com>
Subject: Re: [PATCH] ASoC: amd: yc: Add Lenovo Yoga Slim 7 Pro X to quirks
 table
Message-ID: <YyoLYe9uGNnfl1iA@sirena.org.uk>
References: <20220920171320.7776-1-mario.limonciello@amd.com>
 <YyoBjHftjG/ACAuJ@sirena.org.uk>
 <f4fea2ca-00ae-ba85-b666-9fa267961add@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="3GEW1jVz+nbFLVcE"
Content-Disposition: inline
In-Reply-To: <f4fea2ca-00ae-ba85-b666-9fa267961add@amd.com>
X-Cookie: One FISHWICH coming up!!
Cc: Travis Glenn Hansen <travisghansen@yahoo.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 Sebastian S <iam@decentr.al>, Xiaoyan Li <lxy.lixiaoyan@gmail.com>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--3GEW1jVz+nbFLVcE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 20, 2022 at 01:09:45PM -0500, Limonciello, Mario wrote:

> As I mentioned below the cutline it's on top of the other commit on the list
> touching the same code:

> https://lore.kernel.org/alsa-devel/20220917070847.14346-1-lxy.lixiaoyan@gmail.com/

That looks like it's some patch which wasn't even sent to me...

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

--3GEW1jVz+nbFLVcE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMqC2AACgkQJNaLcl1U
h9BA7Qf/fhD4DzTx3lYUaQtUnZc84inux3PG7lz1R+vDNWj72rYGyvR2xyT7CZuO
NRJ/twpIxq9Ny3+TofsUXVi4+h5BFpRx90mJEsvOeZZdCGLFSqxb1YuswBbGCXKQ
4T8ST7NPSdUChItvFW7ZpnaWKnT78WK2sxYrHTI3D7xkGk3XE7QV74gh0mjWIQqN
NIjybZCL2qmRnFWt1eYskWizgreuUT0VekJFacKl1SPMOUKABH695h1xlD1j46ym
G5vf5gWAclU0yXYgXGNyv27pPix/8YKB5yzgKKr5ZuDevrtqdvaw13/d9yXGdc/j
/paSqx8Z1xhM8e83eG+wxN0UJj5rJw==
=qdjQ
-----END PGP SIGNATURE-----

--3GEW1jVz+nbFLVcE--
