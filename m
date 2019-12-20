Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B27C127B78
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Dec 2019 14:04:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98ADE1677;
	Fri, 20 Dec 2019 14:03:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98ADE1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576847049;
	bh=ge2tUOuWEwlw16XBSjqAEGXBerJ+zLprB1syiih9pBQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h3D1hUQXg0HKrOiPjIW4qhACuvOegHNGmGjCXapbIWZrYk8TZyUhg+bNMk2XyTviN
	 /Hs627GM4JIAyNixV5U7axiTz6DHFmMss3ARzE1iiUbjk0uQ/xQluILn/yosbw0W+w
	 c54LAKfW3Kq4T7766Wm5tvQSnX7bXkpNgMaWrTw4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4AB8F8022C;
	Fri, 20 Dec 2019 14:02:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C374FF8014F; Fri, 20 Dec 2019 14:02:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 64A2CF800B5
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 14:02:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64A2CF800B5
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 011D630E;
 Fri, 20 Dec 2019 05:02:53 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 72F493F719;
 Fri, 20 Dec 2019 05:02:52 -0800 (PST)
Date: Fri, 20 Dec 2019 13:02:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20191220130250.GG4790@sirena.org.uk>
References: <20191219213257.366145-1-marex@denx.de>
 <20191220130030.GE4790@sirena.org.uk>
 <8769149d-99c4-f577-bc9b-c621c4f3eba4@denx.de>
MIME-Version: 1.0
In-Reply-To: <8769149d-99c4-f577-bc9b-c621c4f3eba4@denx.de>
X-Cookie: I think we're in trouble.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>, alsa-devel@alsa-project.org,
 festevam@gmail.com, Igor Opaniuk <igor.opaniuk@toradex.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: sgtl5000: Fix VDDA and VDDIO
	comparison
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
Content-Type: multipart/mixed; boundary="===============7514268705244091333=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7514268705244091333==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qoTlaiD+Y2fIM3Ll"
Content-Disposition: inline


--qoTlaiD+Y2fIM3Ll
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 20, 2019 at 02:01:30PM +0100, Marek Vasut wrote:
> On 12/20/19 2:00 PM, Mark Brown wrote:

> > This sort of peering inside the internals of the framework is obviously
> > not OK, please add an interface for this if it's needed.

> It's needed, unless there is a better way to compare two regulators in
> the driver already. Is there ?

Like I said above "please add an interface for this if it's needed".

--qoTlaiD+Y2fIM3Ll
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl38xnoACgkQJNaLcl1U
h9DbHAf+Lb8bH/E5V9i6sONFGHgv7D/obMUEdh8/Vq01umFyJSgmUmm9tmc97Yfv
FhGEgS1+Aj7vJ09bk0UHzqle2BH0YoSgwj5lTNznVsf4WZBKmpgnsXWVHSXMTZQc
uNgyMl10txZ7ebtxRXBc87fgC81ynFvbwI+CrZJXm0qu40xzZQ18WwYD586BgNw7
v5+zHYv1Qm6ZWpAYFdFKMcdwqegSgDkdiFQpShUvRxmMZeHUsYMpaFdxTVNlSEbc
Q486xRRAAgMHhjB3a+lzA4KjU2Eh0dWI6nnzbuMqEhCzv9Kouoou28iMPzbAQMFc
s1RS/Ve+fTK/4jP+LitKqeBg6xRwEw==
=YH8u
-----END PGP SIGNATURE-----

--qoTlaiD+Y2fIM3Ll--

--===============7514268705244091333==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7514268705244091333==--
