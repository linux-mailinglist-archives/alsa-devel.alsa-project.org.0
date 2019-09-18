Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10358B5E46
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2019 09:46:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 576A61676;
	Wed, 18 Sep 2019 09:45:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 576A61676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568792807;
	bh=rBvvvd00UEILrBXxFmH1NYVlv/+shOf855G5rce2JD4=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lxX4Nbws4Q1EczOwYOHu9YiZ0zZ0VOJWjDN2iQpS2rDtmJU7DCtlikX6Ak9ankd50
	 o2oa2Mj4J3hyWcURv35I48BBdQxOeqxTOuPrOWTbyd5NpdzW0IElHq5SlKE50ICNZh
	 wsaDiWuX4TOHoVl5ScDT0Qif/GzcOxpSkONgsDys=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07FE0F80534;
	Wed, 18 Sep 2019 09:45:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E664F80506; Wed, 18 Sep 2019 09:45:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3284F80146
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 09:44:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3284F80146
Received: from [78.40.148.177] (helo=localhost)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1iAUdv-0000tM-IO; Wed, 18 Sep 2019 08:44:51 +0100
MIME-Version: 1.0
Date: Wed, 18 Sep 2019 08:44:50 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <077870b1-8856-9a28-dd13-f8bfb1418adb@linux.intel.com>
References: <20190917181233.534-1-ben.dooks@codethink.co.uk>
 <20190917181233.534-3-ben.dooks@codethink.co.uk>
 <077870b1-8856-9a28-dd13-f8bfb1418adb@linux.intel.com>
Message-ID: <de15ea8e9d2c07a1253fd414b421efbe@codethink.co.uk>
X-Sender: ben.dooks@codethink.co.uk
User-Agent: Roundcube Webmail/1.3.10
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@lists.codethink.co.uk,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Edward Cragg <edward.cragg@codethink.co.uk>, linux-tegra@vger.kernel.org,
 linux-tegra-owner@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 2/8] ASoC: tegra: Allow 24bit and 32bit
 samples
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



On 2019-09-17 19:26, Pierre-Louis Bossart wrote:
> On 9/17/19 1:12 PM, Ben Dooks wrote:
>> From: Edward Cragg <edward.cragg@codethink.co.uk>
>> 
>> The tegra3 audio can support 24 and 32 bit sample sizes so add the
>>   option to the tegra30_i2s_hw_params to configure the S24_LE or
>>   S32_LE formats when requested.
>> 
>> Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
>> [ben.dooks@codethink.co.uk: fixup merge of 24 and 32bit]
>> [ben.dooks@codethink.co.uk: add pm calls around ytdm config]
>> [ben.dooks@codethink.co.uk: remove debug prints]
> 

> You need to add your own Signed-off-by when sending patches from other 
> people
Yes, will do when this series has been reviewed and modifications done.

> 
>> ---
>> squash 5aeca5a055fd ASoC: tegra: i2s: pm_runtime_get_sync() is needed 
>> in tdm code
>> 
>> ASoC: tegra: i2s: pm_runtime_get_sync() is needed in tdm code
>> ---
>>   sound/soc/tegra/tegra30_i2s.c | 32 +++++++++++++++++++++++---------
>>   1 file changed, 23 insertions(+), 9 deletions(-)
>> 
>> diff --git a/sound/soc/tegra/tegra30_i2s.c 
>> b/sound/soc/tegra/tegra30_i2s.c
>> index d36b4662b420..b5372839f672 100644
>> --- a/sound/soc/tegra/tegra30_i2s.c
>> +++ b/sound/soc/tegra/tegra30_i2s.c
>> @@ -127,7 +127,7 @@ static int tegra30_i2s_hw_params(struct 
>> snd_pcm_substream *substream,
>>   	struct device *dev = dai->dev;
>>   	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
>>   	unsigned int mask, val, reg;
>> -	int ret, sample_size, srate, i2sclock, bitcnt;
>> +	int ret, sample_size, srate, i2sclock, bitcnt, audio_bits;
>>   	struct tegra30_ahub_cif_conf cif_conf;
>>     	if (params_channels(params) != 2)
>> @@ -137,8 +137,19 @@ static int tegra30_i2s_hw_params(struct 
>> snd_pcm_substream *substream,
>>   	switch (params_format(params)) {
>>   	case SNDRV_PCM_FORMAT_S16_LE:
>>   		val = TEGRA30_I2S_CTRL_BIT_SIZE_16;
>> +		audio_bits = TEGRA30_AUDIOCIF_BITS_16;
>>   		sample_size = 16;
>>   		break;
>> +	case SNDRV_PCM_FORMAT_S24_LE:
>> +		val = TEGRA30_I2S_CTRL_BIT_SIZE_24;
>> +		audio_bits = TEGRA30_AUDIOCIF_BITS_24;
>> +		sample_size = 24;
>> +		break;
>> +	case SNDRV_PCM_FORMAT_S32_LE:
>> +		val = TEGRA30_I2S_CTRL_BIT_SIZE_32;
>> +		audio_bits = TEGRA30_AUDIOCIF_BITS_32;
>> +		sample_size = 32;
>> +		break;
>>   	default:
>>   		return -EINVAL;
>>   	}
>> @@ -170,8 +181,8 @@ static int tegra30_i2s_hw_params(struct 
>> snd_pcm_substream *substream,
>>   	cif_conf.threshold = 0;
>>   	cif_conf.audio_channels = 2;
>>   	cif_conf.client_channels = 2;
>> -	cif_conf.audio_bits = TEGRA30_AUDIOCIF_BITS_16;
>> -	cif_conf.client_bits = TEGRA30_AUDIOCIF_BITS_16;
>> +	cif_conf.audio_bits = audio_bits;
>> +	cif_conf.client_bits = audio_bits;
>>   	cif_conf.expand = 0;
>>   	cif_conf.stereo_conv = 0;
>>   	cif_conf.replicate = 0;
>> @@ -264,10 +275,6 @@ static int tegra30_i2s_set_tdm(struct snd_soc_dai 
>> *dai,
>>   	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
>>   	unsigned int mask = 0, val = 0;
>>   -	dev_info(dai->dev, "%s: setting TDM: tx_mask: 0x%08x rx_mask: 
>> 0x%08x "
>> -		 "slots: 0x%08x " "width: %d\n",
>> -		 __func__, tx_mask, rx_mask, slots, slot_width);
>> -
> 
> This should be squashed in the previous patch

Thanks, looks like I missed a bad rebase and hit this patch instead of 
the
previous.

> 
>>   	/* Set up slots and tx/rx masks */
>>   	mask = TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_MASK |
>>   	       TEGRA30_I2S_SLOT_CTRL_RX_SLOT_ENABLES_MASK |
>> @@ -277,6 +284,8 @@ static int tegra30_i2s_set_tdm(struct snd_soc_dai 
>> *dai,
>>   	      (rx_mask << TEGRA30_I2S_SLOT_CTRL_RX_SLOT_ENABLES_SHIFT) |
>>   	      ((slots - 1) << TEGRA30_I2S_SLOT_CTRL_TOTAL_SLOTS_SHIFT);
>>   +	pm_runtime_get_sync(dai->dev);
>> +
>>   	regmap_update_bits(i2s->regmap, TEGRA30_I2S_SLOT_CTRL, mask, val);
>>     	/* Set FSYNC width */
>> @@ -284,6 +293,7 @@ static int tegra30_i2s_set_tdm(struct snd_soc_dai 
>> *dai,
>>   		TEGRA30_I2S_CH_CTRL_FSYNC_WIDTH_MASK,
>>   		(slot_width - 1) << TEGRA30_I2S_CH_CTRL_FSYNC_WIDTH_SHIFT);
>>   +	pm_runtime_put(dai->dev);
> 
> same for PM stuff, it's not related to 24/32 bit samples

Yes, will do.
Thank you for reviewing.

>>   	return 0;
>>   }
>>   @@ -311,14 +321,18 @@ static const struct snd_soc_dai_driver 
>> tegra30_i2s_dai_template = {
>>   		.channels_min = 2,
>>   		.channels_max = 2,
>>   		.rates = SNDRV_PCM_RATE_8000_96000,
>> -		.formats = SNDRV_PCM_FMTBIT_S16_LE,
>> +		.formats = SNDRV_PCM_FMTBIT_S32_LE |
>> +			   SNDRV_PCM_FMTBIT_S24_LE |
>> +			   SNDRV_PCM_FMTBIT_S16_LE,
>>   	},
>>   	.capture = {
>>   		.stream_name = "Capture",
>>   		.channels_min = 2,
>>   		.channels_max = 2,
>>   		.rates = SNDRV_PCM_RATE_8000_96000,
>> -		.formats = SNDRV_PCM_FMTBIT_S16_LE,
>> +		.formats = SNDRV_PCM_FMTBIT_S32_LE |
>> +			   SNDRV_PCM_FMTBIT_S24_LE |
>> +			   SNDRV_PCM_FMTBIT_S16_LE,
>>   	},
>>   	.ops = &tegra30_i2s_dai_ops,
>>   	.symmetric_rates = 1,
>> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
