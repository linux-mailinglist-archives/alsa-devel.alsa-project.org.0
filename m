Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E0611E2D8
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Dec 2019 12:34:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C0B11781;
	Fri, 13 Dec 2019 12:33:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C0B11781
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576236879;
	bh=TYvdw6dOPVb3ilJ0H47pLeyvzAkjlWXe6H6AD0qSlgU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LZ+bzRMeLOChqr9HvpexEM0IUjJy56lvdKZDwmk7hsVDV2fn/2gkbaqwjhTKBrnHX
	 JdlMLA/NsbbQxNmo/SOE0YzMyNp+ToGJgxIASi2QxHPrSusXxy8W8WjTUCGwY78qPP
	 rz6DrU+0SgqnekPNl9klk0GPHzYXf5uO7fYhg6oQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56EE2F801F4;
	Fri, 13 Dec 2019 12:32:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9253F801F4; Fri, 13 Dec 2019 12:32:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id CF409F800AB
 for <alsa-devel@alsa-project.org>; Fri, 13 Dec 2019 12:32:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF409F800AB
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4EA11045;
 Fri, 13 Dec 2019 03:32:43 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 30B113F718;
 Fri, 13 Dec 2019 03:32:43 -0800 (PST)
Date: Fri, 13 Dec 2019 11:32:41 +0000
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?B?amVmZl9jaGFuZyjlvLXkuJbkvbMp?= <jeff_chang@richtek.com>
Message-ID: <20191213113241.GA4644@sirena.org.uk>
References: <1576152740-11979-1-git-send-email-richtek.jeff.chang@gmail.com>
 <20191212145330.GC4310@sirena.org.uk>
 <b0f4c1afd1d341b49b87b7b5cda5ea4d@ex1.rt.l>
MIME-Version: 1.0
In-Reply-To: <b0f4c1afd1d341b49b87b7b5cda5ea4d@ex1.rt.l>
X-Cookie: Life exists for no known purpose.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 Jeff Chang <richtek.jeff.chang@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: Add MediaTek MT6660 Speaker Amp
	Driver
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
Content-Type: multipart/mixed; boundary="===============2120516141434417198=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2120516141434417198==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Content-Disposition: inline


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2019 at 07:36:15AM +0000, jeff_chang(=E5=BC=B5=E4=B8=96=E4=
=BD=B3) wrote:
> Dear Mark:
>=20
>=20
>=20
>         Thanks for your replying. I consider that there was only one item=
 I should modify. So I kept resending.
>=20
>=20
>=20
>         Please refer my red comment after your comment.

I can't tell what's in red or not, kernel development gets done with
plain text e-mail.  Please fix your mail configuration, it is extremely
difficult to read your messages for this and other reasons.

> The writes to reserved registers should be fine but things like this whic=
h looks like it's configuring the input path should just be left at the chi=
p default, we don't want to be configuring for particular boards since the =
same driver will be used for every board with the chip.
>=20
>=20
>=20
>         The chip default cannot be modified anymore. How can I do if I re=
ally need write these setting in our drivers?

Settings should be done through some combination of userspace
configuration at runtime and device tree or ACPI properties.

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3zdtYACgkQJNaLcl1U
h9B8kwf+IpjaEaGa2G/sBNA8Uba5iLxJH77tx+EkitOF1sumwNDj1XNcuYqb9lDl
ak4VjrPpISMuFyn2bA1jcGMDT9Kt7Iu9Ho2H/trihujQasAESaDskolv4ePg0XVV
azTK7X98WsarZRy6EpuWWSCmF1ePPpA60fHtM3rjQbKDhAb+6VVIl6kDEeWvhwtt
aPl5Twi1fjMqgPtqSdCe/aREpmiREG19zoTy/M/INreV7T5KY4ndfV/m6YNnBVss
T0ambE+xjV94LIULzEsa5fno9DKIgGOmrKxunAXswLk8B4Za0Auhv7E3XBvc/CpR
7kTt0mjLMsVXjv75mbnn2BKi7Zdovw==
=PyY0
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--

--===============2120516141434417198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2120516141434417198==--
