Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C8219952F
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Mar 2020 13:15:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A3111658;
	Tue, 31 Mar 2020 13:14:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A3111658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585653340;
	bh=t+sGS83451YfLZdD2OHShBxKbGbrT6v1M6x+36Q/n7I=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RsimI5xHos/HhoKGT810PbPAo0qYL+EFWBqLigb7NCjQXKUZJdwii+moFJVwn9J1R
	 goheZkaeOIGUCvDOZuSQH1vHxytNuY/4He+XgAbYtD0SPaEgI++3A2hb+cglYEvU16
	 2+JaGoErJXxU6wvYzKYOxiWUtDjJR3OA+UhYbzfg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B345CF8010D;
	Tue, 31 Mar 2020 13:13:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1D35F80146; Tue, 31 Mar 2020 13:13:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 PRX_BODY_30, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id D7392F800AA
 for <alsa-devel@alsa-project.org>; Tue, 31 Mar 2020 13:13:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7392F800AA
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 998FE1FB;
 Tue, 31 Mar 2020 04:13:50 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C1E13F52E;
 Tue, 31 Mar 2020 04:13:49 -0700 (PDT)
Date: Tue, 31 Mar 2020 12:13:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Matt Flax <flatmax@flatmax.org>
Subject: Re: [PATCH] ASoC: snd_soc_dai_set_fmt add substream independence.
Message-ID: <20200331111348.GA4802@sirena.org.uk>
References: <20200328015831.6230-1-flatmax@flatmax.org>
 <20200330103213.GA4792@sirena.org.uk>
 <3c00bf93-04a8-04af-e0b5-d0f76f5dbb06@flatmax.org>
 <20200330163142.GI4792@sirena.org.uk>
 <98c3a94a-9020-9a34-7bdf-0ce504573f79@flatmax.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline
In-Reply-To: <98c3a94a-9020-9a34-7bdf-0ce504573f79@flatmax.org>
X-Cookie: It's later than you think.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com
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


--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 31, 2020 at 06:40:26PM +1100, Matt Flax wrote:

> ok, I don't quite follow you, but I think what you are saying is that there
> is a trade off between simplifying things for the end user and core
> complexity leading to developer sloppiness ?

> I believe you are saying that it is a rare case to require format asymmetry
> in the same DAI link. For that reason introducing extra functionality into
> the core may not be worth while ?

What I am saying is that we already have a perfectly good way of
representing separate TX and RX DAIs which is far more flexible than
your bodge and that if there is something to be improved on the
userspace interface we should improve that rather than add this which
seems like a bodge.

> > No, my advice is to go down that route if you are doing this.  I'm just
> > not convinced that it's going to work reliably since this all sounds
> > rather shaky.

> OK - I can try to go down that route. However I would like to confirm that
> having a codec to codec link doesn't require the original codec or CPU
> drivers to have separate DAIs for playback and capture ? In my case both the
> CPU and Codec drivers have single DAIs for both streams.

OK, that probably won't help then :/

--fUYQa+Pmc3FrFX/N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6DJekACgkQJNaLcl1U
h9AdpQf/QzDp70jb+h4WpM74DmBq+G6Dr6bhdoTjpiZgBNBhlzgZxZemY4wjFKQV
9mDeLdapiTpne7AdiBB+lwcXU3Mw/N5fmtSjVE5qDXjIn1vhHLWBLiMCP4+KjJps
eA1TODs9DDuPR27zVlCqNg5ODf91GhYGlPNNeEkZooVy1+NHL2LLqTapJpwGLE9I
6pNkiDm1+Ud31zdq4LRLa5hVMkoXyBB2QyvAnu0KAdeFvMf+ZeeHGv4KejpyCxqY
hd9D0YEep0YfUuPOd6h4t5YWM+JwdzowUZF8QVIX3HqMjSAQ8e+Sx5ewhG6nDOtH
tjYe6uSZ1VNL27fkRK5HyYilcMUYuA==
=Eqfu
-----END PGP SIGNATURE-----

--fUYQa+Pmc3FrFX/N--
