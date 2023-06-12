Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DA772CF01
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 21:07:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EED984C;
	Mon, 12 Jun 2023 21:07:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EED984C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686596872;
	bh=+2CAjCfuiSvAQl5TXc8jdaS4YZBtxrP4Iq6jzt/7FnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=g8L4kT+hGGpOXwhyUnANAMbil+9ZRLa2aiLcKrWyUqM8CaTE7uxrN/MGdoX0SA9rp
	 JPOsKVgjz82alDxKPa1lT2CyjC0SkV09ULIZC67hp0g1pZ/YT1MFLu2m8DpcT0IK28
	 oNyJG2rh9W0JO27UKGyuLBSKZdpVy/0y6cgyU9FU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C618F80568; Mon, 12 Jun 2023 21:06:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E27BF8055C;
	Mon, 12 Jun 2023 21:06:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 374DDF80563; Mon, 12 Jun 2023 21:06:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5AD58F80552
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 21:06:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AD58F80552
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fuEwoXIT
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AD0F862014;
	Mon, 12 Jun 2023 19:06:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B55EAC433EF;
	Mon, 12 Jun 2023 19:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686596784;
	bh=+2CAjCfuiSvAQl5TXc8jdaS4YZBtxrP4Iq6jzt/7FnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fuEwoXIT6KsRx/x8OU1vcGkN+5jlLj2A1GBzDyfg7BY/fXV2BjY7cYa84QwjEKLnm
	 VOBeUJILFwZjWfST+Wq14X/hAJLHUc9+QooZ+M8Z41mfUHSxnBztJ0B0S7ObT45U+g
	 u6NrgVRSSFWNkXT0ARLZLMQ1yYYK/ieAYU+CdX0PV6f9pgxcQ5oY/gxnJjxz5oeDYj
	 jGwqCkDYuHJq8QzmzD4gLW5U8gNvwbhv/VWEwx5tktuIgwl2E29H4h7rNu+fwk7qU8
	 2zUEuHR8KJm8AhCvG7A4fs4uEDMgN0+lo7Z3dJrSkdFifK4ZxvBFsI5J42BijoA/NJ
	 HyZMuo8m7DXzg==
Date: Mon, 12 Jun 2023 20:06:19 +0100
From: Mark Brown <broonie@kernel.org>
To: YingKun Meng <mengyingkun@loongson.cn>
Cc: lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org, loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn
Subject: Re: [ PATCH v2 2/3] ASoC: loongson: Add Loongson ASoC Sound Card
 Support
Message-ID: <1568e064-606e-4f56-951f-429a87a3a2d9@sirena.org.uk>
References: <20230612090046.3039532-1-mengyingkun@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JmH6MnoyxZ+mPA1w"
Content-Disposition: inline
In-Reply-To: <20230612090046.3039532-1-mengyingkun@loongson.cn>
X-Cookie: If it heals good, say it.
Message-ID-Hash: VG4LXPL4G3PYMZNVMQB34Z52ZGT2KAZQ
X-Message-ID-Hash: VG4LXPL4G3PYMZNVMQB34Z52ZGT2KAZQ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VG4LXPL4G3PYMZNVMQB34Z52ZGT2KAZQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--JmH6MnoyxZ+mPA1w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 12, 2023 at 05:00:46PM +0800, YingKun Meng wrote:

> +	if (ls_card->mclk_fs) {
> +		mclk = ls_card->mclk_fs * params_rate(params);
> +		ret = snd_soc_dai_set_sysclk(cpu_dai, 0, mclk,
> +					     SND_SOC_CLOCK_OUT);
> +		if (ret < 0) {
> +			dev_err(codec_dai->dev, "cpu_dai clock not set\n");
> +			return ret;
> +		}

Does this need to be in the machine driver - this isn't configuring an
external clock, it's just within the SoC, so presumably the driver for
the SoC DAI can just set itself up.

--JmH6MnoyxZ+mPA1w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSHbKoACgkQJNaLcl1U
h9DjFQf3dlnL5S14TJo0QE32BmeVlgoqhFL9wxd3gu8bQCVhB6nAC9Bf3q/HRd5T
fvkq/Qtuv1n4VCXt28d1SboHdkcwwbyeNFvR2UE+c9yVumPy5VHXHNfsdRCJlDn0
dkrA+p2IG6SrGIKeyhTv4na9U5psScEjaTMqfTyk0DmlQO1IPRhpEi9/TI8VvRE4
DR9zoE5bPwbnMw68HEOS1GJQaHvdfDVWV4lKAvB4SpUqdHmpe871o33+2dfsHi9w
XCcqPyi/b3NwpA2/7r58meKwtroWgNVK3UXBrzQMwHFM1cEItj7b7WEIctIZrFxl
Le5GHVG0fRO4igXwrRUArFACZFhI
=PFnV
-----END PGP SIGNATURE-----

--JmH6MnoyxZ+mPA1w--
