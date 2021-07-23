Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED943D3A5C
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Jul 2021 14:40:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F05631711;
	Fri, 23 Jul 2021 14:39:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F05631711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627044032;
	bh=0ZhPfnH1OhnF/cYjLRYyMudFiGrvs2geVpsqJ7x/D8g=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=knBFl2jlI5j6dgsEiR7mp7Bggcydhqhxtbc9VwCU2bM4Ee3KDQCBMD10GNHdO0qr0
	 nXv3iz3mwGlZlEaGwo3qnurDj9AcMiUUWgn2k1Ak8UI6PODidTQDGR7pmETcMt5cOY
	 3Z0IynE7cBIyru8o3v/XzyML26k3iEyxe3zpBJ2g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13AD8F804AC;
	Fri, 23 Jul 2021 14:39:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B41C2F804AC; Fri, 23 Jul 2021 14:39:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3D27F800DA
 for <alsa-devel@alsa-project.org>; Fri, 23 Jul 2021 14:38:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3D27F800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="k+pkMfAx"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9DBF860E53;
 Fri, 23 Jul 2021 12:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627043935;
 bh=0ZhPfnH1OhnF/cYjLRYyMudFiGrvs2geVpsqJ7x/D8g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k+pkMfAxaUT820kt6s0AoMLNUnxBV8oz1QyTBQrWQGbpKx2qO2tfiIKEmymHpdxC2
 FF0FQLgYEGDeEYgRDScBsdLIunvVlxGPPDLMnCKrFjo7+fRPgdWs+JHUrwS6K9MV8V
 TT2w+ve90LzI/CNG9TInNb3viQ9dF650MmY8OY0Q+BoTidOw9cSZUfVEei6ROKJy/7
 gyJzgtPRzeh+h625uMyq3AbogSfQEdoT6giSh+/LifMMbaATdDzeoHWg0w/9QiOrWt
 HVbs1bcNRXU0U/I1OpYpC2n0vfkJp3ibLyDqXp4qsT54IYdK+1XJhpRX2kP7UCqT/G
 e3C1LgBevobQw==
Date: Fri, 23 Jul 2021 13:38:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v3 1/2] ASoC: amd: Don't show messages about deferred
 probing by default
Message-ID: <20210723123847.GB5221@sirena.org.uk>
References: <20210722132731.13264-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="eJnRUKwClWJh1Khz"
Content-Disposition: inline
In-Reply-To: <20210722132731.13264-1-mario.limonciello@amd.com>
X-Cookie: Integrity has no need for rules.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Vijendar.Mukunda@amd.com, markpearson@lenovo.com
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


--eJnRUKwClWJh1Khz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 22, 2021 at 08:27:27AM -0500, Mario Limonciello wrote:

> This isn't useful to a user, especially as probing will run again.
> Use the dev_err_probe helper to hide the deferrerd probing messages.

The reason we have these error messages is that they are very useful to
users if they ever find that the device isn't instantiating due to some
missing dependency or something that leaves it stuck in probe deferral,
they give some hint as to what might be wrong.

--eJnRUKwClWJh1Khz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmD6uFYACgkQJNaLcl1U
h9C20Af/W9aBN7CTPXDnMpzPeDXvrk4xTgYBRCAuOojPAcX73L1AKsQISSiW5fRn
mNRwRQxiO+pD8gv43kncC9qJVaqlE8R6mXZ6t2EAyBYs7Uz0/eb0yRuBz6gbUcZa
uCoM8qmJeHDANkKCHeXkJltREk+7a1e9A0YOmgRyL59NUvAscx3pUlUWftx5T/sb
YXzIa0NG3Vmt/kKGTQHx0pSihwKBhHacZvta73KVeJkON1Kso9zwGUBQvPLIr4Ic
OqlcdFsv2OMDUVg079+1piHS3VRJPypTMbmq1zsDFgQK4h5v4rUjCgkVBnHdUGUS
XZns8VNDHxbNPNnM9hyIQUfygv6GyA==
=TmFf
-----END PGP SIGNATURE-----

--eJnRUKwClWJh1Khz--
