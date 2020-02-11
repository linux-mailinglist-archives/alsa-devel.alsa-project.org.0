Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0E2158DC4
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 12:51:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA537165D;
	Tue, 11 Feb 2020 12:50:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA537165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581421861;
	bh=/beBDVbvocszpDGkH9758UE+u75q/eSxYK2B1QmrdlE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eXOXTVCAEVPnoaGRdptJX00mA3pIkR/cLlPN8uwbb0M3BebQlaIWxIDpj+cJd3aNB
	 07nD6BhEPZMZc3dCWqUQG+kuOR//zjBgw5TL9JqrhpX/eGEQ9DoHoX+Y/0eKjX2RY1
	 jOBjn2HzV+uDglLozT/ODtqT6btbpd40NSn8yRB0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B991F801DA;
	Tue, 11 Feb 2020 12:49:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C17D2F8013D; Tue, 11 Feb 2020 12:49:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 656DCF8013D
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 12:49:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 656DCF8013D
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC1641FB;
 Tue, 11 Feb 2020 03:49:35 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 419CA3F6CF;
 Tue, 11 Feb 2020 03:49:35 -0800 (PST)
Date: Tue, 11 Feb 2020 11:49:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>
Message-ID: <20200211114933.GF4543@sirena.org.uk>
References: <7541a3ab070044e0a997e5bca9680585@realtek.com>
MIME-Version: 1.0
In-Reply-To: <7541a3ab070044e0a997e5bca9680585@realtek.com>
X-Cookie: Hire the morally handicapped.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 Albert Chen <albertchen@realtek.com>,
 "bard.liao@intel.com" <bard.liao@intel.com>,
 Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
Subject: Re: [alsa-devel] [PATCH 2/2] ASoC: rt5682: Enable PLL2 function
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
Content-Type: multipart/mixed; boundary="===============0884758313495696124=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0884758313495696124==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uTRFFR9qmiCqR05s"
Content-Disposition: inline


--uTRFFR9qmiCqR05s
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2020 at 10:51:46AM +0000, Derek [=E6=96=B9=E5=BE=B7=E7=BE=
=A9] wrote:
> Enable RT5682 PLL2 function to implement the more complex
> frequency conversion.

This doesn't apply against current code, please check and resend.

--uTRFFR9qmiCqR05s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5ClMwACgkQJNaLcl1U
h9CwwQf+Lij6hoQ5XS4GuNXbEuRfK8//kHo6xeslWxNDk9DCDqNicgQg/JGX2vlg
RrVIxUTDEV53avm6PbYQUJPs48bDyQihNX5ClHIFBRhud2IgOiA06FsjWnGHqpVU
OR+f6a/fEwJuO6uN5BVWZAcFUpgg0l0g4i8lVuGQwdmtLxEm8XnMn7Irquc4y9ZL
wx7DjC/eUdG2R+5XKfnLxcGE+VJvnVWuOfNQ3njeH+RVwJVHDTFTqwrWAcOk4nHl
QYGgjRR4hCS1T4w2F/7p3iIhSu9F+hA3TGY1RgAAgH2/kkdqHhNHTkOC3arN13Yv
9k/kN67PU7FwynHADwxvN7pKcOxUHg==
=Z0tT
-----END PGP SIGNATURE-----

--uTRFFR9qmiCqR05s--

--===============0884758313495696124==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0884758313495696124==--
