Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 593EC15A624
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Feb 2020 11:19:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6B461683;
	Wed, 12 Feb 2020 11:18:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6B461683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581502780;
	bh=9wbNfbQjvs4iX4Nti4//3zzqhpVDSyIQzBXVnNjkfvc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L0UwD7gmZrhlh7yIOsNcEXQbDOuNflqJzLX7zMibFOvu27QBxru+a4krO87OxkrdA
	 O5hOtxVjkYSAJjiNWWWFlyqJmAa5NKkEM6YNBIlTnRPZg14KFVRJYsyxYZk9BLUfma
	 9IJ3MXOOFV94z/XNl2Opsba1yv6jtzdflx/bykZM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E47CF8019B;
	Wed, 12 Feb 2020 11:18:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B5FDF8014F; Wed, 12 Feb 2020 11:18:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id B72FFF800F0
 for <alsa-devel@alsa-project.org>; Wed, 12 Feb 2020 11:18:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B72FFF800F0
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98DE430E;
 Wed, 12 Feb 2020 02:18:42 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1ABC23F68F;
 Wed, 12 Feb 2020 02:18:41 -0800 (PST)
Date: Wed, 12 Feb 2020 10:18:40 +0000
From: Mark Brown <broonie@kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Message-ID: <20200212101840.GB4028@sirena.org.uk>
References: <1654227.8mz0SueHsU@kreacher>
 <197693303.hiACyxC3Vm@kreacher>
MIME-Version: 1.0
In-Reply-To: <197693303.hiACyxC3Vm@kreacher>
X-Cookie: Violence is molding.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Linux PM <linux-pm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Amit Kucheria <amit.kucheria@linaro.org>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [alsa-devel] [PATCH 24/28] sound: Call cpu_latency_qos_*()
 instead of pm_qos_*()
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
Content-Type: multipart/mixed; boundary="===============0885771113982179717=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0885771113982179717==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hQiwHBbRI9kgIhsi"
Content-Disposition: inline


--hQiwHBbRI9kgIhsi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2020 at 12:34:15AM +0100, Rafael J. Wysocki wrote:
> From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
>=20
> Call cpu_latency_qos_add/update/remove_request() and
> cpu_latency_qos_request_active() instead of
> pm_qos_add/update/remove_request() and pm_qos_request_active(),
> respectively, because the latter are going to be dropped.

Acked-by: Mark Brown <broonie@kernel.org>

--hQiwHBbRI9kgIhsi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5D0P8ACgkQJNaLcl1U
h9CgHgf/de8VX0qZLzWqsoXRYFv/Ub+0hQ+gIGqbmNRetv4BnJtPs/r5iHjph/Mf
HaeVov3QuSDOIJD4LteXPJDp1G1uZ3RBWRL3AkyZXyf35rHj6+U1Oz1cNfaWLPHv
pCO1L3RWlRgTUj/YNaqcI4tK0IYqFF4rXlk9cnVENJHL/vpQkxn8jwLruqQWt3Og
sPIrICP+U+suiVp4Hv2k98QP4Vdwm3AHBMsn0vA+O/XL7PGHY6sAvx3a9wKm9zo/
bpfcwY0n6WPYHCV/8aZNhHAD1A+VYeTN7kzcSO1Dtq1k393wG99w4ZKX04f/5HJ3
q3W/2Zg9vOog8DmwveUAYD2Faa5/nw==
=BiO6
-----END PGP SIGNATURE-----

--hQiwHBbRI9kgIhsi--

--===============0885771113982179717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0885771113982179717==--
