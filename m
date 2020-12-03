Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A662CD97E
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Dec 2020 15:44:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 090B5183F;
	Thu,  3 Dec 2020 15:44:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 090B5183F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607006699;
	bh=DxJ4yIYFgoE+1eOz/ODDS5hA3PYUv9G+Xtpre9H2l3U=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iTyyZA3barS2nkW8Y3zpD0n4BOsEmNSuczXcun3dGiglgBE20zg2JWYDuj6/C5DJe
	 gNOQyEocTzh+gdgwhtW7e4hYs9Ywz/pWATiGMABP03Ax9i4wAciuH1JxOe/rjSVi4H
	 FL4dMsPReGIneXsUAN9sIHdwtJcfIkIzHFLr7zZk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82785F8026B;
	Thu,  3 Dec 2020 15:44:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80A88F8025F; Thu,  3 Dec 2020 15:44:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6AE8F80082
 for <alsa-devel@alsa-project.org>; Thu,  3 Dec 2020 15:44:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6AE8F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="t6YKWIB+"
Date: Thu, 3 Dec 2020 14:43:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607006639;
 bh=DxJ4yIYFgoE+1eOz/ODDS5hA3PYUv9G+Xtpre9H2l3U=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=t6YKWIB+WG0ISjOdzos63GK19W7EXUSf5DOAIg5xNO0Qd6voGpvfVSsNfMyzth2kT
 kQGPY0CC2GSrS+9NA2onWGCzvP57m3NFXrZ6CTxJG0Qy8Kl7Vh2EKR6Ebn50l/lDjw
 srbZgZOv7pIILINBadg/xsnLwHsnIg48wWzsLczP/0uw1vudr87Ci2c4ETN5HQrC/i
 h+HNoatu9wTRuRtgBmz0bJ0XFnFz3ZGRiDvgcnrZud6co5dSVFDEtG/BpcqwXLE7lv
 XSPByT4+xQI5qUoDJ4JEjQV0TNLnBhLz30OXF6DJCNOFvj3kEPTTzUonYeMqHmn4JL
 H2AtLhsJd4Xkg==
From: Mark Brown <broonie@kernel.org>
To: Chuhong Yuan <hslester96@gmail.com>
Subject: Re: [PATCH] ASoC: amd: add missed checks for clk_get()
Message-ID: <20201203144356.GG4700@sirena.org.uk>
References: <20201203143116.405930-1-hslester96@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rV8arf8D5Dod9UkK"
Content-Disposition: inline
In-Reply-To: <20201203143116.405930-1-hslester96@gmail.com>
X-Cookie: Sacred cows make great hamburgers.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Agrawal Akshu <Akshu.Agrawal@amd.com>
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


--rV8arf8D5Dod9UkK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 03, 2020 at 10:31:16PM +0800, Chuhong Yuan wrote:

>  	da7219_dai_wclk = clk_get(component->dev, "da7219-dai-wclk");
> +	if (IS_ERR(da7219_dai_wclk))
> +		return PTR_ERR(da7219_dai_wclk);
> +
>  	da7219_dai_bclk = clk_get(component->dev, "da7219-dai-bclk");
> +	if (IS_ERR(da7219_dai_bclk))
> +		return PTR_ERR(da7219_dai_bclk);

This is also buggy - instead of ignoring the errors (which is an issue)
we now leak the wclk if the bclk fails.  Probably should convert to devm
as well.

--rV8arf8D5Dod9UkK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/I+asACgkQJNaLcl1U
h9B6wQf/WHDDI4u+PUzca/wx02KyGxHEMupD7sXA+muUTiOQJBg5ZjZsrhA8A1hm
QE1YZhTrsOoNgVOMxJf6xTNOZuuL4SLg1Ui425NLyEo1RFGje54n+sH4bHqYhI+Z
86YIurOLx9pyazc6eJUzhOWC4A99ZoaOP8tTztw3Q3rbtktTNavbD54ypj0C+pb8
YoJlgqI5RYaDNvxDc23s5UiEUgTDG/Ux7kjAn7b44y3sApcuUNYPXWkhgSWSfPmY
j6073kxyYlLUwnsa/ZhZcx4ebFzA1mgz6bf8hdkxW+dszJxh7/GPTfj2eWmgBz57
9o9c433ExVA2aVQLLoZjPA4HCDudZA==
=6c+8
-----END PGP SIGNATURE-----

--rV8arf8D5Dod9UkK--
