Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B937B012F
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Sep 2023 12:01:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDEE582A;
	Wed, 27 Sep 2023 12:00:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDEE582A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695808862;
	bh=RUppI/q0xfwba/lP191K+gantdfVkA9gA7y81Dm/SuI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CYBG102YvOSRpiCUgguByKVCjWkQ4AXpHzMvcJ6T+zL0ZEg9n9AOWN6P5g8zmzXN9
	 lgd5lTm7xac+q9IToZHh1PpLVM3dMrjW37/E24r3dHd2m3rztpHB7h84g1tlR0tGDI
	 0jq7QgqU3Pq+ogXC7yE0fgm89fl95/HwBXS2h1sQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B15EF80130; Wed, 27 Sep 2023 11:59:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E7A74F80166;
	Wed, 27 Sep 2023 11:59:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52FE5F8016A; Wed, 27 Sep 2023 11:59:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0253CF800AA
	for <alsa-devel@alsa-project.org>; Wed, 27 Sep 2023 11:59:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0253CF800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=g2K2mtAI
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 46C4C616F2;
	Wed, 27 Sep 2023 09:59:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A611C433C8;
	Wed, 27 Sep 2023 09:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695808773;
	bh=RUppI/q0xfwba/lP191K+gantdfVkA9gA7y81Dm/SuI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g2K2mtAIP7TYZS/yWD0wou+N4oeF1NVEgJUM0Q0Yv8xBypafLM/C7MJBo272AxFcn
	 oVkeNn+UatZIGSygr8FuaQF0hCdLH+q4iYxwyLPY8We/sFR+QaqO/K/330BRQ8YcFe
	 5usW4rivyCmCOtxuHpbjG4nYi8hWK++8JyR+Pb71ag9vZUXs/+GF9gVBjd48hCpRMd
	 WsiWREWelBvOefp29sZ4Xz17m41vyvsArgVVwiu86gzGoP7S4DMZhtModATcyg3n8u
	 uTlMJ2cOcn9XsebmVqV21ZIHaAIEP6LnK1I0QIdQ+NmW07ykO4uJOkXsbmHThU2k4w
	 AAYQbvX++2dGQ==
Date: Wed, 27 Sep 2023 11:59:31 +0200
From: Mark Brown <broonie@kernel.org>
To: ChiYuan Huang <cy_huang@richtek.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Allen Lin <allen_lin@richtek.com>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: codecs: rtq9128: Add TDM data source selection
Message-ID: <ZRP9Aw904ynL5Se/@finisterre.sirena.org.uk>
References: <1695780376-32301-1-git-send-email-cy_huang@richtek.com>
 <ZRPyMolOIjLBWXPC@finisterre.sirena.org.uk>
 <20230927094637.GA25905@linuxcarl2.richtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1C4mWfMNaZDyDOFk"
Content-Disposition: inline
In-Reply-To: <20230927094637.GA25905@linuxcarl2.richtek.com>
X-Cookie: Save energy:  Drive a smaller shell.
Message-ID-Hash: 5FGWPE34I22MZZO5BXNFPMFHFZCMFG5Q
X-Message-ID-Hash: 5FGWPE34I22MZZO5BXNFPMFHFZCMFG5Q
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5FGWPE34I22MZZO5BXNFPMFHFZCMFG5Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--1C4mWfMNaZDyDOFk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 27, 2023 at 05:46:37PM +0800, ChiYuan Huang wrote:
> On Wed, Sep 27, 2023 at 11:13:22AM +0200, Mark Brown wrote:

> > Is this something that's going to be changing dynamically at runtime or
> > should this be a device property that's set either by firmware or when
> > we're doing the TDM setup?  This sounds like something I'd expect to be
> > fixed by the board design.

> I may think one case if ASoC platform support multiple data source outputs
> that share the same bck/lcrk on different data pin. If it can be dynamically
> adjusted for the scenarios, this will keep the flexibility for the differet
> platform design.

Sure, but is that actually a practical design - or if someone is doing
this shouldn't it be joined up with the TDM configuration since with
just the control it'd only be possible to switch the pins but not change
the TDM layout?  I'm not sure that this control works as a standalone
thing.

--1C4mWfMNaZDyDOFk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUT/P8ACgkQJNaLcl1U
h9A3nAf9H92yVuO7k/UTjTIXfx3suPYVPOICJ5sKklHL8Vd2+uL3ks7E9EbmnCzR
Me3Esxfs9EdVnBVgIpoOBUOmtrZTzrlm9Y7DG6q0y4gV/6ShctHIqKgXhGlPftUY
7iUgF1GPTeHjpqg+PmlWh/C7zqtjrcauyxzrGclpBbilg/1CKRwaSyJNwblLXLDZ
c4kBua84DXvkBEUYRyr+S1HNzwo1bd2R3FF9Q39kgunTl+PAcEVs8AqzsnZx7Tgg
EABemg1WEyrRVjvVyfyZP7BmdjGcFzCllD96yJsIQf0W25a9ne3PxVftFbsiATVH
hic094EtySRJ8jr+PI+QWbqRCwYPYw==
=uBaT
-----END PGP SIGNATURE-----

--1C4mWfMNaZDyDOFk--
