Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 922084705BD
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Dec 2021 17:30:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 079B92083;
	Fri, 10 Dec 2021 17:29:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 079B92083
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639153835;
	bh=qZMDuSu0HBrM+59b1qeAI3uolB8RNdbS1spN69HoT+I=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kizLwcb3l2SZ7deauNpTA3bXqwy94Nk1MIzkKoeNA2d7XNRCY+11z8gi9lGCj3vBR
	 zB73LmdQxvAbsheqRt/7443ogWwSyUV8NmWuYK3IdogsUbcgKfDFoaO9DvHbbSCJrC
	 wl7zOv6HTEQBdUgOmpqpvTIo9tqdS1nPw7v5MFJM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BB8DF804CC;
	Fri, 10 Dec 2021 17:29:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66C53F804EC; Fri, 10 Dec 2021 17:29:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 85115F804CC
 for <alsa-devel@alsa-project.org>; Fri, 10 Dec 2021 17:29:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85115F804CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jzbpGVlF"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D330DB828B8;
 Fri, 10 Dec 2021 16:29:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF2C9C00446;
 Fri, 10 Dec 2021 16:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639153752;
 bh=qZMDuSu0HBrM+59b1qeAI3uolB8RNdbS1spN69HoT+I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jzbpGVlFIarkB8baQdEADO7/nEvVSRqT4VFYmIXtX8vsB6ZTnvFYckfOtGmJN7OtG
 XGntFrEszDq6lsG/jFi+vT9pTHqbWTaQn2b0lELSmntIlh/ddr8nNfMVRw9kJa7Yi0
 aGM7+AnpF6cSBaghA7EZFV0pWBN6YJuh+Eu6qFupL3+DcRDWJ2xQxV+U7a2yol9tgW
 eDTP8jkZZ+j3JXdutVOtQL3ZXa9bLnpQoonh55FV6H/JsS1I/+ltNMFyudUDeKH2YL
 BbB83Dsk2g9Vqw761ZtSgnUkkfkt/eElz4RrPsaMwW+cIecnKjBdkz8f1ASlGhhoJ5
 wjSDUvijale9w==
Date: Fri, 10 Dec 2021 16:29:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 1/2] ASoC: add ES8156 codec driver
Message-ID: <YbOAUxygSKNUqRZG@sirena.org.uk>
References: <20211210151041.108751-1-chenshumin86@sina.com>
 <20211210151041.108751-2-chenshumin86@sina.com>
 <42b70959-3bfb-7370-4ea4-39833b6e42d9@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="RPJ/HVnd6q16I6zA"
Content-Disposition: inline
In-Reply-To: <42b70959-3bfb-7370-4ea4-39833b6e42d9@linux.intel.com>
X-Cookie: One picture is worth 128K words.
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, Shumin Chen <chenshumin86@sina.com>
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


--RPJ/HVnd6q16I6zA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 10, 2021 at 09:53:39AM -0600, Pierre-Louis Bossart wrote:
> On 12/10/21 9:10 AM, Shumin Chen wrote:

> > +static int es8156_resume(struct snd_soc_component *codec)
> > +{
> > +	return 0;

> es8156_set_bias_level(codec, SND_SOC_BIAS_ON);

> for symmetry with suspend?

Shouldn't be _ON since we're resuming so there should be no running
audio - _STANDBY would be more normal.

> > +static int es8156_probe(struct snd_soc_component *codec)
> > +{
> > +	struct es8156_priv *es8156 = snd_soc_component_get_drvdata(codec);
> > +	int ret = 0;
> > +
> > +	es8156_codec = codec;
> > +
> > +#if MCLK
> > +	es8156->mclk = devm_clk_get(codec->dev, "mclk");
> > +	if (PTR_ERR(es8156->mclk) == -EPROBE_DEFER)
> > +		return -EPROBE_DEFER;
> > +	ret = clk_prepare_enable(es8156->mclk);
> > +#endif

> Unclear how MCLK will be enabled in a build, did you mean

> es8156->mclk = devm_clk_get_optional(codec->dev, "mclk");

Please also move all resource acquisition to the I2C level probe, that
means we don't get the card trying to instantiate repeatedly while the
CODEC isn't ready.

--RPJ/HVnd6q16I6zA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGzgFMACgkQJNaLcl1U
h9A5AAf/YiebKdbXyl+0DSE7I2SvKyOIUApc8JjqOOMjp/kvFYVusyzUC21Ob/R3
7Uh1sC1k5EHQ5Y86UeG1X1XGknXMyLI+5WUo6U8aBqtABUAqq9GMUW4kVlGKvym9
WvPiw57H1iHuJfxJ5F7k++dalqbv+R+MshF/BcYEzwyLNmGC9JeGlJ89K4e5AU1P
HLmcq0umQ9iRrZei0RgTD5G1gU+S4zlLPFfVNUlKSnSpKPDpeU34FU660uRRTp8k
dBbGVVrIeG7B1axqST2gwXNB1mvY/DEXkXe77AUMMnCP0/fyHxorLeyCMlyxpvYd
csK9dx/jgZsh5z3M1PUhdnVus4FdAg==
=Yw/w
-----END PGP SIGNATURE-----

--RPJ/HVnd6q16I6zA--
