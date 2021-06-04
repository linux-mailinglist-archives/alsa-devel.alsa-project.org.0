Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7761839BAE4
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Jun 2021 16:28:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E44FF1734;
	Fri,  4 Jun 2021 16:27:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E44FF1734
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622816884;
	bh=jyhVkbKJAz0dmq112rRFC095rYggluvWOSdsX33VwH4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M90lWXudzWH6PwWkyPmNX1/NrR3mX/bHNjvdUlg1507ZFJuti4kkQ+kfX0r4vZdcP
	 d8+YkRp77fn0JRS4GervpyGJNWUK5vA5+MVTwuF+ImH2n23YPYrA3Va1P9DSjDq+dY
	 Nj1UQjCIwhlyyI0dr3VADmMLPa5ITN+lD3Nalk3Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0508F80430;
	Fri,  4 Jun 2021 16:27:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6852DF80425; Fri,  4 Jun 2021 16:27:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6181F80103
 for <alsa-devel@alsa-project.org>; Fri,  4 Jun 2021 16:27:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6181F80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kdRa3D4o"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2CBD1613FF;
 Fri,  4 Jun 2021 14:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622816824;
 bh=jyhVkbKJAz0dmq112rRFC095rYggluvWOSdsX33VwH4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kdRa3D4oZLi1oEvo/9MiY1MeqHrxwedWKUJXg8jlVZMBtC38arPLQYZ89HzUb6K3f
 Fuw2ZUQwFAr/HIkypXAqpkbsYit3zWS+BAfx4LspLCeCZMZjJlc5+MzKIh8sNknT19
 crTdnv8PtpNFuPYCCP9hUrSn2dGVke4+9Q2U+Rhtzf+slCDrYpxcCzUHBOtErmWUxW
 WYhGdnrv34Ct7jYn8f7/OGs1SQryrFMtYTvKDVOlMrvh9vz28E70gf/eV8ypsAdkqc
 Xazzu2WFiM67ktsiPnPkDvhPWorkULPj1IAgtbDwZR3XoR4g+WgGO+527Ey3J3bYW9
 MKgmXHxWvkvgQ==
Date: Fri, 4 Jun 2021 15:26:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Wan Jiabing <wanjiabing@vivo.com>
Subject: Re: [PATCH] ASoC: Remove unneeded semicolon in rk817_codec.c
Message-ID: <20210604142652.GA915@sirena.org.uk>
References: <20210604030045.7360-1-wanjiabing@vivo.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline
In-Reply-To: <20210604030045.7360-1-wanjiabing@vivo.com>
X-Cookie: A modem is a baudy house.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Chris Morgan <macromorgan@hotmail.com>, Lee Jones <lee.jones@linaro.org>
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


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 04, 2021 at 11:00:23AM +0800, Wan Jiabing wrote:
> Fix following coccicheck warning:
> ./sound/soc/codecs/rk817_codec.c:49:2-3: Unneeded semicolon

This doesn't apply against current code, please check and resend.

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmC6OCwACgkQJNaLcl1U
h9BqXwf9EWS3l1/OCYkMhCMSB42ss/Z1//ss+FoD7LRk1cWvjfFDmUMeBV3W6eEs
ajDvZ5T4wCwqaqePWqilqBMvfp7oNYSbGl592lyIyq6OR83bvcSCvBnpqUr27S2m
WIQeg5mFXlbbUam71Fu3X1qECec3kUSA8vOhqYBsSsnA7Rgek2kEQq6N2q9yADob
DLBxqNodF6Guws51tg2NE/ZGgaHwaKdqcOhR7wX0rwfkTQQoE6AfEyM7+JMIZiUi
5xT+eSalT3l8qs5JNyyjaVgOhh6MfiHc1wnVCZcBUpEVxFlVMEJ2LUkdLBLjJ5nd
G2CU/4LI27mzAg/RwKgBa6PM5LSXrw==
=28E5
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--
