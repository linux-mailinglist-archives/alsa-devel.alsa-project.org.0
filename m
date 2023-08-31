Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E5178F0DF
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Aug 2023 18:06:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF04D208;
	Thu, 31 Aug 2023 18:05:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF04D208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693497976;
	bh=7hx7dENCRJJYC1sdS/KEN2Hx0CzgtkyQU3faU/Y4KgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i8bwOTxk/gLGN9BxgTW9afxL0TC+aqEGeKiy2RBOi1NeGAU9zZb6fjf5uiDxYKU0+
	 +NVFsTa9mPErHe3ZYaCLj3/AbqMjQ0CMvThUXZSDepZ70oKS2MrJ2q67Vj4MG/G2f7
	 7JGo0HjZP0nuymWls/KZId74MPWLxUTN5df/l2b8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81FA2F80249; Thu, 31 Aug 2023 18:05:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DCB0F800F5;
	Thu, 31 Aug 2023 18:05:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 95C91F80155; Thu, 31 Aug 2023 18:05:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0A4B9F800D1
	for <alsa-devel@alsa-project.org>; Thu, 31 Aug 2023 18:05:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A4B9F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Czr8DBk0
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D78BBB8233C;
	Thu, 31 Aug 2023 16:05:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE302C433C8;
	Thu, 31 Aug 2023 16:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693497915;
	bh=7hx7dENCRJJYC1sdS/KEN2Hx0CzgtkyQU3faU/Y4KgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Czr8DBk0c+4Rk/t2YiSSHUOaqbZdTLZ+IMPpytBgoFAig6GZQFxXK1MTMLMpPND1H
	 BkSBycm92EBwXy233EhHUZx5t+b+eb5qZ6w5dnXVftPLGWfNoWLr4cEhGRkXsMijaS
	 sgQZgj7G832dEghI8nexABPET8qudZQgRvowUhxxSljotd4UbjTxWiVj72AREjRG/p
	 6rPdWiXwfrb7KTVKEGRLqAaWtaWsHme216MsqIgwgIJGVSoQWJa48ntE6VdfwOJTUj
	 U9rYXsS6cUsyxjFw6k//b7lRnxLukAE/5LLRf0AdzCDRTHYvKUSgiYfYJIaJRtNyTS
	 UoKVzc84DmTuQ==
Date: Thu, 31 Aug 2023 17:05:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: "Rivera-Matos, Ricardo" <rriveram@opensource.cirrus.com>,
	Vlad Karpovich <vkarpovi@opensource.cirrus.com>,
	James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh+dt@kernel.org>, alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/4] ASoC: cs35l45: Checks index of cs35l45_irqs[]
Message-ID: <def16e52-3ba9-475d-9d8f-63513c47a392@sirena.org.uk>
References: <20230830195536.448884-1-vkarpovi@opensource.cirrus.com>
 <737c4114-5b54-444c-8a6a-de4e98566513@sirena.org.uk>
 <5B0EB2A2-2048-4A71-A4A9-D5167C7AB5EC@opensource.cirrus.com>
 <d97094c6-1534-05ad-0452-c627d7c45802@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sg7FyDwimPhJ1e+i"
Content-Disposition: inline
In-Reply-To: <d97094c6-1534-05ad-0452-c627d7c45802@opensource.cirrus.com>
X-Cookie: "Pok pok pok, P'kok!"
Message-ID-Hash: FW6EKARCJJ3YHVYJSUJ4LTVGYS24XKFB
X-Message-ID-Hash: FW6EKARCJJ3YHVYJSUJ4LTVGYS24XKFB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FW6EKARCJJ3YHVYJSUJ4LTVGYS24XKFB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--sg7FyDwimPhJ1e+i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 31, 2023 at 04:22:52PM +0100, Richard Fitzgerald wrote:

> I think Mark's comment is that the Signed-off-by chain doesn't match
> the patch author. The s-o-b order implies that Ricardo wrote it and
> Vlad is upstreaming it - but in that case this email should start with
> a From: line to say that the author is Ricardo.

Yes, that's what I'm querying.

--sg7FyDwimPhJ1e+i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTwujQACgkQJNaLcl1U
h9C2XQf/e12wM/5qI0klirzI3B5cxQSYtxwT4u4kiP20chaYcc4ZyUzfuqCD800b
INi0tijp1M4LgZjrvVHpzkwGVCdXbAp4rUAw9DYtOqof7LDDZNapno6EwM+cPv7Y
ev1suWR2Rre4fNI8aBZQ7qm5MCVF2ISY0AbvzHJK63NR4epe6Ji16bnWCZ5D97m1
qBwMjRxyu8PSTnLD4x34INVkSxWNw0LGhhnq1J+zas+qEQEKTzTP29S07asSmPNi
9B/TDxUj0bLkdyA8f6bV4eFTAtmRSlo2r+l65vSxRL7cpF7ONB0C2m9vTHSYCFQV
fJsHN9MnLDDbT0Xj0NJ7rLDwndTM7A==
=7p8c
-----END PGP SIGNATURE-----

--sg7FyDwimPhJ1e+i--
