Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D51D3D99A9
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jul 2021 01:42:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B1C91F47;
	Thu, 29 Jul 2021 01:41:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B1C91F47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627515728;
	bh=bwsV5GSE+mQt/iUhC9W7pV9yYShQiS/j/L6KdceZwu4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J0LlLykJtwD/p62oOQE67P5Ho94S84raHoVJ/EjmfF7u+YGyNgvi7nTq3j3qR+h9j
	 YBk5+Xx1geCjdYqEKGdya3I7AzunOa9fHD/r8slfHuhwV5v/oSiQOi/2FbL/Y2TwtW
	 6Lc3WeDZdpG3MdjlbtVfKyv0g5mvfMRdPTJtr9ns=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22FDFF8025E;
	Thu, 29 Jul 2021 01:40:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0116FF8025A; Thu, 29 Jul 2021 01:40:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67B04F8020D
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 01:40:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67B04F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="o6oIQ8Wp"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 107756103E;
 Wed, 28 Jul 2021 23:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627515628;
 bh=bwsV5GSE+mQt/iUhC9W7pV9yYShQiS/j/L6KdceZwu4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o6oIQ8WpxCueu2SMIn2rgWrEd/4rFibd0B+5X6MsBjsgMwOpnDhNmW7LmMCvMDY5b
 0zOAvnp8YM1W4i8apColW24hh2IQgSQLNGOI9nNeUpiS8e5hYpLGvBS/hJT2PVPNhD
 eBN18Q5tVNmIEqOsVzvhhdp4NyEAnQZ0gSzAN8+hLGOIjfj0XbCyE4yFNX4rw/pQsJ
 dba8FhuX/7jDH0I3xJpOvOGFhTbzT6TiOWil3MPr/OvMkyFIrtZhpA2/OJSvRhf+Ui
 lLkaJom261WC4XuKaKfRTqvKxkEGR3/TCqWr7D/LVOof8x1nl5IyfXfDUEifYxM7AY
 QWIwJYpx0m3Kw==
Date: Thu, 29 Jul 2021 00:40:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: dapm: Revert "use component prefix when checking
 widget names"
Message-ID: <20210728234018.GH4670@sirena.org.uk>
References: <20210703125034.24655-1-rf@opensource.cirrus.com>
 <20210705165041.GC4574@sirena.org.uk>
 <a882a9e0-db05-2f89-abb9-8b308ccb56c8@opensource.cirrus.com>
 <20210728160948.GE4670@sirena.org.uk>
 <a59d60bf-6bbc-c65f-bd77-2b1bc98b0d22@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vhOf6eAHdfH9MSjZ"
Content-Disposition: inline
In-Reply-To: <a59d60bf-6bbc-c65f-bd77-2b1bc98b0d22@opensource.cirrus.com>
X-Cookie: Vini, vidi, Linux!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 shumingf@realtek.com, rander.wang@linux.intel.com
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


--vhOf6eAHdfH9MSjZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 28, 2021 at 07:29:30PM +0100, Richard Fitzgerald wrote:
> On 28/07/2021 17:09, Mark Brown wrote:

> > The thing here is that nobody would have thought that that any caller
> > would have been open coding this stuff like the component things were,

> On the contrary, since that was the only way to use these functions with
> a prefixed component it's entirely possible that there is code already
> adding the prefix. Why would you expect nobody has ever written code
> that works?

Prefixes just aren't that widely used, explict DAPM calls to set pin
states are more commonly used but tend not to be used in the simpler
systems that would normally use prefixes (though Soundwire appears to
have changed that quite a bit).  There's a decent chance that the Intel
system that ran into this is only the second or third one that ever saw
the two features used in combination.  This sort of missed case is a
thing we still run into from time to time with prefixes.

> > like this so people wouldn't think of auditing the callers to find uses

> I don't think that it's either safe or desirable to skip checking how
> callers use functionality that you want to change. My understanding of
> Linux development protocol was that if you make a change that affects
> other code, you are responsible for updating that other code to match.
> Regardless of whether you agree with how that other code was
> implemented. It creates a lot of overhead for everyone if it's ok to
> make changes without trying to fix up other code that is affected by
> that change.

Sure, and that's exactly how I spotted that there was a problem with the
patch you posted - your patch was clearly going to break the systems
which rely on the change to _find_widgets() including all CODEC drivers
that use the DAPM level API.  People should and generally do make a
reasonable effort to check things out but it's always going to be that
rather than a guarantee, you can't 100% rely on people spotting things
especially when callers go off piste and do weird things.  Some of the
assessment of reasonableness on the part of everyone concerned is going
to involve looking at things like how secure the abstraction layers
involved are and how one would expect things to work, also influenced by
things like the volume of users and how easy that makes it to find
unusual users.  That's most likely what happened here.

These things are going to happen from time to time, when they do the
thing to do is to raise the issue (as you did initially) and then engage
in any discussion about what's going on and how best to fix the problem
(which was a bit of an issue here).  If you have proposed a patch but
there are other things that need to be considered there is likely to be
some expectation that you might follow up with a new version unless
people have explicitly said otherwise (submitters often have a strong
preference for this).

--vhOf6eAHdfH9MSjZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEB6uEACgkQJNaLcl1U
h9A4ugf/WCVbCqC2pBFoXlYK54esbrhx6P7+SKulcpHO817HMDNyImk4lGMflqZW
mGCrLw1xkR6jm7IUBGHt/9OD3R7w9gPgswaWreeweoUabS/Wxezy95a2SoRKlVNb
v7y5fGLxh5pnlWDB3rlAwGnGxs/rcvixBtpax3Cy38Kic5xamnaP8inj8NhPHNPv
avoU7ICL8pcjWCqJLIBKpVH7da1qXFx/zFum+9tQbcmpdmbDIWNbxHp58IjKlErc
NCpiVNrp3ohYTIBI1HPJNS9k4KPV/03U74t2nFq1UsE6CTVtrtJYO/+eFHlHutQA
Z5hE5IL3InOfsJ02RpvBfhL5xbWgXw==
=fNs7
-----END PGP SIGNATURE-----

--vhOf6eAHdfH9MSjZ--
