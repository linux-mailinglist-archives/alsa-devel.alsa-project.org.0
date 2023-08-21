Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A92782877
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Aug 2023 14:03:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0BEE825;
	Mon, 21 Aug 2023 14:02:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0BEE825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692619395;
	bh=OhzVUVonZj9qZnR29C7qxvX+xg5STIavJSFYMfrZ8f0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uahgpDDRvnrSbZP+838MMRhIeY75/0fDQEzfXV+7uEKqHgB4XZFUPgGfUvbN9wDpv
	 ZryNWuQozJQXkdJqwK69qBAx5fdADZvQYINJxm5KxUAl/RVIpW5KWtwzU6oyI804mK
	 rW5Wdn0H1bl4tDqF5VCz++Ee5Vff4KMLV5kwIZFU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25A33F80510; Mon, 21 Aug 2023 14:02:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D5F47F8016C;
	Mon, 21 Aug 2023 14:02:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C8A1F80199; Mon, 21 Aug 2023 14:02:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2EC4FF800F8
	for <alsa-devel@alsa-project.org>; Mon, 21 Aug 2023 14:02:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EC4FF800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=eH9e0GUL
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 34F28632ED;
	Mon, 21 Aug 2023 12:02:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2B6DC433C7;
	Mon, 21 Aug 2023 12:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692619333;
	bh=OhzVUVonZj9qZnR29C7qxvX+xg5STIavJSFYMfrZ8f0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eH9e0GULtPn3+7o5CVPiJG3BPQ8RHxvqG1sxgejxRpIxR58MuhfvoCZMK6WXwWJ4a
	 W3jmEzqOM0WJChfDwl3w1FQYgAUPSeVxsU9TsEA93Pe7DX1TxAIrhzmPlVVUs9eWOa
	 waS0aqcKYEKfOyi8Bq/A9j74C4HfhJI1gT7jXSHBAIL0hdT8HjqKh5lkbBd8UtiIss
	 wThKBqCeMkrO6Bcuv6+AdKfq1gT/7ezwIfAQeqz3KojHq5RAdW906gJnRJ5WbaEe0W
	 VmJ38zN4lCljt5R0+umjtJ/JcfLgdXTx/g7kVyQpS5paMejr43SsZYR7UxZYauDVeS
	 L/oJIZSluF/iQ==
Date: Mon, 21 Aug 2023 13:02:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Senhong Liu <liusenhong2022@email.szu.edu.cn>
Cc: oder_chiou@realtek.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sound/soc/codecs/rt5640.c: fix typos
Message-ID: <d420f8ab-6ea8-451a-9b71-75a9d1f6ea7d@sirena.org.uk>
References: <20230819133345.39961-1-liusenhong2022@email.szu.edu.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VHM+pqCkh12UabdH"
Content-Disposition: inline
In-Reply-To: <20230819133345.39961-1-liusenhong2022@email.szu.edu.cn>
X-Cookie: Do not write below this line.
Message-ID-Hash: 5VER6TJQQGLJ7OC6HYICCKQM5YVLFRO2
X-Message-ID-Hash: 5VER6TJQQGLJ7OC6HYICCKQM5YVLFRO2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5VER6TJQQGLJ7OC6HYICCKQM5YVLFRO2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--VHM+pqCkh12UabdH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 19, 2023 at 06:33:45AM -0700, Senhong Liu wrote:
> I noticed typos and i fixed them.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--VHM+pqCkh12UabdH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTjUj8ACgkQJNaLcl1U
h9DMFwf6A1IiyBJsCe0gvETDTiyjDS7ZX3iut2wr0PDQjcTQe5Hq5cBQyIvSCKnH
T46lzQ4OdJhMrzet4HIT/CeTYky4nvwwdPWb3L/DWiSKsvdmgjI1BS7jZ9p02aa0
QQIQ08ZKAAsk+wZmmkJjouJ7puPvBU6edDbKOwx7wOmKrkDeJq6FQ92EceFbpUrZ
xPm10MT9ZqV0KJ/8i6Nc7OeaXSzBVBuXr15eijqNh02HECDQJ1dV5VxIJoUgZMsZ
Twrg+XSwQR0Rd3GNAUqS28y6+e1lE9+LWPluBD1zMkP5vJgtx9mETnX4Nur+fIZ6
Z00trFH/gAi/UE3ZAmcN5X0ZJv1tHA==
=C5w5
-----END PGP SIGNATURE-----

--VHM+pqCkh12UabdH--
