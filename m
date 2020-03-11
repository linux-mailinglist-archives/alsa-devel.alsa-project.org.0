Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F08C6181DA0
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 17:19:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B9E11663;
	Wed, 11 Mar 2020 17:18:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B9E11663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583943571;
	bh=/0EZdibW8/6Fqv7KGjl4A5TMVNUEQDfBMGCjKRV0ivk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ncNi/SwbCkbSL2XNmB2pDdh07l9gI9xw8tA01UYvOaqUhJnNxHcyFls6x3zbJQnnD
	 E99md5zr+vswdVGVScSi6QHysFe9So1Yry0JTF1TJK7AY0Hk6KW3G8F74TXDPBOIQ3
	 mhbYi++WKg7VkLNqcVH62ROOm8h2djY7G8FMNeCM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEC2BF800B5;
	Wed, 11 Mar 2020 17:17:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7CB15F801EB; Wed, 11 Mar 2020 17:17:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id CFEFAF800BE;
 Wed, 11 Mar 2020 17:17:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFEFAF800BE
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C365831B;
 Wed, 11 Mar 2020 09:17:41 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4847E3F6CF;
 Wed, 11 Mar 2020 09:17:41 -0700 (PDT)
Date: Wed, 11 Mar 2020 16:17:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Subject: Re: [PATCH 2/3] ASoC: add function parameters to enable forced path
 pruning
Message-ID: <20200311161739.GF5411@sirena.org.uk>
References: <20200309170749.32313-1-guennadi.liakhovetski@linux.intel.com>
 <20200309170749.32313-3-guennadi.liakhovetski@linux.intel.com>
 <20200310124544.GE4106@sirena.org.uk>
 <20200311074126.GA4149@ubuntu>
 <20200311122531.GD5411@sirena.org.uk>
 <20200311123617.GA5347@ubuntu>
 <20200311124102.GE5411@sirena.org.uk>
 <20200311132658.GB5347@ubuntu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="QXO0/MSS4VvK6f+D"
Content-Disposition: inline
In-Reply-To: <20200311132658.GB5347@ubuntu>
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


--QXO0/MSS4VvK6f+D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2020 at 02:26:58PM +0100, Guennadi Liakhovetski wrote:
> On Wed, Mar 11, 2020 at 12:41:02PM +0000, Mark Brown wrote:

> > I think you need to include this with your VirtIO series.

> That was also my original intention, personally I also would find it diff=
icult=20
> to review this kind of work without context.

> So, would you prefer me to drop this series completely and re-send it wit=
h the=20
> whole series or should I just drop #2 and resend #1 and #3?

1 and 3 seemed fine, should be OK to send them separately.

--QXO0/MSS4VvK6f+D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5pDyMACgkQJNaLcl1U
h9CrLQf/cvyxbWgRgKP/9e8w7jnrUjQVz97iR09CtssiwqrIAjAtPo1k3E5gdiCg
by584uGsUv3ovnRkSFGQsD7WdrtdtqIOHBU9HcIDatBDAGkNRgJDpp+eNPhE4Qku
/iCKU+yhI8bG17vYbUnbobzEudBpaMw7PanG4PsgKupuit/cIDpZaxnfXoIlTsiM
+gvTtsvRsq0Pwd9f9DrXO6Z2OfOGpKkHbzO46tz7+ASa493YWAu4EpCKZDss6HS4
rNsyjzNnFfpsHLimv3zR9PPVt8ddsdgrO1x/YV8OSIR6dMVp8luzrMOByXicy89U
lUs4UdYm1S8ZH1enYYF9ASD+WFj3tA==
=y1Ec
-----END PGP SIGNATURE-----

--QXO0/MSS4VvK6f+D--
