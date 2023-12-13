Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8AC811EBD
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Dec 2023 20:20:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE19DA4D;
	Wed, 13 Dec 2023 20:20:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE19DA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702495250;
	bh=pvOifwzmhzVpqy1B65sXqWWUfUoqN1GPpaLpMOsu7M4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nPwq2eR1yOqMXKaX6KWZjHSsNdO8NblyAdgLGoGIN9vGSZJ0qFbRGICr3WeN+gYh3
	 BhA2Fuw0iQglvOZ5FmunzbP9fqllSW56CBtgfEcMCT+89Obp1vlC5y4b1QONRN5Kcn
	 Pd/Ghl9V9BsnXAKrwCAqT3ProKSISWauH+QdUooc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE6E1F8055B; Wed, 13 Dec 2023 20:20:29 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 907F3F80571;
	Wed, 13 Dec 2023 20:20:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2EE2F8016A; Wed, 13 Dec 2023 20:20:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A4AD0F80114
	for <alsa-devel@alsa-project.org>; Wed, 13 Dec 2023 20:20:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4AD0F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NL1y6ZXg
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 73B37B81EB5;
	Wed, 13 Dec 2023 19:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 192ACC433C8;
	Wed, 13 Dec 2023 19:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702495216;
	bh=pvOifwzmhzVpqy1B65sXqWWUfUoqN1GPpaLpMOsu7M4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NL1y6ZXgRJFSI8gechwwAiu4XkPxMrQCZ3LQNQoh+duY2ym7IXeYgeVkjmO2P1Zbp
	 hDB4oqmrb5FVjrgp7O203jYtSPqIGDoV9OS1/Jbw9Pm5ip8FfSqnjsP3MIsKZDrBGu
	 YEgcG/fnfM+jv2gl1iv6i4nPkj0CyWYn80MYGVmGbS+geBXWsswLAJ0tNb6cKFCrVV
	 flEZrv8+fHhFUjfVj5zJUxJ5DFdyyf8jl1rMuqrzWJFEZsL0DWeFuJy6wM7WghLieX
	 wYSBun4sk1TjGGVYkzyvgslg0iWFnwrQQgInI+Cc4cE4XgUtkpXL/nkWz2ovZm43vk
	 Iso4DkVscs6Kg==
Date: Wed, 13 Dec 2023 19:20:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] ASoC: codecs: Add WCD939x Codec driver
Message-ID: <4dae5296-9984-4c3b-803a-f6024edd0dd9@sirena.org.uk>
References: 
 <20231207-topic-sm8650-upstream-wcd939x-codec-v3-0-6df9585ec7c8@linaro.org>
 <20231207-topic-sm8650-upstream-wcd939x-codec-v3-5-6df9585ec7c8@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QxFQz7KiJT5hHtQy"
Content-Disposition: inline
In-Reply-To: 
 <20231207-topic-sm8650-upstream-wcd939x-codec-v3-5-6df9585ec7c8@linaro.org>
X-Cookie: One size fits all.
Message-ID-Hash: LJW6XL7HYG52AXOAGRBT474PJS5JORGP
X-Message-ID-Hash: LJW6XL7HYG52AXOAGRBT474PJS5JORGP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LJW6XL7HYG52AXOAGRBT474PJS5JORGP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--QxFQz7KiJT5hHtQy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 07, 2023 at 11:28:08AM +0100, Neil Armstrong wrote:

> +static int wcd939x_rx_hph_mode_put(struct snd_kcontrol *kcontrol,
> +				   struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
> +	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
> +	u32 mode_val;
> +
> +	mode_val = ucontrol->value.enumerated.item[0];
> +
> +	if (wcd939x->variant == WCD9390) {
> +		if (mode_val == CLS_H_HIFI || mode_val == CLS_AB_HIFI) {
> +			dev_dbg(component->dev, "%s: Invalid HPH Mode\n", __func__);
> +			return -EINVAL;
> +		}
> +	}
> +	if (mode_val == CLS_H_NORMAL) {
> +		dev_dbg(component->dev, "%s: Unsupported HPH Mode\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	wcd939x->hph_mode = mode_val;

This seems strange - the code will accept any value other than a small
number of specifically enumerated ones?  I would have expected us to
check a defined list of modes and reject anything that isn't in that
list.  This also means that the get() function can return out of bounds
values which is buggy.  Please use the mixer-test selftest on a card
with this driver running, it should identify at least that issue.

> +
> +	return 1;
> +}

This will also unconditionally report that the value of the mux changed,
the function should return 0 if the value written is the control value
hasn't changed.

--QxFQz7KiJT5hHtQy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmV6A+kACgkQJNaLcl1U
h9BJKQf/U5px02gwHeH7uG4m5GauMpoUmEDiaVVF7tWk02l3M27zveuoN30yDTA1
pfCa5jV8hUInQwgNXtIOyUZCfHkQN1+OHlvIdkse8NRlLja7PoAXNgu/iw6U0j66
zSqNGkvYePeMg+AJV/ZGJKfNKFomFc33V3EUC1iVKSWgsDBFjfQqau4TA9/smuaU
CT6RN5au6S7c5hg1Xyl2AK7RPadJM9rmmxJggOqNUYhYjmFMT7VWYhTta5yQXKak
Q/2L1+p91ZUr/HYHhVXzY8x/ptX3G7+w2nbIlXkOPuvdw41wGLdAPgpFw9oRmswK
OERs69V+GdvlY6g8PFruUFeS80qYgQ==
=FDxZ
-----END PGP SIGNATURE-----

--QxFQz7KiJT5hHtQy--
