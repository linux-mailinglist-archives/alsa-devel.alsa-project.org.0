Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B63E469766
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Dec 2021 14:45:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E331F203B;
	Mon,  6 Dec 2021 14:45:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E331F203B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638798351;
	bh=DH/1E2aEG+DDCn10mi2ptuhKAVdBQHO6wYJ3zjF+k+w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j2KgNQgV+6RCk6BvLpzPkDdgKC/JFMQrwO8bEQE4AqF+T8oyBRtm+T98UV0egNNOU
	 uARnDleeazRvFAeZSBE85LPd3XPr0Z7Df5A0CNZPa6jMa+TlJmMslNZxl1nUXn3Uya
	 jUXax1KNmmCmJ+Qi23aGegZTyXlIOLRa/fPGbFBc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FB74F804ED;
	Mon,  6 Dec 2021 14:44:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9CC35F804EC; Mon,  6 Dec 2021 14:44:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3750BF804E4
 for <alsa-devel@alsa-project.org>; Mon,  6 Dec 2021 14:44:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3750BF804E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="S9Iu9ds9"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CC287B810BF;
 Mon,  6 Dec 2021 13:44:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 126ABC341C1;
 Mon,  6 Dec 2021 13:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638798264;
 bh=DH/1E2aEG+DDCn10mi2ptuhKAVdBQHO6wYJ3zjF+k+w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S9Iu9ds9WgpqIffhqbQmtsvewqlLWpG+Vcxp3BtCsKJoh7MIgb4nujTnIL56gpiho
 l4Us0fI/Q7bElG/D2aQP9kzrTduP1XGxjea5MCwcOjv+VZCNRJMGl7XVJh+wKCTF2R
 7TC7mHyxWGvicYC4sYa4STZdav9wTU6JFpRU+PxCckja88RbbJAHuxE4f7n1ruGumR
 4a/DjOdzCH2GIInEI56gk9XODHrsvr42Al+12TLiBtKK2Djrk6G+BnGzZ41o8Jjjfg
 LhSee6xn/jbOEtUcDEkTpf2ZNUSquQvhMvxZTpIu350zAosrqZqJPr/D+aWjFjAp7t
 GJVn74iXvVo5w==
Date: Mon, 6 Dec 2021 13:44:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH] kselftest: alsa: Add simplistic test for ALSA mixer
 controls kselftest
Message-ID: <Ya4Ts7t2xFbgkvJq@sirena.org.uk>
References: <20211203193311.211400-1-broonie@kernel.org>
 <s5hlf0yqelf.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="iAbjRbCp6ILDN069"
Content-Disposition: inline
In-Reply-To: <s5hlf0yqelf.wl-tiwai@suse.de>
X-Cookie: You will soon forget this.
Cc: alsa-devel@alsa-project.org, Shuah Khan <shuah@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, linux-kselftest@vger.kernel.org
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


--iAbjRbCp6ILDN069
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 06, 2021 at 10:15:08AM +0100, Takashi Iwai wrote:

> Thanks for the patch!  That's one of my long-standing TODO, and you
> solved it :)

Well, not quite scratched my own itch yet - testing that events are
generated would do most of that for me, the events just aren't used for
a lot of users so easy to miss.

> Through a quick glance, the code looks fine.  But a general question
> is how to deal with the external library setup for kselftest.  Ideally
> speaking, the include and the library paths should be managed via
> pkgconfig, but it'll make things a bit more complicated, of course.
> And what if the system has no libasound?  Will we make it mandatory?

This is already an issue for other kselftests - the expectation is that
the users will figure out how to install whatever the dependencies are,
or if they don't want to build a given kselftest for whatever reason
will skip it (there's options for that in the kselftest build setup
stuff, it skips BPF since it requires really bleeding edge stuff so it's
not like you can install a distro package).  From that point of view
it's probably better to error out so people see that there's a test they
could be running.  Unlike with Kconfig symbols there's no way to
programatically specify what's needed (I didn't add any Kconfig
dependency since alsa-lib works fine on systems without ALSA and really
it's a system specific driver that's needed for this to be useful).

I can add pkg-config usage in there easily enough, though I'm not sure
I've ever seen alsa-lib installed anywhere other than the default system
path.

--iAbjRbCp6ILDN069
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGuE7MACgkQJNaLcl1U
h9DR5gf9H2EprYp+yVwhbVQYrj3tEJiN2ghTbXYDXR3i4izpwYkVTigu0bqdqEU3
Woa0cQo/Ds/19IR8f5FVPJJ5jSSUrT0Kd9UKBgm/ww0SEhjGXMhL1XJUAkeuhG3E
c9M3vePuMbyZfQya40wTLFRy/kuX1L4yjc2iYYJawudzTbojULcTH26XTGqpz4uU
pa6QrAArwBLkoy5qPFEJn0BzdiQzJ0FWOyyFkEAaydzGyQ2yV9xZeCTUq8aURZXW
6QjYc2xT3ZZs/lNDJ8DAwF8UTw36oSFzeYUqsmayUD87vN7MchR3GD1qD1z5q1Ny
pwK9Le8zmIhyWKNVlngXA2BZ+5Uj4w==
=T1Af
-----END PGP SIGNATURE-----

--iAbjRbCp6ILDN069--
