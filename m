Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA08290949
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Oct 2020 18:06:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5061417D5;
	Fri, 16 Oct 2020 18:05:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5061417D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602864383;
	bh=Ffe6HDXtHpxuUBXpAaKhjrBV6CW3hwnNiJR1u1L+7lg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UQ+6r0zVS7zfoyrWn/z6K2TcdHATPUzzlSd1+tkwBeewxwXGmWqphNx4KI0D3z5vG
	 ssqaXmp8kwTwWT5kk9M/Siswf4a65hgzQFEcsiudx6L2YMuh576oitK81lu8jOEqOj
	 fpE36pvdL6wmB3FzGNm0TU1MayMdsKPDkL4yGrMI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33BB2F8020D;
	Fri, 16 Oct 2020 18:04:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B2B1F80217; Fri, 16 Oct 2020 18:04:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C85ACF800B8
 for <alsa-devel@alsa-project.org>; Fri, 16 Oct 2020 18:04:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C85ACF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ooz2CJRu"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6355B207BC;
 Fri, 16 Oct 2020 16:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602864267;
 bh=Ffe6HDXtHpxuUBXpAaKhjrBV6CW3hwnNiJR1u1L+7lg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ooz2CJRus0PH3snemUxma5rxWlndBuHc+TYgZhrm6Knwgr1RDRZpJBsMFKLVeHCun
 LKD6/Tv8iqIsO0Nuv3UXVWJSXsKgPtfMFI9oipQjPXkXkLK6G1A3Sd8jsoWwVOiXLa
 QXxKR8kdj01ck37wT1e6qyLN7Bbxs0tSERS+0jPM=
Date: Fri, 16 Oct 2020 17:04:18 +0100
From: Mark Brown <broonie@kernel.org>
To: matsufan@gmail.com
Subject: Re: [PATCH] ASoC: Intel: boards: Add CML_RT1015 m/c driver
Message-ID: <20201016160418.GF5274@sirena.org.uk>
References: <1602864145-32249-1-git-send-email-keith.tzeng@quantatw.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Zs/RYxT/hKAHzkfQ"
Content-Disposition: inline
In-Reply-To: <1602864145-32249-1-git-send-email-keith.tzeng@quantatw.com>
X-Cookie: Pournelle must die!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org,
 Keith Tzeng <keith.tzeng@quanta.corp-partner.google.com>, mac.chiang@intel.com,
 Keith Tzeng <keith.tzeng@quantatw.com>
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


--Zs/RYxT/hKAHzkfQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 17, 2020 at 12:02:24AM +0800, matsufan@gmail.com wrote:

> +<<<<<<< HEAD
>  obj-$(CONFIG_SND_SOC_INTEL_SOF_CML_RT1011_RT5682_MACH) += snd-soc-cml_rt1011_rt5682.o
> +=======
> +obj-$(CONFIG_SND_SOC_INTEL_SOF_CML_RT1011_RT5682_MACH) += cml_rt1011_rt5682.o
> +obj-$(CONFIG_SND_SOC_INTEL_SOF_CML_RT1015_RT5682_MACH) += cml_rt1015_rt5682.o
> +>>>>>>> 955c356... CHROMIUM: ASoC: Intel: boards: Add CML_RT1015 m/c driver

There's an unresolved conflict here :/

--Zs/RYxT/hKAHzkfQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+JxIEACgkQJNaLcl1U
h9BAmQf8CWfhygcQFiABmlXZ4oNLESD8WkABSN63VC1kLK1JTVCKvyQs61+tqu8s
UivZ0DndNnTljfZSdzm203FiSdpSXq/7cNsQncxTOqdScele/cYyM409vr8vd+VP
bd7aCaPA3xKKSnc7vxs+EotJxD5GTgODm4ALAuSjne73VK1ilUX8vzf8S2KsWy4x
HtJMcDBeJv4kzVAdXBB292WQgjPByDPQWDJeauA7C5Hx8vpKxT/VV2d/0bubVUil
TKdVeHO24zoAM3gXboTeoW3z4iN2Ig+Ap7PRsAbHtrWsclqyyHsWaor4lITPM95K
DSM9jEje8PjlyD+6LOn1Fhq0/gPJWA==
=9+ya
-----END PGP SIGNATURE-----

--Zs/RYxT/hKAHzkfQ--
