Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8833124EE4
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 18:16:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48FC9166B;
	Wed, 18 Dec 2019 18:15:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48FC9166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576689367;
	bh=pGNO1pUxDN3fI36c+eRW+qF01WQ9xGwJcvgobNxBS9I=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BEE0Qika15rc1NETB8JHy5tItA4zYrrBqpTy204VwODA2XLa+bgbhy4t05LfvQGZ+
	 7yUuPidhV1GHn/ji1bThATs9S6tKOvoPzw2aR5cfjDVXXP58QKcyxaQXxRvhT0JgEL
	 OyClFcGK5gLIOHmim8a4eRP5w/16r/2xbaGDig2E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED97FF8022C;
	Wed, 18 Dec 2019 18:14:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32177F8022C; Wed, 18 Dec 2019 18:14:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 85CD3F80096
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 18:14:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85CD3F80096
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64C001FB;
 Wed, 18 Dec 2019 09:14:17 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D67753F67D;
 Wed, 18 Dec 2019 09:14:16 -0800 (PST)
Date: Wed, 18 Dec 2019 17:14:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191218171415.GJ3219@sirena.org.uk>
References: <87r212jqt1.wl-kuninori.morimoto.gx@renesas.com>
 <87o8w6jqrk.wl-kuninori.morimoto.gx@renesas.com>
 <CAFQqKeWWdwCMEO9idW4sANYio3y1ye3Q3okbOEd=zwYrRXDSYg@mail.gmail.com>
 <87eex2jnck.wl-kuninori.morimoto.gx@renesas.com>
 <bc4cef12-0095-e2af-5c91-63b06d815b8c@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <bc4cef12-0095-e2af-5c91-63b06d815b8c@linux.intel.com>
X-Cookie: Power is poison.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, "Sridharan,
 Ranjani" <ranjani.sridharan@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [alsa-devel] [PATCH v2 2/7] ASoC: soc-core: care
 .ignore_suspend for Component suspend
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
Content-Type: multipart/mixed; boundary="===============5065720651829697167=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5065720651829697167==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/qIPZgKzMPM+y5U5"
Content-Disposition: inline


--/qIPZgKzMPM+y5U5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 18, 2019 at 08:54:27AM -0600, Pierre-Louis Bossart wrote:

> Even for dai links, it's not clear to me what .ignore_suspend means.

It means exactly what it says, don't do anything on suspend.

> For Intel machine drivers, the .ignore_suspend flag is used for DMIC links
> which may be used in S0ix/D0ix states. I don't believe this works if there
> are multiple target states, e.g. you would probably want to leave the link
> active in S0ix, but suspend it in S3?

> I think the current .ignore_suspend settings only work with the assumption
> that applications will close all capture streams before going to S3.

These numbered suspend states are a platform specific concept, other
systems will typically just suspend or not suspend.  It sounds like this
feature does not map onto your systems.

--/qIPZgKzMPM+y5U5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl36XmYACgkQJNaLcl1U
h9BRjAf/QoXPWvlk8JPDu2k5OUgXo0cDM4Yb6Z7DonO++UfpNfyHJRhW1IDRvX9/
VYlWEdl2HHL0pFsvrpmPz7/k9F2AP993SjFJs+0U/V4Nds1acD++qKfKw05RxPmO
HdZgrogWbv6Ws9L55MnfDeR1xkwSG+Jxgd4uGp7PpFYE5kUQf+8qOssIo/Dti2iS
JFh2T81D6nnvNsDrCezxa6vvG/Z30zuqo0CGs71MHk5yb7Ap9n42TV6Xa4m24IoY
2+m1m44HlF5EqFZDheUHObi+wpgA+9U0DJq/AfvlLnb7QBgF7O01ahThHTVC2i28
EApNl2MVQwVi9RIWwUZ8foH+VWX8Ow==
=/rfm
-----END PGP SIGNATURE-----

--/qIPZgKzMPM+y5U5--

--===============5065720651829697167==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5065720651829697167==--
