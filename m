Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3002D229449
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jul 2020 11:00:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5D751660;
	Wed, 22 Jul 2020 10:59:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5D751660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595408442;
	bh=R0xVdgqiB7s3O/DqEs6GN9dYzeeYY+lcRy+1jPlzd70=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ldMAXbanK6/nMjsxJ890p9xDAe9jFbQOLt8HY/l36Gwc4yeb+acD5SeUCuQaroQoE
	 CGn4EXpon1gE7ud+MwYysVENrDMOD1pS+CuMPmFF9PY0aVB0Gcj0HLtBFnOM7qV5R4
	 wj+soZJXi/I/0ixNKQ54SEI+rZ4hc88t8axOOALk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE109F80150;
	Wed, 22 Jul 2020 10:59:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6378DF80141; Wed, 22 Jul 2020 10:59:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42CAEF80139
 for <alsa-devel@alsa-project.org>; Wed, 22 Jul 2020 10:58:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42CAEF80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="W9pwhuYH"
Received: from localhost (p54b33083.dip0.t-ipconnect.de [84.179.48.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 718E92077D;
 Wed, 22 Jul 2020 08:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595408332;
 bh=R0xVdgqiB7s3O/DqEs6GN9dYzeeYY+lcRy+1jPlzd70=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W9pwhuYHxVLA9WFvIszWER7midOVsx2uDEZoEd7TXs7QtDMzaybMeyOsADVuqMixq
 8C9QMQnw9W7brJHXh/UP+CTjQYwzdX6Xnwns3sb58eLqFWn1nspNwOdSNRFNo7rfF/
 2yWgceNvAxLbxamBwNA/XlbfB8F3vLj4kDrDDu5w=
Date: Wed, 22 Jul 2020 10:58:49 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 02/20] arm64: dts: renesas: r8a774e1: Add PCIe device nodes
Message-ID: <20200722085849.GF1030@ninjato>
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="1Y7d0dPL928TPQbc"
Content-Disposition: inline
In-Reply-To: <1594919915-5225-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


--1Y7d0dPL928TPQbc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2020 at 06:18:17PM +0100, Lad Prabhakar wrote:
> Add PCIe{0,1} device nodes for R8A774E1 SoC.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renes=
as.com>

Hmm, doesn't apply on top of 5.8-rc6 for me. Is there a branch to pull
for easier review?


--1Y7d0dPL928TPQbc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8X/8QACgkQFA3kzBSg
Kbb+qw//biayHVrdtr2LDibooHUV8qi0GGMOUqYzn6LSC97+YHSK+LuSg3RfHW28
WF9bREAuLpDfZj7B7VKkjk1UN+MBrzOtXvXMmVhenztZQQxBHd8HX+axLFK1HrZ/
K+3X+jbEsCB/NTac43d0yYFj9IkFBIPVcExN83vJcn4MWYpk6kUPN1yFz5bdLO76
Jh56YvRaeVbxKfU6rwv4Oho5JjJxbpmjZ3m+yyuT8dp+VEE3cV9aesW3R3Rl2d71
pV7hc5gr7zIgadYfWUovWX1MzgD4Q0e5H5nLjjOIGYwhj8A6l1JT8n5vw6b3ERbM
MPBgNHQbohKl9HWcD48LWNQBhH8j4AM9tD7iXxXFeC8olpn+aFFKLV0YK1fqocXE
EZXT7Pv544SZPZetGfHNEkq9fQkkJ/IzcomQIIfWLCTLw0wc67QwDpE11pphkHg/
fwcYu54T/WhlUGrmFQmbrXYboytT7CzXFSuZ5VeJZqgi1zDtFqThHjPr/us5E0SA
Jghh/PHZnWDIYS2MB+revceePGtrEnK8Chu0XMDnfyrh4Naspk88ISX5WLDq8juh
FBb4W335vVfUJ0ByD1kgErUH6/qxrvcYC5QH0Txk40i2WBt8ISyeEugJir2uS2U6
M8fJEh5lzVQeKdG8zyI6i+aD+xhktGR66DbOLncW8feW2NB0m9Q=
=RR4j
-----END PGP SIGNATURE-----

--1Y7d0dPL928TPQbc--
