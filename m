Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAF553FC9B
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 13:00:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3EF21AE7;
	Tue,  7 Jun 2022 12:59:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3EF21AE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654599608;
	bh=MdS+txKXv+9X5ryEdcg9mNAEZ7btmpcAumgQQKGGxks=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fiKt4x+sJT8k+LR4kI18AJ/O35MJ00aKkqrBThjo2Q+Zq9UGf1UfYTiyXs43NmpMC
	 sTabjXC3Zf4DBSncKr5vNGhHGh5sZJqAtli8FE0NgMbxhJYJrnldQWi9NDFr8YFvjZ
	 CrI3skVSE0mZpi9CEqiZ6qI3OPx/BRxqCwM4fSBA=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AAA36F80116;
	Tue,  7 Jun 2022 12:57:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D07DF800ED; Tue,  7 Jun 2022 12:57:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8DDFAF800ED
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 12:57:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8DDFAF800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="G0Mj0kX8"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 969156154E;
 Tue,  7 Jun 2022 10:57:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A07BCC385A5;
 Tue,  7 Jun 2022 10:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654599430;
 bh=MdS+txKXv+9X5ryEdcg9mNAEZ7btmpcAumgQQKGGxks=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G0Mj0kX82xuV6/ArZJYjYJCZ7GC7zEiBlGrcwPGdtQvilE9MxqU03+Rw02AIEkMTo
 f96eOIOyu24h2JHFgJ6379aZuOqzsdrlxNIEFo6QRYbV2z3io0u/awWR9WABEfuGii
 NCsoqQrYAmA3RUaTg0/tTLaEJltQP1q2RYvpjkXeFezeN1AMkaZMS53ADEibrJuER2
 KK8D1PMfwG+WOhhEzXIpvldpPimnG7FrVtU0cECgg1JMVT2PJ08RgqzmJCIFknyLwf
 Lp+yJg5dOMzFAKqxLw9CJTSdGzdHGBjLOhaL+XC8iksXH5LYjONcypcq6h1kJ0HhQF
 JAWr5DxBmbx2A==
Date: Tue, 7 Jun 2022 11:57:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] ASoC: dt-bindings: renesas,rz-ssi: Document RZ/G2UL SoC
Message-ID: <Yp8vAJHkJAQuDqMx@sirena.org.uk>
References: <20220423133154.141027-1-biju.das.jz@bp.renesas.com>
 <OS0PR01MB5922E60C12F1B49A949913A286A59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="GXbXScl54FIbGRKd"
Content-Disposition: inline
In-Reply-To: <OS0PR01MB5922E60C12F1B49A949913A286A59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-Cookie: Where's SANDY DUNCAN?
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
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


--GXbXScl54FIbGRKd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 07, 2022 at 10:49:22AM +0000, Biju Das wrote:
> Hi All,
>=20
> Gentle ping.
>=20
> Are we happy with this patch? Please let me know.

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

Please don't top post, reply in line with needed context.  This allows
readers to readily follow the flow of conversation and understand what
you are talking about and also helps ensure that everything in the
discussion is being addressed.

--GXbXScl54FIbGRKd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKfLv8ACgkQJNaLcl1U
h9Aq/ggAhE7veJ8rah/J3hheu5lkagPNihFTKaV61Udo7zG07xni5ABebgYDFZL2
a591f4BomXe9yjdF867WxvRDf5Sm171Gb0O0zvbDM7dTIemv24MKOEZ2m9sBOhvQ
2eO+GnryNx6gyZe++VhJ359WnIB1ueIL0Q/nQthaKycbQn1w6xCyuUBD+8raCe05
je+YFe2TccOYCEd7c1HuXJJjTKNXk6j6YgshgZjZVkfeSYKY7NmwA/bLp2c6QLvA
0eDm/lnm+esgjv223RCVel1rBy+TtfRLVYQHrO9O/dajsa7Luxaydz6/8LueIcNH
RRL1enLtDeRFmTW6ovOfcBlktnusEw==
=+1se
-----END PGP SIGNATURE-----

--GXbXScl54FIbGRKd--
