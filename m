Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C4C2DAC3
	for <lists+alsa-devel@lfdr.de>; Wed, 29 May 2019 12:30:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0180D16DE;
	Wed, 29 May 2019 12:29:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0180D16DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559125823;
	bh=olPj5g49CvlD+Tnnvun4J3KNjAQa83oI4UNSJtnwI64=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PVmY+Jf0PTqJMfxlhQ/EcGeQQo/teJOUpOJUvUfqS53XNYhm+VE8WrbIXYb97B2BP
	 X8E/DDMt/W1s/CAcQ6pEvKzL2MtiQlTlIq1gNNL15cbgFbyE4JD+ayu+IuO7pkOJrW
	 H3+v3nS+lxlNUR9aJ82OLZ1gwUthm9U8dJYhVLAU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E168F896E5;
	Wed, 29 May 2019 12:28:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B78DF896E4; Wed, 29 May 2019 12:28:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A89F9F806E5
 for <alsa-devel@alsa-project.org>; Wed, 29 May 2019 12:28:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A89F9F806E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="NTYW+K+D"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hlNVu+GF0SjmhQ77ROXYvaDg9E4HhiQ13jeyXeBhqtU=; b=NTYW+K+DtVPo9SGcT4dCuYQ15
 6WJH5mErjLG1rmC3harcp8O6af6eT6eoedxjn2UTctm9im805OjpdMQxf6ogtprGoJtzraBgfVQoA
 clxmsLwaCvP7qr1gjeLbf5C8mxRI0st/r20HZ/6xKBGfIFkz2MrAdDWC+s5caJyKd6CJI=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hVvon-0004ml-Gu; Wed, 29 May 2019 10:28:25 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 4094D440046; Wed, 29 May 2019 11:28:24 +0100 (BST)
Date: Wed, 29 May 2019 11:28:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>
Message-ID: <20190529102824.GN2456@sirena.org.uk>
References: <1559040459-16488-1-git-send-email-georgii.staroselskii@emlid.com>
 <CAGb2v64osE5yVdpCxSRfpkaq2TqeUUiLUbr3wZWW1rawuqxW-Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGb2v64osE5yVdpCxSRfpkaq2TqeUUiLUbr3wZWW1rawuqxW-Q@mail.gmail.com>
X-Cookie: The other line moves faster.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Danny Milosavljevic <dannym@scratchpost.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Georgii Staroselskii <georgii.staroselskii@emlid.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH v2] ASoC: sun4i-codec: fix first delay on
	Speaker
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
Content-Type: multipart/mixed; boundary="===============6103409602312535183=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6103409602312535183==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sWvRP97dwRHm9fX+"
Content-Disposition: inline


--sWvRP97dwRHm9fX+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 29, 2019 at 10:34:25AM +0800, Chen-Yu Tsai wrote:

> I wonder if we shouldn't just keep the amplifier section powered up
> all the time.
> Also it seems not very many codec drivers go all out with DAPM.

Leaving the amplifier powered up all the time is going to burn a lot of
power and make any pop/click issues in the inputs more apparent.

--sWvRP97dwRHm9fX+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzuXr0ACgkQJNaLcl1U
h9B/JQgAhiaOXeIOyteRvhqURWW/1spsihg8TeHWBScXmrQX/R0VwELj3hjhy5Ba
W6e7/X6sS/WUY8U+GE1/JWoOGCzGB/wi/Gs6W4E3GmegSu184H2gWwEpVlSjKP3C
fmvTSqommDR+xP/XxOv/oD0oyEkttLMX4psUw+jNjN/1GTNVZSxtX03V+/NM3OIg
tQGvT8LodFWr7zVrU3vrJCtEudoXIXtvYXUD77rulZjpDZqS4O0EJPUfIgA12AQ4
3H9C9Hk4CmcZfvjE0tfDMCcPdlo1RZTyCZVfNpOXgmW6zTHZW7tGhg06gMo1GoWy
Muw0Y5jjzucEaRn//CF6GyeK/xsIXg==
=3Vid
-----END PGP SIGNATURE-----

--sWvRP97dwRHm9fX+--

--===============6103409602312535183==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6103409602312535183==--
