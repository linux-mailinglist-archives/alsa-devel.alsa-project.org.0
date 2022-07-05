Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E749567477
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jul 2022 18:33:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F64016CE;
	Tue,  5 Jul 2022 18:32:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F64016CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657038811;
	bh=ELTHKRlGh2TFVwLiCwnTc8wlXdeQ+pD6rYi563gQQ6k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uyS6R3IP41UahG+J3s4/2JUtXr+2T1Zsvsgfzt2xCqjd7zslnpnqmAo25Y/VSTMlk
	 ojk4swNitprHzyt8QUmTe3rNUk0fOGM8edGrSlCY8YhWHT110nNmu7zJNbtl5+glgf
	 6o5Qj9bYp5YnXAaT0VsgJVB11ucAoqe1LWTr95nI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E67AF80212;
	Tue,  5 Jul 2022 18:32:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4E7EF8015B; Tue,  5 Jul 2022 18:32:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70712F8012A
 for <alsa-devel@alsa-project.org>; Tue,  5 Jul 2022 18:32:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70712F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mgT7xZwl"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E286C61BC8;
 Tue,  5 Jul 2022 16:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDC40C341C7;
 Tue,  5 Jul 2022 16:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657038744;
 bh=ELTHKRlGh2TFVwLiCwnTc8wlXdeQ+pD6rYi563gQQ6k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mgT7xZwlPFkbHzVDL4FfLEz+K3+F0eqFtJeBULjpARFv44dCZBP8Tm6Jfvg5o9/AH
 6zvB4+zEv9Y40JhDbbNDKTmOzP50QvvQdLfjaZVVXMBJr6q2E+f8XHTIDrBzc00Obc
 lyDwMpFlmhH3HQB8FrHioEdFazMU3NPn2KoSlFzIDzdxPm/DKcjY7kKg27PJ+m3kd4
 IPvWjPL5pHPcNMJx1tyLZRFC1H0+8S481xJSzRo8ZaJQRPdv/MMfZpN3MBORe3SI8D
 9QZJR9HqKtsQNcBV+p03sNN8eg/2A2wAPsc/iVY6+wxAMEg+YtKCEQ+fHPVX54z2iB
 cp6E822nyYKxQ==
Date: Tue, 5 Jul 2022 17:32:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Subject: Re: equalizer cfg in max98088 driver
Message-ID: <YsRnkxcBWCgtRIn7@sirena.org.uk>
References: <20220705075500.GA1987744@tom-ThinkPad-T14s-Gen-2i>
 <YsQd7mub0KJdYUDw@sirena.org.uk>
 <20220705162956.GA2676656@tom-ThinkPad-T14s-Gen-2i>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="LoH50+dDeMaAE155"
Content-Disposition: inline
In-Reply-To: <20220705162956.GA2676656@tom-ThinkPad-T14s-Gen-2i>
X-Cookie: Only God can make random selections.
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>
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


--LoH50+dDeMaAE155
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 05, 2022 at 06:29:56PM +0200, Tommaso Merciai wrote:
> On Tue, Jul 05, 2022 at 12:18:06PM +0100, Mark Brown wrote:

> > There's plenty of examples of equalisers in the code already.  I don't
> > know how this specific device works but generally these are either
> > exposed as a series of volume like sliders or as binary controls.  This
> > doesn't restrict people to settings from the firmware, making
> > development of new configuraitons much easier.

> Thanks for your reply.
> I meant somethings like this:

I understood what you meant, like I say this should be a runtime control.

--LoH50+dDeMaAE155
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLEZ5IACgkQJNaLcl1U
h9AiKQf+McrQlmTh3R3eoil6IjzxS5r8PRIouf93sdRTuAKMBxPiVDQyl+zbeywm
976+jJEsliyD7V3tJqBivh1bNsbn0Ai3WJ+5wpKqOy0LZdFvCyQgWI+84BrGBzKz
dkITYXpzVNFOChRNaWjh/LOgpebSATjvwUFpcM0oSxygn8Kez7sdXgZA8Mzxj7Ws
37/OUPASXphF2cYpiKVx2N+FN63S0a5ZWoRrkd136Zf83bwnzsAZ7jgy3vFwfVd3
jy6s6biSmxzAEiV2YLvPpJtH3z558y3ILqmtV1HbjtU1LrB9f9sL0F+iBIov66R2
FpKjgyoX0TEJ7ku7aCKiB5LV32v/2A==
=nQpp
-----END PGP SIGNATURE-----

--LoH50+dDeMaAE155--
