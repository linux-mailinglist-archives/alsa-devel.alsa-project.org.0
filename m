Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 588986C232E
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 21:55:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 252E41E1;
	Mon, 20 Mar 2023 21:54:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 252E41E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679345727;
	bh=MZj38O/W/p2Sts3TdUPlHpLMxwEzR0oUA5rPgwYg7+Q=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QPhLGicfjysYCuXAzRcGvrcHe007Cfmsjd4NnXIBgvkfBqMtgI9kK4j6qzk7r/yz8
	 KPAEoMh92IyozUuwAfhte7v9kCtGi8jNdIN5hvTyjX4TRiAqrAt8smPk7yBXqoeO9d
	 MzsC73patqVV7vSaw0fsA0FFcmrU3PmzIXcIb34k=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 87853F80254;
	Mon, 20 Mar 2023 21:54:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 019D2F8027B; Mon, 20 Mar 2023 21:54:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D5C10F80093
	for <alsa-devel@alsa-project.org>; Mon, 20 Mar 2023 21:54:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5C10F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=usO8YYEd
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CD6DF617E1;
	Mon, 20 Mar 2023 20:54:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9948C433A0;
	Mon, 20 Mar 2023 20:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679345668;
	bh=MZj38O/W/p2Sts3TdUPlHpLMxwEzR0oUA5rPgwYg7+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=usO8YYEd0Opfv8bzMub5hflWtFIy5FBj8Cn3yUAXTmTfeWM7Nl9omOIqzdwrnbaN8
	 cVA7IioabHmBlt4fc1xKDmhJae1akbROvGI4Zw7GPkf3O8sRcNykasE0ZF64vVvWz+
	 9m/V5d6KmVbVBBzpS9CMJPAyxMUt8jUGMrXbAHSzlzFX8TbX6HzligNTM9Lgw5SsdH
	 Va6fiuFXma0lqrZIjKBPaXpeEcxZhTI4CzOYJQhdKWbS/aP+PPOPLNrJ5mrk5w14Zf
	 S5yuMK/PnW/DuG9SgfgCrKimqj8+wEEbaSHv7iU66vwShlfaCe+RB1MxKITN2qNBVJ
	 1w/75ab/wXd5w==
Date: Mon, 20 Mar 2023 20:54:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Marian Postevca <posteuca@mutex.one>
Subject: Re: [PATCH 3/4] ASoC: amd: acp: Add machine driver that enables
 sound for systems with a ES8336 codec
Message-ID: <141a3320-ff65-459f-9d00-c8bed691dcfc@sirena.org.uk>
References: <20230320203519.20137-1-posteuca@mutex.one>
 <20230320203519.20137-4-posteuca@mutex.one>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HjbsShExCSghonkH"
Content-Disposition: inline
In-Reply-To: <20230320203519.20137-4-posteuca@mutex.one>
X-Cookie: Keep away from fire or flame.
Message-ID-Hash: SAK6WOJWG2LUW7QKGIH4XLWGVLDZB3HZ
X-Message-ID-Hash: SAK6WOJWG2LUW7QKGIH4XLWGVLDZB3HZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SAK6WOJWG2LUW7QKGIH4XLWGVLDZB3HZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--HjbsShExCSghonkH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 20, 2023 at 10:35:18PM +0200, Marian Postevca wrote:

> +static int acp_asoc_suspend_pre(struct snd_soc_card *card)
> +{
> +	int ret;
> +
> +	ret = acp_ops_suspend_pre(card);
> +	return ret == 1 ? 0 : ret;

Please write normal conditional statements to improve legibility (or
just have the function that's being called return a directly usable
value?).

> +	if (priv->quirk & ES83XX_48_MHZ_MCLK) {
> +		dev_dbg(priv->codec_dev, "using a 48Mhz MCLK\n");
> +		snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
> +					   &hw_constraint_rates_48mhz);
> +		freq = ES83xx_48_MHZ_MCLK_FREQ;
> +	} else {
> +		dev_dbg(priv->codec_dev, "using a 12.288Mhz MCLK\n");
> +		snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
> +					   &hw_constraint_rates_normal);
> +		freq = ES83xx_12288_KHZ_MCLK_FREQ;
> +	}

The CODEC driver should be able to set these constraints for itself.

> +	ret =  snd_soc_dai_set_fmt(codec_dai, SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
> +				   | SND_SOC_DAIFMT_CBP_CFP);

Set this in the dai_link.

> +static int acp3x_es83xx_speaker_power_event(struct snd_soc_dapm_widget *w,
> +					    struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct acp3x_es83xx_private *priv = get_mach_priv(w->dapm->card);
> +
> +	dev_dbg(priv->codec_dev, "speaker power event: %d\n", event);
> +	if (SND_SOC_DAPM_EVENT_ON(event))
> +		acp3x_es83xx_set_gpios_values(priv, 1, 0);
> +	else
> +		acp3x_es83xx_set_gpios_values(priv, 0, 1);

Why are these two GPIOs tied together like this?

> +static int acp3x_es83xx_suspend_pre(struct snd_soc_card *card)
> +{
> +	struct acp3x_es83xx_private *priv = get_mach_priv(card);
> +
> +	dev_dbg(priv->codec_dev, "card suspend\n");
> +	snd_soc_component_set_jack(priv->codec, NULL, NULL);
> +	return 0;
> +}

That's weird, why do that?

--HjbsShExCSghonkH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmQYx/4ACgkQJNaLcl1U
h9D+Wwf/bKdQ7lKzAYzNiRwqoNAblsODFOoW6si8H9tMBez8Xe8oxGGlginVJFzV
v3p2/ostjrMN/wu3reCAtpfGI3yDt674B00qSL0dk9zZZVjSBPrFwVE8vgRnxo1w
1Hbkq1HSHdyIv07ec7+rqfzfhfHt20q7sXro0D/Gq6D36SgnHc1Pq/oi0ffSahOW
bLcA0xUMTV0yJ8oK2Gzg/p83GMtzIC7IrInQF8Cuz04tSSgnwMwAVCQP5Bdui6sK
1+vjnVbAuiO8C/D6l80tLvXKE5Pg9gKyIgFgDZqW28zC+JIAfdV5+8ds9qlQXhU0
pzEQagoJ5lMgF5jxD1r5hBQ6YrXyWg==
=Y9Xp
-----END PGP SIGNATURE-----

--HjbsShExCSghonkH--
