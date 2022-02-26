Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B6B4C52AD
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Feb 2022 01:23:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B42351AA6;
	Sat, 26 Feb 2022 01:22:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B42351AA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645835026;
	bh=s0GBcJuitIjqpP4/QATQJPWXnWLxwF9b1R4Q1QKBcPk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b2IMb22ukcB00+b+4LSIEWZ++OZx7F5PCpb9rIgr0rK4wzB/YIpmMVb6PezrWRhkz
	 b1b2Jvf301YzNF+whiciEnzMfuCAqVAXWQGaIXIK52C1cAWiBZvQtokgJ06C+NvOo0
	 v/b+OdhK87jp0q/YEGEsMDYM7xEn+UpUE/pEX86A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 365CDF80118;
	Sat, 26 Feb 2022 01:22:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4018F80132; Sat, 26 Feb 2022 01:22:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B489F80118
 for <alsa-devel@alsa-project.org>; Sat, 26 Feb 2022 01:22:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B489F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="P6HArTdG"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8819A61DC9;
 Sat, 26 Feb 2022 00:22:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7171EC340E7;
 Sat, 26 Feb 2022 00:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645834952;
 bh=s0GBcJuitIjqpP4/QATQJPWXnWLxwF9b1R4Q1QKBcPk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P6HArTdGAaSgIFpMHaHqCgAHBb+30XzVadPDG7VUZrIekZrMpJuJoXtK9uKT3QxhI
 RzJGM9TE0I06J9NcPsByeTx1yg2D/Ld7ZhFQdlT20ZU6cSQ9DX9m42M9oZwoDYbIgl
 MYYQdz0z3awjWKu1pDqmRlKHYy4EomfED3R+oqtDDR6azsY4Ph/KLfzoPQQ2N6Rg86
 FyWGmV1iStFtf5uDwrk2tIKd8XFA8xO3bqvztdo9j87WuGfTjwCWbGhG6fx9ZRjgEB
 bnxkBjlY9nzj+CoogrLuCjWUnVHoL/ALf0IGWjDnHl0JK9RGN6clv4/qk2In93jJ1v
 MFJS7HdGFDmKw==
Date: Sat, 26 Feb 2022 00:22:27 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [RFC 00/13] ASoC: Intel: avs: Topology and path management
Message-ID: <Yhlyw2GHpA7dPS9B@sirena.org.uk>
References: <20220207132532.3782412-1-cezary.rojewski@intel.com>
 <e6fad337-59fc-442c-2892-94eabfd0d084@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="d8CVtG5MDpekbb7b"
Content-Disposition: inline
In-Reply-To: <e6fad337-59fc-442c-2892-94eabfd0d084@linux.intel.com>
X-Cookie: I smell a wumpus.
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, rad@semihalf.com,
 upstream@semihalf.com, harshapriya.n@intel.com, tiwai@suse.com,
 alsa-devel@alsa-project.org, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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


--d8CVtG5MDpekbb7b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 25, 2022 at 03:35:12PM -0600, Pierre-Louis Bossart wrote:

> But at a more fundamental level, the main concern I have is with the BE
> use: this patchset assumes the BE configuration is fixed, and that's a
> very very strong limitation. It's clearly not right for e.g. Bluetooth
> offload where multiple profiles need to be supported. It's also not
> right when the codec or receiver can adjust to multiple hw_params, which
> could lead to simplifications such as removal of unnecessary
> SRC/downmixers, etc.

> We absolutely want the capability to reconfigure the BE by using
> constraint matching between FE hw_params requested by applications and
> what the hardware can support. If your solution solved that problem you
> would have my full support. But if we're adding a rather complicated
> framework on top of a known limitation, then that's really a missed
> opportunity to do things better collectively.

On the one hand everything you say here is true.  On the other hand I
*did* suggest starting off with something with stripped down
functionality and then building up from that to make things more
digestable so some of this could be the result of that approach (I've
not got enough recollection of previous serieses to confirm), obviously
fixing the output is also quite a common thing for DSP based systems to
do just in general.

--d8CVtG5MDpekbb7b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIZcsIACgkQJNaLcl1U
h9Bixwf/cYPwq/lOaYC8OkMmm9ZAhY1MHDg82Kb5arWutszrIo/UB9KSHYOwoK0C
Qtw1uy2NNGifSNZAwxotCttXPKwmcM33bbkbK0m/nZ1zS3GamvXefoTSsk41cd6O
hsIBErW7aDJLJDn4jDUBCPATsKx6TgsToXHIhLv1co+x2v5GySUtLSt+/TiRDq3X
ZZgomwIXUxW4vbqtZXwxhsx/R2FXiH39HeSylnLPTKWVNVMsFAeuMWPRK4x61zQx
D9GCaAJgeOv1I54VGfDctdwfSlLt8YApck9z4RATyrtqnA2nEUNa58VICb7qwL4g
GFTdQ6/ncfGg2+Z1EZP/P+X5FYkL/w==
=eN6I
-----END PGP SIGNATURE-----

--d8CVtG5MDpekbb7b--
