Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4456DA8610
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2019 17:32:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1B1A16B9;
	Wed,  4 Sep 2019 17:31:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1B1A16B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567611131;
	bh=ZhR75AWWoXSD2mmhjF4pdRSKu4SJRxBGdq1hUlKT03M=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RbL+nNnvUbsGBuQww6pTnle6ir+260cfZYJ3yf04TShxMb1D2Z2R/zuxfLx3gABR0
	 nU0HIsamMXWhd9csPLkGlrxaaFVgsfQSJ8rVBobIbbI40ykmoUG7mOrY477SfeIpQG
	 4i+3yzQzAHPfB9RNCFrCs7+X8Z+mOGqb9aRfPbuo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 497F7F80228;
	Wed,  4 Sep 2019 17:30:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44D0BF803A6; Wed,  4 Sep 2019 17:30:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE330F80228
 for <alsa-devel@alsa-project.org>; Wed,  4 Sep 2019 17:30:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE330F80228
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="TtnIL2Lv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c7U5Te26OOkpWZh++wRipeOwfTU9MW2rO16f03qANlE=; b=TtnIL2Lvf76PRgjjGcjO5m6CT
 f9WndgysisoyfcXDGr8r7su7K21pY4RLBjQ2+AdhVLc0xJvh/Qo9olW1hKGj5gx5NPvEYQBPdcYUL
 6/PFPA+2dCs9UR5RTMY5S4XsBi5V+gygEqJmxvsKerAKIB0llRn11ACJgLET5EFHJctAQ=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1i5XEf-0006KI-Me; Wed, 04 Sep 2019 15:30:17 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id D94FC2742B45; Wed,  4 Sep 2019 16:30:16 +0100 (BST)
Date: Wed, 4 Sep 2019 16:30:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Katsuhiro Suzuki <katsuhiro@katsuster.net>
Message-ID: <20190904153016.GD4348@sirena.co.uk>
References: <20190903165322.20791-1-katsuhiro@katsuster.net>
 <20190903174801.GD7916@sirena.co.uk>
 <85c717bf-d875-016c-a303-867bdca9a645@katsuster.net>
MIME-Version: 1.0
In-Reply-To: <85c717bf-d875-016c-a303-867bdca9a645@katsuster.net>
X-Cookie: Help fight continental drift.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, David Yang <yangxiaohua@everest-semi.com>,
 Daniel Drake <drake@endlessm.com>
Subject: Re: [alsa-devel] [PATCH v3 1/4] ASoC: es8316: judge PCM rate at
	later timing
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
Content-Type: multipart/mixed; boundary="===============7794338187744506099=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7794338187744506099==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eqp4TxRxnD4KrmFZ"
Content-Disposition: inline


--eqp4TxRxnD4KrmFZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 05, 2019 at 12:06:23AM +0900, Katsuhiro Suzuki wrote:

> Would you tell me one more thing. I don't understand who sets MCLK to 0.
> Is it needed original machine driver instead of audio-graph-card?

> On my test environment (audio-graph-card + Rockchip I2S + ES8316), it
> seems audio-graph-card has never called set_sysclk() with freq = 0 after
> stop play/capture sound. So my env will go to bad scenario as I described in
> this patch.

You shouldn't need a custom machine driver - you'll just be the first
person who ran into this with audio-graph-card.  I'd just add this
support to the audio-graph-card, either with custom startup and shutdown
callbacks or using a set_bias_level() callback (both get used, I'd guess
the set_bias_level() is easier since you don't need to reference count
anything).

--eqp4TxRxnD4KrmFZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1v2IgACgkQJNaLcl1U
h9CzYQgAgkCVkBPAUDivm6m1Ys+xPGbqYO85zw38TRTqnQ8UMpCzpJd0DV1P8jAb
xx3AaPskCUVjVjY8Nf9ejibjh3Bv0EF75kTr+qcuSCSm1gHjzNOsYym05tMtVOEJ
wO6Kf95ga1nFkJdUzMlnPYY7Ifsybx29HfT0qdaWny4G6c1JnciMRAqRQx457ZAU
a2beSvFPAoNAxB2l2N/mUxWM5OkhnYQ+hoy02agR9LoMsYGO3YxVfBRictMw1e8W
fw3Hq9jULyMR4rY0tIObdsog2kHlwsCQrFzbQ1e4j25r1UntY9whHlctZKJX0onX
jxre3OCp7c1jZLxxjsU9vsacKvYRxQ==
=YJma
-----END PGP SIGNATURE-----

--eqp4TxRxnD4KrmFZ--

--===============7794338187744506099==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7794338187744506099==--
