Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 486A1166708
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2020 20:19:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8DBC16E2;
	Thu, 20 Feb 2020 20:19:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8DBC16E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582226393;
	bh=fYWUmFhvIZEW7EE1tT9DCfw4pyvNRhmVwpwmcFItVpM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X528KVPKBN/WreAM0aF/ylQI10y7Urn1egFiGd/EsNbYPxm/aLa+1/r07t/SMI0ql
	 fWjL7MOPqN/Ckkh+iinD3rgnQaRxyAS83YQwuzY6iLOQ9OApXnNMrvfWSOPlZ78dBw
	 6WcEXCWOKZhbqwTVw6APw3m758DWWaUvkvDUGpgs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC6FDF80101;
	Thu, 20 Feb 2020 20:18:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C229F80148; Thu, 20 Feb 2020 20:18:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 39DD0F80101
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 20:18:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39DD0F80101
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 474ED30E;
 Thu, 20 Feb 2020 11:18:05 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ACD463F6CF;
 Thu, 20 Feb 2020 11:18:04 -0800 (PST)
Date: Thu, 20 Feb 2020 19:18:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH] ASoC: tas2562: Add support for digital volume control
Message-ID: <20200220191803.GH3926@sirena.org.uk>
References: <20200220172721.10547-1-dmurphy@ti.com>
 <20200220184507.GF3926@sirena.org.uk>
 <de0e8a5b-8c2a-ee04-856f-f0d678a3c66b@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jRdC2OsRnuV8iIl8"
Content-Disposition: inline
In-Reply-To: <de0e8a5b-8c2a-ee04-856f-f0d678a3c66b@ti.com>
X-Cookie: You are number 6!  Who is number one?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com
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


--jRdC2OsRnuV8iIl8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2020 at 12:46:57PM -0600, Dan Murphy wrote:
> On 2/20/20 12:45 PM, Mark Brown wrote:

> > Is there a reason not to use the chip default here?  Otherwise this
> > looks good.

> Chip default is set to 0dB full blast+ 0x40400000.=A0 This sets the volum=
e to
> -110dB.

OK...  that's a policy decision the same as all other volume changes and
so shouldn't be done by the driver - as ever we don't know how the
system is set up and what values make sense and keeping things out of
the driver means we don't end up with competing system integration
decisions causing changes in the driver.  The system may have an
external amplifier they prefer to use for hardware volume control, may
prefer to do entirely soft volume control in their sound server or
something like that.

--jRdC2OsRnuV8iIl8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5O22oACgkQJNaLcl1U
h9BNnAf/STD8X1meBVMym8n0PChi4jx1nA4QyPkwc1x8USlqaoWsz3QHBi7Q6H37
OG5YcO02ATyyjTe0rCZVKgyQUQ7Bmtw2bWRhNS3KH3HL90f0/kgu4K84i0UJ6psr
wfnDq2dItRwnq/EEwburkJom8ZJac9dii3HfF7jsafA1PoWgEdCy2pCY6liTfUNS
GzbqXIuXTIG25A6oHG7HE8489gPuC57XRapoGUyQ3gIj+ems8EwEAUkqVIA3symp
+6ZO2qTqhA+ArEuOptlxpjVLoNcQfddeJ/jwBZZQtCa2h/cwSVmzcfOorbznBmp9
KshHMzn9Z/sa+dmi0twVgXHv9mtEJQ==
=YOPj
-----END PGP SIGNATURE-----

--jRdC2OsRnuV8iIl8--
