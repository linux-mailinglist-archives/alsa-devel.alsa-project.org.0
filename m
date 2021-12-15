Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE058476265
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Dec 2021 21:00:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77A0A1B28;
	Wed, 15 Dec 2021 20:59:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77A0A1B28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639598415;
	bh=RvD+ANrcnCD+5NddNQhdEKCc1gzpjozT02JO8YsYNTY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cISAr53E06kHpCuHmuU1/VZYN77zWWjaue2R//T0LJgPh5fZLc9wge3TEtWik7XMP
	 XZO6m8tNwqzNPMUvB8vBMCtTP3hbwhawAnCMSfMA3dV4YQFObnFcugYGc8VjVLaAkp
	 pHDk67WwrCA4agIzK/dvId1OOt/P6CBam5Qvra0o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D843CF801F5;
	Wed, 15 Dec 2021 20:59:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E5CEF8019D; Wed, 15 Dec 2021 20:59:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76049F80157
 for <alsa-devel@alsa-project.org>; Wed, 15 Dec 2021 20:58:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76049F80157
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uTMv8hJM"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 46FEC619C9;
 Wed, 15 Dec 2021 19:58:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B2DDC36AE3;
 Wed, 15 Dec 2021 19:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639598333;
 bh=RvD+ANrcnCD+5NddNQhdEKCc1gzpjozT02JO8YsYNTY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uTMv8hJMi30/mQAVCHGryR04wkRNruOAqqgQr7mx1i7/ofD9e2/UQCIugWQW4erbW
 hjksfk4C9xAFYPywgfg7J4NxzReKGoQfem8GnLrvyfqO+O/TpqO7Egme1Try97PGdf
 MaNHWmP2/bB7l7H78p7rVc8JqNsZ6O3EKSntadAxV6YZDR5hGyMDd8ETKVCugXurgV
 QQtpSgXCZ5LOSY0RsXcL74Ih5jnwsPCflR7PkpKefJ0jjQlw04J500QcUU8xwUtTep
 ETlv3fhubxEhPeHCbx2e+R+tyXKwv8vScMsrr6WW9VQJll6/fE6BfifIt8X2YSbPAk
 73vFYJxAbtmNA==
Date: Wed, 15 Dec 2021 19:58:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 00/22] Support HDMI audio on NVIDIA Tegra20
Message-ID: <YbpI92wUUiHGrttE@sirena.org.uk>
References: <20211204143725.31646-1-digetx@gmail.com>
 <Ybo6tsnQM6OacoZs@sirena.org.uk>
 <26af30a6-9606-72d0-9258-cf9627ddfe77@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="JQ68o39Xf5M+1Fsk"
Content-Disposition: inline
In-Reply-To: <26af30a6-9606-72d0-9258-cf9627ddfe77@gmail.com>
X-Cookie: No solicitors.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Agneli <poczt@protonmail.ch>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>
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


--JQ68o39Xf5M+1Fsk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2021 at 10:19:07PM +0300, Dmitry Osipenko wrote:
> 15.12.2021 21:57, Mark Brown =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

> > Please include human readable descriptions of things like commits and
> > issues being discussed in e-mail in your mails, this makes them much
> > easier for humans to read especially when they have no internet access.
> > I do frequently catch up on my mail on flights or while otherwise
> > travelling so this is even more pressing for me than just being about
> > making things a bit easier to read.

> Noted; I see now that it's indeed not clear from the cover letter that I
> included Arnd's patch into this patchset, sorry about that. I assumed
> that you will notice this after looking through the patches.

It's a pretty long series and having to open a link to figure out what
patch is being talked about puts an additional barrier to remembering
the specific patch at the time dependencies are being considered (which
might not be at the same time as things are reviewed, especially if
other reviews are likely).

--JQ68o39Xf5M+1Fsk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmG6SPYACgkQJNaLcl1U
h9Awngf9H/ITmP3FE/wIHN98Qdk//g8Rsop9zp3VG8+XHxSJlnv3frW2qnkUZUn6
Z3RHXpyEJmnPgG2oVJrO1wM8BXYHbaZTEhLWTMWYM8gSXAmv+p69J3X0EO/7sf6P
Smg7ezxM5YCx8UJ5Iiu1pBwFLJoQWXn/ByfC4V6ricypDGnjP4XgvIeNifV1Y9fo
VEarR5kpowUV5pY9HlAiB6Xk8y8okvfsNtvAKL4lO83+PFfrr0USJA9OwS3Ni/ZT
1FeTFT0gOhfO51entcCkn6f4JeKEHuyknlIxZjNPnWJP4hKYmg6nclb5FiCu9IXN
2sJLUenCn0T3CGE1yft3DJinQFG66g==
=OyQ1
-----END PGP SIGNATURE-----

--JQ68o39Xf5M+1Fsk--
