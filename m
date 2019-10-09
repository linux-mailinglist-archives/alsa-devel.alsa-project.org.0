Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DACCCD176C
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Oct 2019 20:15:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E06A167E;
	Wed,  9 Oct 2019 20:15:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E06A167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570644950;
	bh=D3ffsvV03MtO0Ze/Hk4Psy2Bj2sw/2DozX4KyvDJk98=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qysgsn65WpTEIW8YK8I5hsZNThcqZxO+ft1dxajcQJC4eksOXztc8nXbIT2sJLu6s
	 1q2eIOVWykwprPCjKWLCu2jdpbqGXHv5RMTl/RQYBHZ6WHnyTkZsxYW3kUmvCoOGef
	 acpRKn8Rw/yUwPDFGPCT0uCGz7fyVCUQEY+nnUQg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2ABBF802BE;
	Wed,  9 Oct 2019 20:14:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28BB2F802BE; Wed,  9 Oct 2019 20:14:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E192F80113
 for <alsa-devel@alsa-project.org>; Wed,  9 Oct 2019 20:13:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E192F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="S1DJaxJw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Content-Type:MIME-Version:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9GCDJtIMsTCFlPUnu3bJHX0g/WlRqNjC2LMLyLPXw/0=; b=S1DJaxJwEfiC+683KHNJHBDBl
 EFKQCQGpZdSl3mofIvlxv78CcUMthAY7oB4mx/tuQr2/72nJaNPdXLnI0iCMttRGmRaeRdHIDpykM
 i8g45eeh4G5j3nonaSSvAWE8tYgTpTR5zMJl75j3wGgMozihvw/+LLftie+541cqgWVb8=;
Received: from 188.28.184.195.threembb.co.uk ([188.28.184.195]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iIGTG-0005RA-Ep; Wed, 09 Oct 2019 18:13:58 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id BA00CD03ED3; Wed,  9 Oct 2019 19:13:56 +0100 (BST)
Date: Wed, 9 Oct 2019 19:13:56 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org
Message-ID: <20191009181356.GO2036@sirena.org.uk>
MIME-Version: 1.0
X-Cookie: Be careful!  UGLY strikes 9 out of 10!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Takashi Iwai <tiwai@suse.de>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Curtis Malainey <cujomalainey@google.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [ANNOUNCE] 2019 Linux Audio miniconference
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
Content-Type: multipart/mixed; boundary="===============8282415067867866006=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8282415067867866006==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pqRbAPYjtlk7lrMB"
Content-Disposition: inline


--pqRbAPYjtlk7lrMB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

As in previous years we're going to have an audio miniconference so we can
get together and talk through issues, especially design decisions, face to
face.  This year's event will be held on October 31st in Lyon, France,
the day after ELC-E.  This will be held at the Lyon Convention Center (the
ELC-E venue) and will be free of charge to attend, generously
sponsored by Intel.

Thus far for the agenda we have:

 - Use case management enhancements (Curtis)
 - DSP framework integration (Liam?)
 - Soundwire status (Pierre?)
 - Componentisation status/plans (Me)

As with previous years let's pull together an agenda through a mailing
list discussion - if people could reply to this mail with any topics
they'd like to discuss we can take it from there.  Of course if we can
sort things out more quickly via the mailing list that's even better!

If you're planning to attend please fill out the form here:

    https://docs.google.com/forms/d/e/1FAIpQLSd6FV-tWYZ1fHlCmyzQhG98OtYH9W9GX-1dQ88mnLxVRGyPww/viewform?usp=sf_link

This event will be covered by the same code of conduct as ELC-E.

Thanks again to Intel for supporting this event.

Thanks,
Mark

--pqRbAPYjtlk7lrMB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2eI2MACgkQJNaLcl1U
h9D8DAf/f7aTsuLSzz5fmBRIkf2AUdFzD0gkmKafiwB6r+A6YNQgShbwTRAITj0u
x5Wg24HC4Q0Ht6lra4UhVNV4CIEawwHVt2mfv8qXOFhjxeW7ap2fNgfWm+/w7kCm
STeVtreCuQVGIBft+nZmkGchbsu362Lkkmks5BqZEFWAlGu7gto7eTqH8f9iSr0z
4Y4Lwo/imqkubTie6HPHD3FPPpjrdU3fsck+JFGzPn8c3vv+hI9KXgHZPEpTfi8E
5gSGf7tmq9TQ0XH7Hind8q8kWlE9zdx5Ej0R1MMpCUjdnCqqC4EUJiAZ4a9WTPnE
izOgNVgMaLzeyU/c5tX1Q8dsoKaUOQ==
=83Dd
-----END PGP SIGNATURE-----

--pqRbAPYjtlk7lrMB--

--===============8282415067867866006==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8282415067867866006==--
