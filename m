Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9A7958DF
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2019 09:50:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D55D169B;
	Tue, 20 Aug 2019 09:49:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D55D169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566287445;
	bh=+bKwT8qJxQaopegqrZtK7Iuk3xqv+dDLkthyELG3sPY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vt5sLUbFcSTtEerGPes+QSxvdPrhHIuW1pcj07350LJEMAgOCcREDnEDvDu8c3Foh
	 UrPXUKgnPkFG9wJLu38CFaOwggsr0xRhtfIEC+M0RrE88sjUKsfnpzenp2CgVlPe4b
	 vGCYhlJOXbQ32Hsh0LfYgD+sReZwuyIMFHaRlNb8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6643F896B9;
	Tue, 20 Aug 2019 09:19:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 592DEF800D3; Tue, 20 Aug 2019 07:46:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtpng3.m.smailru.net (smtpng3.m.smailru.net [94.100.177.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12AC4F800D3
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 07:46:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12AC4F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=orpaltech.com header.i=@orpaltech.com
 header.b="GJIUC5OK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=orpaltech.com; s=mailru; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=NDcqlUkB255+we0mmPQVQ21uehWPUdr9FWH8KdeYuoM=; 
 b=GJIUC5OKNcyonl3A2r+FSh531xnZVzo/hZ4HsL9qMx68Wa+teksDzZtw6MQaO2zlY/etW+aS4RhLxqHIkEzVXvS1AzUIsreroLveRXGTBZTXH3ImUPVR03SszOiVRvsgRvi7+zfnFtw7n6BalCS4rp9D6E79hc5jw5uSNvlBIGc=;
Received: by smtpng3.m.smailru.net with esmtpa (envelope-from
 <ssuloev@orpaltech.com>)
 id 1hzwyW-0000Gs-3h; Tue, 20 Aug 2019 08:46:32 +0300
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 lgirdwood@gmail.com, broonie@kernel.org
References: <cover.e08aa7e33afe117e1fa8f017119d465d47c98016.1566242458.git-series.maxime.ripard@bootlin.com>
 <26392af30b3e7b31ee48d5b867d45be8675db046.1566242458.git-series.maxime.ripard@bootlin.com>
From: Sergey Suloev <ssuloev@orpaltech.com>
Message-ID: <c311e88a-fdd2-8a01-275e-675d98dc90ba@orpaltech.com>
Date: Tue, 20 Aug 2019 08:46:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <26392af30b3e7b31ee48d5b867d45be8675db046.1566242458.git-series.maxime.ripard@bootlin.com>
Content-Language: en-US
Authentication-Results: smtpng3.m.smailru.net;
 auth=pass smtp.auth=ssuloev@orpaltech.com
 smtp.mailfrom=ssuloev@orpaltech.com
X-77F55803: BBE463BEF7A60BD05A78504BD2AC2941C0825F4D866972283A121E2816E2D315B2A76064F0759C6C8577FA5B86FB3C7C
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7D4A169723F56FEDEEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637861E0AC852D5F5A18638F802B75D45FF5571747095F342E8C7A0BC55FA0FE5FC81DE712020495B8EBE0BA17992DA9D5BBBB102B42771252F389733CBF5DBD5E913377AFFFEAFD269A417C69337E82CC2CC7F00164DA146DAFE8445B8C89999725571747095F342E8C26CFBAC0749D213D2E47CDBA5A9658359CC434672EE6371117882F4460429728AD0CFFFB425014E40A5AABA2AD3711975ECD9A6C639B01B78DA827A17800CE77FBF75EC45431A369FB946E88D3D303475ECD9A6C639B01B4E70A05D1297E1BBC6867C52282FAC85D9B7C4F32B44FF5797B92FCB1594A39500306258E7E6ABB4E4A6367B16DE6309
X-Mailru-Sender: 689FA8AB762F739359CD701D0F70D3B1857278A1594B1D92F9FE63088107E8F2778B5FB1219D8779F6BCD4B1DE95BF653AE5922765F965CDF1D7D1B96E5495AE10FCEA6DFE3E0A150D4ABDE8C577C2ED
X-Mras: OK
X-Mailman-Approved-At: Tue, 20 Aug 2019 09:18:29 +0200
Cc: codekipper@gmail.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi, Maxime,

On 8/19/19 10:25 PM, Maxime Ripard wrote:
> From: Maxime Ripard <maxime.ripard@bootlin.com>
>
> The i2s controller supports TDM, for up to 8 slots. Let's support the TDM
> API.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>   sound/soc/sunxi/sun4i-i2s.c | 40 ++++++++++++++++++++++++++++++++------
>   1 file changed, 34 insertions(+), 6 deletions(-)
>
> diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> index 0dac09814b65..4f76daeaaed7 100644
> --- a/sound/soc/sunxi/sun4i-i2s.c
> +++ b/sound/soc/sunxi/sun4i-i2s.c
> @@ -168,6 +168,8 @@ struct sun4i_i2s {
>   	struct reset_control *rst;
>   
>   	unsigned int	mclk_freq;
> +	unsigned int	slots;
> +	unsigned int	slot_width;
>   
>   	struct snd_dmaengine_dai_dma_data	capture_dma_data;
>   	struct snd_dmaengine_dai_dma_data	playback_dma_data;
> @@ -287,7 +289,7 @@ static bool sun4i_i2s_oversample_is_valid(unsigned int oversample)
>   
>   static int sun4i_i2s_set_clk_rate(struct snd_soc_dai *dai,
>   				  unsigned int rate,
> -				  unsigned int channels,
> +				  unsigned int slots,
>   				  unsigned int word_size)
>   {
>   	struct sun4i_i2s *i2s = snd_soc_dai_get_drvdata(dai);
> @@ -335,7 +337,7 @@ static int sun4i_i2s_set_clk_rate(struct snd_soc_dai *dai,
>   
>   	bclk_parent_rate = i2s->variant->get_bclk_parent_rate(i2s);
>   	bclk_div = sun4i_i2s_get_bclk_div(i2s, bclk_parent_rate,
> -					  rate, channels, word_size);
> +					  rate, slots, word_size);
>   	if (bclk_div < 0) {
>   		dev_err(dai->dev, "Unsupported BCLK divider: %d\n", bclk_div);
>   		return -EINVAL;
> @@ -419,6 +421,10 @@ static int sun8i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
>   				  const struct snd_pcm_hw_params *params)
>   {
>   	unsigned int channels = params_channels(params);
> +	unsigned int slots = channels;
> +
> +	if (i2s->slots)
> +		slots = i2s->slots;
>   
>   	/* Map the channels for playback and capture */
>   	regmap_write(i2s->regmap, SUN8I_I2S_TX_CHAN_MAP_REG, 0x76543210);
> @@ -428,7 +434,6 @@ static int sun8i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
>   	regmap_update_bits(i2s->regmap, SUN8I_I2S_TX_CHAN_SEL_REG,
>   			   SUN4I_I2S_CHAN_SEL_MASK,
>   			   SUN4I_I2S_CHAN_SEL(channels));
> -
>   	regmap_update_bits(i2s->regmap, SUN8I_I2S_RX_CHAN_SEL_REG,
>   			   SUN4I_I2S_CHAN_SEL_MASK,
>   			   SUN4I_I2S_CHAN_SEL(channels));
> @@ -452,10 +457,18 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
>   			       struct snd_soc_dai *dai)
>   {
>   	struct sun4i_i2s *i2s = snd_soc_dai_get_drvdata(dai);
> +	unsigned int word_size = params_width(params);
>   	unsigned int channels = params_channels(params);
> +	unsigned int slots = channels;
>   	int ret, sr, wss;
>   	u32 width;
>   
> +	if (i2s->slots)
> +		slots = i2s->slots;
> +
> +	if (i2s->slot_width)
> +		word_size = i2s->slot_width;
> +
>   	ret = i2s->variant->set_chan_cfg(i2s, params);
>   	if (ret < 0) {
>   		dev_err(dai->dev, "Invalid channel configuration\n");
> @@ -477,15 +490,14 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
>   	if (sr < 0)
>   		return -EINVAL;
>   
> -	wss = i2s->variant->get_wss(i2s, params_width(params));
> +	wss = i2s->variant->get_wss(i2s, word_size);
>   	if (wss < 0)
>   		return -EINVAL;
>   
>   	regmap_field_write(i2s->field_fmt_wss, wss);
>   	regmap_field_write(i2s->field_fmt_sr, sr);
>   
> -	return sun4i_i2s_set_clk_rate(dai, params_rate(params),
> -				      channels, params_width(params));
> +	return sun4i_i2s_set_clk_rate(dai, params_rate(params), slots, word_size);
>   }
>   
>   static int sun4i_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
> @@ -785,10 +797,26 @@ static int sun4i_i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id,
>   	return 0;
>   }
>   
> +static int sun4i_i2s_set_tdm_slot(struct snd_soc_dai *dai,
> +				  unsigned int tx_mask, unsigned int rx_mask,
> +				  int slots, int slot_width)
> +{
> +	struct sun4i_i2s *i2s = snd_soc_dai_get_drvdata(dai);
> +
> +	if (slots > 8)
> +		return -EINVAL;
> +
> +	i2s->slots = slots;
> +	i2s->slot_width = slot_width;
> +
> +	return 0;
> +}
> +
>   static const struct snd_soc_dai_ops sun4i_i2s_dai_ops = {
>   	.hw_params	= sun4i_i2s_hw_params,
>   	.set_fmt	= sun4i_i2s_set_fmt,
>   	.set_sysclk	= sun4i_i2s_set_sysclk,
> +	.set_tdm_slot	= sun4i_i2s_set_tdm_slot,
>   	.trigger	= sun4i_i2s_trigger,
>   };
>   


it seems like you forgot to implement sun4i_i2s_dai_ops.set_bclk_ratio 
because, as I far as I understand, it should alter tdm slots 
functionality indirectly.


Thank you,
SS


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
