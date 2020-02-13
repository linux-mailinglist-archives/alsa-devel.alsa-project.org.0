Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E5F15CA43
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 19:23:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B86F16C5;
	Thu, 13 Feb 2020 19:22:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B86F16C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581618228;
	bh=BdKN7LlGWzvLuzKF56joFaOIbCQE/t+aBDWtBRklKtc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NjLstYstZIhN5nTu6/FCsqx+qvgNgvx+tuj1eFek64dsftCpzxVcAhfHval5Dl5ps
	 JwRBOaMWhZyUhxQIIrx9K/m4s9APYdIchJAji+FSvYY0pWYd82KJBfxkP6Wmv424Ny
	 fuSTVgg0aUM6dTJJ2SEYwg0D0SApSXSLgvNliDKI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35EB9F80146;
	Thu, 13 Feb 2020 19:22:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88E55F80145; Thu, 13 Feb 2020 19:22:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id D3853F800F0
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 19:22:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3853F800F0
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACFE6328;
 Thu, 13 Feb 2020 10:21:59 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 300043F68E;
 Thu, 13 Feb 2020 10:21:59 -0800 (PST)
Date: Thu, 13 Feb 2020 18:21:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Message-ID: <20200213182157.GJ4333@sirena.org.uk>
References: <20200213155159.3235792-1-jbrunet@baylibre.com>
 <20200213155159.3235792-6-jbrunet@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20200213155159.3235792-6-jbrunet@baylibre.com>
X-Cookie: Academicians care, that's who.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 5/9] ASoC: meson: aiu: add hdmi codec
	control support
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
Content-Type: multipart/mixed; boundary="===============7443057751367034463=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============7443057751367034463==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QnBU6tTI9sljzm9u"
Content-Disposition: inline


--QnBU6tTI9sljzm9u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 13, 2020 at 04:51:55PM +0100, Jerome Brunet wrote:

> +int aiu_add_component(struct device *dev,
> +		      const struct snd_soc_component_driver *component_driver,
> +		      struct snd_soc_dai_driver *dai_drv,
> +		      int num_dai,
> +		      const char *debugfs_prefix)
> +{
> +	struct snd_soc_component *component;
> +
> +	component = devm_kzalloc(dev, sizeof(*component), GFP_KERNEL);
> +	if (!component)
> +		return -ENOMEM;
> +
> +#ifdef CONFIG_DEBUG_FS
> +	component->debugfs_prefix = debugfs_prefix;
> +#endif

You really shouldn't be doing this as it could conflict with something
the machine driver wants to do however it's probably not going to be an
issue in practice as it's not like there's going to be multiple SoCs in
the card at once and if there were there'd doubltess be other issues.

--QnBU6tTI9sljzm9u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5Fk8QACgkQJNaLcl1U
h9CAhwf/cuQA52n4KErDZvZn7/DzU7OY4w6BULQb6pd6r1CgFm/rd1Fgf9QLK2yQ
Yu4cKdsOCcT4YH0Abf5r7n0uNFnCdd4U9c+L+MnQ912Yu8ZV70+X9D9OniFif59u
WVmnNC/sRTatvyefGnTDu//nHF29Yc10S6V+wPbFFACYONJ2s9SKEWCGZrclawkE
mIopqJBFRcz7q2iCaPI8onRuIe5VtF7SeEk0XkFRQsdqPacrJF0JQQFuui2vYBq5
Nu1SDN2ma7iXiSssC9Oy/iCv70WpDLMtYTHz35XiooaHkYKxi2xKkluXWOpy/Dcc
hMVncK5RF58ft+ILMKSg9TXFiEcN0w==
=iCR2
-----END PGP SIGNATURE-----

--QnBU6tTI9sljzm9u--

--===============7443057751367034463==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============7443057751367034463==--
