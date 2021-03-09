Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2180E332AAA
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Mar 2021 16:37:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6C11186C;
	Tue,  9 Mar 2021 16:37:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6C11186C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615304272;
	bh=Pofaxorq7jn6ioWTVLvagneI4H/1LHRmxp4Zb18QVAQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FwqPIjWow/b0Jn1Aa5uAH415+Z6JpILMMXUo47Qo9glVDgVPqoew1C+HGdOGEiku/
	 O7Nbgv9H3aBtaS5YJmJLF50ei/jkahNkdg8SKCfeA7Yv1NF3P9/uZ3oYiz8N6oD9PN
	 6W6E44ElIQfzgyLz0heuNeK2GDcsKw+O2/KXnOqE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E5EDF8019B;
	Tue,  9 Mar 2021 16:36:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D13EF80227; Tue,  9 Mar 2021 16:36:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BF80F800D0
 for <alsa-devel@alsa-project.org>; Tue,  9 Mar 2021 16:36:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BF80F800D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="e2r/7/r1"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5CE3A65238;
 Tue,  9 Mar 2021 15:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615304166;
 bh=Pofaxorq7jn6ioWTVLvagneI4H/1LHRmxp4Zb18QVAQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e2r/7/r1ukV3G49vkayekVLr8eKvRHwVVLMgi2LCWRjExlht8QRFMuP8TwT1LvHzv
 M++Z9Q7QPMPisXlegJpRPpNekSitAwMOPgVDOE/j6slSVR6A4rdnKcqdsy7+96K61/
 jh2qpMP1kJq1UyBqEgLJa0OIuomSNPGk0g8VtgtLsipceGqUOtksXxJ8aNza/NfoAl
 M2Osg5Obvrxyz/TwzMrRzDDvWbPh9t76Pv2Cq9O06c/rOLBOgLbGw6bhEz4Ermfnxn
 JLk99+/1BybsjNfr8v53mijg+vt4qD1uVLTXgCvEy/Q9OuxCEza8Ilc2zSELLCCr0/
 ASGq7tYFPd2FA==
Date: Tue, 9 Mar 2021 15:34:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Subject: Re: [PATCH] ASoC: core: Don't set platform name when of_node is set
Message-ID: <20210309153455.GB4878@sirena.org.uk>
References: <20210309082328.38388-1-daniel.baluta@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="aVD9QWMuhilNxW9f"
Content-Disposition: inline
In-Reply-To: <20210309082328.38388-1-daniel.baluta@oss.nxp.com>
X-Cookie: Immanuel doesn't pun, he Kant.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, shengjiu.wang@nxp.com, ranjani.sridharan@linux.intel.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, linux-imx@nxp.com,
 Daniel Baluta <daniel.baluta@nxp.com>
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


--aVD9QWMuhilNxW9f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 09, 2021 at 10:23:28AM +0200, Daniel Baluta wrote:
> From: Daniel Baluta <daniel.baluta@nxp.com>
>=20
> Platform may be specified by either name or OF node but not
> both.
>=20
> For OF node platforms (e.g i.MX) we end up with both platform name
> and of_node set and sound card registration will fail with the error:
>=20
>   asoc-simple-card sof-sound-wm8960: ASoC: Neither/both
>   platform name/of_node are set for sai1-wm8960-hifi

This doesn't actually say what the change does.

> -			dai_link->platforms->name =3D component->name;
> +
> +			if (!dai_link->platforms->of_node)
> +				dai_link->platforms->name =3D component->name;

Why would we prefer the node name over something explicitly configured?

--aVD9QWMuhilNxW9f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBHlZ8ACgkQJNaLcl1U
h9CCjwf+KGK9CFvGq0ABRqnlUjLRBWp+vksCfNrIv+WEUvyvWh0ZHjOjOJb5xLP7
uuf4ei9nQDAeyTh7/jDpU2l2/GUUYuJ/6IRRsgZr2OpxEFOGiH5A0U4Yv5fIPB9p
DLmqYFD44/QqRnX5aXSq2eTFYcZPWElrkXgZcxeq65kSRJAtf2okS9x8XnmuBHiY
h0nb6Q3oTf7PnFoHKHxD93BY5dDuoCz3Ge+hs3+L/piVC/9qDzSnzrHbOl14aZKP
/S/r/QY8eQ5A2caYQl3JLFaETl6/baRcgH8CP6LSvnLJJH78tsbaOEQhTeYiBKX8
VNfo+jBBZJBxvqhOiN41oxupo38zhQ==
=H9TN
-----END PGP SIGNATURE-----

--aVD9QWMuhilNxW9f--
