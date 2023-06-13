Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A31F72E4C1
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 16:00:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 184ACE11;
	Tue, 13 Jun 2023 15:59:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 184ACE11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686664819;
	bh=4EDAi+iNifcXm00vXweGwQS6q1c/UCdkOHc/yN7EsPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HdUx1rgRpLWIDX16ZXT46gpggqE3DiLaHKY13eDcVyORqE6DmUbaUFAL1Lx8Q0pww
	 F8qjskxS5Me9DkJgIbdikBxbv+oGUlSL/yLE8Wf7NVXRrmybne9dlzbIyS/Kr28MCd
	 +i8bDodFNGAAMtblTCcjEBBvkJQvwlPficuAEcdo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 416DCF80132; Tue, 13 Jun 2023 15:59:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F10E6F80132;
	Tue, 13 Jun 2023 15:59:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3877BF80149; Tue, 13 Jun 2023 15:59:24 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 9FB81F800ED
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 15:59:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FB81F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PPbQKXKM
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2F92862B54;
	Tue, 13 Jun 2023 13:59:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 606C9C433F0;
	Tue, 13 Jun 2023 13:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686664759;
	bh=4EDAi+iNifcXm00vXweGwQS6q1c/UCdkOHc/yN7EsPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PPbQKXKMMZEGmyVEFwUUcOeCTRP9VE6GiHY5NXiTtURTdnFF5mXKClM9mAIwyuFl+
	 LRgfEtlVEnXFjLDXT7C9pBk0694VBUMQK4ZpPoG0nmnHHoLdo9kkWF0F831kDeHaVB
	 7Vxi7T166lpbMfe0J/DwAIs8B0YlmbsPxBf93mAKPQjTQy3CuPefHDxleWtciYPraw
	 HPDVtA1SUNoAsat7ynos+dPej4YlktqYhpWd/t5RkHi6LCkYJaQQ2o3b6ljOhr3haj
	 NHihxU9sr9TSHwVZ+85dHWgzdLO3I+IsqSL2egYJ3wDyKkYd+HhCbx+sfKXaTABFNZ
	 MxkwkdEzyyJog==
Date: Tue, 13 Jun 2023 14:59:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: Use maple tree register cache
Message-ID: <e48bbd3b-544d-43d5-82a1-8fbbcb8cd1a4@sirena.org.uk>
References: <20230609-alsa-hda-maple-v1-1-a2b725c8b8f5@kernel.org>
 <87v8fua1qm.wl-tiwai@suse.de>
 <877cs7g6f1.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CeKFcVfVTiPPdzSt"
Content-Disposition: inline
In-Reply-To: <877cs7g6f1.wl-tiwai@suse.de>
X-Cookie: Not a flying toy.
Message-ID-Hash: FH76JVY4BVY5N5677OJ6RRQ5VSPR4EI6
X-Message-ID-Hash: FH76JVY4BVY5N5677OJ6RRQ5VSPR4EI6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FH76JVY4BVY5N5677OJ6RRQ5VSPR4EI6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--CeKFcVfVTiPPdzSt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 13, 2023 at 09:36:34AM +0200, Takashi Iwai wrote:

> This is an error from regache_sync_val(), and it indicates that the
> synced register is write-only; regcache_maple_sync() tries to sync all
> cached values no matter whether it's writable or not, then hitting
> this.

BTW I was just looking at reg_raw_update_once() and I can't figure out
why it's trying to do what it's doing - it does a read to check if it's
seen the register before and then does an _update_bits() if the register
hasn't been cached yet, apparently trying suppress duplicate writes but
possibly deliberately discarding changes to multiple bitfields in the
same register.  That's not what the non-regmap path does, it'll only
discard noop changes to the same bitfield.

--CeKFcVfVTiPPdzSt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSIdjIACgkQJNaLcl1U
h9DUfAf9Gi+yGhHKCsHvttrQZ//1ZwjDJeG+HCM/i+HwUbKA6zLXDB+T6nsWBNPg
7uBcB9XWXq3LoLYZEqJ9nyfEpR4vH6bM5bDD1K8uO1QgNB5ho+4tkQa321XG3HUo
xz9mjYz1VZWuQWiLc/7z7KghBD6bLaCMapWuIWMt8aQD/tF/CTAG1zFovqLyk+Yo
HFx0blkO4LfCkSbVPr6xoPtOkuO8Wo0t2wWTBjrKj8X8npJS2cVCrTiteyFSbzwT
JgPyJoG1ChihxyxX0jnYhC7aGf1rcZ4xrbpK0cFlkTjtw3MSq+Dj/wayhY+pJJAp
sXbQbPgJpxc3+0yNvCXN5hPe4f1t8A==
=7/9p
-----END PGP SIGNATURE-----

--CeKFcVfVTiPPdzSt--
