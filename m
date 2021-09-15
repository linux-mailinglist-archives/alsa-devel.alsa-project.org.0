Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 379C640C476
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 13:40:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C35921838;
	Wed, 15 Sep 2021 13:39:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C35921838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631706035;
	bh=w6LggeeoHKDbw/r0KjRkY9TGXJHw2rqKesUZZlht328=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WJ/NEVS/Pssj0alC4amh18VGGMm5Qv6rNNxqaGwWn4gUr1k67VHPCZicb3xIshVUx
	 6XSOVP51KZ06Se/pfqU0VvUSIT8Te7MbIuc/EnIpv+HOQ6CHvXsgAxC9qziUFZdxob
	 LCZqr561R0H96VyVD2hNCqRTZjiO0J1dFEM2NTmA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2699CF802E8;
	Wed, 15 Sep 2021 13:39:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C8B5F8027C; Wed, 15 Sep 2021 13:39:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECB3FF80117
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 13:39:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECB3FF80117
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eKX4F/rL"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5E64061283;
 Wed, 15 Sep 2021 11:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631705944;
 bh=w6LggeeoHKDbw/r0KjRkY9TGXJHw2rqKesUZZlht328=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eKX4F/rLKIpSx+z3R26uMPew78smd7WdG/+3Ckw5JlCY0XVumyQzp+23d7DcEf0f/
 kHKxxJmVHdjGNB1WFFAtgq6GRBKHn8C6e6ra2I507Y96duIc519Bu6IF6i/hXcxmfQ
 xurNKoOAzsAippw9wjMkkK+9xzjrnp4eQHFX8lkv2UQGbmrog9Ftf7AmKv3nu4Ylan
 22lR5TuzFsHmRLzgQKp7nZwVMKtKZ6R5LwbM8ssRZ/VDRBTnxHSWXgoSNucHIQ82w3
 VmA7Hi4QAbWwD9ZoG42C8tlnMOL+joF0j1gzSMUm/lif/3MFSKry0C9FTnjtYgxeOE
 yhTrTx2RnobKw==
Date: Wed, 15 Sep 2021 12:38:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 6/6] ASoC: cs35l41: Fix a bunch of trivial code
 formating/style issues
Message-ID: <20210915113821.GA5389@sirena.org.uk>
References: <20210914141349.30218-1-ckeepax@opensource.cirrus.com>
 <20210914141349.30218-6-ckeepax@opensource.cirrus.com>
 <20210914142301.GF4434@sirena.org.uk>
 <20210915105352.GC9223@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="y0ulUmNC+osPPQO6"
Content-Disposition: inline
In-Reply-To: <20210915105352.GC9223@ediswmail.ad.cirrus.com>
X-Cookie: Absence makes the heart grow frantic.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 james.schulman@cirrus.com, lgirdwood@gmail.com, david.rhodes@cirrus.com
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


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 15, 2021 at 10:53:52AM +0000, Charles Keepax wrote:
> On Tue, Sep 14, 2021 at 03:23:01PM +0100, Mark Brown wrote:
> > On Tue, Sep 14, 2021 at 03:13:49PM +0100, Charles Keepax wrote:
> > > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

> > >  sound/soc/codecs/cs35l41-i2c.c    |   5 +-
> > >  sound/soc/codecs/cs35l41-spi.c    |  13 +-
> > >  sound/soc/codecs/cs35l41-tables.c | 477 +++++++++++++++++++-------------------
> > >  sound/soc/codecs/cs35l41.c        | 387 +++++++++++++++----------------
> > >  sound/soc/codecs/cs35l41.h        |  81 ++++---

> > This was upstreamed with your review a week ago :/

> Yeah sorry about that, they are all trivial patches (with the
> exception of the first patch which I did only notice whilst
> fixing up the other stuff) it didn't seem worth delaying the
> series for another couple of rounds for such trivial commments.

> Apologies if that was the wrong call.

These are pretty large changes, it's not just a couple of small cleanups
- especially this one is pretty huge.  Also note that Rob found a bunch
of errors in the DT binding that need fixing.

--y0ulUmNC+osPPQO6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFB2y0ACgkQJNaLcl1U
h9A7hwf/aHYoJvsuR5TZVz5FpSkL3XfMca/w1DJ6pkYtBRBhc8oPuzFq9t3tLm6i
FDn0cBk0IJcI2dTtHoSvYbp4wlJc4eU6Gcy9MWFzkLmrHSeNxhQoiUgMLp5i0leb
5ljkliS5lTIuOZwYw/Usr/1Yq89fF6oONfWCs8+qKnyscKdiXAaEQvseSZf84IRG
ize+RIKGhvsPQGFtGnoY4reGEtC8F2NWD5g4TTTpWPJE8Pfxy89fcQo+ccoZS7xe
J4UdWFUX2hgH6/HEu79fD1ixQcG6W1huFij1k7cfNbKzVcnGK7tbm372oTwzjc47
PhPHGk5oF2LXBkEVwG3bLPKaLshVug==
=b1WB
-----END PGP SIGNATURE-----

--y0ulUmNC+osPPQO6--
