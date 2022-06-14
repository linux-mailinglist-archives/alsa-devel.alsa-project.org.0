Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 749DC54B56B
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 18:09:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EAA0189C;
	Tue, 14 Jun 2022 18:08:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EAA0189C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655222984;
	bh=f6KuiueIv/s3cr+8vOYyA2WSMzAJ801h4xLsZ5d4vCQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Pq+8wg5fbyX6xlJI37qrDnSRk7A5jQghLXHy/zGFN2Zphb2swC4Bvb79UwZj1ph4V
	 KgkjG7dq66WhXUuBq8U5dQeWgHEbcqADOsAc5TCe98DQkVR6wXAh8O5wHkO0fDLKVz
	 RnMUWams+oJ4TV7ik9LKflbwADcFDuajAv5zTCI4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DB0EF800E1;
	Tue, 14 Jun 2022 18:08:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C428F80139; Tue, 14 Jun 2022 18:08:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A45C8F800E1
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 18:08:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A45C8F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="SFsM3wa7"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id B0722CE1B26;
 Tue, 14 Jun 2022 16:08:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA653C3411B;
 Tue, 14 Jun 2022 16:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655222909;
 bh=f6KuiueIv/s3cr+8vOYyA2WSMzAJ801h4xLsZ5d4vCQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SFsM3wa7t0y5/icGPA1hoiUopkaKXnX+CpJLFWVGwSkPa0Qa+k+fznmt3Y/IRdgAv
 q8oKIyt45anZyqQnBVyf7ijXJq6aD/afzSsX8o5+rU9gr6xZ5V+HuklQOJGmJ02O0Y
 cSjmb2RSEqIt4H8hR8+gpp846vKuDcYtjRxkzYo2vSYgygE61zxqjfvae9miPVaIcw
 R1d5VXeNEg5F5q8bdxp5OCJheNQCGau0jUaC4Rz1bEpFy7OouEAR2F5n96+H9iEttu
 DA/EbzPQhgJJzRGE5DdsGuQ6ZIq9VB64XOlNMizMza2KLLQQnU/d9z78AFcie0XVMp
 J5oIbSkIiJoPQ==
Date: Tue, 14 Jun 2022 17:08:24 +0100
From: Mark Brown <broonie@kernel.org>
To: David Owens <dowens@precisionplanting.com>
Subject: Re: [PATCH] ASoC: ti: omap-mcbsp: duplicate sysfs failure after
 PROBE_DEFER
Message-ID: <YqiyeM2JkDxLIKDe@sirena.org.uk>
References: <20220614155931.2706437-1-dowens@precisionplanting.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="GYvOB+ScB/4Az0wW"
Content-Disposition: inline
In-Reply-To: <20220614155931.2706437-1-dowens@precisionplanting.com>
X-Cookie: DYSLEXICS OF THE WORLD, UNTIE!
Cc: alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>
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


--GYvOB+ScB/4Az0wW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 14, 2022 at 10:59:31AM -0500, David Owens wrote:

> The call to sdma_pcm_platform_register() can return PROBE_DEFER, leading
> to omap_mcbsp_init() being called multiple times.  sysfs node creation
> fails in subsequent calls to omap_mcbsp_init(), which prevents
> the driver from ever successfully probing.  The resulting errors can be
> seen during boot:
>=20
> [    1.749328] sysfs: cannot create duplicate filename '/devices/platform=
/68000000.ocp/49022000.mcbsp/max_tx_thres'
> [    1.759643] CPU: 0 PID: 6 Comm: kworker/u2:0 Not tainted 5.18.0-yocto-=
standard #1
> [    1.767181] Hardware name: Generic OMAP36xx (Flattened Device Tree)
> [    1.773498] Workqueue: events_unbound deferred_probe_work_func
> [    1.779449]  unwind_backtrace from show_stack+0x10/0x14
> [    1.784729]  show_stack from sysfs_warn_dup+0x4c/0x60

Please think hard before including complete backtraces in upstream
reports, they are very large and contain almost no useful information
relative to their size so often obscure the relevant content in your
message. If part of the backtrace is usefully illustrative (it often is
for search engines if nothing else) then it's usually better to pull out
the relevant sections.

> +++ b/sound/soc/ti/omap-mcbsp.c
> @@ -1403,6 +1403,10 @@ static int asoc_mcbsp_probe(struct platform_device=
 *pdev)
>         mcbsp->dev =3D &pdev->dev;
>         platform_set_drvdata(pdev, mcbsp);
>=20
> +       ret =3D sdma_pcm_platform_register(&pdev->dev, "tx", "rx");
> +       if (ret)
> +               return ret;
> +
>         ret =3D omap_mcbsp_init(pdev);
>         if (ret)
>                 return ret;
> @@ -1412,13 +1416,9 @@ static int asoc_mcbsp_probe(struct platform_device=
 *pdev)
>                 omap_mcbsp_dai.capture.formats =3D SNDRV_PCM_FMTBIT_S16_L=
E;
>         }
>=20
> -       ret =3D devm_snd_soc_register_component(&pdev->dev,
> +       return devm_snd_soc_register_component(&pdev->dev,
>                                               &omap_mcbsp_component,
>                                               &omap_mcbsp_dai, 1);
> -       if (ret)
> -               return ret;
> -
> -       return sdma_pcm_platform_register(&pdev->dev, "tx", "rx");
>  }

It's not clear to me how this fixes the problem, your commit message
doesn't mention how?  I was expecting to see more error handling paths
being added to unwind the sysfs allocation, or a conversion to devm.  As
things stand it's not clear to me that the error won't persist in the
case where we defer registering the component.

--GYvOB+ScB/4Az0wW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKosngACgkQJNaLcl1U
h9DjFwf/WQifCpq8XeOlBLOAvgI3uxiABxHsqoRqe0WDdqyfOiIgCszt2Z77mioC
FkYGfeIhUiG4PeQENR+LDpKgxL501Is0fRu6G9aRbrYvwRTgkrcA4zNp9nCGRvV/
9KPONBkkWijwTbh63YuEWZphXpj6D0TcLbZumcIDe9eKwTV2+z95rGUckojuiWUD
o47x/z9S/n93HwTPzCqFdeVwA8gAmzXYijiMfTRVwAE58ou1CHTd8oNiNQ6Rf/9X
/dRziXIw6B51hzJH+Q1+18lgkaIrXqpldQ4n45xq5vjI5JEes12ZKK3f+Pyol/u9
wXQfaVFQBQ9WO9pGNO4AEf3gUsAsSA==
=DruB
-----END PGP SIGNATURE-----

--GYvOB+ScB/4Az0wW--
