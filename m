Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC747FBFB5
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Nov 2023 17:53:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 756CB846;
	Tue, 28 Nov 2023 17:53:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 756CB846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701190408;
	bh=6Yf/uLz18Gq8H5kOW7N2aP2op38D2JYtC162y8GLLGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fLk1oulFAJMY4K+sX5kBnI0jJ9eICJm3NDCYz5V1sqX/SC/rMyn32woKbqx8lDdXB
	 YoCZCVrLgTGXC8p2NTauUc6WC6s/jFAR4yJibxq108Qyi0VCQNpgS3q5Tvq6J9Dwya
	 cUnVddjGCbbf7B2MUiBEyHeUSRK0/e2S9WOQgwdA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AAACEF8057E; Tue, 28 Nov 2023 17:52:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A2FAF8016E;
	Tue, 28 Nov 2023 17:52:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 990FBF8016E; Tue, 28 Nov 2023 17:50:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 01030F800F5
	for <alsa-devel@alsa-project.org>; Tue, 28 Nov 2023 17:50:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01030F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LRDfR796
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C514BCE1B51;
	Tue, 28 Nov 2023 16:49:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DCCDC433C7;
	Tue, 28 Nov 2023 16:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701190196;
	bh=6Yf/uLz18Gq8H5kOW7N2aP2op38D2JYtC162y8GLLGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LRDfR796bhU3csAgEcKgNsCexFMyk3A74u+HoKcqHzBPIcTwu/2/7ZeRNTKNrrBbu
	 KVjzB9UaCjQhlSGAs6IqNewJEdyiZ1ycqoeoaZrgBCAA7mSPkb+zqT6ngNEx3JmIGD
	 qMjZ72PLOD4ex07KReAGv01OwD+DjY+6hs/hxOQ5dEaCR2LIIXqDLDg7QyhQO5oIPx
	 ntRsqgP9TwDwMBkLRtYYuVuO72TxT3GNoLkIT/3Mqo7AFX0XRoT9NG6swp4IXLRITA
	 NE/IvQiiYaSXVx7EgM70FH58ycJMUu3zKfN8P5YmQD78Jd+Sq4j/iv/lyuck8P2hH1
	 TupGl+89Rt3vw==
Date: Tue, 28 Nov 2023 16:49:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
	alsa-devel@alsa-project.org
Subject: Re: tlv320aic3x: Failed to init class D
Message-ID: <c575c619-ad02-482b-b675-4e022bb5f7c3@sirena.org.uk>
References: <20231128-frail-parted-f6e66c217965-mkl@pengutronix.de>
 <374f0221-9853-4eee-984c-05af01732582@sirena.org.uk>
 <20231128-untouched-flakily-1d7d56559286-mkl@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qbSydOlcQXj73JH4"
Content-Disposition: inline
In-Reply-To: <20231128-untouched-flakily-1d7d56559286-mkl@pengutronix.de>
X-Cookie: Must be over 21.
Message-ID-Hash: QJ4XH3EI7VPQMNSYM26NOFAR336L6BAB
X-Message-ID-Hash: QJ4XH3EI7VPQMNSYM26NOFAR336L6BAB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QJ4XH3EI7VPQMNSYM26NOFAR336L6BAB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--qbSydOlcQXj73JH4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 28, 2023 at 04:47:27PM +0100, Marc Kleine-Budde wrote:

> In probe() it wants to write to the regcache only, and then calls
> regmap_register_patch(). During probe the chip is unpowered and in
> reset:

> | aic3x_probe()
> |         regcache_cache_only(true);
> |         regmap_register_patch();

That's not going to work well, patches always bypass the cache since
they are often ordering dependent and if we understood what they were
doing we should be writing them in normal code rather than just spamming
in numbers.  There was some edge case usage I can't remember right now
(IIRC with partial cache sync) which meant that we didn't want to just
assume that there'd be a full cache sync as the first action after
leaving cache only mode.

> If I only power on the codec in probe() for the regmap_register_patch(),
> I'll shut it down after the regmap_register_patch() anyways. So the
> register values are lost in any case.

Cache sync will reapply the patch, that's the _register() bit of the
function name.

--qbSydOlcQXj73JH4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVmGi4ACgkQJNaLcl1U
h9AWwgf8DoYMXkZghLQ5R8bfRd20G4/YRblNiNpKZAYkgMdgeVcSQAmpdtXTdM6N
TmzR7fSSmV5hZ2A6QrObg+OUueas4MILY5Z5/swjHUioAERq3NnJRxjqI/WyfrQt
Bdx65gmzbae4VGDMcTC9GqyoxZLgbZJ5A1/uQztfMu0HswdLqDOXIj3N6BdyQLt3
MfGvaJRYePuRa2tD+skHlyXsDXUTcpSC2ubvn3hiDUeQDrGt2UvJ0aGWyJ1FxAHI
brz4OWZAOg2oVIQD3UERtXuGhidc7r29RKvBI5qloVMEART2KY8zsPuASlg8ovSk
QSS3NqmmHwzsWy9He5t8HPWDVLmOrA==
=tIvW
-----END PGP SIGNATURE-----

--qbSydOlcQXj73JH4--
