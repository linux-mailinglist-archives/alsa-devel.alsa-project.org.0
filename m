Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 470C915F774
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Feb 2020 21:07:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCB071678;
	Fri, 14 Feb 2020 21:06:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCB071678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581710846;
	bh=iRcmwDhRYxFoDZ67o6iffxVoBZrnhuM2qVTEm3sDhj4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qJKTjkju5oH5Nf4djy6dOYdFWHkpo7pa2bKS+RqmPRBa97j6t4qG/q2HkCc52KVRf
	 iBrClsfiX9xPMX4d2TPYDZbJyXLLbU2+DZM4TxaXvHm/xyONMKxNMcTYnpUT2b6ZXs
	 kJOfBXzYgAb2RkjMBe1t5C/AWooRAIfhuQdfqIWg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00F7FF8013E;
	Fri, 14 Feb 2020 21:05:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28139F8014F; Fri, 14 Feb 2020 21:05:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 44596F80138
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 21:05:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44596F80138
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7094030E;
 Fri, 14 Feb 2020 12:05:39 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E7C5E3F68F;
 Fri, 14 Feb 2020 12:05:38 -0800 (PST)
Date: Fri, 14 Feb 2020 20:05:37 +0000
From: Mark Brown <broonie@kernel.org>
To: Tony Lindgren <tony@atomide.com>
Message-ID: <20200214200537.GR4827@sirena.org.uk>
References: <20200211171645.41990-1-tony@atomide.com>
 <cd46c6ec-80e3-332f-4922-e58a3acbfc61@ti.com>
 <20200212143543.GI64767@atomide.com>
 <346dfd2b-23f8-87e0-6f45-27a5099b1066@ti.com>
 <20200214124920.GH4827@sirena.org.uk>
 <20200214170559.GA64767@atomide.com>
MIME-Version: 1.0
In-Reply-To: <20200214170559.GA64767@atomide.com>
X-Cookie: Shipping not included.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, linux-kernel@vger.kernel.org,
 Merlijn Wajer <merlijn@wizzup.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>,
 "Arthur D ." <spinal.by@gmail.com>, Jarkko Nikula <jarkko.nikula@bitmer.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: ti: Allocate dais dynamically for
 TDM and audio graph card
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
Content-Type: multipart/mixed; boundary="===============7744192754578633784=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7744192754578633784==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jTlsQtO0VwrbBARu"
Content-Disposition: inline


--jTlsQtO0VwrbBARu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 14, 2020 at 09:05:59AM -0800, Tony Lindgren wrote:
> * Mark Brown <broonie@kernel.org> [200214 12:50]:

> > We really shouldn't need dummy DAIs at all I think, if we do it feels
> > like there's a problem.  It's quite possible that there is actually a
> > problem here though...

> It's dummy in the droid4 voice call case as mcbsp is not the clock-master
> and there's nothing to configure for mcbsp.

If the McBSP is doing anything at all it should still be properly
represented with the actual device rather than a dummy otherwise we'll
most likely get confused at some point.  If it's not doing anything then
we shouldn't even need the dummy.  But perhaps I'm confused about this
particular system, I remember some of the OMAP designs were a bit fun.

> But I guess in some cases mcbsp could be the clock-master and then the
> secondary DAI would have ops.

It'd be a bit of an unusual clock design for a phone but yeah.

--jTlsQtO0VwrbBARu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5G/ZAACgkQJNaLcl1U
h9CR+Qf9FPZ/Ad8y5xe0+tkWOFeKHsAJS6dhcJcsAkuHoO9VnHgr8uNfN1Pl6LQh
W2bWc/5F07FYANvhVtVGyj23F2CnzPyewfjG6BGlToQRLZT3HGc0CPLNrnI4vDgb
D+dK9EROqaeuDPppBbdxD0UiURFkB+OGKhIaFjQDhVDlLdr7hBvfPgDdzyilifh9
K5wfAWGUPAjkNRW3IPVAfQZWuCoImOdkVmKTo9cUdxBqB052blAH/Dl6dCAIPXFH
04abRiijYC91F2xNX/XU6XlOWgm2fUCrnmI6K44W71aHyGWPunQd3zhnZpyZXf5K
+vKda5XCIvxFmrVHN4BnbN4qz/Xu0Q==
=q3Lt
-----END PGP SIGNATURE-----

--jTlsQtO0VwrbBARu--

--===============7744192754578633784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7744192754578633784==--
