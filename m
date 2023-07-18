Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8799D757F35
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 16:16:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36C567F4;
	Tue, 18 Jul 2023 16:15:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36C567F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689689802;
	bh=1GVZIwSM9BIamWibq6pepHnCBx3CgDKaQIbUpZGGjj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NmhC0WIiywsONJidVktt7j25zZG+RjHoQEyj0twpEv/6raXrfCx6v/rlNHgSPi16p
	 3yh6/DZOAeYlf6gaUvqV+tRDNsoaGSaPysHFAGE/rgYUWX5w7SbgeY1LyO4TCTFJfr
	 WSask2oz2I16CIHrJHeoa/NSEob0j2mIgczDKAZo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61767F805EB; Tue, 18 Jul 2023 16:13:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A259DF805E0;
	Tue, 18 Jul 2023 16:13:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35A1FF80153; Tue, 18 Jul 2023 16:13:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 37F22F800D2;
	Tue, 18 Jul 2023 16:13:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37F22F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Mq8yJZ5h
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A2A6D615D9;
	Tue, 18 Jul 2023 14:13:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09652C433C7;
	Tue, 18 Jul 2023 14:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689689598;
	bh=1GVZIwSM9BIamWibq6pepHnCBx3CgDKaQIbUpZGGjj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mq8yJZ5hVIWqZ1ekBoX75Yn9/y5jD5cHrpVzYyA4dLXVoM1/jj6uH11HE4ynmPSgS
	 OVdoNuDcukH89+Ja3vsVjlTbqF1XcCsdGJa1S78TmoJsQxoucKvM6Jg8Kpu4EEah2C
	 wzI0sS01Eh+DelVhNyh5fcYDmRKVqehm97eWGRlXhUIr2A5RO4qUzUftcL4yjfojIV
	 nFTmlwrGCKH/5lSPOi+wm7GHaSJvGBD6BuxzSNYrIjrQzathjI2WbEADw65Xe9sUew
	 54CGtCA83iu6RPRSXS1yxHZs8zBXY4HT4b2SK5d0Ys3zWxA8DvN7bObvGUuQ9OIzxo
	 vvUkgfoaUwBfQ==
Date: Tue, 18 Jul 2023 15:13:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: alsa-devel@alsa-project.org, sound-open-firmware@alsa-project.org,
	linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 6/7] ASoC: SOF: Intel: Remove deferred probe for SOF
Message-ID: <5a54647b-15fd-47dc-92ef-3e349bcc5d0b@sirena.org.uk>
References: <20230718084522.116952-1-maarten.lankhorst@linux.intel.com>
 <20230718084522.116952-7-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AMK9cj8txzvO4hFQ"
Content-Disposition: inline
In-Reply-To: <20230718084522.116952-7-maarten.lankhorst@linux.intel.com>
X-Cookie: Nothing happens.
Message-ID-Hash: I45WM5LQSFNNNOND5KT3VLMCATTRU57R
X-Message-ID-Hash: I45WM5LQSFNNNOND5KT3VLMCATTRU57R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I45WM5LQSFNNNOND5KT3VLMCATTRU57R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--AMK9cj8txzvO4hFQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 18, 2023 at 10:45:21AM +0200, Maarten Lankhorst wrote:
> This was only used to allow modprobing i915, by converting to the
> -EPROBE_DEFER mechanism, it can be completely removed, and is in
> fact counterproductive since -EPROBE_DEFER otherwise won't be
> handled correctly.

Acked-by: Mark Brown <broonie@kernel.org>

--AMK9cj8txzvO4hFQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmS2nfcACgkQJNaLcl1U
h9AF4Qf+K0+3rMDv85bxPfllcFehtwXonKlWt+F8HVh2UAi14oFjYoJj+ks/JRi1
MJrFfldIHimsPOtCs0OFQXuudLtXQUvWH1v3v4fbX0KazOJAmi8UHdXk8ZKigc0V
5aSf66WnV6nJCGYEldw+MHOv2oCOZQCzmFgsQfOQlbuWHdOP04lwG5CNCP3wlY03
4anEdlNnBcCRtOh45C0CGldwB57mxdZ47zoddgfpKGzHfC46knQZQ/+QiWtu+03G
w0VlVaJHbeBbDK5s0BClydgBj4fm8VyiikusXuH/yD2All8i0k9T3DLIuZp6mTRP
+KF6doVSqVZ6Zhhp5KKu4q+IzQysiw==
=ZsDS
-----END PGP SIGNATURE-----

--AMK9cj8txzvO4hFQ--
