Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B70521FF032
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 13:03:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5512C1762;
	Thu, 18 Jun 2020 13:03:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5512C1762
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592478237;
	bh=T0ml4vNIA9iwQ8rd38WFt5IPvevTyZHHBCYeXpr3C/s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RbU3NdUhDky2KNkREaQA1vBp+P03A9F7azYY2M3bc382AKwvO+73KzW4pHOEKdb00
	 F/daNrqFkiAJ4OzBcp60jCRB0JoItb4l8c2kYlgNlJqseGr07mQv4lrVbUABOcGaeB
	 i50b1jFlVdJi7onOkeFExscLltG2nIM4chgIgMHA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D044BF800D1;
	Thu, 18 Jun 2020 13:03:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F06FF80162; Thu, 18 Jun 2020 13:03:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9501FF800D1
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 13:03:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9501FF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="K3s6a0Oy"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 32B95204EA;
 Thu, 18 Jun 2020 11:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592478180;
 bh=T0ml4vNIA9iwQ8rd38WFt5IPvevTyZHHBCYeXpr3C/s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K3s6a0OywmvoIatRfxXcvbLw40QFmm4mXNkB2Gf9QFuNQ/3FXjEvQcMC6NmKGN63Z
 YhgFhpYtR3IXV5Q9/GyiiCxJlcyEXAK2azNTZcB4Dqj4Jd6DhvaMC4sIJUJDVtTb7D
 cNJ1wolF6ibWH0wyN98IZk+zZU5WSPcxvQrrqH/c=
Date: Thu, 18 Jun 2020 12:02:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.7 130/388] ASoC: Fix wrong dependency of da7210
 and wm8983
Message-ID: <20200618110258.GD5789@sirena.org.uk>
References: <20200618010805.600873-1-sashal@kernel.org>
 <20200618010805.600873-130-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="+KJYzRxRHjYqLGl5"
Content-Disposition: inline
In-Reply-To: <20200618010805.600873-130-sashal@kernel.org>
X-Cookie: Androphobia:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Wei Li <liwei391@huawei.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
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


--+KJYzRxRHjYqLGl5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2020 at 09:03:47PM -0400, Sasha Levin wrote:
> From: Wei Li <liwei391@huawei.com>
>=20
> [ Upstream commit c1c050ee74d67aeb879fd38e3a07139d7fdb79f4 ]
>=20
> As these two drivers support I2C and SPI, we should add the SND_SOC_I2C_A=
ND_SPI
> dependency instead.

This is purely about build testing, are you sure this is stable
material?

--+KJYzRxRHjYqLGl5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl7rSeEACgkQJNaLcl1U
h9BhCAf/ciV+cf+M61TGXRdOnfuoSVBILoCzTRjUDUZjTFenxNYOL6pn5Xv+aFeK
RbGbTG45EDMNN9LQhtUYX3r4PAPtTux43olQHdd4D5WfW+qdOh+mewub/+Gw85X8
82H4kZgiFEWz6w9GU7oEBv6A8aRJnh0ULOk0mNign0wzgtFozUiqpx9GQFZtk2FN
DttJK3pNdsRcJbPLEWO//vc7NVq+1UeUbIIs7s4j/cH3NGC7NnDTVupWQ9dv6uik
VTun8Mz+TTz+UQOGK4DmubFUqV1WhCnQ2Nd5CCEVmTvVRDiUm3GYGXxbwMsen3Ks
Zy1VQsifFNRJrQ+PKFj3h9tf/SBcJQ==
=mxzp
-----END PGP SIGNATURE-----

--+KJYzRxRHjYqLGl5--
