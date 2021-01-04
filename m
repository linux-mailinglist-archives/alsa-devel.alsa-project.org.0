Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE5D2E944E
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jan 2021 12:51:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCA1E167F;
	Mon,  4 Jan 2021 12:50:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCA1E167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609761087;
	bh=XHzAG1HLQB1CTQwIyBMKeGzmQAbs9QYbc1hi4Z8ewVY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V/fobS2BBtf5gczYqkZdWD7RE8ePAxRqYFMRUiEn0v+KSA4+zWAHjRg5D/yCae7T1
	 ewSyWPTIzbs9CuwMfV4BnMG+W1tVgkOi4Y1+DlMWyr1ta2A3uWC5sSFp5JQAE+BLtu
	 rZQTI6RabNU8g0O8ciElu/4Hn/xlWYUq5JTyTncE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46705F8012C;
	Mon,  4 Jan 2021 12:49:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5712EF80166; Mon,  4 Jan 2021 12:49:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3B36F8012B
 for <alsa-devel@alsa-project.org>; Mon,  4 Jan 2021 12:49:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3B36F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="EB0J/i1w"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5D5E922211;
 Mon,  4 Jan 2021 11:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609760981;
 bh=XHzAG1HLQB1CTQwIyBMKeGzmQAbs9QYbc1hi4Z8ewVY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EB0J/i1wDbJYvdvmX99v8EaBDLJxBj+kBr+piBDBzBMYVJRE7ZCgRfA7KF88rhDvt
 1YtjTskmvswMQi3XYL58hEFVwgNnvnEps6iQSfTi8F6lg4G/daOOGJ9aNoIx76pZ8D
 2e9tK/wnnuTyfMv6lNai/o+UUT5nLOnngbymzkMLNQm+LYEGtg/vCHHCqCMYajZ/Me
 kRKD0aCoIFP4fz9TM7DuOqwezSf1QRvFy6+RlrsZPB/SOxs2PtM9MQPNpU+cUX7pRo
 d0YgQOU9Ps8SKvk18bfBluYIQGATcHncnWNjRSyeY1ukLkHZBeZUHSoTEEu+HQhFf9
 OHhyCMO8z7AKA==
Date: Mon, 4 Jan 2021 11:49:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Jack Yu <jack.yu@realtek.com>
Subject: Re: [PATCH] ASoC: rt1015: modify calibration sequence for better
 performance
Message-ID: <20210104114915.GA5645@sirena.org.uk>
References: <ec66399502514edbb1de3cf9bff08b1d@realtek.com>
 <f3f369957a1d46cb81328fe0d8caf020@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Content-Disposition: inline
In-Reply-To: <f3f369957a1d46cb81328fe0d8caf020@realtek.com>
X-Cookie: Stupidity is its own reward.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 =?utf-8?B?a2VudF9jaGVuQHJlYWx0ZWsuY29tIFvpmbPlu7rlro9d?=
 <kent_chen@realtek.com>, =?utf-8?B?6Zmz5pi25b+X?= <kenny_chen@realtek.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
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


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 01, 2021 at 01:50:49PM +0000, Jack Yu wrote:
> Hi Mark,
>=20
> Could you please help review below patch?=20
> Thanks a lot!

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/zALoACgkQJNaLcl1U
h9AB/gf/RYU8TF+dmYs5CB49fWXul1tUwGhH3XYK8h7pWAguJsFQGFIqhd0qTAne
+ARbcY6IdxclkKOssXfnQaVs1U4hmpzFXztQYxoBMOSNFaaMD0myQYJJcAPup0Xx
1Vmu6b6CFsUriy24xlkHGxLzXCyBoeATALXYj33mkUW3h+LPE6zhLKDZkZ4upEem
5EBgANEISh8iBoJ3HDDL517h9p85eWiRhz6aooniKQJgadIeRUZEkTO66HRi2dqF
WyBqhmqZBUyQcbowzTsLj+HWt1vp213YXvspAOXUKqXTdgb5e5cB6Z5nHiKo8Y8e
yLusQQtUjP1qh2vrVmUXXVgf+uRPTA==
=98to
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--
