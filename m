Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BED12A4C4
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Dec 2019 00:53:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2BFA16AA;
	Wed, 25 Dec 2019 00:52:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2BFA16AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577231623;
	bh=KNGfgoGfyt8X/4Qzo2a6wehFh9WuJ9kTzJYcFcpmDFU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ToG3D4A96/yJRGheROFv4jo9h0g0+p1GvanKrrIa0hEelZu4tcJ61f77TFoHzt+0V
	 nsHizzAdCb6vYgZmY57KOlmHJwjT+aIFUkMSUZTRKCwE4mX1wGS5fnKH/PQcxwnKPH
	 XRiurdtnyiouT4OaCpm7wgGuVBvd4Y8vqmgmakZ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 271B1F8014C;
	Wed, 25 Dec 2019 00:52:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 569F9F80138; Wed, 25 Dec 2019 00:51:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7203F800E8
 for <alsa-devel@alsa-project.org>; Wed, 25 Dec 2019 00:51:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7203F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Qqn84oRL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wVeG4o2wMLfWamY/spW73kzHgOHGF8sCfwGnxV1QecY=; b=Qqn84oRLhfEoicUtxn8KgThtq
 ekIL2BYMpXYFkDWCTQa3OkwsKbFICnezYVm5bxWhwismS5YCDkoRJSK3Gjt4AzP0ZPqHh7GgBJ90Z
 1OjPgDhJpjrvi/XL0xlQRXwvVd91R79HneYLVJhdhyFMiEm9G14s5vKQgfqcz29GZO954=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1ijtxr-0007BU-Pt; Tue, 24 Dec 2019 23:51:47 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 9EAB1D01938; Tue, 24 Dec 2019 23:51:45 +0000 (GMT)
Date: Tue, 24 Dec 2019 23:51:45 +0000
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?B?amVmZl9jaGFuZyjlvLXkuJbkvbMp?= <jeff_chang@richtek.com>
Message-ID: <20191224235145.GA27497@sirena.org.uk>
References: <1576836934-5370-1-git-send-email-richtek.jeff.chang@gmail.com>
 <20191220121152.GC4790@sirena.org.uk>
 <7a9bcf5d414c4a74ae8e101c54c9e46f@ex1.rt.l>
MIME-Version: 1.0
In-Reply-To: <7a9bcf5d414c4a74ae8e101c54c9e46f@ex1.rt.l>
X-Cookie: I have many CHARTS and DIAGRAMS..
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 Jeff Chang <richtek.jeff.chang@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: Add MediaTek MT6660 Speaker Amp
	Driver
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
Content-Type: multipart/mixed; boundary="===============8322270374942053586=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8322270374942053586==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Content-Disposition: inline


--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 23, 2019 at 02:10:12AM +0000, jeff_chang(=E5=BC=B5=E4=B8=96=E4=
=BD=B3) wrote:

> --> When I check other driver at sound/soc/codecs/ folder, I just follow =
what others do.
> It seems in .h --> /* SPDX-Liencese-Identifier: GPL-2.0 */
>    In .c --> // SPDK-Liencese-Identifier: GPL-2.0

> Is it correct?

Yes, headers use C style comments and source files use C++ style.

--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4CpI4ACgkQJNaLcl1U
h9DFVwf7Bvj8SH/istxSwNkLQ2Tr1SMqR95oagZSg6cNQ4V31uLCUSK/oD+TYaO/
4JjGHrPKLlwBKweT/nJ6nOX9/YcS1N7hvb5bOwK2dbcpsNb0BmkuDC+fy4sEXqfY
KyMmaYgN7+lkV2bYC7Y+x3FtZHs3IScuvGLk5pDp4NqXJddKTMEljQRdegtPDP3N
sAzfTrBMczPhnb320cF+yBQk5xSGCrez8FAJPlpGiaS1TkuHMr4CczYtSgO2qCKW
DYRLizqBUbJ0l8FkHW87f1YY8KdF4GKig5ihIiF8BQ4Vz7IiNTXiDC9eaayD/V71
hchxd/+izG1UhhEmm6NiVOIuyyUl9w==
=YYW7
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--

--===============8322270374942053586==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8322270374942053586==--
