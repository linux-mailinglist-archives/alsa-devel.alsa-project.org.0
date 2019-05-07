Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEDC157E1
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 05:06:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7394417A8;
	Tue,  7 May 2019 05:06:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7394417A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557198414;
	bh=RH4YyEJtzxAAxFtwxBCmS/JKXO9i0G+hB107ezA8hKU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hv1mhL8+vlQjZsNL8T06fMnbtaUfpuZ80bQ/HGokDNdJeG1NrKDjukc7Thy0oauKl
	 fNtIEZhQemobCv+e2/b4X5TpYpOxIzQZyY+0GAhetw+Yno78lCCZ94ibI4qxVHHc4u
	 ow7dHyHApRlDANPYDVAuWPwdkpgSY3BYa9dsu1cM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91E3DF89674;
	Tue,  7 May 2019 05:05:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8355F89673; Tue,  7 May 2019 05:05:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2182CF80726
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 05:04:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2182CF80726
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="TF3fhc8h"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A4fjdilV2U4r4SDhjP/jkuD1DrMw8DoZbLCmZOJwhc0=; b=TF3fhc8hbMtJOEtZquchPsQv1
 wSToCUMeqsPfveNOvLSe8uEr71vBbKWcITRPQmIwMn8OEMTHMpiTf3b3HGMeRKtLE6u7w8abrYrlL
 yvCMHH/KDS17vDzvRO+4LkvFMopGauUJ/L3V8r8xuVHer0CazcdBI+qC6Fx5c1B4F+78A=;
Received: from [2001:268:c0e6:658d:8f3d:d90b:c4e4:2fdf]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hNqPX-0003YM-MB; Tue, 07 May 2019 03:04:56 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 7EF6A44000C; Tue,  7 May 2019 04:04:46 +0100 (BST)
Date: Tue, 7 May 2019 12:04:46 +0900
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190507030446.GD14916@sirena.org.uk>
References: <20190430230934.4321-1-pierre-louis.bossart@linux.intel.com>
 <20190503054047.GB14916@sirena.org.uk>
 <6ac56436-5ce1-d977-45ef-f305f77bfe01@linux.intel.com>
 <20190506035133.GI14916@sirena.org.uk>
 <cf4cf0ca-b11d-48ff-8e23-fd2e308ec3af@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <cf4cf0ca-b11d-48ff-8e23-fd2e308ec3af@linux.intel.com>
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH 00/19] ASoC: SOF: improvements for ABI
 checks and Intel code
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
Content-Type: multipart/mixed; boundary="===============8020003008254999319=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8020003008254999319==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4zKt6bo/V7G+vDr7"
Content-Disposition: inline


--4zKt6bo/V7G+vDr7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 06, 2019 at 09:59:24AM -0500, Pierre-Louis Bossart wrote:
> On 5/5/19 10:51 PM, Mark Brown wrote:

> > The last point there is that Intel only write patches, nobody from Intel
> > is reviewing other people's patches especially in areas of the code like
> > DPCM which are complex, fragile and where Intel is by far the most
> > active user.

> It's a valid point, and for now we indeed only check for non-regressions and
> provide point solutions without looking at the bigger picture. We have a
> couple of people ramping up (Ranjani, Libin, Guennadi, Jaska) and hopefully
> at some point we'll be able to review and improve.

Even just testing (rather than reviewing, though obviously reviewing
would be good!) patches off the list would be very helpful and is close
to the regression testing stuff you're already doing.

--4zKt6bo/V7G+vDr7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzQ9c0ACgkQJNaLcl1U
h9DqnQf7BbIANJ8L8hITt30Bp0GVGsM7lzTpSl+yY2Uk3xJZQNC4VivJQQ6SY8b7
bF8wOqXGrsmuhTN0ToZbSSbwKXJHOMEdNNKNSz+qAf1SU/JdjCJ98uykimrhWlXu
d9SlAyXInUmFSpion+/hVYhQJmSYmOzIcAQSM2ISNUdwj2uNEIG0CM7Op9J2MmBb
g+B0ppysb/qR0kRSEFtwc16FejnXfA7YRQcPLwNvg7Rkb02AgNlZI8PsGE+E8oYI
5UfI7RKBMXLWHIVUgULAfOC8Ew7y9+jUMHsD7TulR+b0vhrWXVnyEYVzF/QsK5KC
cq2NTKtSe3jaBwjVWRMjvWTuyxRWlw==
=trxJ
-----END PGP SIGNATURE-----

--4zKt6bo/V7G+vDr7--

--===============8020003008254999319==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8020003008254999319==--
