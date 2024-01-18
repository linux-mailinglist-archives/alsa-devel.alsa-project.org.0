Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F8A831B65
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jan 2024 15:34:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3C29950;
	Thu, 18 Jan 2024 15:34:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3C29950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705588457;
	bh=MIG8l6nmrNn7lYT/nKSCX4PbrTY8Ix+7cWQ/iiL/nU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CpV28TJ1qHwqvAibAWxSDo7ALI3secEfU6SLIF3qW+HQO/Nn/y/iL1OxmDLPdpLsI
	 IjexedfAXw25mvxv3vVYRTjRjoprfgsNJ2UNvJlRJKk38vni8xn+18A33xDNxn7ZCK
	 QmHBwsXtxdOlHaZtJBrbp6hBI0G5vOop7pQHzudg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6786F8057E; Thu, 18 Jan 2024 15:33:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 138B9F80548;
	Thu, 18 Jan 2024 15:33:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46782F801F5; Thu, 18 Jan 2024 15:33:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3DDCCF8014B
	for <alsa-devel@alsa-project.org>; Thu, 18 Jan 2024 15:33:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DDCCF8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cujLm8GW
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 698D360CF9;
	Thu, 18 Jan 2024 14:33:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A19C9C433F1;
	Thu, 18 Jan 2024 14:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705588402;
	bh=MIG8l6nmrNn7lYT/nKSCX4PbrTY8Ix+7cWQ/iiL/nU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cujLm8GWbnwUERBichoaOhYy4uRQRiB+9nhVdhurReCoGZJoS9Tpb1xCtT+3wa5m1
	 KkdcnclSZIblhf5MQLw6P8/WrAaABl+dWOsOvmQ/mv3xJ93rnf/04ezaZUWp7q5+IU
	 Z7BCCR4ZQCcvHUU10hziB8EoAJzuybTB2wkTpeYzQlCnoWaP8D2PZRculsNj+RYnL5
	 I7sqy0Mu4QJNvYTLP5SM9ErkdFfC1m8u3Q6vFjy65vWxJPQs8zZBP2e5BHxuonYM3y
	 qAevdOC4D+ZQW5ElqqLbM/MBokY3bxpC3igoW+yr9bFqkKOu+SUtBZQrzfh09+l+Kh
	 WA1xmtd9PSrow==
Date: Thu, 18 Jan 2024 14:33:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sasha Levin <sashal@kernel.org>, kernelci-results@groups.io,
	bot@kernelci.org, stable@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: Re: kernelci/kernelci.org bisection:
 baseline-nfs.bootrr.deferred-probe-empty on at91sam9g20ek
Message-ID: <3c7cf19d-cd94-4d94-b4f5-1e0946fd0963@sirena.org.uk>
References: <65a6ca18.170a0220.9f7f3.fa9a@mx.google.com>
 <845b3053-d47b-4717-9665-79b120da133b@sirena.org.uk>
 <2024011716-undocked-external-9eae@gregkh>
 <82cda3d4-2e46-4690-8317-855ca80fd013@sirena.org.uk>
 <2024011816-overstate-move-4df8@gregkh>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w+U4ZqyVzO4Jtn1S"
Content-Disposition: inline
In-Reply-To: <2024011816-overstate-move-4df8@gregkh>
X-Cookie: FEELINGS are cascading over me!!!
Message-ID-Hash: D5HDCWK23QVSADQ46RYQHDH6WIZIXNBW
X-Message-ID-Hash: D5HDCWK23QVSADQ46RYQHDH6WIZIXNBW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D5HDCWK23QVSADQ46RYQHDH6WIZIXNBW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--w+U4ZqyVzO4Jtn1S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 18, 2024 at 11:16:29AM +0100, Greg Kroah-Hartman wrote:
> On Wed, Jan 17, 2024 at 01:52:59PM +0000, Mark Brown wrote:

> > > I'll be glad to revert, but should I also revert for 4.19.y and 5.4.y
> > > and 5.10.y?

> > I'd be tempted to, though it's possible it's some other related issue so
> > it might be safest to hold off until there's an explicit report.  Up to
> > you.

> I'll just drop it from 5.15.y for now, thanks!

Thanks.  I've actually just seen that it's also failing on v4.19, and
went looking and found that v5.4 and v5.10 look like they never passed
which means it didn't trigger as a report there.

--w+U4ZqyVzO4Jtn1S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmWpNqwACgkQJNaLcl1U
h9DOKQf/f+nuMbCRYaskeplgeWy/jNCrVYUGOBw9hMpfQC/+SfhKzCuKzjgBcs1f
PwWPq8pQngN344lTqTNdskB8D2Ox0emqMQyEhE3TLNeJZaC6BfDXc6k2iTwdEvPK
phDwjXYmkC0rnTqvyyEOQFIb9UHK5Yi+BgEVJQBG24NqWl6BB5dVh8gUfJ6AyTMg
UC7JufAxOjHRi+iETXHk1UEivchkrIsR5bDscX21C++GmgTfWE/gxXCoh6999nYv
249k4lp+RbkwnnrnKZFJxZ3pP8TlOMN8URBJfG+p00l9o2QPECzO94Bsdps/OqtY
QunETQ8tTX85kI5noAkdmjR3a+Or1g==
=5Ls8
-----END PGP SIGNATURE-----

--w+U4ZqyVzO4Jtn1S--
