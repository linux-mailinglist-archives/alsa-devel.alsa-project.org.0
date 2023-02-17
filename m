Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E90569A2D9
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Feb 2023 01:12:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BC62EC8;
	Fri, 17 Feb 2023 01:11:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BC62EC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676592728;
	bh=WSgwqtzcOunbPHiwKxcPqx3pkrkQMBCpjk6IB0bGudo=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Dh74galhANFtpEaAe/tI/YFYigm7G+U42K1t7ZOTfLbEeCZf9T6eXsULkhZgcPaRU
	 svGCH9z/EXwHtBCOjG28890rbrDjj9jzkMI+SGekR4cuPhETb107T0X15XxfbPm34t
	 bBNQCuwfdxf4Rkh8hdC97n1riE7ZfSXxEh2W9oAU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15BDDF800E4;
	Fri, 17 Feb 2023 01:11:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CCA3F80171; Fri, 17 Feb 2023 01:11:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A25D6F800B6
	for <alsa-devel@alsa-project.org>; Fri, 17 Feb 2023 01:11:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A25D6F800B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Z1bkKyKq
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C3756B82A9D;
	Fri, 17 Feb 2023 00:11:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC60EC433D2;
	Fri, 17 Feb 2023 00:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676592662;
	bh=WSgwqtzcOunbPHiwKxcPqx3pkrkQMBCpjk6IB0bGudo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z1bkKyKq0JKsZIghnMmYA3yfX9wqFhY3Y3Af+7F2laA6iUR1OxpbS0/cDweXPi2ph
	 hL1Tn3gjg+KhZj5OcUXIeGpAiEcqg3pWuV944vNv/lbJRX9BzrFyyZB3XH6p4naONS
	 9BdjQychn3zsXzMml8IYMUoQOHfjyKz0e8CBpxWMGVHHtyx0IqXkmAw7OQgjhIfojk
	 jvyTZuAt25g1alg8RRevXn6EdsfhnVuz0UHB63IVljURiDJram0uAh8LrgOFwg3c2N
	 gDuCBlx7d3p6FrT309vQtZrQjfVheba6gtwEi7fXZognf9aSboajl2zSiKi6m1bfd+
	 j5ogVqHfJB6VQ==
Date: Fri, 17 Feb 2023 00:10:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Joseph Hunkeler <jhunkeler@gmail.com>
Subject: Re: [PATCH] soc:amd:yp:Add OMEN by HP Gaming Laptop 16z-n000 to
 quirks
Message-ID: <Y+7GEp06snoDjrH8@sirena.org.uk>
References: <20230216155007.26143-1-jhunkeler@gmail.com>
 <Y+5Ym5rUWLK4TOAf@sirena.org.uk>
 <224b230c5c8d3037b650602b5743bbf217369ecb.camel@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mGJ+2Kg6cbWRtwcg"
Content-Disposition: inline
In-Reply-To: <224b230c5c8d3037b650602b5743bbf217369ecb.camel@gmail.com>
X-Cookie: Serving suggestion.
Message-ID-Hash: SHLFWQ5M6R4XJ7JOUIB7O7YDEWP6DYFH
X-Message-ID-Hash: SHLFWQ5M6R4XJ7JOUIB7O7YDEWP6DYFH
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SHLFWQ5M6R4XJ7JOUIB7O7YDEWP6DYFH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--mGJ+2Kg6cbWRtwcg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 16, 2023 at 04:25:45PM -0500, Joseph Hunkeler wrote:
> On Thu, 2023-02-16 at 16:23 +0000, Mark Brown wrote:

> > There's no need to resubmit to fix this alone.

> submissions. Are you suggesting I change the email subject from:
>=20
> "[PATCH] ASoC: amd: yc: Add OMEN by HP Gaming Laptop 16z-n000 to quirks t=
able"?

Yes, exactly.

> If so, do I edit my original message as new, amend=A0the subject,=A0and=
=A0resend
> as-is? Or do I reply to the original message with the amended subject alo=
ng=A0
> with the full contents of the patch body? I know you said there is no need
> to resubmit to fix this, but it's is not=A0clear to me how to do it witho=
ut
> resubmitting.

You'd need to resend to fix it but I'm saying there's no need for
you to bother, I fixed it up locally.  Please just bear this in
mind for future patches.

--mGJ+2Kg6cbWRtwcg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPuxhEACgkQJNaLcl1U
h9AYXgf9FrBlba9D5DIzONucAJ6z978YedlssPxQluPcoVw0qQBdKByjfw+f9lE4
DX6+ho2v5q1gHPahe44dnq6uUsGSTT2pl1koALpOu+ligEg0crtvjdJFvmh9fnVh
Z2ejfaIMvSOe/6JTcDkyWggXM+p6kHsxqVKKLCO0/kHpwuR0DoKm40iquXZ3OtPf
m45nmYEbp334+mw+mYzviaDeb6sFOwl2/bl1Fpw+J7eH/+xP6snCM6wNWplqqj4z
e4drw5vDIJwAyVY85zLYcmFqBgzyU5DZe7sv5N9mnWiQnSeiKYkMmNNKr4l/UPAe
Wsg/ETiwaWVd6e4PDreOnBg4DpkvyA==
=IyJK
-----END PGP SIGNATURE-----

--mGJ+2Kg6cbWRtwcg--
