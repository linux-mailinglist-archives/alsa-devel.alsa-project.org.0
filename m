Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DD879F1FD
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 21:24:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4693886;
	Wed, 13 Sep 2023 21:23:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4693886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694633076;
	bh=QfR5uL7jkH9fN/GXcOqieRXILCGTEgQbU5IKZvV/ryo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DzDKXDgcXtleWBNRTUd3CzbEiOWZP6/54T+U3Kl5We7NATsYJl7tnGavWWhNcbvJB
	 pMn0ISZ3pf49l9d0iRo5d/Zsn7sPJKtTK6blG8vhR/l3I7kPy7cocuZ9sVLA8ssajx
	 PE0jfXRBU5ljsF/HLpuDdfs/1TpLMv6mAc+VdHZM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5674FF80425; Wed, 13 Sep 2023 21:23:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 033F8F80246;
	Wed, 13 Sep 2023 21:23:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6ADB8F80425; Wed, 13 Sep 2023 21:23:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7206EF801F5
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 21:23:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7206EF801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qugAZELA
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id CCFEACE1CDE;
	Wed, 13 Sep 2023 19:23:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45135C433C7;
	Wed, 13 Sep 2023 19:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694633009;
	bh=QfR5uL7jkH9fN/GXcOqieRXILCGTEgQbU5IKZvV/ryo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qugAZELA8l6Z9vO1Slj8OBV1wbWwSrtkj1edugAZCuf5BmW3p/S+3JURrIuCNGLJj
	 Nd+iQfbaXbquSyZrmt8aGfYTHQKXiyuKwBu4GKr9EXRq4kGaSkrX+twiYh2u4ctoUd
	 guzTjnsAMKZYOrdxU1Geu4qFcmrL0O3pJ4TOmZGQQKh7KHRzyebrQrO9+ZSBeMvILW
	 gNPTkxAiD1mRbkmFzQdbLNrbPyA9OnA9zhZAFrYnZwGxlrCBZL7xffbAWLLNHGkQBm
	 tgI7i7ktwniCAUZv7c1oODQrjA8yq0sy25BzCGlO8RayrLQ8mgSAdVgS0J3OHBKge7
	 538gxGpUhR4KQ==
Date: Wed, 13 Sep 2023 20:23:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Matthias Reichl <hias@horus.com>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: hdmi-codec: Fix broken channel map reporting
Message-ID: <83837f8e-d8f2-44bd-a580-9ccc25f5f378@sirena.org.uk>
References: <20230909114633.3193-1-hias@horus.com>
 <ZPxo8qKMDkmBqGxw@finisterre.sirena.org.uk>
 <ZP2zKg88n4MaD53z@camel3.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3TYo9BTnfsqsKfIl"
Content-Disposition: inline
In-Reply-To: <ZP2zKg88n4MaD53z@camel3.lan>
X-Cookie: Use extra care when cleaning on stairs.
Message-ID-Hash: MOIB5EKKNMAKGYFC6BKZXUAQW77BUVKD
X-Message-ID-Hash: MOIB5EKKNMAKGYFC6BKZXUAQW77BUVKD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MOIB5EKKNMAKGYFC6BKZXUAQW77BUVKD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--3TYo9BTnfsqsKfIl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Sep 10, 2023 at 02:14:34PM +0200, Matthias Reichl wrote:

> An alternative would be to set chmap_idx to HDMI_CODEC_CHMAP_IDX_UNKNOWN
> in the non-PCM case so the channel map control will return UNKNOWN for
> all channels. i.e. use this code instead:

>         if (pcm_audio)
>                 hcp->chmap_idx = ca_id;
>         else
>                 hcp->chmap_idx = HDMI_CODEC_CHMAP_IDX_UNKNOWN;

> Any input on that topic is highly appreciated.

This is going to depend a bit on what userspace is expecting which I
don't have a good feel for.  The above does look reasonable TBH, I'm
tempted to go for that.

--3TYo9BTnfsqsKfIl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUCDCwACgkQJNaLcl1U
h9CBIgf/eWJz65fYn7j4U9Ui++jhmfh+EvXDvcw3S4Ft+iFvS9RhO5ou+Ia6qvsl
nJfHj6qAy6rPwSnRnIzZkG4NeoDeiJR/CvEO5JhHdcEDLzLJg2RBqHrsSMH4fjs+
6DSgsVIFvh4fK9293jc53BcTPTEytZ7nBcNFAzribip5GYds0EClg+qLqWRLI92X
KcQc2wzNDL/pWuXJlp7yZRFo+mCE97NksHVNFntbR/PxDRiy9P8bXkdz09pvTzly
WLOIHdthbMSZ2yh1W2UTnJ8Nufq9irV12odDSX5Og6qYJnaiWTLfuwlT1P4+5pql
E1BgeWagaKYtL8OFGHCF9A/OUrvRXA==
=6Coe
-----END PGP SIGNATURE-----

--3TYo9BTnfsqsKfIl--
