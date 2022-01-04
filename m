Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1F548435E
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jan 2022 15:30:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 836901726;
	Tue,  4 Jan 2022 15:29:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 836901726
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641306628;
	bh=M4nSxb1NvmlGksJnr/Bt8Gkos2zhTmNS9qJq2xx75nM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h6+gyWQtyOUuzG8Yitk+i/FMjhmI2+BRZEaOWunk49xdfzuyNdNcBzwVlPJrSSMSI
	 JVuErYp26cI/CvvnJs92M2g25frA4UOPu3NjF0Mp4uZ0epYFXzPx8d8bSfYb/sN/ba
	 eWsGRnNVyp27VZptLwhFivTmE1a6Imr5OtxsdMHA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1CC7F8007E;
	Tue,  4 Jan 2022 15:29:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0845DF80310; Tue,  4 Jan 2022 15:29:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F98EF8007E
 for <alsa-devel@alsa-project.org>; Tue,  4 Jan 2022 15:29:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F98EF8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="UiL8poKa"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7A320B81125;
 Tue,  4 Jan 2022 14:29:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 400B5C36AE9;
 Tue,  4 Jan 2022 14:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641306545;
 bh=M4nSxb1NvmlGksJnr/Bt8Gkos2zhTmNS9qJq2xx75nM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UiL8poKaD8LqcspEN8TBF7riw6XBxu7FDXNEHXhBmZ8jV5kt3bOqlFUoxK2MJih6c
 hU89HNxdapjcY22JjUGBRSlThE7JFUPDhStEY2O3KKDW4n+IpQr540YvA8wBJgIvXM
 +hQ0btui8sH6zjNdsmeD+FwPRbgR/4AmGNDRSQE5q//Rt8op+L/9NkaazjMmbHeozB
 VVWDsqfH8YW9NqP0rgrjCJfAUjBphTSpt1b1fmWH/gbWSqDJZCcG7uH0rM3mbFI9/i
 38ImoEsQEqDo1nhpH6ufqxhxhlF2RPy3Uw8G+GkvTx3PU56Tz5mQKW/F03WoDYW6ei
 kLCiccdPjRz+w==
Date: Tue, 4 Jan 2022 14:29:00 +0000
From: Mark Brown <broonie@kernel.org>
To: SevenLee <wtli@nuvoton.com>
Subject: Re: [PATCH] ASoC: nau8821: Add DMIC selections.
Message-ID: <YdRZrLKL8p3u3ZoF@sirena.org.uk>
References: <20211228035101.2973294-1-wtli@nuvoton.com>
 <YcxYZqZ6aVh1zfY3@sirena.org.uk>
 <b38d3788-689a-70ee-c808-4919b2b7a01d@nuvoton.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ngRMuouL/63uNDG8"
Content-Disposition: inline
In-Reply-To: <b38d3788-689a-70ee-c808-4919b2b7a01d@nuvoton.com>
X-Cookie: The horror... the horror!
Cc: alsa-devel@alsa-project.org, scott6986@gmail.com, KCHSU0@nuvoton.com,
 lgirdwood@gmail.com, YHCHuang@nuvoton.com, CTLIN0@nuvoton.com,
 dardar923@gmail.com, supercraig0719@gmail.com
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


--ngRMuouL/63uNDG8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 04, 2022 at 11:05:59AM +0800, SevenLee wrote:
> Mark Brown =E6=96=BC 2021/12/29 =E4=B8=8B=E5=8D=88 08:45 =E5=AF=AB=E9=81=
=93:

> > The clock speed seems sensible enough to control from userspace since
> > it's going to be a power/performance tradeoff but why also expose the
> > slew rate to userspace - that seems more like something that would come
> > from the board design?

> Because customers need to adjust different DMIC materials by themselves.
> Adjust which slope is the most suitable according to the conditions of
> use, and
> improve electromagnetic interference by setting the slew rate so that
> customers
> can try the best solution.

Sure, but do they need to do this at runtime?  That sounds like tuning
that you do once during system design and never touch again so better
done as a DT property.

--ngRMuouL/63uNDG8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHUWasACgkQJNaLcl1U
h9AbEgf9EPfQsAK6ihnIAtjOBcyNTyONLrq2p/d/Q6IYkWqgPIAgDcWQqqshNjHA
3kqcD5MDgkneHio+8yeRlqzNLp1nc8/UjK/cJSLrNojesUm45oywAhqNogdvq8O/
nOMg+nZ4rxMu3ZTcInunAvFxBHc0XiZpv32rP+cXdzoleSasXhiu+MxYQN1TKsSx
MYHxau90UJgjVrBsfSPx4s/mUxketKz6+4MiILAjijR0FmG+DU59ILEaJzj9L4DQ
LUQ7S0LP33TzuLsOvDR1IVEI72Huuos4DS8vX8cGxOEwCYTWZVydIBcTC4Ky9sYu
OQQVTC5nRpsQQ8Hv4IBOW4nYqIA+zQ==
=0A66
-----END PGP SIGNATURE-----

--ngRMuouL/63uNDG8--
