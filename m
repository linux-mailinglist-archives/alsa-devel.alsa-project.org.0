Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC3A5653F7
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 13:44:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95FD0175F;
	Mon,  4 Jul 2022 13:43:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95FD0175F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656935063;
	bh=gzb1hQ5vKWSQOO8RXazjatCcAPCmdkfD+C8CUvHQh+k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ow0Diw1QgC6XHwPTwINw686RtU2ADtOvW7tashmOb57eyObhwBM7IeLbNkfs1cR/E
	 EjE/FIifgsH+y7xI16AXqW0164hJKHFeimKz+0t+DrO7xIBiofHAy0MzrNxKvAnC8G
	 WFMGEL6tQy46oytp+3LHviAOpVazKx43IR6Sn8Sw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18259F80165;
	Mon,  4 Jul 2022 13:43:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 582D9F8012A; Mon,  4 Jul 2022 13:43:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D40AF8012A
 for <alsa-devel@alsa-project.org>; Mon,  4 Jul 2022 13:43:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D40AF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="igIXP3QQ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BD07B60AE0;
 Mon,  4 Jul 2022 11:43:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEB0BC3411E;
 Mon,  4 Jul 2022 11:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656934996;
 bh=gzb1hQ5vKWSQOO8RXazjatCcAPCmdkfD+C8CUvHQh+k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=igIXP3QQYKP/cgYrUPGUsirKX/WK+/Nkq1DMWjjTJ5uVPIyVreeC7dkFuoSgcGcFl
 diuGxHsDqPKJ87hYRq3PHz5bNPkYchqxFufjy8rYYH3lgc9eM/Vm6nBkdK/wMJOYXp
 bIP+063gWA3qahwV5rwFrJ1ka593C01oCAmRNQd+qU+Vvw3cZ4h/scxNTe/HfS8rwQ
 eLsrbNtOq1QhdrD1sGynmf2bNNSAOdR2hEsedd9XH3OEuuFRjvVfQGLHsCQ4XsRKEC
 dPqfXtCGkEXIrGmmuv/6Wnqm3/cYILbQ/re8bt/sfMaoEgLc/qgZ4maWheRUncTjh9
 XzA8f2GnOsObQ==
Date: Mon, 4 Jul 2022 12:43:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Raphael-Xu <13691752556@139.com>
Subject: Re: [PATCH v1] add tas2780
Message-ID: <YsLST3BACPFak2PK@sirena.org.uk>
References: <20220704104759.21083-1-13691752556@139.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="osNu5PyZsE+uALZN"
Content-Disposition: inline
In-Reply-To: <20220704104759.21083-1-13691752556@139.com>
X-Cookie: MERYL STREEP is my obstetrician!
Cc: navada@ti.com, alsa-devel@alsa-project.org, shenghao-ding@ti.com,
 raphael-xu@ti.com
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


--osNu5PyZsE+uALZN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 04, 2022 at 06:47:59PM +0800, Raphael-Xu wrote:

> 1.update Kconfig and Makefile 2.add tas2780.c and tas2780.h

This looks pretty good, there's some mostly stylistic things below but
they're all fairly minor and you also need to provide documentation for
the DT binding.

>  snd-soc-tas2562-objs := tas2562.o
>  snd-soc-tas2764-objs := tas2764.o
> +snd-soc-tas2780-objs := tas2780.o
>  # Mux

Please preserve these blank lines here.

> +	ret = snd_soc_component_update_bits(component, TAS2780_PWR_CTRL,
> +					    TAS2780_PWR_CTRL_MASK,
> +					    TAS2780_PWR_CTRL_SHUTDOWN);
> +	if (ret < 0) {
> +		pr_err("%s:errCode:0x%0x:power down error\n",
> +			__func__, ret);

dev_err(), and the style used in the log message doesn't really match
the typical kernel style at all.

> +		goto EXIT;

Labels should generally be lower case.

> +static int tas2780_dac_event(struct snd_soc_dapm_widget *w,
> +			     struct snd_kcontrol *kcontrol, int event)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_dapm_to_component(w->dapm);
> +	struct tas2780_priv *tas2780 =
> +		snd_soc_component_get_drvdata(component);
> +	int ret = 0;
> +
> +	switch (event) {
> +	case SND_SOC_DAPM_POST_PMU:
> +		ret = snd_soc_component_update_bits(component,
> +						TAS2780_PWR_CTRL,
> +						TAS2780_PWR_CTRL_MASK,
> +						TAS2780_PWR_CTRL_MUTE);
> +		break;
> +	case SND_SOC_DAPM_PRE_PMD:
> +		ret = snd_soc_component_update_bits(component,
> +						TAS2780_PWR_CTRL,
> +						TAS2780_PWR_CTRL_MASK,
> +						TAS2780_PWR_CTRL_SHUTDOWN);
> +		break;

This looks like it should perhaps be a mute_stream operation while...

> +static int tas2780_mute(struct snd_soc_dai *dai, int mute, int direction)
> +{
> +	struct snd_soc_component *component = dai->component;
> +	struct tas2780_priv *tas2780 =
> +		snd_soc_component_get_drvdata(component);
> +	int ret = 0;
> +
> +	if (!mute) {
> +		ret = snd_soc_component_update_bits(component,
> +			TAS2780_CLK_CFG, TAS2780_CLK_CFG_MASK,
> +			TAS2780_CLK_CFG_ENABLE);
> +
> +		if (ret < 0) {
> +			dev_err(tas2780->dev,
> +				"%s: Failed to CLK_CFG_ENABLE\n",
> +				__func__);
> +			goto EXIT;
> +		}
> +	}
> +	ret = snd_soc_component_update_bits(component, TAS2780_PWR_CTRL,
> +		TAS2780_PWR_CTRL_MASK,
> +		mute ? TAS2780_PWR_CTRL_MUTE : 0);

...this is managing clocks which doesn't look like what I'd expect for a
mute operation, that should probably be part of the power management
(either a DAPM supply or in the bias level handling)?

> +
> +	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
> +	case SND_SOC_DAIFMT_I2S:
> +	case SND_SOC_DAIFMT_DSP_A:
> +		iface = TAS2780_TDM_CFG2_SCFG_I2S;
> +		tdm_rx_start_slot = 1;
> +		break;
> +	case SND_SOC_DAIFMT_DSP_B:
> +	case SND_SOC_DAIFMT_LEFT_J:
> +		iface = TAS2780_TDM_CFG2_SCFG_LEFT_J;
> +		tdm_rx_start_slot = 0;
> +		break;

This doesn't seem right - it's using exactly the same configuration for
multiple DAI formats.

> +static bool tas2780_volatile(struct device *dev,
> +	unsigned int reg)
> +{
> +			return true;
> +}

Just don't specify a cache.

> +static int tas2780_parse_dt(struct device *dev, struct tas2780_priv *tas2780)
> +{
> +	int ret = 0;
> +
> +	tas2780->reset_gpio = devm_gpiod_get_optional(tas2780->dev, "reset",
> +		GPIOD_OUT_HIGH);
> +	if (IS_ERR(tas2780->reset_gpio)) {
> +		if (PTR_ERR(tas2780->reset_gpio) == -EPROBE_DEFER) {
> +			tas2780->reset_gpio = NULL;
> +			return -EPROBE_DEFER;
> +		}
> +	}

This has a DT binding but there's no DT binding document, any new DT
bindings need to be documented.

--osNu5PyZsE+uALZN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLC0k4ACgkQJNaLcl1U
h9DPwAf9ED5g1AOo1S+5Pa/9rkePTil/Yb+za/yRRJREwdA8QVnHcLGD5oWe0Z0d
mYsvR/qZHvnwunO3WDYMDYH6BDmjrfyrQnsZnjLee93caD+F7GGj7z8MYpETbHPl
P3WuqpXVH/4ihkthvJQear3bSYTrlitIDL2oodkb798HRxkNAVD0RNh7T5rly1E9
kW8Nq9GV3F7yDYOab6l++PA3J4FA84BDy6JgTq4ma9QdD6AwqIrkJnDoIN8zZgSL
YIBuQmzafkBh69QwDgSB+Tc2q/Qu3jAfdfRO1z6t0VheCrOebAhBWqNRG3iVCUD+
eO/yqNIRkZFYH+Rh/bDtBJwqWVjgaA==
=W76u
-----END PGP SIGNATURE-----

--osNu5PyZsE+uALZN--
