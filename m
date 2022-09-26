Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD9F5EB4AC
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 00:41:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DC48F3;
	Tue, 27 Sep 2022 00:40:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DC48F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664232066;
	bh=Z5wnR/iO+6eqE2b+akQ3tVxGbit/SIgqvm30VUmQ3u4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XX+EYOnJa2IyjH8SgBMQgI5m+TkeO7+JinFvtG7Tj4+7/pcx7L7qjSuQf75mjwReL
	 CCUxbkXb1iSwFObyWeR7uv8+pIuKdQ4EJRq0A9nFWPgtzWnEvPxQwUaHpGj+hrAkJl
	 8fPmuUqGML90LWhKT8hm+z834uWUue1RupChzcpg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BEB9DF80115;
	Tue, 27 Sep 2022 00:40:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 012F2F8027D; Tue, 27 Sep 2022 00:40:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42357F80134
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 00:40:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42357F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IwurO2Tm"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 3B048CE122F;
 Mon, 26 Sep 2022 22:39:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDCEBC433D7;
 Mon, 26 Sep 2022 22:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664231995;
 bh=Z5wnR/iO+6eqE2b+akQ3tVxGbit/SIgqvm30VUmQ3u4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IwurO2TmcBUfW69VH7nzv1u5qdAKnYupn33jWDtzxx7gKkqVHrbhkA4NS2/vXUfXv
 bydlqcCiC2NMdsvQWGjwxRqpNkefMQfkGtDaFo3TvKj6t/j9RtRpRQTQq1JczTT+eB
 8dV8OPOuVQYbgM2aH0uZxHwhSsDlwtrcAADnGSBhfXTKkFLkZqXD1lmG7IBVPCxUWO
 BkedOe0/dul8i3VbEHCEOCAOjRLpuaFPjn7MWVSAVaqLfUU2/kV0WA1kgTzTh8CwGB
 PCRKHfM0Y2FS2uO6JZpPrmUNCTGGxAnVWVdA5WItTNIj21bUQK87BaBT16mvcIiW5N
 LQtDnC4W+ZcbQ==
Date: Mon, 26 Sep 2022 23:39:50 +0100
From: Mark Brown <broonie@kernel.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH][next] ASoC: SOF: control.h: Replace zero-length array
 with DECLARE_FLEX_ARRAY() helper
Message-ID: <YzIqNqhTIuaWZrOl@sirena.org.uk>
References: <YzIcZ11k8RiQtS2T@work> <YzIj6tdtDe9YrX+I@sirena.org.uk>
 <81af0106-a732-ce45-bb1c-c45db9e1aeb9@embeddedor.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bo6iFE6H5R63k7d1"
Content-Disposition: inline
In-Reply-To: <81af0106-a732-ce45-bb1c-c45db9e1aeb9@embeddedor.com>
X-Cookie: You may be recognized soon.  Hide.
Cc: alsa-devel@alsa-project.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 linux-hardening@vger.kernel.org
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


--bo6iFE6H5R63k7d1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 26, 2022 at 05:27:41PM -0500, Gustavo A. R. Silva wrote:
> On 9/26/22 17:12, Mark Brown wrote:
> > On Mon, Sep 26, 2022 at 04:40:55PM -0500, Gustavo A. R. Silva wrote:

> > As documented in submitting-patches.rst please send patches to the
> > maintainers for the code you would like to change.  The normal kernel
> > workflow is that people apply patches from their inboxes, if they aren't
> > copied they are likely to not see the patch at all and it is much more
> > difficult to apply patches.

> That's exactly what I intended to do:

> $ scripts/get_maintainer.pl --nokeywords --nogit --nogit-fallback include=
/sound/sof/control.h
>=20
> Jaroslav Kysela <perex@perex.cz> (maintainer:SOUND)
>=20
> Takashi Iwai <tiwai@suse.com> (maintainer:SOUND)
>=20
> alsa-devel@alsa-project.org (moderated list:SOUND)
>=20
> linux-kernel@vger.kernel.org (open list)
>=20
> Did you see anything wrong with this or something...?

Yes, you should've also included me and the SOF maintainers.  It looks
like the MAINTAINERS patterns aren't entirely up to date there
unfortunately.  Though that said given that you'd picked up on the
subject line I'd have expected the signoffs on the commits to also be
pointing at the right tree as well.

--bo6iFE6H5R63k7d1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMyKjUACgkQJNaLcl1U
h9BBnAf/TPF9R6N8StyDAkuK97mbw3QppdICYdpg3hc30FGONCG1l7j4OKCzcaYu
BnZtgEPFlDS9KiczSbE44u2+VmUbFET3fho5hHTh5hakya3I+Q4DwOCiYVafzCYC
cnVXwBTWYfN87/yZ8zzQ2wgqK8UNWDtFPRofbEb5Xit3EHpMKj1Zf6gmwywWoabk
OtkwMF3s6KnAWepveZmGgpMtiAGzfaPXzB1SiK6SVH1nTU0fnq7mjTTBiJ5ycM4p
JkCHGqZ1sVFzA04aVZODw7hPpeO4SIWxleHDJGeZZcYx/pV7EJhn781WBDIQQ9mI
0nztCD2ZquEvp+ceVljaVTs5BehCVw==
=+Su8
-----END PGP SIGNATURE-----

--bo6iFE6H5R63k7d1--
