Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2F7B44A
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Apr 2019 20:22:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8448D16ED;
	Sat, 27 Apr 2019 20:21:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8448D16ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556389366;
	bh=12ntDURnuH0YzS0NdxFltdTU7dkW03Z8DimPQziMKZk=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k7W5rdAUlOeId9XxmY4oh6VxQQpfsrA5iUxhMvzT4lES56VVttBkaaYDIpE1JDRX6
	 dUDHRckYExBuEDZdOkereHg39HGd3Lj9juZIwCnUswGx+mjyDGCDxGxlAlwsIYXkXC
	 DOsMn8T7C3ePY+EhLnX6Y6uuU2YaCkcIXySO4Row=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5318FF89716;
	Sat, 27 Apr 2019 19:59:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3277FF896EE; Sat, 27 Apr 2019 19:59:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84439F8068A
 for <alsa-devel@alsa-project.org>; Sat, 27 Apr 2019 19:59:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84439F8068A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="bQmZWmkG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EdDwpYpyiNtOMd0KZU5NLG3OmX4b+Lmyf3BJ2Fv4pr0=; b=bQmZWmkGapyE0jk8YxMAsYHss
 NUx5cq+dEvmNPebHr4vTrGrE3y0sl7jBaC8CnrIWTCzpEhLH7l0+rK/8OA0KkuDOZ228spDsGF6KO
 urj30/1nUcr62t4g7JbENgnWfsdBkYV7xTNooQSqHOJSVNQg0tHbLFUmbcWLaIimxHH3Y=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hKRbx-00051W-R3; Sat, 27 Apr 2019 17:59:42 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 92D9B441D3B; Sat, 27 Apr 2019 18:59:38 +0100 (BST)
Date: Sun, 28 Apr 2019 02:59:38 +0900
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20190427175938.GJ14916@sirena.org.uk>
References: <20190423141336.12568-1-tiwai@suse.de>
 <20190423141336.12568-2-tiwai@suse.de>
MIME-Version: 1.0
In-Reply-To: <20190423141336.12568-2-tiwai@suse.de>
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 1/2] ASoC: Add support for Conexant CX2072X
	CODEC
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
Content-Type: multipart/mixed; boundary="===============3449704062134788599=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3449704062134788599==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wHh0aNzodMFDTGdO"
Content-Disposition: inline


--wHh0aNzodMFDTGdO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 23, 2019 at 04:13:35PM +0200, Takashi Iwai wrote:

> +/*
> + * register patch.
> + */
> +static const struct reg_sequence cx2072x_patch[] = {
> +	{ 0x71A4, 0x080 }, /* DC offset Calibration		*/
> +	{ 0x7328, 0x65f }, /* disable the PA			*/
> +	{ 0x71a8, 0x289 }, /* Set the spkeaer output gain	*/
> +	{ 0x7310, 0xf05 },
> +	{ 0x7290, 0x380 },
> +	{ 0x7328, 0xb90 },
> +	{ 0x7124, 0x001 }, /* Enable 30 Hz High pass filter	*/
> +	{ 0x718c, 0x300 }, /* Disable PCBEEP pad		*/
> +	{ 0x731c, 0x100 }, /* Disable SnM mode			*/
> +	{ 0x641c, 0x020 }, /* Enable PortD input		*/
> +	{ 0x0458, 0x040 }, /* Enable GPIO7 pin for button	*/
> +	{ 0x0464, 0x040 }, /* Enable UM for GPIO7		*/
> +	{ 0x0420, 0x080 }, /* Enable button response		*/
> +	{ 0x7230, 0x0c4 }, /* Enable headset button		*/
> +	{ 0x7200, 0x415 }, /* Power down class-D during idle	*/
> +	{ 0x6e04, 0x00f }, /* Enable I2S TX			*/
> +	{ 0x6e08, 0x00f }, /* Enable I2S RX			*/
> +};

This looks *very* much like board configuration rather than a patch -
there's no kind of test bit and the comments talk specifically about
things like gain settings and pad configuration which look very board
specific.  Register patches are supposed to be for things like early
revisions of the chip which have different register defaults or magic
sequences that vendors tell you to run on startup, usually to tune test
registers.

> +/* return register size */
> +static unsigned int cx2072x_register_size(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {

This is *not* going to play well with regmap...

> +static int cx2072x_reg_bulk_write(struct snd_soc_component *codec,
> +				  unsigned int reg,
> +				  const void *val, size_t val_count)
> +{
> +	struct i2c_client *client = to_i2c_client(codec->dev);
> +	struct device *dev = &client->dev;
> +	u8 buf[2 + CX2072X_MAX_EQ_COEFF];
> +	int ret;
> +
> +	if (val_count > CX2072X_MAX_EQ_COEFF) {
> +		dev_err(dev,
> +			"cx2072x_reg_bulk_write failed, writing count = %d\n",
> +			(int)val_count);
> +		return -EINVAL;
> +	}

So this only works for the EQ registers?  If so there should be
validation to confirm that it only gets used for them.  If not there
should be handling for register size variation issues.

> +#define cx2072x_plbk_eq_en_info		snd_ctl_boolean_mono_info

Why not just use the function directly rather than hiding it?

> +	/* do nothing if the value is the same */
> +	if (memcmp(cache, param, CX2072X_PLBK_EQ_COEF_LEN))
> +		goto unlock;

Is this test not inverted - shouldn't we be skipping if memcmp returns
0?

> +	SOC_DOUBLE_R_TLV("DAC1 Volume", CX2072X_DAC1_AMP_GAIN_LEFT,
> +			 CX2072X_DAC1_AMP_GAIN_RIGHT, 0, 0x4a, 0, dac_tlv),
> +	SOC_DOUBLE_R("DAC1 Mute Switch", CX2072X_DAC1_AMP_GAIN_LEFT,
> +		     CX2072X_DAC1_AMP_GAIN_RIGHT, 7,  1, 0),

Should just be DAC1 Switch so it gets joined up with DAC1 Volume in UIs
and the "Mute" is redundant anyway.

> +int snd_soc_cx2072x_enable_jack_detect(struct snd_soc_component *codec)
> +{
> +	struct cx2072x_priv *cx2072x = snd_soc_component_get_drvdata(codec);
> +	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(codec);
> +
> +	/* No-sticky input type */
> +	regmap_write(cx2072x->regmap, CX2072X_GPIO_STICKY_MASK, 0x1f);
> +
> +	/* Use GPOI0 as interrupt pin */
> +	regmap_write(cx2072x->regmap, CX2072X_UM_INTERRUPT_CRTL_E, 0x12 << 24);

This isn't board specific is it?

> +int snd_soc_cx2072x_get_jack_state(struct snd_soc_component *codec)
> +{
> +	struct cx2072x_priv *cx2072x = snd_soc_component_get_drvdata(codec);
> +	unsigned int jack;
> +	unsigned int type = 0;
> +	int state = 0;
> +	bool need_cache_bypass =
> +		snd_soc_component_get_bias_level(codec) == SND_SOC_BIAS_OFF;
> +
> +	if (need_cache_bypass)
> +		regcache_cache_only(cx2072x->regmap, false);

This looks funky and racy - what's going on here?  If the register map
is live and usable why is it in cache only mode?

> +	dev_dbg(codec->dev, "CX2072X_HSDETECT type=0x%X,Jack state = %x\n",
> +		type, state);
> +	return state;
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_cx2072x_get_jack_state);

Why is this symbol exported?

> +static void cx2072x_shutdown(struct snd_pcm_substream *substream,
> +			     struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_component *codec = dai->component;
> +	struct cx2072x_priv *cx2072x = snd_soc_component_get_drvdata(codec);
> +
> +	/* shutdown codec */
> +	regcache_cache_only(cx2072x->regmap, false);
> +	regmap_write(cx2072x->regmap, CX2072X_PORTA_POWER_STATE, 3);
> +	regmap_write(cx2072x->regmap, CX2072X_PORTB_POWER_STATE, 3);
> +	regmap_write(cx2072x->regmap, CX2072X_PORTC_POWER_STATE, 3);
> +	regmap_write(cx2072x->regmap, CX2072X_PORTD_POWER_STATE, 3);
> +	regmap_write(cx2072x->regmap, CX2072X_PORTE_POWER_STATE, 3);
> +	regmap_write(cx2072x->regmap, CX2072X_PORTG_POWER_STATE, 3);
> +	regmap_write(cx2072x->regmap, CX2072X_MIXER_POWER_STATE, 3);
> +	regmap_write(cx2072x->regmap, CX2072X_ADC1_POWER_STATE, 3);
> +	regmap_write(cx2072x->regmap, CX2072X_ADC2_POWER_STATE, 3);
> +	regmap_write(cx2072x->regmap, CX2072X_DAC1_POWER_STATE, 3);
> +	regmap_write(cx2072x->regmap, CX2072X_DAC2_POWER_STATE, 3);

Why isn't DAPM powering things off for us?

> +	/* use flat eq by default */
> +	for (ch = 0 ; ch < 2 ; ch++) {
> +		for (band = 0; band < CX2072X_PLBK_EQ_BAND_NUM; band++) {
> +			cx2072x->plbk_eq[ch][band][1] = 64;
> +			cx2072x->plbk_eq[ch][band][10] = 3;
> +		}
> +	}

Why not use the register defaults?

> +static bool cx2072x_readable_register(struct device *dev, unsigned int reg)
> +{
> +	switch (reg) {
> +	case CX2072X_VENDOR_ID:

It's weird that this is a long way away from the other regmap functions.

--wHh0aNzodMFDTGdO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzEmIkACgkQJNaLcl1U
h9AdzQf6A070BN0BluSzF3ZzQFe2moeQmxPBnyV00+rcKGpgXvABVV9iYWD60ipE
iVOlwIecQ+BCrutT4Xi9q2wbcUJqZgARusIpzWIqR05IdGccwebHZWPH7K4DdFhX
9VAjNNJboapF7epCy2cykKydf2DnwQlE9CQTfbyMlr/IrmWaRknUrIFgdX5/NSs4
hMXdZprYylT3375P/hE+kXGbus0f+p7PIOoLA4fYGYMZRCxsv3ozYj7FtbqESGv4
koB/sPl0GPVmJ/mSMaLATgTchlwVL64K0wa2UhdtP3SziPBsW973PAiKYfhIoqfj
hcZQ06Xd6MUDezQghaMRgvNxQeb4/w==
=Ezcv
-----END PGP SIGNATURE-----

--wHh0aNzodMFDTGdO--

--===============3449704062134788599==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3449704062134788599==--
