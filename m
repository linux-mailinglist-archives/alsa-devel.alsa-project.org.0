Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE18DCF94
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2019 21:50:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C29E385D;
	Fri, 18 Oct 2019 21:49:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C29E385D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571428236;
	bh=hSM6gZgXncLKunio+rpLgWGmjMDMcSmF8ig39kC0Y5s=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fFyHks4sHwkYNEXuQZFyLCISTz3Veir/P49w1pVmkUZjYbWb8KQ8Dp3HLz9P/e+KM
	 XzHI0yKp21p/3DEH0vuw+rdSpeWVaxLjsPKDAZAua8yV/ItG2UAa7+ncg7YYeJc0Eb
	 +9Dw9MZvJq7me/OZ3cGD3DTozcPcgJjWdFBM3Yhk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C21DF8036C;
	Fri, 18 Oct 2019 21:48:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1CE0F80323; Fri, 18 Oct 2019 21:48:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E557F800D0
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 21:48:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E557F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="vqgSJ8L4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s5pr5nWSwgOrimWhLoTQbOK1LZokEqPfut6DM3Da31o=; b=vqgSJ8L4HHMDN10wXyQF5fIaf
 gZUhy9Id4Rq0J3wvTM4skbHZ+Wu9LzjTH5J/Y2W/gAeFvNm8+sA+g3HjRUp+PU6o89NR8KyehCBaQ
 PRiHcmKKLW8CH3/nE/vmIV/2MEeUgBqDegkkc8/2KuYWyysEUasN0VznsFpZeD45IayHU=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iLYEu-0004Wl-Hx; Fri, 18 Oct 2019 19:48:44 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 7A84F2741DEA; Fri, 18 Oct 2019 20:48:43 +0100 (BST)
Date: Fri, 18 Oct 2019 20:48:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20191018194843.GF4828@sirena.co.uk>
References: <1569430624-30505-1-git-send-email-sathya.prakash.m.r@intel.com>
 <42d2eda2-b87d-ada5-122e-cf39c9d22f03@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <42d2eda2-b87d-ada5-122e-cf39c9d22f03@linux.intel.com>
X-Cookie: Smear the road with a runner!!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: sathya.prakash.m.r@intel.com, naveen.m@intel.com,
 alsa-devel@alsa-project.org, tiwai@suse.de
Subject: Re: [alsa-devel] [PATCH v4 0/2] Add CML M/C for RT5682 and RT1011
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
Content-Type: multipart/mixed; boundary="===============1416339617349514184=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============1416339617349514184==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Bqc0IY4JZZt50bUr"
Content-Disposition: inline


--Bqc0IY4JZZt50bUr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2019 at 02:35:00PM -0500, Pierre-Louis Bossart wrote:
> On 9/25/19 11:57 AM, sathya.prakash.m.r@intel.com wrote:

> >   create mode 100644 sound/soc/intel/boards/cml_rt1011_rt5682.c
> >=20
> > --
> > V3 Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> Mark, I noticed this morning while rebasing SOF on your tree that those t=
wo
> patches have not been merged.
> Not sure if they were missed (the 4 versions were confusing), if you didn=
't
> see my Acked-by tag or if there was an objection?

I didn't see your ack as it's here and not on either of the patches.

--Bqc0IY4JZZt50bUr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2qFxoACgkQJNaLcl1U
h9DQPQf/SVhHvvZtaHwcK/pICvuHFpyFHc3vVb8N+Yw4COwbQkWv9JhtU5IUq4Nb
pZZdakPzlm6EhsxCgADLor26i6XR1CCOmwgMEdQ2FEprKbVQnPofnNda7x7MIlFI
DQmzI4rOFK4jZWUzfuWv3w0PEvmCoDUHIbHz6gNw8eAuNHIoSRgI8orRo56MVja8
+jGcnMZT0+0iYnISgTYQYudrk6DQRHklvby4qrk8CsUy7/GrqUYy9mb5Qm3JngAk
Bo0AharwF1H1jfWyHoS5oNJlMPQeHo1hCBbGsghhguBxQYJoBqya81dKDH3z7aOS
yU3kQM+0geBoKJaK6PY2/feJt+kV8Q==
=T4UE
-----END PGP SIGNATURE-----

--Bqc0IY4JZZt50bUr--

--===============1416339617349514184==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============1416339617349514184==--
