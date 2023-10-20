Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4E87D0F1F
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Oct 2023 13:50:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B4A6844;
	Fri, 20 Oct 2023 13:49:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B4A6844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697802637;
	bh=uULk3t4devNFRJcWv4csQQ75izkHgbp5jCQYZEJbvek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EhYA4oK2TwFA0VVaC381zLSfBERaS12qMwc0OCB5+uFAyxBGxDnBqN9FvvBH53tDb
	 j7gmRXUZU3JDeVfAPuImeoQFmlK0hyVNXybpfMLfmyYf78nOxqzge4iQhp8S8IpZeI
	 /me+ufqEMLIdZ386V4ocg1HVqDnAIYudubAeSOKs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D696F80552; Fri, 20 Oct 2023 13:49:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 33427F8024E;
	Fri, 20 Oct 2023 13:49:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58CEFF8025F; Fri, 20 Oct 2023 13:49:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 46E60F8019B
	for <alsa-devel@alsa-project.org>; Fri, 20 Oct 2023 13:49:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46E60F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=VSupLyn4
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AEDEACE3816;
	Fri, 20 Oct 2023 11:49:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AC05C433CA;
	Fri, 20 Oct 2023 11:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697802570;
	bh=uULk3t4devNFRJcWv4csQQ75izkHgbp5jCQYZEJbvek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VSupLyn4z0RgSk1s3p/NXyrms0WxcZmX2l78dSxRUAVmZNBPmwE2Xv3dPTnvjzjRH
	 oQ9ftT7H4jcJ7wsjyPkWsjZikgkw6c9yvNj+5BSLfVKqxVlqB0hBKxhz1BZS1CA21R
	 YATvE9URSMY4Haw+rAudozop5IkOdTP8liJ07T5Zg4Z/5GAQFLiitlPmtdNsVkr6P2
	 MOR2t+y34zmGOqYUEgy/PczjfrHWBCdjjAwvnRbDv9LJgPHDmETXHs80Lw36cKX+3U
	 JK8Ih2ZqYW4CEMWURjUr+3ON7/iEBh8IUyHPsDiNFsPDngTiUJzyOh0jAO7S/M9v9G
	 FEsc9VbHrYQnw==
Date: Fri, 20 Oct 2023 12:49:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Cc: ALSA development <alsa-devel@alsa-project.org>,
	Takashi Iwai <tiwai@suse.de>, Takashi Iwai <tiwai@suse.com>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [PATCH] MAINTAINERS: ALSA: change mailing list to linux-sound on
 vger
Message-ID: <cdc1563a-6b91-4666-a081-d6fe0a56d2d8@sirena.org.uk>
References: <20231020071247.973909-1-perex@perex.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+8N4ASwwIG2IyxwS"
Content-Disposition: inline
In-Reply-To: <20231020071247.973909-1-perex@perex.cz>
X-Cookie: teamwork, n.:
Message-ID-Hash: J5CYJV4DSFRGIIXQPX5HX6VO2SCXQP7Y
X-Message-ID-Hash: J5CYJV4DSFRGIIXQPX5HX6VO2SCXQP7Y
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J5CYJV4DSFRGIIXQPX5HX6VO2SCXQP7Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--+8N4ASwwIG2IyxwS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 20, 2023 at 09:12:47AM +0200, Jaroslav Kysela wrote:
> As discussed on alsa-devel mailing list [1], it is useful to have an open
> mailing list to avoid moderation delays for the kernel patch work. Use
> linux-sound mailing list for kernel driver related threads.
>=20
> In the first stage, change the list for the ALSA core, ASoC and tests.
>=20
> [1] https://lore.kernel.org/alsa-devel/20231019-posture-cache-fe060b@meer=
kat/

Reviewed-by: Mark Brown <broonie@kernel.org>

--+8N4ASwwIG2IyxwS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUyaUUACgkQJNaLcl1U
h9DV1wf+JfQ1+irAJWTy+8Xybo6lzJi6gZx4Kk9fKlMDtuPUmNA/mIue2ndzFUW5
i14CryvkKUYyb99uA3i8eADi2ruTBjJaFvRoBWgfxoM+tadh6a7xiPiuMA55TZAX
n4NDXl8NH9ZeMrTiPI8HQ9KSEcr4uU4bhZvwuqT562AvzfZyQszAgNoi1tuDMb0s
JvS1QmgFPGXNCfai+25Vra5xbdwfhwSo9vnyHZFrqBy5OJF9BgyloJAa0nChFY7N
g0pqj8tDPiaLZO+o1vENKWif5mIyiLg46Pp8Etjv42xe84s1S2q6RV8Us4U0/2p/
/XK6ASbKxW4FIPaiSoUy1mYr5HBYxw==
=eNvC
-----END PGP SIGNATURE-----

--+8N4ASwwIG2IyxwS--
