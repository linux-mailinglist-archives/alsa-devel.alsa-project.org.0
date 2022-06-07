Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8427F53FEE7
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 14:36:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2376D193D;
	Tue,  7 Jun 2022 14:35:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2376D193D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654605376;
	bh=YTReIKFapkRU/vz0TQ4ZybHkAiDZOqBVEplw3ml6HGY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jm8tASJbjZb5pMVhMgntOrU0lYVfs++ZFkLXa8dz2x/YL6H9e894XI4OIR9xgw/YN
	 A/YrI/lJMP2venq2hWLxqigcn136dq6xcZEMjxsfHgUpio9lI8g/HO0z0t7+zhJGrJ
	 ULFHnvmK0dnTYLheV3wWXBYUtUbZz9aWBV2SfZYY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9010DF8013F;
	Tue,  7 Jun 2022 14:35:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78487F80116; Tue,  7 Jun 2022 14:35:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E4F3F80116
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 14:35:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E4F3F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eDjt13GG"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D5066B81F6F;
 Tue,  7 Jun 2022 12:35:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB273C34115;
 Tue,  7 Jun 2022 12:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654605311;
 bh=YTReIKFapkRU/vz0TQ4ZybHkAiDZOqBVEplw3ml6HGY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eDjt13GG68qEmMTz09aQ0LrFH3FHYIRRjlbWRXxgUKadxTHsXEWn4uD0HSVF1Lfvv
 CGeDiWJP6+avear1/tbhZwahJS8sjkEXpN/sLsJnpXnCgvK9PUoZ0P0awhrqpYQbTW
 pveJl9BpbJo6IOv+iWGioH2FOsvb+Gzo1Xe0MU0j1huXRh4tN4hY63oQuTzCvT5E9m
 zBIfEghcalLJ+2M/a/sqk+UhmdiagifNTCDIvr2ZHhdEIuxgEOLfNATwfCuLNQZqTw
 4mlGtycCQDQcYqHDyekatgxa2ckU8knGJs6GdfPCrqnBRQVW7C311JaavpURXj85WY
 anXcmVZaVM7Nw==
Date: Tue, 7 Jun 2022 13:35:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Lukasz Majewski <lukma@denx.de>
Subject: Re: [PATCH 1/3] ASoC: wm8940: Remove warning when no plat data
Message-ID: <Yp9F+r1WryNFzyrM@sirena.org.uk>
References: <20220606154441.20848-1-lukma@denx.de>
 <Yp4iGvGFD9jo4WUP@sirena.org.uk> <20220606181731.04b6f771@ktm>
 <Yp4wzS0aLEo5werI@sirena.org.uk> <20220607143039.01cdff80@ktm>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="VwEHQR+T8zP616/F"
Content-Disposition: inline
In-Reply-To: <20220607143039.01cdff80@ktm>
X-Cookie: Where's SANDY DUNCAN?
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org
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


--VwEHQR+T8zP616/F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 07, 2022 at 02:30:39PM +0200, Lukasz Majewski wrote:
> > On Mon, Jun 06, 2022 at 06:17:31PM +0200, Lukasz Majewski wrote:
> > > > On Mon, Jun 06, 2022 at 05:44:39PM +0200, Lukasz Majewski wrote: =
=20

> > > My point is that - similar codec - wm8974 don't display such
> > > warnings. (this code was not updated/refactored for a quite long
> > > time). =20

> > Perhaps those drivers are buggy, or those devices lack this specific
> > configuration that's being adjusted?  The changelog should at least
> > address why the driver was warning about configuration being required
> > but it's safe to ignore that.

> With v4.4 from which I forward port those changes only the PXA
> 'stargate2' mach is using this codec.

> In this version there is no reference to 'vroi'.

That's equivalent to setting a value of 0 given the way platform data
works.

> I guess that one can provide the 'vroi' information via DTS nowadays if
> required.

Yes, that's what I'd expect.

--VwEHQR+T8zP616/F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKfRfkACgkQJNaLcl1U
h9C+VQf/a2Lo4791u9dihgpYWy514oujclrH2q6cIYgSRs9nrNvyOBW46Lzfk6to
Bju+dCExmD48HfkH0jLbHI18b+nrtmH2NU6AD5qe9AFlGk/lVtEnECpV+bZBHpKu
DTEuq94BC1cMe6KWPapmGuoPLmzDw3PTbUu3hGIHm17hHpHzMIzHmOPpNdopO4Sx
YLRktN3V5F3T55l3KlGTsQKu46ddvNtWKzcBdZCu8APIHZtn9dQnTtdBcD0gtDQz
FYuiYZfbyIiVbmKdaU3P1Wqb1QN4wXCme7GXyJ5jrEqlNrMzTdcAkgfvkGu66hnf
EVNDP8a39faQa6wbv1xUu/AcvEDGUA==
=MyNE
-----END PGP SIGNATURE-----

--VwEHQR+T8zP616/F--
