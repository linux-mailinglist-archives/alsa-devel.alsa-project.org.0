Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8F232A426
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 16:37:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95E071749;
	Tue,  2 Mar 2021 16:36:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95E071749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614699422;
	bh=evihsePfhb5iz7KiIdDtFh5xwLZ4gVVRpTp/7GQQkEo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iED99YUHh1tepsZXXj505ugIqj57CLRYtCcbJNkE/XK5PtEQD51+Z5t1MVR7iuT27
	 SrEzU7tPrzEw9MgpeDrYN3tGeDPd5uHKiJ/jaFJ5JSpFv8S5V3b9YH2AS22xaEEHyp
	 pj+wtW6hsZBW4oSVeR4AwoJR9PZC6VUfuDG+mII8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3D46F80271;
	Tue,  2 Mar 2021 16:35:31 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62D0CF80269; Tue,  2 Mar 2021 16:35:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18E3EF80227
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 16:35:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18E3EF80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="da/tXKKm"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E22E564EFC;
 Tue,  2 Mar 2021 15:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614699321;
 bh=evihsePfhb5iz7KiIdDtFh5xwLZ4gVVRpTp/7GQQkEo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=da/tXKKmKA5x34tzcosh3fEjxa9BO19Iv67BGVSACHJTTPurT+Nb661CFpRo7la2K
 JjVBNjUJYhpQjlQX5+593FSbszng1qKiSwhus2Ecp4LqpLqSl3T+vPygOhlGyozHTQ
 F4mBAW7Nn6aP7r2SVlPPkamy0IxI7eQzV7MiYEbU+LyS8tJwmcAu4xaemgLF8LKvTP
 Fpl8IgTCTWEtrldMAyhBJMTvBiG+pWzmc74USP1YHa0aKb1OcmJ+TSxJUuAKFq1+BT
 F/Tyj4kBrFLh01gdomNGL6iotljSRHttU5X0CtvpH/D1NgVCDLJri5HNXJghJOaaGM
 tUavrFodYoToQ==
Date: Tue, 2 Mar 2021 15:34:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH 0/7] ALSA/ASoC/SOF/SoundWire: fix Kconfig issues
Message-ID: <20210302153414.GH4522@sirena.org.uk>
References: <20210302003125.1178419-1-pierre-louis.bossart@linux.intel.com>
 <s5htuptfyae.wl-tiwai@suse.de> <YD5IChh6Xubim//Q@vkoul-mobl>
 <s5hk0qpfwfo.wl-tiwai@suse.de>
 <20210302150337.GG4522@sirena.org.uk>
 <s5heegxfuvv.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="AqCDj3hiknadvR6t"
Content-Disposition: inline
In-Reply-To: <s5heegxfuvv.wl-tiwai@suse.de>
X-Cookie: Friction is a drag.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Vinod Koul <vkoul@kernel.org>, arnd@arndb.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
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


--AqCDj3hiknadvR6t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 02, 2021 at 04:16:52PM +0100, Takashi Iwai wrote:

> Sorry, copy&paste error, it's  not with "/fixes" but "-fixes".

>   git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git tags/sound-sdw-kconfig-fixes

Thanks, got it now.

--AqCDj3hiknadvR6t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmA+WvUACgkQJNaLcl1U
h9DU5gf9GsCf/upfZgBYL337GF3ZBMl9t+dKpYhE/P565+R+3HskFyW7Q7ARjNLJ
2by4jbbJlUqxI1QDRYfcoGSMA2w2v/zCSQS5lum0uAGtn2g2uR6MaR3dAoVwzJn0
/jF8tOFPCAF3SoB0KvRpjSAfbkcBl7WeD2dBslfK22ZxFoT/9A55n0YEu7lNzYzC
xjhFrph4gLvFvZq8Hg24HEggqCM9+ITyHDotwvK2ShpgUjzxePvTjlifVmH98xl+
gS6m/T6jEnGyqEpfBu0e0ApGG1+fPeWg1+Vms3zIR2TYCuenPiflSmjZ5nZHSkdO
8ftlN2G2eExscDdjAdlV6efUilvSGw==
=V6/e
-----END PGP SIGNATURE-----

--AqCDj3hiknadvR6t--
