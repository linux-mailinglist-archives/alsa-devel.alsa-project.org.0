Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7876A9844D4
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2024 13:35:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8FC1B76;
	Tue, 24 Sep 2024 13:35:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8FC1B76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727177719;
	bh=rKs5/OSc6TyjTgwrhhTpYVqo6h9fokjAxNm6K24eta8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ByBLCisWo9ocbBez0MOF3OKu1NBQ/JHRhuPWjxDLwX1GLK4maegsHG3xMaDUyVsCQ
	 J5DzUpswr8ByWhqhIp/zlHiqUZA4Er+MLOpCx7yOMj83XgVOcYpsDnuYz8PaiYfdE3
	 Y4Eqj+l+qi4xKbE9oEYWMsK4jnDa6SQBdHBRPEZE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 313D6F805B5; Tue, 24 Sep 2024 13:34:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A1578F8059F;
	Tue, 24 Sep 2024 13:34:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D690BF802DB; Tue, 24 Sep 2024 13:34:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7B289F80007
	for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2024 13:34:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B289F80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HT+qfoni
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4D4B1A417BA;
	Tue, 24 Sep 2024 11:34:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7986FC4CEC4;
	Tue, 24 Sep 2024 11:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727177674;
	bh=rKs5/OSc6TyjTgwrhhTpYVqo6h9fokjAxNm6K24eta8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HT+qfoniodsdsvA9tRVsn9P5BjNjM3VyrZoKTShpi5saHjINGVY1GzvkpAhIzgXth
	 YajRsmI4u1MTiDNOqYXpqhO2i/HltzbH+csHny4WmzR48Dm6J/34Gn/UOmBxA2dfln
	 S2RBYR4d2ELJfzoE7DcRldj8FUU6pHkgeaLpVv13jDVqXshcjd76s33RuufCU2o+qg
	 LVjKL74KQ71EYsacnX3BoUqI5Z9yE2YlBSkcu3z1Ly6hT7n5L1+p6i9h1nzjDBHPT/
	 Yeob+mwVCZq0J4TCS38c106VTLcO02qcQRHvauKdKn+fOVEziZUBLDpkQGWFYqMiJg
	 b3RG+9pXZizGQ==
Date: Tue, 24 Sep 2024 13:34:24 +0200
From: Mark Brown <broonie@kernel.org>
To: Andrei Simion <andrei.simion@microchip.com>
Cc: alexandre.belloni@bootlin.com, alsa-devel@alsa-project.org,
	claudiu.beznea@tuxon.dev, lgirdwood@gmail.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, nicolas.ferre@microchip.com,
	perex@perex.cz, tiwai@suse.com
Subject: Re: [PATCH] ASoC: atmel: mchp-pdmc: Skip ALSA restoration if
 substream runtime is uninitialized
Message-ID: <ZvKjwNiVIaPJRgCz@finisterre.sirena.org.uk>
References: <ZvJ_ZFpIiRpD_uzO@finisterre.sirena.org.uk>
 <20240924112542.78321-1-andrei.simion@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OPMTtk5A+6W/AAfB"
Content-Disposition: inline
In-Reply-To: <20240924112542.78321-1-andrei.simion@microchip.com>
X-Cookie: Editing is a rewording activity.
Message-ID-Hash: LKSOKMIXTST3DMCIP5JQFKFR6GZUNOC2
X-Message-ID-Hash: LKSOKMIXTST3DMCIP5JQFKFR6GZUNOC2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LKSOKMIXTST3DMCIP5JQFKFR6GZUNOC2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--OPMTtk5A+6W/AAfB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 24, 2024 at 02:25:44PM +0300, Andrei Simion wrote:
> On 24.09.2024 11:59, Mark Brown wrote:
> > On Tue, Sep 24, 2024 at 11:12:38AM +0300, Andrei Simion wrote:

> > This then means that control writes are just discarded which presumably
> > is going to upset things if they actually saved a value here.  Why is
> > that a good choice, rather than either fixing the race so the card
> > doesn't come up too early or removing the need for the runtime?

> Ok. I understand. My first intention was to follow the
> https://github.com/torvalds/linux/blob/master/sound/hda/hdmi_chmap.c#L794
> but after your point of view, I intend to return -EAGAIN in V2
> to specify the substream->runtime is not ready.

> I retested: configured pdmc, then reboot the board and the configuration:
> as a result the configuration kept.

> alsa-restore.service status success.

> Do you think this solution is enough?

Ah, I'm a little surprised that we baked retries like that into the API
but if userspace already understands that then that'd be fine.  Though
now I see that the HDA code already does what your existing patch does
I'm happy to just queue this version, HDA is so widely deployed that I'd
guess everything will DTRT and it's probably best to be consistent.
Sorry, I hadn't seen these nuances of the channel map interface before.

--OPMTtk5A+6W/AAfB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbyo78ACgkQJNaLcl1U
h9DYOAf8Cc5jBlDbQKzbxYO70e7NQhNEihYy1ZOIKmGdXp0SzVHK6pbFgmOkEwAz
Ea7AERt3Vsuk/ALjjzZ9WNiyTf2NENQIz4+E4lA0VUL+iuKCxpxE5gtr0OnLi7Z/
1NZevWL6CNmAq6GjbTaqLCKd69fQxjTrmVeUrr6A+1rvG+E36/GG749RmtRonaRN
eP1qYv4aLBuuaD38eDViLg3spRSryqGe/EwRnxc2g8ntRKQll2/TFqXegJ/4mjyZ
B+KSZMKVQIlJ6z3rJDyt9nT1f7rRSPq8I2Ez/a8v13saoqzSK7k76nVR46Xlse9A
HaQJyY7wIsPr778y6ToS+POfwGlNbA==
=Ib8E
-----END PGP SIGNATURE-----

--OPMTtk5A+6W/AAfB--
