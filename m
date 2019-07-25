Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DF374F16
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 15:21:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99E571B0C;
	Thu, 25 Jul 2019 15:20:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99E571B0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564060860;
	bh=nNbEJW1kNV7UTlhl7/m7UHw/8dUBDwFUx+m32mhVRvY=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ip9omOZ2FHnEdCFARRsUCKIzmXSfWlXZmlKOwgIloaCSm/vHp1sTpYv6coUUPWRqg
	 YhOk2L6gzTOOYH2DXxGyO2A30OIBIRFbUr6XxP5sI3hM8yZHJJZyMEFhNgiquF5dSz
	 gEiNdDNqwVRoyWb9/J+g43CaP1mUNeIQViW7fJ/A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00D5AF803D0;
	Thu, 25 Jul 2019 15:19:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4A80F803D0; Thu, 25 Jul 2019 15:19:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32BCBF800F5
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 15:19:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32BCBF800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="fbLcvXSs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KMyQYGhYyaCNNp/RG01RbMlf+YiT+Y8y3ZDXfx2/GuQ=; b=fbLcvXSsAiHrKez+m/9vjAAIC
 GlUvU9Xakcj/E8GOpSICjiNjnseGQc2mvQwcLg5baEY8taNHOJiKDTQss9H8B/ZUP8zQAjOWm3Bof
 M6tmj+NaT/xjgjSciZxXTGfsJNyebVSyUpao3NGz4cNZkhn8iukQo30jal/kHoPss2DlQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hqdeH-0002rI-6o; Thu, 25 Jul 2019 13:19:09 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id A71E02742B5F; Thu, 25 Jul 2019 14:19:08 +0100 (BST)
Date: Thu, 25 Jul 2019 14:19:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Message-ID: <20190725131908.GE4213@sirena.org.uk>
References: <20190725110808.19938-1-perex@perex.cz>
MIME-Version: 1.0
In-Reply-To: <20190725110808.19938-1-perex@perex.cz>
X-Cookie: Jenkinson's Law:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: SOF: Makefile - fix the top-level
 kernel module names (add snd- prefix)
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
Content-Type: multipart/mixed; boundary="===============6600274628597735340=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6600274628597735340==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZRyEpB+iJ+qUx0kp"
Content-Disposition: inline


--ZRyEpB+iJ+qUx0kp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 25, 2019 at 01:08:08PM +0200, Jaroslav Kysela wrote:
> Use the proper module name. The objs assignments are already there.

This breaks the build for me:

  DESCEND  objtool
  CALL    scripts/atomic/check-atomics.sh
  CALL    scripts/checksyscalls.sh
  CHK     include/generated/compile.h
make[3]: *** No rule to make target 'sound/soc/sof/snd-sof-acpi-dev.o', needed by 'sound/soc/sof/built-in.a'.  Stop.

--ZRyEpB+iJ+qUx0kp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl05rEsACgkQJNaLcl1U
h9Cv5Af/a6c3U+b7B7Csg6lYLOWLFRNOtiIXN1tZ8FUCEkndMwNLTpabr6s1ClwP
qwcWhoev2hGl2aZCDN7gjcX63iyoZ09Xb5kqkdJ06aMXllDzEoC+d/GDnRwGq3qS
9NfI6vd5WcqjOnsNxN2SjykvXSYbWJW6zjqX7unhuSyIoxJ8uQQr6zIZj5ZV5zaZ
+QcVxOCVAGfIxwjxe5KIktRScjDNOY29HNK+FtJDqW/t3nQt1xvq2tSDAcIDlQ1X
nQ4q2tNVU2bJEUyFc8EEjBWV/bvTSCUkJEVJH1dV7Rt2FY1NQRwogc7kBQtetE/y
jBu6HWl6EhfdpFtFY3BPBkq78GXFag==
=mEDf
-----END PGP SIGNATURE-----

--ZRyEpB+iJ+qUx0kp--

--===============6600274628597735340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6600274628597735340==--
