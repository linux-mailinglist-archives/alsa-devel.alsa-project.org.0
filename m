Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9604EBBB84
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Sep 2019 20:28:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1481C16A9;
	Mon, 23 Sep 2019 20:27:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1481C16A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569263301;
	bh=PA0sSdaWpcOrBYYVXchVaBUqGbNshe+gNoyleSXEAnM=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UD7A7+DbmAJEKq1Y7WM7V07LO/urXJTAOOWZ5ZSmpTUnI1kKvawUpqoEtvEJZkJSI
	 8kJWiRhJ3pnYG4rDYC0nTe+GMGR2vFwP0IxD5IRDxcPGwwxt/X+MNQqumdhMZy/fS1
	 IgXPEtAlB5L2dmsuAfTlW8L31EmE7thexPRq/ue4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 861B7F8031A;
	Mon, 23 Sep 2019 20:26:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50932F8044C; Mon, 23 Sep 2019 20:26:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 228FDF802BD
 for <alsa-devel@alsa-project.org>; Mon, 23 Sep 2019 20:26:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 228FDF802BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="fKjhg1af"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zw+H0cLzv/wwqoCNPLuepePG6BXzshdDMwI7nmGluWE=; b=fKjhg1afHN0bskjgwyq9Io5Cu
 Uy0KP8nn8p8ohmwBpELJ9JE/+fVoxTyba9bySGimHT6golLOxvZ0pAbFoNxr9uKGSvSA5BIxMtEXm
 yzngWO3G+0KzgEAjcKOxDl9W86UWTmdQi6InLrl40Pfi9MGte/6+khTJKabJteeX0bAb8=;
Received: from [12.157.10.114] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iCT2X-0004Xp-9o; Mon, 23 Sep 2019 18:26:25 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 46260D01F26; Mon, 23 Sep 2019 19:26:23 +0100 (BST)
Date: Mon, 23 Sep 2019 11:26:23 -0700
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <20190923182623.GX2036@sirena.org.uk>
References: <20190923154547.26532-1-krzk@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20190923154547.26532-1-krzk@kernel.org>
X-Cookie: Be careful!  UGLY strikes 9 out of 10!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Jiri Kosina <trivial@kernel.org>,
 alsa-devel@alsa-project.org, Jie Yang <yang.jie@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Clemens Ladisch <clemens@ladisch.de>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH trivial] sound: Fix Kconfig indentation
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
Content-Type: multipart/mixed; boundary="===============3979038247413758856=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3979038247413758856==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AaroDtM9M79Ffl67"
Content-Disposition: inline


--AaroDtM9M79Ffl67
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 23, 2019 at 05:45:47PM +0200, Krzysztof Kozlowski wrote:
> Adjust indentation from spaces to tab (+optional two spaces) as in
> coding style with command like:
>     $ sed -e 's/^        /\t/' -i */Kconfig

Acked-by: Mark Brown <broonie@kernel.org>

--AaroDtM9M79Ffl67
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2JDk4ACgkQJNaLcl1U
h9AK3Af/Tumh0ikqpRGJ0LZQlwnZL1S5vUwKQexSehpfKUrROssuMuDooB4KfBpz
ADosYAcnRlbfTq0/WyLAbhOUUYfA11tff0W8JqcdhWDupk+DWkHGiSgARTy18/fx
QQIiYsgO/MAiMJLVUS8Qm55ro7At6IGI6nGxDUtLowI/2OBxRrIXLlik9szhF9UL
hfh0nRX4R2gIj33W/MuTWPLiRf2SUAvK95Z7+0QoiCMAwY+d4NKkjNTdqCKJWfeK
FRBvFxRrd7KWIVq41QLWFp7FX3+fPEMhi2Setm0a7XVTszCKb09uxOIIKNJ8JwDv
vOR6rMrZvaRkVnVT+BsW5n9HY6OksQ==
=gZw4
-----END PGP SIGNATURE-----

--AaroDtM9M79Ffl67--

--===============3979038247413758856==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3979038247413758856==--
