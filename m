Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F4811D2D7
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Dec 2019 17:55:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA0C416FB;
	Thu, 12 Dec 2019 17:54:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA0C416FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576169702;
	bh=7YDIksE1mIitffO6LLeU9AHG/BKxi8X6J9aHXTuFVS0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b4c6uYDweMfYLEh2jrYoy21MfOvndhodH+3CgXV01K28Bv0I5cJJHq35N4ct2PlIr
	 LmuwsQT7Q42Y37rAI9xG8tzisv+/CzLuB1R/HAeaWVTKZxjjKO6ohhSXP9/LBsjyPl
	 E3y87uRA3a+jkT3poaa5oXo7S5L51z0aQnkCN1e8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6C10F80139;
	Thu, 12 Dec 2019 17:53:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD471F8020C; Thu, 12 Dec 2019 17:53:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 5E029F801D8
 for <alsa-devel@alsa-project.org>; Thu, 12 Dec 2019 17:53:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E029F801D8
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 884F830E;
 Thu, 12 Dec 2019 08:53:13 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0452F3F6CF;
 Thu, 12 Dec 2019 08:53:12 -0800 (PST)
Date: Thu, 12 Dec 2019 16:53:11 +0000
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Message-ID: <20191212165311.GK4310@sirena.org.uk>
References: <1576065442-19763-1-git-send-email-shengjiu.wang@nxp.com>
 <20191212164835.GD10451@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
In-Reply-To: <20191212164835.GD10451@ediswmail.ad.cirrus.com>
X-Cookie: We have DIFFERENT amounts of HAIR --
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: kstewart@linuxfoundation.org, guennadi.liakhovetski@linux.intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 gregkh@linuxfoundation.org, Shengjiu Wang <shengjiu.wang@nxp.com>,
 tiwai@suse.com, lgirdwood@gmail.com, patches@opensource.cirrus.com,
 tglx@linutronix.de, allison@lohutok.net
Subject: Re: [alsa-devel] [PATCH] ASoC: wm8962: fix lambda value
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
Content-Type: multipart/mixed; boundary="===============4231189140586567167=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4231189140586567167==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ogUXNSQj4OI1q3LQ"
Content-Disposition: inline


--ogUXNSQj4OI1q3LQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 12, 2019 at 04:48:35PM +0000, Charles Keepax wrote:
> On Wed, Dec 11, 2019 at 07:57:22PM +0800, Shengjiu Wang wrote:
> > According to user manual, it is required that FLL_LAMBDA > 0
> > in all cases (Integer and Franctional modes).

> How well tested is this change, and is it addressing an issue you
> have observed? I agree this does better fit the datasheet just a
> little nervous as its an older part that has seen a lot of usage.

I've got a feeling that requirement might've been added in later
versions of the datasheet...

--ogUXNSQj4OI1q3LQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3ycHYACgkQJNaLcl1U
h9CUewf9HCpR8m1farmmx9Se1np+I9L3i4ncQb8j5AD1UGgSmhZMsNze4JTk6oWA
9DT0aL69PsnCxrYL8gV8CMy0vJPKhLg3+nRQvb1aVsRPBbWbtFQkSZA4YJ/xnmuu
lC7PGYlGH7XM2z8QU7XwRsZQVwZ183+1QF4srp4w+VSCDtTku8I4nHzVzCOvGMaF
3T8dZQkGZ642sYUA3ZZCBRfVJOKIE/JsEQYLTksyOLqIAhjzvg31uyT+P1GnvZjV
iD7C8zj22PjiICoEhOFk+0KpLcb38763CCxC7jF4Z3prrNY+jV0ExukK4VfG3vCh
67xrgyK5Y7JF8tUgkZ5Zu9c9/ulLZQ==
=q6x7
-----END PGP SIGNATURE-----

--ogUXNSQj4OI1q3LQ--

--===============4231189140586567167==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4231189140586567167==--
