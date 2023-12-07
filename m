Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3219E809580
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 23:40:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43058AE8;
	Thu,  7 Dec 2023 23:39:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43058AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701988804;
	bh=MsLLpv1+/XDyn3UAs12wR75ZLa9IjOrbPm1kkfTtosE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fsW9h1T4MsRL/3fmj1rlNdzdI4o0cZG5zZHRYuhglHeVMhVUqqNxrMf2jWN7mVxaj
	 4yoRsyfN+86WQsXZtrwiSviU2oPZJqJ7jRY1CYOKThMsB6V94tJ6vKeLDxRPFfznPi
	 xnNL9oTOFzr529s0TrBQPoqFYlzQlOtZPSunA92k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA663F8055B; Thu,  7 Dec 2023 23:39:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DE1BF80570;
	Thu,  7 Dec 2023 23:39:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D130F8024E; Thu,  7 Dec 2023 23:39:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D5084F800AC
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 23:39:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5084F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=h7kkiL7A
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 6EE72B82A87;
	Thu,  7 Dec 2023 22:39:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3DC8C433C8;
	Thu,  7 Dec 2023 22:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701988761;
	bh=MsLLpv1+/XDyn3UAs12wR75ZLa9IjOrbPm1kkfTtosE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h7kkiL7Ak/7GSuJ1qH4EHyUTxoHiRKTwCqw53xa/OV4dG+kFQuSJLBVZpzq1ocJGa
	 QIuH0T9Tbb8/jeLEiHZW6rxhzy8mrpYV2qyy0rNpEzPjqkHTXC4eqXH7mOKNTVrMTv
	 5o7+wMTHoTkQarxlu6vWVUA1lwwSCE40hv+TlBJW4f8Pf64VgaN9dZ8dSr3kbNZjS6
	 bOaD0RbbdGg8s0e2/vqLwp9n3THviaOJZ2LYhM/PYjonw2zONkzwOSHDuSNqODY/It
	 RG4qsrMtDz3JS/nbpytfBiewpy1Kp5f+7hll2qUBJGeR9b0D92tSZ73TbZfU2jLYGo
	 7F3ic/gYzLXRw==
Date: Thu, 7 Dec 2023 22:39:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Gergo Koteles <soyer@irl.hu>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH 03/16] ASoC: tas2781: disable regmap regcache
Message-ID: <bf24488f-e4e1-4d3e-a67e-fe74c05acda4@sirena.org.uk>
References: <cover.1701906455.git.soyer@irl.hu>
 <21a183b5a08cb23b193af78d4b1114cc59419272.1701906455.git.soyer@irl.hu>
 <0b836c10-b21b-4275-8dd0-254dd5467497@sirena.org.uk>
 <47097f19398808b64f4cc87c2a3c7cc462fb2416.camel@irl.hu>
 <5f3f0306-799f-4f3b-9e05-fbd300c59d5d@sirena.org.uk>
 <b0ab21657f2e4f0825579de97ca012e294d1e743.camel@irl.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FPnKMl3SLG0UUQNN"
Content-Disposition: inline
In-Reply-To: <b0ab21657f2e4f0825579de97ca012e294d1e743.camel@irl.hu>
X-Cookie: Two is company, three is an orgy.
Message-ID-Hash: JGVJXU3CUY6FT2LC6KRHHOFET5ZYZU35
X-Message-ID-Hash: JGVJXU3CUY6FT2LC6KRHHOFET5ZYZU35
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JGVJXU3CUY6FT2LC6KRHHOFET5ZYZU35/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--FPnKMl3SLG0UUQNN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 07, 2023 at 10:12:13PM +0100, Gergo Koteles wrote:
> On Thu, 2023-12-07 at 20:36 +0000, Mark Brown wrote:

> > > And only one, because tasdevice_change_chn_book directly changes the
> > > address of i2c_client, so the unlucky one gets invalid values in its
> > > actual book from regcache_sync.

> > The code creates the impression that writing to one tas2781 writes to
> > all of them, is that not the case?

> Yes, the tasdevice_* functions, but the regcache_sync doesn't know
> this.

So this syncing is done in software not hardware?  My understanding was
that this was a hardware thing.

> > How would the devices get their configuration restored?

> tasdevice_tuning_switch calls tasdevice_select_tuningprm_cfg which
> checks whether the devices needs a new program or configuration.

> the runtime_suspend and system resume set the devices cur_prog,
> cur_conf to -1.

...

> The tas2781_hda_playback_hook calls the tasdevice_tuning_switch

And there are no registers other than these programs?

--FPnKMl3SLG0UUQNN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVySZQACgkQJNaLcl1U
h9Dz0Qf9EolHA/7hwfIR8tUUDiJRQu5X9PEQJHjmqNgUo0b2RfbIXugc4S/61wPO
reW9pzswW/8Uix3UZcpSo16bjD2ZphcGMFoaFuYBfVf+7j8mg9fUMCuX2LcY5ch1
0EUB6G/1a3qGcVhC8yC9hGtF24lMOogSClM+t3jj8RhH60EU7VLKc1B4GhX+Vm/E
ROtqapM8Tx5oi1tsQLV8nQ+zGdOXdqsg1kZNp9Arv7EcgQ2YkhqA3C6bnb2lebwF
2RZzfAdeX1wlXobP0fzO0h626QjKcHq1YqQgPc6Eyl+QIZfIZ67yvY3y0WJwHh6r
TIHr3QC4TNT60x8XouFh6PuIHtjnaA==
=eHRJ
-----END PGP SIGNATURE-----

--FPnKMl3SLG0UUQNN--
