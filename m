Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4249963F
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 16:20:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D582D16A5;
	Thu, 22 Aug 2019 16:19:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D582D16A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566483632;
	bh=e+9b00zSBDEWWUON2a5PSBYf6a7PzbbJcAPvFNmMs+8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q2scRziSvCalMHEeioSQZWn2Aha2P5UKxim4nUB4j0oj896Wub91tTydvl/nLUnk7
	 +vv7Z6XSwJLnFFyV9On1g+IxO1D0+GKBEclQNCBxcStq8/IIHXY/WjNQT8ZWzVkcjx
	 ucgM3/wlCeJ7ZZenIiMEze4/9Kcce53dxF4I6O9s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91DBEF805F7;
	Thu, 22 Aug 2019 16:18:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C33CF805F5; Thu, 22 Aug 2019 16:18:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4F09FF805E1
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 16:18:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F09FF805E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CPBQBdB5"
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3513421743;
 Thu, 22 Aug 2019 14:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566483508;
 bh=gmxMQJV4pqxZQO3wcgdhCDUc992RIMAHvgrcXbGDS7Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CPBQBdB5hA6kDZZpQjWgtb5+2+cbcqWt3sKnBOG+g5UPJbkk+JN7aswR0V0k/sMAJ
 1AhgX5ZA7VkTf7URGjG6bqR5uz4tjLsWWiWLhBF3VeH8UvPYRIHqtmtKNcSkMj8S0t
 qrnCyIk3UgRRSD/5njrMoABJZqyw5QNTAno6Vlow=
Date: Thu, 22 Aug 2019 16:18:26 +0200
From: Maxime Ripard <mripard@kernel.org>
To: YueHaibing <yuehaibing@huawei.com>
Message-ID: <20190822141826.is6nizjpdgvhd7ra@flea>
References: <20190822065252.74028-1-yuehaibing@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20190822065252.74028-1-yuehaibing@huawei.com>
User-Agent: NeoMutt/20180716
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Marcus Cooper <codekipper@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH -next] ASoC: sun4i-i2s: Use PTR_ERR_OR_ZERO
 in sun4i_i2s_init_regmap_fields()
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
Content-Type: multipart/mixed; boundary="===============7663730886706233598=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7663730886706233598==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="63ssjdwokv3xdxzu"
Content-Disposition: inline


--63ssjdwokv3xdxzu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Thu, Aug 22, 2019 at 06:52:52AM +0000, YueHaibing wrote:
> Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  sound/soc/sunxi/sun4i-i2s.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> index 9e691baee1e8..2071c54265f3 100644
> --- a/sound/soc/sunxi/sun4i-i2s.c
> +++ b/sound/soc/sunxi/sun4i-i2s.c
> @@ -1095,10 +1095,7 @@ static int sun4i_i2s_init_regmap_fields(struct device *dev,
>  	i2s->field_fmt_sr =
>  			devm_regmap_field_alloc(dev, i2s->regmap,
>  						i2s->variant->field_fmt_sr);
> -	if (IS_ERR(i2s->field_fmt_sr))
> -		return PTR_ERR(i2s->field_fmt_sr);
> -
> -	return 0;
> +	return PTR_ERR_OR_ZERO(i2s->field_fmt_sr);

I'm not really convinced that this more readable or more maintainable
though. Is there a reason for this other than we can do it?

Maxie

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--63ssjdwokv3xdxzu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXV6kMgAKCRDj7w1vZxhR
xYfCAQCzZc0NwL/KfHnmN5cCqmspt4rw9g7yY9ueTUdm/d4SMAD/U5pvKe6kNk6f
0GRxtaBnisn3CWTssq3fqkAzCBywhgk=
=VH9U
-----END PGP SIGNATURE-----

--63ssjdwokv3xdxzu--

--===============7663730886706233598==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7663730886706233598==--
