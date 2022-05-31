Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35057538F26
	for <lists+alsa-devel@lfdr.de>; Tue, 31 May 2022 12:42:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A47591DE5;
	Tue, 31 May 2022 12:41:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A47591DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653993760;
	bh=s7sxLOqgfijeQjrpsUPoXPAzLEgMW5MCPisLNca/hBY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SHGbwe9u2Ngz+l3TAjBjGODRFBcq47eQvZfzDKPkpr9uSsqCwTpqmuzhMr9/z6MXm
	 6pvb04GF7hSG+JMB6ikBfrlwGizSQjAjCDueuAdWZoFcJdoQi5zm6YDVPjm4W2qvKi
	 +McH9VH03xKBLZVS4xbF8Hgp6gpKY3ilGt2xHWu0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F72CF8019B;
	Tue, 31 May 2022 12:41:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11FFEF80161; Tue, 31 May 2022 12:41:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30C73F800DE
 for <alsa-devel@alsa-project.org>; Tue, 31 May 2022 12:41:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30C73F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hEtt+/8x"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5D238B810E8;
 Tue, 31 May 2022 10:41:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B736FC385A9;
 Tue, 31 May 2022 10:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653993694;
 bh=s7sxLOqgfijeQjrpsUPoXPAzLEgMW5MCPisLNca/hBY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hEtt+/8x2Z5c9MhvGc3XhsOSvwcO+gunXGfGBxIxfh4mLr31EDTU/xuOX0wswBfXn
 PtqdLcRqPBqsQzGG++FUYyILK9Gbs+KUFr0lY4GLIyhn6hqRkW4DMlgacHa53/MurS
 eSivjJoymwuRnuxsHwpUvwYfK3lXeCCo3aq0VXFxDd2GITUmbyb5cgyW0nkwfDCyFj
 vX/d3iBbifZLAvwAyt5kTNlX1gww0pnHDdgl26i+5dJl0AMXeOZMcRDVvSYokTFVqR
 7lXXrys9Q9GOANb7rLSjvyI0l9tSsuid1HGWgTdMwpVfT3E0gMZKP/C8RLcNcNMWkL
 VBVsIOpTw2twA==
Date: Tue, 31 May 2022 12:41:31 +0200
From: Mark Brown <broonie@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] ASoC: Intel: avs: Fix build error on arc, m68k and sparc
Message-ID: <YpXw2xvXdf7ivUql@sirena.org.uk>
References: <70daa951-4f77-3336-0567-e72e9e5e36c6@intel.com>
 <20220529141250.1979827-1-u.kleine-koenig@pengutronix.de>
 <YpTGzFNeZe+pGM2j@sirena.org.uk>
 <20220530201946.4pqljnpcts6ms557@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="y+/ySbFgvwPqmn02"
Content-Disposition: inline
In-Reply-To: <20220530201946.4pqljnpcts6ms557@pengutronix.de>
X-Cookie: May your camel be as swift as the wind.
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 rad@semihalf.com, alsa-devel@alsa-project.org, tiwai@suse.com,
 hdegoede@redhat.com, lma@semihalf.com, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, Guenter Roeck <linux@roeck-us.net>
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


--y+/ySbFgvwPqmn02
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 30, 2022 at 10:19:46PM +0200, Uwe Kleine-K=F6nig wrote:
> On Mon, May 30, 2022 at 03:29:48PM +0200, Mark Brown wrote:

> > Please don't send new patches in reply to old patches or serieses, this
> > makes it harder for both people and tools to understand what is going
> > on - it can bury things in mailboxes and make it difficult to keep track
> > of what current patches are, both for the new patches and the old ones.

> The motivation to do that is that the thread for a patch that broke
> something is the canonical place to look if someone already reported (or
> even fixed) the problem before.

Once something is applied and as time marches on that starts to
get less and less helpful, searches for Fixes: are probably
better there.

> That b4 seems to fail to extract the patch is indeed unfortunate. For a
> MUA I'd expect that it sorts threads after the last received mail, so
> that part is only a matter of a sane mail reader configuration.

The sorting really is a user workflow/preference thing - for
example I find it helpful to sort by age of the thread to
highlight new patches which might be simple to deal with before
older threads with complicated discussions in them.

--y+/ySbFgvwPqmn02
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKV8NoACgkQJNaLcl1U
h9Co6wf+LKg+NS4kUXHr4/9uofoLaLUo5uJeD3MFSr/HgEka/FwnliFXfPVwOj6j
uz90Vlu0ecvmzsXcYXcSyW41yJv/ZVG/GUH66FDch18hazPcK9aAspZo+nX42f3r
BhnEE8rYiORboRnJ5wn7VFNx9++gmzIlG+ZK/iLaNNrwu2wfFyR4CQ+O4EH40uQ7
PFhWZQgJF12ysihx12Ug+QbXFI+02phpFHliVJQwwUPqMY68lCbMdT1wZTctZKY6
BpgX3JrvfJ/v+5oimvBA0gae2XP+OqWBVNtKFyAPKs7WWL+QsKt0BxXNn5B/QPss
lHGKu0ZxvM1POJhJFqDGe21pya2fDQ==
=ne78
-----END PGP SIGNATURE-----

--y+/ySbFgvwPqmn02--
