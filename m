Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F319426B4F
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Oct 2021 14:52:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8388168B;
	Fri,  8 Oct 2021 14:52:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8388168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633697575;
	bh=yN6jNyqY0tdmECHxR1wtroW8A8lILV+Zejp7DTxpLgA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LFGPSTUUv3FzQ5V57E1vI8WJg9lBB3rmMYIGqdKKYKVXJlBRKT/EhWmn6rDE/W5yM
	 NgB7Wlwp6JYHgbnpTpXaKL6MooZwIpVrZGfQj1ANiN9IIsLxZqWrHbRIgMoTDWRfwP
	 G/TaW7fpcb86SxMVIuqhoMdHrTOm4k+WRB1wJQDA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15D9CF80124;
	Fri,  8 Oct 2021 14:51:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8480F80246; Fri,  8 Oct 2021 14:51:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5E21F80229
 for <alsa-devel@alsa-project.org>; Fri,  8 Oct 2021 14:51:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5E21F80229
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="o/1sMv63"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E190C60FC2;
 Fri,  8 Oct 2021 12:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633697487;
 bh=yN6jNyqY0tdmECHxR1wtroW8A8lILV+Zejp7DTxpLgA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o/1sMv63+8hQRt+O4kGRixzo+6wh7EcvWsWC/P+Su88x09542URplEQbblqIKy14H
 ohLwCXe19nsPPwS08M9VoPUYcOhxvyiBAt/mbgq7HnWVGrYB/v/HB33Punj8Re+n4z
 40Nukq94SbgsBfxJeUb2MJF34Dm6pVrm4+qM3Gp//b+68yS7qBoIDDXvk33wSh8Jht
 KS+mE6GpTp8VWblR4fM3OVa0VyOEe50JzGey99xCzcLxCabgvo2SCNHFoR1rDTa0Wi
 Yr2kT46+UtEHbu84uiAwghJ2v6B3O6DV/kXmmIFccUauFbo+vgGhLkhCsoOYyVn3H1
 WCj4T62ZErGcA==
Date: Fri, 8 Oct 2021 13:51:22 +0100
From: Mark Brown <broonie@kernel.org>
To: cy_huang <u0084500@gmail.com>
Subject: Re: [PATCH v3 2/2] ASoC: rt9120: Add rt9210 audio amplifier support
Message-ID: <YWA+ykStTEyzRbEy@sirena.org.uk>
References: <1633668612-25524-1-git-send-email-u0084500@gmail.com>
 <1633668612-25524-3-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="msEr/jdBSU575gqS"
Content-Disposition: inline
In-Reply-To: <1633668612-25524-3-git-send-email-u0084500@gmail.com>
X-Cookie: When your memory goes, forget it!
Cc: oder_chiou@realtek.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 tiwai@suse.com, cy_huang@richtek.com, robh+dt@kernel.org,
 allen_lin@richtek.com
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


--msEr/jdBSU575gqS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 08, 2021 at 12:50:12PM +0800, cy_huang wrote:

> +static const struct snd_kcontrol_new rt9120_snd_controls[] = {
> +	SOC_SINGLE_TLV("MS Volume", RT9120_REG_MSVOL, 0, 2047, 1, digital_gain),
> +	SOC_SINGLE("SPK Gain", RT9120_REG_SPKGAIN, 0, 7, 0),

Volume controls should end in Volume even if they don't have TLV
information so applications know how to render them.  I'll fix
this up as I apply.

--msEr/jdBSU575gqS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFgPskACgkQJNaLcl1U
h9DbbAf/ViOSI75UvPC1A+pp7ykPb2CF0lo+AsflYDs6bPHdCBnzsKecBpQB3A8K
gLHD6jFdEEKhAwhvLpzQqLU5ytwDkPrY81ebrgwOrIzCHR0jk9dq1ZYEyim8k0UZ
TBmFmIgQ+PEQ/JjkQKCPu20jzZBVFI5sEZ/Q6Ar1mWVO/GnVuxWF3Kw9fCxbxh2Y
Dan9EeLRo0PHBT6DXjh3fV1kexTV30npTLgff3XGcAoXKjgLHLfZTEgPQuxqfDLX
NlRK0djS7ZwXEEGFwcWE+w7UBfZC/I/wxeeGS1VsCVTwMHTPIVYe+Ip4Dj+8hbBL
xfDreeXlMm4P8GvDPbY4dFVNylrM5w==
=+qxg
-----END PGP SIGNATURE-----

--msEr/jdBSU575gqS--
