Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 756F777B9A9
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 15:20:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 641E284C;
	Mon, 14 Aug 2023 15:19:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 641E284C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692019242;
	bh=QTndECYOg55ffK7u+UZgLqjvQshZIZdUZRl+Xg0M9/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QuyUmWITacWqlRBUUWaEHFzqngQxTr3UcMW6cgdGntMOZpEq60fClMUQ8Sc/vX03L
	 M+W6xeTQLPnJ5MRVjqrYdVUXMw/MJ5MWQxSE8AoX82SLjM+OnbHBW8KeKBIHUZ7Bav
	 frHVmAGMMLHUJPn4q5PNKwbi1dn7MspfRb1CFXvw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A7F6F80580; Mon, 14 Aug 2023 15:19:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C8396F80570;
	Mon, 14 Aug 2023 15:19:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B01DF80578; Mon, 14 Aug 2023 15:19:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0EC8DF80568
	for <alsa-devel@alsa-project.org>; Mon, 14 Aug 2023 15:19:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EC8DF80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=H7v0ZUAe
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 81377611BD;
	Mon, 14 Aug 2023 13:19:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18314C433C8;
	Mon, 14 Aug 2023 13:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692019170;
	bh=QTndECYOg55ffK7u+UZgLqjvQshZIZdUZRl+Xg0M9/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H7v0ZUAer9qx4bwV7BwpQXiK5HLcqG78YtyN2M05EUoHHVTw+PF0/u+JmhAgAIfRL
	 JjtEGSq8ahXUkIzeGQHDfOJf+ClEwpa7hWHSnyopEqcRAb1hHT7kRZKHIDunk5lruP
	 +FTKEyMEdfvwwbAeg4RZfHXtsLznRkWS7YtJ+0lRTVGMq4b//SO0mL8eMBn+CJ7KA6
	 9Rt7yLDbrzL17b34RuFyDBrclLs5zCauq3BFJjZU6cv9J57s03jvaoUbuU7Ndt4eRS
	 PX9ES+2T3TAzcj81+wMIwtjcqv+SzMGyTTNPtTj4gGUWBnXgGnITcQ+t6Ehfp0SUGo
	 Ikt2FTV/e+aEQ==
Date: Mon, 14 Aug 2023 14:19:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 24/25] ASoC: pcm: Drop obsoleted PCM copy_user ops
Message-ID: <e2026463-f5b6-473b-8d54-6f92a785ae90@sirena.org.uk>
References: <20230814115523.15279-1-tiwai@suse.de>
 <20230814115523.15279-25-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sh+QDjkuwhChmasm"
Content-Disposition: inline
In-Reply-To: <20230814115523.15279-25-tiwai@suse.de>
X-Cookie: FACILITY REJECTED 100044200000
Message-ID-Hash: 727NYSLAPAZBX763TAOWBCSRY4BRIQE2
X-Message-ID-Hash: 727NYSLAPAZBX763TAOWBCSRY4BRIQE2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/727NYSLAPAZBX763TAOWBCSRY4BRIQE2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--sh+QDjkuwhChmasm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 14, 2023 at 01:55:22PM +0200, Takashi Iwai wrote:
> Now all ASoC users have been replaced to use the new PCM copy ops,
> let's drop the obsoleted copy_user ops and its helper function.

Reviewed-by: Mark Brown <broonie@kernel.org>

--sh+QDjkuwhChmasm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTaKd4ACgkQJNaLcl1U
h9CiCwf/RrTLGykI41WM2odLHtQ2vTwEAFKNFZDrZziq6Om5TS+AifxSGAao83Ig
1nEwo5FoVDK7ea6UIpYbQKobhnMo9DExW2SdJU/h1uqMD3eWYOyDsBRcGTk6VI98
468QcTEYc/I3VLWyp8BksQXqjDHgFUizNJYs+wpfOR15ANeN5BjqNJPRFp8O6DBY
ZPVrkWl4LuBhynQbL2Z+b1mJ37Vygl9Um3rbEi42KAgYE1ID0PRr2N+1DxShWfzm
ap7HKIVBeJHc015MNPlI/EPkqquRX34g5g+FdI/98j92E3m9JUo7bBpovms5l7Ye
+sM0WnE2lwUHpwMJuzlKzrN7VNjLIA==
=upSp
-----END PGP SIGNATURE-----

--sh+QDjkuwhChmasm--
