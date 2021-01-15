Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D632F7FF0
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jan 2021 16:46:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 354CC180D;
	Fri, 15 Jan 2021 16:45:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 354CC180D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610725585;
	bh=GzgVBNC7kPc6sl06WcbmzS9zgRW8ftShlwzHrMYm/Og=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bfH+x9wmcY8Mj1zs6D3O+3Gu8WHFPZ+NvNJaMzdGEEeh33STaRNnhlrseggdAn8oD
	 9akWx8bGuU5upWmSM1JwnoVui7pcX4CVAenUcRq8IerPcgMUsLLo4iFOPwG5FmBx9n
	 UWNYrFpQLNzme/ADzYlaxmETgZKCiYlXAekPq7ew=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F15BF80254;
	Fri, 15 Jan 2021 16:44:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7B08F801ED; Fri, 15 Jan 2021 16:44:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 688A1F80132
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 16:44:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 688A1F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="EUGbHoTQ"
Received: by mail-wm1-x32c.google.com with SMTP id k10so7767829wmi.3
 for <alsa-devel@alsa-project.org>; Fri, 15 Jan 2021 07:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=v8S8qEdVz3GDJ+77anbenPYreFZ0YsaL7qAKkmhD9uk=;
 b=EUGbHoTQfbzJ+kkwO5O+XPiigwOXJulEPDH5oQ1EWpoodmnWZy9jaslxD87JVaa7B9
 KAGo6qviSfw30M1GfDLV29RHbV0jveROpYLmM7nY5YuUPKEOAG//d4XnL2y8YYyWUYlE
 rC8GdhyIDuU4nRiCzxzs+ky4ozCILj3vZZNXSNMGXdQ+ZKNjc6ZJRPny4aTKXEr+N8/h
 ltIiU+ZQX15IpWiegVgQC2gssKPtK8ccfTH/myEge4IaGHYR3Nt1rgIkMA0nsOg7ECmR
 Mczez7WJYQKjgP22ItBo3AnpFviXS9eJCzVAereLaVAOAbQORhw5HD0fykOql+mMnqd4
 Li3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=v8S8qEdVz3GDJ+77anbenPYreFZ0YsaL7qAKkmhD9uk=;
 b=lObl+ANu/lCWa8cKiRIKlha5jPKSeKP+SYd8k/vl9kT4o6lWwEDemxWbA1IwK7LsSN
 5DlAENjzFaMDTNLX966MvOwl++t486/9p9IpR5AIEKzqXINhJcnQwjhWh8SGNAKBM+jV
 aG4pvVOCtRneQz1toVV/WzBrhWQwXfhRxqtqc6ELBD8rzGiEkOZMjErnsfoAiu4kxXis
 aW3tDMq6Nzrn8U9jestnr3OW5OZ3LAM40h+l9EKPRUSACkVJkoC3fTgtPoqBG8l8c42O
 JBaON+u1TLxrjwPOdvB1NmsgYkK3jGHh0BHwUkjnVAjJwCF+Fg9lLUc5zISHTm0uulQ8
 WdZw==
X-Gm-Message-State: AOAM531SaSQnZKHq/hCV2fpnmMZWUKhkVITaNCYDl5GTVG81OevFtOsy
 9bYqpKIo+p8qdKnBuw8/GoQ=
X-Google-Smtp-Source: ABdhPJyBM7/z8OiWXdolpSI28qwFk3Z03j+PwAK1KiJ8lNUsCDtKkqn41q74ZppsrBrX3SS23Fcs/w==
X-Received: by 2002:a1c:5459:: with SMTP id p25mr8890538wmi.19.1610725482714; 
 Fri, 15 Jan 2021 07:44:42 -0800 (PST)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id i59sm11757982wri.3.2021.01.15.07.44.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 07:44:41 -0800 (PST)
Date: Fri, 15 Jan 2021 16:44:40 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 5/5] ASoC: tegra: ahub: Reset hardware properly
Message-ID: <YAG4aFADwo7dh/oR@ulmo>
References: <20210112125834.21545-1-digetx@gmail.com>
 <20210112125834.21545-6-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nBwVPcTqRFm05mUj"
Content-Disposition: inline
In-Reply-To: <20210112125834.21545-6-digetx@gmail.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
Cc: alsa-devel@alsa-project.org, Nicolas Chauvet <kwizart@gmail.com>,
 linux-kernel@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>,
 Takashi Iwai <tiwai@suse.com>, Peter Geis <pgwipeout@gmail.com>,
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


--nBwVPcTqRFm05mUj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 03:58:34PM +0300, Dmitry Osipenko wrote:
> Assert hardware reset before clocks are enabled and then de-assert it
> after clocks are enabled. This brings hardware into a predictable state
> and removes relying on implicit de-assertion of resets which is done by
> the clk driver.
>=20
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  sound/soc/tegra/tegra30_ahub.c | 33 ++++++++++++++++-----------------
>  sound/soc/tegra/tegra30_ahub.h |  1 +
>  2 files changed, 17 insertions(+), 17 deletions(-)
>=20
> diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahu=
b.c
> index 4dbb58f7ea36..246cf6a373a1 100644
> --- a/sound/soc/tegra/tegra30_ahub.c
> +++ b/sound/soc/tegra/tegra30_ahub.c
> @@ -65,10 +65,20 @@ static int tegra30_ahub_runtime_resume(struct device =
*dev)
>  {
>  	int ret;
> =20
> +	ret =3D reset_control_assert(ahub->reset);
> +	if (ret)
> +		return ret;
> +
>  	ret =3D clk_bulk_prepare_enable(ahub->nclocks, ahub->clocks);
>  	if (ret)
>  		return ret;
> =20
> +	ret =3D reset_control_reset(ahub->reset);
> +	if (ret) {
> +		clk_bulk_disable_unprepare(ahub->nclocks, ahub->clocks);
> +		return ret;
> +	}
> +
>  	regcache_cache_only(ahub->regmap_apbif, false);
>  	regcache_cache_only(ahub->regmap_ahub, false);
> =20
> @@ -462,7 +472,6 @@ static int tegra30_ahub_probe(struct platform_device =
*pdev)
>  {
>  	const struct of_device_id *match;
>  	const struct tegra30_ahub_soc_data *soc_data;
> -	struct reset_control *rst;
>  	struct resource *res0;
>  	void __iomem *regs_apbif, *regs_ahub;
>  	int ret =3D 0;
> @@ -475,22 +484,6 @@ static int tegra30_ahub_probe(struct platform_device=
 *pdev)
>  		return -EINVAL;
>  	soc_data =3D match->data;
> =20
> -	/*
> -	 * The AHUB hosts a register bus: the "configlink". For this to
> -	 * operate correctly, all devices on this bus must be out of reset.
> -	 * Ensure that here.
> -	 */
> -	rst =3D of_reset_control_array_get_exclusive(pdev->dev.of_node);
> -	if (IS_ERR(rst)) {
> -		dev_err(&pdev->dev, "Can't get reset: %p\n", rst);
> -		return PTR_ERR(rst);
> -	}
> -
> -	ret =3D reset_control_deassert(rst);
> -	reset_control_put(rst);
> -	if (ret)
> -		return ret;
> -
>  	ahub =3D devm_kzalloc(&pdev->dev, sizeof(struct tegra30_ahub),
>  			    GFP_KERNEL);
>  	if (!ahub)
> @@ -507,6 +500,12 @@ static int tegra30_ahub_probe(struct platform_device=
 *pdev)
>  	if (ret)
>  		return ret;
> =20
> +	ahub->reset =3D devm_reset_control_array_get_exclusive(&pdev->dev);
> +	if (IS_ERR(ahub->reset)) {
> +		dev_err(&pdev->dev, "Can't get reset: %p\n", ahub->reset);

I didn't notice that the prior patch already introduced this, but I'd
prefer for this to either be %pe so that the symbolic error name is
printed, or %ld with PTR_ERR(ahub->reset) to format this in a more
standard way that can be more easily grepped for and parsed.

It also seems like the prior patch that converts this to use
of_reset_control_array_get_exclusive() is a bit pointless now. Why not
just move to this directly instead?

Thierry

--nBwVPcTqRFm05mUj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmABuGgACgkQ3SOs138+
s6HpEg/9ELKKB/l2VIM6U1hL0jP6a3U3a6FcQ4eM1uoBvicpEZH0FEJeJxYDyxBF
zAtT473WDtsUNRsUqE1Vhuril6cQJ8Y69885n3UCqQ85lzo0Tn7Gcse9gNqehkDY
6Zwh4R6juN7+83ek1oQ/3K7jdzaUDS032WAWUT/KhIoTSs7WpvM4ZQuROGdG4a2V
uIFiFPqa4TNDiMPuSEpNmNsrcJo4xww+QGuq+ySqsOJnF74b+rGboimcNMoSQbVs
1ZPB1GBvt+k9ixhJRdS/jVm+31vK4bFKtrbVTd3BxEtP6OLEBWXIv2anQwETWIvO
gOBjAhRuzNL9fSGZToyfdRqo7a2Or+t10Of1R0aMiKdaguYQr8FXLfY9rjq/19pw
/9HuEIfneYEZqicos2urNnk0r5gTNcWdo1gNsmqfkZGy9d/DEjZGN/xuhGCUpicq
cBEkfIkg/YvhYcVszhdSVGCs0PuaZ60PHCjTYp1l5ExF/n5J4spMyhWp9AR9cLvz
dX6HeXrmaU98XYYdut2HIQZJ6AJa3UtLTOfqfSrgdwUGgqelPaBXRYmQ5dZda12X
rJ0SWAjplPQmQ3Sj7llJCL2V2Z3X9liphP8q70puqwGhY8QUcb1yiU37fVczvR8S
EuCd40QajKHa3Xj9QS4djfrZ4h7Oh3535k7AJybZ7yeRlgHIhSc=
=g2ZT
-----END PGP SIGNATURE-----

--nBwVPcTqRFm05mUj--
