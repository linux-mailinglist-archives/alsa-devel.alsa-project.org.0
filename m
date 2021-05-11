Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A20D37B02E
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 22:38:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44A2018B8;
	Tue, 11 May 2021 22:38:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44A2018B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620765530;
	bh=/y1LNczX8cc7a5JT53+KpFEJ0FqXNBnUXYDbg0bXdpI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u27Lg1cnGSn4rHkWColVcNGL91dZZl+tVkHFrMcBvo3SqfnhtcAYTlTCbbnt/gqi7
	 s59gZM2UftOD6GPObqRIWaeDI/XpUWhHrEogfih6WHZqleAaYUcBi5gc0XtymGuU98
	 +h0YmrqrWmDO7SylYvdYrfFMNCbZH1ZnlY1E6YhY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A4DEF8016B;
	Tue, 11 May 2021 22:37:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A4B5F80163; Tue, 11 May 2021 22:37:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20315F8013A
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 22:37:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20315F8013A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ME1PJuFC"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6FDC361625;
 Tue, 11 May 2021 20:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620765428;
 bh=/y1LNczX8cc7a5JT53+KpFEJ0FqXNBnUXYDbg0bXdpI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ME1PJuFCJD1NB0CrAdpNns4SSjWiaKbM0BEQo4Atxc4h5ndnFkMJch+tWBp/XK6RK
 mgEzLs9roSCYT8hs8pVD7TrHzAlfCCadQ7rktJ5XGxTSMzc0Swxo1QXpmUXqkNolGe
 oQf1bQAMXOoemPc834iB+lPA1LdIKb/BYyGxje3S/MNpKHtklD/SDXJiAguQ4lBvzT
 X2nWyHKTh1wuqiiu84jkuGXHqqz1vxm5mwpRu0HAztfV6FIA4TAYrCxXc6a5rDgrhL
 b67QtrE0qkhZw81ANto2eKecIv3/ckrlsht36GTESLD7rqgHGX6NOfNxLghEywVxe5
 JDN+QB+BHSbiw==
Date: Tue, 11 May 2021 21:36:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] Revert "ASoC: q6dsp: q6afe: remove unneeded dead-store
 initialization"
Message-ID: <20210511203628.GQ4496@sirena.org.uk>
References: <20210511190306.2418917-1-nathan@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dUqh8vgUBVXHzm9w"
Content-Disposition: inline
In-Reply-To: <20210511190306.2418917-1-nathan@kernel.org>
X-Cookie: Beam me up, Scotty!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 kernel test robot <lkp@intel.com>, Nick Desaulniers <ndesaulniers@google.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Yang Li <yang.lee@linux.alibaba.com>
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


--dUqh8vgUBVXHzm9w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 11, 2021 at 12:03:06PM -0700, Nathan Chancellor wrote:
> This reverts commit 5f1b95d08de712327e452d082a50fded435ec884.
>=20
> The warnings that commit 5f1b95d08de7 ("ASoC: q6dsp: q6afe: remove
> unneeded dead-store initialization") was trying to fix were already

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--dUqh8vgUBVXHzm9w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCa6ssACgkQJNaLcl1U
h9DIUgf+MIzhdPlCE4pqiMs8Z8GCjZzrob0CFLVObb8Yd/af0k9sJih8nRwUU8ky
SjtaSKw5YKGxmJrxhdwvHJkHbHxEiFOWGx3vU+N+VfQF/V1T8gLPckD7NRHMpCjf
M4MTyx+Ng8hAl1VG5pel0cKGvQjjtnt7e4BZMi5aTCVdHaVii8Lej1d5dRiD1Nye
RGeeZiJO4CyTvgak0gqsWvg0TsNIPmnS4rwl2iLkL6WyU9JPHPrFJucLC6rN/XQt
LhK1MpMwI1j+gCZrfqZBQh73b+xU0GPSMfHxf/R7lyRrlZ978bND/HhNFomLawW+
y8KMd3DO01gob1VebP0hSoXn/++2wQ==
=V9XP
-----END PGP SIGNATURE-----

--dUqh8vgUBVXHzm9w--
