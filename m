Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A584872E54F
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 16:11:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91D93E72;
	Tue, 13 Jun 2023 16:10:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91D93E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686665460;
	bh=o8EXcZWP6D1fQmLjGg+FvASyQnglX4HVwqy+2to6C5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uomq8uRgadfYcjMPKUdxkb4knGwC6XgtNaewwdCy8w4oaQASIk9g/OFL+13Hsvnyk
	 SjO4bsPQmPZ7XOCQMwP0/ZMVaoEXAAc9zO1ljoCoymrVnBijCdIRX3zfD0G/uBswUS
	 gyQLdpgVUQjpJyYsB5oBk1WyT58UdiFB91MDoZVM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0EB7BF80132; Tue, 13 Jun 2023 16:10:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 99107F80132;
	Tue, 13 Jun 2023 16:10:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B6DCF80149; Tue, 13 Jun 2023 16:10:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3C441F800ED
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 16:10:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C441F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YkhlScch
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6084A62E78;
	Tue, 13 Jun 2023 14:10:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DF51C433F0;
	Tue, 13 Jun 2023 14:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686665400;
	bh=o8EXcZWP6D1fQmLjGg+FvASyQnglX4HVwqy+2to6C5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YkhlScchy90wqe2imcplxeuot/NZH4/9ZSLT8qBW7xXfORudVmTSO1AwJ88xQ+fSu
	 xJ257XjyRIx5GnZbgDvzeoOiyB7nKD4ofBrQggq25FTL2wPW7kKqabLRr+Q126fygH
	 4MNbg9bAsuUHGLd8SCzW0xvRIy0BmQMvZ2pqaG0Obj1lqBX2M310jtHvrn8yGF9g46
	 sxpssiEl9bX2JGCxD28Ep3mYvpwqPGonhtdwP31h48gZVZeZ9jrHN+roXmt43uTP1c
	 JMt7atwh39UbKdC9RaiGc+ZSsdT1IVYxmaHbUjZCP1QHzzgK0kXSDmKJ/aO8NCa+Sy
	 dyMoY5i4gVuBA==
Date: Tue, 13 Jun 2023 15:09:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Arun Gopal Kondaveeti <arungopal.kondaveeti@amd.com>
Cc: alsa-devel@alsa-project.org, vsujithkumar.reddy@amd.com,
	Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
	Sunil-kumar.Dommati@amd.com, syed.sabakareem@amd.com,
	mastan.katragadda@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ASoC: amd: correct pm_runtime enable sequence
Message-ID: <317a0f1b-94a7-4bd4-9f64-8877e0552b6a@sirena.org.uk>
References: <20230614003206.933147-1-arungopal.kondaveeti@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t1NPVEr5bJW1JzkT"
Content-Disposition: inline
In-Reply-To: <20230614003206.933147-1-arungopal.kondaveeti@amd.com>
X-Cookie: Not a flying toy.
Message-ID-Hash: Q5OKHCTKIPL3MJ2VX655NT7AEUWYTF3L
X-Message-ID-Hash: Q5OKHCTKIPL3MJ2VX655NT7AEUWYTF3L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q5OKHCTKIPL3MJ2VX655NT7AEUWYTF3L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--t1NPVEr5bJW1JzkT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 14, 2023 at 06:01:59AM +0530, Arun Gopal Kondaveeti wrote:

> Replace pm_runtime_allow() with pm_runtime_mark_last_busy()
> & pm_runtime_set_active() in pm_runtime enable sequence for
> dma drivers.

This says what the change does but it doesn't say why the old sequence
was a problem and the new one is better.

--t1NPVEr5bJW1JzkT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSIeLEACgkQJNaLcl1U
h9AlkQf+IKLQ0NDoQi6rzDHjoOd3/5jO3kp/pibHdhq77SZ6JH2dDmTM/+VA8G1P
fr3LNHwXk6Xkahyn5xA7+eL//sAZTozBpbFcd2BZuYYawdETKIQFYhX7z8U00PpW
EyAi4H9Ek9C5nYd6JrQmY7gVCuir2aoE5Dw5kMQwxIRMvOvnJM2dtuMMUUQQ31nE
iG1PBYX05Cua2DLQyJD5cmoaQjOL4EieVYFXl+ptMUBW4NS48OVpIfH+Nr7Ic7o2
1gVJm8vcUOqkR9w0x/2fdLE+WsK3CBRx728IijLhFg86QfPiZhkfiSfoLjJzsGPd
LHgy5hqjp2RWkt/DxGDo5yh3jwb4QA==
=B8SW
-----END PGP SIGNATURE-----

--t1NPVEr5bJW1JzkT--
