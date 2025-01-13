Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA9DA0B863
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jan 2025 14:41:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DBC16022C;
	Mon, 13 Jan 2025 14:41:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DBC16022C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1736775716;
	bh=au5lG3uGLSqzj9aZd8JMA9qdyMTKkggB9FZS5wxq2/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=atge+I3EYBbGSO8CdDHim7pVlKR/0qjsrrZNPqhaKKtwV2PcE0rdJCNiznRm24MQL
	 7UW5hFW1FUkvgTb+HmofYY/C1zaiPMKser8r1ghzi5uPZ+YBYIp+NxgH20ea550mEg
	 DIACwXQBXhNBdHPjSIHy7UpJsAl8cTwzYrbY/Ebc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5CC2F805B6; Mon, 13 Jan 2025 14:41:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CCF9DF805BA;
	Mon, 13 Jan 2025 14:41:23 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89034F8024C; Mon, 13 Jan 2025 14:40:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 07607F800AE
	for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2025 14:40:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07607F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=pJMVxHAw
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1A6915C4D34;
	Mon, 13 Jan 2025 13:39:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E1AFC4CED6;
	Mon, 13 Jan 2025 13:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736775619;
	bh=au5lG3uGLSqzj9aZd8JMA9qdyMTKkggB9FZS5wxq2/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pJMVxHAwbL5fJMn/D4LCM5HUD8mjRF5DMKVmSuZWsLct2c5mrVIdds9dy+x9k3+3e
	 PN0LqEh111FwrvOWn6h18ao3bat6ogFzjDbyyvcwGCL89RzZMEwc3eQvSk6Isgzdsr
	 MJlJ4NxB5DMjdjh2u37pTLA3O4uEWoGY0DSNcUrMjSLYJ0vaSv+jDpW0EWy/FxgT5X
	 9wSDjYTmmD/+CDpKaL/XUjYNv98BtV21UEECXFNu5DoYvro4RVSbugdUeZ8srga6gb
	 6GiBHLY7D9r3PrSi/76C2XgROEKRo3PSbLfVOfzCpk89ioWI7H39RU5wHPQM23CvcD
	 zOXppd0zwplqg==
Date: Mon, 13 Jan 2025 13:40:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, tony@atomide.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] soc: audio-graph-card2: use correct endpoint when
 getting link parameters
Message-ID: <f4a65ffc-7f0d-4d45-83b9-2377cb00f3b1@sirena.org.uk>
References: <20241220071126.1066691-1-ivo.g.dimitrov.75@gmail.com>
 <db8321e3-e9c8-4f1e-8ebd-78d286320d55@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mCglpNbHJbjdEAnN"
Content-Disposition: inline
In-Reply-To: <db8321e3-e9c8-4f1e-8ebd-78d286320d55@gmail.com>
X-Cookie: You will outgrow your usefulness.
Message-ID-Hash: GV4I6ZX4MJNMI3RJJDVS4Y3L3GLVA6NX
X-Message-ID-Hash: GV4I6ZX4MJNMI3RJJDVS4Y3L3GLVA6NX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GV4I6ZX4MJNMI3RJJDVS4Y3L3GLVA6NX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--mCglpNbHJbjdEAnN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 13, 2025 at 07:55:30AM +0200, Ivaylo Dimitrov wrote:
> ping

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

Please don't top post, reply in line with needed context.  This allows
readers to readily follow the flow of conversation and understand what
you are talking about and also helps ensure that everything in the
discussion is being addressed.

--mCglpNbHJbjdEAnN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeFF74ACgkQJNaLcl1U
h9BOXgf/Y70BzwDXBjs8Fw1GOFCH0hy8mtaXAl16D7R5kmNsjzOWLfijFoS/fKL2
jEQET7LXP0LR1cHAVZDtuD8sZDwgzwQNItJtdYx4+6eT3Zk/ZDMlzHft59zElYDF
Epx9ItjlDtV0oyCn772GZxCaBBVGUVY7HkHODW43bew4IiRIJCl8kEQCQE2ArrtB
G0Pp88loqEh9Ky2K4TN7iG7J0RhV9goSRGAgvx0TqPZKekXYWJ3+LcBgxdcJ6WwN
CQqLVX683OAeveMrktqXX4+6bFyEolTp16glWyyzK2vUqP1tjfzH/LKCLm/jZqcD
i7maf4oU37YqUnWta2r+OaNXqc8Jag==
=/+KH
-----END PGP SIGNATURE-----

--mCglpNbHJbjdEAnN--
