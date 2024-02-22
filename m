Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 774C185FCF9
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Feb 2024 16:48:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E92A393A;
	Thu, 22 Feb 2024 16:48:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E92A393A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708616909;
	bh=ZEQ3TuXtQ1HZkjiFkZjRQexbw/7ACSFzMu3l/emJLw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Hu2u4i8yJT/GYJBn1utHud2N9HI2ynN1FtdI94XbdlmurmM1ZtAvKjtwHO5ZJIHSj
	 S5ofPcouOwlBK8z3VX8XAJhuQJuX3tqFqyyrO5t2kO1nrOfeIZ8MlXJ6Cb3CDuBZos
	 03tEVpUmSY2OaR45hPf1xotIMZQ5dD1Cg3ckhfT4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6074BF805A1; Thu, 22 Feb 2024 16:47:53 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CAC49F805A0;
	Thu, 22 Feb 2024 16:47:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8249CF80496; Thu, 22 Feb 2024 16:47:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9A272F800ED
	for <alsa-devel@alsa-project.org>; Thu, 22 Feb 2024 16:47:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A272F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=omK6Fsoe
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DB013618E5;
	Thu, 22 Feb 2024 15:47:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6015C433F1;
	Thu, 22 Feb 2024 15:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708616860;
	bh=ZEQ3TuXtQ1HZkjiFkZjRQexbw/7ACSFzMu3l/emJLw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=omK6FsoeI1CmcgHU2vWay4w7nXK5X5mgurfwE4sCPsXzV9xD+Lp4QAQ0l3QK+/pxQ
	 yAQ6eLf2uMyhLXrzIYkQ9L0gpvbDeHB1T9K5uUTygvHOx7y4/iTUAsCGXts4mTq2bS
	 3ZRZVBE9nRGheoUYiNLPMFIfZJCpZH/hEOmoUz5CjMlU72RmUqGyNyO/vKa3OD0zJ/
	 3BQpJ4XsBfBdidPZ3DS/NnVQrOaoyEbCbwFOZViSd6Zi4M1SzKhRM/x/z89vqW+9Tj
	 s3A2tT4ChwWY7yU6ewZipVDWRytyaGLQK1lTBP/BBKJaN0lugY6I+0j0gDzBJ1RuzG
	 L/hq2ck9YkSBw==
Date: Thu, 22 Feb 2024 15:47:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Seven Lee <wtli@nuvoton.com>
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	robh+dt@kernel.org, conor+dt@kernel.org, YHCHuang@nuvoton.com,
	KCHSU0@nuvoton.com, CTLIN0@nuvoton.com, SJLIN0@nuvoton.com,
	scott6986@gmail.com, supercraig0719@gmail.com, dardar923@gmail.com
Subject: Re: [PATCH v2 2/2] ASoC: nau8325: new driver
Message-ID: <6ffb4165-95e0-4ccd-868f-8ecda56b4079@sirena.org.uk>
References: <20240222083825.190854-1-wtli@nuvoton.com>
 <20240222083825.190854-3-wtli@nuvoton.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e7yScaGYIov+nAEz"
Content-Disposition: inline
In-Reply-To: <20240222083825.190854-3-wtli@nuvoton.com>
X-Cookie: I have accepted Provolone into my life!
Message-ID-Hash: GIGURUWKICJXIL6XPYQ5F2EVMNZDZHLB
X-Message-ID-Hash: GIGURUWKICJXIL6XPYQ5F2EVMNZDZHLB
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GIGURUWKICJXIL6XPYQ5F2EVMNZDZHLB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--e7yScaGYIov+nAEz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 22, 2024 at 04:38:25PM +0800, Seven Lee wrote:

A few very minor things below but basically this looks good.

> +static int nau8325_clksrc_choose(struct nau8325 *nau8325,
> +				 const struct nau8325_srate_attr **srate_table,
> +				 int *n1_sel, int *mult_sel, int *n2_sel)
> +{

> +proc_done:
> +	dev_err(nau8325->dev, "nau8325->fs=%d,range=0x%x, %s, (n1,mu,n2,dmu):(%d,%d,%d), MCLK_SRC=%uHz (%d)",
> +		nau8325->fs, (*srate_table)->range,
> +		(*srate_table)->max ? "MAX" : "MIN",
> +		*n1_sel == CLK_PROC_BYPASS ?
> +		CLK_PROC_BYPASS : mclk_n1_div[*n1_sel].param,
> +		*mult_sel == CLK_PROC_BYPASS ?
> +		CLK_PROC_BYPASS : 1 << mclk_n3_mult[*mult_sel].param,
> +		1 << mclk_n2_div[*n2_sel].param,
> +		(*srate_table)->mclk_src[ratio],
> +		(*srate_table)->mclk_src[ratio] / nau8325->fs);

This should be a dev_dbg(), dev_err() will be very noisy in normal
operation.

> +static int nau8325_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct nau8325 *nau8325 = snd_soc_component_get_drvdata(component);
> +	unsigned int ctrl1_val = 0;
> +
> +	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> +	case SND_SOC_DAIFMT_CBS_CFS:
> +		break;

Please use the modern _CBC_CFC defines.

> +	ret = regmap_read(nau8325->regmap, NAU8325_R02_DEVICE_ID, &value);
> +	if (ret) {
> +		dev_err(dev, "Failed to read device id (%d)", ret);
> +		goto err;
> +	}

Probably a good idea to check that the device ID is what we expected
too.

--e7yScaGYIov+nAEz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXXbJYACgkQJNaLcl1U
h9B1UQf/bbkyPq72hB16DeF5r7ZEpD8pxmWbH7Z+fKteU+6U295SCSHqnxBE+KX2
taIj/NfQ5964S9buK72KAeaiwI4o7d6duiqXCiy2vlLIBe4X+RBG4Ch+5E7SUdAu
ovjwmHLvfyJPCqcflNpxDQ35sVOrph6kFTi7UywOiY0X3oWAnIMuQK/wnGq2rfgB
tSKpUJU9AhGUog03Fg8D4kK+5SuQ5Wb6kfUfrYbDLrrxSxQeAWlgLuTJ84RDZ5gq
QAoLemPwWspvf8wLK71i22ETnllb87XHFzCuRv9ZXlqckJOjHSFHBHNcBGIAjXqb
2cMhEzQZj137Wwu6n+Dc8NE5g9hO4Q==
=9vMY
-----END PGP SIGNATURE-----

--e7yScaGYIov+nAEz--
