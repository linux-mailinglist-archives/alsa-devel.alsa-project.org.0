Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE4D1960BE
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Mar 2020 22:52:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 013BB1673;
	Fri, 27 Mar 2020 22:52:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 013BB1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585345975;
	bh=XzrUQUHWWwqmuq1Syqi7HZipH7ycharjRhsy77+RyM8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jvPsIhO9e6DsEHpj/I+g/khGIVTl2pTeE0U3wCN0tyBzrKBPX0J3PcRi6RyPgGTxu
	 DjiFNCUSr8jTOBiNnG5XntVDI2/y+6tNcafel54zziZudJQ946o15UbKiH5DlrV23f
	 Ch/THvANfm3rDuPZq7qAFl2hFrnSEyjR/6OaTHBE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FCB5F8015A;
	Fri, 27 Mar 2020 22:51:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A772F80158; Fri, 27 Mar 2020 22:51:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx.flatmax.org (mx.flatmax.org [13.55.16.222])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11AB3F8011E
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 22:51:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11AB3F8011E
Received: from 41.68.233.220.static.exetel.com.au ([220.233.68.41]
 helo=[192.168.1.50])
 by mx.flatmax.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <flatmax@flatmax.org>)
 id 1jHwsP-00088s-A0; Sat, 28 Mar 2020 08:50:53 +1100
Subject: Re: [PATCH] ASoC: bcm2835-i2s: substream alignment now independent in
 hwparams
To: Matthias Reichl <hias@horus.com>
References: <20200324090823.20754-1-flatmax@flatmax.org>
 <d0684926-3f7a-0b97-a298-4088925442a4@flatmax.org>
 <1dcf128a-4ad3-0efa-81e4-b3ccc7caa8f1@flatmax.org>
 <20200327132324.GA4523@lenny.lan>
From: Matt Flax <flatmax@flatmax.org>
Message-ID: <59b9ef4e-0067-593e-b4f9-49a5b271b432@flatmax.org>
Date: Sat, 28 Mar 2020 08:50:52 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200327132324.GA4523@lenny.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
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


On 28/3/20 12:23 am, Matthias Reichl wrote:
> On Fri, Mar 27, 2020 at 11:30:50AM +1100, Matt Flax wrote:
>> On 27/3/20 10:56 am, Matt Flax wrote:
>>> Should this patch be handled through the ALSA team the R. Pi team or the
>>> BCM team ?
>>>
>> Resending again with reduced recipients.
>>
>>
>>> thanks
>>>
>>> Matt
>>>
>>> On 24/3/20 8:08 pm, Matt Flax wrote:
>>>> Substream sample alignment was being set in hwparams for both
>>>> substreams at the same time. This became a problem when    the Audio
>>>> Injector isolated sound card needed to offset sample alignment
>>>> for high sample    rates. The latency difference between playback
>>>> and capture occurs because of the digital isolation chip
>>>> propagation time, particularly when the codec is master and
>>>> the DAC return is twice delayed.
>>>>
>>>> This patch sets sample alignment registers  based on the substream
>>>> direction in hwparams. This gives the machine driver more control
>>>> over sample alignment in the bcm2835 i2s driver.
>>>>
>>>> Signed-off-by: Matt Flax <flatmax@flatmax.org>
>>>> ---
>>>>    sound/soc/bcm/bcm2835-i2s.c | 36 +++++++++++++++++++-----------------
>>>>    1 file changed, 19 insertions(+), 17 deletions(-)
>>>>
>>>> diff --git a/sound/soc/bcm/bcm2835-i2s.c b/sound/soc/bcm/bcm2835-i2s.c
>>>> index e6a12e271b07..9db542699a13 100644
>>>> --- a/sound/soc/bcm/bcm2835-i2s.c
>>>> +++ b/sound/soc/bcm/bcm2835-i2s.c
>>>> @@ -493,11 +493,6 @@ static int bcm2835_i2s_hw_params(struct
>>>> snd_pcm_substream *substream,
>>>>            return -EINVAL;
>>>>        }
>>>>    -    bcm2835_i2s_calc_channel_pos(&rx_ch1_pos, &rx_ch2_pos,
>>>> -        rx_mask, slot_width, data_delay, odd_slot_offset);
>>>> -    bcm2835_i2s_calc_channel_pos(&tx_ch1_pos, &tx_ch2_pos,
>>>> -        tx_mask, slot_width, data_delay, odd_slot_offset);
>>>> -
>>>>        /*
>>>>         * Transmitting data immediately after frame start, eg
>>>>         * in left-justified or DSP mode A, only works stable
>>>> @@ -508,19 +503,26 @@ static int bcm2835_i2s_hw_params(struct
>>>> snd_pcm_substream *substream,
>>>>                "Unstable slave config detected, L/R may be swapped");
>>>>          /*
>>>> -     * Set format for both streams.
>>>> -     * We cannot set another frame length
>>>> -     * (and therefore word length) anyway,
>>>> -     * so the format will be the same.
>>>> +     * Set format on a per stream basis.
>>>> +     * The alignment format can be different depending on direction.
>>>>         */
>>>> -    regmap_write(dev->i2s_regmap, BCM2835_I2S_RXC_A_REG,
>>>> -          format
>>>> -        | BCM2835_I2S_CH1_POS(rx_ch1_pos)
>>>> -        | BCM2835_I2S_CH2_POS(rx_ch2_pos));
>>>> -    regmap_write(dev->i2s_regmap, BCM2835_I2S_TXC_A_REG,
>>>> -          format
>>>> -        | BCM2835_I2S_CH1_POS(tx_ch1_pos)
>>>> -        | BCM2835_I2S_CH2_POS(tx_ch2_pos));
>>>> +    if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
>>>> +        bcm2835_i2s_calc_channel_pos(&rx_ch1_pos, &rx_ch2_pos,
>>>> +            rx_mask, slot_width, data_delay, odd_slot_offset);
>>>> +        regmap_write(dev->i2s_regmap, BCM2835_I2S_RXC_A_REG,
>>>> +              format
>>>> +            | BCM2835_I2S_CH1_POS(rx_ch1_pos)
>>>> +            | BCM2835_I2S_CH2_POS(rx_ch2_pos));
>>>> +    }
>>>> +
>>>> +    if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
>>>> +        bcm2835_i2s_calc_channel_pos(&tx_ch1_pos, &tx_ch2_pos,
>>>> +            tx_mask, slot_width, data_delay, odd_slot_offset);
>>>> +        regmap_write(dev->i2s_regmap, BCM2835_I2S_TXC_A_REG,
>>>> +              format
>>>> +            | BCM2835_I2S_CH1_POS(tx_ch1_pos)
>>>> +            | BCM2835_I2S_CH2_POS(tx_ch2_pos));
>>>> +    }
>>>>          /* Setup the I2S mode */
> This will break duplex operation if a second stream is opened when
> a stream is already running as the channel position registers for
> the second stream haven't been set up.
>
> Note this code at the very beginning of hw_params:
>
>          /*
>           * If a stream is already enabled,
>           * the registers are already set properly.
>           */
>          regmap_read(dev->i2s_regmap, BCM2835_I2S_CS_A_REG, &csreg);
>
>          if (csreg & (BCM2835_I2S_TXON | BCM2835_I2S_RXON))
>                  return 0;
>
> The reason for this check is that we can't change bcm2835 I2S registers
> after I2S RX/TX has been enabled - the reason why is explained in the
> datasheet:
>
>> The PCM interface runs asynchronously at the PCM_CLK rate and
>> automatically transfers transmit and receive data across to the
>> internal APB clock domain. The control registers are NOT
>> synchronised and should be programmed before the device is enabled
>> and should NOT be changed whilst the interface is running.
>>
>> Only the EN, RXON and TXON bits of the PCMCS register are synchronised
>> across the PCM - APB clock domain and are allowed to be changed whilst
>> the interface is running.
> Therefore we need to set up channel masks for both RX and TX before
> any stream is started.


I see what you mean. We can't change the registers once the system has 
started half duplex and then subsequently changed to full duplex.

There are cases however where playback and capture need to be set 
independently. In these cases the machine driver requires different 
format settings based on the stream direction.

What if we make a check for whether the system is already running and in 
that case return an error - forcing the user to use specify the same 
dai_fmt which is already in use before continuing ?

Would there be a better way to achieve different hwparams based on 
stream direction ?

Matt

