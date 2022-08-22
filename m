Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF6859C5C6
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Aug 2022 20:10:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDF4A950;
	Mon, 22 Aug 2022 20:09:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDF4A950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661191818;
	bh=9uFjr12ZJn72bY423Jrkibrsve+4lfScTWjUh9RqsRI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=grbzb5qzift4zL/tysXEggmX9FRw0Dnm/ZKx7oAELixkDNKiRutBFHoBoGJD/0Y8T
	 BcBNg3+mG0ou2ukaOnMDM/lOXNZBaDYw5SeJpsS6MGoQOmK9J26FPpxa8cGq3FnGW6
	 Mkhau7G1Gs/TANGeUgqQqZcgAyhjpvw3CotvLY3M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D19DF800A7;
	Mon, 22 Aug 2022 20:09:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DF65F8026A; Mon, 22 Aug 2022 20:09:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4EE5F800A7
 for <alsa-devel@alsa-project.org>; Mon, 22 Aug 2022 20:09:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4EE5F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="e0Bt+a2u"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 65754B81683;
 Mon, 22 Aug 2022 18:09:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB3BEC433D7;
 Mon, 22 Aug 2022 18:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661191751;
 bh=9uFjr12ZJn72bY423Jrkibrsve+4lfScTWjUh9RqsRI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e0Bt+a2uu1M8rVndbEeewsHyZWzL5KYHdHqi8MfclDkvtyfyASHoUNJwZdEoohdI5
 Sd5gJdHnoSXBCEOeXbrmxtY6oq2syrjf3WwAYfNtkNKV/CYVXIJjDgbTf9eq/Y/rY0
 vIYQKx38AhJBm6yd1Php5fcdUHwqnPB+D7WQnxyGsqeqaQzEc1S4aAvv/wu4G1/pRz
 c1gN5Y63VU+zlFjvkxD6xJUh+/Y8F8PKjYbZBxoT/AjCJbTvhfaetP6rLCoOX8UVG8
 8bdtY+C/VAlGqcUKyHl+UQ3SXcRpeKicdX9YHU9bky4xoUut+u6YSKBaxNAQm0nRix
 OJ53yJHtLY63A==
Date: Mon, 22 Aug 2022 19:09:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v2] ASoC: codecs: add uspport for the TI SRC4392 codec
Message-ID: <YwPGQZHs1o0jsv2m@sirena.org.uk>
References: <20220808214028.2502801-1-flatmax@flatmax.com>
 <202208090909.Pg0BZGie-lkp@intel.com>
 <YvvbKry5FVFbNdcI@dev-arch.thelio-3990X>
 <f8439531-897a-c25a-688b-be01290b006d@flatmax.com>
 <Yv0NLxzwqdBaZ3Jf@dev-arch.thelio-3990X>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6vU7YlowxUaBWkHl"
Content-Disposition: inline
In-Reply-To: <Yv0NLxzwqdBaZ3Jf@dev-arch.thelio-3990X>
X-Cookie: Do not write in this space.
Cc: alsa-devel@alsa-project.org, llvm@lists.linux.dev, kbuild-all@lists.01.org,
 kernel test robot <lkp@intel.com>, Matt Flax <flatmax@flatmax.com>
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


--6vU7YlowxUaBWkHl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 17, 2022 at 08:45:51AM -0700, Nathan Chancellor wrote:
> On Wed, Aug 17, 2022 at 03:44:33PM +1000, Matt Flax wrote:
> > On 17/8/22 04:00, Nathan Chancellor wrote:

> > > In the final commit, there is a 'break' here. Should it be a 'return =
0'
> > > instead? Or should there be a different fix for these warnings?

> > The state of DIR PLL registers aren't important if the user doesn't spe=
cify
> > a known mclk frequency.=A0 The implication is that the DIR will not fun=
ction,
> > however that is already implied by the user lacking to specify a known =
mclk
> > frequency.

> > The other functions on the chip (port A/B I2S, SRC, DIT, etc) will beha=
ve as
> > per usual, only the DIR will be dysfunctional.

> So I suppose there is little point to all of the calls to regmap_write()
> and regmap_update_bits() in the default case then, meaning a 'return 0'
> would be appropriate? Sorry, I am having a hard time parsing what should
> be done about the warnings, which are fatal for allmodconfig due to
> CONFIG_WERROR.

Are either of you still looking at fixing this?

--6vU7YlowxUaBWkHl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMDxkAACgkQJNaLcl1U
h9C73wf/RgzOmsSZTp0Dl2xyhY28TyLQJ3Prc306CZBASMpf/slGe7F+A6tTJU1N
lFmnFIRhJYOS3NwqDrOZhJrB10MondVH4DKMjjmjZRlcPZPUo/nIU3EFQqYYm1R/
VtXqOnXEgjbke8d8YI4En+2RoX0WerlLXnANA8YsRpDCCDt2fj/tCKoZeWVx7UsE
65mnCelZqCDszFoUZJUor7BO8uzJPlxFSqnl8rT+iqYBfpwa9CmExw5CwmYTPuUu
Gqx7nJdlkaHKgc/XXPPiyNO/79vQYgAWhpxXg3vHkmv6KDOBEbe5VSXXujAyHvn9
VQryX9/4cKi+z/EzMSZW0oiUew0hdg==
=enod
-----END PGP SIGNATURE-----

--6vU7YlowxUaBWkHl--
