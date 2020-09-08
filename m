Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4D8261750
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Sep 2020 19:31:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F4B7844;
	Tue,  8 Sep 2020 19:30:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F4B7844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599586278;
	bh=2KdALZvMJPP90+O28CbIyTSmiZgiWwNHhCsY/b3oXMc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pSi7mE+95dXdlGKuNqyQtjrVay3Dx5bpZSIgr+mqXVsF6agOhikwsnCHm2PYftHUs
	 20bl4WICWf0uT02gL3elaUJFIBz96enJkgEIyPRNPek2ZrpDszpy7gsttPgVdCiQis
	 avKrorsVhTcukG+azAdDyFzBdXGBBLdOEWgKlEPc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6A35F800FD;
	Tue,  8 Sep 2020 19:29:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0AB12F80264; Tue,  8 Sep 2020 19:29:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 659C9F800FD
 for <alsa-devel@alsa-project.org>; Tue,  8 Sep 2020 19:29:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 659C9F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QTnUp1OQ"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E5FC720738;
 Tue,  8 Sep 2020 17:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599586164;
 bh=2KdALZvMJPP90+O28CbIyTSmiZgiWwNHhCsY/b3oXMc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QTnUp1OQzwTE/HPjQ6HAPnY3aTtqsGGDDezYekfkH6jZvURXfhXr9qzCr6JVGl3tR
 ImWPYfb4OXelvn8HJEaxuJnBTvbhlmk7U4hsysD5bf+Thl0QTGPRnn985Xb+p8DDV1
 OIzZmr9183aXo+t9/8m5g+dYDM4fgF4N1ZuoacMA=
Date: Tue, 8 Sep 2020 18:28:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [RFC PATCH 1/3] topology: use inclusive language for bclk
Message-ID: <20200908172840.GH5551@sirena.org.uk>
References: <20200903201024.1109914-1-pierre-louis.bossart@linux.intel.com>
 <20200903201024.1109914-2-pierre-louis.bossart@linux.intel.com>
 <s5hd03152mr.wl-tiwai@suse.de>
 <deaae562-80f2-a934-d551-ac5d9a047bbf@linux.intel.com>
 <20200908143504.GD5551@sirena.org.uk>
 <70a2012f-aa8b-52db-7694-592677d7171c@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vtJ+CqYNzKB4ukR4"
Content-Disposition: inline
In-Reply-To: <70a2012f-aa8b-52db-7694-592677d7171c@linux.intel.com>
X-Cookie: Vini, vidi, Linux!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
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


--vtJ+CqYNzKB4ukR4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 08, 2020 at 09:41:34AM -0500, Pierre-Louis Bossart wrote:
> On 9/8/20 9:35 AM, Mark Brown wrote:
> > On Tue, Sep 08, 2020 at 08:39:13AM -0500, Pierre-Louis Bossart wrote:

> > > It's absolutely 100% compatible by design.
> > > I was planning to update the kernel uapi header to align changes, but the
> > > volume of code is much lower on the alsa-lib side. Will resubmit with the
> > > preferred provider/consumer wording.

> > It's binary compatible but it'd break the build for any existing code
> > using the UAPI headers.

> Sorry, I don't fully get the comment. Aren't the uapi headers copied into
> each software tree that relies on them?

Yes, it's just a question of how disruptive an update ends up being for
people - if hardly anyone is using it and they know about the change it
probably doesn't matter that much.

--vtJ+CqYNzKB4ukR4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9Xv0cACgkQJNaLcl1U
h9A8Wgf6At4I48xbXaC1wIvQ2DxYN3zaTDfEJaCg3Izj53VpaO08rtjLFTZph1Ot
qQkBRhxcV8V4uza4HR8JcP2BHUV4CGFN7iFBu7damQnTztGcwVhmLHKrUO9jOIjQ
/ugTP4OKy3CaAb3P6PeWbL9KIO+eepb2kKt7IGTq8I6Qf1HpV2K7LSZTdSdqxIpL
cO3PagiCppftcug4tU7+EMNOAdUN4BWBbxnqoWMhJLH3diTw888WbRclpUveeBWy
8cwjeomax/5ub7QqLO/V2QaL4srp3kqhZRMBrqMDdgVwkDKJn+TwSfLDJauLyWZj
hIeuouv54LTCOG0lfpc2hjLl9xBHNA==
=pDhA
-----END PGP SIGNATURE-----

--vtJ+CqYNzKB4ukR4--
