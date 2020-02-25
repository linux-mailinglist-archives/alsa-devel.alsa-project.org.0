Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B31C216C1E4
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Feb 2020 14:15:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42DD4168D;
	Tue, 25 Feb 2020 14:14:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42DD4168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582636542;
	bh=dd9ePapq9WVI7cjoASsjGziGbTgl7zRQaZJV27l9wZ8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VaYmwwS18Ur4dC+jIpY5fiXdhjRP1PIWvcoDgwEbUwri5UTCZiF+c9x80bC3tYCgC
	 MKtBmYZw/vZUoTDRg+c41zLrRWiKn40Orpe1Q6/zMY9LRY6UMZJnn+ctfZxpG8SBp7
	 5Dgxo3oM3rS7KRoFrXOoMol5az0AF1uU72VpApZg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 135CAF80143;
	Tue, 25 Feb 2020 14:14:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1E45F80142; Tue, 25 Feb 2020 14:13:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 7497EF80090
 for <alsa-devel@alsa-project.org>; Tue, 25 Feb 2020 14:13:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7497EF80090
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02919328;
 Tue, 25 Feb 2020 05:13:54 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A2713F703;
 Tue, 25 Feb 2020 05:13:53 -0800 (PST)
Date: Tue, 25 Feb 2020 13:13:51 +0000
From: Mark Brown <broonie@kernel.org>
To: "Daniel Baluta (OSS)" <daniel.baluta@oss.nxp.com>
Subject: Re: [PATCH] ASoC: fsl: Add generic CPU DAI driver
Message-ID: <20200225131351.GC4633@sirena.org.uk>
References: <20200128144707.21833-1-daniel.baluta@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="B4IIlcmfBL/1gGOG"
Content-Disposition: inline
In-Reply-To: <20200128144707.21833-1-daniel.baluta@oss.nxp.com>
X-Cookie: Booths for two or more.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, "S.j. Wang" <shengjiu.wang@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "peter.ujfalusi@ti.com" <peter.ujfalusi@ti.com>,
 dl-linux-imx <linux-imx@nxp.com>, Viorel Suman <viorel.suman@nxp.com>,
 "festevam@gmail.com" <festevam@gmail.com>
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


--B4IIlcmfBL/1gGOG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2020 at 02:47:30PM +0000, Daniel Baluta (OSS) wrote:

> 	* clocks
> 	* power domain management
> 	* pinctrl
>=20
> For this reason we introduce a generic FSL DAI driver which will take
> care of the resources above.
> ---
>  sound/soc/fsl/Kconfig   |   8 ++
>  sound/soc/fsl/Makefile  |   2 +

This lacks a signoff, see submitting-patches.rst for details on what
this is and why it's important.

--B4IIlcmfBL/1gGOG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5VHY8ACgkQJNaLcl1U
h9Bkggf+NFc15zsjS4QIV2DaUxkaJIlR+ksXVdjPkbwv+8e8jUttvHfZb+6Nd8L+
OUWXDup5SA6MGYW8HPAswswWPX8N/6ghjq72h1QTter2dDZ+qXRBsqOwrmnddf8k
384jTkaXxpDzN/Nv5DJ2z6/Oh7rKqJy8LW15f4Affj8Qy/QqgpPFP5jIse0DrpoM
hh8XphYn54t0BLQD67koCMSbRp1BNlJZ9OPXaZGlqZMYmNcUT1D9jcOSV4YJ9JYJ
+aF4nMjYmtM/rrqKmAfNjoo2ZT7X9iKeH7KvkQ8fVAPRog8nOXvJ+rlCWj/uWI1X
Vl1lYz4ZZ9wC0WH/esPGP1vHyL7gYw==
=Fd6l
-----END PGP SIGNATURE-----

--B4IIlcmfBL/1gGOG--
