Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB1835B23B1
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 18:37:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48239172B;
	Thu,  8 Sep 2022 18:36:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48239172B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662655063;
	bh=z+EAy5tr+0u3cXH5bl2QTwxzn2sBd84H77A80gvaElU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G5h8CicHAteweZqMHi6SWEFfohgdcHauCpOQkT5IstFnjS5b5nlZVL015CkmSE9gR
	 lmGJrKFFxYghizLlW8EDEWZUCj4G1XF9Jrjl8gXpNSr8mAjJ6eyhsv+YiA6bwe4k9a
	 s8MV8PxaOfQCvW2HPrOcdFnYAGo1tuCa9xOCHJ7w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC154F8023B;
	Thu,  8 Sep 2022 18:36:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0F50F80217; Thu,  8 Sep 2022 18:36:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 828E6F8011C
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 18:36:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 828E6F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="alCtEdhd"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DBCEB61D09;
 Thu,  8 Sep 2022 16:36:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D8FEC433C1;
 Thu,  8 Sep 2022 16:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662654994;
 bh=z+EAy5tr+0u3cXH5bl2QTwxzn2sBd84H77A80gvaElU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=alCtEdhdRgiGW9ouvPeAWzLHKBgiFcKflgrGN4umL8ZgvwlCt/vuOHyxMsZlaOknf
 6r9awQI3KJ/7JMagoAP2TYbUZN+ihpRJrrqBzXa0775dC/zJbek88ugWWH8ijBKMDC
 SUC1n4tLJ6YaGJCuyYtOMcnKMI3iUxNLqChE4V+nIxwxlaG4jwtRkgHCczbCOAEqhJ
 JjMm9OSWn4KDv5OWHKig1nleHbxkCmn3AcoAW7Wg6MUXy6vvE+a8ecf7NZ12roYK26
 S6toLc9x/ERxzgQLxng2NdgAf1E69bbExqT0yMCbsK+y0EZw6pF++kBtjsMRAhrnVB
 MjlSz3kQONVtA==
Date: Thu, 8 Sep 2022 17:36:27 +0100
From: Mark Brown <broonie@kernel.org>
To: luca.ceresoli@bootlin.com
Subject: Re: [PATCH 5/8] ASoC: rockchip: i2s-tdm: Fix clk_id usage in
 .set_sysclk()
Message-ID: <YxoaC5OAv/oES+jQ@sirena.org.uk>
References: <20220907142124.2532620-1-luca.ceresoli@bootlin.com>
 <20220907142124.2532620-6-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="n9PmSJv+Ru1ZxyoW"
Content-Disposition: inline
In-Reply-To: <20220907142124.2532620-6-luca.ceresoli@bootlin.com>
X-Cookie: Metermaids eat their young.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Heiko Stuebner <heiko@sntech.de>, Takashi Iwai <tiwai@suse.com>,
 Chris Morgan <macromorgan@hotmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Johan Jonker <jbx6244@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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


--n9PmSJv+Ru1ZxyoW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 07, 2022 at 04:21:21PM +0200, luca.ceresoli@bootlin.com wrote:

> -static int rockchip_i2s_tdm_set_sysclk(struct snd_soc_dai *cpu_dai, int stream,
> +static int rockchip_i2s_tdm_set_sysclk(struct snd_soc_dai *cpu_dai, int clk_id,
>  				       unsigned int freq, int dir)
>  {
>  	struct rk_i2s_tdm_dev *i2s_tdm = to_info(cpu_dai);
> @@ -978,15 +981,18 @@ static int rockchip_i2s_tdm_set_sysclk(struct snd_soc_dai *cpu_dai, int stream,
>  	if (i2s_tdm->clk_trcm) {
>  		i2s_tdm->mclk_tx_freq = freq;
>  		i2s_tdm->mclk_rx_freq = freq;
> +
> +		dev_dbg(i2s_tdm->dev, "mclk freq: %u", freq);
>  	} else {
> -		if (stream == SNDRV_PCM_STREAM_PLAYBACK)
> +		if (clk_id == CLK_IDX_MCLK_TX)
>  			i2s_tdm->mclk_tx_freq = freq;
> -		else
> +		else if (clk_id == CLK_IDX_MCLK_RX)
>  			i2s_tdm->mclk_rx_freq = freq;
> -	}
> +		else
> +			return -ENOTSUPP;

This should be a switch statement for clarity and exensibility.

--n9PmSJv+Ru1ZxyoW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMaGgoACgkQJNaLcl1U
h9AUXwf/Ybq47bEk4QDfoPEAToGlvieUKHsFJ8BDFyusjrLmwXm1GWgzWOuF7VuB
rAHrRYsRWOIXHMW6oVOf+Zlll9w1n292d2eyelotnTsvAAgBi/vG6g4OmOtTD3I9
W9rPB2x+xkR2rz/sQd/hbGxPxa6sU0ymEX5ScOuA9NejRSr3Y0t/GgY3LWOCKJsC
2U9Oj5P/qX4qPDo/6Qf7ybfVr7jXwWsatgIzX5DyRpbKbvk9JbDMv5dssp9VStUU
Q998qqb8+Reec2p62tuZd8JpotC3OVhkiSTcHeO0UCgcuLCz+QQ3PPxgESe9BQWG
wUSmVEs8J1Ushh+d+5shIT+ZQyBApA==
=MFhn
-----END PGP SIGNATURE-----

--n9PmSJv+Ru1ZxyoW--
