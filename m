Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0261A17320
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2025 20:29:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CFCF6029E;
	Mon, 20 Jan 2025 20:29:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CFCF6029E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737401383;
	bh=q1reUqGeya/ixjryOK53cDkVNv12CZqxlsiJ1QlDzKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KxN3Vw87e4i7iGZ7ojPOCGdPG/JbPkpuDtO2gQlwAzIwhtVY8QPCw6/40yFHNXFWn
	 K5meB/0pSJhmXaDbSdXxqihdObfDK3q01lxNRKUc8hMJuknb2PreXkQXMfABT1jkRU
	 3soBTDrHluJcLtia2oA9/MPc7lvKNEarGg1n8xLI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3CAE3F805B3; Mon, 20 Jan 2025 20:29:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9548F805B6;
	Mon, 20 Jan 2025 20:29:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 70A04F80482; Mon, 20 Jan 2025 20:29:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 84645F800E4
	for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2025 20:28:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84645F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qWBWYv/d
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5E924A412D2;
	Mon, 20 Jan 2025 19:27:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 621D3C4CEDD;
	Mon, 20 Jan 2025 19:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737401333;
	bh=q1reUqGeya/ixjryOK53cDkVNv12CZqxlsiJ1QlDzKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qWBWYv/d/tO1S6+mBu5igDAHEFLYGIhX8a4QmtQSnluDsYfkPyMzfRLXmEqJDXRUE
	 J9nT63PJajotYPRG9blUkwaJuZZ0ZZyryzLnjNnys5WhdcjuLDszOTgm6xww1+/DyG
	 6puF52oKpWowt8ypvzHVX7Z1FK8KuIZaERpCz898afF/nLPqMOAx++iWs7QpoIiUhF
	 ghs9I5SbbAFOa+aD4fcR6w+wBrHjC1RmYG4uf0K9Qn//wb79bRmz3I0u3lUvgEzeux
	 sU4nk0sVLVbpIh8jSpuXISmMC2MEHyuyEbjPSCi8AiASwA+RCsMbM/ctjiIYaerS/X
	 tdIKfeVFaOKog==
Date: Mon, 20 Jan 2025 19:28:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>,
	alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, Basavaraj.Hiregoudar@amd.com,
	Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 12/23] ASoC: amd: acp70: add acp ip interrupt handler
Message-ID: <365c47d1-6b19-452a-b4f7-ca8a64e2754f@sirena.org.uk>
References: <20250120100130.3710412-1-Vijendar.Mukunda@amd.com>
 <20250120100130.3710412-13-Vijendar.Mukunda@amd.com>
 <4d6cf5b7-8f47-4cb8-b302-c02f3b037d6d@sirena.org.uk>
 <08942c1b-3933-4ddd-b730-44d436a81e94@amd.com>
 <208098f6-1022-437e-9ae2-964e9bc89942@sirena.org.uk>
 <1e10c851-f4fc-4e76-806d-5f1214f29bdf@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iFDstItUjAZwmnYe"
Content-Disposition: inline
In-Reply-To: <1e10c851-f4fc-4e76-806d-5f1214f29bdf@amd.com>
X-Cookie: No lifeguard on duty.
Message-ID-Hash: UG4SK4XPUKKOT6P6WD5KUPAVTDKCH36J
X-Message-ID-Hash: UG4SK4XPUKKOT6P6WD5KUPAVTDKCH36J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UG4SK4XPUKKOT6P6WD5KUPAVTDKCH36J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--iFDstItUjAZwmnYe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 20, 2025 at 12:47:18PM -0600, Mario Limonciello wrote:
> On 1/20/2025 12:39, Mark Brown wrote:

> > That does feel like quirks and new features rather than a completely
> > distinct IP.

> I see it as different forms of tech debt.  Either you keep track of which
> features the 62 vs 70 hardware supports by different drivers or add logic in
> all the relevant functions().

> The former increases LoC but reduces risk for mistake (IE avoid oops, I
> forgot this is only supported on 70+ when adding new features).

Until someone fixes a bug or does some subsystem wide cleanup which
affects both copies of the code (perhaps that already happened since the
code was copied!).  There's a reason why this is the general kernel
style.

> Changing code that affects a lot of hardware means a lot more testing too.
> Perhaps after Vijendar's series lands he can split up some of the purely
> duplicated functions into helpers or callbacks and arrange all that testing?

Well, it was getting a new spin anyway for the bits that didn't have the
serial numbers filed off.

--iFDstItUjAZwmnYe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeOo+8ACgkQJNaLcl1U
h9CzTwf+NdqnwJmZFgeksO0umzIOqdzCEmUoTUMGGktQSl6URefs+EyDd+UVxIWr
hr52nlIM/faT/+yUZUZNEjs4NPacWDlDiKItd/O6eaw9p3Rt2ICQEyeCe3QBrwwH
ROaOeo3TUOCCzB6Cij6OiBJ2RwZXq0Y8wvB26fi9jU48KjvskBDyadMGGjGkI+LJ
u3Josb5ELASobKaSq2yzrETIw6ivxWDY+mqCBhrRSljjwde+G070Nx4Hve/qAAMV
XO9OxwOU4PmpMXFDcq2GMCn1TkxvB2Wg933V8MaYXTfOf8d8mTaUqfXKqc5E1ZCl
IcuMoP2i2lkM/2QeSGrX6hn1mBH9HA==
=pfPd
-----END PGP SIGNATURE-----

--iFDstItUjAZwmnYe--
