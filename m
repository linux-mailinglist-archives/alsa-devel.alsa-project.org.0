Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B42157D06
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 15:05:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 988141678;
	Mon, 10 Feb 2020 15:04:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 988141678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581343501;
	bh=CO8BbZnLagN+NDqnpjYDzy7c1DvphPrJuFtumwRWpsQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J4140NBOmz67XcuDHinyV8YpIZ/m7k+doFckD+OgaEfcKl8WVtgpaHQV84JSJtqrv
	 aKy8vYYOC3l1uGKQsdC1H62mtBaQ14WJXF0cwk+lDf58c2JcGOXmXxdJN0GNGJZDS8
	 b6ZCHi58ul9UM7MvBXJP/yflcspmecJvCEKDYnDk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9738FF800FD;
	Mon, 10 Feb 2020 15:03:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 604ADF80157; Mon, 10 Feb 2020 15:03:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 5D0D8F800FD
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 15:03:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D0D8F800FD
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D343F1FB;
 Mon, 10 Feb 2020 06:03:10 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5816E3F68E;
 Mon, 10 Feb 2020 06:03:10 -0800 (PST)
Date: Mon, 10 Feb 2020 14:03:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <20200210140308.GN7685@sirena.org.uk>
References: <20200207091351.18133-1-geert@linux-m68k.org>
MIME-Version: 1.0
In-Reply-To: <20200207091351.18133-1-geert@linux-m68k.org>
X-Cookie: Avoid gunfire in the bathroom tonight.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>
Subject: Re: [alsa-devel] [PATCH] [RFC] ASoC: Use imply for
	SND_SOC_ALL_CODECS
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
Content-Type: multipart/mixed; boundary="===============2572348713620724917=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2572348713620724917==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TXIPBuAs4GDcsx9K"
Content-Disposition: inline


--TXIPBuAs4GDcsx9K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 07, 2020 at 10:13:51AM +0100, Geert Uytterhoeven wrote:
> Currently SND_SOC_ALL_CODECS selects the config symbols for all codec
> drivers.  As "select" bypasses dependencies, lots of "select" statements
> need explicit dependencies, which are hard to get right, and hard to
> maintain[*].
>=20
> Fix this by using "imply" instead, which is a weak version of "select",
> and which obeys dependencies of target symbols.

This is a *really* badly named feature :/

--TXIPBuAs4GDcsx9K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5BYpwACgkQJNaLcl1U
h9AJ6wf+JoGh6XxETeSB4TWntPU4POgBDY7UzyJaSzC/k9dxItOpbvF8sZbh3YVO
RqfpWryUL/Icpn8pUC785qgCczDrAzW3YB3tkwvAma8tNK/HA6TC4b5/pl2h0F1e
R5gValaXJ4qG0+Q9ZDNlDNmVX06fSlutz4K+UUBAP8DUgrXcQXqo4PhjIptTRix/
GKtNAePn3171ofUgEhfSpVE6I7zZHkcD0IC3CQ5Ss9ui/7YBzRls6qq5HOqEbvDD
4KvKMTM4lDu7u7f+R9ov/N0NEDS2ZtKNfoALHeQTBCplEhIbXSHZ5r0hF4LBAE9r
CI47bCrYKahz5DDreklkq0WdmyUZQw==
=MBOV
-----END PGP SIGNATURE-----

--TXIPBuAs4GDcsx9K--

--===============2572348713620724917==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2572348713620724917==--
