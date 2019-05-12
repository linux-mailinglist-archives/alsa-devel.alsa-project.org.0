Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 399281AD6E
	for <lists+alsa-devel@lfdr.de>; Sun, 12 May 2019 19:08:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8385172E;
	Sun, 12 May 2019 19:08:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8385172E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557680934;
	bh=SJZwoXwDMqz7wA1D7tarAznwfhEs+hEsmfSIM3tzau4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OzvZzE+7TBsMIKFZLUuQGPHqDPSycAJmtwS3fq/sC58Phlg0KehC2IoL8P3bHj8lY
	 UP2kyfRJCrxhLnV/baXWZ4s1oprRKpO3hHrbB4DLvecdvTv6TKxauTZN55cNyzxHVt
	 R1QoSKJqqrXtU6OFH7Qki+s0KOpp8xIru2m2Af/c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FFDAF8972B;
	Sun, 12 May 2019 19:05:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D45BF89719; Sun, 12 May 2019 19:05:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DATE_IN_PAST_06_12, DKIM_SIGNED,
 DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6E1FF896B9
 for <alsa-devel@alsa-project.org>; Sun, 12 May 2019 19:05:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6E1FF896B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="Pqb+f8po"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Al4EoyY96EAxe1H2q1V9FWEsm/LEAVkyhL5q79Jk7NM=; b=Pqb+f8poN6fOZBIGOY2vx2WMT
 OXQ4lVhFA4XKnsj7aVIVyEngEGJInCg7BuQP9K7MBeFeSYf3HoFQHiTlCQ9lGaQ5qUInHWiVhosfJ
 YAZYMWfSMQVAksjR8BlUuAYj93RogMc84g5DU4TklSDH8PctzhkbM8FpGtYisyThVJm1Q=;
Received: from [81.145.206.43] (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hPruv-00044w-07; Sun, 12 May 2019 17:05:41 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 8380244004A; Sun, 12 May 2019 09:07:56 +0100 (BST)
Date: Sun, 12 May 2019 17:07:56 +0900
From: Mark Brown <broonie@kernel.org>
To: "Yang, Libin" <libin.yang@intel.com>
Message-ID: <20190512080756.GI21483@sirena.org.uk>
References: <1557282761-26146-1-git-send-email-libin.yang@intel.com>
 <aa0c6eea81a721f340dd1362801e49049a6620dd.camel@linux.intel.com>
 <s5htve4mymn.wl-tiwai@suse.de>
 <96A12704CE18D347B625EE2D4A099D1952838E47@SHSMSX103.ccr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <96A12704CE18D347B625EE2D4A099D1952838E47@SHSMSX103.ccr.corp.intel.com>
X-Cookie: HOST SYSTEM RESPONDING, PROBABLY UP...
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.de>, "Sridharan,
 Ranjani" <ranjani.sridharan@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, "Wang,
 Rander" <rander.wang@intel.com>
Subject: Re: [alsa-devel] [PATCH V2] ASoC: soc-pcm: BE dai needs prepare
 when pause release after resume
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
Content-Type: multipart/mixed; boundary="===============6435712641589738662=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6435712641589738662==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9iyR+p8Z2cn535Lj"
Content-Disposition: inline


--9iyR+p8Z2cn535Lj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 09, 2019 at 02:30:39AM +0000, Yang, Libin wrote:

> I think this may be a ASoC FE-BE defect.
> In this case, ASoC will call FE dai prepare(), but it will not call=20
> BE dai prepare() because of the judgement. This is why I made the patch.

If it's calling only the front end but not the back end that definitely
sounds like DPCM is causing trouble again.

--9iyR+p8Z2cn535Lj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzX1FsACgkQJNaLcl1U
h9DW3Qf+N4/X6mvAmda7LVaF3udDZiG5YNm2xceAXi7Jj99GDH779doij4YfA1BN
pcjw7hft1eNyna3WnGrin8XozWk5/bD6KXwQVQ4iliMKHomitFhjwtjgw/S2XB5w
whnL9oksQ1IWVwoGVorbRTA1abQ1Mc8iN65zMxiZtVZ9zABKoKgGOWy1R18xhbKZ
x308W5iDjOYJpHAxfqIR8yJ+sfqK6JInU3NsPuNjs89jnwwIHDXCQZiLIkuyuvpo
dpwe8Q3/bO6HK23EQqIjxadRG78sNZI8WAZACbeY0vwdRfJtalzvvbdt+Wo7+Rvt
VdXz8EZdCZvDQpLSoInclD5hwq4eMA==
=UKiG
-----END PGP SIGNATURE-----

--9iyR+p8Z2cn535Lj--

--===============6435712641589738662==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6435712641589738662==--
