Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EC8229455
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 11:03:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EEAAF1615;
	Wed, 22 Jul 2020 11:02:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EEAAF1615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595408610;
	bh=Yi6AS996K0DfjW15vZXqu8ki28iyEoRT+iHhuz3j7+0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BF8FdWyZINT8Dbbqgrcqctto4n6MeixSF4VIwI9GNS1YJiGfpbnjYs8zPOVQ9kRtb
	 9y6+tx8LL3m+mE1vFXMtpkn4HHUCGqGjQlh7ST9nA3KI0Q+qCLZDrzYmCkc353T1LH
	 sUG4HxMtVkm9vVUIhw9shwgtGAdRmuP4fiIoJV6k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69551F802EB;
	Wed, 22 Jul 2020 11:00:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 878A8F802EA; Wed, 22 Jul 2020 11:00:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75052F802E1
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 11:00:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75052F802E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XUnleD7L"
Received: from localhost (p54b33083.dip0.t-ipconnect.de [84.179.48.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 046F7206F5;
 Wed, 22 Jul 2020 09:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595408419;
 bh=Yi6AS996K0DfjW15vZXqu8ki28iyEoRT+iHhuz3j7+0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XUnleD7LHqvGtxq+wPCwjAtfLU8iE/aJVtLD7hmQ39Twa13AoyiA6X9P9DH8aRvig
 Ul47e9yAZJjJif8/IKCkkcS2OPTJRA4qNIm2JMLgdp7xNCZOP95Xxlx1IASlozmoD9
 JhxmS+9oHSqRdukmWAbnCWt0oYHCWFBdZRrFrfwY=
Date: Wed, 22 Jul 2020 11:00:17 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 02/20] arm64: dts: renesas: r8a774e1: Add PCIe device nodes
Message-ID: <20200722090017.GG1030@ninjato>
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200722085849.GF1030@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="VACxsDaSTfeluoxK"
Content-Disposition: inline
In-Reply-To: <20200722085849.GF1030@ninjato>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-ide@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 linux-i2c@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>,
 Magnus Damm <magnus.damm@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Niklas <niklas.soderlund@ragnatech.se>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-renesas-soc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>, dmaengine@vger.kernel.org
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


--VACxsDaSTfeluoxK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2020 at 10:58:49AM +0200, Wolfram Sang wrote:
> On Thu, Jul 16, 2020 at 06:18:17PM +0100, Lad Prabhakar wrote:
> > Add PCIe{0,1} device nodes for R8A774E1 SoC.
> >=20
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.ren=
esas.com>
>=20
> Hmm, doesn't apply on top of 5.8-rc6 for me. Is there a branch to pull
> for easier review?

My fault, I missed the first series. Please note such dependencies in
the cover letter.


--VACxsDaSTfeluoxK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8YACEACgkQFA3kzBSg
KbYt3A//Xgag8bMPdab8inAJPDV9Tk6V4XS9gbC6IgjEgp3oqU1d3BHkhJWG/+D+
2IyT2/QPM8/BjxYbDxFO2S259nZfkTEzzdfUa9oqFmv9cMugPgx++I2Pd/JQWCRt
5+gCNoNna6ra3Jst7ACmZvRoD2KAehRkC1j9+XHvVJzfSMZp9AE5vW4QiD3/jclN
beLqBzsQgKS9kTC9cCL4FQElaqj8yHoilinNXYt9EzHbMxWS7Zx0pvs0Eoxi2TKK
gs8pAC6y0Rcw6FlNzTT9wJyN/su4auribb+rQVK9DG5E5CMPKFyrHRWQU3Wjp8db
lHDZsu0+k7xxNS5IdQRr8FsZJuocTX0XU1v2CHBbSyncBYrKCrbWKCCDYcJ4Bnk6
q+7Zo6YnyeaZkSQXy7wumFwS4aqnGoqIImjIUtmfhSXhOQ/L6C7AHqMpkdB1yy/m
re40qlmZLVc3R+o427vgcUxyU0vrY61qTRn1jtNuIQVGRJj8TXKw4P9QW4AvZYNC
1BseDJS3W4q98/itkFRudLcXakyLYDRZmL22OLTSMpHPpmneH5bE9DzITvJZHMAO
EDkoJbb9L0RN77Tw0b+M/1xX4jPBwq9/9BFBZgGROZC14zoPkhbsc51QwZPF9OPS
dgRl9yHu/5nI1RmWbEIaeD0C+c+Pgzlfy09oCI4kHLxQJ1DIaWQ=
=O7WM
-----END PGP SIGNATURE-----

--VACxsDaSTfeluoxK--
