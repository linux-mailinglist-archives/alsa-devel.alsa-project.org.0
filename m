Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1BD3EEDD8
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Aug 2021 15:56:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B635A166F;
	Tue, 17 Aug 2021 15:56:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B635A166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629208610;
	bh=/nL8WNAEz43yQwAXal496PzkyS3BgsgmApkD7WAkVvQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eBwO/fjKY4qgDFkqOIIg0wp3lMe/S3WdzqEmlezPRTdP0aug6K9MXCDQ7mck26SBa
	 dK0weC1AT9OeMSD+4R6YgkIRc8CcPQY7s91vadtnjbm47WWluA0qoRro3+lEMepJgB
	 bFnnl4KOQnho3EbMBcSkmGsCiEWWbzEoNKKsJ+pU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23B76F80111;
	Tue, 17 Aug 2021 15:55:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2774EF80111; Tue, 17 Aug 2021 15:55:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13A42F80111
 for <alsa-devel@alsa-project.org>; Tue, 17 Aug 2021 15:55:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13A42F80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LD4ux+5T"
Received: by mail-wm1-x32d.google.com with SMTP id
 f13-20020a1c6a0d000000b002e6fd0b0b3fso350693wmc.3
 for <alsa-devel@alsa-project.org>; Tue, 17 Aug 2021 06:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=e9bZb1YY7FCvBqIDRWVhtfdiTQ+GMJ0iZin/k2ss5zg=;
 b=LD4ux+5TV8ESgevUSUahM4UvfcpJsjjf6xwVHcmHsJCvzFBNCsj4H7/aduW+JxRCE9
 Igw7kGnFd1pI9qtLwzkPGMIIMpgtAv/bDkpXdkdUr9Jbq3kwf7fVxNiFgdoQvGQ+t3lo
 tSTuMespfQYYiUXRBhyI9krFhPzSr0nsquB03gVENfeBgjsw/4A70ejZnt+80uZN9A+g
 SmavQMRRAOLWIfBBJWlPX1tca7ze50AkXkjWxqMe/k46B+DWsPV2S/HJd8B4Y+O8g6cE
 BtV4/whpbu7pI781U2FbLXsKvHEtYWVMb8VmcSAgSCSupxLrhnVsx80RXhTSt3ilpVf+
 pg/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=e9bZb1YY7FCvBqIDRWVhtfdiTQ+GMJ0iZin/k2ss5zg=;
 b=qBzLQXAoWejoCX/eRD3yTKs+sgToylvxzZeUYT9TqF8+F02iKKXQz59Iz+bSAOy2rl
 ioDYRXuIEd/cxWrRNov6VhgG5qx/xFhr5O2kX5k9Ck7Ft4aKVHd85pvV5uFRG2AwK7W/
 YeVaxQMCwBh4i79O/3VLZixrosm3xHij3mekPobjLEcfnt4eebLZVodx8u34u7JgToPm
 mliaXwebuCEDfGruHH9dyjxms2qSoh5bL23r9fazjTWsxolCIdlHG4tYyCV64+08Ifz5
 wIQ7QHLEkqCo9yvnr+AG6czL49DhqWfI2HVm9/GWItHkVCIMFR5FQl2m1iUeE8rvPOuu
 SFOQ==
X-Gm-Message-State: AOAM533IVDSkq1QvFXLdIoSObdUfWHZr2eGmrSlTFD0YyNDvQxaKLudS
 WrPfFkE88Nbn+qUDN6R1lGc=
X-Google-Smtp-Source: ABdhPJxTMX6wNNoxC7btDvZ/uZkYsN4Pw2/KsoQIO1+M8o9zy0rayBjARqnXpLWgNKiFHPKLF/ZG3g==
X-Received: by 2002:a05:600c:4149:: with SMTP id
 h9mr3457199wmm.88.1629208521913; 
 Tue, 17 Aug 2021 06:55:21 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id l19sm2335581wmi.4.2021.08.17.06.55.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 06:55:20 -0700 (PDT)
Date: Tue, 17 Aug 2021 15:55:19 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Aakash Hemadri <aakashhemadri123@gmail.com>
Subject: Re: [PATCH 1/2] ASoC: tegra30: ahub: Fix incorrect usage of
 of_device_get_match_data
Message-ID: <YRu/x+KBHtl3jg3T@orome.fritz.box>
References: <cover.1629148177.git.aakashhemadri123@gmail.com>
 <bb61c41f2ee0cf0d85fecdfea05f23a7205992e6.1629148177.git.aakashhemadri123@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KPz4+EU8b92H2GEv"
Content-Disposition: inline
In-Reply-To: <bb61c41f2ee0cf0d85fecdfea05f23a7205992e6.1629148177.git.aakashhemadri123@gmail.com>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Bjorn Helgaas <bjorn@helgaas.com>,
 Mark Brown <broonie@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-tegra@vger.kernel.org
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


--KPz4+EU8b92H2GEv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 17, 2021 at 02:44:51AM +0530, Aakash Hemadri wrote:
> const struct of_device_id incorrectly assigned "match->data" using
> of_device_get_match_data()
>=20
> Instead assign `const struct tegra30_ahub_soc_data *soc_data` with
> const void *of_device_get_match_data(...)
>=20
> Fixes: 80165bb80433 ("ASoC: tegra30: ahub: Use of_device_get_match_data")
>=20
> Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
> ---
>  sound/soc/tegra/tegra30_ahub.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahu=
b.c
> index 0ac109b32329..ef011a488ceb 100644
> --- a/sound/soc/tegra/tegra30_ahub.c
> +++ b/sound/soc/tegra/tegra30_ahub.c
> @@ -512,16 +512,14 @@ static const struct of_device_id tegra30_ahub_of_ma=
tch[] =3D {
> =20
>  static int tegra30_ahub_probe(struct platform_device *pdev)
>  {
> -	const struct of_device_id *match;
>  	const struct tegra30_ahub_soc_data *soc_data;
>  	struct resource *res0;
>  	void __iomem *regs_apbif, *regs_ahub;
>  	int ret =3D 0;
> =20
> -	match =3D of_device_get_match_data(&pdev->dev);
> -	if (!match)
> +	soc_data =3D of_device_get_match_data(&pdev->dev);
> +	if (!soc_data)
>  		return -EINVAL;
> -	soc_data =3D match->data;

Minor nit: !soc_data can actually never happen for this driver. First,
tegra30_ahub_probe() will only ever be called if there was a match with
an entry from the OF device ID table, and then all entries have .data
set to a valid point.

It's a pre-existing issue, but since all of the surrounding code is
already getting updated, perhaps it'd be a good idea to fix that up
while at it.

Thierry

--KPz4+EU8b92H2GEv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmEbv8cACgkQ3SOs138+
s6G+ig//RyICugt3pq1ORDeWTVSn35BEuD0wrZkvbHA1W0YACkfbgleassIEpLpy
IpOt/8qKXV25aEfNEkQp275Fk2hdwJFK8XVUEVCR4efxGFCFg5lZ8H2aMceLgbKq
xHgI4P1X8bd13/uzfJ1u+75s6TxmCokWuI1o7W8NVpOYSpOJjnH/OGwzDQJJw9AB
DEomquW626ZCYpjPa8/s9nrOsHY23EFGswmCKk5nwnxDsyCFgWB5A0LjrOaWdaPQ
RbZ+1x0EKEbp65R205rziWZcJqSeLOHkv9Mc5RvL+aN9ACJ6EzwFi7ICG+ddrhyR
vE0KjfWOdH5xlLRXJ7elSFl0SbIJXGHZlRsNd6CMQqkz7piIJeiDCVTJM3ZTpwwM
YKq6ax0Dls05mhYA6wpYrWDrBTcbYytYZkUqAum+hHyu7hYrXUJq8WuKXdHyX9Jd
pE8unNgHSTe+emJ1Q6zHh5IEqP9pJKewzsJSxQ0OP9L5tWW7ZN+LjG3UwPBOkQ+v
ik2UiDWFu3NnQuAwO42ok4WtHUvX2m+ogjyusl/2mjhDrupZSBtVKbKCuOmwVfsS
PYETiBrT+SGgy/lOZnibNz537/lWfKH4XjXM0U2eZT5U+GX+vJ0cXMJ5NqwQWwHi
8FFBUYy4EKTUgoaUaN1o5frZyTy9bVqcNVOesBo5JjWVGlzF7LM=
=lOkL
-----END PGP SIGNATURE-----

--KPz4+EU8b92H2GEv--
