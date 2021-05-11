Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD56B37A926
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 16:25:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 605FF17E4;
	Tue, 11 May 2021 16:24:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 605FF17E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620743146;
	bh=wJ+4cBBj7zHK6XS8zc7+fNwV8ORjVAMlWIuJ5Iuzs8o=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CIHcrvMywRHmYVB1Hz+uQMnjakBF2r4zMW9NX90hb++sS7OBcrSkddpUhqLsvZ7I2
	 PzSzrdonph8tgL0+9e05oBUWzfJGIpJ66jZWdhlmkUrR8pHPL7X+DO2JSPbdYw3+LQ
	 S9WIzaGVcZrxZzdFYC9dS9sTuVukBv/9qY2QyGd4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D87DBF8016B;
	Tue, 11 May 2021 16:24:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E815F8016B; Tue, 11 May 2021 16:24:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5DB9F800E9
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 16:24:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5DB9F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mragve0F"
Received: by mail.kernel.org (Postfix) with ESMTPSA id F1E196191D;
 Tue, 11 May 2021 14:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620743043;
 bh=wJ+4cBBj7zHK6XS8zc7+fNwV8ORjVAMlWIuJ5Iuzs8o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mragve0FOBm1OVcs9ENSktykBXpTAlvDdbY6U6NYXsL4GRjFXu/8qzKrerur8//8v
 //lUW+7b6CzoMSfZ3UtBghu6ZHq2tRYyjq7uY/uhGh4l6QbnKy5eAe/PJkdhoO5hHe
 LgttsgFY2Nyso/RvJUs2oSgI4YOS2uPkS477/K9r1UwoK2R9VxwU8ovbJjeAdAnA+F
 cPFqPA66I0uf/Y9izmGbWyvYZNNN/mU6vHh9P4tco+aZBSOn8rBFmEn+6ocX6JikH0
 zKx+aFAc/FiG/AXOsmci4gnArTYyeVPYR8458InI8s35fqJfIKwircEu3f770mNoOb
 fWejAlhMINwRw==
Date: Tue, 11 May 2021 15:23:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 00/14] spi: pxa2xx: Set of cleanups
Message-ID: <20210511142323.GJ4496@sirena.org.uk>
References: <20210423182441.50272-1-andriy.shevchenko@linux.intel.com>
 <162072071980.33404.13031284441613044277.b4-ty@kernel.org>
 <CAHp75Vck5izDB4mTRV5hTaknpx5Bm+OA4rNLVznQxVaEwigBZg@mail.gmail.com>
 <20210511134706.GI4496@sirena.org.uk>
 <CAHp75VdPHYEq+Xn5yQ+TyQn5uerc+afcVaHj22OmVzsBW2jcaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="5me2qT3T17SWzdxI"
Content-Disposition: inline
In-Reply-To: <CAHp75VdPHYEq+Xn5yQ+TyQn5uerc+afcVaHj22OmVzsBW2jcaQ@mail.gmail.com>
X-Cookie: Beam me up, Scotty!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 linux-spi <linux-spi@vger.kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Daniel Mack <daniel@zonque.org>
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


--5me2qT3T17SWzdxI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 11, 2021 at 04:52:40PM +0300, Andy Shevchenko wrote:
> On Tue, May 11, 2021 at 4:47 PM Mark Brown <broonie@kernel.org> wrote:
> > On Tue, May 11, 2021 at 03:28:18PM +0300, Andy Shevchenko wrote:
> > > On Tue, May 11, 2021 at 11:27 AM Mark Brown <broonie@kernel.org> wrote:

> > > The above patches are effectively missed.
> > > Anything to fix in your scripts / my patches?

> > Like I said, patch 7 didn't apply so you should check and resend.

> I didn't get it. I have effectively rebased the entire series and resend as v2.

No, you resent it again as v3.  This was me applying the bits of v2 that
would actually apply.

> I can speculate that your scripts have a bug since they might try v1
> as well (as far as I can see they usually send a confirmation of
> application for all versions of the series in question).

They end up sending confirmations for every version of the series I've
tried to queue unless I go and explicitly delete the older versions.

--5me2qT3T17SWzdxI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCak1oACgkQJNaLcl1U
h9BuxQf+OegOJM0y6NfKvrOgJTzp2GmTk4h80iy95DznuLEjuM5uqMUHLkySbAsF
ACndImPyX0HcJr1YWqWDnBjsp/f24gcAeWXyUYvFNUEtAyk+dBD5cagzHrRXX5ZU
WQOXqJtpO6ergLfANl22xwENmHcKyWlGVzcw3WWZjp1s1+fkp/T+p1pjC84+3IBb
v1PqVn0ozqU5ndAUVlpTWFWJ7codivp6LMPawIszqpXY5QL0j6cZlnxdLj6RJzjb
u6aZ7HlN+GIDDqfv9x/FrnLC1m0DtFw3SGKGJ/grF1iF9k25fMzP1YPu/vQokKUv
yqdh5VXfN8s2EVGn6IXTk1aqrKUWqw==
=SINU
-----END PGP SIGNATURE-----

--5me2qT3T17SWzdxI--
