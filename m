Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDA962D975
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Nov 2022 12:35:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CCA616BB;
	Thu, 17 Nov 2022 12:34:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CCA616BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668684912;
	bh=yMu6+GoFnl1mrIFFhTT3h7tPE+tEdM553AlyVAInMtU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n1NJ0e/jRpxlyBUiV+hh+D9UXYWfSvfS3s0mGwsMW+iJriANiowMl6AWr0ne3KpKH
	 CQagrACirRMdj1YacSrv/yYqZQ9l+neug2v5KBtiNUL04CItHdbd4WT2mC9Hc7+TeT
	 OPDDXx7y2gbS597KYrjTfxz5pD441XWZynzZ21bs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8D72F804BD;
	Thu, 17 Nov 2022 12:34:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 091BDF800B8; Thu, 17 Nov 2022 12:34:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98D1EF800B8
 for <alsa-devel@alsa-project.org>; Thu, 17 Nov 2022 12:34:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98D1EF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HdOniGdl"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9DCF161251;
 Thu, 17 Nov 2022 11:34:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90E73C433D7;
 Thu, 17 Nov 2022 11:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668684850;
 bh=yMu6+GoFnl1mrIFFhTT3h7tPE+tEdM553AlyVAInMtU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HdOniGdlwP8cyj9N71XQTfTLaJOTTLgOhFdmgU4B+ak6zjuXmZIs3qRCND30cYI5p
 LwUV6gPCiTQeVyEhetyAvPKo6HRrLedjPJdUZgIAj6VGVw1mLZPqTGIu1TIiXu/n15
 Pt2dhgSARtYkngniM6kN5WdFRICtscNIcNoA8Xg7qiYJ2aZxqiw/EpylvUU10nncSU
 1a9VXdp7zAIdtQpJoYcC6HOGQTUKYY0WihJ7mwYs4b5dYsP1OvoTiwEdu9QUQyxqQw
 QmEWDn1h+Rdam4Y0+fPyop0vK7uYuO4/S2C+pmoHRvKzC0ffcLyngND8Rl6X+E5HJT
 vJE2Kq4p/UaOg==
Date: Thu, 17 Nov 2022 11:34:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 01/11] ASoC: ak5386: switch to using gpiod API
Message-ID: <Y3YcLulaebidYYsg@sirena.org.uk>
References: <20221116053817.2929810-1-dmitry.torokhov@gmail.com>
 <Y3S9KzTE1/UQDmJl@sirena.org.uk> <Y3U1BJAPOJTLw/Zb@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="QM8UBU9P046DRTWO"
Content-Disposition: inline
In-Reply-To: <Y3U1BJAPOJTLw/Zb@google.com>
X-Cookie: Ego sum ens omnipotens.
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--QM8UBU9P046DRTWO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 16, 2022 at 11:07:48AM -0800, Dmitry Torokhov wrote:
> On Wed, Nov 16, 2022 at 10:36:27AM +0000, Mark Brown wrote:

> > How are we ensuring that people have described signals as active
> > low/high in existing DTs, and are we positive that the signal is
> > described as active low for all devices?  In particular if the
> > signal is described as a reset signal then it's active high even
> > if we want it low while the device is actually in use.

> I have been going through in-kernel DTSes and adjusting ones that are
> incorrect. For external ones I think we should take a pragmatic approach
> and say that if driver has last non-mechanical update in 2014 and there
> are no users submitted to mainline since then (as this one), then it is
> highly unlikely that devices currently using this component/codec will
> be updated to the 6.2+ kernel even if they are still in service. And if
> this does happen the breakage will be immediately obvious as we'll keep
> the codec in reset state.

> But if you really want to I can add quirk(s) to gpiolib forcing this
> line to be treated as active-low regardless of what specified in DTS.
> This kind of negates benefit of going to gpiod though.

That doesn't address the bit about checking that the device
describes the signal as active low in hardware - it's assuming
that the signal is described by the device as an active low
reset and not for example as a shutdown signal.

TBH I'm not thrilled about just randomly breaking ABI
compatibility for neatness reasons, it's really not helping
people take device tree ABI compatibility seriously.

--QM8UBU9P046DRTWO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmN2HC4ACgkQJNaLcl1U
h9Dxfgf/ftYFUMW/ILTdWcqMEKVkYIa3+9VBKpQL0Aq9xN022wMz+ICsRHsAonCe
fhG0ZfhhAvP4nkV+Ui6cxFdWM/vM0Or+OF1KnI8BsCoWkMpyDU7WahUXQ8HhjnUv
RkKKkXG3K0jcYeh1yLB4p1miF1tt060Z09558aUHtnFto6vNOtE1VE56aI8TJvzo
qAN33CB7jWe++RfqjI0hismVbCjTNxivk48+6qKzdjS4JsgoqGGqxMYqnJzBMbf5
rUAM8yj6zH74WkWELWsv9ZlxCQ9CAEOWEeP4eWLFgQ1arngjeymdAVy04frQB+Dy
Q1mfUHb1Sj+c6y7pgbHXtAOaX6CjWg==
=EGgz
-----END PGP SIGNATURE-----

--QM8UBU9P046DRTWO--
