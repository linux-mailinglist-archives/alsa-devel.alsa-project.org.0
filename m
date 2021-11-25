Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB0245DADD
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Nov 2021 14:19:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27F2118A6;
	Thu, 25 Nov 2021 14:19:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27F2118A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637846391;
	bh=G4Ukn/b5c1T+AuSM1FTdqCvx9jCZBV2FLRjFUs53/W0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cbRp9SkyvCtff/T+pbTvJGehilZJcwUuDbMlgBKtdkIPNadYxMeGBgF3OrszDyRvc
	 KcUYJF7RVwzlhyT5LIHnyIJdj/j+x4XB2aRpG1K4hFpjS5DOEK9qyW1UpAQc19aZoS
	 ffrUhT1GtnDQnePXMQL3hMWlMi7KL2l3/u9dvrAA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7E8CF804AB;
	Thu, 25 Nov 2021 14:18:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 797E3F80302; Thu, 25 Nov 2021 14:18:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A407F80302
 for <alsa-devel@alsa-project.org>; Thu, 25 Nov 2021 14:18:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A407F80302
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QU42zxeh"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 79F5660FDA;
 Thu, 25 Nov 2021 13:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637846301;
 bh=G4Ukn/b5c1T+AuSM1FTdqCvx9jCZBV2FLRjFUs53/W0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QU42zxeh/pKtlyvxJo4mEs9HvKp4fpDMi/rlFIO0nkdJX4aY7JWw4v7gXTRNRTPdZ
 y3XigqZtABLGhjrT8JMCVtDH5GrHUytHGriHuRnGo4haiHB4pSHut/p4+UkQ1rnpTw
 T2tQZhpyyx//Sec5g6mXz5B3Zhm8yR+Ri4OU/C/+fQd/rDetGee6pAJkjP4zmmNgOr
 w4K0uSdmJU+xkrfm7bLyHtTPYHhAWxIzTpRckI7LBHQdlBt5HyrkB70BSNQhZ2S0lv
 E3cT0XIEBeo6+9NZeOIg51yeaIK34IP+yDsLRmZfozFPvHbKP9QfEGoaPAezAnzCrs
 8taMzHLBPptTw==
Date: Thu, 25 Nov 2021 13:18:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 07/20] ASoC: tegra20: spdif: Set FIFO trigger level
Message-ID: <YZ+NF8zHqGYfL9eF@sirena.org.uk>
References: <20211124220057.15763-1-digetx@gmail.com>
 <20211124220057.15763-8-digetx@gmail.com>
 <YZ97Qo500CrSmhXu@sirena.org.uk>
 <5670741a-1517-fc64-e390-b01c53947f25@gmail.com>
 <YZ+BZRB0sUC08lCs@sirena.org.uk>
 <d0748829-5f42-2ab3-5620-6949b4139e59@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Yc4PA3Fb6bymYqMX"
Content-Disposition: inline
In-Reply-To: <d0748829-5f42-2ab3-5620-6949b4139e59@gmail.com>
X-Cookie: This bag is recyclable.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
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


--Yc4PA3Fb6bymYqMX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 25, 2021 at 03:53:52PM +0300, Dmitry Osipenko wrote:
> 25.11.2021 15:28, Mark Brown =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Thu, Nov 25, 2021 at 03:04:35PM +0300, Dmitry Osipenko wrote:

> >> This driver never worked before this patchset, hence there is nothing =
to
> >> backport, this is explained in the cover letter. But in general you're
> >> correct.

> > That's not going to stop the stable people backporting things, and I'd
> > guess it might've worked at some point on some systems - I'm not seeing
> > anything that jumps out as making the driver completely unworkable in
> > your patches.

> I can change commit message with the "fix" word removed, this should
> prevent patch from backporting.

I wouldn't count on it TBH.  In any case, definitely no need to resend
for this alone.

> This driver never worked in mainline because S/PDIF device was never
> created, thus driver was never bound. Driver doesn't work properly
> without this patch. Nobody used this driver as-is before this patchset.

Someone might've been using it with an out of tree board file, I guess
on an older stable at this point.

--Yc4PA3Fb6bymYqMX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGfjRYACgkQJNaLcl1U
h9Bx7wf+IH0uFtFw8XHJBygQQZfPIGC/I0RKdNAOdzI5gNPtsLXskguJJdKyxKRr
//4+NF79CccUZr3163B2pMRwNqHF72DDGcpk2C6xqUq9Z8pCcbcBP5leFuPWBZKr
UWMp3+y6k/Jvg9fNxUOzTBd2LC8YO6c3kXmeaL1yob/Lch3IijEhueWwXfvASZ9W
VMJLN6hckmC8yYHp9crlVauWckl3jciIbcG4D5O48JYzjMhSmS4zOi164iHGHjcI
EbNgU+BoqEjA2IryHrCzFgPXOQsPpeb+7EVcAuqYDGehbdqaYsBPFKVxMmMuXuci
L706uuk1oJWwtN2l2JR5WlrCLVYkwg==
=PgTE
-----END PGP SIGNATURE-----

--Yc4PA3Fb6bymYqMX--
