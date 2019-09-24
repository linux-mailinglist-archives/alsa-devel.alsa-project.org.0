Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 153D7BD10B
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2019 19:55:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 938E016B2;
	Tue, 24 Sep 2019 19:54:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 938E016B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569347730;
	bh=Dj5Skp8zQufe0Vw/ETPdr/a1/cJwooRgjCq2U0xINYg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I+86QLu4ZZP5z5lmlVvcZp6J4Enr30HO4jX3XvRzwe6SaCw7QKQbr0MMOFk1xi+Br
	 Xw2eXAwM109CyRKLdyCJM9beToPdrx7YJ9kIXNS6iY7O/ikIkAUa2T9AH/X4psZofu
	 02dXFbMy18IZjonJlNSTdsgpwXmj6lkTn97bx27Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA3DAF8045F;
	Tue, 24 Sep 2019 19:53:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38699F8045F; Tue, 24 Sep 2019 19:53:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7831F80213
 for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2019 19:53:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7831F80213
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="YUUOdTv/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RfaGhOuuaoUpgOSeA87BArKChGzJFLuolLSxNgY48EI=; b=YUUOdTv/bquXQ2zrHHSKrlSFt
 +w8XjExOCZbO5SK8wfWBtRXPYq6T7syJFvSGsQEM7ab1LTK+o/qaBbvmzSwdUt6X98vFnWQa0CsIX
 UHSrybJfrAwp2JSl2kFMFz4uZJSd8bl0/upAu3p9d8OF1SMLvDbFi2xJnWjXHDICRrRK8=;
Received: from [12.157.10.118] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iCp0I-0002MR-BK; Tue, 24 Sep 2019 17:53:34 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id B2EB0D02FC7; Tue, 24 Sep 2019 18:53:32 +0100 (BST)
Date: Tue, 24 Sep 2019 10:53:32 -0700
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <20190924175332.GB2036@sirena.org.uk>
References: <CGME20190924114843eucas1p2ea9c36289d3912e022ad7c9070fc00ee@eucas1p2.samsung.com>
 <20190924114838.25482-1-m.szyprowski@samsung.com>
 <20190924115307.GA9188@pi3>
MIME-Version: 1.0
In-Reply-To: <20190924115307.GA9188@pi3>
X-Cookie: Be careful!  UGLY strikes 9 out of 10!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 Maciej Falkowski <m.falkowski@samsung.com>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: samsung: i2s: Add clocks' macros
	descriptions
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
Content-Type: multipart/mixed; boundary="===============0226280420196641105=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0226280420196641105==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FxQkOwrLuQ+yAGv2"
Content-Disposition: inline


--FxQkOwrLuQ+yAGv2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 24, 2019 at 01:53:07PM +0200, Krzysztof Kozlowski wrote:
> On Tue, Sep 24, 2019 at 01:48:38PM +0200, Marek Szyprowski wrote:

> > +/* the CDCLK (CODECLKO) gate clock */
> > +#define CLK_I2S_CDCLK 0

> I do not find it more readable because of removal of indent
> after define name. Also the description is not accurate - you
> documented, not increased readability.

Yeah, I agree on both points.  How about putting everything on
one line more like:

   #define CLK_I2S_CDCLK	0	/* the CDCLK (CODECLKO) gate clock */

instead?

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

--FxQkOwrLuQ+yAGv2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2KWBsACgkQJNaLcl1U
h9AzoQf/S2ro+Bt+q/pyvdXc6kray/h1w3lBnrewElE9HPb9/fOERfjl4x4RFpXQ
X9F5NDh+4ol8uNUceRObxMYaYARZnLDeK3jG0/33Lu62lc0S7XkC9jMI8JlE//c1
vgIYN/qbJOSc4f7FJtQKrjt5SNVwE6Laeg/xwtobiBBnWc36Ptj8uGmacV5XcTBI
MAQ1DLWYyYdK12Cb1MgLrtgjVMXAPzfqpeXfnv6XrWL+yPfukYuQw9V6fkqjFEwc
qlsWasox6b+8qYO9DPwwaIATWH7rDctNHZPczQ4JQZKKTz/L42BrkwEIpxLgmLg2
3x+yOV+bhiZaX0VZWXOAkuGpR6d9uA==
=zvuY
-----END PGP SIGNATURE-----

--FxQkOwrLuQ+yAGv2--

--===============0226280420196641105==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0226280420196641105==--
