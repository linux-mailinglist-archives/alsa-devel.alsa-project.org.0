Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 324DC1F1859
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jun 2020 13:59:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45E151663;
	Mon,  8 Jun 2020 13:58:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45E151663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591617562;
	bh=nAtsiXTcR+OAIznew/hWTw3IpqmB5O6uM3hw6iSU2Fo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YmWHr3ZhBfUw6WIKkAuHGC6o9jDZZAgKEJRTbDXMuckBi0GMLZGHsim4dcQ4S6gdg
	 h4sy4EeK9ESn8ogaSpV9Mgf9zvi4ahFBURwjIeGHIojX35w+F0ZVepY6zIVU5N8bTM
	 Xs1l418zQ9Q3DNLEbmXYvrKlqoswGIjaL0MejTF8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7501CF80125;
	Mon,  8 Jun 2020 13:57:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C521F8021C; Mon,  8 Jun 2020 13:57:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 641D9F80125
 for <alsa-devel@alsa-project.org>; Mon,  8 Jun 2020 13:57:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 641D9F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TsEbl3mi"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2E2632072F;
 Mon,  8 Jun 2020 11:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591617450;
 bh=nAtsiXTcR+OAIznew/hWTw3IpqmB5O6uM3hw6iSU2Fo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TsEbl3mitixyjIOjM1w4hUKYXomkdL5t+OU2sRkL262ye+9PR8XJjj0hkwTzmqgn+
 Vr54CwuaIDyBn0Dpkgi88bsn/Wuo22C1848vdbbCcvzqaf4q4xDP/eAarZWeOnzyZ9
 L8VOzwy/UDGDFapO3M6kRTPBLJDvOphztk1rlTZ0=
Date: Mon, 8 Jun 2020 12:57:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] soc/meson: add missing free_irq() in error path
Message-ID: <20200608115728.GF4593@sirena.org.uk>
References: <20200606153103.GA17905@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="TeJTyD9hb8KJN2Jy"
Content-Disposition: inline
In-Reply-To: <20200606153103.GA17905@amd>
X-Cookie: I'm rated PG-34!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, trivial@kernel.org, lgirdwood@gmail.com,
 khilman@baylibre.com, tiwai@suse.com, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, jbrunet@baylibre.com
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


--TeJTyD9hb8KJN2Jy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 06, 2020 at 05:31:03PM +0200, Pavel Machek wrote:
> free_irq() is missing in case of error, fix that.
>=20
> Signed-off-by: Pavel Machek (CIP) <pavel@denx.de>
>=20
> diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c

In addition to the subject line issue your Signed-off-by does not match
the From: in the e-mail and there's no From: in the body, please
resubmit with these issues fixed.

--TeJTyD9hb8KJN2Jy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7eJ6cACgkQJNaLcl1U
h9D/cQf+L7dper1ZvO7kYwre40pI8oRGB48niTj/ZkjOhATMnrDe60Nd5z4m792w
YoAXr9IELC+RF9XqtLINNvFb90CrXIkpG947Gmz7HRAG/6RHgomLQDhpx0nvu3b3
9CNRkiAx/cFTyI06laUaxVbUMVfqTZ1t6TQl5/Zj6ZBGqTkpRfF/D+z837DdhcAU
DR3pZxR+d3K79tFmzhMbp1LoCCXnTYHW8jUMxZNe6X2sumd/WkinCAZZV/JyS+k1
WTwS8Zumd/FdDu6p2ukRbQmo9jPw1t/vBCUm3l2il9Rlm0NgqkPigCZi3xNWUEBc
rdhd4zkQxoQqUzquhAnsdDcXwm3zwA==
=TJnD
-----END PGP SIGNATURE-----

--TeJTyD9hb8KJN2Jy--
