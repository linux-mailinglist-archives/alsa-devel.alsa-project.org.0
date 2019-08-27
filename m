Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B6D9DE58
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2019 09:03:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D468B1669;
	Tue, 27 Aug 2019 09:02:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D468B1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566889386;
	bh=uIRsquMqfh97Vjb91bAoctbggQSzbtbrcCjop4wqrN4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZkXuy7O3uKw506psE9PWYczGj5I6qooDmziGSrePInmkeqp55wj1Wmxkl5aQB1/3i
	 R0Z2BWTmJhzI0xrHglD+ZjAaHzjGZGOX90Hl8/M6qt2F0kbu+ADlZnkrRVt8HsQ91A
	 E2WiMvexKenRngJbKiqtvjRb4tCZGlcVP0uGBXhA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3552AF802A1;
	Tue, 27 Aug 2019 09:01:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11855F80274; Tue, 27 Aug 2019 09:01:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9AAD9F80142
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 09:01:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AAD9F80142
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hgQhsTQ0"
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C88C1206BF;
 Tue, 27 Aug 2019 07:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566889264;
 bh=Biq9mF8dTT+XjGplKumTdtUTNHz0ImKVfvD7CkyAwj0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hgQhsTQ0uGStkRN08ze0pp7gYCNZAgjNr980p+jcVF5VXiEywouzHu1X/QaioYG7h
 pCwT9TmFUF4jd97IjGFMlF+qXHiYfnmwMA/XS1uzU8+t2GJf5VfqFsV2wMcd3tXQ08
 RHKJsMf0efsZ6ws16aWkFS5lZ0ADFggxZxhDxI0I=
Date: Tue, 27 Aug 2019 09:01:01 +0200
From: Maxime Ripard <mripard@kernel.org>
To: codekipper@gmail.com
Message-ID: <20190827070101.tastgcqvzrgv3kc5@flea>
References: <20190826180734.15801-1-codekipper@gmail.com>
 <20190826180734.15801-4-codekipper@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190826180734.15801-4-codekipper@gmail.com>
User-Agent: NeoMutt/20180716
Cc: alsa-devel@alsa-project.org, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, be17068@iperbole.bo.it,
 wens@csie.org, broonie@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH v6 3/3] ASoC: sun4i-i2s: Adjust LRCLK width
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
Content-Type: multipart/mixed; boundary="===============0931111125778618169=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0931111125778618169==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aewobl2wvpczcoyt"
Content-Disposition: inline


--aewobl2wvpczcoyt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 26, 2019 at 08:07:34PM +0200, codekipper@gmail.com wrote:
> From: Marcus Cooper <codekipper@gmail.com>
>
> Some codecs such as i2s based HDMI audio and the Pine64 DAC require
> a different amount of bit clocks per frame than what is calculated
> by the sample width. Use the values obtained by the tdm slot bindings
> to adjust the LRCLK width accordingly.
>
> Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> ---
>  sound/soc/sunxi/sun4i-i2s.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> index 056a299c03fb..0965a97c96e5 100644
> --- a/sound/soc/sunxi/sun4i-i2s.c
> +++ b/sound/soc/sunxi/sun4i-i2s.c
> @@ -455,7 +455,10 @@ static int sun8i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
>  		break;
>
>  	case SND_SOC_DAIFMT_I2S:
> -		lrck_period = params_physical_width(params);
> +		if (i2s->slot_width)
> +			lrck_period = i2s->slot_width;
> +		else
> +			lrck_period = params_physical_width(params);
>  		break;

That would be the case with the DSP formats too, right?

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--aewobl2wvpczcoyt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXWTVLQAKCRDj7w1vZxhR
xSAlAQCvR8zoBbzxDhfl4BOVHlf7M+d/VwTWUWIndBN6/bMNDAD+KSWSTL9rCbyM
5aTcKxbY8Hi2H/ljbFggOIAykqgEnQI=
=88rE
-----END PGP SIGNATURE-----

--aewobl2wvpczcoyt--

--===============0931111125778618169==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0931111125778618169==--
