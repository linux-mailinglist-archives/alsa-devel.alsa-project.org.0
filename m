Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 998FF365D2C
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Apr 2021 18:21:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AC07168E;
	Tue, 20 Apr 2021 18:20:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AC07168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618935676;
	bh=wo0Ma+Ga1AFTjgDUVkyTQw4kODt/cwUCMSS14hRgUNg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cxBPYqeqCgU/pw2dAfuoY9Qh+l6DDPFYOBdp/fXU9bJQSc/JhDo9jTDkLh8hleb7B
	 YM85j5kHwRyTewuzYMFX0R6tP+Ul1qhEZ/x1rXiyoMRUGlKWWIy4MmrF4JObzd6zlu
	 utUq+ZSMRq4l/l7/AsAT9SR9bghBrTWS/HVOrJVk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6D5AF80273;
	Tue, 20 Apr 2021 18:19:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19FF1F80253; Tue, 20 Apr 2021 18:19:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03E5BF800FE
 for <alsa-devel@alsa-project.org>; Tue, 20 Apr 2021 18:19:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03E5BF800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="us9AuT+e"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E9CCF613CD;
 Tue, 20 Apr 2021 16:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618935580;
 bh=wo0Ma+Ga1AFTjgDUVkyTQw4kODt/cwUCMSS14hRgUNg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=us9AuT+exCEr0zbASBxHw2qmmSsVS6/zUm+sHeS71IHEbaYbXR4fDkSmiu/75SZTF
 6+G6RPoo++S67ORiwwURUJp1//a4XjxY05+h27MdruM4uqj3z724dJM0Q/Buf/zTTq
 unTpAaffQ0S67azl9QCQMqn6OKiYI2x2Dis1VptuWdu7lUDh6uKPcc2IHHXTXecB7q
 u2LNLBzEyg62emP49CkuXf1eaIv6GnhYob09eUIvoiLNtVMfA2c6ddACYxKm9PbB7j
 7sd1hMU1M2HZTpxYqpUlVGxcv1cH9wdZCG91ghvjlWfmn9tSHNBWsrJXOzoPMeRKpP
 MjOwZ1LAUfg6Q==
Date: Tue, 20 Apr 2021 17:19:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Subject: Re: [v7 2/4] ASoC: Add Rockchip rk817 audio CODEC support
Message-ID: <20210420161913.GF6073@sirena.org.uk>
References: <20210420160747.22942-1-macroalpha82@gmail.com>
 <20210420160747.22942-2-macroalpha82@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="udcq9yAoWb9A4FsZ"
Content-Disposition: inline
In-Reply-To: <20210420160747.22942-2-macroalpha82@gmail.com>
X-Cookie: Falling rock.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 heiko@sntech.de, devicetree@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, jbx6244@gmail.com,
 lee.jones@linaro.org
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


--udcq9yAoWb9A4FsZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 20, 2021 at 11:07:45AM -0500, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
>=20
> Add support for the Rockchip rk817 audio codec integrated into the
> rk817 PMIC. This is based on the sources provided by Rockchip from
> their BSP kernel.
>=20
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---

If you've not made substantial changes to a patch you should carry
forwards any tags you've got when resending so reviewers know they don't
need to do things again.

--udcq9yAoWb9A4FsZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmB+/wEACgkQJNaLcl1U
h9D6Iwf+L1DybQOPGsl6KtAAhQp17fNdKFCqL5+Uil1WOS6NbkToX2lb+DZOK09u
r77tLW80Zlelg1tgjPZNPXWztxH+NMtVq2fyuxvKsHOHkACMLMRYpLgCSgjctYA1
n1pxh74sIshX+rRt5UO40Erek04i3sTq3Z8fS/r/SN3xaDqowhtXgur3dGsfWwlb
TJCqKeAYDlkR7KDxJ+vdanOWIQ8kmHSPwrKNLePrjD8YAx0iTRut7oSbG6EoeFWr
kQ8ZY4dLohmQ8sKjoAlGMqw21MuME4hFmgZuelwpCU0IV2QGqgq2s8wEQQ0SuBZE
W+01hbiShhGlSmt4IGCfYt+xp+yuAw==
=a2sH
-----END PGP SIGNATURE-----

--udcq9yAoWb9A4FsZ--
