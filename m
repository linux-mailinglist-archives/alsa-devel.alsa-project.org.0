Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC81B412
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Apr 2019 19:19:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09AC3862;
	Sat, 27 Apr 2019 19:18:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09AC3862
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556385556;
	bh=oueA/JyEmNSPqXf4sueAnHe+S4VAJtpI6a8HmsjPHzA=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ncXWRmP/3PL5J4UIwPlb0i87dE/if9DiN5GavILtDne9q06HqOyhNUNN9x8pZi09O
	 qeihz/8K2hq7o4lF8K6bhHIMhyJRjbXOR/ZssjRJnp5iU0zlpr3txbAZPc9cwT9nYQ
	 ztRYwOQFZahnbfyA+MeZuOUHEnT0dnCGbSxs69/Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D7ADF896CE;
	Sat, 27 Apr 2019 19:17:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA861F896DB; Sat, 27 Apr 2019 19:17:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F0B7F8068A
 for <alsa-devel@alsa-project.org>; Sat, 27 Apr 2019 19:17:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F0B7F8068A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="poKkCc9h"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BrHF07zYw1XVu0tEvTnGpMr1OkuigjWVhQxqr86f0Tw=; b=poKkCc9hoL0tN0EHuvdyOZFJc
 I/KnBGgebnnQOmU+f9qBKc8if436wWlpFUQcoOcOXaA7vSOesU2AkPYLD22S8poQPVUVFE0jegTfv
 c63FPyc5BlugbBz8DHRNcNCXS8GcL0BN2BOYCug5XsIvQpdQ5ERRuUHvGPM2dyBohESmE=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hKQwy-0004XU-1x; Sat, 27 Apr 2019 17:17:20 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id BE38E441D3B; Sat, 27 Apr 2019 18:17:15 +0100 (BST)
Date: Sat, 27 Apr 2019 18:17:15 +0100
From: Mark Brown <broonie@kernel.org>
To: "S.j. Wang" <shengjiu.wang@nxp.com>
Message-ID: <20190427171715.GF14916@sirena.org.uk>
References: <VE1PR04MB64797233B0BFE833550094C3E33E0@VE1PR04MB6479.eurprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <VE1PR04MB64797233B0BFE833550094C3E33E0@VE1PR04MB6479.eurprd04.prod.outlook.com>
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [alsa-devel] [PATCH V3] ASoC: fsl_esai: Add pm runtime function
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
Content-Type: multipart/mixed; boundary="===============0503841381064934135=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0503841381064934135==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pyE8wggRBhVBcj8z"
Content-Disposition: inline


--pyE8wggRBhVBcj8z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 26, 2019 at 10:51:15AM +0000, S.j. Wang wrote:
> > On Mon, Apr 22, 2019 at 02:31:55AM +0000, S.j. Wang wrote:
> > > Add pm runtime support and move clock handling there.
> > > Close the clocks at suspend to reduce the power consumption.

> > > fsl_esai_suspend is replaced by pm_runtime_force_suspend.
> > > fsl_esai_resume is replaced by pm_runtime_force_resume.

> > This doesn't apply against current code, please check and resend.

> Which branch are you using?  I tried for-next and for-linus, both
> Are successful applied.

I'm applying against for-5.2, though if it depends on a patch queued for
5.1 that's fine, I can just merge that up - please just resend.  I think
I did try merging 5.1 though...

--pyE8wggRBhVBcj8z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzEjpoACgkQJNaLcl1U
h9CHlQf6A1P1Ke+eIk6AjsV7q+IJv+iAexa+x1wOv3kVyxN9HNXMrrjuzMEX9GHF
5r7c9xhmJkX6qp8qFYVofOXeK3E9muhfjvSakheiyz6b3bpOP4bTNpZPK2m48Eda
aKkSFsu/TBWB42fymUVC5tAo45RWNe+5OSZrpCHou5DnvhhEMmdoMNS2ZDzrYFSt
h0rgmD+tb0YTZgP7WuEx0L/iSe0epJDpXyN8wgBozUQJp7muUvLnBPHEWqsNnoY9
bLVkFnRQhyZVi/urL0G5fGfbDwjRSXtoJJwjczQDAwXy20veWbr10l88uPXRbL5R
rIYLJu11thD17a4mSdf/UCUix1rE0A==
=tACM
-----END PGP SIGNATURE-----

--pyE8wggRBhVBcj8z--

--===============0503841381064934135==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0503841381064934135==--
