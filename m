Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 015FA7DE133
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Nov 2023 14:02:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 226133E8;
	Wed,  1 Nov 2023 14:01:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 226133E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698843744;
	bh=jOJrnibNAQUZXZHXMbVVKFtJOsR7g1+2bE1i88mTnxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XDGH+idwI9GznC7ut6IyVvW1IoOQ6mvv/LdqMCe9dIHL8dVk5vHMAm7UFW6MgQZLu
	 SSDWK5Rbktt76HwGJS8v2TqghniKCuCrop/Ix+rMnUGTKHfgCZTIXHEszwvSCgniSt
	 +UiNhrsT4aKYonjAZbtfjbAadEp4/7ZsOQNPnhBc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E7D5DF80290; Wed,  1 Nov 2023 14:01:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6298AF8016D;
	Wed,  1 Nov 2023 14:01:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03ED5F8020D; Wed,  1 Nov 2023 14:01:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9BDDBF80152
	for <alsa-devel@alsa-project.org>; Wed,  1 Nov 2023 14:01:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BDDBF80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GBW5hDqX
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 205DDB81863;
	Wed,  1 Nov 2023 13:01:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2AFBC433C9;
	Wed,  1 Nov 2023 13:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698843672;
	bh=jOJrnibNAQUZXZHXMbVVKFtJOsR7g1+2bE1i88mTnxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GBW5hDqXZsPlfQNwuRvNGKqi7eCSmEhgmNUCFveogPsyp5S9Pm2q6TRLh2pCrVH4M
	 LFh5l43OCkgERIuTyhnYoRpyD8i2NXuOep/WhB39Z3biSTl9LfYkAzrhLpHbJLnitK
	 GI+mDkvCpCA8UbgkqkaE5qF1AKOP16KAZor9GEelU4R7OU/UodiPBjxo636k1L0F0u
	 KEqInu1ZwfyxOISNu+K/qhR5mT3hQoj7KU0Zgta8CQuVna/Qtno0WXH5tUKQfqAZqc
	 s86sKVAqSyQpgT3GpxN3el/Ar2fhmIHuvamRSkFmVlj9q6xn4vWzD1Htj6kHDhbidP
	 /yu8zk/xkIBkw==
Date: Wed, 1 Nov 2023 13:01:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Jack Yu <jack.yu@realtek.com>
Cc: "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"lars@metafoo.de" <lars@metafoo.de>,
	"Flove(HsinFu)" <flove@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>,
	Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>
Subject: Re: [PATCH] ASoC: rt5682s: Add LDO control for dacref
Message-ID: <c498a822-cde9-4803-bae5-309b858b2c87@sirena.org.uk>
References: <496805f7ca084e9dbcf7140cbe83ed4b@realtek.com>
 <ad79bd27-5c1f-48b9-b0b5-bb5c48cbd56c@sirena.org.uk>
 <28cf2cfcd7b047519811e201da2c2f9f@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MYwzaN2QzQwdqAqe"
Content-Disposition: inline
In-Reply-To: <28cf2cfcd7b047519811e201da2c2f9f@realtek.com>
X-Cookie: P-K4
Message-ID-Hash: B3NG64KVM7IAKIHWKWQRQPITN7Q5TBJQ
X-Message-ID-Hash: B3NG64KVM7IAKIHWKWQRQPITN7Q5TBJQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B3NG64KVM7IAKIHWKWQRQPITN7Q5TBJQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--MYwzaN2QzQwdqAqe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 01, 2023 at 02:52:20AM +0000, Jack Yu wrote:

> > > +/* LDO output select */
> > > +static const char * const rt5682s_ldo_output_select[] =3D {
> > > +	"1.607V", "1.5V", "1.406V", "1.731V"
> > > +};

> > This feels like something that might be a better fit for firmware based
> > selection - how would someone set a value for this, and why might it va=
ry at
> > runtime?  I'm a bit unclear as to what the control does so this might b=
e the
> > best thing but perhaps not.

> This control is added for specific customers, it won't be changed during =
runtime,=20
> but will be set in the initialization regarding to different customers,=
=20
> they'll set it in their own ucm and have already been verified by custome=
rs.

That sounds like it should come from the firmware then if it's supposed
to be fixed for a given system (which is what the above sounds like).

--MYwzaN2QzQwdqAqe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVCTBIACgkQJNaLcl1U
h9Ddnwf/azAx33aw64LZvFYnKp9keHStBHo9cubnf9sJkU0yfaH5gI8Y9TkHNp0X
Yq/ldLFhvo1ILru1x18BaiOTBimdY6rdrIKftjXBvsdx2C3c+hSsO9qDrXbavhNr
JnWABDSwOZVuXbFGloKhQ6pg1HYft21xXfSoUnFmBIVJWvWnDLtX7sQYZKsL3JWf
kUnln2JMVbXLLHfzaSPlCEX/v3YhHA4bq1DMH1Pg6+MG6/E6y2mjFCS4iNKxTZa1
71AoeDlRiPTHP7W44uopA9ffgeoLKUKtmYdOCS9KFmxnwfRguAqI6CkneAwPtfMC
Yalw/q4depV8npJC6uvB3r8Wrv7GBw==
=XvJF
-----END PGP SIGNATURE-----

--MYwzaN2QzQwdqAqe--
