Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B691622940E
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 10:53:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62EBD1612;
	Wed, 22 Jul 2020 10:52:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62EBD1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595407985;
	bh=5VKULX8ADgA7+H2EigrTRpvSe/lUy15QaMOU+A/CI+Y=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W9eIjSFfW142IAiNJUls36dscw+8rLefeHnrSAZ9PgDBtF+hI4HqiSUVITmUoNjJE
	 PWnu9+jLmSeP4IJfXeGDHhZZtYXV1Mou1nP8YWodHsVoiQL0uwaq6eT0e1XZxB+80F
	 Z4Vn8JaBIRJCCPGJukwRj/WKabsb4pm81/DzZS5A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3FD6F801F5;
	Wed, 22 Jul 2020 10:51:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51710F80161; Wed, 22 Jul 2020 10:51:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16B0CF80139
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 10:51:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16B0CF80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TvDvcjfK"
Received: from localhost (p54b33083.dip0.t-ipconnect.de [84.179.48.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ADA222077D;
 Wed, 22 Jul 2020 08:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595407869;
 bh=5VKULX8ADgA7+H2EigrTRpvSe/lUy15QaMOU+A/CI+Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TvDvcjfKa+vjcCeAISmgjEW+fYRbaGUNquFQgXGpLqYmkm80KFOgCerMuWLycm+ZV
 k+xSZ1nc9noBosM5GPDDzmj/H5F/WzdPyL7Fa7ImHzdKh1VwobjPGB8fKtAb24Isis
 RGJsyWPulH2eYURc982loSrrzS5yw8NYtlevcruY=
Date: Wed, 22 Jul 2020 10:51:06 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 01/20] dt-bindings: pci: rcar-pci: Add device tree
 support for r8a774e1
Message-ID: <20200722085106.GE1030@ninjato>
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Rgf3q3z9SdmXC6oT"
Content-Disposition: inline
In-Reply-To: <1594919915-5225-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


--Rgf3q3z9SdmXC6oT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2020 at 06:18:16PM +0100, Lad Prabhakar wrote:
> Add PCIe support for the RZ/G2H (a.k.a. R8A774E1).
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renes=
as.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--Rgf3q3z9SdmXC6oT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8X/foACgkQFA3kzBSg
KbYBWQ/8DnQbj6fqdgDpJjxoGMvRlAGRmD/LQyLgeNZDawpLA777Z4SwPpfHuyXH
tJy/aVjlLezk3AtfaxG87wUrwymDi3qmcjOQ/7F0exSRseGNXLrM3jYw37cH0zxr
Qcf3G48YkoHNFOTk4HYO9q5UYEhMtZOZnOBNOopox1cRy8glrR7nxNSfDhxpZVZs
dL3kgz14gDgBt14Oz4NgFWQ1iggFHB0TazeOr7a9r3NF/JazPQ1y4fmlTgPz1DWA
2yEE2P27ev+KZ4uqtwueghMFgzAnE8lJax8giRAltuS1QCe7D2i6hV9yyvc+aOV+
ci8xl7FHxyHeIDtRCfyp5Dfl0ud+vg0ewbD8aFe5lYW37rG3/8NJ/UShQKjJj2mT
YU1ne29hQ19sH1WUpAIKfGum2Ps7VZ/Bjgv4pHiAM4siayrkgAE7uRAI0vEFj6do
drNmWmySFFGx/sbjYQGdnvZfvGmUk3Y4t3VHNW5NhPk17gxMMht2iUeU4JJCurhR
/BE5wVtwfdArEeoMTvjTCyE0oZOGrCmpngp9i53vFvgTpU9vjzuKmPYatnBG7jiN
ctixKPeb4U9KoEMN1p1VnATLvLlBCxKi+blTVO06005x3kMkck3bMD6ZAfb0/ztg
30sT5P11NP9Za8s2A/TwTV6Nm2IBR4tMW+t1sJLCuSdR5X7RJJk=
=FHkP
-----END PGP SIGNATURE-----

--Rgf3q3z9SdmXC6oT--
