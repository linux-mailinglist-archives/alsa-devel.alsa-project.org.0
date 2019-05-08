Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AC317190
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2019 08:29:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF7CF1821;
	Wed,  8 May 2019 08:28:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF7CF1821
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557296955;
	bh=bfNn1ea0VJsBozoSN1+309VIKB3cv1Q1vjvZtKDpSYE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sc3imvp/B4g85m47DsfXuvH6kZNTrRdrZ+kXJI91DIUlTlU7VNlJunEBeogyLInrD
	 9f71ClREPARdCmEb/0PlCDgz2erLl//i4oMUqe6n4Iw5DzF4dM4+MESUbqsbJiKDDH
	 tSkAu+x9DbivjoREotdQYDT3GAO1MlI6YPxC+vMA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E96E4F896E6;
	Wed,  8 May 2019 08:27:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A89CAF896F0; Wed,  8 May 2019 08:27:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FB79F807B5
 for <alsa-devel@alsa-project.org>; Wed,  8 May 2019 08:27:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FB79F807B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="rtQcN7Wa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ahYEYvXqYA9HX0AsEHBLdKum1Ym4VMZeBzBw94xnmxQ=; b=rtQcN7Wa0EOQPQCQFdVafpP0X
 hVPueiwAb3na25Fy96jNS+X83b+VDLePyG/F2r4w4c+MeuiZRYmSVLTm++NFMq/MkYZRKk9i3sJpv
 2bUhkg0kc+RnAShlrTgSQED3vgWfqgQTAfj6w4wQce8U9iVD+T3MGzX6FQ3j7UTYNVwec=;
Received: from [61.199.190.11] (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hOG30-00077X-Vr; Wed, 08 May 2019 06:27:23 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id CE54A440010; Wed,  8 May 2019 07:27:17 +0100 (BST)
Date: Wed, 8 May 2019 15:27:17 +0900
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190508062717.GK14916@sirena.org.uk>
References: <20190507163236.8783-1-pierre-louis.bossart@linux.intel.com>
 <20190507163236.8783-3-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20190507163236.8783-3-pierre-louis.bossart@linux.intel.com>
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, kbuild-all@01.org
Subject: Re: [alsa-devel] [PATCH 2/2] ASoC: SOF: core: fix undefined nocodec
	reference
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
Content-Type: multipart/mixed; boundary="===============2080623928667349074=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2080623928667349074==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NILByKcPRZiJ7ENr"
Content-Disposition: inline


--NILByKcPRZiJ7ENr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 07, 2019 at 11:32:36AM -0500, Pierre-Louis Bossart wrote:
> The existing code mistakenly uses IS_ENABLED in C code instead of as
> in conditional compilation, leading to the following error:

> ld: sound/soc/sof/core.o: in function `sof_machine_check':
> sound/soc/sof/core.c:279: undefined reference to `sof_nocodec_setup'

There's nothing wrong with using IS_ENABLED() in C code - it can be
cleaner than using an ifdef to help the compiler eliminate unneeded
code.

--NILByKcPRZiJ7ENr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzSdsUACgkQJNaLcl1U
h9DYAwf+Ig9zk0WlBw+wHjTOSc+d/0hQMkbfa1KESbPM2QIbe2V375ilLT++lfbn
v4WEXU233KLI+aEBAsECGiRSwLr9WAyNfz2baYzHzMGpeiP8J32ea1259YQpEwdC
jodvVC3BfRaTD8R5slc/oyz6TteT2nSuzlKB0jYX6X5aTLVXa5FE/dos9BOciFCT
OHeyA3fSyF1bzddv0i5jchp6P4veEmo3whksRbprbkoGgX088B/O5UxyyUqHR2ep
+EDDyjW5OSmHLPZjscuwvqy7HWiMdCJDRnGpCKFAselvZe8RYtuRa+BiEVz1hDRf
LARews8wJ3oueNKJyQdfPG2Wyzus+w==
=gQNd
-----END PGP SIGNATURE-----

--NILByKcPRZiJ7ENr--

--===============2080623928667349074==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2080623928667349074==--
