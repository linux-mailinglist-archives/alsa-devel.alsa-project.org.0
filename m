Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 126218C75C9
	for <lists+alsa-devel@lfdr.de>; Thu, 16 May 2024 14:16:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BFB6857;
	Thu, 16 May 2024 14:15:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BFB6857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715861760;
	bh=PgBb5IuMLJI8Ia1873iobO8fM2Zu/m/kbxqQ5D7vmUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ASpICZrzFrctFNWfwagUKz8H24Z+4QYltVs6pYKnA8Qw6HzLdQbcsuYkf7kEqQ1Pe
	 5wII0SK6deK5oOf5W0WlGlN7CW9PiiIvXkGOQBf2y8SE9b+fhtDkXnvNSOMuKF92ZW
	 AZh8fApMu6MWWdJuO3g0M6TSiAP2+2Ee6tumCmso=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51890F80588; Thu, 16 May 2024 14:15:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AA7B6F80563;
	Thu, 16 May 2024 14:15:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 04694F80224; Thu, 16 May 2024 14:13:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6BEC7F8024C
	for <alsa-devel@alsa-project.org>; Thu, 16 May 2024 14:13:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BEC7F8024C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tQmjf34/
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E2D46CE18A6;
	Thu, 16 May 2024 12:13:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 473CFC113CC;
	Thu, 16 May 2024 12:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715861605;
	bh=PgBb5IuMLJI8Ia1873iobO8fM2Zu/m/kbxqQ5D7vmUY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tQmjf34/DI3xuTTNyYHqNO9Y/SzC1Ul8Bh5Hu+0vGFB8gLlzi8DfFjCbxwFVAkksY
	 7pbHIbnuztMGwl4OwgLI/36pKCrOIFMgMHKkd2CAbCjoDZq4R9w9r1uvbWavioECN0
	 7IDtEej3Hn1PQZd5zakbze5ot2Mt8tcpCPVlfHUufn+mMeNc4bCOdOEg+cilymEIAu
	 IXq/FaXZVwMirysn/WaRj5qqNYqcmP8kQZQ30eGDhnsSTL2uWwQSILi6K2rXm49Bpt
	 tlIxPQImgZFBFIaGoNowYSElmiroyRw6bNrdeMgUGWgVmAbIAyOTC5xnftJaB0IRwd
	 GtyYNhZE87yrA==
Date: Thu, 16 May 2024 13:13:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCHv4 7/9] ASoC: fsl-asoc-card: add DT clock "cpu_sysclk"
 with generic codec
Message-ID: <ffb3624f-2170-4642-aaa5-fb6736a75d59@sirena.org.uk>
References: <20240515135411.343333-1-elinor.montmasson@savoirfairelinux.com>
 <20240515135411.343333-8-elinor.montmasson@savoirfairelinux.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LqD9gI/K1pmwN8AU"
Content-Disposition: inline
In-Reply-To: <20240515135411.343333-8-elinor.montmasson@savoirfairelinux.com>
X-Cookie: I'm having a MID-WEEK CRISIS!
Message-ID-Hash: RVBRASPUSR53RRTMJ3D2GIHUJR3232UX
X-Message-ID-Hash: RVBRASPUSR53RRTMJ3D2GIHUJR3232UX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RVBRASPUSR53RRTMJ3D2GIHUJR3232UX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--LqD9gI/K1pmwN8AU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 15, 2024 at 03:54:09PM +0200, Elinor Montmasson wrote:

> Add an optional DT clock "cpu_sysclk" to get the CPU DAI system-clock
> frequency when using the generic codec.
> It is set for both Tx and Rx.
> The way the frequency value is used is up to the CPU DAI driver
> implementation.

> +		struct clk *cpu_sysclk = clk_get(&pdev->dev, "cpu_sysclk");
> +		if (!IS_ERR(cpu_sysclk)) {
> +			priv->cpu_priv.sysclk_freq[TX] = clk_get_rate(cpu_sysclk);
> +			priv->cpu_priv.sysclk_freq[RX] = priv->cpu_priv.sysclk_freq[TX];
> +			clk_put(cpu_sysclk);
> +		}

I don't really understand the goal here - this is just reading whatever
frequency happens to be set in the hardware when the driver starts up
which if nothing else seems rather fragile?

--LqD9gI/K1pmwN8AU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZF+F4ACgkQJNaLcl1U
h9AXTAf/eg99B2kknpaDwJ9DZYFFkcxJ6324qRL4RTcRJNsgycwZKlovGPFG7PVB
29K3gLq85wh/oTwmaxu0ytCzdOUaYcKNAec6vzs2Ro15xt1N728lxhxfM1JnH4F3
0WTtEvxm1RB//7l8dl3SNGm+tZEPMZZf5vjpDhYF0KctVTrlgekUNwQvSXbEpi9T
Xpxz8LYxSROWirKxovgWZefVgP9CDqERbTny2dUnaFZJUwV1CZg33QsIL6S6Szg1
+6XGOwJ1XLprfuqZlcejaGFjAcaaYyscdyypTVEFxfZrm9O1sy40NL+z/QEksF7r
/BTWFjcskN42Qd4lgOeScS/BzpHJ8A==
=filG
-----END PGP SIGNATURE-----

--LqD9gI/K1pmwN8AU--
