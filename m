Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD8C9743F0
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Sep 2024 22:15:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67C68822;
	Tue, 10 Sep 2024 22:15:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67C68822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725999340;
	bh=q0BHlKkxefI/en01yPsEML05pTpWpy2MQe65XKp3SII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T3prUQAFYE2aN/kupLIzlD4C1j9ISXUsyet3iVTBsVunhqvZKQXDioHiro9XHP5So
	 aUOFWXHD8zNL1GJD1Typ+an/G8Zv6SAri+RjsY0zy5WtTgH8h64QcftLTy26pWfYAv
	 iPQgg8IDaUEsgjnn2u6pMq1ffWjHFa3qxj9CvYf8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04C45F805A9; Tue, 10 Sep 2024 22:15:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D5BAF805AF;
	Tue, 10 Sep 2024 22:15:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C072F801F5; Tue, 10 Sep 2024 22:15:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 36FDDF8010B
	for <alsa-devel@alsa-project.org>; Tue, 10 Sep 2024 22:14:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36FDDF8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Df2OMi8B
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 466705C05EA;
	Tue, 10 Sep 2024 20:14:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF15C4CED0;
	Tue, 10 Sep 2024 20:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725999296;
	bh=q0BHlKkxefI/en01yPsEML05pTpWpy2MQe65XKp3SII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Df2OMi8BFOPvx77fkOCl906XuTTjMThbuaMTfrhuMl9j3qdSkg5+GHk8TgR7qHI3m
	 ucA/TWl9jnbvc4Qkuc/nz7/UVIwSX4OLqeUfmblR+X6N94bobqu5wdEbVZ77ifkhwF
	 wVLrzSCXXX/vIDssVEIy9N3jUb7uc7iajJOGzMOZpqQKl+CD3EprAKUYLbPLoDP48Q
	 bypQZ7kCwF+t9VkXaAruOSrnY604kS8lZxqqrrIPzjeXMocDQahojLPCRM3DuT6tM9
	 uthA8WL5lATZXAgx7sVeYohfVze7ykM5F1D3gS7Wu4shcmGcGxWMp3oI/XMTQjZFzN
	 xHczZIzSnA8NA==
Date: Tue, 10 Sep 2024 21:14:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	tiwai@suse.com, perex@perex.cz, amadeuszx.slawinski@linux.intel.com,
	hdegoede@redhat.com,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH] [RFC] ASoC: Conditional PCM support
Message-ID: <2ac45376-5df6-44e9-83d6-cdea49eea916@sirena.org.uk>
References: <20240821101816.1494541-1-cezary.rojewski@intel.com>
 <83f81553-6dfa-46a3-9ca2-d42f54295eb1@linux.intel.com>
 <d5db8a15-64c9-45be-8f8c-977fd5ed282b@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eJdWpfEZhmbyELWN"
Content-Disposition: inline
In-Reply-To: <d5db8a15-64c9-45be-8f8c-977fd5ed282b@intel.com>
X-Cookie: You're not Dave.  Who are you?
Message-ID-Hash: ZMO3MOKUWRRDY4DYB2A2S6S6NWE7A52L
X-Message-ID-Hash: ZMO3MOKUWRRDY4DYB2A2S6S6NWE7A52L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZMO3MOKUWRRDY4DYB2A2S6S6NWE7A52L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--eJdWpfEZhmbyELWN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 22, 2024 at 03:57:22PM +0200, Cezary Rojewski wrote:

> You've shared many scenarios, I do not think we can cover all of them here
> and while I could agree that current FE/BE (DPCM?) design did not age well,
> we're entering "rewrite how-to-pcm-in-linux" area.
> If general opinion is:
> 	it's too much, we have to rewrite for the framework to scale
> 	into the next 20 years of audio in Linux

> then my thoughts regarding current review are:
> 	if the avs-driver needs sideband interface, so be it, but do it
> 	locally rather than polluting entire framework. Switch to the
> 	framework-solution once its rewritten.

On this bit as I mentioned in the prior reply there's been ideas for
redesigning how we tackle digital audio which I think there's general
agreement would be the best way forwards.  DPCM is very fragile and
creaking at the seams, it can't really represent scenarios like the
sideband case you've mentioned well.  OTOH a redesign is a very big lift
and there's never really a point where it seems constructive to actually
block things on it so long as everyone involved is OK with what's going
on.

The upshot is that while I'd be *really* happy to see investment in the
framework side of things I probably wouldn't block a driver specific or
DPCM solution simply on the grounds that it's messy.  DPCM would need
buy in from other people using DPCM of course, and hopefully at some
point someone with one of these issues will find that the cost of
maintaining a bodge is going to be enough to push them to do the work
(or someone will have free time to just work on the issue).

--eJdWpfEZhmbyELWN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbgqLsACgkQJNaLcl1U
h9DTPAf/QERDaVkcoi0cdYzbXQ/wunDDdLU/10RHb54n3ESqidIT7WqJibSwCQap
2Sm1AMpmyXBxVEFWYBSu7dnE3Os0t8bkZ8HpHpyy4qdrFc9cfcdseg16fRJ6BPTU
el++ORYkEVIz/mHQTeLNPiUd5oCslAK3sWHj3aJfx4/plTJVDhIWyl82AfCJVenz
nCdizZbvmjTR8/cpB5Ji0Q6nKHHiUXpM6CfZe7nMGMOhS9qrZpwK/HO2iJiHWNsR
q9Xmmcz6pvh0m09lVzxU/GAFoUbgH6cs/ThhuuOooAg3TedxF+WrA+2YGOwUPezn
+zWLy+clmgu7Hm2Ov1kz27qbwCLfLA==
=lcez
-----END PGP SIGNATURE-----

--eJdWpfEZhmbyELWN--
