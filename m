Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3E614C92
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 16:41:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B589418F5;
	Mon,  6 May 2019 16:41:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B589418F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557153717;
	bh=hLLtYKvlu5VM/FwQLruexfBIakCnxirE+UThQAMb/dc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X29Or9PKjkwiJ2Y8fC6pVQl9zfbCVqPUhQstgQRqvbGNsyiS32xxq0k7vnDSH4pax
	 SiBjQdl5OLNzdC5JZmvVHuL9aHGpaEQRYVDX/njWkyWuUIG7UIg7jWpX9RC2MbjlTO
	 KVaIfix86gAJGd5sN+Nnz2WNXDlPzc/RNx+Tyxvk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26A91F896FF;
	Mon,  6 May 2019 16:40:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7ECBEF896F0; Mon,  6 May 2019 16:40:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3487EF80C07
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 16:40:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3487EF80C07
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="awfCUhY9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=deHlbsqt5mb9No7k+LRcmroaKVqd07V6TAGSO4r0zto=; b=awfCUhY9sHYZCK0U638bvLhP/
 ca+WIhTe4xz2ghaCksqwh6E7qac4c0/kVnS106XrKZmyK75O5J2pxk446EAFF7zoDWUzxvuipMaAK
 WpZVdC9L7jJLqoY0yLKiyyfvbE7vOtmjpqZikRkVG3AE+YjFZASsWQXZ/azbkEBJe1o+A=;
Received: from kd111239184067.au-net.ne.jp ([111.239.184.67]
 helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hNemj-0001qj-Gn; Mon, 06 May 2019 14:40:06 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 8657744000C; Mon,  6 May 2019 15:40:00 +0100 (BST)
Date: Mon, 6 May 2019 23:40:00 +0900
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190506144000.GV14916@sirena.org.uk>
References: <20190506141144.GR14916@sirena.org.uk>
 <s5hr29b4qas.wl-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <s5hr29b4qas.wl-tiwai@suse.de>
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [alsa-devel] [GIT PULL] ASoC updates for v5.2
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
Content-Type: multipart/mixed; boundary="===============0689740444249494063=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0689740444249494063==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ndc0uqT8Jh5ZONBY"
Content-Disposition: inline


--Ndc0uqT8Jh5ZONBY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 06, 2019 at 04:21:15PM +0200, Takashi Iwai wrote:
> Mark Brown wrote:

> sound/soc/rockchip/rockchip_pdm.c: In function =E2=80=98rockchip_pdm_hw_p=
arams=E2=80=99:
> sound/soc/rockchip/rockchip_pdm.c:179:3: warning: =E2=80=98clk_out=E2=80=
=99 may be used uninitialized in this function [-Wmaybe-uninitialized]
>    rational_best_approximation(clk_out, clk_src,
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>           GENMASK(16 - 1, 0),
>           ~~~~~~~~~~~~~~~~~~~
>           GENMASK(16 - 1, 0),
>           ~~~~~~~~~~~~~~~~~~~
>           &m, &n);
>           ~~~~~~~

> Is a fix on your tree already?

No, I don't have anything I didn't sent to you.

--Ndc0uqT8Jh5ZONBY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzQRz8ACgkQJNaLcl1U
h9BXPQf+OH1RiCOpVMQUu7HLJbWirezlfu8x7SFuolrPS+ikvEiIzRF8wsB4Laa3
sQP8B+vxtvRreWBgdhL0BbvDLV4Ehe9tz/AMGMLGDXj82WtFlAu0MMMjjtjK6BiN
iqtAGQjaNC7Zz3nTnFbuolnEd1Phcsu7JRn6mqVsqALq/6PrRlos95hjZ4pU3gYE
YFTa7+wL8JmobeUkyXiawsfFF76Ni2K/RhggpaqY+kv3fxZj6e6/Wl5tnj/zsovL
ij2Oo79nXrMkik5erTudUbbEMrhJAjZJuZ03ywc46/oqs2e0qXRbhWt4JXAPaoPT
h0DNd2ZfwbO+5G6+5Iqdikmp9fZikQ==
=X7+L
-----END PGP SIGNATURE-----

--Ndc0uqT8Jh5ZONBY--

--===============0689740444249494063==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0689740444249494063==--
