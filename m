Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F279444B03
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2019 20:46:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8289D1822;
	Thu, 13 Jun 2019 20:45:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8289D1822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560451583;
	bh=jvDauKSvM0plF2FnVxlFr5fsqapV6KCXOAkNtzGSDO4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CK0xwKTRVs+JrSCswBe7HdrJbpMmoGLx6MPiSKPa6M/2V4miTemJCmKICvNFQyHTh
	 pOhThpdzPTjVY1mG5RX6IemKAxPaL9ZtQpH/r3OrmA6KaoLNsU9rkEkk02vQhgmRTL
	 oxU0gaVEKjh+gIexBXOp6IuEYw/qFku91xaIEGqY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F051AF896F1;
	Thu, 13 Jun 2019 20:44:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A89EF89703; Thu, 13 Jun 2019 20:44:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E614F80794
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 20:44:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E614F80794
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ER0u8D7S"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aELbP90YPy875bOkQu44TwWr3Y4hzTOV6GaSBi8AHbQ=; b=ER0u8D7Swjx+l0ww+hYv3vPky
 rbop+qJ/q47xBYgD/mGTqc+xZfEIGFOOBlxDIJ7zR0F8kMMu1um3buPt9VG40XGxDrenzVLur1cJ7
 P+Ro9IZu1G8x/DZOMNiByNlotDcRQvrHhknYozE5KFxzG+kb4YFokonVPSQyjEQExIRmY=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hbUi8-0005P7-Ho; Thu, 13 Jun 2019 18:44:32 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 07BED440046; Thu, 13 Jun 2019 19:44:32 +0100 (BST)
Date: Thu, 13 Jun 2019 19:44:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190613184431.GU5316@sirena.org.uk>
References: <20190612164726.26768-1-pierre-louis.bossart@linux.intel.com>
 <20190612164726.26768-2-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20190612164726.26768-2-pierre-louis.bossart@linux.intel.com>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH v2 1/3] ASoC: SOF: trace: move to opt-in
 with Kconfig and module parameter
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
Content-Type: multipart/mixed; boundary="===============7583036222592169043=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7583036222592169043==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dg6Tyglv1qyvGx3q"
Content-Disposition: inline


--dg6Tyglv1qyvGx3q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 12, 2019 at 11:47:24AM -0500, Pierre-Louis Bossart wrote:

> +	    (sof_core_debug & SOF_CORE_ENABLE_TRACE)) {
> +		sdev->dtrace_is_supported = true;

Given that dtrace is a widely known product with a Linux implementation
can we not call this dtrace?  use_dma_trace or something?  A long name
doesn't seem too bad here but a collision with the more common usage of
the name isn't great.

--dg6Tyglv1qyvGx3q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0CmY8ACgkQJNaLcl1U
h9DH7Qf+LBSCocEMiYGm0Qmvor+WGSM7KmmY7kUw37/U3x0xKzxVM2HTtaqP0unn
py3PReTytj6bdBlum4PEX7DldtNFgcXPAc+5AHqgtt/4suWVZW0NQCIpbpcFTLZr
TkqMcuXD/i33zSEJw1BhFVOsSvnasBrwySJEXR5TBKADlae/6DZn2kEJ0Af2D8uI
BbhtNvqsBPi6MVJOxdhnuIMw/ep01KyPtYv8nF2LSAgVIz3AK4o9LoZlj/dtnump
MFNL3TpjSmjOprgFPN2sWtiIB14JKZsm2iGpUo3nucS4mhIAAPuOm0BIpz0rymy0
2ope1MP883EMohzgO8SZeedIfUBd/g==
=umP/
-----END PGP SIGNATURE-----

--dg6Tyglv1qyvGx3q--

--===============7583036222592169043==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7583036222592169043==--
