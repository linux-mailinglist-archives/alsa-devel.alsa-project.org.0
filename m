Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64994575F58
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jul 2022 12:27:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C845618B6;
	Fri, 15 Jul 2022 12:26:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C845618B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657880828;
	bh=4qDYU+0yzXqXOE+KJ7vxXemGz2ME/t1/0EmqotRWG60=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kLK93/xIwk6JqYL7bulirifabmGYjDrcV6B7JLvOYW12pjqWIgtYFcwzpjQs0M7j9
	 52CvmA7vMIspiJ0Yr/nikc8vaBcJS/ahFCiOLKPFKZqD/TMZL8+PoUl1YTb/fA8/z9
	 1StK8LSUKuub7pB6aACmUHcuz+BVuxn59w0aGxLQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39B2FF80212;
	Fri, 15 Jul 2022 12:26:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F9C2F8015B; Fri, 15 Jul 2022 12:26:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C54FFF8014E
 for <alsa-devel@alsa-project.org>; Fri, 15 Jul 2022 12:26:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C54FFF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jOmGAOKz"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 82B25B82B67;
 Fri, 15 Jul 2022 10:26:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D935DC34115;
 Fri, 15 Jul 2022 10:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657880761;
 bh=4qDYU+0yzXqXOE+KJ7vxXemGz2ME/t1/0EmqotRWG60=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jOmGAOKz18t0vAVrK8dHZfDCOUyXS/E7XShvv3IvLbsWwl3J43q59//IYimTKu+uK
 wM5pg5fpJg5I2Mo6l5LEPkJF2LGA7bFNYCQQOKZku+st/U85NNb0b6+Gj4CZ/8mUdR
 rbLlPy89z3Sq1P+6eiuL9IB12/KUj61DhIK0+hnJZH3zfYFD22rdxENQuhvcX18TZE
 Cqh9WtGmxvphXAD/U8pUquqYsFjUXz/ItfpTkN9f0MU/QZuHOWIcdSxQWnP3iH4DLZ
 z0VvGL5eAyqq4JtcovhloRf63TycAat0IZn4jnDhbMVC8WH9qs5mJEaZTEKaW2WACF
 OGsb8XZPfuGCQ==
Date: Fri, 15 Jul 2022 11:25:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [GIT PULL] ASoC fixes for v5.19-rc4-2
Message-ID: <YtFAtL9hdT57Hb4n@sirena.org.uk>
References: <20220714180007.C9835C34114@smtp.kernel.org>
 <87edymx4bn.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="70YtuBT7hRcMt5WF"
Content-Disposition: inline
In-Reply-To: <87edymx4bn.wl-tiwai@suse.de>
X-Cookie: You dialed 5483.
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>
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


--70YtuBT7hRcMt5WF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 15, 2022 at 08:44:44AM +0200, Takashi Iwai wrote:
> Mark Brown wrote:

> > As covered in the second revert commit in this pull request the version
> > of the BCLK muxing that's in v5.19 is causing issues, let's just revert
> > it and wait for the more complete support in v5.20 instead.

> Hmm, this revert itself is fine, but the PR contains way too many
> changes than expected as a *very* late stage.  Are all those really
> mandatory as 5.19 fixes?  e.g. regressions that have been introduced
> in 5.19-rc or such?  Otherwise I prefer cherry-picking only the really
> needed one for now for the merge to 5.19-final.

Ah, I suspect what's gone wrong here is that my script generated it
against Linus' tree but you'd not yet sent your pull request since the
last time I sent you changes so it has all the changes you already have
in it.  Regenerating it against asoc-fix-v5.19-rc4 gives:

The following changes since commit fc976f5629afb4160ee77798b14a693eac903ffd:

  ASoC: Intel: Skylake: Correct the handling of fmt_config flexible array (2022-07-07 17:16:40 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v5.19-rc4-2

for you to fetch changes up to 1e347f861da8ddb17e1d1b3113cb6c188e0de3e5:

  ASoC: rockchip-i2s: Undo BCLK pinctrl changes (2022-07-14 13:25:52 +0100)

----------------------------------------------------------------
ASoC: Drop Rockchip BCLK management for v5.19

As covered in the second revert commit in this pull request the version
of the BCLK muxing that's in v5.19 is causing issues, let's just revert
it and wait for the more complete support in v5.20 instead.

----------------------------------------------------------------
Alexandru Elisei (1):
      ASoC: rockchip: i2s: Fix NULL pointer dereference when pinctrl is not found

Mark Brown (1):
      ASoC: rockchip-i2s: Undo BCLK pinctrl changes

 sound/soc/rockchip/rockchip_i2s.c | 160 ++++++++------------------------------
 1 file changed, 31 insertions(+), 129 deletions(-)

--70YtuBT7hRcMt5WF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLRQLMACgkQJNaLcl1U
h9Bdpgf/Xtti12EjVH3KK6o1DJYXKwmndU8dz+slyjiN5dBFH+iNfd41gFdeROc0
wutYJV8B3SojtwHEZdnGEziBkHFAgh/jaBcJk/kcc2aS/vNfsPvTeaPaBGsnpg8+
c9J/PwGwOf2dJLCkJlkvUTlh6COKr8tfyPC8rc9E+O3vEunCELI97umBankTeEwf
J1bwwYQAMeE0hs0vSv+ZeV966a+Mj0MyzvFZ4Hb3zOpK+zhiIQ5aHf4ThOyL66+S
gdPiT3EHclOLkkfxR88pL38X++ANZMeFQpJOl7KtQRF+AqvtEyCLcdyYsYTCWP2g
o+1yVo9cIwxFvq9Sx+DhBC+f1Ynwcw==
=6RZx
-----END PGP SIGNATURE-----

--70YtuBT7hRcMt5WF--
