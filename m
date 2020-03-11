Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D19181857
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 13:42:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 078F91662;
	Wed, 11 Mar 2020 13:42:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 078F91662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583930574;
	bh=S/kcQ/GZMhu2dXDxRmJmkiV7klRbmlrtYOr1l+sVPT0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KIwudk1FKNknc4bEjQq/UIo6ygY6w6xAUjQSzGKKLrHXWv0BwoS+NProKXGMuuOCW
	 eCO+RLmjbOQHCX2lWW3jEwtXGvczK5TEDylopjhA57nqvV3i6/BYKx9xz+hrhndW+5
	 Y/u9xVhCaDYgjI4qUdjRmR/3HR8jtBdFKC2IO8FI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61976F80141;
	Wed, 11 Mar 2020 13:41:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51EE4F801EB; Wed, 11 Mar 2020 13:41:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id C7967F800BE;
 Wed, 11 Mar 2020 13:41:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7967F800BE
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82D057FA;
 Wed, 11 Mar 2020 05:41:04 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 07FF93F6CF;
 Wed, 11 Mar 2020 05:41:03 -0700 (PDT)
Date: Wed, 11 Mar 2020 12:41:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Subject: Re: [PATCH 2/3] ASoC: add function parameters to enable forced path
 pruning
Message-ID: <20200311124102.GE5411@sirena.org.uk>
References: <20200309170749.32313-1-guennadi.liakhovetski@linux.intel.com>
 <20200309170749.32313-3-guennadi.liakhovetski@linux.intel.com>
 <20200310124544.GE4106@sirena.org.uk>
 <20200311074126.GA4149@ubuntu>
 <20200311122531.GD5411@sirena.org.uk>
 <20200311123617.GA5347@ubuntu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="sfyO1m2EN8ZOtJL6"
Content-Disposition: inline
In-Reply-To: <20200311123617.GA5347@ubuntu>
X-Cookie: I'm a Lisp variable -- bind me!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 sound-open-firmware@alsa-project.org
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


--sfyO1m2EN8ZOtJL6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2020 at 01:36:17PM +0100, Guennadi Liakhovetski wrote:
> On Wed, Mar 11, 2020 at 12:25:31PM +0000, Mark Brown wrote:

> > It's still not clear to me what the issue is here.  If something is
> > making a modification to the graph which needs a recheck or update I'd
> > expect that these things happen along with that modification.  I don't
> > understand what you're saying about not being able to reproduce
> > scenarios or adding things "on top".

> VirtIO support. That function currently exists in the kernel, but I don't=
=20
> have a test-case to verify its work, to see it called and actually perfor=
m=20
> the pruning. So I don't know how it is supposed to work. And because of=
=20
> that I cannot fix my VirtIO use case to use that function properly, witho=
ut=20
> forcing it with an additional parameter.

I think you need to include this with your VirtIO series.

--sfyO1m2EN8ZOtJL6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5o3F0ACgkQJNaLcl1U
h9CnaAf+MnDtWRotFnGqnmuFWD2Ny6OyqxGIWeTLm82mr4f2Zkz8hj0JT9LruzgD
LJfHz+c7waiELWT2FVicEjr+WOv6GMPLP5yTC1KxUsIKeEOF4XsjWGVnkRaFwWkr
NmoAPbSRZYQg+fK+ivnAs15WMM6fE0jR7+WzlZ4HL8gOe2ED5YRwfuXYVHbDMl7I
9f+r3QPpxQkNR4kz8yBfs0Sm2NtXH+2ehWDjTt1OHPE3nczqHqMHXmlYbRlSXcD4
rVfyTgjksCMmq2+KZS8ejXJKltbCi6dIDoBApwrt8gMUp44aEmTAjjz0bbRW/QIw
wQ49X0Y3SQ3OAB7t1n9f7QK6unoPmA==
=ZRGy
-----END PGP SIGNATURE-----

--sfyO1m2EN8ZOtJL6--
