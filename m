Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C761682C3D
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 13:10:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2B431E3;
	Tue, 31 Jan 2023 13:09:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2B431E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675167004;
	bh=DLvDCWzk5GytZBU1674pvfja+0MDldug2PT7rFtc6kE=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pgE7dZvviCuygrcO+bfgxb3kDc9apQmQAZl7fTuYh2khtMFbu5AgW3vBaLBUKptQc
	 E399kA1VZijeUk3YLwixPB8szeEaHJaM/uXwjWRzNersNl+eHwwbmBpSU1mBkI56x1
	 EjBRWy/jHOh+dy4x4+bWZfShWBhBSv6+0K0G2SAU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 259C5F800A7;
	Tue, 31 Jan 2023 13:09:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AF35F804C2; Tue, 31 Jan 2023 13:09:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 186A4F80169
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 13:09:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 186A4F80169
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AJDWPMup
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6020EB81B07;
 Tue, 31 Jan 2023 12:09:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52C2EC433EF;
 Tue, 31 Jan 2023 12:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675166939;
 bh=DLvDCWzk5GytZBU1674pvfja+0MDldug2PT7rFtc6kE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AJDWPMupCYKjOl/AZArandblM4qbqDNBDsOluBoAV+rGIxSRoMvHO3DEkhlcofMZO
 UJhK7QrLZRAd7PbumqpNP6ApjeHxg/Q7z+uPY37mjzsDOV9VmjgCdTk9SOv4sWFOah
 1JaZoIxOHel8h2+CmQOs8z0w4Dxt8CW+txXkG1srojWlSAdhtgO2dDQYjiwejO25Ur
 SO1IXLEHcpxwYinYgO89nri4QmKz7pCkugFy0nJPAh1U83tUeaUnVNjHCB1CnGy/3k
 8TKg8cx5+ABOMVupfTVJcgGBdWQ68xugDvJalBAXPrrEOrkjZ9H6cBzKrQfKabmzMN
 RsHustz01M/YA==
Date: Tue, 31 Jan 2023 12:08:53 +0000
From: Mark Brown <broonie@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] ASoC: da7219: Fix pole orientation detection on OMTP
 headsets when playing music
Message-ID: <Y9kE1cSUg2CQM5vq@sirena.org.uk>
References: <20221121050744.2278-1-david.rau.zg@renesas.com>
 <20230117195645.GA83401@roeck-us.net>
 <OS3PR01MB66416CEF9F6E5AE62D194BACCDC49@OS3PR01MB6641.jpnprd01.prod.outlook.com>
 <20230119161221.GA981953@roeck-us.net>
 <OS3PR01MB66416C10BF8E6400C84DAD02CDD09@OS3PR01MB6641.jpnprd01.prod.outlook.com>
 <38f09c4d-70d1-f65f-6e9b-4ad84eda4059@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="RWg0+JlsDY3Vw6Hh"
Content-Disposition: inline
In-Reply-To: <38f09c4d-70d1-f65f-6e9b-4ad84eda4059@roeck-us.net>
X-Cookie: MS-DOS must die!
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "support.opensource@diasemi.com" <support.opensource@diasemi.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>,
 David Rau <david.rau.zg@renesas.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--RWg0+JlsDY3Vw6Hh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 30, 2023 at 10:16:06PM -0800, Guenter Roeck wrote:
> On 1/30/23 19:58, David Rau wrote:

> > Thanks for the kind feedback.
> > Would you please let me know what kinds of environment such error appears you ever meet?
> > Ex: da7219_aad->gnd_switch_delay = ?

> We are seeing the problem on various Chromebooks.

> Never mind, though. I really don't have time to keep arguing about this.
> I would have assumed that it is obvious that a long msleep() in an
> interrupt handler is not appropriate, but obviously I was wrong.

This is a threaded interrupt handler so it's a bit less clear that it's
meaningfully different to just disabling the interrupt for debounce or
whatever.  Not to say it's ideal.

> I'll see if I can implement a downstream fix.

If you implement something I don't see a reason not to post it upstream.

--RWg0+JlsDY3Vw6Hh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPZBNQACgkQJNaLcl1U
h9Dq2gf/fvsbqcA/2q2LDugcFHS+UA30iZOWyzJk/4mkZW0YYSP0HnRGNy6k1b+u
/tazYt83YwhvD7OvuBAwKmMkaQ/FJouw6SbxUJhnObQL1vzc2O+zHCdOTH0Zb1mC
fRVeHipFBvhCxiUgnlcY+oIosWgP0DdIsfmP9ysmACaTqprX5VDQc0Qcu9NX1Jd4
ZYKE2v7BUYpNJqPnNOwRlHbzN/UkIG6LptUDSYZrD4AdiNsvFXlh9SAQ+WmCNOks
quPHbiy0m9MI5CpXZvb92LS4IHMCVPeC6gwskBEVDtz8cHatj1YWapH7ZhDlcVh5
xPFvBwh3Ge5lSG6giq9uYY+SJoc0SQ==
=BYXM
-----END PGP SIGNATURE-----

--RWg0+JlsDY3Vw6Hh--
