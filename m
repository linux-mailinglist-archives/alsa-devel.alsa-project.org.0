Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 684614329C2
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Oct 2021 00:27:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E930916B9;
	Tue, 19 Oct 2021 00:26:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E930916B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634596028;
	bh=w8cgwrE/+/pObcg/QPe26ZBC4cp9Pl9uoVsPbOq4LIY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tABn4oCvm54HLd1zPxekN8FnEVnD+lhN1tAegKvbGbIpyg1H4/WjoUZVRfBsPyphX
	 daB9hWENWfmsejl58cCvzhGRTP8Qnoh20UMKElKhuDInY8/VoMbzKODzcDRweT+KxI
	 aodzNbl1p3ptJwp0yMs2BBeQPEyhkyQL7B1W76AY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6636AF801DB;
	Tue, 19 Oct 2021 00:25:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E8DEF80253; Tue, 19 Oct 2021 00:25:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FB56F80217
 for <alsa-devel@alsa-project.org>; Tue, 19 Oct 2021 00:25:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FB56F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Nu8/vp6H"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0BECC60F57;
 Mon, 18 Oct 2021 22:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634595936;
 bh=w8cgwrE/+/pObcg/QPe26ZBC4cp9Pl9uoVsPbOq4LIY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Nu8/vp6HLXOb+dTXQ7zxGMEIeRc88rDYkVnXvILYf2w/6AW0QNiHiNhl/jBnGPuIY
 kWTk4KRfq+1XYHJ1LNY+nvO0R9Wwr3HOk5xe1/VVjjEIVT+s01dphqh7BdbbmL2i7I
 fwVBdGfQaftP2O6QnmD5TPH5ZYVugu0wdEi4cQVgoZU+jVUNRilOKkYMJi4l8nLODh
 sdjRg2aVsPJv26Us2WDMJExq76sCS91vp0pnOFeinniRntbcjkHkAv3VYXPd17r4z/
 6CbvlGkI9UE6wvhSwbVq9NcXjUIL93a9akn79ucOilSbtuFdQc1/iivcHPdwChjV2p
 REudjYstPIxDw==
Date: Mon, 18 Oct 2021 23:25:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v2 4/4] ASoC: Intel: Skylake: Use NHLT API to search for
 blob
Message-ID: <YW30XcMJ4Cme9t/t@sirena.org.uk>
References: <20211018144054.286268-1-cezary.rojewski@intel.com>
 <20211018144054.286268-5-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="jtfDDME5DK7N9+xh"
Content-Disposition: inline
In-Reply-To: <20211018144054.286268-5-cezary.rojewski@intel.com>
X-Cookie: I program, therefore I am.
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 tiwai@suse.com, hdegoede@redhat.com,
 Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
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


--jtfDDME5DK7N9+xh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 18, 2021 at 04:40:54PM +0200, Cezary Rojewski wrote:
> From: Amadeusz S=C5=82awi=C5=84ski <amadeuszx.slawinski@linux.intel.com>
>=20
> With NHLT enriched with new search functions, remove local code in
> favour of them. This also fixes broken behaviour: search should be based
> on significant bits count rather than container size.

Acked-by: Mark Brown <broonie@kernel.org>

--jtfDDME5DK7N9+xh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFt9F0ACgkQJNaLcl1U
h9CGbAf/dtxaBcvy60y/gLV7R7nOHSgmDGYJBQ77LXKn+DPniwIqT3Q5JiOnp9ER
YJph1TjlXh5yUG4VORs/r5pSlq8rvD2V+gMuOjeOR4FGciZ9K/dpqV/5lrxm2jbV
zs0fkLXqrvoSHjhCzgzhn6+hvuWSgfuY1Y3jyFtcDB+i33cH2zcFyiE/+mLybjr3
c+Vsc47sHeKbcmwQ+qRucCmiLhtlwqaO2bxvNnai1a5NOFSs8fL0HSMHgtZWAfwp
XiY6s/WHZi4wk7l3nFFHtrX9Wk+tkg0wuxaEhGWrP3yOzmnAp/m0OqlItNiJ4lgu
UD/9Pd0KrCsNZ1P09Mbkmz7ta7AT6A==
=Bprb
-----END PGP SIGNATURE-----

--jtfDDME5DK7N9+xh--
