Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CB66C2314
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 21:44:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAFE81E9;
	Mon, 20 Mar 2023 21:43:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAFE81E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679345089;
	bh=4A/kaxf1QABlVJo5RDUirZ+pZId2W89U9ANAnoVHmrk=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bD4O6i+jkxqJ8Ymb1wYpCkf9LGSA9osJYITebseJO45F2SPICV8nH6cEQqIdr4HQ/
	 /EEJG+i3pVBESEBLPj+oIbnSY52TvgLJMmI6E/gp8JuaoHKrAcHh343mPo47qdobG1
	 YErGGHEq8i5CjH3lUP13x1gynlwcZqXB9xWWZZWs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E8BBF80254;
	Mon, 20 Mar 2023 21:43:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ADA7DF800C9; Mon, 20 Mar 2023 21:43:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 02D2BF80254
	for <alsa-devel@alsa-project.org>; Mon, 20 Mar 2023 21:43:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02D2BF80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WnQ7RzwC
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E7625B8100E;
	Mon, 20 Mar 2023 20:43:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36111C433D2;
	Mon, 20 Mar 2023 20:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679345030;
	bh=4A/kaxf1QABlVJo5RDUirZ+pZId2W89U9ANAnoVHmrk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WnQ7RzwCrP+QBck7FNLyWYmo/Dkl8dFJwPwqzqy8QGKelJ9pRu/xH+2TOT/p8W1Nj
	 JqG9xE24FJrhPgsFYddfN9VuimMqjk/4cGftBLedTePkHSGN2UZzalZyw/9srAMlEp
	 xAdt9biFZ57sglbIqJ2Yg4g5gk0BJkZ2HoQ+lGZ4D7DNfIEepF/NSlpxjbhekkMnLE
	 b8IVsTIKZ0DQbiaj3oIoDmOxP4Yunh4CcavcWcbchc2RaT7x03JsswsIS9sS/E+ODH
	 xfmwJVEGAdb8ve9NKMirygrEvrY17pRy2Jht5+rOgiSXjRRCjjKQFPJljzwBzxBC3U
	 2eM2U7VmoVvDQ==
Date: Mon, 20 Mar 2023 20:43:45 +0000
From: Mark Brown <broonie@kernel.org>
To: Marian Postevca <posteuca@mutex.one>
Subject: Re: [PATCH 1/4] ASoC: es8316: Enable support for S32 LE format and
 MCLK div by 2
Message-ID: <6825a54e-f2c0-41c4-981c-fafcd10454fd@sirena.org.uk>
References: <20230320203519.20137-1-posteuca@mutex.one>
 <20230320203519.20137-2-posteuca@mutex.one>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="I8SYPlSVeAQJbM4T"
Content-Disposition: inline
In-Reply-To: <20230320203519.20137-2-posteuca@mutex.one>
X-Cookie: Keep away from fire or flame.
Message-ID-Hash: 5DLKKTVC3ZW7PUDRMQAZEWBRASGZQPUN
X-Message-ID-Hash: 5DLKKTVC3ZW7PUDRMQAZEWBRASGZQPUN
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5DLKKTVC3ZW7PUDRMQAZEWBRASGZQPUN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--I8SYPlSVeAQJbM4T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 20, 2023 at 10:35:16PM +0200, Marian Postevca wrote:

> To properly support a line of Huawei laptops with AMD CPU and a
> ES8336 codec connected to the ACP3X module we need to enable
> the S32 LE format and the codec option to divide the MCLK by 2.

The 32 bit support and MCLK division are two separate changes so should
be two separate patches.

> -	lrck_divider = es8316->sysclk / params_rate(params);
> +
> +	mclk_div_option = device_property_read_bool(component->dev,
> +						    "everest,mclk-div-by-2");
> +	if (mclk_div_option) {

This introduces a DT property but there's no documentation for it, but I
don't see why we'd want this in the bindings - the driver should be able
to tell from the input clock rate and required output/internal clocks if
it needs to divide MCLK.

--I8SYPlSVeAQJbM4T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQYxYAACgkQJNaLcl1U
h9CX8gf/RmwyEoVVmr3aQ8Bp4SWGDyii+5RBC0xwiRgZWpgWzB4Dc2tmrAiPwu/S
DlPYvD699CAaluybZtEVr0GDyLE2ijsmd3IlNH41Zv7/EU5zh3pf/9nHwCz7c5XA
0IUONdpeqhsaGivX+mgCnKsDuNRM3Vglfw3RziTKVm8BmwKBYxMTgOQ2C4dB4wb1
YSHPdUE8x5gj7Ft5UMUPUqRNhFJX2+mA6VNtDR2P5YG2guKPrZGPIcNgtViqEfkU
ZA7U0mOvHZQNgqrM6C+XzBLH2nIXTI1IlCSAW5/XFFaD75yTwn+rmpuSe+EnjXRs
qd7ochD5wURL1ibYOSHqOrZnAqDhRg==
=+ZJZ
-----END PGP SIGNATURE-----

--I8SYPlSVeAQJbM4T--
