Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF74115D7AD
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Feb 2020 13:51:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A957167A;
	Fri, 14 Feb 2020 13:50:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A957167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581684671;
	bh=I+Mij9FPWU4D4lHMlj4OTdbj6LmykjbbKVYi0sIkfHU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g0euv2gzC0vkEtJsoLwRTyPRMRmdLS7aCqUX5LMHbBy7+tr8Q84Fgv+aMbOndPglg
	 UQqprc79FdOanoV+wKcBCnbCkmxR85ZtywSVnbBr6vg3OSNHCEV5NdCI2216iET89+
	 3FWcMc1M5SJvNX4PZrSh8v35fu04pUcI7XcGujZo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86287F80157;
	Fri, 14 Feb 2020 13:49:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 325F3F8014F; Fri, 14 Feb 2020 13:49:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 9CB38F80138
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 13:49:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CB38F80138
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BF1E1FB;
 Fri, 14 Feb 2020 04:49:22 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1E29E3F68F;
 Fri, 14 Feb 2020 04:49:21 -0800 (PST)
Date: Fri, 14 Feb 2020 12:49:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <20200214124920.GH4827@sirena.org.uk>
References: <20200211171645.41990-1-tony@atomide.com>
 <cd46c6ec-80e3-332f-4922-e58a3acbfc61@ti.com>
 <20200212143543.GI64767@atomide.com>
 <346dfd2b-23f8-87e0-6f45-27a5099b1066@ti.com>
MIME-Version: 1.0
In-Reply-To: <346dfd2b-23f8-87e0-6f45-27a5099b1066@ti.com>
X-Cookie: Shipping not included.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Tony Lindgren <tony@atomide.com>,
 linux-kernel@vger.kernel.org, Merlijn Wajer <merlijn@wizzup.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
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
Content-Type: multipart/mixed; boundary="===============8774967020732926033=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8774967020732926033==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bpVaumkpfGNUagdU"
Content-Disposition: inline


--bpVaumkpfGNUagdU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 14, 2020 at 02:41:30PM +0200, Peter Ujfalusi wrote:
> On 12/02/2020 16.35, Tony Lindgren wrote:

> > Oops, that's not good. So should we just keep the old naming if there's
> > only one endpoint?

> That's an option, yes, if we really need extra dummy McBSP DAIs at all,
> again, let's hear from Morimoto-san or Mark.

We really shouldn't need dummy DAIs at all I think, if we do it feels
like there's a problem.  It's quite possible that there is actually a
problem here though...

--bpVaumkpfGNUagdU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5Gl08ACgkQJNaLcl1U
h9AGSgf/WC1rD+oEYoImv2NX+F1kZLeDZ1n+50cMMhVxzUM8Wc/oD6BZAF7BSo5I
Pd0iBQQd9PStwHOvnWEdTzohUmiK/7iRVPKYYYpv47/9g4v4tT7BDe7tNRNolBGR
xYV/sJiD+U0DlpSUOYuwd4xxQVLAcEXUp7SSjvHAoYEiJlZ055K1opwl3avKwYR0
7d2vQr0nQrc9wD49QxxD9fGMhv/o+sVx6rpkayuiOpcE3QRxSJIgxnVdPwlKSjxU
YIe91JG0GI4BGwWy3fi21D4tiMNLIPrwubI91PuPhBFaUkJVSW+8njfpLK+SrHrJ
uaRh/PD/nMhNE7bNAr7JbguqB70QRA==
=s0ru
-----END PGP SIGNATURE-----

--bpVaumkpfGNUagdU--

--===============8774967020732926033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8774967020732926033==--
