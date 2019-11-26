Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D66F510A324
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Nov 2019 18:10:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66367172F;
	Tue, 26 Nov 2019 18:09:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66367172F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574788232;
	bh=a5qg5oaw7sZv6W39IvhPIvOSd04s2Yqpzase9C5n8Z8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VKAeYEXl3UCiwoV854wfLKeuo+yli5CiY6bFBzgFSahrl5RLqcQ7/XEXBF0QXfl6u
	 cU9ZmxnYT2dwpHn6Te7fLT4zI75+JRtHGTcGHzkua2sXgLrT+I5AU5yC7+ZppgOgPZ
	 rWQXYvRm2P+WvZ2jSU3Ge7EdeAHM60OJ9h9K5sPk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8B4EF801F2;
	Tue, 26 Nov 2019 18:08:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C0A7F80159; Tue, 26 Nov 2019 18:08:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 11270F80109
 for <alsa-devel@alsa-project.org>; Tue, 26 Nov 2019 18:08:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11270F80109
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04A0130E;
 Tue, 26 Nov 2019 09:08:43 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 800953F68E;
 Tue, 26 Nov 2019 09:08:42 -0800 (PST)
Date: Tue, 26 Nov 2019 17:08:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Message-ID: <20191126170841.GC4205@sirena.org.uk>
References: <20191120152406.2744-1-sebastian.reichel@collabora.com>
 <20191120152406.2744-7-sebastian.reichel@collabora.com>
 <AM5PR1001MB0994720A0D615339A978E35C804E0@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <AM5PR1001MB0994E628439F021F97B872D480450@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <AM5PR1001MB0994E628439F021F97B872D480450@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
X-Cookie: Where's SANDY DUNCAN?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "kernel@collabora.com" <kernel@collabora.com>,
 Support Opensource <Support.Opensource@diasemi.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [alsa-devel] [PATCHv2 6/6] ASoC: da7213: Add default clock
	handling
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
Content-Type: multipart/mixed; boundary="===============1300547711371881962=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1300547711371881962==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f+W+jCU1fRNres8c"
Content-Disposition: inline


--f+W+jCU1fRNres8c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 26, 2019 at 04:55:39PM +0000, Adam Thomson wrote:
> On 21 November 2019 21:49, Adam Thomson wrote:
> > On 20 November 2019 15:24, Sebastian Reichel wrote:

> > I've thought more about this and for the scenario where a machine driver
> > controls the PLL through a DAPM widget associated with this codec (like some
> > Intel boards do), then the PLL will be configured once here and then again
> > when the relevant widget is called. I don't think that will matter but I will
> > take a further look just in case this might cause some oddities.

> So I don't see any issues per say with the PLL function being called twice in
> the example I mentioned. However it still feels a bit clunky; You either live
> with it or you have something in the machine driver to call the codec's PLL
> function early doors to prevent the bias_level() code of the codec controlling
> the PLL automatically. Am wondering though if there would be some use in having
> an indicator that simple-card is being used so we can avoid this? I guess we

If we're special casing simple-card we're doing it wrong - there's
nothing stopping any other machine driver behaving in the same way.

--f+W+jCU1fRNres8c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3dXBgACgkQJNaLcl1U
h9CGSAf+LVy+9NSiyoXjsLLoc8cSA/mrUCloLSTGTbZmeYMjFxcMmLGZU83yPOT1
pbOynF8/SzqFJP0ILcAZ4WEAGePxP/6s33wOsw/PTyJcEH7Ito93TSlDurN3VkeS
/2PAlSBjzr9L65Kf5N6RnIeQsMTAVExjD/4wCtAkWFxisxBniStEhpyY/EArqYRq
NC8z+mwcYkwT8J1nzraxN+g9orGfymaB/YIy9eK2Y+nySshJMjeoj9KOlRSnbQup
xm5VspRQrvuxWQtv3sE0NQ91dJRon3pYUK1u8Ay3i9kVkpQmIQQDW9AHfBQXGPqP
+rD5yHvOs4/hcFBOCC/q8/5d7uZ/XQ==
=vlo0
-----END PGP SIGNATURE-----

--f+W+jCU1fRNres8c--

--===============1300547711371881962==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1300547711371881962==--
