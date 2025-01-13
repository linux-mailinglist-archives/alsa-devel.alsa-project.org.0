Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EA7A0BE3B
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Jan 2025 18:02:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB6B660245;
	Mon, 13 Jan 2025 18:01:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB6B660245
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1736787726;
	bh=mKO8ZkqwA993+zY7OVqJcQPcLxIaL79uE9EIuYuHtNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=eChlTRBHmfA7dyu5JKvWtxYHHPn3WwDxUZvNPNubZzpxrmWFevQ4cyX3Bx2wBP+BM
	 R8TUwtydhmbSi5/gF0O3o+rM2sfXwRGkjp9CCNQ0l6e2Shg8LpaIS4Blb/TS+50Xia
	 8fN4JPWL49EcIeoasLME7QP+iVcSzuStJlHNZG6Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A87DFF805BD; Mon, 13 Jan 2025 18:01:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10AE5F805BB;
	Mon, 13 Jan 2025 18:01:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6D67F80169; Mon, 13 Jan 2025 18:01:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 11C4FF80169
	for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2025 18:01:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11C4FF80169
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aHFUhnR6
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C79525C0681;
	Mon, 13 Jan 2025 17:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F236C4CED6;
	Mon, 13 Jan 2025 17:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736787674;
	bh=mKO8ZkqwA993+zY7OVqJcQPcLxIaL79uE9EIuYuHtNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aHFUhnR6ve6Hx4q7Nt0XtkH/HZ6IJJF7IXr4v0Ij6zMxecaOGKGFUWUsu4m+/CRLx
	 TFvDWwATTy5KHYoB52YkEZq+THM8+rDkgOC0/QQGIgXlkeNob23AhwlWu9gBKd6Unb
	 Ua4QX52XyP53beS2IqJFEOCCV9J334T56n7mcX9rYWOqb7v34EOrhOAVLXrFxwSore
	 7ixuCnN7vyhzg7QHrVF0tbiQ99zN+zVGJ7+MzqEDJwK6EE1JhpqjRyxsb11F/oG+0F
	 paLFUiZKLaS4v2ffsqcVmgB3CiH+z5orhfIQvitegRwDrMs4Kj7NLwgYmqcwRr+ihM
	 vLoINDJnvbsvw==
Date: Mon, 13 Jan 2025 17:01:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, tony@atomide.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	Pavel Machek <pavel@ucw.cz>, Merlijn Wajer <merlijn@wizzup.org>
Subject: Re: [RFC PATCH] soc: audio-graph-card2: use correct endpoint when
 getting link parameters
Message-ID: <dd64e1f4-1f58-4760-a664-04fa6723e531@sirena.org.uk>
References: <20241220071126.1066691-1-ivo.g.dimitrov.75@gmail.com>
 <db8321e3-e9c8-4f1e-8ebd-78d286320d55@gmail.com>
 <f4a65ffc-7f0d-4d45-83b9-2377cb00f3b1@sirena.org.uk>
 <9cc6c2ad-0811-482d-91c8-d162bd7f09f4@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TCIK1V0bgT6BtOom"
Content-Disposition: inline
In-Reply-To: <9cc6c2ad-0811-482d-91c8-d162bd7f09f4@gmail.com>
X-Cookie: You will outgrow your usefulness.
Message-ID-Hash: 2WQCHQX44FLIMYT2FCMM6YF6EPATS2DB
X-Message-ID-Hash: 2WQCHQX44FLIMYT2FCMM6YF6EPATS2DB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2WQCHQX44FLIMYT2FCMM6YF6EPATS2DB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--TCIK1V0bgT6BtOom
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 13, 2025 at 06:24:18PM +0200, Ivaylo Dimitrov wrote:

> I understand people are busy, but I also see community sent patches being
> treated with low priority, or being silently ignored too often lately, but
> lets not go into that.

> I sent that RFC patch on 20.12.2024, today is 13.10.2025 - if this is not a
> reasonable time, well, what is? By the same time I sent 2 other patches and
> they are already in -next. In the meanwhile I see patches sent in the
> morning to be reviewed till the end of the day - not critical bugfixes
> patches but new functionality.

Well, you've used a subject line for a different subsystem so there's a
good chance that I simply didn't look at the mail beyond that (many of
us get a lot of random CCs).  You also don't seem to have CCed the ALSA
list, nor for that matter Morimoto-san who maintains the generic card so
perhaps I was just waiting for his review.  I honestly can't remember.
I'll also note that there's only been a week of work time for me so far
this year, and you sent this on the last day I worked last year.

> Also, I don't understand how the ping was content free, given that it was on
> top of the original patch, unless I don't get what "content free" is
> supposed to mean, possible, I am not native English speaker.

Your mail added the single word "ping".  That is not saying anything
meaningful so adds nothing, and as the form letter I sent indicated
results in a mail that's not directly actionable.  As it says:

| all) which is often the problem and since they can't be reviewed
| directly if something has gone wrong you'll have to resend the patches
| anyway, so sending again is generally a better approach though there are
| some other maintainers who like them - if in doubt look at how patches
| for the subsystem are normally handled.

Blub for the subject letter thing:

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--TCIK1V0bgT6BtOom
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeFRtUACgkQJNaLcl1U
h9DP1Qf/WiXV+M14r36ElBMRDTgC1svuEc4pbGCqqp7CaLpc000dmrssZsuUctDR
r5P2NfNIQhCfuYqIPKETegRTwmFOoPn3tcCSbZ/6dyDfEosD3C0nKiQ89YB2Hpl0
vZi3T8CQTGwUHUsHEitGMWdAKXeX0ssY38xHyBkvQ+7ILJeb74/T8daCCRtBYgoO
IGetW9bPeZxzp1Oh+s7+xg4rWVWo1Km90SpNsUldHyawm53Xnh4s3Armby07JRvi
u+65xAUZjqOjg86YZuJpdfsr3KOw2Iycak0up3mveY9k12BJSAt5xetop2m0c1Gw
evV/hegtVjLdRJivVy9KI5ielj/RxA==
=Ya3h
-----END PGP SIGNATURE-----

--TCIK1V0bgT6BtOom--
