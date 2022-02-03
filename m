Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3834A82D5
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Feb 2022 12:04:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCF7616BC;
	Thu,  3 Feb 2022 12:03:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCF7616BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643886274;
	bh=ixHLp2G2+8HtqW2DJSrSS+Y66uiaMqbRsPCgFBbmzzA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Y4MYRpI5DuqMiePqNU0BcppgfGt8qA0Dckxi9XquWqY1igX4CUQ1/6dMC4yNWwZWb
	 SBN1wHlyT/y5YqlfjWBBSY+vZyws/sK72xSxhAUE6/RMlE39OQKhRLamH6UEHV+V4+
	 tOdgZPn/MSJFuV/gMhTVaq0BOjVmEjjhuqC/YXsg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EC31F802BE;
	Thu,  3 Feb 2022 12:03:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10DCFF8027C; Thu,  3 Feb 2022 12:03:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCD67F80082
 for <alsa-devel@alsa-project.org>; Thu,  3 Feb 2022 12:03:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCD67F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bGPfWxFi"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EABED615C7;
 Thu,  3 Feb 2022 11:03:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC0CDC340E4;
 Thu,  3 Feb 2022 11:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643886200;
 bh=ixHLp2G2+8HtqW2DJSrSS+Y66uiaMqbRsPCgFBbmzzA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bGPfWxFi4OoCCoyXhMVkVvEBoXLnFD+mZ4NacTZlyaoeLtHsMEKYP2AoaLx1fGLBr
 pXewIArvCpsM4SdluauMAq/rQwqCaCTsrK8iN8qz/8gUce3BunX0kbl27Re1CI45jZ
 awZ95YwpQ4F/aV9pxN8+h9EMThRHlB13XJeCuJQjgPC6IW01ygppaOcao14/eWpPQE
 26hwOWZFLTN8zHR0oue3xWOJWjV3C+qV7ODhpdHaxJlRhcpbC9Bg4OPiHaPSC+P3Rb
 Wvj0Xu9MPNs82CsMaqAPKtFn31IGL1RccE1nrhnnFzTDUqLfzKrYwQPas6GTFrKOA6
 zf4ziUKv0slZQ==
Date: Thu, 3 Feb 2022 11:03:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs47l15: Ensure regmap_irq is built
Message-ID: <Yfu2c2LV7lTwv+FC@sirena.org.uk>
References: <20220202191700.3654382-1-broonie@kernel.org>
 <20220203100522.GE18506@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jcAfADad3c2k5H0M"
Content-Disposition: inline
In-Reply-To: <20220203100522.GE18506@ediswmail.ad.cirrus.com>
X-Cookie: Prices higher in Alaska and Hawaii.
Cc: alsa-devel@alsa-project.org, Lucas Tanure <tanureal@opensource.cirrus.com>,
 patches@opensource.cirrus.com, Liam Girdwood <lgirdwood@gmail.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 James Schulman <james.schulman@cirrus.com>
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


--jcAfADad3c2k5H0M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 03, 2022 at 10:05:22AM +0000, Charles Keepax wrote:

> >  config SND_SOC_CS47L15
> >  	tristate
> > +	select REGMAP_IRQ

> Would it be better to have depends on MFD_CS47L15 instead,
> that way the other dependencies would be covered as well? I think
> these were added before implies was a thing, and thus
> dependencies didn't matter, since they could only be selected
> which ignored deps anyway.

It doesn't actually have a dependency at the ASoC level so it doesn't
super matter.  Given that it's this driver that's using the IRQ
controller it needs the select it would probably be better to have that
set up in the MFD anyway.

> I would expect L35, L85, L90, L92 to be affected as well. Happy
> to do a patch to fix this up, if you prefer?

I don't mind either way, it's not causing problems to have the
dependency missing.

--jcAfADad3c2k5H0M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmH7tnIACgkQJNaLcl1U
h9BdjAf9GkPBeenwn4dbodm/8VHRSKN5jbkmHhvJcWS3KPLA8e7LbZ+fn7IIlJDR
VYNleewjO8dRvCW5t69Cp3Jfah1JwRn7/iwJoXdSvAUDm7URQAUjVFtwYRSoduL4
QYLXZT00QYwlwFvWp/vXBCPfe3XWbLdfTI6ie3OfMaftkNxqe9l6Fnz7oa+qpYjz
hq+BQJEAGvH58bvY3w8jld9OcBZDrdwnSS949ezPCzqEVP19OWQUH3Pxfgj7KZlt
NB2SI+uBW1lOODnL4RcupgREPIzc2cj5J3OkLv30TSSj1vqMWQjMzSGzGyRFi/gG
jWqQO+TxPa0fKRQSM2zcL66bLAoHWg==
=hz0S
-----END PGP SIGNATURE-----

--jcAfADad3c2k5H0M--
