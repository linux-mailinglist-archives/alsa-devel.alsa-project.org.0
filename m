Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E623E7D9DF3
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Oct 2023 18:24:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92E3EA4D;
	Fri, 27 Oct 2023 18:23:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92E3EA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698423881;
	bh=RV0fLu2/76u6vHIzDmwynMS7JHnsLAajtz19VSfeVOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HmQjro29xKSnZrQ+zPcypVENQx16ule71xJYw1mbQClMVVr0WLQq+L53lSDpHAKqS
	 XBwlIVWmuI+tmzy3hzA5PD8uzuNXxsIRmUIO9bqtlH5Kfccf5TxA+Vz/d96MJl8eXx
	 AkdcJLVeAr2cuizuInfTrA8F8uuxrYXbTg8upblI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02200F80224; Fri, 27 Oct 2023 18:23:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B8C06F8014B;
	Fri, 27 Oct 2023 18:23:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5479DF80165; Fri, 27 Oct 2023 18:23:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 18B3BF8014B
	for <alsa-devel@alsa-project.org>; Fri, 27 Oct 2023 18:23:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18B3BF8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IU7qEilM
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6EA3661283;
	Fri, 27 Oct 2023 16:23:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76439C433C8;
	Fri, 27 Oct 2023 16:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698423820;
	bh=RV0fLu2/76u6vHIzDmwynMS7JHnsLAajtz19VSfeVOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IU7qEilM3rjTamN9SMxER6aUSRpZdMoz/+fHY92Dt76/9ffAeHhbVhzh21bxT9Nhr
	 TTivbhtISZ84ujdJapLPZSVjSRCFDPrm9A/Jwx7Unkblfk4P44BeJgEmdx6T4rM5TQ
	 69AlxOyNjOFZ4Ke0feuowcdMXX3LZqvCUHjtKiG1VHg9bPhsqXTfcvqg2tgqP2X+Hz
	 urnbYckxizt9/uwYeBanT+oaeLXWzbuZrnX2cPm+nKO0pl6/K9f4ga5fBmeh/Ypg9m
	 atfZCvQLatkV0GDuEBZvO1jdwZkRwH6BXHmrE70tsSz2v696kmIjkIbZj0y2cC8C3g
	 /RuBmNZxo0tVg==
Date: Fri, 27 Oct 2023 17:23:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	alsa-devel@alsa-project.org, Vijendar.Mukunda@amd.com,
	Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
	venkataprasad.potturu@amd.com, arungopal.kondaveeti@amd.com,
	mastan.katragadda@amd.com, juan.martinez@amd.com,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Marian Postevca <posteuca@mutex.one>,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Gaosheng Cui <cuigaosheng1@huawei.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 09/13] ASoC: amd: acp: add machine driver support for pdm
 use case
Message-ID: <ZTvkCAYsrS62/82u@finisterre.sirena.org.uk>
References: <20231021145110.478744-1-Syed.SabaKareem@amd.com>
 <20231021145110.478744-9-Syed.SabaKareem@amd.com>
 <4d5a4c67-2f4b-4111-b98b-ef575543fa6e@kernel.org>
 <3ec97548-1f91-49d0-adfb-4f8051ca9a97@amd.com>
 <f8f8017c-4e76-4d70-918f-d7cb45186184@kernel.org>
 <c0ea139c-9861-4ea1-b547-6e3c380301b3@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F5X28b0ZPx7dDZpr"
Content-Disposition: inline
In-Reply-To: <c0ea139c-9861-4ea1-b547-6e3c380301b3@amd.com>
X-Cookie: Save energy:  Drive a smaller shell.
Message-ID-Hash: QZUW5DAK6A575WB5L3NHCODWW2M3AZO5
X-Message-ID-Hash: QZUW5DAK6A575WB5L3NHCODWW2M3AZO5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QZUW5DAK6A575WB5L3NHCODWW2M3AZO5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--F5X28b0ZPx7dDZpr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 27, 2023 at 10:54:47AM -0500, Mario Limonciello wrote:

> What would actually go into MODULE_DEVICE_TABLE?

> The platform devices created are contingent upon what was found during the
> top level ACP driver probe.  You don't want all the "child" platform drivers
> to load unless they're needed.

You want

	MODULE_DEVICE_TABLE(platform, board_ids);

which is effectively the same as all the MODULE_ALIAS items you have
there (which can be removed).

--F5X28b0ZPx7dDZpr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmU75AcACgkQJNaLcl1U
h9AMNgf+K4oW7ZrMTMIcX7t1TwQoWNyZMYtETdiOm7VKUfS7pub9BGO3pKJa3oFo
JgemoHmiM+XrK6SJtNr6+UstjZXH0S3LzN9fD5hu7Xlzn38slkvdv3gUd4J/pct/
6/MKQp/Is54DVkuMxYoMx7Pq1v+9R4bwI0RprFxfNtRWedJuDED4IHnGBJ/j3nfj
qWWoZHkKxuQM4A+AMSpo/O+KRohtvOwUAZTBxwUFXxaj3tGpJ4aNQwN7nxcsN5hl
t6jH5P0kzl2uGoy899M84AHyyI37vGxTDMrjobYDSXxNOojIIyAbHlRQbNSK2rf8
GN0aZEw0+VJBCdOtyXgnO+Vpkwjpsw==
=QVIL
-----END PGP SIGNATURE-----

--F5X28b0ZPx7dDZpr--
