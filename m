Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17414B4C56
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Sep 2019 12:56:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9343A1666;
	Tue, 17 Sep 2019 12:55:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9343A1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568717761;
	bh=CqWF1UIdkMSItV/zEGItnH4AN+l4G5ZpGl0vMFmtcqU=;
	h=Resent-From:Resent-Date:Resent-To:Date:From:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qNT5M21oZWnSupWP68gX5NUbKgKDPhz08kaRIu2tY3x6ueVzOEXXvMFAfpEchUsW5
	 zQwZbo0e2LKVIQSK0D2OxeSUP8+Xn6VruuDIR4Py74JR4LmH9vpEKi3M3ikb4C91vf
	 TbP2v9LDEhv6Lg2gC3G9nHQnIy2GSWLXBtP/oedg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C0D4F8048E;
	Tue, 17 Sep 2019 12:54:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F02F2F80361; Tue, 17 Sep 2019 12:54:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3CECF802BD
 for <alsa-devel@alsa-project.org>; Tue, 17 Sep 2019 12:54:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3CECF802BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="euAdF8DO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Resent-To:Resent-Message-ID:Resent-Date:
 Resent-From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Sender:Resent-Cc:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DjatoRpZQS80cf2AeRuBw0rkTnIsH9c2PxGWpLSmVqk=; b=euAdF8DOQ82RtnFgpc+mpUi43
 Dzfdn5g0WYuSvbs/X9KSOU5VykBUAgHjXZSQycxetuE/HTFKOhPZi8nQWkwZY89VsCaEBBIJPyVzu
 Ntql2rV4c0pSWKOE143oLmVUb7JBZmxBC2UHwmObJ4HCmSSJkl/PcsRfj+wOiCajXEC7A=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>) id 1iAB7c-0007iW-1f
 for alsa-devel@alsa-project.org; Tue, 17 Sep 2019 10:54:12 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id E88D627419E9; Tue, 17 Sep 2019 11:54:10 +0100 (BST)
Resent-From: Mark Brown <broonie@sirena.co.uk>
Resent-Date: Tue, 17 Sep 2019 11:54:10 +0100
Resent-Message-ID: <20190917105410.GC3524@sirena.co.uk>
Resent-To: alsa-devel@alsa-project.org
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iAAsu-0007gc-JV; Tue, 17 Sep 2019 10:39:00 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 2E48327419E9; Tue, 17 Sep 2019 11:38:59 +0100 (BST)
Date: Tue, 17 Sep 2019 11:38:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>,
 Mac Chiang <mac.chiang@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190917103858.GA3524@sirena.co.uk>
MIME-Version: 1.0
X-Cookie: Know Thy User.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-next@vger.kernel.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>
Subject: [alsa-devel] Build failure after merge of the sound-current
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
Content-Type: multipart/mixed; boundary="===============5519816447814816882=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5519816447814816882==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Content-Disposition: inline


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

After merging the sound-current tree, today's linux-next build for x86
allmodconfig failed like this:

In file included from /home/broonie/next/next/sound/soc/intel/boards/sof_rt5682.c:23:
/home/broonie/next/next/sound/soc/intel/boards/../common/soc-intel-quirks.h: In function 'soc_intel_is_cml':
/home/broonie/next/next/sound/soc/intel/boards/../common/soc-intel-quirks.h:39:23: error: 'INTEL_FAM6_KABYLAKE_MOBILE' undeclared (first use in this function); did you mean 'INTEL_FAM6_KABYLAKE_L'?
 SOC_INTEL_IS_CPU(cml, INTEL_FAM6_KABYLAKE_MOBILE);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
/home/broonie/next/next/sound/soc/intel/boards/../common/soc-intel-quirks.h:18:44: note: in definition of macro 'ICPU'
 #define ICPU(model) { X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, }
                                            ^~~~~
/home/broonie/next/next/sound/soc/intel/boards/../common/soc-intel-quirks.h:39:1: note: in expansion of macro 'SOC_INTEL_IS_CPU'
 SOC_INTEL_IS_CPU(cml, INTEL_FAM6_KABYLAKE_MOBILE);
 ^~~~~~~~~~~~~~~~
/home/broonie/next/next/sound/soc/intel/boards/../common/soc-intel-quirks.h:39:23: note: each undeclared identifier is reported only once for each function it appears in
 SOC_INTEL_IS_CPU(cml, INTEL_FAM6_KABYLAKE_MOBILE);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
/home/broonie/next/next/sound/soc/intel/boards/../common/soc-intel-quirks.h:18:44: note: in definition of macro 'ICPU'
 #define ICPU(model) { X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, }
                                            ^~~~~
/home/broonie/next/next/sound/soc/intel/boards/../common/soc-intel-quirks.h:39:1: note: in expansion of macro 'SOC_INTEL_IS_CPU'
 SOC_INTEL_IS_CPU(cml, INTEL_FAM6_KABYLAKE_MOBILE);
 ^~~~~~~~~~~~~~~~
make[5]: *** [/home/broonie/next/next/scripts/Makefile.build:281: sound/soc/intel/boards/sof_rt5682.o] Error 1
make[4]: *** [/home/broonie/next/next/scripts/Makefile.build:497: sound/soc/intel/boards] Error 2
make[4]: *** Waiting for unfinished jobs....
In file included from /home/broonie/next/next/sound/soc/intel/atom/sst/sst_acpi.c:35:
/home/broonie/next/next/sound/soc/intel/atom/sst/../../common/soc-intel-quirks.h: In function 'soc_intel_is_cml':
/home/broonie/next/next/sound/soc/intel/atom/sst/../../common/soc-intel-quirks.h:39:23: error: 'INTEL_FAM6_KABYLAKE_MOBILE' undeclared (first use in this function); did you mean 'INTEL_FAM6_KABYLAKE_L'?
 SOC_INTEL_IS_CPU(cml, INTEL_FAM6_KABYLAKE_MOBILE);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
/home/broonie/next/next/sound/soc/intel/atom/sst/../../common/soc-intel-quirks.h:18:44: note: in definition of macro 'ICPU'
 #define ICPU(model) { X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, }
                                            ^~~~~
/home/broonie/next/next/sound/soc/intel/atom/sst/../../common/soc-intel-quirks.h:39:1: note: in expansion of macro 'SOC_INTEL_IS_CPU'
 SOC_INTEL_IS_CPU(cml, INTEL_FAM6_KABYLAKE_MOBILE);
 ^~~~~~~~~~~~~~~~
/home/broonie/next/next/sound/soc/intel/atom/sst/../../common/soc-intel-quirks.h:39:23: note: each undeclared identifier is reported only once for each function it appears in
 SOC_INTEL_IS_CPU(cml, INTEL_FAM6_KABYLAKE_MOBILE);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
/home/broonie/next/next/sound/soc/intel/atom/sst/../../common/soc-intel-quirks.h:18:44: note: in definition of macro 'ICPU'
 #define ICPU(model) { X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, }
                                            ^~~~~
/home/broonie/next/next/sound/soc/intel/atom/sst/../../common/soc-intel-quirks.h:39:1: note: in expansion of macro 'SOC_INTEL_IS_CPU'
 SOC_INTEL_IS_CPU(cml, INTEL_FAM6_KABYLAKE_MOBILE);
 ^~~~~~~~~~~~~~~~
make[6]: *** [/home/broonie/next/next/scripts/Makefile.build:281: sound/soc/intel/atom/sst/sst_acpi.o] Error 1
make[5]: *** [/home/broonie/next/next/scripts/Makefile.build:497: sound/soc/intel/atom/sst] Error 2
make[4]: *** [/home/broonie/next/next/scripts/Makefile.build:497: sound/soc/intel/atom] Error 2
make[3]: *** [/home/broonie/next/next/scripts/Makefile.build:497: sound/soc/intel] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [/home/broonie/next/next/scripts/Makefile.build:497: sound/soc] Error 2
make[1]: *** [/home/broonie/next/next/Makefile:1087: sound] Error 2
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:179: sub-make] Error 2
Command exited with non-zero status 2

caused by commit

	c643c189f0fec116 (ASoC: Intel: boards: Add Cometlake machine driver support)

IIRC there was some previous discussion of a dependency on other changes
here but I thought that was resolved?  I've reverted that commit for
today.

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2At8IACgkQJNaLcl1U
h9Av7wf+NrVHx4OP1l3O3mQGsw2K8yECwIloOPyPQATIkKkZ4IlOtRggGauxZVb0
HkAFBWOKmvvVjLka1PG6yCtpnwP82oarHJYANTTvQOtMo7o8uCeWBg4EzMOO7PdH
UHuH5zPhnq9n404fwZS3pyRJeUZXfUQ4GMuR1w7yFSfjeX7d9qHXa35Y2M1J1LYd
hXukTpGu7Qwc/Ia5JBeDQEWut0iLbx8YClRLSf2X9S7JJBNU84ofuyXxZoVripF6
yn6sx5XpbC0naxRVYdSo2T9JdzNDoVqjFGvQNu3ofETscO+d7H5SOypClo1VnMt7
tcTxmsX/RiF+02viQbVh4SgvYxlTTw==
=mQFK
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--

--===============5519816447814816882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5519816447814816882==--
