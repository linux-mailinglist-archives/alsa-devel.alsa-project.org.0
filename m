Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BE779779D
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Sep 2023 18:29:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 839E3827;
	Thu,  7 Sep 2023 18:28:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 839E3827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694104186;
	bh=kKCZnmdvlWAjdrTU0JnWgVFWVm2CYeepMuQakkeoZIE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SgfMAP9q8ufzJ/hJgyBtamOgovMvzkpUa8Y2yL+4IIgFefMHdsLBVMHIePM24G1GQ
	 K5xerDz5CWT34Z/AFTFDAVBdvEU5ZggqeIXPQ3j6aaLEsNjSNyrY473BDXRb43y6Wg
	 hsb0aqWYq5sAfHMUlovYy5ScXyFcgzbNA0nkO4jo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB28CF800F5; Thu,  7 Sep 2023 18:28:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A6AE3F8047D;
	Thu,  7 Sep 2023 18:28:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB4F3F80494; Thu,  7 Sep 2023 18:28:51 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id ABD94F800F5
	for <alsa-devel@alsa-project.org>; Thu,  7 Sep 2023 18:28:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABD94F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=md4gqddd
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1CFEC61230;
	Thu,  7 Sep 2023 16:28:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0F3FC433C9;
	Thu,  7 Sep 2023 16:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694104122;
	bh=kKCZnmdvlWAjdrTU0JnWgVFWVm2CYeepMuQakkeoZIE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=md4gqdddSO75KH0T47TDmNEOdTf41rhUx525zBO7wDx1GSSi0sr7xkqy8MuFHqauP
	 nhO2VHtsMeUCqKmw6eisy7vq0/5xR3u8jrC//uvr9EQrNk5kytuUbHUTRUk9ugyxgx
	 3gSbAEWD3u0Gyz0dh6NI7flXZNoypzJYi6Gwh5BJytM2We8AibqAKNUG9IW6roAbGo
	 0iuC0r5m6jjPnx8Jz0nyh7UBwT6nHV95FkZREvvqPBzaQY9EVBGGqiFE7xX7NryX5W
	 gHXkYEawONiYhIBWoTKMA6cRhR+J9S4N6Op3eOlZLgdJnPGnXDWljlFl2qIEwtAXJp
	 mYOMEcrY/9RNQ==
Date: Thu, 7 Sep 2023 17:28:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Joerg Schambacher <joerg.hifiberry@gmail.com>
Cc: a-krasser@ti.com, joerg@hifiberry.com,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Zhang Qilong <zhangqilong3@huawei.com>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: Adds support for TAS575x to the pcm512x driver
Message-ID: <bb3e5ccf-6eb5-4a36-9af0-b33f2db68445@sirena.org.uk>
References: <20230907161207.14426-1-joerg.hifiberry@gmail.com>
 <a9c3d43a-af26-44a0-9352-4666107f9f56@sirena.org.uk>
 <ZPn4nsypsSXdB3J7@ubuntu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hUcgJYAhcs+B7VEy"
Content-Disposition: inline
In-Reply-To: <ZPn4nsypsSXdB3J7@ubuntu>
X-Cookie: In the next world, you're on your own.
Message-ID-Hash: OT7WODCGRT345BWGNJMNVXN7LGGJL24J
X-Message-ID-Hash: OT7WODCGRT345BWGNJMNVXN7LGGJL24J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OT7WODCGRT345BWGNJMNVXN7LGGJL24J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--hUcgJYAhcs+B7VEy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 07, 2023 at 06:21:50PM +0200, Joerg Schambacher wrote:

> And yes, we cannot be sure that future devices may require different
> settings, but I can hardly imagine anything completely different than
> this approach with the usual audio MCLK frequencies.

They may for example be restricted and just not the the incoming MCLK
divider, or require a higher frequency for some fancy processing.  In
any case tas_device is just an obviously bad name here - there should be
a flag per quirk, not a flag per entire class of devices.

> > This is probably a separate quirk?  I'm a bit concerned about what's
> > turning the PLL off here...

> The PLL should not be used in this specific case where all divisions are
> just divide-by-2's. Your original code does reflect that and turns the
> PLL off. It improves jitter and finally audio performance.

> But in the case of the TAS-devices we even then need the PLL to
> drive the AMP clocks.

That's definitely a separate quirk, and does sound like it should be
driven from the bias management or DAPM more than hw_params.

--hUcgJYAhcs+B7VEy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmT5+i4ACgkQJNaLcl1U
h9CZ+Qf+J2f6CIl+3kQOLAmv4SLapcB47o1g840CoC/9/uJ/sk2TlngPfsjmLttb
uW+Sv7yC6pLMtzMHz8kwbnjhapJTJLlrQKhL4u7OPQtX2S5Dm9xbjO3ZXX+MxQX5
wPn/HpF2qDdA/cp/TdBycJcM9zJ+1jjMKBMneCqEPGXJZCRz0mEl9XTaIQLKk9Cq
4fIjWXyyPLf8j+kvqzIBKItMIYkPXABMnjJ7f8jYox9LyigjW306+rCxOJaU1qL5
ZKOiWeZqBWwWI1TEkQQd3i3n6pzmNSAHK0KhlGR1qDaYdjkkyFBhKe5wKsOZeE1w
6WbW/o4djQkLPhrAIoQ7eVyuV0WQuA==
=I+kL
-----END PGP SIGNATURE-----

--hUcgJYAhcs+B7VEy--
