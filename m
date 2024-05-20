Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 265548C9EF1
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 16:42:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 499DF3E;
	Mon, 20 May 2024 16:42:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 499DF3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716216133;
	bh=619Z6jy0Nar5HnINkMj+OqkRlvVm8QNHCVeJy2e8Qus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qWZVcNdY3J4aSGFjiIKxZ13xhIyqxqMNEr/mLxpJBReAt2m9NxRi1cVwnXhp1pWP3
	 k4CXCuzdGMhnTaMvCzqeRdLAAJrgxghXLgjGxllRdHR6exjAuo8hM9QrKNfIiksExE
	 Nn+vPjY6JHIhomCJazxKOjNiY8vbNiruhFQTt+5Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18844F805AC; Mon, 20 May 2024 16:41:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FC65F805A9;
	Mon, 20 May 2024 16:41:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D8BEF8026A; Mon, 20 May 2024 16:41:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B00AF800BA
	for <alsa-devel@alsa-project.org>; Mon, 20 May 2024 16:41:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B00AF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=uFJ6jtkj
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C742ACE0ADF;
	Mon, 20 May 2024 14:41:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A25C2BD10;
	Mon, 20 May 2024 14:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716216083;
	bh=619Z6jy0Nar5HnINkMj+OqkRlvVm8QNHCVeJy2e8Qus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uFJ6jtkjLSCdTwIjLDYa5L963tzFoaUCzXZoLvXojXsEzX3rq4zqiEoKSb989dzzn
	 OMNPSzJtGW4QGIoQjqNh14Y0j0jAg2qRYHXaYBX8u3Ryd73zrixwepaDGhD3xTh6LV
	 p7MinFwEhedpSYyWxmZHCZlLtCYlhYjrnGrBwwW1NSfGK3V3h3thQ0dMbKWnIMd9u/
	 IIEa3DMLhD3fAD3fGFrGzd8w8JWZTH8VqItKNzg75AHRslBCQ80N4gWTClRvCHswyX
	 hQyieUmwjPZbnRGnNciIXQkTXaBhvSK2p2jduQLg9aVUY8VXO0Canm4CtQ2hkQyWel
	 oA1uGVgq5faDQ==
Date: Mon, 20 May 2024 15:41:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Alim Akhtar <alim.akhtar@samsung.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v3 4/8] ASoC: samsung: midas_wm1811: Add GPIO-based
 headset jack detection
Message-ID: <2c4c0aeb-2870-4905-bcfc-642ae40c87f1@sirena.org.uk>
References: <20240519-midas-wm1811-gpio-jack-v3-0-0c1736144c0e@gmail.com>
 <20240519-midas-wm1811-gpio-jack-v3-4-0c1736144c0e@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lfTGNXXe0eUJp9Hl"
Content-Disposition: inline
In-Reply-To: <20240519-midas-wm1811-gpio-jack-v3-4-0c1736144c0e@gmail.com>
X-Cookie: We are what we are.
Message-ID-Hash: BNS2J4K5IZRFQNNFMLWHD6BT5WAPSWMO
X-Message-ID-Hash: BNS2J4K5IZRFQNNFMLWHD6BT5WAPSWMO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BNS2J4K5IZRFQNNFMLWHD6BT5WAPSWMO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--lfTGNXXe0eUJp9Hl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 19, 2024 at 10:17:50AM +0200, Artur Weber wrote:

> +	if (priv->reg_headset_mic_bias) {
> +		/*
> +		 * Get state of Headset Mic switch by checking the headset mic
> +		 * bias regulator
> +		 */
> +		bias_already_on = \
> +			regulator_is_enabled(priv->reg_headset_mic_bias);

If you're going to do this you need to use regulator_get_exclusive() to
ensure that nothing else can enable the regulator, otherwise you should
just unconditionally enable the regulator.

> +	/*
> +	 * Revert the headset mic bias supply to its previous state
> +	 * (i.e. if it was disabled before the check, disable it again)
> +	 */
> +	if (priv->reg_headset_mic_bias && bias_already_on == 0) {
> +		ret = regulator_disable(priv->reg_headset_mic_bias);
> +		if (ret)
> +			pr_err("%s: Failed to disable micbias: %d\n",
> +			       __func__, ret);
> +	}

Given that you're just briefly bouncing the regulator on and off it'd be
best to just unconditionally enable and disable here, I can't see what
the enable check gains you other than possible race conditions.

--lfTGNXXe0eUJp9Hl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZLYQwACgkQJNaLcl1U
h9Dwjgf/WnkaIdmy+K4GxTBYERrrATUvQAIiQ6PjAPC/Gf9ZYNuIgC/EEe6k4Nlw
WkBAfRhzMebnNCagnadq8ZyPNKp5zUVpGo2/r0QOvrJ3Ajk3RD7e18nKipsWpb7D
DFrusOYqlUdIRUjWCPn/u6WWRojAH9UhnF7XiuL/NSnz9F/g0xvd8wyWa2a5+LjK
NrAKc2Xd0jpBvcTGmTzS+hgFW+xr10HGoG6nutfh9Gm3hi7b9WQ2dl5eo5rGzMqO
kJNvPmQA6kFPcJkCtkLFSgEARq7edL6c+l3rIr42nORS6PtmclS/vRVlkIvXBHyZ
CtJveZ2pcrft4S204mzZk+4vNymYzg==
=EEPv
-----END PGP SIGNATURE-----

--lfTGNXXe0eUJp9Hl--
