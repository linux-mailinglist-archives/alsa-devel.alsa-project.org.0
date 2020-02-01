Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D22D14FD02
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Feb 2020 13:03:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 042F915E2;
	Sun,  2 Feb 2020 13:02:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 042F915E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580644983;
	bh=IT6RmFpHr0X40hra8X/1Xfk+YctZBX82t6fldmn2XdU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c3Nw7imm/Ga7xTdwNsHmbg6ogJ5qMbYkvOwLQb+b2US4Q/3x6rRd4O+oUm9C/yJNz
	 lGnNdaEPftIzHE4zdqB4qu3N+cRA+ZBjQt2qcdvS6NBWEgYd1voQlEg8lz4cQayhpb
	 T9AmJ42ContYHwQVx+aXYv4B8qnuub93ZdefBt+A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3450F8011D;
	Sun,  2 Feb 2020 13:00:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18874F801DB; Sun,  2 Feb 2020 13:00:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=DATE_IN_PAST_24_48, DKIM_SIGNED,
 DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32465F8011D
 for <alsa-devel@alsa-project.org>; Sun,  2 Feb 2020 13:00:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32465F8011D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="j2L+e5NW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lPzWLn9eAfmZaZgtVXbLGbwWmlBqlL7DYMSG6vEQjls=; b=j2L+e5NWwaUMC1fJqOVZJeRG8
 XVGp3fN6jeeunuFTJSB9WS2gzfhB8Gbv+c0gkve1Wt1jr0168A+4s48YFgWBwaMBsau1tHQ0vJr7b
 ekSgPubB5dwhee3telxcBpJwTaufw8PLUnWclHshCCBDYId+if/b4myzi4nBTvVNdjs6Q=;
Received: from [151.216.144.116] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iyDvT-0006pl-Dn; Sun, 02 Feb 2020 12:00:31 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id A94DED00AD7; Sat,  1 Feb 2020 11:03:58 +0000 (GMT)
Date: Sat, 1 Feb 2020 11:03:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Prashant Malani <pmalani@chromium.org>
Message-ID: <20200201110358.GR3897@sirena.org.uk>
References: <20200130203106.201894-1-pmalani@chromium.org>
 <20200130203106.201894-12-pmalani@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20200130203106.201894-12-pmalani@chromium.org>
X-Cookie: Programming is an unnatural act.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Guenter Roeck <groeck@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Benson Leung <bleung@chromium.org>, Cheng-Yi Chiang <cychiang@chromium.org>
Subject: Re: [alsa-devel] [PATCH 11/17] ASoC: cros_ec_codec: Use
	cros_ec_send_cmd_msg()
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
Content-Type: multipart/mixed; boundary="===============2829355952562405156=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============2829355952562405156==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mYQNNDjzvANyiJW1"
Content-Disposition: inline


--mYQNNDjzvANyiJW1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 30, 2020 at 12:30:56PM -0800, Prashant Malani wrote:
> Replace send_ec_host_command() with cros_ec_send_cmd_msg() which does
> the same thing, but is defined in a common location in platform/chrome
> and exposed for other modules to use. This allows us to remove
> send_ec_host_command() entirely.

I only have this patch, I've nothing else from the series or a
cover letter.  What's the story with dependencies and so on?

--mYQNNDjzvANyiJW1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl41WxkACgkQJNaLcl1U
h9CH4gf/QSLdGaGwrm8clz1CuyNmPEKvX4LsDa9tkoPrV22OkRCgy31n3b+n4x3S
9KJtgvF1lFaFdo9Wprt0h8mTSBHlChsmiC8pe0n6qFOS6v7VcjRmY0boiO6W9nz2
lO9C1ZI5tlRXX8ipBnJiugQDn/7zanjYSm1O1wZyxJt1dWuY/KqTDIbZput0vmAS
Gbeq/152zVWRCjjLMteZ+2O2GYiasRvriSsEu9rnQzO1+6pbpF897W8EgHhtA3kn
h92YKhAv1UYVkWhV6JBjhv9yfmaMymr1UQ6x6yVsr4Ioppx7i8+a7wSY8AT80ra2
pdXC0uvO4dIp8fE01StcLOYZQ/lZAQ==
=kCyu
-----END PGP SIGNATURE-----

--mYQNNDjzvANyiJW1--

--===============2829355952562405156==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============2829355952562405156==--
