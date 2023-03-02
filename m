Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2883F6A8212
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Mar 2023 13:21:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1F151F6;
	Thu,  2 Mar 2023 13:20:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1F151F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677759683;
	bh=UkLrRZGFWz4j9QDCZEWFzdN5QysERiBI8gpLVzs0Ss8=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q/owhM8rNNUMIAfxGaIpym5pYbQq3pPGuIA5vWUPai/P0jCdb2wLkQzkQLJn8Ajb8
	 6MJlJTdZ+VjaI4aIDoZXXyBeQDVZPsV30slOpKtBomrl/gUuXleFCxu7jX733g9aeM
	 ofTUPhEuUh1gj9LzQfTn/a282VBlYbixjR0Ek+Rc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3668F80310;
	Thu,  2 Mar 2023 13:20:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC898F8049C; Thu,  2 Mar 2023 13:20:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BFAC3F800DF
	for <alsa-devel@alsa-project.org>; Thu,  2 Mar 2023 13:20:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFAC3F800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Jc+2QXJZ
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E3B6FB811EF;
	Thu,  2 Mar 2023 12:20:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38027C433D2;
	Thu,  2 Mar 2023 12:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677759624;
	bh=UkLrRZGFWz4j9QDCZEWFzdN5QysERiBI8gpLVzs0Ss8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jc+2QXJZDZRysL8lvu7f7BBWGcMnP656F43eWCBBO6elfthqASaUNwc8v0VOImKy/
	 njDycTe4B8sWChXD2RV62gSsRmf2IXDanTXbNF8NU7W4Wdq+1peRTUvrAyGorQXsBJ
	 GnuSyD0azT3DH65uaO2zWZM8v0uFdNxvsMdZ/JiOyi9jUQQVS9q/2NhTPmCx19dpIy
	 yWunxw9UuUMhics9ohLCBvKmDiH0bKBh6SI/+wUuayFXwxTD9Z9C1guTl6bsDuYDat
	 J0Y4U69qR1lhbkq474DsoGGasaSPrWg54Dul3Wt+RWUQq1czUW3TA9hwA06kK5bShG
	 JY6fj0Oxuj/Dw==
Date: Thu, 2 Mar 2023 12:20:18 +0000
From: Mark Brown <broonie@kernel.org>
To: richard.leitner@linux.dev
Subject: Re: [PATCH 3/3] ASoC: maxim,max9867: add "mclk" support
Message-ID: <b0a5c0c2-dfbd-460a-af0d-c9d498607d72@sirena.org.uk>
References: <20230302-max9867-v1-0-aa9f7f25db5e@skidata.com>
 <20230302-max9867-v1-3-aa9f7f25db5e@skidata.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vZhJFgRVoDnGJw+Q"
Content-Disposition: inline
In-Reply-To: <20230302-max9867-v1-3-aa9f7f25db5e@skidata.com>
X-Cookie: Who messed with my anti-paranoia shot?
Message-ID-Hash: UDOKSCWNUM3WUIBWK3FU7JNKTRTGGFIG
X-Message-ID-Hash: UDOKSCWNUM3WUIBWK3FU7JNKTRTGGFIG
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ladislav Michl <ladis@linux-mips.org>, Takashi Iwai <tiwai@suse.com>,
 Benjamin Bara <benjamin.bara@skidata.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Richard Leitner <richard.leitner@skidata.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UDOKSCWNUM3WUIBWK3FU7JNKTRTGGFIG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--vZhJFgRVoDnGJw+Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 02, 2023 at 12:55:03PM +0100, richard.leitner@linux.dev wrote:

> +	max9867->mclk = devm_clk_get(&i2c->dev, "mclk");
> +	if (IS_ERR(max9867->mclk))
> +		return PTR_ERR(max9867->mclk);
> +	ret = clk_prepare_enable(max9867->mclk);
> +	if (ret < 0)
> +		dev_err(&i2c->dev, "Failed to enable MCLK: %d\n", ret);
> +

Nothing ever disables the clock - we need a disable in the remove path
at least.

--vZhJFgRVoDnGJw+Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQAlIEACgkQJNaLcl1U
h9CpjQf8DCWgZStUPCJltIYPDoRugIPverAChi1iNMKLKqO9Rwi3VF2ulGPf9639
hTE+u7lHCXrsfWLn0BpvQk+RZ4aJTnbTbj9ndDlnSPWStGpcl6pIK4i5S3R7RvYJ
KesklhoL1nRCoBlYpwEdpnfRz6TL0NMo3bsqxHZqhGAxNcXuT/8ylPr3dPWYSljP
FiqTg6fqtBAuXES4A9OxtllOrcYMc5VbvEdNtIOyfVs3gNzJaMiiVX2LUG1t4bS3
6QXssdNh5JQHzZwkwKHE2gKiTHR3i3nK4RNBD9WB//DVCDaPuzPLASiyNz5m72T4
zDHfnV2WYtGr2tKlR82hF3AV8C1vfg==
=YJvp
-----END PGP SIGNATURE-----

--vZhJFgRVoDnGJw+Q--
