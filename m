Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1E73F871B
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Aug 2021 14:16:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8430A16A3;
	Thu, 26 Aug 2021 14:15:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8430A16A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629980172;
	bh=9l/KR7zDYlM7tZSjZG2Lg4LCxFI11bs2/oaANzj+eHU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hDU8qkTNjQknlNy8DNmTLBql97T2JUPX/rUy3ha4eytb4rY083McEs/zjuViFj3vY
	 HeyIogFHDmule4kjZ8xvSPi9PB1lI1TsinufN0U+WXJD5m8+Vv9yVw9OPBUiA/nEQH
	 nrdYbhberQLC86QM4a0kZ4zia02TgXT7CKmZxtXg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2C5AF80224;
	Thu, 26 Aug 2021 14:14:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1887FF8013F; Thu, 26 Aug 2021 14:14:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC193F8013F
 for <alsa-devel@alsa-project.org>; Thu, 26 Aug 2021 14:14:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC193F8013F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dxVHEeRE"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 51B236108D;
 Thu, 26 Aug 2021 12:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629980080;
 bh=9l/KR7zDYlM7tZSjZG2Lg4LCxFI11bs2/oaANzj+eHU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dxVHEeREzdpY6phsj8k63uK+P60kTYFJTrIO0M8DQn3vxE/ROzx11HFCQ30NV6v8z
 BpWd4PEw4b7RaFQj7HGjhVaaN98tHY57xVQRje80mcMDIngkxHqt1QTG/GpK90QmuA
 Wb1ckDfFr/wE3dWedtDs96LVQuKSRySRO2Izfonf8W3iKGJEeXb0HVp2s9P7Cvvn4N
 oCrtxFth2fwp9Fb0TiNAi4eKJFjb9enJ+pxtphFefq/TlOqiFS42qHNNRQV+GigFOY
 PoMZNR0Uek9u30k7Tl/fAc31P9WoM95UO9trT74Zh245cpOGtaydgYs9DcE/dzdxbo
 OJIbP3n7CCrpQ==
Date: Thu, 26 Aug 2021 13:14:12 +0100
From: Mark Brown <broonie@kernel.org>
To: derek.fang@realtek.com
Subject: Re: [PATCH 1/2] ASoC: rt5682s: Add driver for ALC5682I-VS codec
Message-ID: <20210826121412.GB4148@sirena.org.uk>
References: <20210826080938.14872-1-derek.fang@realtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="U+BazGySraz5kW0T"
Content-Disposition: inline
In-Reply-To: <20210826080938.14872-1-derek.fang@realtek.com>
X-Cookie: /earth: file system full.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, lgirdwood@gmail.com, albertchen@realtek.com,
 shumingf@realtek.com, flove@realtek.com
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


--U+BazGySraz5kW0T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 26, 2021 at 04:09:37PM +0800, derek.fang@realtek.com wrote:

This looks good, a few small mostly style comments below but nothing
substantial:

> +static int rt5682s_sar_power_mode(struct snd_soc_component *component,
> +				int mode, int jd_step)
> +{
> +	struct rt5682s_priv *rt5682s =
> +		snd_soc_component_get_drvdata(component);
> +
> +	mutex_lock(&rt5682s->sar_mutex);
> +
> +	switch (mode) {
> +	case SAR_PWR_SAVING:
> +		snd_soc_component_update_bits(component, RT5682S_CBJ_CTRL_3,
> +			RT5682S_CBJ_IN_BUF_MASK, RT5682S_CBJ_IN_BUF_DIS);

> +	default:
> +		break;
> +	}

Shouldn't there be some sort of warning or error if we get an invalid
mode here?

> +static void rt5682s_enable_push_button_irq(struct snd_soc_component *component,
> +		bool enable)
> +{
> +	if (enable) {
> +		snd_soc_component_update_bits(component, RT5682S_SAR_IL_CMD_13,
> +			RT5682S_SAR_SOUR_MASK, RT5682S_SAR_SOUR_BTN);
> +		snd_soc_component_write(component, RT5682S_IL_CMD_1, 0x0040);
> +		snd_soc_component_update_bits(component, RT5682S_4BTN_IL_CMD_2,
> +			RT5682S_4BTN_IL_MASK | RT5682S_4BTN_IL_RST_MASK,
> +			RT5682S_4BTN_IL_EN | RT5682S_4BTN_IL_NOR);
> +		snd_soc_component_update_bits(component, RT5682S_IRQ_CTRL_3,
> +			RT5682S_IL_IRQ_MASK, RT5682S_IL_IRQ_EN);
> +	} else {

Why not just have separate enable and disable functions, there's no
shared code here and it avoids the boolean argument which tends to be
unclear?

> +static const char * const rt5682s_sar_mode[] = {
> +	"Normal", "Saving"
> +};
> +
> +static SOC_ENUM_SINGLE_DECL(rt5682s_sar_mode_enum, 0, 0,
> +	rt5682s_sar_mode);

Might be easier to make this a "SAR Power Saving Switch"?  Doesn't
really matter.

> +static int rt5682s_probe(struct snd_soc_component *component)
> +{
> +	struct rt5682s_priv *rt5682s = snd_soc_component_get_drvdata(component);
> +	struct snd_soc_dapm_context *dapm = &component->dapm;
> +
> +#ifdef CONFIG_COMMON_CLK
> +	int ret;
> +#endif
> +	rt5682s->component = component;
> +
> +#ifdef CONFIG_COMMON_CLK
> +	/* Check if MCLK provided */
> +	rt5682s->mclk = devm_clk_get(component->dev, "mclk");

Perhaps factor the clock init out into a _probe_clks() function and then
have a stub function rather than the two ifdefs?

--U+BazGySraz5kW0T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEnhZMACgkQJNaLcl1U
h9BYigf+OH8AD88swL8gLAMbiaZtzx24a88vJctFdOjI5ItBzGfjK8v7Znl8LgsD
xAGv/FlLxrzQax3NsyUm2Qv+tcc63TzcU+omT0mrRf00vBHhZ22U1kcbiEuSvkDl
k4ISRHZHTb0OWCImRQYcn0bq0lV3hMDx417vv5h52toUBYlwC16njN8dCrWAYgpl
F0M3EYSjzIbtvXQzh4Ow5A95JexlIYK0N2WPzRnHDKMDEnFM2SwWjB7FL7fBusFG
NBVdaR2pflIA3o0zjfuMnW6DaPFqfwmuC7w3jcwXuR12dvhrqIGoQyREwvFfyEm4
P27pfZuOeS1MxWX69TRI/P4mzfQX3Q==
=6jFe
-----END PGP SIGNATURE-----

--U+BazGySraz5kW0T--
