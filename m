Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B33DF158DC5
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 12:51:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BDF81665;
	Tue, 11 Feb 2020 12:50:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BDF81665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581421887;
	bh=VVUTd/A74BuNaRb7TTGvSgoF3V4HyAAJ6+5HME8vJTs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bb8FGmeBvwaO+VXYR5ggQXsZVZq1P+/AX3bsUvhJqhrXMeTsgUbFfraMGp7Gtc5qq
	 82KkotGecW7GVr6yRvciwRpI2hh4pAsYrjYpegZmvRxkOO1LB8kBrRMP2y96GDfsnM
	 bbioJZRkd4u+suAhXMmwnVliB5jHetFH6vIrye+w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56B15F80257;
	Tue, 11 Feb 2020 12:49:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF2F5F80252; Tue, 11 Feb 2020 12:49:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 5C6B1F80147
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 12:49:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C6B1F80147
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77EC21FB;
 Tue, 11 Feb 2020 03:49:52 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F0FFE3F6CF;
 Tue, 11 Feb 2020 03:49:51 -0800 (PST)
Date: Tue, 11 Feb 2020 11:49:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>
Message-ID: <20200211114950.GG4543@sirena.org.uk>
References: <7b03c81f49fb488b95a487f15851220e@realtek.com>
MIME-Version: 1.0
In-Reply-To: <7b03c81f49fb488b95a487f15851220e@realtek.com>
X-Cookie: Hire the morally handicapped.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 Albert Chen <albertchen@realtek.com>,
 Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
Subject: Re: [alsa-devel] [PATCH 1/2] ASoC: rl6231: Add new supports on
	rl6231
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
Content-Type: multipart/mixed; boundary="===============4356811088488076331=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4356811088488076331==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uc35eWnScqDcQrv5"
Content-Disposition: inline


--uc35eWnScqDcQrv5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 03, 2020 at 04:05:40AM +0000, Derek [=E6=96=B9=E5=BE=B7=E7=BE=
=A9] wrote:
> 1. Increases the max limit of PLL input frequency
>    on RL6231 shared support.
> 2. Add a new pll preset map.

This doesn't apply against current code, please check and resend.

--uc35eWnScqDcQrv5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5ClN0ACgkQJNaLcl1U
h9Dp0wf+IW0hwYCA/QdHioQuhpL+ertJivv1mALWHNfGk5KgIddANOB+qbLzrz1a
LfFg4Kvw5GVRbRo7QFfJxmJJMxhllfdgRwQVAdn8YtauqW8t2pt+0aQ40BNUkXJr
zSQWivYHLCQwHAhxY8PTyffH+dcrFgaxRcvt2ov8gIliGDag8I+erHir2NzCYKax
XcD9IngpUMNP00v/rjabeakhpV2FKQKhHJoidzsGgRkMV+vVg/rnKl/MxUyRlD+q
CFZgKi0quIzphGjZnewDWC6auv2YnXOkjXgJC+HlUY76kGWOCEw/Lsz82aOpaq2s
a3zaWX4PJtESrrcS6fsy7uwEAI94gA==
=MEvY
-----END PGP SIGNATURE-----

--uc35eWnScqDcQrv5--

--===============4356811088488076331==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4356811088488076331==--
