Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F4054DCEA
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 10:30:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D2561AA8;
	Thu, 16 Jun 2022 10:29:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D2561AA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655368212;
	bh=cuRduGGXj2Y/+lglkT8q2s4iGVAPd9QSM6DFTbaLwsg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UAGTZtDIK4ntZH5sY4FQcIT94Okqv4ufCZUvmmkO+k0VD+0T9aOSr3sL2QX8sf6Af
	 DYWvAVnFgu/8/AQXQKqAyl/zppjYU/ScP/hc6MUrbiFtBoJH4SvsvdOt40GljdVvtm
	 EpfXeYIJQTGi2UAPfgqDaQwplUFgUPZXOm7+F9dQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F4AEF800B9;
	Thu, 16 Jun 2022 10:29:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FA30F801D8; Thu, 16 Jun 2022 10:29:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8213DF800B9
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 10:29:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8213DF800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="C6Zm+uGD"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 254E261D4A;
 Thu, 16 Jun 2022 08:29:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FD5BC3411B;
 Thu, 16 Jun 2022 08:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655368140;
 bh=cuRduGGXj2Y/+lglkT8q2s4iGVAPd9QSM6DFTbaLwsg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C6Zm+uGDAZlCfuXL+7jVy9JTNhPGU8P7JdIWUWqYW7m7hpdwHYqzvNZmjgVbik80u
 fZD0DC6UEe3vLasuc8e1Qp4/m1LR3kgfbJ78L2lF2AUq7WH3gkHuDKt8DNpyNSBy9I
 JMQavnUGum3CwCIYYn/VNEfeQK71LgHL+ZVwRaHrOR/BzPxNwd2CHAVbdRDAmF3POq
 Thc8N8tWeCvKlTsZJySVybPKMvrcfbC57lrf7VDlNF+Sk1QqpKcAfWgF1Dy4U0EuHZ
 /mqMXMK0+WNwr0T5hKeRiAgEPiZDdPlOWHLI5NADG62SULN0hw9WQRJ/XzWYlaxDh9
 +j7bCSG8X23hg==
Date: Thu, 16 Jun 2022 09:28:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 2/3] ASoC: sun50i-codec-analog: Add support for internal
 bias
Message-ID: <YqrpxWrnaqqYWaGC@sirena.org.uk>
References: <20220616062554.57266-1-samuel@sholland.org>
 <20220616062554.57266-3-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="sAeK2/sljyNuWwJM"
Content-Disposition: inline
In-Reply-To: <20220616062554.57266-3-samuel@sholland.org>
X-Cookie: Pass with care.
Cc: devicetree@vger.kernel.org, Arnaud Ferraris <arnaud.ferraris@collabora.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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


--sAeK2/sljyNuWwJM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 16, 2022 at 01:25:53AM -0500, Samuel Holland wrote:

> +static int sun50i_a64_codec_probe(struct snd_soc_component *component)
> +{
> +	struct sun50i_codec_analog *codec = snd_soc_component_get_drvdata(component);
> +
> +	regmap_update_bits(component->regmap, SUN50I_ADDA_JACK_MIC_CTRL,
> +			   BIT(SUN50I_ADDA_JACK_MIC_CTRL_INNERRESEN),
> +			   codec->internal_bias_resistor <<
> +				SUN50I_ADDA_JACK_MIC_CTRL_INNERRESEN);
> +
> +	return 0;
> +}

It doesn't make much practical difference but is there any reason this
can't be done in the main device probe?

--sAeK2/sljyNuWwJM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKq6cUACgkQJNaLcl1U
h9BR4gf/WzTzXWC2DYw4VnEvPsv/DcmGEFWM2OxZieteTb8WSNpVt6LjTYrajpjH
IMvOdqI3VRl3Ews5PI/DJX4NMZxBTwHF78kM8sFN8hTr9ANJUiGfTptv2HQ173tX
lgmmQD6XNlxuoR52CQaln3HRGdqgZT/KPHU3ikI7RDMB97Uvy7hBEP9W4nBc0AC8
8RLfeiru1vpq93VjCEyimUUY0CDij2eGKwgcbej5m45+33GUde2QVbF0SdExthP5
w/7+7C7HpqBg8kNuUKS1Qyh+QGxCKiuhdsMBYGLfsIVuGcvVjiKPwkrTj9s5wPU7
1vdqvkzXaqSBecgRohtLNU+tOOqMtQ==
=1ZsU
-----END PGP SIGNATURE-----

--sAeK2/sljyNuWwJM--
