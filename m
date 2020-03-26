Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4E7194DA1
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Mar 2020 00:59:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 861CF166E;
	Fri, 27 Mar 2020 00:58:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 861CF166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585267156;
	bh=qjkwe5cbidHAS1scMi+1lLYmQyZyvrZGsfS0aLmzNWc=;
	h=Subject:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XcbMl0Y1gIX/KwIkkx5H69S/3KRadkvKwOfyS4OPweY36f3t+syJL2hXDJAr6hh9t
	 Pj1RkTt981AoWtmtvmg73hEY7swpy+E9OGBBag4d07eqNN3SwAmEahnVDDMCVBcb6R
	 F5jgQHOp4ps4f+ECrJqLSyfm7Qhpx1grTjBam4V4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8475EF80234;
	Fri, 27 Mar 2020 00:57:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25800F80227; Fri, 27 Mar 2020 00:57:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=MISSING_HEADERS, SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx.flatmax.org (mx.flatmax.org [13.55.16.222])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25284F8011E
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 00:57:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25284F8011E
Received: from 41.68.233.220.static.exetel.com.au ([220.233.68.41]
 helo=[192.168.1.51])
 by mx.flatmax.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <flatmax@flatmax.org>)
 id 1jHcMl-0007WX-6U; Fri, 27 Mar 2020 10:56:51 +1100
Subject: Re: [PATCH] ASoC: bcm2835-i2s: substream alignment now independent in
 hwparams
References: <20200324090823.20754-1-flatmax@flatmax.org>
From: Matt Flax <flatmax@flatmax.org>
Message-ID: <d0684926-3f7a-0b97-a298-4088925442a4@flatmax.org>
Date: Fri, 27 Mar 2020 10:56:50 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20200324090823.20754-1-flatmax@flatmax.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Cc: Kate Stewart <kstewart@linuxfoundation.org>, alsa-devel@alsa-project.org,
 Florian Fainelli <f.fainelli@gmail.com>, Scott Branden <sbranden@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Takashi Iwai <tiwai@suse.com>,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Mark Brown <broonie@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org
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


Should this patch be handled through the ALSA team the R. Pi team or the 
BCM team ?


thanks

Matt

On 24/3/20 8:08 pm, Matt Flax wrote:
> Substream sample alignment was being set in hwparams for both
> substreams at the same time. This became a problem when	the Audio
> Injector isolated sound card needed to offset sample alignment
> for high sample	rates. The latency difference between playback
> and capture occurs because of the digital isolation chip
> propagation time, particularly when the codec is master and
> the DAC return is twice delayed.
>
> This patch sets sample alignment registers  based on the substream
> direction in hwparams. This gives the machine driver more control
> over sample alignment in the bcm2835 i2s driver.
>
> Signed-off-by: Matt Flax <flatmax@flatmax.org>
> ---
>   sound/soc/bcm/bcm2835-i2s.c | 36 +++++++++++++++++++-----------------
>   1 file changed, 19 insertions(+), 17 deletions(-)
>
> diff --git a/sound/soc/bcm/bcm2835-i2s.c b/sound/soc/bcm/bcm2835-i2s.c
> index e6a12e271b07..9db542699a13 100644
> --- a/sound/soc/bcm/bcm2835-i2s.c
> +++ b/sound/soc/bcm/bcm2835-i2s.c
> @@ -493,11 +493,6 @@ static int bcm2835_i2s_hw_params(struct snd_pcm_substream *substream,
>   		return -EINVAL;
>   	}
>   
> -	bcm2835_i2s_calc_channel_pos(&rx_ch1_pos, &rx_ch2_pos,
> -		rx_mask, slot_width, data_delay, odd_slot_offset);
> -	bcm2835_i2s_calc_channel_pos(&tx_ch1_pos, &tx_ch2_pos,
> -		tx_mask, slot_width, data_delay, odd_slot_offset);
> -
>   	/*
>   	 * Transmitting data immediately after frame start, eg
>   	 * in left-justified or DSP mode A, only works stable
> @@ -508,19 +503,26 @@ static int bcm2835_i2s_hw_params(struct snd_pcm_substream *substream,
>   			"Unstable slave config detected, L/R may be swapped");
>   
>   	/*
> -	 * Set format for both streams.
> -	 * We cannot set another frame length
> -	 * (and therefore word length) anyway,
> -	 * so the format will be the same.
> +	 * Set format on a per stream basis.
> +	 * The alignment format can be different depending on direction.
>   	 */
> -	regmap_write(dev->i2s_regmap, BCM2835_I2S_RXC_A_REG,
> -		  format
> -		| BCM2835_I2S_CH1_POS(rx_ch1_pos)
> -		| BCM2835_I2S_CH2_POS(rx_ch2_pos));
> -	regmap_write(dev->i2s_regmap, BCM2835_I2S_TXC_A_REG,
> -		  format
> -		| BCM2835_I2S_CH1_POS(tx_ch1_pos)
> -		| BCM2835_I2S_CH2_POS(tx_ch2_pos));
> +	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
> +		bcm2835_i2s_calc_channel_pos(&rx_ch1_pos, &rx_ch2_pos,
> +			rx_mask, slot_width, data_delay, odd_slot_offset);
> +		regmap_write(dev->i2s_regmap, BCM2835_I2S_RXC_A_REG,
> +			  format
> +			| BCM2835_I2S_CH1_POS(rx_ch1_pos)
> +			| BCM2835_I2S_CH2_POS(rx_ch2_pos));
> +	}
> +
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +		bcm2835_i2s_calc_channel_pos(&tx_ch1_pos, &tx_ch2_pos,
> +			tx_mask, slot_width, data_delay, odd_slot_offset);
> +		regmap_write(dev->i2s_regmap, BCM2835_I2S_TXC_A_REG,
> +			  format
> +			| BCM2835_I2S_CH1_POS(tx_ch1_pos)
> +			| BCM2835_I2S_CH2_POS(tx_ch2_pos));
> +	}
>   
>   	/* Setup the I2S mode */
>   
