Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F419B36C38A
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Apr 2021 12:28:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91FA816E5;
	Tue, 27 Apr 2021 12:28:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91FA816E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619519336;
	bh=PkbpQPCMTjoIh2VV3B0ik4ihg1MqxO//wd5qNPWSajQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G4bNZtBUX9jVkUmGpKtK+l80mXU2dTv1D5kITAlkKle9XAYf6f/js+9o4+KS9Rtm1
	 VFDiusqICo0KWJh4+5URM7+j1lR9Gsforb2CE5j/6PizALszcz5qSQoBknaqxJdXkq
	 9pOSzYBC7hrpmrwlUMSfR7pzSH3BuEn/WI1qaVZw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1923F8026C;
	Tue, 27 Apr 2021 12:28:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3792F8020D; Tue, 27 Apr 2021 12:27:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B479F80117
 for <alsa-devel@alsa-project.org>; Tue, 27 Apr 2021 12:27:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B479F80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="esm7a4wI"
Received: by mail.kernel.org (Postfix) with ESMTPSA id AFFF0610FA;
 Tue, 27 Apr 2021 10:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619519262;
 bh=PkbpQPCMTjoIh2VV3B0ik4ihg1MqxO//wd5qNPWSajQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=esm7a4wIjmb0MYb1yVcV+YdpeaSw5kx5CkV6TUm2Bs5dAYuArnS2g3WjhzEtSN6Sb
 Uu8smaSC5Mr1KTantZ8agoaf3Rp6m3I7PEeuPqGnPMwdb70HixfuLbf/UVvT+9iy1t
 Jx8gF+DcoGNGsVQjs7G6ZHc8Llahu2VgNDoiq4MwHyDwkiziwLeqcsfkleel55lRGk
 6ZICk8TooqPKjx7RV6K7nQIwKFFmxMT/SFmOoRsk6vKtc0Smt9X8ynIuNwSJ6AwSMh
 Fl0IXRfeLvpxS+WnjmvU0xFRw8iNpslScEJdQhutNdr/R6Z07FpmkGXs9tje18yoBO
 xmistmWvDYsRw==
Date: Tue, 27 Apr 2021 11:27:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v2 5/5] ASoC: da7219: properly get clk from the provider
Message-ID: <20210427102711.GB4605@sirena.org.uk>
References: <20210421120512.413057-1-jbrunet@baylibre.com>
 <20210421120512.413057-6-jbrunet@baylibre.com>
 <69eaa840-ed77-fc01-2925-7e5e9998e80f@linux.intel.com>
 <1j7dkon8jy.fsf@starbuckisacylon.baylibre.com>
 <1jim48jdee.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="mojUlQ0s9EVzWg2t"
Content-Disposition: inline
In-Reply-To: <1jim48jdee.fsf@starbuckisacylon.baylibre.com>
X-Cookie: Don't feed the bats tonight.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Stephen Boyd <sboyd@kernel.org>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org
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


--mojUlQ0s9EVzWg2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 27, 2021 at 11:16:25AM +0200, Jerome Brunet wrote:

> Mark, at this point I think it would be best to revert patches 1 and 5
> while we work this out in CCF. The other patches are not affected.
> Sorry for the mess.

Sure, can someone send a patch with a changelog explaining the issue
please?

--mojUlQ0s9EVzWg2t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCH5v4ACgkQJNaLcl1U
h9CrLwf/SCo0dRr48IRNPpomWWQ9h2CLsqPKI+ft4yDGNCxY6gQG7+oWDQFDFC/n
c/XxNm9Y6rf/Ml13SMpKz1Qi4ioqJz43A3wubc0RO3aBJVNBHs6wIs7ht8LRRStf
B2t7nBwNu0WW+8CRj09hqEBiFmhriNQ0r356ieWk49L15xbDf5G8xZhj+PG4vRXR
6NC6XnoGclZrHR1M5ttkvPlEMPnaAkMPZcrREYue6SCXFTPDSgnZ1+sWA8TGIBjn
R23roMb9m8TrOZ8wp6acDw00F2F+yd1dUBhoHh/cw44jCquBh9hqpthMOq6kOM8L
iqPMWM3C+rDnpTFoff26DDm2vV8vxw==
=dm6N
-----END PGP SIGNATURE-----

--mojUlQ0s9EVzWg2t--
