Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9795F204E20
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jun 2020 11:38:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E01C1769;
	Tue, 23 Jun 2020 11:38:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E01C1769
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592905138;
	bh=ggPh428cfFP6LvIKidT7SHC9OT4P6mhio0zSIGGESSg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XCYQITOa8LiIkuqQBiMdYgSS5ZLvZmYz9iOnjNy8O7h/b1kRj4Awl8vBOAmp+JXAv
	 8lyVA2hyHwGTbsj7WPZmu1lNe+93RVXVyiB9wpf2uwfZYCz4QjlCNCyPRJ8rEM+SNb
	 sO4q7CyQrqkpsdj8CSMHUgS+NUnilRzAhZPOzeGg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E4C6F800B2;
	Tue, 23 Jun 2020 11:37:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99BEAF80234; Tue, 23 Jun 2020 11:37:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C6F0F800B2
 for <alsa-devel@alsa-project.org>; Tue, 23 Jun 2020 11:37:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C6F0F800B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="v5UwJDCY"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 508C220723;
 Tue, 23 Jun 2020 09:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592905029;
 bh=ggPh428cfFP6LvIKidT7SHC9OT4P6mhio0zSIGGESSg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=v5UwJDCYDu6UvlVkRLLL35Ke2nb+5vB/cznqWkh3QaIA2RlfeY3xNwMVP80OusyTG
 kJNGiwquouL8aAJvtUzYb1SGiOixL7dFAkw5QSR36PknM5S35v6SL1BlfCFDARsBDg
 dL7TQWbFvDE21L/ZrOBzaxLk41GFXu1hkdl0m57I=
Date: Tue, 23 Jun 2020 10:37:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 2/5] ASoC: Intel: bdw-rt5677: fix module load/unload issues
Message-ID: <20200623093707.GA5582@sirena.org.uk>
References: <20200622154241.29053-1-pierre-louis.bossart@linux.intel.com>
 <20200622154241.29053-3-pierre-louis.bossart@linux.intel.com>
 <20200622181824.GG2428291@smile.fi.intel.com>
 <04af7e48-e694-7657-5477-81b6e2e8d1c1@linux.intel.com>
 <20200622182651.GR4560@sirena.org.uk>
 <20200623084011.GM2428291@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="C7zPtVaVf+AK4Oqc"
Content-Disposition: inline
In-Reply-To: <20200623084011.GM2428291@smile.fi.intel.com>
X-Cookie: No motorized vehicles allowed.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Curtis Malainey <curtis@malainey.com>
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


--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 23, 2020 at 11:40:11AM +0300, Andy Shevchenko wrote:
> On Mon, Jun 22, 2020 at 07:26:51PM +0100, Mark Brown wrote:
> > On Mon, Jun 22, 2020 at 01:23:04PM -0500, Pierre-Louis Bossart wrote:

> > > So I explicitly added a test for all possible cases. I don't mind removing
> > > the _OR_NULL if indeed it's safe, but showing this redundancy also shows an
> > > intent to deal with such cases.

> > Yeah, I think that's fine - it's perhaps redundant but we're not in a
> > hot path and as well as the intentionality it saves the reader from
> > having to know if gpiod_put() copes with NULL or not.

> What the point?
> We can document this instead of being a dead code, right?

To a certain extent the _OR_NULL is documentation - the effect is the
same with or without it.

> IS_ERR() may happen there only if we assign such pointer to be error. Is it possible case here?

That one is a bit more real.

--C7zPtVaVf+AK4Oqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7xzUIACgkQJNaLcl1U
h9BYhwf/YqDLZqmPW3WKlDuEoYeUwGpv4VSjRW/qLU/NzQqyDb+UHUQI3e7lUK5l
Ox+uPbduQ+aOPjCzMnUQ3mQu6QQxSOISWNcP49CypfKHEJQGza7Ya7RpnK/VMhaY
07ydD9s2MBGpxwUbnRUt6iivst0AVmpQv2SHCLYvlf0TG2pj/U0oK42Om3Rw8KAE
0VZ1+MNcVNbF+/q5hb1hyuOY0M7tvKx9c79x8Y12g1U1JB1vmpe91UAJOQRIqgMc
Ohus6BtdCJw08S4xSONJ58K7THObntJKA0mUhzpG7Sv2UZPmfY00hbpVA+bDXy+f
xB0D+fBiPay86XugD4pDYi26IPBc/w==
=pN+o
-----END PGP SIGNATURE-----

--C7zPtVaVf+AK4Oqc--
