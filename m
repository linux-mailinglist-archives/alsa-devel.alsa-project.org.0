Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E45AF158DCA
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 12:56:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 724C0166C;
	Tue, 11 Feb 2020 12:55:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 724C0166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581422166;
	bh=sGb2YKRYT0hoX8t+xtaypal+sEsyRKairuvoNgb4JLA=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kvr3jounElML2atvidnHk7nQQnIsFmHK/xNyLhfjkpnL29fedXQCFgmcu0bSXyJWo
	 FSEsOwqDszNuiTwS1PX9vImbjKN86ukydwbEbiHURZe/S8aMEh+B9i6h1LxD0Xi+1l
	 7klDkKEd0coQ2rkk9o72dXTSYtyv1I/hLW5PXQKE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6539FF80146;
	Tue, 11 Feb 2020 12:54:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95F73F80145; Tue, 11 Feb 2020 12:54:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id E436BF800E7
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 12:54:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E436BF800E7
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F6CC1FB;
 Tue, 11 Feb 2020 03:54:17 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C73E63F6CF;
 Tue, 11 Feb 2020 03:54:16 -0800 (PST)
Date: Tue, 11 Feb 2020 11:54:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>
Message-ID: <20200211115415.GH4543@sirena.org.uk>
References: <b00e687d8fb5406ba1bcab12463174e4@realtek.com>
MIME-Version: 1.0
In-Reply-To: <b00e687d8fb5406ba1bcab12463174e4@realtek.com>
X-Cookie: Hire the morally handicapped.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>,
 "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
Subject: Re: [alsa-devel] [PATCH 2/2] ASoC: rt5682: Add the soundwire support
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
Content-Type: multipart/mixed; boundary="===============9059843667590704963=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============9059843667590704963==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wayzTnRSUXKNfBqd"
Content-Disposition: inline


--wayzTnRSUXKNfBqd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 05, 2020 at 02:28:58AM +0000, Oder Chiou wrote:
> This patch adds the soundwire support for ALC5682.

This doesn't apply against current code, please check and resend.

--wayzTnRSUXKNfBqd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5CleYACgkQJNaLcl1U
h9DbQAf/btxvKA9/NN6WDS6Ge7NejN6/dMY+imvRKvrbgnBGEuarxNDwoJtTxBvI
CsmR4rMCtxfwFXtcvRZUdRxU0m8LCe+uswXiBsWjYJD5KiPW9sojcg6rRROAiAwT
8ljwUB04gZRB/eVVet+M+Ux7r2wykt+Zkido/bVHF59doyg9kop1FkfRmIar9f8V
c/FuYkSJpJOKTmJtP6zTOgqZCrkx9JtM4LL0bkUKZhLvOWzfQBWUBvY47aBvmw66
aDPLmmcA4x+mbVlQf1hPLP4fWPSxfCZW5eEIeh4X20fRzd821VpmH4Ccz/10jrsj
acqicGATx78B1oB1Vu0Wp4ZkHHEvRw==
=2VJw
-----END PGP SIGNATURE-----

--wayzTnRSUXKNfBqd--

--===============9059843667590704963==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============9059843667590704963==--
