Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F41B711807E
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 07:32:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89F491663;
	Tue, 10 Dec 2019 07:31:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89F491663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575959554;
	bh=YEJsJ5mFnAZ6hPyP+liB8B6Vd8xKoAVQsK2Q79EHDAo=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s8T8mJqO3t/e79yxakZG3KbfMfJHDSrwqJvWgLTpRhrvz4wNSstFcsVNpHQQ5WFKk
	 QupnzzIzi6rm8vJK/746NBY+FDTfLt4YlEuuESgB3y9gIvdmwjEfXfaIMMDFo5b2kt
	 7uU9fx2QDlLtGrfrcDD5TMQ9qZx7U9QzxAQnT4qQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A4D7F80269;
	Tue, 10 Dec 2019 07:28:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D08ADF80234; Mon,  9 Dec 2019 21:47:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 1AE3FF800C4
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 21:47:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AE3FF800C4
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E147A328;
 Mon,  9 Dec 2019 12:47:37 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5E6833F718;
 Mon,  9 Dec 2019 12:47:37 -0800 (PST)
Date: Mon, 9 Dec 2019 20:47:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <20191209204735.GK5483@sirena.org.uk>
References: <1575600535-26877-1-git-send-email-skomatineni@nvidia.com>
 <1575600535-26877-10-git-send-email-skomatineni@nvidia.com>
 <20191209164027.GG5483@sirena.org.uk>
 <7fe879fd-dae3-1e64-1031-cd9f00e31552@gmail.com>
MIME-Version: 1.0
In-Reply-To: <7fe879fd-dae3-1e64-1031-cd9f00e31552@gmail.com>
X-Cookie: We read to say that we have read.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 10 Dec 2019 07:28:27 +0100
Cc: mark.rutland@arm.com, alsa-devel@alsa-project.org, pgaikwad@nvidia.com,
 lgirdwood@gmail.com, spujar@nvidia.com, mperttunen@nvidia.com,
 thierry.reding@gmail.com, josephl@nvidia.com, linux-clk@vger.kernel.org,
 mmaddireddy@nvidia.com, daniel.lezcano@linaro.org, krzk@kernel.org,
 jonathanh@nvidia.com, mturquette@baylibre.com, devicetree@vger.kernel.org,
 arnd@arndb.de, markz@nvidia.com, alexios.zavras@intel.com, robh+dt@kernel.org,
 tiwai@suse.com, linux-tegra@vger.kernel.org, horms+renesas@verge.net.au,
 tglx@linutronix.de, allison@lohutok.net, sboyd@kernel.org,
 gregkh@linuxfoundation.org, pdeschrijver@nvidia.com,
 linux-kernel@vger.kernel.org, vidyas@nvidia.com, Jisheng.Zhang@synaptics.com,
 Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: Re: [alsa-devel] [PATCH v3 09/15] ASoC: tegra: Add fallback for
	audio mclk
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
Content-Type: multipart/mixed; boundary="===============3939800177004486835=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3939800177004486835==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LQ77YLfPrO/qF/pM"
Content-Disposition: inline


--LQ77YLfPrO/qF/pM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 09, 2019 at 11:31:59PM +0300, Dmitry Osipenko wrote:
> 09.12.2019 19:40, Mark Brown =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

> > Why would this need to be a stable fix?  Presumably people with stable
> > kernels are using the old device tree anyway?

> At least Rob Herring is asking to maintain backwards compatibility
> because some ditros are using newer device-trees with stable kernels.

You're talking about forwards compatibility not backwards here.  Are
those distros actually using LTS kernels?

> I'm personally also tending to use the newer DTB with older kernel
> version whenever there is a need to check something using stable kernel.
> Perhaps losing sound is not very important, but will be nicer if that
> doesn't happen.

That really does sound like a "you broke it, you get all the pieces"
situation TBH...  I'd be a lot more comfortable if the stable kernels
were sticking to bugfix only though I do appreciate that they're not
really that any more.

--LQ77YLfPrO/qF/pM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl3usucACgkQJNaLcl1U
h9DLZgf/bl+y6tN1f9+6Q5i4PkGjVAppOzDxi0mDZ6TrvcSLsNfAhK9+1IH7w0+x
F90tauu6Flsm9/TnoDK5Csuotm+nKlkXidXNL5qfSzW4azrXes5gdOrwpicKOnEG
7T92jLjHOCPaANNqKrtX+29qAamyxmKOCW/8AKH8SNjerkCDZfZks3yjqilm4i4A
6jwUUAi9ij8TvZlSGteUlqfmib7FdxodH0Gud2q3lYFUKWrKpGnPh823iHtTpiKK
EGDYhbcuS1BeEP6dB/7baejQjkrEjpz7YslmD2KjGlUWIRVEpKPqU/SY63e7mChB
UDCefmC858Tzlkyi7AFFmjnFrTfrMQ==
=IA00
-----END PGP SIGNATURE-----

--LQ77YLfPrO/qF/pM--

--===============3939800177004486835==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3939800177004486835==--
