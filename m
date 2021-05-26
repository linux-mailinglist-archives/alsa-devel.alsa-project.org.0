Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CB03916BB
	for <lists+alsa-devel@lfdr.de>; Wed, 26 May 2021 13:54:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 804CD1746;
	Wed, 26 May 2021 13:53:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 804CD1746
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622030089;
	bh=JPlR2X63veFjvILqFqCOaM96BbHh7nfQX5FKtUY+zFQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FCvLZc4QTWnKj++waJeRpAkeNJiM7vt20XDvp7EdVxL/tC0tYPAAX9hq631MRyAdQ
	 vZLeSAzL7g/QkHkWS5wAiPDFT2FI3QxQ5VxZAgTuphUAuPH9jBk2p+jN47dbL2wEF0
	 GPg35oCgxHneU/z5/J2R/A03Z3prHoJsE+6+mzsQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAB7EF80260;
	Wed, 26 May 2021 13:53:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66A40F8025C; Wed, 26 May 2021 13:53:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D708F80212
 for <alsa-devel@alsa-project.org>; Wed, 26 May 2021 13:53:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D708F80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="J/l0qAP6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JPlR2X63veFjvILqFqCOaM96BbHh7nfQX5FKtUY+zFQ=; b=J/l0qAP6uGds+JmruudzVaMn4O
 s6gsv4tcBGklxFhnAxzwXB7Za34MgmN+0aAzFAeETQ+aZshxnoWu5rDTqsEaK4fDWZsDPIGSteARx
 PKpa1p6HxctNR53newvKNszXT3vHU3QyU0AciSd8mzPDVQxnOKqxz2bsX/Hb49GJl6QE=;
Received: from 94.196.90.140.threembb.co.uk ([94.196.90.140]
 helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <broonie@sirena.org.uk>)
 id 1lls63-005z6k-Sq; Wed, 26 May 2021 11:53:12 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 04D2AD0E9B4; Wed, 26 May 2021 12:53:45 +0100 (BST)
Date: Wed, 26 May 2021 12:53:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>
Subject: Re: [PATCH] ASoC: rt5659: Fix the lost powers for the HDA header
Message-ID: <YK42yV7Ep+L4h7X1@sirena.org.uk>
References: <1438e0d6e7af4593a060808b11c62d67@realtek.com>
 <YK4klHWowlYP+dh8@sirena.org.uk>
 <1f3f604a6a0e4b14b9dcca0ff73ce1f9@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="YE2HmDqhKWACaSeZ"
Content-Disposition: inline
In-Reply-To: <1f3f604a6a0e4b14b9dcca0ff73ce1f9@realtek.com>
X-Cookie: You may be recognized soon.  Hide.
Cc: Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>,
 "mkumard@nvidia.com" <mkumard@nvidia.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
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


--YE2HmDqhKWACaSeZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 26, 2021 at 11:40:58AM +0000, Oder Chiou wrote:
> Oder Chiou <oder_chiou@realtek.com> =E6=96=BC 2021=E5=B9=B45=E6=9C=8826=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=887:27=E5=AF=AB=E9=81=93=EF=BC=
=9A
> >
> > On Wed, May 26, 2021 at 10:10:15AM +0000, Jack Yu wrote:
> > > The patch fixes the lost powers for the HDA header.
> >
> > What are the issues and how does this patch fix them?
> The power of "LDO2", "MICBIAS1" and "Mic Det Power" were powered off after
> the DAPM widgets were added, and these powers were set by the JD settings
> "RT5659_JD_HDA_HEADER" in the probe function. In the codec probe function,
> these powers were ignored to prevent them controlled by DAPM, thanks.

OK, this should be covered in the changelog.

--YE2HmDqhKWACaSeZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCuNskACgkQJNaLcl1U
h9BEsQf+PoQvA+SYwAl7nm1Hy0M8IN5sAvFGmM0lpUlqlNoN/z1gWU92L3Ya2PPG
/VNneWxEgN+j1xWDPofSDQhnwDE8b49b0kKk1Hfgz0iH16vue3uQY6O6Za5UHl94
UCNx24RopUsYUOU8FuAgCFVv4vKpbudV1u4bGb/GEwe7sZtPfGKM/zaMnRGR+ZAh
RcG/iAllRV/hftiJnXLDoU8s9DF4FHlno8hs51TNzFWrg6cMjTuo7o5VhM+8Liy4
LYAP3E4a4yDi/64UizASjSSOeQQBDVCy0LHi2AYYT+eJNQrGHWeTGeFQEq01N0B1
3PdW0c61aKQ+VFcnv0WRLO+xuIgv6g==
=1H9D
-----END PGP SIGNATURE-----

--YE2HmDqhKWACaSeZ--
