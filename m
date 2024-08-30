Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A231966152
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2024 14:04:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 075A384C;
	Fri, 30 Aug 2024 14:04:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 075A384C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725019496;
	bh=DdRKUn8XwQaRBA2QJjhwZmsgTvHCLSZzlyvCDcLymps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KHAWf2a0YzPIqipGNU7+cnuh4CKCEwRTk3tdqdi9Fbqsgn4GpMd6tEoTLWZ/oNBcy
	 IwaiNp2UcaanhqH0+qFqTn8/A0CEqp2UB9dXQfmegTAWA7zNCA1Q9LH+iuyeRUvwe4
	 rKlpe4BmltNe8smxxsxoJLh8umcgeZbe5c2IhAEE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F0E2F805AF; Fri, 30 Aug 2024 14:04:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AB05F805A9;
	Fri, 30 Aug 2024 14:04:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7209F80518; Fri, 30 Aug 2024 14:04:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BDC49F80087
	for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2024 14:04:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDC49F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OAhQBAs+
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D8AEACE1DF3;
	Fri, 30 Aug 2024 12:04:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DB85C4CEC2;
	Fri, 30 Aug 2024 12:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725019451;
	bh=DdRKUn8XwQaRBA2QJjhwZmsgTvHCLSZzlyvCDcLymps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OAhQBAs+5rpjkIOu7qr1HQslAadhD92UAuv3MiihqB0qndiA+3bs3NeQjuzveY/Oe
	 DhGwfhApPiTor0ecSCkoBplN5dG96PbEAB9eDWuZvYqAnyugxkhXRIabbYodWuVJ3T
	 w6/UOwPxq0MrKcdDsa/7y3BWyYgcqpFw9GUgzdLjrCMLvoQjc/ZCRPqFCZbQJmZPw9
	 mSa05gpHxHzEvHJNy9Q8zHcCjrEShq8JYhZF6ZBvAHru+1gD5bbbAr7A0q+/f4bxqB
	 7+NB5aVL4P/KU0dHsqIg1xS6PJGOwLKdb2L5rjQvUE7XUTOZRbzxFymxbzrNnY5oAw
	 KFLWOt94UztRQ==
Date: Fri, 30 Aug 2024 13:04:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: How to handle complex Codec2Codec
Message-ID: <31fb2975-4a27-43e5-b9cb-37db3206f5f3@sirena.org.uk>
References: <8734moq6ca.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mBq8xMY20aqYhrjl"
Content-Disposition: inline
In-Reply-To: <8734moq6ca.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: for ARTIFICIAL FLAVORING!!
Message-ID-Hash: MBMTWK55YBRCU46ASOTXRP3KDDRO6RNJ
X-Message-ID-Hash: MBMTWK55YBRCU46ASOTXRP3KDDRO6RNJ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MBMTWK55YBRCU46ASOTXRP3KDDRO6RNJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--mBq8xMY20aqYhrjl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 29, 2024 at 04:51:49AM +0000, Kuninori Morimoto wrote:

> This is OK, but how to handle below ?
>=20
> 	+----------------------+
> 	|CPU                   |     +------+
> 	|  +--[rate convert]<--| <-- |Codec1| <--
> 	|  |                   |     +------+
> 	|  |                   |     +------+
> 	|  +------------------>| --> |Codec2| -->
> 	+----------------------+     +------+

> I think there are 2 issues.
> 	(1) How to handle [CPU] part     on Codec2Codec ?
> 	(2) How to handle [rate convert] on Codec2Codec ?

At the minute this would be a DPCM thing.  I've never actively worked on
a system with DPCM so I'm not as up to speed as I could be but with my
current understanding I'd expect the rate conversion to be done as a
backend fixup on the DAI link for the first CODEC and just a straight
pass through for the second.

> I think (2) [rate convert] needs DPCM connection,
> but how to use it with Codec2Codec ?

The whole thing is a bit fragile so I don't know how well those two play
together.  Though your picture doesn't look like it's actually doing a
codec2codec link?  It probably should ideally (with the SRC being a
CODEC in the graph) but not right now.

--mBq8xMY20aqYhrjl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbRtTYACgkQJNaLcl1U
h9Cw7AgAg9my904+qiAj3dlc99cnqUpa/EE7bvzGKKPYRCbLfGer/3MK+KHFzccb
fN0/oepep1UHiqtSZXzafbP2lSAvufCSJEUs1Gs5OF3k2f02KeqokInuQOLGVml5
h/WSLqqqv0qn1L44ffjqKVXTPNXjVdoI7hFeJlIClqXnqhcsd0zSuPjMR1KiXBki
TlBB0XclpiRux6Z3mI/duTSBhoVcn2uvbpi3tI67tCmJWpDX0nilxN+3cNslgVaF
uBXpVrreHxXKutqyBW/eTuodTSSNMCwSBSG8aZdSDvj1z6fIDj2NyMWN93yIOdC+
eljdJCflsssZFkudif1P1PoF6SuXXA==
=s1fV
-----END PGP SIGNATURE-----

--mBq8xMY20aqYhrjl--
