Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 472F32877DF
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Oct 2020 17:48:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9AB661657;
	Thu,  8 Oct 2020 17:47:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9AB661657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602172117;
	bh=8QfTbDYZuk/iLmPmelI7NtYV422By0L/KwoQi+AqV+w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q/sr/mjzVrfW5TJauXpQ5FQIBIDfFYf3sSAlq6cV8fLRFbgVxsXJWfXJglyJTEUw/
	 Hk8O+Etio+Cou5U+7SWZ2IlovIzySP4di188wIwHJh1KQbaNwGecR3OXqX3GdgiRek
	 WH/HklZIBP3HJmPFORhp81supqmhwrmvqh5C9Ews=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D744F80167;
	Thu,  8 Oct 2020 17:46:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C757DF80164; Thu,  8 Oct 2020 17:46:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56D9BF8015A
 for <alsa-devel@alsa-project.org>; Thu,  8 Oct 2020 17:46:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56D9BF8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nl1n7DZs"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 652D520739;
 Thu,  8 Oct 2020 15:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602172004;
 bh=8QfTbDYZuk/iLmPmelI7NtYV422By0L/KwoQi+AqV+w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nl1n7DZsxWfgGu1yhgtt5ucPtdGK7yH+mdD2IugVvAAEKpysxwo0KchkvY7jk39Wd
 6Z+q3ciJy7bpBu/o9PyRuPMz+IEsunQKkgS1Gk8d6pirbPFbYMQFu+Io7uBq+A13ko
 zPL/P//KWkYGSZmgPdFbETgYtns8RWU9kojQ/DDs=
Date: Thu, 8 Oct 2020 16:46:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: (Optional?) DMA vs. PIO
Message-ID: <20201008154642.GB6481@sirena.org.uk>
References: <20201008150539.GQ4077@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="R3G7APHDIzY6R/pk"
Content-Disposition: inline
In-Reply-To: <20201008150539.GQ4077@smile.fi.intel.com>
X-Cookie: Serving suggestion.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>,
 Stephen Warren <swarren@nvidia.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, "Sit,
 Michael Wei Hong" <michael.wei.hong.sit@intel.com>
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


--R3G7APHDIzY6R/pk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 08, 2020 at 06:05:39PM +0300, Andy Shevchenko wrote:

> My main concern is what was the idea behind? Does it mean we support optional
> DMA in such case? If now, why not to return an error code directly?

...

> no idea, the code has been this way since 2013
> (5eda87b890f867b098e5566b5543642851e8b9c3)

That's "ASoC: dmaengine: support deferred probe for DMA channels" for
those playing at home.  It's been that way since before then since
previously we ignored errors entirely.

> It's worth asking the question on the mailing list, I don't know if this is a
> bug or a feature.

I'm fairly sure it's intentional for systems with limited DMA channels
available but ICBW, it's obviously been quite some time.  In retrospect
a comment explaining the decision would have been a good idea.

--R3G7APHDIzY6R/pk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9/NGEACgkQJNaLcl1U
h9BRTQf/Ty6MOn/ahsCc5jSPN207/SZFPMbrdcrrnF04wCrXIykBDoT4uWK9dLDI
dwWXovifJAoN+yHdDkPQ+uS3KwN8ptBYYUdnGM8nmDEp/F5qBWLGIRAVBm9e65Fa
fwkWpOjm6Bl2h19MNxOQWOQfEWsTtuXjZIZNqwFw+t8WHrxtqAqpydriYEG7kw0m
X2e5BMaGUJUaakwoZ1b3gqSbZrRM27+SvIisLUjtyMzKGrvpidWfxbDAqrxJ3xg6
+QII4sMJA8NcDaqMNN7D+stkkQyFgWyfpTyy9DmgiwKUgFhTdBnwZJFK3UdmYXYm
YR0L/nRj51iPHuTdlVg407x71hlQag==
=diFH
-----END PGP SIGNATURE-----

--R3G7APHDIzY6R/pk--
