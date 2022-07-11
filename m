Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FA75705FF
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Jul 2022 16:42:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06392844;
	Mon, 11 Jul 2022 16:41:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06392844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657550563;
	bh=bONJCw5eJMmcoc8rRf6p6ImOc81UA3qM6eCZOEwehdE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JbLsCYurig2qe0iabIFkLwA+Ls4B7gr6Ap6d1lvHl3KGFIJ7nn0Rm4ksOqWWTld2J
	 KfwYtzIxoFCWLg8C8WMOjhD4mZQ+uytcchPxo1fDJpgNCBS3/trcl5wmmmNlR92M9e
	 6QpXwSJNdXlK0lUOR6CTAlh1dyrSa3qVfEZj4KBY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65FA7F80163;
	Mon, 11 Jul 2022 16:41:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7CAAFF80163; Mon, 11 Jul 2022 16:41:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2BCA7F800E8
 for <alsa-devel@alsa-project.org>; Mon, 11 Jul 2022 16:41:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BCA7F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hS97Lc/+"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4ACF4B80FB3;
 Mon, 11 Jul 2022 14:41:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEF62C34115;
 Mon, 11 Jul 2022 14:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657550497;
 bh=bONJCw5eJMmcoc8rRf6p6ImOc81UA3qM6eCZOEwehdE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hS97Lc/+nw0Yk0Mn3D7qCB/Me1go3u1l+4zKDmcpzfMCTSQJPfAbUylTn9aLDAc7B
 khSLsW9+f1BhHSeaD0IFu3pGRBwBiP67iJLiTCo9Taus9cmM3FLEw+zzVv+FDA/BnK
 AuYhwNoC4PYrk1+xOpuZtYVj5mBGkN8neS+TRhRMXs3fXQQGJvK6ovyTbOJ0wsWhXc
 JQaN6eHQ3sTimjH9qLx+AA8LuvTikmbkVZWnbY25DOKaZDHxrc4XLR+2cHcxR2LRht
 cwKsimZAuofEOgLBtUD6T/2Xli15kA3dALdcofr9cANrHHnBPYvUB5KX6htWdRlX5A
 ACWSf9oqhUN7A==
Date: Mon, 11 Jul 2022 15:41:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Subject: Re: [PATCH] ASoC: rockchip: i2s: Fix NULL pointer dereference when
 pinctrl is not found
Message-ID: <Ysw2mzhw4pyrxirc@sirena.org.uk>
References: <20220711130522.401551-1-alexandru.elisei@arm.com>
 <Yswkb6mvwUywOTLg@sirena.org.uk>
 <YswoOE/sP088lius@monolith.localdoman>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="WbHIuEdIlgHTyV0d"
Content-Disposition: inline
In-Reply-To: <YswoOE/sP088lius@monolith.localdoman>
X-Cookie: I am NOMAD!
Cc: alsa-devel@alsa-project.org, heiko@sntech.de, linux-kernel@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, linux-rockchip@lists.infradead.org,
 judyhsiao@chromium.org, linux-arm-kernel@lists.infradead.org
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


--WbHIuEdIlgHTyV0d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 11, 2022 at 02:40:08PM +0100, Alexandru Elisei wrote:
> On Mon, Jul 11, 2022 at 02:23:59PM +0100, Mark Brown wrote:

> > Please think hard before including complete backtraces in upstream
> > reports, they are very large and contain almost no useful information

> I'm at a loss here. Are you saying that those 4 lines represent a complete
> backtrace and they are very large? Or are you talking about the panic log
> that I've included in the commit message?

I'm talking about the entire log that that was the start of, I deleted
the bulk of it due to the excessive size.

> > relative to their size so often obscure the relevant content in your
> > message. If part of the backtrace is usefully illustrative (it often is
> > for search engines if nothing else) then it's usually better to pull out
> > the relevant sections.

> Would you mind pointing out what you think the relevant sections are? I
> would also find it very useful (for future patches) if you can explain why
> they are relevant, and why those parts you've left out aren't.  It's not
> very easy to figure out what is relevant when you're not familiar with a
> subsystem.

It really depends what the information you're trying to convey with the
backtrace is, in general a couple of frames of context might be useful
if there's something interesting about the context from which things
were called since that's the unique bit that people might search for.
For example things like the standard set of generic functions you'd see
when probing a device is rarely going to convey anything meaningful, and
similarly the standard kernel entry backtrace for something triggered
=66rom a system call.  The full register state is also commonly not of any
great relevance if it's not illustrating something in the rest of the
message.=20

If you are just including an entire splat on the off chance that it
might be relevant consider just not including it rather than including
everything.

--WbHIuEdIlgHTyV0d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLMNpoACgkQJNaLcl1U
h9A2RAf+N0AAEGr/N2lYkhPRA9ScXTpy5ypMOXGfYbxd9cx5STM9WUG5VDyMiCDL
9WlBtSWFVXiRKae6env9zFsCAWWQPFr0KRlTgRDX2buDhyorm6LF85qOddnmkJQc
nLv6nKoR25X8ODyldf4MGn28cp3x+vj0SmBhncY3jmjWRWfo9TVmpDVTM/MH+cyD
WuVixZH6n/fyZ0OTTi0dTz15fm00chqk+lMXjOrXolz3lqc7T2WkPZRNadBjhNhY
JV+sRaogmIL9dSPrPmnkuhszS3mDBUPTiMnYqhogf+vajTip7on89K67toG/ff5x
t4bVqxlzEkSaRnTvGBn2aXG/Xn466w==
=dvsB
-----END PGP SIGNATURE-----

--WbHIuEdIlgHTyV0d--
