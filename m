Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D73FF126F4
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2019 06:42:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C1A0186F;
	Fri,  3 May 2019 06:41:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C1A0186F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556858534;
	bh=woWS0au84aItgzYFkViRuq4NauzONx5WGCRPCVDNdpo=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fbYXe3Z8/TPgaSPKAx/Bv0fD83TNxXUit+jlc4wtGZFWUGmZkq5/xpcNAiYVIwCIh
	 P+yDgABe5LYyA8IpSM/U3rr4/CA1+ovsCqso52tpQ/juSY+4gVaYeeFU2LYOJwOC+w
	 jCj+/38e6rRXKtrAi9UBlPBxj/ZI1DikuRWSRXpg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B75DF896CB;
	Fri,  3 May 2019 06:40:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F7B1F896B7; Fri,  3 May 2019 06:40:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28184F8075A
 for <alsa-devel@alsa-project.org>; Fri,  3 May 2019 06:40:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28184F8075A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="JjtNfQi8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7puOT1H5/jwpIFIzaaENQa5w62/b8d5Bx2dFBB0hxqg=; b=JjtNfQi8NEH0DnWewIHPgDpXf
 yK8l5F+QiWGgODu8fttloDgR2N9QAKBDMcygcaa7Ntm9rj0ipLGup4d6olreCufTX7mPyFdRzawkI
 6QX64J0L804eK+OFwotujETiMOxKrr5rxwvmQe0ELGOMbAyJSQNX7EWGbPUJ/F5FgbJZ0=;
Received: from [42.29.24.106] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hMPzW-0000N8-R6; Fri, 03 May 2019 04:40:18 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 211BA441D3C; Fri,  3 May 2019 05:39:57 +0100 (BST)
Date: Fri, 3 May 2019 13:39:57 +0900
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190503043957.GA14916@sirena.org.uk>
References: <20190419194649.18467-1-pierre-louis.bossart@linux.intel.com>
 <20190419194649.18467-3-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20190419194649.18467-3-pierre-louis.bossart@linux.intel.com>
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, joe@perches.com
Subject: Re: [alsa-devel] [PATCH v2 2/2] regmap: soundwire: fix Kconfig
	select/depend issue
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
Content-Type: multipart/mixed; boundary="===============3897546747844738127=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3897546747844738127==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pMHZerOf5PT7gmN5"
Content-Disposition: inline


--pMHZerOf5PT7gmN5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 19, 2019 at 02:46:49PM -0500, Pierre-Louis Bossart wrote:

>  config REGMAP_SOUNDWIRE
>  	tristate
> -	depends on SOUNDWIRE_BUS
> +	select SOUNDWIRE_BUS

This now makes _SOUNDWIRE different to all the other bus types; if this
is a good change then surely the same thing should be done for all the
other bus types.  It's also not clear to me that this actually does
anything, do selects from symbols that are themselves selected actually
do anything?

--pMHZerOf5PT7gmN5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzLxhwACgkQJNaLcl1U
h9BFVAf+Kt8GD1suXskJzvuY/n6wUgMPGxKm9mip+31Y4Nv5D7V6nydDFOwdS/f2
0C6007zZSPyN2VqhgqhyuXlop/FAn9NkAHSsw5MEdOTabr3z07tL6TazA7pH5fG1
9/uTD3fbEcxQXJLvHhgR2KlkmbougPBt+Xbsl+7r/FHx1ZZ4lxhdAFZJmpHVRUo8
NtWcaeWOOpBEfd/0L335nNPOVChuNgpgUxj5mVidltafNB5H+9ygUWlF2ad0YaRK
qmjRWKCopc7DAghRUqIf8UoL+VV+YJnsuvTXky5lsuv56h3SXQiX50+QH/aKhbBu
+CDExuiE/VrK6yKLt8+xXpUHATjxEQ==
=RQMe
-----END PGP SIGNATURE-----

--pMHZerOf5PT7gmN5--

--===============3897546747844738127==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3897546747844738127==--
