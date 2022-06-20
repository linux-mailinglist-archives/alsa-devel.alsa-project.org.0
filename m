Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8F2552384
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 20:05:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79DAD281F;
	Mon, 20 Jun 2022 20:05:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79DAD281F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655748352;
	bh=w6vacAfaqohw95S+mHKQgM+EKeWnz+yRbKl9pZAYgT4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RgYHYjfQhQNnQBi3aXVPMxIxOW8TKTy3aNyLQFazcyYPAG7zoBz0oI1mxSqffegIO
	 4ej1Y4L04t+yo78Bsp1l0rHnCY9yKS0xqRStNi1Mb2GZEFmoRIwaCtlICLhdqJCXfL
	 YkzJpssqlujTS5XITBBLOa2gRfRY8FLZqEQA2Blk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D21CAF804DA;
	Mon, 20 Jun 2022 20:04:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5937F800CB; Mon, 20 Jun 2022 20:04:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9AD41F800CB
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 20:04:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AD41F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="PDbsfohM"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A33F961586;
 Mon, 20 Jun 2022 18:04:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8716C3411B;
 Mon, 20 Jun 2022 18:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655748282;
 bh=w6vacAfaqohw95S+mHKQgM+EKeWnz+yRbKl9pZAYgT4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PDbsfohMbYv3MffqWofo0S7UAM3OWif/Gh/rKbWiB5wStzqG5O9JTSUqCxbcdE0QC
 R/gf2j1b5t9kZBUtQHuHnZCby4kToF6ZQz8v25NCzG35JTNUA9cascUN+S073vlodc
 747BGINyYhkum55MlnQPY8NgidJYQETduCBfJE5A9qcQLGtD/NX5B3SDxToS08R8zW
 QczCMm7/qmod4Dj1zd4PhHwZxjs0ft4iu8z/zXspS/6BzPCOojI/0tjp4NrGKMyer5
 Yn4WJ/mWub0Pq9N6Cf4r5eu01pjH3Bh2o/AVSJBcJ8HwigExQEsdjrModduyoJzPRf
 7e8dlrFn6tAOQ==
Date: Mon, 20 Jun 2022 19:04:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierluigi Passaro <pierluigi.p@variscite.com>
Subject: Re: [PATCH 4/4] ASoC: wm8904: add DMIC support
Message-ID: <YrC2tLI+nUxOGsIX@sirena.org.uk>
References: <AM6PR08MB43760A5F78137DAE68FE99C7FFB09@AM6PR08MB4376.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="VOCVAPjBvueWLvm9"
Content-Disposition: inline
In-Reply-To: <AM6PR08MB43760A5F78137DAE68FE99C7FFB09@AM6PR08MB4376.eurprd08.prod.outlook.com>
X-Cookie: Good day to avoid cops.  Crawl to work.
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "shengjiu.wang@gmail.com" <shengjiu.wang@gmail.com>,
 "tiwai@suse.com" <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 Eran Matityahu <eran.m@variscite.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 Alifer Willians de Moraes <alifer.m@variscite.com>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
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


--VOCVAPjBvueWLvm9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 20, 2022 at 05:52:43PM +0000, Pierluigi Passaro wrote:
> > > Just for my understanding, are you suggesting to set a device tree
> > > property to force a fixed behavior in the driver ?

> > Yes.

> Why should we use a fixed behavior ?

The things that are fixed by the design should be fixed.

> > The device shares pins between the line inputs and the DMIC inputs so at
> > least some of the configuration is going to be determinted at system
> > design time, that will fix the usable values of at least one of the
> > controls which ought to be reflected in the runtime behaviour.

> In our design we use:
> - pin 1: DMIC_CLK
> - pin 24: LINEIN2R
> - pin 26: LINEIN2L
> - pin 27: DMIC_DATA

> we have no pins shared among DMIC and LINEIN.

This means that DMICDAT2 is not usefully selectable at runtime, you've
got IN1 as digital and IN2 as analogue, so while the DMIC/ADC switch is
useful the DMIC1/2 switch is not.

--VOCVAPjBvueWLvm9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKwtrMACgkQJNaLcl1U
h9AVVAf8CNJ1pKU5n40o+hAHDCPrpMkjTpft6KOXuI6XY7ImplHB1hCdT7Q6WATf
aBd0+QPrVbh1F8JPhUXGwsovT2NTqxO3mnuv8rf3W6/q+sBvebRFd6JFtqPixkRx
it74je2CMTZXE5dCFp/IC6RfN1A73ommQqkSbMHv/ISFBDJXFwCtBXCkip3sHmIu
ogp7fB7pZYgfsxh24nHeREBI+HAiwbqefgu7wDTBQ3DEIbWYq3xRffqucidYnUwp
yenPU0ysSpOEBZXcU9QxvKxlh+H3dPNF4xNKNHXzqIt3IPWJF2WFF4JLdxKGzvoF
pAKrexCNszAQZt19PrBca61dzOHDeg==
=G8Fe
-----END PGP SIGNATURE-----

--VOCVAPjBvueWLvm9--
