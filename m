Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DED138CDE8
	for <lists+alsa-devel@lfdr.de>; Fri, 21 May 2021 21:06:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DD6916C7;
	Fri, 21 May 2021 21:05:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DD6916C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621624001;
	bh=WQx5Qg/Y31mAj/FftWmzRaIwclhb+nhNLLyaUoOmjEE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S/hG3WPKcQ8uxUaXf1+zIsLjNlE7BWlSM+CxmmQAHcHvjPdunWjPlluw3CBXIdUbX
	 r9HYVgIg+851INyzWlcvcqYqxTW+99kDgBiqT5oNvFI2+8owPQL6Hk6yZ2swIjGtaw
	 qwc2vPsOwYkFwlqZIgApmEoS13hUxfphaN0Fi5Iw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED176F80246;
	Fri, 21 May 2021 21:05:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10F08F801DB; Fri, 21 May 2021 21:05:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B95ADF80153
 for <alsa-devel@alsa-project.org>; Fri, 21 May 2021 21:05:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B95ADF80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Iinte1WY"
Received: by mail-lj1-x233.google.com with SMTP id c15so25150435ljr.7
 for <alsa-devel@alsa-project.org>; Fri, 21 May 2021 12:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5rXDLmOOY/qSGp+4/BG3/ERcmaSrLXzLVRQbRh1Bof4=;
 b=Iinte1WYv+mJKOdGjSmu1wAzV/uceOGjBrX4H2sebN3JiARBntSPTMAHVrcDVPpAQp
 jz9KEcfpxCv18RlXtL2X0lG4j+inS1LhOGWn0Adl5RwVASs0C4zUYbSOlc9UEsPkH6cV
 MgJG6StwkHZqYZ/y1Pqaeas/wqYIQ6x3Sbiz1wAMW/9p1sGMxD6KFmVLg8auupjChmwO
 DH2w5bEM2q9Y8toYsG+0RssnIGzBVb0Xup5EjymImjcnuDEvxDzS9uND6JN0DgSfZ+rb
 4p3Ptsx3xHgDlTFHcZnM4Bn4CziKtPhaoGj5QHcOeYSQaoX8F2V6ZKQ7e1gHQbiVYdkU
 7qnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5rXDLmOOY/qSGp+4/BG3/ERcmaSrLXzLVRQbRh1Bof4=;
 b=Mj6gVj0m79Z0ZLLXlYaHWZDGkdwXYlO0Gzd0ISEsMX7zRFoWQejoTJ4d9Ur3deaYu6
 OCUte2qcRw+qmTZ5HxVRF402+tfwcC9MVkJ8MNJRnZUq7+rFRmCRBKB6+Yepn66L6nrg
 Nrt3HU5Ygym+MGf7maAH8E88y1ZIfuFLfGuKYP8H5VyRMJhfGrCvNhyawJzgE2I90W8o
 wwscb2PylvH038CWe5tV8Yw58GaUOGU/PqbI7Nx8Dw6rvHKxj74y2+SJRtiubM9NXQWn
 +TQX7DbTFMHnkbOyD2OpTcwsPR+z/l8nH7t3RQNYp5bLFaG3BdqVVTzAvio19kWNAwse
 m4Mw==
X-Gm-Message-State: AOAM532zEOaS1LqL6JDWIRD9gRZJk39jzr082R0hxyFD2gRa7AmPhQcf
 Yd+tI52Q3pbsGwDmLZkyeKk=
X-Google-Smtp-Source: ABdhPJzqBR4tyZBvYMg2y90SGey5VhPlTflMxVegwl/zh4qJJFXi3w3Y06MiWY85A62Z8DGrI10vnA==
X-Received: by 2002:a2e:bf10:: with SMTP id c16mr8088169ljr.289.1621623901789; 
 Fri, 21 May 2021 12:05:01 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-100.dynamic.spd-mgts.ru.
 [109.252.193.100])
 by smtp.googlemail.com with ESMTPSA id f20sm704832lfh.19.2021.05.21.12.05.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 12:05:01 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] ASoC: tegra: Unify ASoC machine drivers
To: Jon Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Ion Agorria <ion@agorria.com>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>
References: <20210520175054.28308-1-digetx@gmail.com>
 <20210520175054.28308-3-digetx@gmail.com>
 <32171079-ed4e-1147-2272-5f11bc480c6a@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <91e53907-d87d-aeeb-4644-3926d4311daa@gmail.com>
Date: Fri, 21 May 2021 22:05:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <32171079-ed4e-1147-2272-5f11bc480c6a@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

21.05.2021 16:12, Jon Hunter пишет:
> 
> On 20/05/2021 18:50, Dmitry Osipenko wrote:
>> Squash all machine drivers into a single-universal one. This reduces
>> code duplication, eases addition of a new drivers and upgrades older
>> code to a modern Linux kernel APIs.
>>
>> Suggested-by: Jonathan Hunter <jonathanh@nvidia.com>
>> Co-developed-by: Ion Agorria <ion@agorria.com>
>> Signed-off-by: Ion Agorria <ion@agorria.com>
>> Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
>> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  sound/soc/tegra/Kconfig              |  12 +
>>  sound/soc/tegra/Makefile             |  18 +-
>>  sound/soc/tegra/tegra20_ac97.c       |   1 -
>>  sound/soc/tegra/tegra_alc5632.c      | 260 ----------
>>  sound/soc/tegra/tegra_asoc_machine.c | 732 +++++++++++++++++++++++++++
>>  sound/soc/tegra/tegra_asoc_machine.h |  45 ++
>>  sound/soc/tegra/tegra_max98090.c     | 277 ----------
>>  sound/soc/tegra/tegra_rt5640.c       | 223 --------
>>  sound/soc/tegra/tegra_rt5677.c       | 325 ------------
>>  sound/soc/tegra/tegra_sgtl5000.c     | 212 --------
>>  sound/soc/tegra/tegra_wm8753.c       | 186 -------
>>  sound/soc/tegra/tegra_wm8903.c       | 358 +++----------
>>  sound/soc/tegra/tegra_wm9712.c       | 167 ------
>>  sound/soc/tegra/trimslice.c          | 173 -------
>>  14 files changed, 862 insertions(+), 2127 deletions(-)
>>  delete mode 100644 sound/soc/tegra/tegra_alc5632.c
>>  create mode 100644 sound/soc/tegra/tegra_asoc_machine.c
>>  create mode 100644 sound/soc/tegra/tegra_asoc_machine.h
>>  delete mode 100644 sound/soc/tegra/tegra_max98090.c
>>  delete mode 100644 sound/soc/tegra/tegra_rt5640.c
>>  delete mode 100644 sound/soc/tegra/tegra_rt5677.c
>>  delete mode 100644 sound/soc/tegra/tegra_sgtl5000.c
>>  delete mode 100644 sound/soc/tegra/tegra_wm8753.c
>>  delete mode 100644 sound/soc/tegra/tegra_wm9712.c
>>  delete mode 100644 sound/soc/tegra/trimslice.c
> 
> ...
> 
>> +static unsigned int tegra_max98090_mclk_rate(unsigned int srate)
>> +{
> 
> Minor comment, but I wonder if there is a better name for the above
> function? This function is using a fixed rate as opposed to scaling it
> with sample rate which can be common and not really specific to the
> max98090 codec.

I'll rename it in v3, thank you for suggestion.

>> +	unsigned int mclk;
>> +
>> +	switch (srate) {
>> +	case 8000:
>> +	case 16000:
>> +	case 24000:
>> +	case 32000:
>> +	case 48000:
>> +	case 64000:
>> +	case 96000:
>> +		mclk = 12288000;
>> +		break;
>> +	case 11025:
>> +	case 22050:
>> +	case 44100:
>> +	case 88200:
>> +		mclk = 11289600;
>> +		break;
>> +	default:
>> +		mclk = 12000000;
>> +		break;
>> +	}
>> +
>> +	return mclk;
>> +}
>> +
>> +unsigned int tegra_asoc_machine_mclk_rate(unsigned int srate)
>> +{
>> +	unsigned int mclk;
>> +
>> +	switch (srate) {
>> +	case 64000:
>> +	case 88200:
>> +	case 96000:
>> +		mclk = 128 * srate;
>> +		break;
>> +	default:
>> +		mclk = 256 * srate;
>> +		break;
>> +	}
>> +	/* FIXME: Codec only requires >= 3MHz if OSR==0 */
>> +	while (mclk < 6000000)
>> +		mclk *= 2;
> 
> So this appears to be specific to the wm8903 codec or at least this is
> where it came from. And given that the switch statement is not complete
> in terms of the sample rates (ie. only has a subset), I am wondering if
> set should keep this specific to the wm8903 codec?

The RT5631 codec of Asus Transformers will re-use this function.

IIUC, the default switch-case works properly for all rates below 64KHz,
at least I haven't had any problems with it. Could you please clarify
why you are saying that the switch statement appears to be incomplete?

>> +
>> +	return mclk;
>> +}
>> +EXPORT_SYMBOL_GPL(tegra_asoc_machine_mclk_rate);> +
>> +static int tegra_machine_hw_params(struct snd_pcm_substream *substream,
>> +				   struct snd_pcm_hw_params *params)
>> +{
>> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
>> +	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
>> +	struct snd_soc_card *card = rtd->card;
>> +	struct tegra_machine *machine = snd_soc_card_get_drvdata(card);
>> +	unsigned int srate = params_rate(params);
>> +	unsigned int mclk = machine->asoc->mclk_rate(srate);
>> +	const unsigned int clk_id = 0;
>> +	int err;
>> +
>> +	err = tegra_asoc_utils_set_rate(&machine->util_data, srate, mclk);
>> +	if (err < 0) {
>> +		dev_err(card->dev, "Can't configure clocks: %d\n", err);
>> +		return err;
>> +	}
>> +
>> +	err = snd_soc_dai_set_sysclk(codec_dai, clk_id, mclk, SND_SOC_CLOCK_IN);
> 
> Looks like clk_id is always 0. Most likely all the clock ids passed are
> 0 by default but I wonder if we should not assume this in case something
> changes in the future?

Initially I had the same thought and even made the clk_id customizable,
but then decided that for now it will be cleaner to hardcode ID to 0
since it will be very easy to customize the ID if will become necessary.

None of the currently supported devices use a different ID. I see now
that the older Galaxy Tab 10 may need to use ID=1, so perhaps indeed it
won't hurt to make it customizable already. I'll reconsider it for v3.

Thank you for the review.
