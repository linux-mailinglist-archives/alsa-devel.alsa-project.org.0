Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD674C8CA5
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Mar 2022 14:29:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9CD11B3D;
	Tue,  1 Mar 2022 14:28:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9CD11B3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646141382;
	bh=BTT0XbgCMW/Y/EC0V0fvpkq3sfhwmki/mQaIJqJBGbs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qRfmdlE8s/qIVxM/eGW2Vb6H1qKZRZv30poVOKX5p9VcGL3dWVwx53Bf4YOKxvuNh
	 DIo06d7AgWVPN3DNX6w4FikyT+eXy6dlFf5fnjYPx2dOUJLdY97nN4SokDNAmqRfst
	 W9B9O1zYGuD14JIyaftzatS64jCbYINnZ1lX08Fk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55FCBF802D2;
	Tue,  1 Mar 2022 14:28:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 523E5F80227; Tue,  1 Mar 2022 14:28:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA356F80095
 for <alsa-devel@alsa-project.org>; Tue,  1 Mar 2022 14:28:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA356F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="gbpcdKoH"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2DB89B818F3;
 Tue,  1 Mar 2022 13:28:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5384C340EE;
 Tue,  1 Mar 2022 13:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646141305;
 bh=BTT0XbgCMW/Y/EC0V0fvpkq3sfhwmki/mQaIJqJBGbs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gbpcdKoHPsK+hV6dgNtnijrTO0eIyDNHaCNSDz5N/sVrddqaIT/iIXLCh35b78cBj
 pQ3okINhaCg5VXvuanIH38RK7URXi4YQY/SsYiM2p73cdI+rlywEIjMbf8xe+cHW0E
 yZsdgthlywjSAbr7I6Dg+aR4a9enNY6RgBaHfI8fz/L+6ob9kv7ZM91qrGPUJyov9R
 T+V39jCIMj8J5iinPWImdzXhatuDhAj4or8jZ16hnfxReiSXOKclv8yqwf2YfI1y5e
 AsEi2QNOX8AmGx+qxUxX2c/O7+Gh9yO6MMpAerCs+nWeQIxtwdaMqdOsnDEeVwxUGT
 Om+cYqYDelTaw==
Date: Tue, 1 Mar 2022 13:28:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Zhen Ni <nizhen@uniontech.com>
Subject: Re: [PATCH] Asoc: au1x: Use devm_snd_soc_register_component()
Message-ID: <Yh4fdXOUKNeV7Mi5@sirena.org.uk>
References: <20220301092322.5523-1-nizhen@uniontech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zr9XoaaziLUuphUQ"
Content-Disposition: inline
In-Reply-To: <20220301092322.5523-1-nizhen@uniontech.com>
X-Cookie: You have a message from the operator.
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, tiwai@suse.com
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


--zr9XoaaziLUuphUQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 01, 2022 at 05:23:22PM +0800, Zhen Ni wrote:

> +++ b/sound/soc/au1x/psc-ac97.c
> @@ -411,7 +411,7 @@ static int au1xpsc_ac97_drvprobe(struct platform_devi=
ce *pdev)
>  	if (ret)
>  		return ret;
> =20
> -	ret =3D snd_soc_register_component(&pdev->dev, &au1xpsc_ac97_component,
> +	ret =3D devm_snd_soc_register_component(&pdev->dev, &au1xpsc_ac97_compo=
nent,
>  					 &wd->dai_drv, 1);
>  	if (ret)
>  		return ret;
> --=20

This introduces a double free since there is a remove() function which
calls snd_soc_unregister_component().

--zr9XoaaziLUuphUQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIeH3QACgkQJNaLcl1U
h9AlGQf8DucapLDhz1pD0o0kOT1xiZ6hy8KKO8CpBrPAdGBfrXe91VdcA/CVeXFY
kRnW/mOLksTrt/cpimgUHgU5zO+Uld3crP618bQE+xjdDkeL+qrLm91u5I9GzkDp
GwlJ8yqTwabMtnnixq9JfwI4kSvaOxasS7Egd2jOqxmNmvrj+8xfi/L+nKTK3Ry0
YJrAtLXMnqX3c+qudrlRQ3VEwVMN9S7yM5Ykflyq7UBstVCmdQRbiN6nFtUK76+Q
ANDZL7D/oZJbvMv/E7sDk8uMSMeK4th+txIJAahQZkTiTJFeBTIGzcFjxZUnCB6H
OxV+fMyBHv920/AZQV5JbPdcw+Sr6w==
=4xOp
-----END PGP SIGNATURE-----

--zr9XoaaziLUuphUQ--
