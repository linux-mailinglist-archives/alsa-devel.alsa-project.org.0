Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9488357E2
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Jan 2024 22:16:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52CB81F8;
	Sun, 21 Jan 2024 22:16:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52CB81F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705871781;
	bh=kpFY2RXVxwUhXk4eqhD0utH+s2JevbcgTonbpZsQyvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uX42X8bF70uWdkG4QtvnDnaqvRsgM2T01isSd/vcwOuZ3VE+ybSC1rmqF4Cjs5ZgR
	 vJ70+VGa4gvn+lWzwjO9tmS7UeXGKdNlsrJtY+LUreYY0bCkHpvXkeglq/6xA4+dNf
	 fBBVBAubVERyLEyEZll1eostq+/4HJpMk5vCmFw4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6F4FF80587; Sun, 21 Jan 2024 22:15:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E84D9F80563;
	Sun, 21 Jan 2024 22:15:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE03CF8025F; Sun, 21 Jan 2024 22:15:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 574BEF800C1
	for <alsa-devel@alsa-project.org>; Sun, 21 Jan 2024 22:15:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 574BEF800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uUmQzfNE
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 644E4CE1FB4;
	Sun, 21 Jan 2024 21:15:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3723C433C7;
	Sun, 21 Jan 2024 21:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705871731;
	bh=kpFY2RXVxwUhXk4eqhD0utH+s2JevbcgTonbpZsQyvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uUmQzfNE5I476xwm15KvhWPBP+M6mlMealJoyw1XtxiG6Yy5zlZ3WeOGe47eQmy7b
	 tFy5f8Jwl9GEjM6jI8ebZVaSu2z3bQjFzx1yFFlufOZP40a4bc4zOZEmcx5lln1F7S
	 REv+swQPS+/xra7QSSyTUC+aJbURXZr3P62O02R8ccwMmKL3wgCEltsFSqeq6GlLfE
	 O9Ww5VwTsLJ+AxbWMglQ0+2iLnfhPlEzrnv6/0rH6ahcnSy8IQEh6PiOpKyVI7Ok3/
	 fO7C4DZ3HoeUzkyY+Om7H3wbYn1W9zy4yufYp64gWZ8oM2OQCv8ftDeXWO6gqw6TRp
	 UTbxPzcQGeZdw==
Date: Sun, 21 Jan 2024 21:15:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Michael Walle <michael@walle.cc>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	tudor.ambarus@linaro.org, pratyush@kernel.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	sbinding@opensource.cirrus.com, lee@kernel.org,
	james.schulman@cirrus.com, david.rhodes@cirrus.com,
	rf@opensource.cirrus.com, perex@perex.cz, tiwai@suse.com,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	michal.simek@amd.com, linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org, git@amd.com, amitrkcian2002@gmail.com
Subject: Re: [PATCH v11 03/10] spi: Add multi-cs memories support in SPI core
Message-ID: <Za2JcHQNipO2qK60@finisterre.sirena.org.uk>
References: <20231125092137.2948-1-amit.kumar-mahapatra@amd.com>
 <20231125092137.2948-4-amit.kumar-mahapatra@amd.com>
 <3d3a11b1-8396-4d8e-9bb3-61ecb67e7efa@roeck-us.net>
 <d3c93c4c-3754-480c-84c2-9455ec8af702@roeck-us.net>
 <Zaxtm0JlQYU0/K/v@finisterre.sirena.org.uk>
 <ec7e7972-d48d-4a47-bd03-eec0c4334471@roeck-us.net>
 <9806d99fab46c928f337b30b21057b3e@walle.cc>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jaYudf2Qatjg9XbQ"
Content-Disposition: inline
In-Reply-To: <9806d99fab46c928f337b30b21057b3e@walle.cc>
X-Cookie: You might have mail.
Message-ID-Hash: LWTIK5LLJYQL3BZN4V3L3I5VKH7M6GQW
X-Message-ID-Hash: LWTIK5LLJYQL3BZN4V3L3I5VKH7M6GQW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LWTIK5LLJYQL3BZN4V3L3I5VKH7M6GQW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--jaYudf2Qatjg9XbQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jan 21, 2024 at 07:06:31PM +0100, Michael Walle wrote:

> Given that, that the rest of this series is under discussion (and esp.
> whether
> it is the correct way to do it) it might make sense to just revert the
> picked
> patches.

The API change in the patch is a pain out of tree due to the way it's
easy to add new things that miss the helpers without it so I'd rather
keep it in if possible.  The underlying implementation does need some
TLC though.

--jaYudf2Qatjg9XbQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWtiW0ACgkQJNaLcl1U
h9BQswf9GyF3//21FvfdPQIKhkExHr2h2cGzlMrSSeuagdoyh+dlJPQXC4C/poic
vpt9904btt6ubjlnpp3LJhtEFky7nLQQiRCYUMXZoLJwZ556Ixk0GQQ844SMI5h0
Frz9fUTXkKW24um3wXkfWA1KHEK2obOTAZzlP6KqnHmkwzRMWbEvWGG9OXGXmNL1
HwWa+Sw/HmdcYUo1gYwUY/Sy7SDTw4/vJDTwQMxiC/uPNd60FrRC7Ia6qBP+vUD2
QzwRmme2U+gfLbWSzrkYYPqGsKYQYddgz0Y1BMspZ1Ptvw00somMsz4zMqxOIKQN
K0Ao5bjbuOFXpRh6EulWQonrG0tLCA==
=Na53
-----END PGP SIGNATURE-----

--jaYudf2Qatjg9XbQ--
