Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8891529511D
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Oct 2020 18:50:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFD991781;
	Wed, 21 Oct 2020 18:49:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFD991781
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603299034;
	bh=Q6e78KcZoCQhd1bXj6R92Xryu7ozXsWPcLmGVXfwz28=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bXVI7rJELy3ctdBw0dYgCxzBypgmQKEg5xCGYwLINrKKCRf0Z/xCbtrxYdBeKR664
	 MY8zXSTewze0oTl/VTKfp6GwJNCe+TsbBFt8lyL7h7t3pwm7wDb+jSJZs3OR/gIT+b
	 Jh+mbPrmjE6US82wO7I/bBM6EKVIt/t09B/d/Fmk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29F24F8026F;
	Wed, 21 Oct 2020 18:48:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDA14F80111; Wed, 21 Oct 2020 18:48:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4846EF80111
 for <alsa-devel@alsa-project.org>; Wed, 21 Oct 2020 18:48:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4846EF80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="xL6RZqFy"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E454220B1F;
 Wed, 21 Oct 2020 16:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603298924;
 bh=Q6e78KcZoCQhd1bXj6R92Xryu7ozXsWPcLmGVXfwz28=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xL6RZqFy6W39VQfyAOc+lKdOtzWwCi2+xgyyqORkQ7isaPWFNbmaLG9nwt8jS5cxs
 IV3SOLInr79MuKlvtWMXEXRDy7ohy8bVRh069QicrJ7cfQGsRTh95YqOmqkxf1dDO6
 eb+gNhm+TTbbuLlXKljxzaIrxKkIUtmvOXQF9KuI=
Date: Wed, 21 Oct 2020 17:48:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: Re: [GIT PULL] ASoC updates for v5.10
Message-ID: <20201021164832.GH4497@sirena.org.uk>
References: <20201012130845.816462076C@mail.kernel.org>
 <a31e2b24-9ef4-c84f-a663-c2a44b0c8938@perex.cz>
 <20201012132857.GC4332@sirena.org.uk>
 <0cfec32c-c0b4-ddbc-6a23-f5b898966c48@perex.cz>
 <alpine.DEB.2.22.394.2010211150040.864696@eliteleevi.tm.intel.com>
 <20201021122209.GC4497@sirena.org.uk>
 <alpine.DEB.2.22.394.2010211719200.864696@eliteleevi.tm.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zhtSGe8h3+lMyY1M"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2010211719200.864696@eliteleevi.tm.intel.com>
X-Cookie: That does not compute.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>
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


--zhtSGe8h3+lMyY1M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2020 at 06:11:07PM +0300, Kai Vehmanen wrote:

> I can send the fix patch separately and save the rest of the series for=
=20
> 5.11 window.

I've already got the series queued to try for v5.11, it would require a
lot less faffing on my part if you resent that one patch to get it in as
a fix though.

--zhtSGe8h3+lMyY1M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+QZmAACgkQJNaLcl1U
h9DknQf9HsRB0iJEYTXsExJSvgsGP7nIcIlsE/1qUsET+qH4EcxA0A0wcotQlyNL
OKp8+fin4S3VvAWd//IeLRVSNviqnjZHkObQfgQ8nBeDuO6+0yCIiP2vIKaTnrGw
F22QaIV/GcLIPCN+O5qoT+fnvrKopkPOEIv2Zce4ZzmgEZ4XvkUxl7S0naPzIhxZ
Icx4cPlT9G4YGL8uDAsL+tgyjxHfvn4+d0ibN48AaXlkKv1vwIFn3FtTuNKmeIDM
2BoDfE06b3n/T40Oe86UDngUD5F4l/IB5KSWsf60oJVKg0whfw3SBgg5RSA6IVb0
SkjbkGArsGQxDG6gx+p0KTzIBWwpbw==
=UQlI
-----END PGP SIGNATURE-----

--zhtSGe8h3+lMyY1M--
