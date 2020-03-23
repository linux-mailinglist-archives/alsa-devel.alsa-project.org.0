Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD98218F4C8
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Mar 2020 13:39:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A8F91654;
	Mon, 23 Mar 2020 13:38:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A8F91654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584967157;
	bh=EWcNjWkYYdPBQ2LY6jR0iYDLjzYIuHR7VVHGRNIb8OU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rDiiX2vtbY3L42AXuaTpvZXI8h3dX/4FKAZcYF/7mYXQzGnTvk7f4fnBWFFis3yS+
	 VOyNZKl3YSH68liY1c6sBNVOU/BcjpER2mOsrpb7PvqI/b3/n/G8PP9gQ/KEHDMtPw
	 F1QxdF89cxuK0/3K4zOmSneLerUALurfFrscg1nU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 502B6F800B9;
	Mon, 23 Mar 2020 13:37:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C596F80158; Mon, 23 Mar 2020 13:37:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id A77BFF800F6;
 Mon, 23 Mar 2020 13:37:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A77BFF800F6
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63E651FB;
 Mon, 23 Mar 2020 05:37:26 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D96773F52E;
 Mon, 23 Mar 2020 05:37:25 -0700 (PDT)
Date: Mon, 23 Mar 2020 12:37:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Subject: Re: [PATCH 06/14] ASoC: SOF: add a power status IPC
Message-ID: <20200323123724.GB4948@sirena.org.uk>
References: <20200312144429.17959-1-guennadi.liakhovetski@linux.intel.com>
 <20200312144429.17959-7-guennadi.liakhovetski@linux.intel.com>
 <20200313143956.GJ5528@sirena.org.uk>
 <20200320115203.GA2130@ubuntu>
 <20200320121952.GC3961@sirena.org.uk>
 <20200320132732.GC2130@ubuntu> <20200320150727.GD2130@ubuntu>
 <20200320163948.GD3961@sirena.org.uk>
 <20200323093102.GB16757@ubuntu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="QTprm0S8XgL7H0Dt"
Content-Disposition: inline
In-Reply-To: <20200323093102.GB16757@ubuntu>
X-Cookie: Stay on the trail.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 sound-open-firmware@alsa-project.org
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--QTprm0S8XgL7H0Dt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2020 at 10:31:02AM +0100, Guennadi Liakhovetski wrote:

> Ok, understand, but do you see any problems with this specific use case?=
=20
> Thinking about possible replacements - it isn't a case for a ref-count,=
=20
> because it isn't a get-put scenario. We really just need to count a=20
> specific event - DSP reboots. It can be the case that this counter doesn'=
t=20
> need to be atomic at all. When it is read, the DSP is guaranteed to be up=
=20
> and running - I think. So no race would be possible. I can try to think=
=20
> about this more carefully and maybe make it a normal unprotected counter.=
=20
> But I don't think it has to be protected even better than what these=20
> patches are doing.

I think at the very least it probably needs more documentation in the
code since I don't recall being able to work out what it was supposed to
be doing quickly.

--QTprm0S8XgL7H0Dt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl54rYMACgkQJNaLcl1U
h9CYZAf9GloJoiJLIrOOswsiBlomnI2k5DgpRBQE+GKPVI8iupVwxNIElAP4Hy6e
S0ZB55Z1h7DvaLL8RKoAlvJKDmj9ldf2HE6OhjOKKjtJveVbCdeoakoQtM6LQ54q
EHWFCfK8j1So3Sjh1dmkxBnrNCCZ1e9E67WQNIhXsWVnpBVVmfvaeo7fO144lO3+
ygsJ0q9nVdV2V5LFUFL3Joq8tKEXVQPcGNtjQOp0KHv26IgPh7ZJkRT0y1A29fdd
nH1FnGED5+5PNznm+js3LW65arxQsdCgGEJsdK9nb2wCV0ttbBT1k90eaawykv/r
piI7l/NL2bk/VK/RMaksNpMNoCgEEA==
=tA+u
-----END PGP SIGNATURE-----

--QTprm0S8XgL7H0Dt--
