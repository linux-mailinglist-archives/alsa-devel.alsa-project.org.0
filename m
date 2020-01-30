Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAFE14DB5C
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jan 2020 14:12:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4A00166C;
	Thu, 30 Jan 2020 14:11:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4A00166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580389951;
	bh=m8uQLODF01WvRmwQJdz5FHGPWMWottHV1fMU40ygcAw=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M535Qlfmpmk1o6qJ8uXTvlwUtHG9tnsquJWrrjeYUVBAkdLkcTURtJy52C6glWuSL
	 UFXCceQdDoYcT+w/6IYqHzB68Tx3HEgqrTkCkSaVoz1b6q40NCvKqW/uuisnzcT+jJ
	 6RG4uTM9k7dVf+KdVrsMP2dIA+MD2feipIZIH8hU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8B40F80150;
	Thu, 30 Jan 2020 14:10:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73A24F80082; Thu, 30 Jan 2020 14:10:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 8D68EF80082
 for <alsa-devel@alsa-project.org>; Thu, 30 Jan 2020 14:10:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D68EF80082
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F18A328;
 Thu, 30 Jan 2020 05:10:43 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB3743F68E;
 Thu, 30 Jan 2020 05:10:42 -0800 (PST)
Date: Thu, 30 Jan 2020 13:10:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Message-ID: <20200130131039.GC6682@sirena.org.uk>
References: <0e0cd260e39ad293edb881da1c565510@codethink.co.uk>
 <507dcd5a-672b-61ac-aa7f-af5ff01accff@codethink.co.uk>
 <a2744ea0-cf6d-d083-75e6-853746195001@gmail.com>
 <28cafc56-095b-68c6-638d-270608a2983f@codethink.co.uk>
 <3d8544be-af20-f382-85fd-32183365267b@nvidia.com>
 <1b3c2af4-510e-306c-749a-efffc994b20a@gmail.com>
 <20200128121315.GD4689@sirena.org.uk>
 <4b90efd2-5d0c-84df-961d-80cee288e0d4@nvidia.com>
 <586ea2b9-c204-2bd1-f8e2-875e0974e42d@nvidia.com>
 <fe002ec7-ae6e-f770-b82a-49237e0b29c6@codethink.co.uk>
MIME-Version: 1.0
In-Reply-To: <fe002ec7-ae6e-f770-b82a-49237e0b29c6@codethink.co.uk>
X-Cookie: Positively no smoking.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Edward Cragg <edward.cragg@codethink.co.uk>, linux-tegra@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>, Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [alsa-devel] [Linux-kernel] [PATCH v5 2/7] ASoC: tegra: Allow
 24bit and 32bit samples
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
Content-Type: multipart/mixed; boundary="===============1574530699468214941=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1574530699468214941==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rQ2U398070+RC21q"
Content-Disposition: inline


--rQ2U398070+RC21q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 30, 2020 at 08:17:37AM +0000, Ben Dooks wrote:
> On 29/01/2020 14:33, Jon Hunter wrote:

> > controller. Applying these patches it is not distorted but now I am
> > observing the clocking issue Ben reported and so the tone is not quite
> > right.

> I thought they had been applied? I probably dragged them back in when
> putting in the support for the test channel on the colibri.

There were review comments from Jon on patch 6 that you never responded
to.

--rQ2U398070+RC21q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4y1c8ACgkQJNaLcl1U
h9An+gf/cZ7dob6cuhVCdFlZUIMNYEci1qgBuRj3VS/Ofty278mI1D2x7w09IZwh
NZJE66Dw7Y3oCLNutN0zHQ+ODU5GQERW8fXImtH4MVzk4OVkHoMtXpjehbap1e0N
e47IJSIFpcM3VC8WpB1isSTzgxTD3weHTl2uGJK8AqicSOdD4fIPj7nh+8pOVAhU
C5pvIO028Qj8pkyKIR3r2Y9Pw3hbWuHyo6Luur5wm5EX0SGDvx2YQwltfoWstMP6
Uw6CA9O+u3AzfgqEc8+Wp09Xa9Byg9SaoY+0pOaX+A4LlREbO8G5pL/rkiPM5bjN
Z+CXymSuA5tizCUQgckTE3zE9gy0sA==
=EazR
-----END PGP SIGNATURE-----

--rQ2U398070+RC21q--

--===============1574530699468214941==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1574530699468214941==--
