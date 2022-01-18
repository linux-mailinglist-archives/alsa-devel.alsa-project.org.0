Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FB6492C06
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jan 2022 18:12:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 518DD2A06;
	Tue, 18 Jan 2022 18:11:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 518DD2A06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642525938;
	bh=9Oiq6z0NhX/tzLVnd+VfU3zd3DlXHBDOmoHeXqvmIik=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jN3DAzv9/YixpgLFotigVTHIgGWar+lFuvGZGx64zt08MtzQrBE1HcacK4DECC88O
	 8KLvvI9P7S3ccF96bh0/fno3XEm0tz3/lodtriUCJCpxqT7ob99kLk0buZYleXDE6T
	 Kqi90D4Vq6sqsVpfTwGH4tZTVzyK6FARo88UDE+s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7774F80246;
	Tue, 18 Jan 2022 18:11:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1167F80100; Tue, 18 Jan 2022 18:11:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B69DEF80100
 for <alsa-devel@alsa-project.org>; Tue, 18 Jan 2022 18:11:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B69DEF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bZSz15dq"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 357F6B816E3;
 Tue, 18 Jan 2022 17:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C70FC340E0;
 Tue, 18 Jan 2022 17:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642525860;
 bh=9Oiq6z0NhX/tzLVnd+VfU3zd3DlXHBDOmoHeXqvmIik=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bZSz15dqy7JLztDN0MIhWS0xoD/DVspHNJtE5Ot0Gf0c8sI9DkdUNhWxSgKcfDdmn
 mi34k1CvopHdAisO9jdc1O495rvsnJn5vFg/Bg6Gi6j2LOH+15p2rjCWiz8l6tY/TJ
 nK73s1klZDmx9/oQOpCm7GCbWOVNs3OOAxtKk1eOgiJlmS6rdvAqXNgCfzRfdBHS+N
 3eTRk91Yhjs1GvNWbN5xA7o0DQAnuUQ5TjHVXzXPKUX4Pp8XeYJK3vWzOkdGMh85bK
 zsqb0Dqk0KRemFCEmQBJGdAtwdUcYmLdgEEeaZAZbpmxJdGRxxaT+XxDzuTxfh/94Y
 2/HNi66h9sN0Q==
Date: Tue, 18 Jan 2022 17:10:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Julian Braha <julianbraha@gmail.com>
Subject: Re: [PATCH] ASoC: amd: fix unmet dependency on GPIOLIB for
 SND_SOC_DMIC
Message-ID: <Yeb0n9AVXeVzBHrT@sirena.org.uk>
References: <20220117041528.59958-1-julianbraha@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="CS/byuj3seJkHJeR"
Content-Disposition: inline
In-Reply-To: <20220117041528.59958-1-julianbraha@gmail.com>
X-Cookie: Do YOU have redeeming social value?
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 AjitKumar.Pandey@amd.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 fazilyildiran@gmail.com, pierre-louis.bossart@linux.intel.com, tiwai@suse.com,
 Vijendar.Mukunda@amd.com, tanureal@opensource.cirrus.com
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


--CS/byuj3seJkHJeR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 16, 2022 at 11:15:28PM -0500, Julian Braha wrote:
> When SND_SOC_AMD_YC_MACH is selected,
> and GPIOLIB is not selected,
> Kbuild gives the following warning:
>=20
> WARNING: unmet direct dependencies detected for SND_SOC_DMIC
>   Depends on [n]: SOUND [=3Dy] && !UML && SND [=3Dy] && SND_SOC [=3Dy] &&=
 GPIOLIB [=3Dn]
>   Selected by [y]:
>   - SND_SOC_AMD_YC_MACH [=3Dy] && SOUND [=3Dy] && !UML && SND [=3Dy] && S=
ND_SOC [=3Dy] && SND_SOC_AMD_ACP6x [=3Dy]

Why is this a good fix and not removing the dependency on gpiolib from
DMIC?  While a DMIC *can* use a GPIO it's not something that's an
intrinsic requirement and it's entirely optional in the code.

--CS/byuj3seJkHJeR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHm9J4ACgkQJNaLcl1U
h9BKuwf/Z8fB1aPDyhYaL2XXxpKPsXuHvvGt5D8UkgJbTPWxZ7fSxW/y7c1N06wl
kxUICkVKHTKHyml19J8jfBoMIiGtOsRj4FupD0ofYuyrBGt6kdMaVg+XVmkwtaDz
MgivjuU+iWO3sX0N490JUfsKlAoZv2RpkrlkD7hHmYIl/ks1a2D695ZJ2vs3unJG
nR8s5zDbf6Zjn6PedxL4uQ7XySc3WJvpcW8Y53ixZLsOiZc4gmA7LBKOXIaWyz4m
bKq9QzokLmwVkB6o7KCVmRj2W9/s0m1X+LMmaAUhgdtBKjX6fyy6TvcFX02RoUUi
LGU7wQKllI2X4535+htPG0KYmDChAg==
=gjhz
-----END PGP SIGNATURE-----

--CS/byuj3seJkHJeR--
