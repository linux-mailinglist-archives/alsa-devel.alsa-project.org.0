Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3762B2B539A
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Nov 2020 22:18:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD3051766;
	Mon, 16 Nov 2020 22:17:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD3051766
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605561499;
	bh=Uc8csdr9nVuNlvsq7Ewr1XAi7nkuS9F2vn5vmoK+/PI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a9qZo36/nqft0mBBUESP8hVX4b8NyFGmVnzylsWpc69s8MpZQm/j0re+1HrYKi3rb
	 JfXDeaAyHHrsfMKX8tw1aGZI3ZY7niQ9vkHw5qqY+qnQgyj/5lw83MZxIFP7zPYTDD
	 P1IusqW56f2WkyGlSK8UqJ9/2l7eGW0/CbsdDDBw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43C59F8016C;
	Mon, 16 Nov 2020 22:16:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00223F8010A; Mon, 16 Nov 2020 22:16:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3D45EF8010A
 for <alsa-devel@alsa-project.org>; Mon, 16 Nov 2020 22:16:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3D45EF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AWGjtYa1"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 62393206B5;
 Mon, 16 Nov 2020 21:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605561396;
 bh=Uc8csdr9nVuNlvsq7Ewr1XAi7nkuS9F2vn5vmoK+/PI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AWGjtYa1Hz1WEasyf1jA+nVbs+jeaQzyZ+2QqlaCdNqpl7NbZ9F+Q8cR2zBjh1BIC
 3hsgJ8binrLXTeYUcJZgW2LizOdUTo7RhkATQeACsldGYZUPY0jchY/7mxSg/ABvXm
 VvCBeEfP86eB2mpt+8j+jiMdYyLrO5au98qhczSI=
Date: Mon, 16 Nov 2020 21:16:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 3/5] ASoC: soc-generic-dmaengine-pcm: Add custom prepare
 and submit function
Message-ID: <20201116211617.GL4739@sirena.org.uk>
References: <20201116061905.32431-1-michael.wei.hong.sit@intel.com>
 <20201116061905.32431-4-michael.wei.hong.sit@intel.com>
 <20201116195816.GH4739@sirena.org.uk>
 <4bd0ad0c-70b9-9a75-5a8f-86cf95c486d5@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hTKW8p8tUZ/8vLMe"
Content-Disposition: inline
In-Reply-To: <4bd0ad0c-70b9-9a75-5a8f-86cf95c486d5@linux.intel.com>
X-Cookie: Immanuel doesn't pun, he Kant.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: cezary.rojewski@intel.com, lars@metafoo.de, andriy.shevchenko@intel.com,
 alsa-devel@alsa-project.org, jee.heng.sia@intel.com, tiwai@suse.com,
 liam.r.girdwood@linux.intel.com, Vinod Koul <vkoul@kernel.org>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
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


--hTKW8p8tUZ/8vLMe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 16, 2020 at 02:10:16PM -0600, Pierre-Louis Bossart wrote:
> On 11/16/20 1:58 PM, Mark Brown wrote:
> > On Mon, Nov 16, 2020 at 02:19:03PM +0800, Michael Sit Wei Hong wrote:

> > Can we not extend the dmaengine API so that the ASoC layer (and any
> > other users) can become aware of this limitation and handle it
> > appropriately rather than jumping straight to some client driver
> > specific handling?

> This was supposed to be an RFC, I asked Vinod/Lars to be copied for
> feedback. Unfortunately the RFC tag is missing and Vinod's email wasn't the
> right one... (fixed now).

> This patchset suggests an ALSA-only quirk, having other more generic means
> to deal with this limitation would be fine - we just wanted to have a
> discussion on preferred directions. The IPs used are not Intel-specific so
> sooner or later someone else will have similar limitations to work-around.

Generally with the dmaengine stuff we've added new query APIs to
dmaengine and then used those in the ALSA/ASoC code to enumerate things,
this certainly sounds like something that another device might have so
it seems worth following that approach.

--hTKW8p8tUZ/8vLMe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+y7CEACgkQJNaLcl1U
h9DNwAf/Xy32Nl6zrSuP5QHFqH+aTBxhqTdEUg0NAphamWHQl01uQM/ecNdFvKwJ
IQ9Ga20ghWWPhA8hG+Es/D1BT7YLd7Wi9rZTJeg4cyax1swthmiuvHlyFJRKAmVi
3zqd8sMSMO1EMABLJQ+qmV6eE0N2tos97x3rt3nGI369ND+fIBGKxZo5R7FYfgI3
BxdvxTg1hZu/o3O9piuOn1/OXGNuFjOat8oi4wFYd4TOquG+Z/nyPKsCq8IFOqLP
E4SljA36p84c5xapBs2epzqOMT+FLqS4vkapTgAdgih1+9PEgKMxPFiTR5B8DI06
d4ma3ZbwBUiH66xcuH6NlxUwUSMysA==
=GOqn
-----END PGP SIGNATURE-----

--hTKW8p8tUZ/8vLMe--
