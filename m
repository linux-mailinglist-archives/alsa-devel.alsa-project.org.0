Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C79953EEDE5
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Aug 2021 15:58:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E0771676;
	Tue, 17 Aug 2021 15:57:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E0771676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629208712;
	bh=F6O6OgAVIfjg+VWfWH48h+n6Gi6VCkIzlosJWt/V9fY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YcczZzUtx6yMBCcyByEWPGiG0bAzxMuKATDy4iOoQQc6LQilkDIUjbRrQonsWcbXg
	 DqblXvXHAM5DLA+8oHTeLyvn3ohpARFWcNmlxU//peftKC2x/oxgX8/gFJJakXFxuP
	 CQm1qxC5nEj6I/nGrDoDMOGjhNUItXWJItIDpK78=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E00D2F80111;
	Tue, 17 Aug 2021 15:57:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBC08F80272; Tue, 17 Aug 2021 15:57:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 974D8F80134
 for <alsa-devel@alsa-project.org>; Tue, 17 Aug 2021 15:57:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 974D8F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="HtrhppfP"
Received: by mail-wr1-x42f.google.com with SMTP id u16so11654453wrn.5
 for <alsa-devel@alsa-project.org>; Tue, 17 Aug 2021 06:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=6xL8KKAgtKVXqiY10rauZL3Pjki57neMrGXDUAD5maQ=;
 b=HtrhppfPKGETXKQk7ZaqMpU8WnD19jumtezcpkJu7F1PYATEznnv9VzV2vkGJpKarF
 TovRf0L0/i0XMHMAjP6MENt8v/I0dDM6zCn0VAh+mgT70o2GH9bmNrL+9xZ46UmTD+CN
 RZYlldEZyfaknBqYg6MGwkW+WYeplMANsHFDiEvnpO35Uw/7jf8/L+xPFmDoTZZDEcf9
 UFz1j+4UZAOygrkLGgYDbe046/6VZFMZb2c16C0mBa3gTPI2KxGq7KO7eawuSgqy2q+Y
 +dGgh6gb13YVdhg6dxUGhyer+u8aPHYL3M7oNjgVQWCl95BJ9vHk0ozWHRStypUW3+2m
 6tBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6xL8KKAgtKVXqiY10rauZL3Pjki57neMrGXDUAD5maQ=;
 b=ZDYw6va3VquRxbie5xhwHMMAmDEydpoX3UdWqd69mOOesZFtDGHFaypy6p84z3sVfI
 Td5X7nFvZxM8/3BF5OYXgYc569urvH4tlJ1dPpoL62RQQjEWgf7lPdlhZencF345cvAt
 4r9trES6o+AGdEQFgclOZwIhyatQEmFVVKJg4M0pF6jSq03qpqouGQEoF5+EeqW7qaM/
 27V2y+9jeIUt+T0X9gR+4jN2wgI9o47sPsO9sMI5Zk3mm+uAcP+cJcUj56oIKMQXAdiA
 3ODyZdW+x4It1uMgZRAKX93pE5MEBnEZRTaCNzv6oN9Ds7SNMLt9cXxaHMs1JFUusBTk
 Fv5w==
X-Gm-Message-State: AOAM533SpcZbH+AwKaCH8WbqRZbL2GEbMtbIP8APzBrJiDVhTfMW5gQJ
 vdzIbRrmsjBgc8JbQ+vTC7M=
X-Google-Smtp-Source: ABdhPJxXGwy71h9iKKqpMv+kIW8otw6YW0vCZWUHj/3tGNCg758nPBEl8P96su7hyxMb2m+h1ab0Tw==
X-Received: by 2002:a5d:6090:: with SMTP id w16mr4403007wrt.38.1629208627684; 
 Tue, 17 Aug 2021 06:57:07 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id z15sm2525314wrp.30.2021.08.17.06.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 06:57:06 -0700 (PDT)
Date: Tue, 17 Aug 2021 15:57:05 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Aakash Hemadri <aakashhemadri123@gmail.com>
Subject: Re: [PATCH 2/2] ASoC: tegra30: i2s: Fix incorrect usage of
 of_device_get_match_data
Message-ID: <YRvAMfwh9GnaNV7U@orome.fritz.box>
References: <cover.1629148177.git.aakashhemadri123@gmail.com>
 <4805c7fcd35c8deada63d41cb34d40de80f85a13.1629148177.git.aakashhemadri123@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WXB9ClFJ/LNHhScs"
Content-Disposition: inline
In-Reply-To: <4805c7fcd35c8deada63d41cb34d40de80f85a13.1629148177.git.aakashhemadri123@gmail.com>
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


--WXB9ClFJ/LNHhScs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 17, 2021 at 02:44:52AM +0530, Aakash Hemadri wrote:
> const struct of_device_id incorrectly assigned "match->data" using
>     of_device_get_match_data()
>=20
> Instead assign `const struct tegra30_i2s_soc_data *soc_data` with
> const void *of_device_get_match_data(...)
>=20
> Fixes: 356b94a32a75 ("ASoC: tegra30: i2s: Use of_device_get_match_data")
>=20
> Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
> ---
>  sound/soc/tegra/tegra30_i2s.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
> index d4c5594efaf1..084a533bf4f2 100644
> --- a/sound/soc/tegra/tegra30_i2s.c
> +++ b/sound/soc/tegra/tegra30_i2s.c
> @@ -406,7 +406,7 @@ static const struct of_device_id tegra30_i2s_of_match=
[] =3D {
>  static int tegra30_i2s_platform_probe(struct platform_device *pdev)
>  {
>  	struct tegra30_i2s *i2s;
> -	const struct of_device_id *match;
> +	const struct tegra30_i2s_soc_data *soc_data;
>  	u32 cif_ids[2];
>  	void __iomem *regs;
>  	int ret;
> @@ -418,13 +418,13 @@ static int tegra30_i2s_platform_probe(struct platfo=
rm_device *pdev)
>  	}
>  	dev_set_drvdata(&pdev->dev, i2s);
> =20
> -	match =3D of_device_get_match_data(&pdev->dev);
> -	if (!match) {
> +	soc_data =3D of_device_get_match_data(&pdev->dev);
> +	if (!soc_data) {
>  		dev_err(&pdev->dev, "Error: No device match found\n");
>  		ret =3D -ENODEV;
>  		goto err;
>  	}
> -	i2s->soc_data =3D (struct tegra30_i2s_soc_data *)match->data;
> +	i2s->soc_data =3D soc_data;

Same comment as for the AHUB patch, although there's a bit more
potential to save boilerplate here. For instance, there's really no need
for the local "soc_data" variable here, so you can assign to
i2s->soc_data directly and then leave out the unnecessary check as well.

Thierry

--WXB9ClFJ/LNHhScs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmEbwDEACgkQ3SOs138+
s6EYFg/7BlPu/5ug2oVMVdV/HsR+3h9uwCICjMgt8/psvUDjw1SU6x2Y/Ka2dHhZ
7pLHXfsX5XZ18zrgADT0dDNwJiTBTdDwGRIwdG0hibghfJUnqIsHrI+/6EDOjm0w
3HwhNpy4vwLxcV9IVR7p/w5TRvV/rAXFnrYjo9awsvcp+9OPvZXdWtfiXiiMlpa9
PQbkq/YN6WnQO4R223jvsoHKWmG2g2+Uk8ZZ0kCmsCnip4ZAJ+IDnNGxoqACSIYu
VxKUNr6a1K9ul0YKpKjm9hZu+B8q5d1n8498VdAVIrqeM6zj31dmArDXX6klPVMY
X0aZ7I7YutW3k2YLLWwviyTM+j9RX2pGTVJQf8EvmUMrb5YmrOy3R961c4Zl6YCU
l+byT2Fto23pJvbZp9Ao/y/YpAQFjZze0zSrg/cJGCcPql3O13CA3qgEiEEsLfss
g35mfxJlcKTn+uxZDl/psbV2/ATnHtKc9Iwfve4XpNd7qsBAlfyRHbURQj/wp2O9
YU/Zk44m29ytiWDNXJr8ShWmrF7IhghQvQ4bzpsDbPwaZ5x3rQR8caKeBX7gAgKA
/NaV3BGzyhRYPXEVZFn1s+XFXVgm9BHZNLUJ54McTAaBPiMYMRzD1O6I7mWeErwf
id6v4FxkCJxR8N8Y05b89bwndyaDxLWSp+8rkTRoOx/CGqEb1+g=
=f3kI
-----END PGP SIGNATURE-----

--WXB9ClFJ/LNHhScs--
