Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4BF8C9EE5
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2024 16:36:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D527C1EC;
	Mon, 20 May 2024 16:36:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D527C1EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716215784;
	bh=uSKePMg68VHTXgwYY757U7QjRjNo5hrsfRcyRwpLxfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lpJ89fyN+zIDm5j0WxmOlqZ9vzjwn7X8YwBG3iY8fi7ILUgybqYp+vosIq7LSVx78
	 o0RUWIo+6xu+dUYP1Wu5C0YOrj4LRXw+3gwty5K71fn+Q6e6gQwDSx2bVwROU+4Ldz
	 QbdbQNvnCfKrQLTmolxMxONW7z3oE2TDfMmqAhtc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23060F805B0; Mon, 20 May 2024 16:35:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69886F804B2;
	Mon, 20 May 2024 16:35:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B577F8026A; Mon, 20 May 2024 16:35:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4ADE9F8016B
	for <alsa-devel@alsa-project.org>; Mon, 20 May 2024 16:35:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4ADE9F8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FyTqSGz/
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6ACA461D2E;
	Mon, 20 May 2024 14:35:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D43DAC2BD10;
	Mon, 20 May 2024 14:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716215745;
	bh=uSKePMg68VHTXgwYY757U7QjRjNo5hrsfRcyRwpLxfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FyTqSGz/Is1DZZJFNqP/b4Jk32a1bzHgOfe3VALEG1QyaujqN4mnQoNIGEf3E8DFV
	 t6U4XsM8T9SCiuud31ZqmvDSwHC70rcdUmh6y1DkKXaeMyKUcfUmIOHWI3/FXWcRo2
	 Zj/QIQM8Fv9KJI4M+4Ca6uMTjElqkhWNe2MOOdyYQlkQRuiuzAIEZIJp3XQlB6FGvc
	 ooaBUiLxH/coetBrCjC1ZU+gpEGmBtAOaidl+g5sw0vAW32yAEy61aHjX4f78gZoaG
	 RadZ3is985KiHJbZYfdbMyqcXY/+4/cDcgcES93ulI3RnalcfaGLXuF0rVBRu81wR7
	 ++ajJ7TE2BqAQ==
Date: Mon, 20 May 2024 15:35:38 +0100
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
Subject: Re: [PATCH v3 3/8] ASoC: samsung: midas_wm1811: Add headset mic bias
 supply support
Message-ID: <1aed24a7-ab2a-4c2b-a3bc-2b907e091624@sirena.org.uk>
References: <20240519-midas-wm1811-gpio-jack-v3-0-0c1736144c0e@gmail.com>
 <20240519-midas-wm1811-gpio-jack-v3-3-0c1736144c0e@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pxaZ0LKbE08JUaU/"
Content-Disposition: inline
In-Reply-To: <20240519-midas-wm1811-gpio-jack-v3-3-0c1736144c0e@gmail.com>
X-Cookie: We are what we are.
Message-ID-Hash: L24Y4R4VHJ46WUTLZLD4XD2GFCFKWIQB
X-Message-ID-Hash: L24Y4R4VHJ46WUTLZLD4XD2GFCFKWIQB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L24Y4R4VHJ46WUTLZLD4XD2GFCFKWIQB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--pxaZ0LKbE08JUaU/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 19, 2024 at 10:17:49AM +0200, Artur Weber wrote:

> +static int midas_headset_mic_bias(struct snd_soc_dapm_widget *w,
> +			     struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_card *card = w->dapm->card;
> +	struct midas_priv *priv = snd_soc_card_get_drvdata(card);
> +
> +	if (!priv->reg_headset_mic_bias)
> +		return 0;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_PRE_PMU:
> +		return regulator_enable(priv->reg_headset_mic_bias);
> +	case SND_SOC_DAPM_POST_PMD:
> +		return regulator_disable(priv->reg_headset_mic_bias);
> +	}

We have SND_SOC_DAPM_REGULATOR_SUPPLY?

--pxaZ0LKbE08JUaU/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZLX7oACgkQJNaLcl1U
h9B+pQf/bj3bL8onTU8c2fQX8+h6MTpaxgO+m8QtLrABywDZfmRF/bCC0d/FGzGT
2dAn3CMy8ZhJo65ELhLPkBHKRypcILUsxzjTOL6ddyek3cwtaomzLKt/5BPO6zDn
XCygGXgK3NXCDSM4ldhW+N7x5n/i3j6ZCZfAxmYtrxpbEeTxRUbBBYfh20/cSEsa
hhd0GxkGdUdG3ylpnA5n/hi+eMWlGHHB+OxXVJfv/iDrXF8hjOHUbaf82ZR9xwrJ
2wP4BQNUowOuMBQ84h8zzBYOKtvtWUlig2y4ppzeMFeFw4MhYeeQzp/fz5COeKO+
7+EiuORd1ry9xIRankV9nGs7JgiAHQ==
=JVQ0
-----END PGP SIGNATURE-----

--pxaZ0LKbE08JUaU/--
