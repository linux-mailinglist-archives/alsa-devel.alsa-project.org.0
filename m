Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63959158243
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 19:27:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE9871671;
	Mon, 10 Feb 2020 19:27:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE9871671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581359278;
	bh=U0abxICQZUs2tu+aWYmAGE6vP6C8PGWg2mPVvZV+QpQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jA3NPB9nNmj73wTirKBIj7NthlNitYgMdkmJyBpfBFvr9G26MYrzyrvd/hxBg6cn1
	 uBbYbNpyEh2N85Q/jukUdDEpDd7M1rlCccQsjKmqNJb4vnnJKktZvA+UhMpMWA1uVz
	 rIi1Mf1iUOvRZr0YH79Kzy1OJQ00wXKUwkqam0a4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D42C4F800FD;
	Mon, 10 Feb 2020 19:26:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8823F80157; Mon, 10 Feb 2020 19:26:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 3017EF80118
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 19:26:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3017EF80118
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 099E01FB;
 Mon, 10 Feb 2020 10:26:11 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8337A3F68F;
 Mon, 10 Feb 2020 10:26:10 -0800 (PST)
Date: Mon, 10 Feb 2020 18:26:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Adam Serbinski <adam@serbinski.com>
Message-ID: <20200210182609.GA14166@sirena.org.uk>
References: <20200207205013.12274-1-adam@serbinski.com>
 <20200209154748.3015-1-adam@serbinski.com>
 <20200209154748.3015-9-adam@serbinski.com>
 <20200210133636.GJ7685@sirena.org.uk>
 <18057b47c76d350f8380f277713e0936@serbinski.com>
MIME-Version: 1.0
In-Reply-To: <18057b47c76d350f8380f277713e0936@serbinski.com>
X-Cookie: No lifeguard on duty.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, Patrick Lai <plai@codeaurora.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH v2 8/8] ASoC: qcom: apq8096: add kcontrols
	to set PCM rate
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
Content-Type: multipart/mixed; boundary="===============4195777325641491914=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4195777325641491914==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u3/rZRmxL6MmkK24"
Content-Disposition: inline


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 10, 2020 at 10:45:16AM -0500, Adam Serbinski wrote:
> On 2020-02-10 08:36, Mark Brown wrote:

> > This would seem like an excellent thing to put in the driver for the
> > baseband or bluetooth.

> The value that must be set to this control is not available to the bluetooth
> driver. It originates from the bluetooth stack in userspace, typically
> either blueZ or fluoride, as a result of a negotiation between the two
> devices participating in the HFP call.

To repeat my comment on another patch in the series there should still
be some representation of the DAI for this device in the kernel.

--u3/rZRmxL6MmkK24
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5BoEAACgkQJNaLcl1U
h9Dt3gf/bFSOu6V+qzsiaesbSxDO9219Hy4V2hYSQ1z8vybvLiHC/y+aBPL2xMkR
UfIpywFkr/Z8rfeh9AgWE2DekjHGzhuSiGL6bIUL/rJby4SFpqivGd0CXIm9+Otl
cqW1Z+brf3N1dWwqlgV8SXdZP3KqS/6xPhIPOVHgU+2rEcpK6zA/E11pMzsxDx0Z
IP42k+mNUvpjn8tDN9XCRXoLsRViBTcWu8bnQ7LhpgmVVeCuJiFzm9yYcRuvuiI9
1pBk+lu+M1OSfymucb34ZroCtsdqUj3A0nN5Dgg80d/Ju/6zuYINwHwXqlI6Xqp8
yU//EGeDtJIQdteOB1q30MgKqRKKpQ==
=cdIZ
-----END PGP SIGNATURE-----

--u3/rZRmxL6MmkK24--

--===============4195777325641491914==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4195777325641491914==--
