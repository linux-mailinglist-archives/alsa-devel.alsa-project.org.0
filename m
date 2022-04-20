Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 416745082A5
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Apr 2022 09:50:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C526516FA;
	Wed, 20 Apr 2022 09:49:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C526516FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650441003;
	bh=2mRpXuk95u3wV5Kstv+0lYYBB/ApOGsY+16BvYY39MQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aqr/8g+xAFew/Eb2fr58P5BNcK6z4l+Z/AvS20wyeJbuYdFy0S4SzR0ZRsJjzsOkj
	 YhmTE0cGcz8ikWCv4Hd1b0kNd5NtV8Hu42Duxh0RWwi6Md0i/Utg4V8nvXMFNg8kMp
	 f3Lej4qgVC6vc80c77dXskA5bwchqOihVRWgwy48=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EA43F80128;
	Wed, 20 Apr 2022 09:49:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3444EF80125; Wed, 20 Apr 2022 09:49:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1714EF800F8
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 09:48:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1714EF800F8
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 4B86C1C0B87; Wed, 20 Apr 2022 09:48:56 +0200 (CEST)
Date: Wed, 20 Apr 2022 09:48:55 +0200
From: Pavel Machek <pavel@ucw.cz>
To: cgel.zte@gmail.com
Subject: Re: [PATCH] ASoC: fsl: using pm_runtime_resume_and_get instead of
 pm_runtime_get_sync
Message-ID: <20220420074855.GA25823@amd>
References: <20220412083000.2532711-1-chi.minghao@zte.com.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Content-Disposition: inline
In-Reply-To: <20220412083000.2532711-1-chi.minghao@zte.com.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com, shengjiu.wang@gmail.com,
 Zeal Robot <zealci@zte.com.cn>, linuxppc-dev@lists.ozlabs.org,
 lgirdwood@gmail.com, Minghao Chi <chi.minghao@zte.com.cn>,
 linux-kernel@vger.kernel.org, nicoleotsuka@gmail.com, broonie@kernel.org,
 festevam@gmail.com
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


--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: Minghao Chi <chi.minghao@zte.com.cn>
>=20
> Using pm_runtime_resume_and_get is more appropriate
> for simplifing code
>=20
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
> ---
>  sound/soc/fsl/fsl_esai.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
> index ed444e8f1d6b..1a2bdf8e76f0 100644
> --- a/sound/soc/fsl/fsl_esai.c
> +++ b/sound/soc/fsl/fsl_esai.c
> @@ -1050,11 +1050,9 @@ static int fsl_esai_probe(struct platform_device *=
pdev)
>  			goto err_pm_disable;
>  	}
> =20
> -	ret =3D pm_runtime_get_sync(&pdev->dev);
> -	if (ret < 0) {
> -		pm_runtime_put_noidle(&pdev->dev);
> +	ret =3D pm_runtime_resume_and_get(&pdev->dev);
> +	if (ret < 0)
>  		goto err_pm_get_sync;
> -	}
> =20
>  	ret =3D fsl_esai_hw_init(esai_priv);
>  	if (ret)

Please take a closer look at that function.

a) error labels are now misnamed

b) there's leak if
   ret =3D fsl_esai_hw_init(esai_priv);
   if (ret)
     goto err_pm_get_sync;

happens.

Best regards,
							Pavel			  =20

--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmJfuucACgkQMOfwapXb+vIiGACffOMVcK21uP4rckwMmbnzLCim
9/QAnjyoa8+Std4g2m6imouSbgDhSKdo
=cpOV
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--
