Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1011414312B
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2020 18:57:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 915191663;
	Mon, 20 Jan 2020 18:56:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 915191663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579543066;
	bh=poZIQDHfX1kCwrWK+YjD/Af6zf58/TATZyGNnQFBbB0=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FEnOZwZc1R0feMSQFOyZbKp/dQ8XSuiEinorjDlZXbYNUyKvjJr4SM4mhYyQMZO2Y
	 Hd9UKF2+Y5K/xnpdkHgDa/SwNekylHVIwg7j7an/meCtaDmiKsCFVGfLvJLOzyXMCs
	 sD6xsf8OvXE+4b16Yr00+xu8OOOfqzpaQg8tJi8E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EB52F80248;
	Mon, 20 Jan 2020 18:56:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97D9DF80245; Mon, 20 Jan 2020 18:56:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 RCVD_IN_DNSWL_BLOCKED, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 03BA4F800C6
 for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2020 18:55:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03BA4F800C6
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F30031B;
 Mon, 20 Jan 2020 09:55:56 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E7343F68E;
 Mon, 20 Jan 2020 09:55:55 -0800 (PST)
Date: Mon, 20 Jan 2020 17:55:54 +0000
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Message-ID: <20200120175554.GK6852@sirena.org.uk>
References: <20200120160801.53089-1-andriy.shevchenko@linux.intel.com>
 <20200120160801.53089-10-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20200120160801.53089-10-andriy.shevchenko@linux.intel.com>
X-Cookie: I invented skydiving in 1989!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 x86@kernel.org, Jie Yang <yang.jie@linux.intel.com>,
 linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [alsa-devel] [PATCH v2 9/9] ASoC: Intel: Switch DMI table match
 to a test of variable
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
Content-Type: multipart/mixed; boundary="===============0205671191967951226=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0205671191967951226==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ucgz5Oc/kKURWzXs"
Content-Disposition: inline


--Ucgz5Oc/kKURWzXs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 20, 2020 at 06:08:01PM +0200, Andy Shevchenko wrote:
> Since we have a common x86 quirk that provides an exported variable,
> use it instead of local DMI table match.

Acked-by: Mark Brown <broonie@kernel.org>

> -	if (cht_machine_id == CHT_SURFACE_MACH)
> -		return &cht_surface_mach;
> -	else
> -		return mach;
> +	return x86_microsoft_surface_3_machine ? &cht_surface_mach : arg;

but if you're respinning this please replace this with a normal
conditional statement to improve legibility.

--Ucgz5Oc/kKURWzXs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4l6akACgkQJNaLcl1U
h9CSpgf+MMjb+D55JRRorEe3BQ4M1I3cFOs+Bj/gzwORglvmHGKTGAvV4lt9Qz3Y
7mOitkpYtKoUpXSAr9xlxfMdYQvEGex599+4KCS76A1gdAjcIOwejaJcq8N88Lnw
s2kogJgt5nteihn7spBaT2scBUCkhwF25jCTjfFDVVgk6vTANDjja0sLL13rg2Rl
0a6fXh5ZSVgmi9ckouFC8b1K2YLBJ0kwSBtONXBvWfttQG8taOfwdNk363e8simL
gR67f8gexPh7rjX3f77QMdlmKx9UPWoeh6IkFVL3LOwJNM8j42mwipTK29++JYaf
G2s1Eo7nbPCkXGnwWzwr5ANfbhqzog==
=KRvr
-----END PGP SIGNATURE-----

--Ucgz5Oc/kKURWzXs--

--===============0205671191967951226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0205671191967951226==--
