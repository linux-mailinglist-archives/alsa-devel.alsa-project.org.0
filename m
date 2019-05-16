Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A74FF20D7A
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2019 18:55:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC5B516AD;
	Thu, 16 May 2019 18:54:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC5B516AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558025701;
	bh=2UWLp6c7fZFBQFyIiCIVySQ6GB4gk6I2+ttQ2agxT6I=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DqmSQdZjDt1KOOSZbq4TSSzrzKTymBHTP15DXxntn7e1oDYfi3qo6tnJfGghs7xaj
	 HEJmvPyUscRwAPemy2S5pmJs9MzDQBTT9yjhDiDZiKk8mSYdclCZLk77og7l279/1l
	 Tr/ZxVoAXxj5i3htYpFEtrbE60xO9bvlKu22ITtU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C728F896B6;
	Thu, 16 May 2019 18:53:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F397BF80C18; Thu, 16 May 2019 18:53:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DD47DF80C18
 for <alsa-devel@alsa-project.org>; Thu, 16 May 2019 18:53:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD47DF80C18
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="ZhY+Nvkw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2e7PvavrjCWXnytzFRF4dbB4USMiDDmgBeoXo5dcC0Q=; b=ZhY+Nvkwhwz1sLeeGlchy+07J
 Ck67BMFZ41LoLvsUmqGKDYK+zurWRODRy76grWs4zT1/++DxUPXR9/2La/WrsWTNw7hMemPEU0/x/
 FAQRBEyp5DplG94g7ortUY097N47sdIatgv8wABhalL1c3RR4RbduKnnJHzYuombaNrl8=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hRJcu-000750-5N; Thu, 16 May 2019 16:53:04 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 9C669112929C; Thu, 16 May 2019 17:52:59 +0100 (BST)
Date: Thu, 16 May 2019 17:52:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>
Message-ID: <20190516165259.GI5598@sirena.org.uk>
References: <20190417150518.GB5703@sirena.org.uk>
 <BC6F7617C38F3E4E8CA887E07B35B828011660AC@RTITEXDAG02.realtek.com.tw>
 <20190508064537.GN14916@sirena.org.uk>
 <BC6F7617C38F3E4E8CA887E07B35B82805B1144E@RTITMBSVM07.realtek.com.tw>
 <20190512080621.GH21483@sirena.org.uk>
 <BC6F7617C38F3E4E8CA887E07B35B82805B13EE2@RTITMBSVM07.realtek.com.tw>
 <20190513145608.GA5168@sirena.org.uk>
 <BC6F7617C38F3E4E8CA887E07B35B82805B14BFF@RTITMBSVM07.realtek.com.tw>
 <20190515161429.GH5613@sirena.org.uk>
 <BC6F7617C38F3E4E8CA887E07B35B82805B15635@RTITMBSVM07.realtek.com.tw>
MIME-Version: 1.0
In-Reply-To: <BC6F7617C38F3E4E8CA887E07B35B82805B15635@RTITMBSVM07.realtek.com.tw>
X-Cookie: <ahzz_> i figured 17G oughta be enough.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 Albert Chen <albertchen@realtek.com>,
 "bard.liao@intel.com" <bard.liao@intel.com>,
 Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: rt1308: Add RT1308 amplifier driver
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
Content-Type: multipart/mixed; boundary="===============7559080890686009165=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7559080890686009165==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X0cz4bGbQuRbxrVl"
Content-Disposition: inline


--X0cz4bGbQuRbxrVl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2019 at 01:46:53PM +0000, Derek [=E6=96=B9=E5=BE=B7=E7=BE=
=A9] wrote:

> > It's better to have a comment than not have one, I think I'd be happier
> > if I understood what was actually being limited here - that might make
> > it clear why it's not system specific which is what's concerning me.

> I will give a comment that describes the limit setting reason clearly.

OK.

--X0cz4bGbQuRbxrVl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzdlWoACgkQJNaLcl1U
h9B7yQf/a95gVfuo5W6rYTxbjFPj4IUC7975Ts6OAP8/9XCz1UW/YXAQUKSUHbrd
voLJEJp2hECn6NlEQgww6E1VsaqUSpDqQvBUhZ0670Pe6dvawGj26yGUBJm74Eln
0k23vNGjyJH4mQECUznrvGYSpRyjqfb/fE7rxj/uugZUfx47DIrSjyJnb4TRGK/C
yNKgKDLqE7oAC6Dmwp5mmXfdemuwdQL3ZJSPCGtoxB9/QBAyItftwRtN3wKulw1Z
izRy5QhbxD9vBciJeN/fa6tT84Ko6fLkh6pxlW896dyrRwQZ6KxoxlalL7QWSk3i
WVGs20P4fF3cMNU//TdpIW6wVEjoPg==
=R929
-----END PGP SIGNATURE-----

--X0cz4bGbQuRbxrVl--

--===============7559080890686009165==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7559080890686009165==--
