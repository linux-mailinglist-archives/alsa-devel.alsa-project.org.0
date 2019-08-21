Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A25978D1
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2019 14:07:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4D2A1666;
	Wed, 21 Aug 2019 14:06:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4D2A1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566389267;
	bh=3b1dLeIcCz1FYETFDfo3Mx2n/P7b7FypPDZToWTI7lU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kdLIJ6XdjPdsXMRnQJDM3wM0N1aT8nzk8GHhdPln28VAoeIIzPSMG/+WZJ+01MFAk
	 QbSg89r601eUYxUra40Q7+FY0JTNAaNSAM1L8kEdA4fSJ2kkavDnoSjDyWTBNh2uo7
	 3FlY7bSRWQ3X7eZwuH5LYBGyvawWQv70QtoA8GB4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BAB3FF80306;
	Wed, 21 Aug 2019 14:06:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B103F80306; Wed, 21 Aug 2019 14:06:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27E88F80157
 for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2019 14:05:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27E88F80157
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IbIaUibt"
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6825C2089E;
 Wed, 21 Aug 2019 12:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566389153;
 bh=2FRrclBMVAhxORSkvx15JbwCjv+rECZrE3tmzTI6fjQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IbIaUibt98RW+BrZlXwdHPhbsgLQ9iOj11mOxlw6Yjy1yayKkHC4aRDGmudrko7Kx
 noHVlKvbF69kchSJz2ghinFmicUmJh1uuf7G/o7kEBUZrBsJJqDiDMperYLvKafvYv
 b1eKr/vXsFluy6CmtTWTuLDHZlYoB+K02En2rqBs=
Date: Wed, 21 Aug 2019 14:05:51 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Sergey Suloev <ssuloev@orpaltech.com>
Message-ID: <20190821120551.r4b3h4nnet357wem@flea>
References: <cover.e08aa7e33afe117e1fa8f017119d465d47c98016.1566242458.git-series.maxime.ripard@bootlin.com>
 <26392af30b3e7b31ee48d5b867d45be8675db046.1566242458.git-series.maxime.ripard@bootlin.com>
 <c311e88a-fdd2-8a01-275e-675d98dc90ba@orpaltech.com>
MIME-Version: 1.0
In-Reply-To: <c311e88a-fdd2-8a01-275e-675d98dc90ba@orpaltech.com>
User-Agent: NeoMutt/20180716
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, codekipper@gmail.com,
 Chen-Yu Tsai <wens@csie.org>, broonie@kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 20/21] ASoC: sun4i-i2s: Add support for TDM
	slots
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
Content-Type: multipart/mixed; boundary="===============4446499963681601678=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============4446499963681601678==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hsc5ca3rnlaanrdu"
Content-Disposition: inline


--hsc5ca3rnlaanrdu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Tue, Aug 20, 2019 at 08:46:30AM +0300, Sergey Suloev wrote:
> Hi, Maxime,
>
> On 8/19/19 10:25 PM, Maxime Ripard wrote:
> > From: Maxime Ripard <maxime.ripard@bootlin.com>
> >
> > The i2s controller supports TDM, for up to 8 slots. Let's support the TDM
> > API.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> > ---
> >   sound/soc/sunxi/sun4i-i2s.c | 40 ++++++++++++++++++++++++++++++++------
> >   1 file changed, 34 insertions(+), 6 deletions(-)
> >
> > diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> > index 0dac09814b65..4f76daeaaed7 100644
> > --- a/sound/soc/sunxi/sun4i-i2s.c
> > +++ b/sound/soc/sunxi/sun4i-i2s.c
> > @@ -168,6 +168,8 @@ struct sun4i_i2s {
> >   	struct reset_control *rst;
> >   	unsigned int	mclk_freq;
> > +	unsigned int	slots;
> > +	unsigned int	slot_width;
> >   	struct snd_dmaengine_dai_dma_data	capture_dma_data;
> >   	struct snd_dmaengine_dai_dma_data	playback_dma_data;
> > @@ -287,7 +289,7 @@ static bool sun4i_i2s_oversample_is_valid(unsigned int oversample)
> >   static int sun4i_i2s_set_clk_rate(struct snd_soc_dai *dai,
> >   				  unsigned int rate,
> > -				  unsigned int channels,
> > +				  unsigned int slots,
> >   				  unsigned int word_size)
> >   {
> >   	struct sun4i_i2s *i2s = snd_soc_dai_get_drvdata(dai);
> > @@ -335,7 +337,7 @@ static int sun4i_i2s_set_clk_rate(struct snd_soc_dai *dai,
> >   	bclk_parent_rate = i2s->variant->get_bclk_parent_rate(i2s);
> >   	bclk_div = sun4i_i2s_get_bclk_div(i2s, bclk_parent_rate,
> > -					  rate, channels, word_size);
> > +					  rate, slots, word_size);
> >   	if (bclk_div < 0) {
> >   		dev_err(dai->dev, "Unsupported BCLK divider: %d\n", bclk_div);
> >   		return -EINVAL;
> > @@ -419,6 +421,10 @@ static int sun8i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
> >   				  const struct snd_pcm_hw_params *params)
> >   {
> >   	unsigned int channels = params_channels(params);
> > +	unsigned int slots = channels;
> > +
> > +	if (i2s->slots)
> > +		slots = i2s->slots;
> >   	/* Map the channels for playback and capture */
> >   	regmap_write(i2s->regmap, SUN8I_I2S_TX_CHAN_MAP_REG, 0x76543210);
> > @@ -428,7 +434,6 @@ static int sun8i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
> >   	regmap_update_bits(i2s->regmap, SUN8I_I2S_TX_CHAN_SEL_REG,
> >   			   SUN4I_I2S_CHAN_SEL_MASK,
> >   			   SUN4I_I2S_CHAN_SEL(channels));
> > -
> >   	regmap_update_bits(i2s->regmap, SUN8I_I2S_RX_CHAN_SEL_REG,
> >   			   SUN4I_I2S_CHAN_SEL_MASK,
> >   			   SUN4I_I2S_CHAN_SEL(channels));
> > @@ -452,10 +457,18 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
> >   			       struct snd_soc_dai *dai)
> >   {
> >   	struct sun4i_i2s *i2s = snd_soc_dai_get_drvdata(dai);
> > +	unsigned int word_size = params_width(params);
> >   	unsigned int channels = params_channels(params);
> > +	unsigned int slots = channels;
> >   	int ret, sr, wss;
> >   	u32 width;
> > +	if (i2s->slots)
> > +		slots = i2s->slots;
> > +
> > +	if (i2s->slot_width)
> > +		word_size = i2s->slot_width;
> > +
> >   	ret = i2s->variant->set_chan_cfg(i2s, params);
> >   	if (ret < 0) {
> >   		dev_err(dai->dev, "Invalid channel configuration\n");
> > @@ -477,15 +490,14 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
> >   	if (sr < 0)
> >   		return -EINVAL;
> > -	wss = i2s->variant->get_wss(i2s, params_width(params));
> > +	wss = i2s->variant->get_wss(i2s, word_size);
> >   	if (wss < 0)
> >   		return -EINVAL;
> >   	regmap_field_write(i2s->field_fmt_wss, wss);
> >   	regmap_field_write(i2s->field_fmt_sr, sr);
> > -	return sun4i_i2s_set_clk_rate(dai, params_rate(params),
> > -				      channels, params_width(params));
> > +	return sun4i_i2s_set_clk_rate(dai, params_rate(params), slots, word_size);
> >   }
> >   static int sun4i_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
> > @@ -785,10 +797,26 @@ static int sun4i_i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id,
> >   	return 0;
> >   }
> > +static int sun4i_i2s_set_tdm_slot(struct snd_soc_dai *dai,
> > +				  unsigned int tx_mask, unsigned int rx_mask,
> > +				  int slots, int slot_width)
> > +{
> > +	struct sun4i_i2s *i2s = snd_soc_dai_get_drvdata(dai);
> > +
> > +	if (slots > 8)
> > +		return -EINVAL;
> > +
> > +	i2s->slots = slots;
> > +	i2s->slot_width = slot_width;
> > +
> > +	return 0;
> > +}
> > +
> >   static const struct snd_soc_dai_ops sun4i_i2s_dai_ops = {
> >   	.hw_params	= sun4i_i2s_hw_params,
> >   	.set_fmt	= sun4i_i2s_set_fmt,
> >   	.set_sysclk	= sun4i_i2s_set_sysclk,
> > +	.set_tdm_slot	= sun4i_i2s_set_tdm_slot,
> >   	.trigger	= sun4i_i2s_trigger,
> >   };
>
> it seems like you forgot to implement sun4i_i2s_dai_ops.set_bclk_ratio
> because, as I far as I understand, it should alter tdm slots functionality
> indirectly.

As far as I can see, while this indeed changes a few things on the TDM
setup, it's optional, orthogonal and it has a single user in the tree
(some intel platform card).

So I'd say that if someone ever needs it, we can have it, but it's not
a blocker.

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--hsc5ca3rnlaanrdu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXV0znwAKCRDj7w1vZxhR
xRAgAP9EHPMB6Hx7FqcfcszC8f7EF/uLx9RlJGciIrJpOQnKcwEAuaxLthvSNVh/
RddPDN3sljHZtOQBGhyVmlCuwyQoUAk=
=iCnK
-----END PGP SIGNATURE-----

--hsc5ca3rnlaanrdu--

--===============4446499963681601678==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============4446499963681601678==--
