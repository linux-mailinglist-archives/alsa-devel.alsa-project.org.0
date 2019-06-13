Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE5844B14
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2019 20:49:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E045D16A5;
	Thu, 13 Jun 2019 20:49:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E045D16A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560451792;
	bh=/OQWr3JWAlZd/udHXBS8cE50v34wTY1VavWiQrVem9w=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=csj1wzXbpGqGhQI8rblpaG+25qjr6bD4Ut/mEB5Kgc9lx16vG5Tt6S7DQ0gPDP+gJ
	 o7aF3U0LbbNsIqiCc3BHZdSX4pijnjYevnqvm4AXALB/u6aWL0+YbHSBeb6iHoDdPQ
	 /i1f3UbpR6TNrXsvLIr4aOsGcY0hHzkrI7iWjOjA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C47FF8970F;
	Thu, 13 Jun 2019 20:48:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 605E7F89703; Thu, 13 Jun 2019 20:48:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EFBFAF80791
 for <alsa-devel@alsa-project.org>; Thu, 13 Jun 2019 20:48:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFBFAF80791
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="kLsQPlCL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/ETii9IxxF+nECF16dHD2u1AyyUDqDeA69t663JjuOs=; b=kLsQPlCL5zMqLp9f7+UaBC+TW
 yVZ7sVu0H1O+67ZQ2SL85XEso8N7VX8t4Aqh8IWXQgKNaXrHgwIJMn/Y4h56cqiLsFpNIW44DarZ8
 zU8G9/TYvAJ3mKNyNSLEy6E1GA1Ssqw8/kYUL93JxEntMZ7XZF8TkMBVr/d1Fx2xaxDmI=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hbUlV-0005Q3-TQ; Thu, 13 Jun 2019 18:48:01 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 47AE3440046; Thu, 13 Jun 2019 19:48:01 +0100 (BST)
Date: Thu, 13 Jun 2019 19:48:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190613184801.GV5316@sirena.org.uk>
References: <20190612164726.26768-1-pierre-louis.bossart@linux.intel.com>
 <20190612164726.26768-3-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20190612164726.26768-3-pierre-louis.bossart@linux.intel.com>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH v2 2/3] ASoC: SOF: acpi: add module param
 to disable pm_runtime
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
Content-Type: multipart/mixed; boundary="===============0362548349541301904=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0362548349541301904==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JEhTuUFIcUlI65CC"
Content-Disposition: inline


--JEhTuUFIcUlI65CC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 12, 2019 at 11:47:25AM -0500, Pierre-Louis Bossart wrote:
> Add debug option to disable pm_runtime. This is not intended for
> production devices but is very useful for platform bringup.

I can't immediately find it right now but isn't there some generic way
of doing this in the runtime PM framework?  If not it seems like it'd be
a good thing to add, these can't be the only devices where it'd be
useful.

--JEhTuUFIcUlI65CC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0CmmAACgkQJNaLcl1U
h9DsjQf+LtqUER+EEmHDYsd+yR4kTcoHOm262gYqnkmFSg+EmO0g94yWkvXcTt64
1nSe4v/Adda6CFR2RjQrd5Dab2xSSmVSgqWWTIaINJ3+ZE2oO7zYuLnmbLYSPSk6
wnjKlfefKYm+eCvWFrE1CSdqtNfOPZ0d0sBqV0xMztPlqe6FaXN91fzU3eaXigrD
nwK2dXeCaZho6ne1LbkBoyprWDcjHk6wNICOJKbHDkNVL3KLPsjCTqQMxR1TIqwf
OOsUNZs9ymrTq5/JSP9tqnmjT2x0ko9tMAcwB/6CCAfTOPMO/lD8EUS9WINk+A5T
uwSGciepCLOfs4Mz9PtXpWLgGPnYlQ==
=SpwH
-----END PGP SIGNATURE-----

--JEhTuUFIcUlI65CC--

--===============0362548349541301904==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0362548349541301904==--
