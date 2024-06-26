Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A57D59185E2
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2024 17:33:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8DF714E5;
	Wed, 26 Jun 2024 17:33:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8DF714E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719415991;
	bh=tvA34FpV4DakdXF49bAtY/u5hoSo55rpNjNYU7IAKMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YiojCQw2E7X6ThXNHeFRsV02eYM/JzLckPBULWJLwxu93ZsKi0UfYqAJ6zZx0nPB+
	 7VZ070PdI3x8XpmEksFyo3mx8R7zzWUUCMeluJ6KxW9kaF8h4gClruE5QvyGwYT9C1
	 x0RmbRvJnroK3M35uWc6YQ9gwhUh1KhskSVI3zWg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58743F805AF; Wed, 26 Jun 2024 17:32:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FC49F805AF;
	Wed, 26 Jun 2024 17:32:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1577F80423; Wed, 26 Jun 2024 17:32:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 313FFF8013D
	for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2024 17:32:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 313FFF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FA84uclm
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2956A61A25;
	Wed, 26 Jun 2024 15:32:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26283C116B1;
	Wed, 26 Jun 2024 15:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719415942;
	bh=tvA34FpV4DakdXF49bAtY/u5hoSo55rpNjNYU7IAKMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FA84uclm1D8X4g0nuHVj1lk9xPKdRRACn2cc1L5pmlfOP8ciDVVuIRHJjPRKivcvZ
	 NRGySXog6Ct9gHt7rI8znfrrBwTDRmVWlGk+rYxvPIcyyeGuRMk2LSgrukE1Zn1OMD
	 XnAut5WDcJ47OjftqsgbgIyTXxtxvWoAFdIfMkNHYQxmZgOwLsE86RV0iazxxdxhWo
	 bR2UEOSjunR8QNqJyMtzsRhTAA15rrHT2PjrPFg2ksnf8dA2JZpqYKYjp+1NZuECrL
	 P6CP+BLuaROtW0dacArxpnxTa6fvzkKdo4HYgSTKBUwmQXnNOUEU3lhudlNzJNjvXX
	 qVgyOVmO+pg6Q==
Date: Wed, 26 Jun 2024 16:32:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, John Hsu <KCHSU0@nuvoton.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 0/2] Add master clock handling for nau8824
Message-ID: <8b6198e7-f82f-46ce-a126-972191c347c4@sirena.org.uk>
References: <20240626145931.25122-1-fido_max@inbox.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0AuYSYvUy0W9Qqi6"
Content-Disposition: inline
In-Reply-To: <20240626145931.25122-1-fido_max@inbox.ru>
X-Cookie: Results vary by individual.
Message-ID-Hash: GO52XFNAOBWMRVNX4KYB6QYM6KHYGPVH
X-Message-ID-Hash: GO52XFNAOBWMRVNX4KYB6QYM6KHYGPVH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GO52XFNAOBWMRVNX4KYB6QYM6KHYGPVH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--0AuYSYvUy0W9Qqi6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 26, 2024 at 05:59:28PM +0300, Maxim Kochetkov wrote:
> nau8824 has external MCLK pin. So add enable/disable external clock
> management.

You appear to have sent two copies of this series - what's going on
there?

--0AuYSYvUy0W9Qqi6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ8NIAACgkQJNaLcl1U
h9Cl/Af9H9ZJLzDYxxEX+is0jB6UkzHtM2421nZU/HDt+1V978pBNcsC0M0NxL/O
l7oEk5BYkn8S89VLoeBhUIaTVn4EkP5Z3CSUlKuxtWXurP1moz8WNz21OfLsTS+1
pKOoA9wqzdqV4lhkOKfrMhHzo4fCw0Nq/7JQGzl3vgHr9cjgiIggjAuPLuie55Wd
urr1wM+l8SfqqyOZPT5mfz2DaW4qSDVLrJNmk9TJ/sCnhKxPEJS2OIZWgyYC4Xow
jN/mGGWOAGdErrINe5q2kIcXvrgIWFLtKRoxNxy7MoV+AmJ9yV6jgV9xhxtsamTN
6qQ05tgnXH9GOchS9nqsm+z58VVcCQ==
=WOE+
-----END PGP SIGNATURE-----

--0AuYSYvUy0W9Qqi6--
