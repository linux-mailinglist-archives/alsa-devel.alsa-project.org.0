Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C4F65DB08
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Jan 2023 18:17:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9470DBF6E;
	Wed,  4 Jan 2023 18:16:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9470DBF6E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672852628;
	bh=XwOijTKRs64E9IkFBMlrNumius7hSHhyVy94XZxMOFM=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=MB04rZFfc5YIh7yMk71cc33ZIh/uICw1wEUHMeDNQ0G0HwTR7J21UYyPLuepg/HyN
	 HyVNKvkaa+F4juTbU+HHBk71bXp/hm2WF7CVj14NV0hYmtb27dGYqNGPrUVBmszMVH
	 xuRF2SuIkVnHBCYoOKAGu79w9KNFkib+lDorNTTA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63102F800C0;
	Wed,  4 Jan 2023 18:16:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0875F8023A; Wed,  4 Jan 2023 18:16:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64EB9F8023A
 for <alsa-devel@alsa-project.org>; Wed,  4 Jan 2023 18:16:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64EB9F8023A
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=TKDHvQ+q
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4A424B81888;
 Wed,  4 Jan 2023 17:16:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D10BC433D2;
 Wed,  4 Jan 2023 17:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672852569;
 bh=XwOijTKRs64E9IkFBMlrNumius7hSHhyVy94XZxMOFM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TKDHvQ+qPwAoQ/3XivrWZXA6qfjLz7QRcK9K2gl/H7uHPDTWXNPZEfDgXSphczRLM
 4FnptcvjM6EUEsVNzEnweSH3spHn6Hnn1UYku9wgWR0uvXcgU/f3xUUvs/2+N5VkGA
 u98x6PGmHC4neU9pbEVPd8BS3OaZ72/wL4ZQ/fXtYmBqf6JhcrUp2abr+2NaASoqFH
 WN1eRK5YyywXGb7gQzEeBGBI24X9QoffodDNasyLeO6qs9/AaofP3M47BZvDgk66eg
 tmsmxFiFpeeuOn7UNU8MKcX1IREPItqAh0zPRljUJ+fx+5UUiIFNHaM2cpjaEemzmE
 xiy+TxG+aal4Q==
Date: Wed, 4 Jan 2023 17:16:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/5] ASoC: Intel: bytcht_cx2072x: Replace open coded
 acpi_dev_put()
Message-ID: <Y7W0VOJKlMtaIp13@sirena.org.uk>
References: <Y7WtywhUZCTx3akM@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="DzU3FZTl/qvLfKOs"
Content-Disposition: inline
In-Reply-To: <Y7WtywhUZCTx3akM@smile.fi.intel.com>
X-Cookie: Stay away from hurricanes for a while.
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--DzU3FZTl/qvLfKOs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 04, 2023 at 06:48:11PM +0200, Andy Shevchenko wrote:
> On Wed, Jan 04, 2023 at 04:42:28PM +0000, Mark Brown wrote:

> > According to b4 you've only acked the first patch here because Andy
> > doesn't send cover letters :/

> Is b4 capable to spread tags from cover letter to the whole series?
> (Sorry, I'm a bit outdated with all Swiss-knife possibilities that
>  b4 provides)

Yes, it does that.

--DzU3FZTl/qvLfKOs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmO1tFMACgkQJNaLcl1U
h9CXiwf9EWr+UeDMVySmEBhGp8o+0wnuHvOhwQtbbLZfRNGFujw9NVRQ5CQ6nzzF
GcXZgSV1AZZg4l6BPBTHh1OBKVT4l+xURJjZ32un5r6f/0xmdAtFkx/+pRa2loIf
B6skxnNOBbhyeaOZ9/5XSnnODmSSeRqw55aBvHHfOPFrXIHsFIywVBgD7ILrFL2V
49RATfsii5jzsob/5NH//fJY23hVHWgZMKWW58pail+bKRujcG5hOiqbAFICJo4T
O/hFyzjD/DbkQQGqCZtF/f+bwtBdEQQcxT9PX/GpDkSJ0CEY1EYLuBqOG868oix9
/zEhGqpQQ60lejRHV5rPwtjtoaA7dg==
=JwZ6
-----END PGP SIGNATURE-----

--DzU3FZTl/qvLfKOs--
