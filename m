Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D02D43ED15C
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Aug 2021 11:56:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B60816CF;
	Mon, 16 Aug 2021 11:55:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B60816CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629107806;
	bh=v3E6BjFJwAJWY9dR+pu3Bjl6TlYK1TojJlIo8jRdt8U=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ArZFJia12lJEVQlQjExSAS7dS4rpJ2a4lLfdkY4guD75guAg5zMPdhCnqsCjz27uy
	 wThktqFApKS/Lh83gFI3Pl19Ut7KIcLAO9R2lM4LbG2+WIns009r1wxyBheKrBGfNZ
	 pZJJt4+AMA7f6EwGTd5gDMjks/AQ767qVHI53BiI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C8B9F802C8;
	Mon, 16 Aug 2021 11:55:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1385F802BE; Mon, 16 Aug 2021 11:55:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BFF37F80259
 for <alsa-devel@alsa-project.org>; Mon, 16 Aug 2021 11:55:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFF37F80259
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Mf3YQRam"
Received: by mail-wr1-x42d.google.com with SMTP id r7so22786896wrs.0
 for <alsa-devel@alsa-project.org>; Mon, 16 Aug 2021 02:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=lCtwN1/Tc6AEDBE9eRczuSHPTW+enb9LWBSg2kwIFhY=;
 b=Mf3YQRamX9s+sXTFIdOG7jDUc/s+1ZxNKTI+YC5bJO8vvn5K2/tvU6nyX5ojwrlkyM
 Aog6xm+y2goyW+kQx/0mbUEY3KQpYq6U6cQQ5KdIx+TFfTMo+vIVJjiymmpxGsfaQjU4
 aKlCMt/MZpO89RXC5dGLA0vzjTpT6YqMLTv7jMMQWhhadYP0NzezdJqth9dkAsRIuiyq
 DBwYoq7f40qMiCyAtEDHpFcyBzQ4m9LHCLfokBuh2Vn2zCLfxnyPtY6Drwbll88dahRX
 rXEW+psxZTwt8OMEZeygYTg/M80hLUlpVndPrdboma49N+6DNIZbqSSKtX8A8yoYGkGB
 0zmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lCtwN1/Tc6AEDBE9eRczuSHPTW+enb9LWBSg2kwIFhY=;
 b=Bm2Vhpy9V7XyALOsFLKCa9lS0+yq8SlXzlszGM53dCwA8xKspNcjHvamGbFD4jA6za
 C2Na0bhuJHbsrskG4wiuyX2evxLGoUpKDCDiZUJMGFRh2Dk837W1Wsq6nQ4ZX+nekXtg
 c71Gj/+NHWcm5qD6z2dKMn+0N6N/Ymlfy5/+qtOdKTy00ji1sOu8ojxqpBI9W9UQ9pls
 +PVWlelvIUqrrzUK+k3aUOKQ1OL8t0b4q8o29LN4PNslnqo/rHaiiGhaqdgzvurTk4OP
 1UlGosKmWKpUIR4GIJdL5PFS/GAoqefuR5xBjIKCVoOQAPcA6g/JR0/IHK20HDTVf+sx
 /5kA==
X-Gm-Message-State: AOAM532OkBDSNPLNHHuNWd7aLe51B8CZBLTHY+uRquf0hPYuZXuSOBu8
 SEQDAbmi9PNsd1cU1HFf++g=
X-Google-Smtp-Source: ABdhPJxEBkLsdoiB4/f/6VyMSZEXgGP+mDXXiwj3zbRY5rPxacUVx/03TGH5byc572g+lwuM0/loKA==
X-Received: by 2002:adf:f8c8:: with SMTP id f8mr17928711wrq.204.1629107694713; 
 Mon, 16 Aug 2021 02:54:54 -0700 (PDT)
Received: from localhost (pd9e51807.dip0.t-ipconnect.de. [217.229.24.7])
 by smtp.gmail.com with ESMTPSA id k17sm10742242wmj.0.2021.08.16.02.54.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 02:54:53 -0700 (PDT)
Date: Mon, 16 Aug 2021 11:54:52 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Aakash Hemadri <aakashhemadri123@gmail.com>
Subject: Re: [PATCH 2/2] ASoC: tegra30: i2s: Use of_device_get_match_data
Message-ID: <YRo17IKkGYEBUCoe@orome.fritz.box>
References: <cover.1628971397.git.aakashhemadri123@gmail.com>
 <f4e632e0023d90c43b2b927e752585142a9d9c26.1628971397.git.aakashhemadri123@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="L8F5rI6YsatuZvBz"
Content-Disposition: inline
In-Reply-To: <f4e632e0023d90c43b2b927e752585142a9d9c26.1628971397.git.aakashhemadri123@gmail.com>
User-Agent: Mutt/2.1.1 (e2a89abc) (2021-07-12)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Bjorn Helgaas <bjorn@helgaas.com>, Mark Brown <broonie@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>
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


--L8F5rI6YsatuZvBz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 15, 2021 at 01:42:19AM +0530, Aakash Hemadri wrote:
> Prefer `of_device_get_match_data` over `of_match_device`
>=20
> Retrieve OF match data using `of_device_get_match_data`, this is cleaner
> and better expresses intent.
>=20
> Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
> ---
>  sound/soc/tegra/tegra30_i2s.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--L8F5rI6YsatuZvBz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmEaNewACgkQ3SOs138+
s6FvUg/+Le8sG7K2DpxH02WiNGwIgYIcgcVqtfbXAP9ATobiDSpjt+ts9oIyA4om
Ztin1Ulmb0GMbDqKcL+A4JmCAmI64mNuF8xWoySoBwyAm/D3TgGYFEpPOcAK3WrR
OTFs8L6MOmi9cq1gnMwXmskz6Hc3yfO+7Fw8o4h1cfPXk4AZVCo18N2wsCCCs6F6
wy5mqQF83B/pTofjdKebUEc8wj+JNq4TIgzsGH5oU5Tf32OpEc1KvKfHvwJ4E1T3
o/n9aNIFy4GrLPVzvKndo/COXm30IEKBjEypnoKEyadm4TwTK6O6jAYrMcJmhHOa
TpblQXEl22hFWeBURaqW1g6IDvvdsR0tOcjWjDI39RTX3LoGcPkEezJd3RPrbkNC
u1djqnemvCpLKiaXCeFqaogw/XG/vWwLt6VUergSs6Vstip5GFPtdXO6+dyUYlKK
Via50ScSCl+G9hxJbJNxglZx4smMcaQdzHvt6VjuUJ3bqGvVkF4ab8Mzqq3SQfvQ
ngcPoahwY2Zf8DldMFfEnMSQ5psj2ClZq0ve04JWsc5Y+nMizLhp0LSvWN7TDCuB
VLTI+xxIQj80imx2ONq44YSx+3dbwf8P2mNaKhFS1viw75KwO4yMcf5z18VX2Nil
fSvXqTmwemWy2GF8YhWDL7GN3MFpCLiwi7vQ1/8dgDT4VG6d5U8=
=5EZb
-----END PGP SIGNATURE-----

--L8F5rI6YsatuZvBz--
