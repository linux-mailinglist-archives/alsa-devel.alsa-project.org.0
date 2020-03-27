Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82780194E0D
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Mar 2020 01:32:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2407166C;
	Fri, 27 Mar 2020 01:31:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2407166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585269169;
	bh=vcsoS24jj7gTGagIyWwp+fdT1Cwu+GHiyS2KXJ6l9No=;
	h=Subject:From:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QjC3KFfp6YdaRFvZPTiXKTQB2ipC+2ojoVV104LEsy+UuxsCtwAtCnpNRsYomrmuo
	 Nvddw+JKEztLLbhalgC+yQ94yt9IL1/qRsBy8vguSNJHG8Y6hYdjJmQKlIAoXf89F4
	 p//YTxeeQ/BockcKmnhplS9q9KlUZb7zstwp6NXc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5B3DF80234;
	Fri, 27 Mar 2020 01:31:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50D58F80227; Fri, 27 Mar 2020 01:31:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=MISSING_HEADERS, SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx.flatmax.org (mx.flatmax.org [13.55.16.222])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90397F80095
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 01:30:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90397F80095
Received: from 41.68.233.220.static.exetel.com.au ([220.233.68.41]
 helo=[192.168.1.51])
 by mx.flatmax.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <flatmax@flatmax.org>)
 id 1jHcte-0007rg-U3; Fri, 27 Mar 2020 11:30:51 +1100
Subject: Re: [PATCH] ASoC: bcm2835-i2s: substream alignment now independent in
 hwparams
From: Matt Flax <flatmax@flatmax.org>
References: <20200324090823.20754-1-flatmax@flatmax.org>
 <d0684926-3f7a-0b97-a298-4088925442a4@flatmax.org>
Message-ID: <1dcf128a-4ad3-0efa-81e4-b3ccc7caa8f1@flatmax.org>
Date: Fri, 27 Mar 2020 11:30:50 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <d0684926-3f7a-0b97-a298-4088925442a4@flatmax.org>
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


On 27/3/20 10:56 am, Matt Flax wrote:
>
> Should this patch be handled through the ALSA team the R. Pi team or 
> the BCM team ?
>

Resending again with reduced recipients.


>
> thanks
>
> Matt
>
> On 24/3/20 8:08 pm, Matt Flax wrote:
>> Substream sample alignment was being set in hwparams for both
>> substreams at the same time. This became a problem when    the Audio
>> Injector isolated sound card needed to offset sample alignment
>> for high sample    rates. The latency difference between playback
>> and capture occurs because of the digital isolation chip
>> propagation time, particularly when the codec is master and
>> the DAC return is twice delayed.
>>
>> This patch sets sample alignment registers  based on the substream
>> direction in hwparams. This gives the machine driver more control
>> over sample alignment in the bcm2835 i2s driver.
>>
>> Signed-off-by: Matt Flax <flatmax@flatmax.org>
>> ---
>>   sound/soc/bcm/bcm2835-i2s.c | 36 +++++++++++++++++++-----------------
>>   1 file changed, 19 insertions(+), 17 deletions(-)
>>
>> diff --git a/sound/soc/bcm/bcm2835-i2s.c b/sound/soc/bcm/bcm2835-i2s.c
>> index e6a12e271b07..9db542699a13 100644
>> --- a/sound/soc/bcm/bcm2835-i2s.c
>> +++ b/sound/soc/bcm/bcm2835-i2s.c
>> @@ -493,11 +493,6 @@ static int bcm2835_i2s_hw_params(struct 
>> snd_pcm_substream *substream,
>>           return -EINVAL;
>>       }
>>   -    bcm2835_i2s_calc_channel_pos(&rx_ch1_pos, &rx_ch2_pos,
>> -        rx_mask, slot_width, data_delay, odd_slot_offset);
>> -    bcm2835_i2s_calc_channel_pos(&tx_ch1_pos, &tx_ch2_pos,
>> -        tx_mask, slot_width, data_delay, odd_slot_offset);
>> -
>>       /*
>>        * Transmitting data immediately after frame start, eg
>>        * in left-justified or DSP mode A, only works stable
>> @@ -508,19 +503,26 @@ static int bcm2835_i2s_hw_params(struct 
>> snd_pcm_substream *substream,
>>               "Unstable slave config detected, L/R may be swapped");
>>         /*
>> -     * Set format for both streams.
>> -     * We cannot set another frame length
>> -     * (and therefore word length) anyway,
>> -     * so the format will be the same.
>> +     * Set format on a per stream basis.
>> +     * The alignment format can be different depending on direction.
>>        */
>> -    regmap_write(dev->i2s_regmap, BCM2835_I2S_RXC_A_REG,
>> -          format
>> -        | BCM2835_I2S_CH1_POS(rx_ch1_pos)
>> -        | BCM2835_I2S_CH2_POS(rx_ch2_pos));
>> -    regmap_write(dev->i2s_regmap, BCM2835_I2S_TXC_A_REG,
>> -          format
>> -        | BCM2835_I2S_CH1_POS(tx_ch1_pos)
>> -        | BCM2835_I2S_CH2_POS(tx_ch2_pos));
>> +    if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
>> +        bcm2835_i2s_calc_channel_pos(&rx_ch1_pos, &rx_ch2_pos,
>> +            rx_mask, slot_width, data_delay, odd_slot_offset);
>> +        regmap_write(dev->i2s_regmap, BCM2835_I2S_RXC_A_REG,
>> +              format
>> +            | BCM2835_I2S_CH1_POS(rx_ch1_pos)
>> +            | BCM2835_I2S_CH2_POS(rx_ch2_pos));
>> +    }
>> +
>> +    if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
>> +        bcm2835_i2s_calc_channel_pos(&tx_ch1_pos, &tx_ch2_pos,
>> +            tx_mask, slot_width, data_delay, odd_slot_offset);
>> +        regmap_write(dev->i2s_regmap, BCM2835_I2S_TXC_A_REG,
>> +              format
>> +            | BCM2835_I2S_CH1_POS(tx_ch1_pos)
>> +            | BCM2835_I2S_CH2_POS(tx_ch2_pos));
>> +    }
>>         /* Setup the I2S mode */
