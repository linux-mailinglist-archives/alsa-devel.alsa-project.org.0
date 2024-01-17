Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D519283075B
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jan 2024 14:53:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D6FF825;
	Wed, 17 Jan 2024 14:53:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D6FF825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705499633;
	bh=Koi7qdvNTEeBok9fRfClk9AINVkO/1D9kKzXxJHJbqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mJqqDI9dS+lfo6Yp1JKFmyPCWoBp/ZScde6WqtaKs7nuadzliNQko1xpAANhEdtnr
	 PT4Es3TBr9Lnie/BpguUadhQYbdku5NoegqkgBot57Rvj6pZES5l5qR2eCddlUfX8k
	 2zU36UyRhe10MCvrs5wj57opPvNC39Hb8JaLvnR4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D407F80588; Wed, 17 Jan 2024 14:53:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5561FF8057E;
	Wed, 17 Jan 2024 14:53:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4A14F801F5; Wed, 17 Jan 2024 14:53:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0FB8AF8003A
	for <alsa-devel@alsa-project.org>; Wed, 17 Jan 2024 14:53:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FB8AF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=oe+N5bnf
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 431F96160E;
	Wed, 17 Jan 2024 13:53:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79359C433F1;
	Wed, 17 Jan 2024 13:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705499583;
	bh=Koi7qdvNTEeBok9fRfClk9AINVkO/1D9kKzXxJHJbqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oe+N5bnfJl1ZV+xcdWqRZtijakd1Nvu8bC94wXLF4ui2dG6vY/KuXW67Ej5nzg2Cp
	 DideslDFB2ADMiP43X/SSlnV6ofGgyo+HWf0oaYpjvttpECX41AT9JpG/lcB9o9uYS
	 8XS+1nL5mWwJYJo0TZMKdR14oodszSQf6HMEKCueK/JXOnL9uvW2mBf2kYGO46MwXy
	 bPifnhPWYySvF0D4sJ2INzYP113/5mNu/UyPRxe3NqAWmBTC1dC2aEbYbqWZ0AX8Is
	 Q7WHd3rL8PZKQOYrg5IlSOf/4gLaNkAmhkYdZIn0vzGnNAR1YvTp82bnfR02YST7xF
	 RKJrJthSOFz5g==
Date: Wed, 17 Jan 2024 13:52:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sasha Levin <sashal@kernel.org>, kernelci-results@groups.io,
	bot@kernelci.org, stable@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: kernelci/kernelci.org bisection:
 baseline-nfs.bootrr.deferred-probe-empty on at91sam9g20ek
Message-ID: <82cda3d4-2e46-4690-8317-855ca80fd013@sirena.org.uk>
References: <65a6ca18.170a0220.9f7f3.fa9a@mx.google.com>
 <845b3053-d47b-4717-9665-79b120da133b@sirena.org.uk>
 <2024011716-undocked-external-9eae@gregkh>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TOyMNm2/BhIVCEYy"
Content-Disposition: inline
In-Reply-To: <2024011716-undocked-external-9eae@gregkh>
X-Cookie: Nostalgia isn't what it used to be.
Message-ID-Hash: ZENJLNM7XED46ZMSMGQBJJWU4AR6PG6S
X-Message-ID-Hash: ZENJLNM7XED46ZMSMGQBJJWU4AR6PG6S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZENJLNM7XED46ZMSMGQBJJWU4AR6PG6S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--TOyMNm2/BhIVCEYy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 17, 2024 at 06:55:09AM +0100, Greg Kroah-Hartman wrote:

> This is also in the following kernel releases:
> 	4.19.240 5.4.191 5.10.113
> do they also have issues?  Does 6.1 and newer work properly?

Current kernels work well, I've not had reports generated for the older
kernels but it's possible they may be forthcoming (the bisection does
tend to send issues slowly sometimes).

> And wow, this is old, nice to see it reported, but for a commit that
> landed in April, 2022?  Does that mean that no one uses this hardware?

I suspect it's just me, it's in my test lab.  I don't routinely test
stable (just let KernelCI use it to test stable).

> I'll be glad to revert, but should I also revert for 4.19.y and 5.4.y
> and 5.10.y?

I'd be tempted to, though it's possible it's some other related issue so
it might be safest to hold off until there's an explicit report.  Up to
you.

--TOyMNm2/BhIVCEYy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWn27oACgkQJNaLcl1U
h9CLCwf8CecA6aqF72V9ysuKxFHLzuv/+WVpaUhxn+whbKZKelsK4LKzPByQ/gp6
u58u4O6ALnCZkrz4LF9pnLlT4b+2mEg3/O88eN7a6N4jJ+yJrACzSpUN7Wd8/vNE
92npkRPG+vjcfuj4MxgW46m1eqFVP7zHSUQhZIc+hfp7mGPteCAdgBOE4yHI2+5r
mZHFRgG48w6eJg0xd1ZhMI5vlCQKRPHrRriRL4gOq417FZGC/Hj+fYiY7tbi65wY
gPAL4slf1RAHMb3daaTmvZn8gRMZy6MBz9ndYQkFzFQ1Ct60UtkVhQg/ZJMHOZ8g
JzcKVMmgAW3+pClvFqEyYatqlTSTyQ==
=cMiE
-----END PGP SIGNATURE-----

--TOyMNm2/BhIVCEYy--
