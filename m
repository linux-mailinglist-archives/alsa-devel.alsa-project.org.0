Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0F0B6130
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Sep 2019 12:13:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02CBB166D;
	Wed, 18 Sep 2019 12:12:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02CBB166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568801624;
	bh=l5rE5R1jIclUIVw9ZT49wJJ0TlBgTk49hsExmVwQWxs=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qSAi5ikqtctFgOrJuNnQSjEvOjmhOSoBf1uQhuC5zDbKEdEhrQozZ9uWu77QPF8gv
	 SyEI2MhOHBMWm6DVmWcDkDpgKzyqoTrzzEO35cjiZKpAvV1GLIMHdErbUx9zPkffzH
	 Fdm/b2/adW0rUeUFJfpzXnK2cAU/mH/sKrikOH2s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14E1CF80146;
	Wed, 18 Sep 2019 12:12:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76C04F80527; Wed, 18 Sep 2019 12:12:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A3E1F80146
 for <alsa-devel@alsa-project.org>; Wed, 18 Sep 2019 12:12:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A3E1F80146
Received: from [78.40.148.177] (helo=localhost)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1iAWwn-0005w1-H4; Wed, 18 Sep 2019 11:12:29 +0100
MIME-Version: 1.0
Date: Wed, 18 Sep 2019 11:12:28 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <b8ccfbd1-3c0f-3cba-40da-a9b0ced54e86@nvidia.com>
References: <20190917181233.534-1-ben.dooks@codethink.co.uk>
 <20190917181233.534-4-ben.dooks@codethink.co.uk>
 <b8ccfbd1-3c0f-3cba-40da-a9b0ced54e86@nvidia.com>
Message-ID: <f7f01665b51a3758dcaf1c82f44a86d9@codethink.co.uk>
X-Sender: ben.dooks@codethink.co.uk
User-Agent: Roundcube Webmail/1.3.10
Cc: linux-kernel@lists.codethink.co.uk, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Edward Cragg <edward.cragg@codethink.co.uk>, linux-tegra@vger.kernel.org,
 linux-tegra-owner@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 3/8] ASoC: tegra: i2s: Add support for more
 than 2 channels
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



On 2019-09-18 09:50, Jon Hunter wrote:
> On 17/09/2019 19:12, Ben Dooks wrote:
>> From: Edward Cragg <edward.cragg@codethink.co.uk>
>> 
>> The CIF configuration and clock setting is currently hard coded for 2
>> channels. Since the hardware is capable of supporting 1-8 channels add
>> support for reading the channel count from the supplied parameters to
>> allow for better TDM support. It seems the original implementation of 
>> this
>> driver was fixed at 2 channels for simplicity, and not implementing 
>> TDM.
>> 
>> Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
>> [ben.dooks@codethink.co.uk: added is_tdm and channel nr check]
>> ---
>>  sound/soc/tegra/tegra30_i2s.c | 21 +++++++++++++--------
>>  sound/soc/tegra/tegra30_i2s.h |  1 +
>>  2 files changed, 14 insertions(+), 8 deletions(-)
>> 
>> diff --git a/sound/soc/tegra/tegra30_i2s.c 
>> b/sound/soc/tegra/tegra30_i2s.c
>> index b5372839f672..40bcc05a9dbb 100644
>> --- a/sound/soc/tegra/tegra30_i2s.c
>> +++ b/sound/soc/tegra/tegra30_i2s.c
>> @@ -86,14 +86,17 @@ static int tegra30_i2s_set_fmt(struct snd_soc_dai 
>> *dai,
>>  		return -EINVAL;
>>  	}
>> 
>> +	i2s->is_tdm = false;
>>  	mask |= TEGRA30_I2S_CTRL_FRAME_FORMAT_MASK |
>>  		TEGRA30_I2S_CTRL_LRCK_MASK;
>>  	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
>>  	case SND_SOC_DAIFMT_DSP_A:
>> +		i2s->is_tdm = true;
>>  		val |= TEGRA30_I2S_CTRL_FRAME_FORMAT_FSYNC;
>>  		val |= TEGRA30_I2S_CTRL_LRCK_L_LOW;
>>  		break;
>>  	case SND_SOC_DAIFMT_DSP_B:
>> +		i2s->is_tdm = true;
>>  		val |= TEGRA30_I2S_CTRL_FRAME_FORMAT_FSYNC;
>>  		val |= TEGRA30_I2S_CTRL_LRCK_R_LOW;
>>  		break;
>> @@ -127,10 +130,13 @@ static int tegra30_i2s_hw_params(struct 
>> snd_pcm_substream *substream,
>>  	struct device *dev = dai->dev;
>>  	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
>>  	unsigned int mask, val, reg;
>> -	int ret, sample_size, srate, i2sclock, bitcnt, audio_bits;
>> +	int ret, sample_size, srate, i2sclock, bitcnt, audio_bits, channels;
>>  	struct tegra30_ahub_cif_conf cif_conf;
>> 
>> -	if (params_channels(params) != 2)
>> +	channels = params_channels(params);
>> +	if (channels > 8)
>> +		return -EINVAL;
>> +	if (channels != 2 && !i2s->is_tdm)
> 
> I don't think that this additional test is really necessary. I would
> just drop this 'is_tdm' variable.

I needed it elsewhere so would prefer to leave this here.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
