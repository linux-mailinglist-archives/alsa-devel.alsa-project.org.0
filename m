Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F568127E5A
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Dec 2019 15:45:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4FF41688;
	Fri, 20 Dec 2019 15:44:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4FF41688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576853140;
	bh=H3o1/B2auDueC4WQUB/T4y0/vYWqT53EyM8wCsbnFJU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B6nAR6FyhZBSzHvIuz8NoiWQOOcA6Ey4+6nd2JvnHmyCBUjwoR/ObsP9KRaIPoZGA
	 LPBX//h43zBsWETAMeEjOjRiHg80WHMqFBGGJ/tQ4dQv4tbHgR50b2CpUkGwI9xs2K
	 fn2FSbpS475XD4q9/UexahMxSnzdoZX413i7axvw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9AF5F8022C;
	Fri, 20 Dec 2019 15:43:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85DFAF8015A; Fri, 20 Dec 2019 15:43:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, PRX_BODY_13, SPF_HELO_NONE, SPF_PASS,
 SURBL_BLOCKED, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F2F6F8014C
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 15:43:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F2F6F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bGj3Ww69"
Received: by mail-lf1-x144.google.com with SMTP id r14so7232298lfm.5
 for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2019 06:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=6k72TLN+pLIIeeSkjI4NKk5loE2WNvVfpxugh9CopsE=;
 b=bGj3Ww69Ul0GqW3j0YkzudS980EnOquNYNYquSFLTocxO6WkGunz+bmKQMcIIeVjRc
 du3ToSpCvBzFaqDan8xx76y6WciojiUpUxY/n94s3CDkvq8OpbX/9rxjlR33COe4XGlY
 iEyOQIXjhAUPXg2zFxlSsyTMadMphN1d5uqNnuVnGwwj1E08LQ1fFoc9hZCpU522CxjT
 DXBWa5sc/MCAGAnPONufs+JpY5ip4LqJcKcp9Z/VCYhEYxWneKJZikzgKkaWnOsR1b4V
 X9ceWj/SuPFb0NMvbwDJmNWfYo2yBU1Sp0yG6kP0fUidrctxiIQJFToeSCME0pbOZx8U
 ft3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=6k72TLN+pLIIeeSkjI4NKk5loE2WNvVfpxugh9CopsE=;
 b=UAfJ5K1Ndgmd2Qh/dxyZOunEhgqBYZSDR+wRJXtQ+O92WMelDhFQ523A7v2w/XevZ+
 kXIyJdRrmt8c7oPaeIXK8JXPt7TX6x+K4ysFoh8Pf2WSEBUjJH+xXhF4qoFm5inB+kuW
 fntCjjGBzblD6zG7aTb/eo8zo/UVijsVACY1oN2BPSzy4zUzwPyaw0pkw+SCElvyDcUg
 epWnyMBrbSGAFFmZESj7jw0AA/lTYt1UmElDINyupk9NVxw8VS9s5cvx4ufOlpDZ5If3
 mCTzzqAFqSzf+bpk4GfHE3a+Zm8zaWMQyPqLORCuUBBI8p02r+gChPY63Ocj91iTWBDw
 0sKw==
X-Gm-Message-State: APjAAAXk6SzbtddDr9vyEUKktT9WAMajis5W0AoIbh5vRfkf7fPFFagf
 T/fyCF3H/00uNT2ZBWX+cvo=
X-Google-Smtp-Source: APXvYqw83ZbkFAjld68ekdtCnkjKnHVjmQ7bzj1yCclrzF3Q3J0sPLl3eacIIgxtf1OHVx9qtDPjTA==
X-Received: by 2002:a19:2389:: with SMTP id j131mr8858926lfj.86.1576853018899; 
 Fri, 20 Dec 2019 06:43:38 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id r9sm4976118lfc.72.2019.12.20.06.43.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Dec 2019 06:43:37 -0800 (PST)
To: Jon Hunter <jonathanh@nvidia.com>, Ben Dooks <ben.dooks@codethink.co.uk>, 
 linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20191018154833.7560-1-ben.dooks@codethink.co.uk>
 <20191018154833.7560-3-ben.dooks@codethink.co.uk>
 <d2110a1f-c1de-e2c5-a1ff-5eb4c5d3e1da@gmail.com>
 <b4e2ec44-bc89-b5ca-cfa7-a6d5c45a9c94@codethink.co.uk>
 <a11ba33e-5ffb-c5c6-04f5-0e031877c55f@gmail.com>
 <621fa27d-9259-2949-9cf5-d2eda5cb0677@gmail.com>
 <a0f027d9-e9e0-d76c-1e40-002fdc37eb5f@nvidia.com>
 <d43d518d-9336-a011-2a69-3f9331f6d0b4@codethink.co.uk>
 <aba4edd6-0ea5-5e95-c5a0-9e749587c763@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <449bdc3c-bf82-7cc4-6704-440dd100ca3a@gmail.com>
Date: Fri, 20 Dec 2019 17:43:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <aba4edd6-0ea5-5e95-c5a0-9e749587c763@nvidia.com>
Content-Type: multipart/mixed; boundary="------------C61C59C1B0D8396DF51DA79F"
Content-Language: en-US
Cc: linux-kernel@lists.codethink.co.uk,
 Edward Cragg <edward.cragg@codethink.co.uk>
Subject: Re: [alsa-devel] [PATCH v5 2/7] ASoC: tegra: Allow 24bit and 32bit
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This is a multi-part message in MIME format.
--------------C61C59C1B0D8396DF51DA79F
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

20.12.2019 16:57, Jon Hunter пишет:
> 
> On 20/12/2019 11:38, Ben Dooks wrote:
>> On 20/12/2019 11:30, Jon Hunter wrote:
>>>
>>> On 25/11/2019 17:28, Dmitry Osipenko wrote:
>>>> 25.11.2019 20:22, Dmitry Osipenko пишет:
>>>>> 25.11.2019 13:37, Ben Dooks пишет:
>>>>>> On 23/11/2019 21:09, Dmitry Osipenko wrote:
>>>>>>> 18.10.2019 18:48, Ben Dooks пишет:
>>>>>>>> From: Edward Cragg <edward.cragg@codethink.co.uk>
>>>>>>>>
>>>>>>>> The tegra3 audio can support 24 and 32 bit sample sizes so add the
>>>>>>>> option to the tegra30_i2s_hw_params to configure the S24_LE or
>>>>>>>> S32_LE
>>>>>>>> formats when requested.
>>>>>>>>
>>>>>>>> Signed-off-by: Edward Cragg <edward.cragg@codethink.co.uk>
>>>>>>>> [ben.dooks@codethink.co.uk: fixup merge of 24 and 32bit]
>>>>>>>> [ben.dooks@codethink.co.uk: add pm calls around ytdm config]
>>>>>>>> [ben.dooks@codethink.co.uk: drop debug printing to dev_dbg]
>>>>>>>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>>>>>>>> ---
>>>>>>>> squash 5aeca5a055fd ASoC: tegra: i2s: pm_runtime_get_sync() is
>>>>>>>> needed
>>>>>>>> in tdm code
>>>>>>>>
>>>>>>>> ASoC: tegra: i2s: pm_runtime_get_sync() is needed in tdm code
>>>>>>>> ---
>>>>>>>>    sound/soc/tegra/tegra30_i2s.c | 25 ++++++++++++++++++++-----
>>>>>>>>    1 file changed, 20 insertions(+), 5 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/sound/soc/tegra/tegra30_i2s.c
>>>>>>>> b/sound/soc/tegra/tegra30_i2s.c
>>>>>>>> index 73f0dddeaef3..063f34c882af 100644
>>>>>>>> --- a/sound/soc/tegra/tegra30_i2s.c
>>>>>>>> +++ b/sound/soc/tegra/tegra30_i2s.c
>>>>>>>> @@ -127,7 +127,7 @@ static int tegra30_i2s_hw_params(struct
>>>>>>>> snd_pcm_substream *substream,
>>>>>>>>        struct device *dev = dai->dev;
>>>>>>>>        struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
>>>>>>>>        unsigned int mask, val, reg;
>>>>>>>> -    int ret, sample_size, srate, i2sclock, bitcnt;
>>>>>>>> +    int ret, sample_size, srate, i2sclock, bitcnt, audio_bits;
>>>>>>>>        struct tegra30_ahub_cif_conf cif_conf;
>>>>>>>>          if (params_channels(params) != 2)
>>>>>>>> @@ -137,8 +137,19 @@ static int tegra30_i2s_hw_params(struct
>>>>>>>> snd_pcm_substream *substream,
>>>>>>>>        switch (params_format(params)) {
>>>>>>>>        case SNDRV_PCM_FORMAT_S16_LE:
>>>>>>>>            val = TEGRA30_I2S_CTRL_BIT_SIZE_16;
>>>>>>>> +        audio_bits = TEGRA30_AUDIOCIF_BITS_16;
>>>>>>>>            sample_size = 16;
>>>>>>>>            break;
>>>>>>>> +    case SNDRV_PCM_FORMAT_S24_LE:
>>>>>>>> +        val = TEGRA30_I2S_CTRL_BIT_SIZE_24;
>>>>>>>> +        audio_bits = TEGRA30_AUDIOCIF_BITS_24;
>>>>>>>> +        sample_size = 24;
>>>>>>>> +        break;
>>>>>>>> +    case SNDRV_PCM_FORMAT_S32_LE:
>>>>>>>> +        val = TEGRA30_I2S_CTRL_BIT_SIZE_32;
>>>>>>>> +        audio_bits = TEGRA30_AUDIOCIF_BITS_32;
>>>>>>>> +        sample_size = 32;
>>>>>>>> +        break;
>>>>>>>>        default:
>>>>>>>>            return -EINVAL;
>>>>>>>>        }
>>>>>>>> @@ -170,8 +181,8 @@ static int tegra30_i2s_hw_params(struct
>>>>>>>> snd_pcm_substream *substream,
>>>>>>>>        cif_conf.threshold = 0;
>>>>>>>>        cif_conf.audio_channels = 2;
>>>>>>>>        cif_conf.client_channels = 2;
>>>>>>>> -    cif_conf.audio_bits = TEGRA30_AUDIOCIF_BITS_16;
>>>>>>>> -    cif_conf.client_bits = TEGRA30_AUDIOCIF_BITS_16;
>>>>>>>> +    cif_conf.audio_bits = audio_bits;
>>>>>>>> +    cif_conf.client_bits = audio_bits;
>>>>>>>>        cif_conf.expand = 0;
>>>>>>>>        cif_conf.stereo_conv = 0;
>>>>>>>>        cif_conf.replicate = 0;
>>>>>>>> @@ -306,14 +317,18 @@ static const struct snd_soc_dai_driver
>>>>>>>> tegra30_i2s_dai_template = {
>>>>>>>>            .channels_min = 2,
>>>>>>>>            .channels_max = 2,
>>>>>>>>            .rates = SNDRV_PCM_RATE_8000_96000,
>>>>>>>> -        .formats = SNDRV_PCM_FMTBIT_S16_LE,
>>>>>>>> +        .formats = SNDRV_PCM_FMTBIT_S32_LE |
>>>>>>>> +               SNDRV_PCM_FMTBIT_S24_LE |
>>>>>>>> +               SNDRV_PCM_FMTBIT_S16_LE,
>>>>>>>>        },
>>>>>>>>        .capture = {
>>>>>>>>            .stream_name = "Capture",
>>>>>>>>            .channels_min = 2,
>>>>>>>>            .channels_max = 2,
>>>>>>>>            .rates = SNDRV_PCM_RATE_8000_96000,
>>>>>>>> -        .formats = SNDRV_PCM_FMTBIT_S16_LE,
>>>>>>>> +        .formats = SNDRV_PCM_FMTBIT_S32_LE |
>>>>>>>> +               SNDRV_PCM_FMTBIT_S24_LE |
>>>>>>>> +               SNDRV_PCM_FMTBIT_S16_LE,
>>>>>>>>        },
>>>>>>>>        .ops = &tegra30_i2s_dai_ops,
>>>>>>>>        .symmetric_rates = 1,
>>>>>>>>
>>>>>>>
>>>>>>> Hello,
>>>>>>>
>>>>>>> This patch breaks audio on Tegra30. I don't see errors anywhere, but
>>>>>>> there is no audio and reverting this patch helps. Please fix it.
>>>>>>
>>>>>> What is the failure mode? I can try and take a look at this some time
>>>>>> this week, but I am not sure if I have any boards with an actual
>>>>>> useful
>>>>>> audio output?
>>>>>
>>>>> The failure mode is that there no sound. I also noticed that video
>>>>> playback stutters a lot if movie file has audio track, seems something
>>>>> times out during of the audio playback. For now I don't have any
>>>>> more info.
>>>>>
>>>>
>>>> Oh, I didn't say how to reproduce it.. for example simply playing
>>>> big_buck_bunny_720p_h264.mov in MPV has the audio problem.
>>>>
>>>> https://download.blender.org/peach/bigbuckbunny_movies/big_buck_bunny_720p_h264.mov
>>>>
>>>
>>> Given that the audio drivers uses regmap, it could be good to dump the
>>> I2S/AHUB registers while the clip if playing with and without this patch
>>> to see the differences. I am curious if the audio is now being played as
>>> 24 or 32-bit instead of 16-bit now these are available.
>>>
>>> You could also dump the hw_params to see the format while playing as
>>> well ...
>>>
>>> $ /proc/asound/<scard-name>/pcm0p/sub0/hw_params
>>
>> I suppose it is also possible that the codec isn't properly doing >16
>> bits and the fact we now offer 24 and 32 could be an issue. I've not
>> got anything with an audio output on it that would be easy to test.
> 
> I thought I had tested on a Jetson TK1 (Tegra124) but it was sometime
> back. However, admittedly I may have only done simple 16-bit testing
> with speaker-test.
> 
> We do verify that all soundcards are detected and registered as expected
> during daily testing, but at the moment we don't have anything that
> verifies actual playback.

Please take a look at the attached logs.

--------------C61C59C1B0D8396DF51DA79F
Content-Type: text/plain; charset=UTF-8;
 name="works.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="works.txt"

V29ya3MKLS0tLS0KCiMgY2F0IC9zeXMvY2xhc3MvaTJjLWRldi9pMmMtMi9uYW1lCjcwMDBk
MDAwLmkyYwoKLi4uCglpMmNANzAwMGQwMDAgewoJCWNsb2NrLWZyZXF1ZW5jeSA9IDwxMDAw
MDA+OwoJCXN0YXR1cyA9ICJva2F5IjsKCgkJcnQ1NjQwOiBydDU2NDBAMWMgewoJCQljb21w
YXRpYmxlID0gInJlYWx0ZWsscnQ1NjQwIjsKCQkJcmVnID0gPDB4MWM+OwoKCQkJaW50ZXJy
dXB0LXBhcmVudCA9IDwmZ3Bpbz47CgkJCWludGVycnVwdHMgPSA8VEVHUkFfR1BJTyhXLCAz
KSBJUlFfVFlQRV9FREdFX0ZBTExJTkc+OwoKCQkJcmVhbHRlayxkbWljMS1kYXRhLXBpbiA9
IDwxPjsKCQkJcmVhbHRlayxkbWljMi1kYXRhLXBpbiA9IDwwPjsKCQkJcmVhbHRlayxpbjEt
ZGlmZmVyZW50aWFsOwoJCX07Ci4uLgoKIyBjYXQgL3Byb2MvYXNvdW5kL2NhcmQwL3BjbTBw
L3N1YjAvaHdfcGFyYW1zCmFjY2VzczogTU1BUF9JTlRFUkxFQVZFRApmb3JtYXQ6IFMxNl9M
RQpzdWJmb3JtYXQ6IFNURApjaGFubmVsczogMgpyYXRlOiA0ODAwMCAoNDgwMDAvMSkKcGVy
aW9kX3NpemU6IDEwMjQKYnVmZmVyX3NpemU6IDgxOTIKCiMgdHJhY2UtY21kIHJlY29yZCAt
ZSByZWdtYXA6KgojIHRyYWNlLWNtZCByZXBvcnQKCkNQVSAwIGlzIGVtcHR5CkNQVSAxIGlz
IGVtcHR5CmNwdXM9NAogICAgICAgICAgICAgbXB2LTMwOCAgIFswMDJdICAgMTcxLjI2ODEw
NDogcmVnbWFwX2NhY2hlX29ubHk6ICAgIDcwMDgwMDAwLmFodWIgZmxhZz0wCiAgICAgICAg
ICAgICBtcHYtMzA4ICAgWzAwMl0gICAxNzEuMjY4MTE2OiByZWdtYXBfY2FjaGVfb25seTog
ICAgNzAwODAwMDAuYWh1YiBmbGFnPTAKICAgICAgICAgICAgIG1wdi0zMDggICBbMDAyXSAg
IDE3MS4yNjgxMzE6IHJlZ21hcF9jYWNoZV9vbmx5OiAgICA3MDA4MDQwMC5pMnMgZmxhZz0w
CiAgICAgICAgICAgICBtcHYtMzA4ICAgWzAwMl0gICAxNzEuMjcyNTQ5OiByZWdtYXBfcmVn
X3JlYWRfY2FjaGU6IDItMDAxYyByZWc9NjQgdmFsPTAKICAgICAgICAgICAgIG1wdi0zMDgg
ICBbMDAyXSAgIDE3MS4yNzI1NTY6IHJlZ21hcF9yZWdfcmVhZF9jYWNoZTogMi0wMDFjIHJl
Zz04MCB2YWw9MAogICAgICAgICAgICAgbXB2LTMwOCAgIFswMDJdICAgMTcxLjI3MjU2NDog
cmVnbWFwX3JlZ19yZWFkX2NhY2hlOiAyLTAwMWMgcmVnPTcwIHZhbD04MDAwCiAgICAgICAg
ICAgICBtcHYtMzA4ICAgWzAwMl0gICAxNzEuMjcyNTY3OiByZWdtYXBfcmVnX3JlYWRfY2Fj
aGU6IDItMDAxYyByZWc9NzAgdmFsPTgwMDAKICAgICAgICAgICAgIG1wdi0zMDggICBbMDAy
XSAgIDE3MS4yNzI1Njk6IHJlZ21hcF9yZWdfcmVhZF9jYWNoZTogMi0wMDFjIHJlZz03MyB2
YWw9MTExNAogICAgICAgICAgICAgbXB2LTMwOCAgIFswMDJdICAgMTcxLjI3MjU3MjogcmVn
bWFwX3JlZ193cml0ZTogICAgIDItMDAxYyByZWc9NzMgdmFsPTExNAogICAgICAgICAgICAg
bXB2LTMwOCAgIFswMDJdICAgMTcxLjI3MjU4MTogcmVnbWFwX2h3X3dyaXRlX3N0YXJ0OiAy
LTAwMWMgcmVnPTczIGNvdW50PTEKICAgICAgICAgICAgIG1wdi0zMDggICBbMDAyXSAgIDE3
MS4yNzMzMzI6IHJlZ21hcF9od193cml0ZV9kb25lOiAyLTAwMWMgcmVnPTczIGNvdW50PTEK
ICAgICAgICAgICAgIG1wdi0zMDggICBbMDAyXSAgIDE3MS4yNzMzNzk6IHJlZ21hcF9yZWdf
cmVhZF9jYWNoZTogNzAwODA0MDAuaTJzIHJlZz0wIHZhbD00MDAKICAgICAgICAgICAgIG1w
di0zMDggICBbMDAyXSAgIDE3MS4yNzMzODI6IHJlZ21hcF9yZWdfd3JpdGU6ICAgICA3MDA4
MDQwMC5pMnMgcmVnPTAgdmFsPTQwMwogICAgICAgICAgICAgbXB2LTMwOCAgIFswMDJdICAg
MTcxLjI3MzM5NTogcmVnbWFwX3JlZ193cml0ZTogICAgIDcwMDgwNDAwLmkycyByZWc9NCB2
YWw9MWYKICAgICAgICAgICAgIG1wdi0zMDggICBbMDAyXSAgIDE3MS4yNzMzOTg6IHJlZ21h
cF9yZWdfd3JpdGU6ICAgICA3MDA4MDQwMC5pMnMgcmVnPTE0IHZhbD0xMDEzMzA0CiAgICAg
ICAgICAgICBtcHYtMzA4ICAgWzAwMl0gICAxNzEuMjczNDAxOiByZWdtYXBfcmVnX3dyaXRl
OiAgICAgNzAwODA0MDAuaTJzIHJlZz04IHZhbD0xMDAwMQogICAga3dvcmtlci91ODoyLTE0
NSAgIFswMDNdICAgMTcxLjI3Mzk5MjogcmVnbWFwX3JlZ19yZWFkX2NhY2hlOiAyLTAwMWMg
cmVnPTYzIHZhbD0wCiAgICBrd29ya2VyL3U4OjItMTQ1ICAgWzAwM10gICAxNzEuMjczOTk5
OiByZWdtYXBfcmVnX3dyaXRlOiAgICAgMi0wMDFjIHJlZz02MyB2YWw9YTgxMAogICAga3dv
cmtlci91ODoyLTE0NSAgIFswMDNdICAgMTcxLjI3NDAwNjogcmVnbWFwX2h3X3dyaXRlX3N0
YXJ0OiAyLTAwMWMgcmVnPTYzIGNvdW50PTEKICAgIGt3b3JrZXIvdTg6Mi0xNDUgICBbMDAz
XSAgIDE3MS4yNzQ0Nzg6IHJlZ21hcF9od193cml0ZV9kb25lOiAyLTAwMWMgcmVnPTYzIGNv
dW50PTEKICAgIGt3b3JrZXIvdTg6Mi0xNDUgICBbMDAzXSAgIDE3MS4yODYwNjc6IHJlZ21h
cF9yZWdfcmVhZF9jYWNoZTogMi0wMDFjIHJlZz02MyB2YWw9YTgxMAogICAga3dvcmtlci91
ODoyLTE0NSAgIFswMDNdICAgMTcxLjI4NjA3NjogcmVnbWFwX3JlZ193cml0ZTogICAgIDIt
MDAxYyByZWc9NjMgdmFsPWU4MTgKICAgIGt3b3JrZXIvdTg6Mi0xNDUgICBbMDAzXSAgIDE3
MS4yODYwODM6IHJlZ21hcF9od193cml0ZV9zdGFydDogMi0wMDFjIHJlZz02MyBjb3VudD0x
CiAgICBrd29ya2VyL3U4OjItMTQ1ICAgWzAwM10gICAxNzEuMjg2NTY4OiByZWdtYXBfaHdf
d3JpdGVfZG9uZTogMi0wMDFjIHJlZz02MyBjb3VudD0xCiAgICBrd29ya2VyL3U4OjItMTQ1
ICAgWzAwM10gICAxNzEuMjg2NTc1OiByZWdtYXBfcmVnX3JlYWRfY2FjaGU6IDItMDAxYyBy
ZWc9ZmEgdmFsPTNmMDEKICAgIGt3b3JrZXIvdTg6Mi0xNDUgICBbMDAzXSAgIDE3MS4yODY1
Nzc6IHJlZ21hcF9yZWdfcmVhZF9jYWNoZTogMi0wMDFjIHJlZz05MyB2YWw9MzAzMAogICAg
ICAgICAgICAgbXB2LTMwOCAgIFswMDJdICAgMTcxLjI4NjY0MzogcmVnbWFwX3JlZ19yZWFk
X2NhY2hlOiAyLTAwMWMgcmVnPTYxIHZhbD0wCiAgICAgICAgICAgICBtcHYtMzA4ICAgWzAw
Ml0gICAxNzEuMjg2NjQ3OiByZWdtYXBfcmVnX3dyaXRlOiAgICAgMi0wMDFjIHJlZz02MSB2
YWw9OTgwMAogICAgICAgICAgICAgbXB2LTMwOCAgIFswMDJdICAgMTcxLjI4NjY1MDogcmVn
bWFwX2h3X3dyaXRlX3N0YXJ0OiAyLTAwMWMgcmVnPTYxIGNvdW50PTEKICAgICAgICAgICAg
IG1wdi0zMDggICBbMDAyXSAgIDE3MS4yODczNDU6IHJlZ21hcF9od193cml0ZV9kb25lOiAy
LTAwMWMgcmVnPTYxIGNvdW50PTEKICAgICAgICAgICAgIG1wdi0zMDggICBbMDAyXSAgIDE3
MS4yODczNzk6IHJlZ21hcF9yZWdfcmVhZF9jYWNoZTogMi0wMDFjIHJlZz02MyB2YWw9ZTgx
OAogICAgICAgICAgICAgbXB2LTMwOCAgIFswMDJdICAgMTcxLjI4NzM4MTogcmVnbWFwX3Jl
Z193cml0ZTogICAgIDItMDAxYyByZWc9NjMgdmFsPWU4ZDgKICAgICAgICAgICAgIG1wdi0z
MDggICBbMDAyXSAgIDE3MS4yODczODQ6IHJlZ21hcF9od193cml0ZV9zdGFydDogMi0wMDFj
IHJlZz02MyBjb3VudD0xCiAgICAgICAgICAgICBtcHYtMzA4ICAgWzAwMl0gICAxNzEuMjg3
ODQ1OiByZWdtYXBfaHdfd3JpdGVfZG9uZTogMi0wMDFjIHJlZz02MyBjb3VudD0xCiAgICAg
ICAgICAgICBtcHYtMzA4ICAgWzAwMl0gICAxNzEuMjg3ODc1OiByZWdtYXBfaHdfcmVhZF9z
dGFydDogMi0wMDFjIHJlZz02YSBjb3VudD0xCiAgICAgICAgICAgICBtcHYtMzA4ICAgWzAw
Ml0gICAxNzEuMjg5MDIxOiByZWdtYXBfaHdfcmVhZF9kb25lOiAgMi0wMDFjIHJlZz02YSBj
b3VudD0xCiAgICAgICAgICAgICBtcHYtMzA4ICAgWzAwMl0gICAxNzEuMjg5MDI1OiByZWdt
YXBfcmVnX3JlYWQ6ICAgICAgMi0wMDFjIHJlZz02YSB2YWw9MjMKICAgICAgICAgICAgIG1w
di0zMDggICBbMDAyXSAgIDE3MS4yODkwMjc6IHJlZ21hcF9yZWdfd3JpdGU6ICAgICAyLTAw
MWMgcmVnPTZhIHZhbD0yNAogICAgICAgICAgICAgbXB2LTMwOCAgIFswMDJdICAgMTcxLjI4
OTAyOTogcmVnbWFwX2h3X3dyaXRlX3N0YXJ0OiAyLTAwMWMgcmVnPTZhIGNvdW50PTEKICAg
ICAgICAgICAgIG1wdi0zMDggICBbMDAyXSAgIDE3MS4yODk1NjE6IHJlZ21hcF9od193cml0
ZV9kb25lOiAyLTAwMWMgcmVnPTZhIGNvdW50PTEKICAgICAgICAgICAgIG1wdi0zMDggICBb
MDAyXSAgIDE3MS4yODk1NjU6IHJlZ21hcF9od19yZWFkX3N0YXJ0OiAyLTAwMWMgcmVnPTZj
IGNvdW50PTEKICAgICAgICAgICAgIG1wdi0zMDggICBbMDAyXSAgIDE3MS4yOTAxNzQ6IHJl
Z21hcF9od19yZWFkX2RvbmU6ICAyLTAwMWMgcmVnPTZjIGNvdW50PTEKICAgICAgICAgICAg
IG1wdi0zMDggICBbMDAyXSAgIDE3MS4yOTAxNzc6IHJlZ21hcF9yZWdfcmVhZDogICAgICAy
LTAwMWMgcmVnPTEyNCB2YWw9NDIwCiAgICAgICAgICAgICBtcHYtMzA4ICAgWzAwMl0gICAx
NzEuMjkwMTgwOiByZWdtYXBfcmVnX3dyaXRlOiAgICAgMi0wMDFjIHJlZz0xMjQgdmFsPTIy
MAogICAgICAgICAgICAgbXB2LTMwOCAgIFswMDJdICAgMTcxLjI5MDE4NTogcmVnbWFwX2h3
X3JlYWRfc3RhcnQ6IDItMDAxYyByZWc9NmEgY291bnQ9MQogICAgICAgICAgICAgbXB2LTMw
OCAgIFswMDJdICAgMTcxLjI5MDgwMDogcmVnbWFwX2h3X3JlYWRfZG9uZTogIDItMDAxYyBy
ZWc9NmEgY291bnQ9MQogICAgICAgICAgICAgbXB2LTMwOCAgIFswMDJdICAgMTcxLjI5MDgw
NDogcmVnbWFwX3JlZ19yZWFkOiAgICAgIDItMDAxYyByZWc9NmEgdmFsPTI0CiAgICAgICAg
ICAgICBtcHYtMzA4ICAgWzAwMl0gICAxNzEuMjkwODA3OiByZWdtYXBfaHdfd3JpdGVfc3Rh
cnQ6IDItMDAxYyByZWc9NmMgY291bnQ9MQogICAgICAgICAgICAgbXB2LTMwOCAgIFswMDJd
ICAgMTcxLjI5MTMwMDogcmVnbWFwX2h3X3dyaXRlX2RvbmU6IDItMDAxYyByZWc9NmMgY291
bnQ9MQogICAgICAgICAgICAgbXB2LTMwOCAgIFswMDJdICAgMTcxLjI5MTMzMzogcmVnbWFw
X3JlZ19yZWFkX2NhY2hlOiAyLTAwMWMgcmVnPThmIHZhbD0xMTAwCiAgICAgICAgICAgICBt
cHYtMzA4ICAgWzAwMl0gICAxNzEuMjkxMzM1OiByZWdtYXBfcmVnX3dyaXRlOiAgICAgMi0w
MDFjIHJlZz04ZiB2YWw9MzEwMAogICAgICAgICAgICAgbXB2LTMwOCAgIFswMDJdICAgMTcx
LjI5MTMzOTogcmVnbWFwX2h3X3dyaXRlX3N0YXJ0OiAyLTAwMWMgcmVnPThmIGNvdW50PTEK
ICAgICAgICAgICAgIG1wdi0zMDggICBbMDAyXSAgIDE3MS4yOTE4MDI6IHJlZ21hcF9od193
cml0ZV9kb25lOiAyLTAwMWMgcmVnPThmIGNvdW50PTEKICAgICAgICAgICAgIG1wdi0zMDgg
ICBbMDAyXSAgIDE3MS4yOTE4MzA6IHJlZ21hcF9yZWdfcmVhZF9jYWNoZTogMi0wMDFjIHJl
Zz04ZSB2YWw9NAogICAgICAgICAgICAgbXB2LTMwOCAgIFswMDJdICAgMTcxLjI5MTgzMzog
cmVnbWFwX3JlZ193cml0ZTogICAgIDItMDAxYyByZWc9OGUgdmFsPTkKICAgICAgICAgICAg
IG1wdi0zMDggICBbMDAyXSAgIDE3MS4yOTE4Mzg6IHJlZ21hcF9od193cml0ZV9zdGFydDog
Mi0wMDFjIHJlZz04ZSBjb3VudD0xCiAgICAgICAgICAgICBtcHYtMzA4ICAgWzAwMl0gICAx
NzEuMjkyNDMzOiByZWdtYXBfaHdfd3JpdGVfZG9uZTogMi0wMDFjIHJlZz04ZSBjb3VudD0x
CiAgICAgICAgICAgICBtcHYtMzA4ICAgWzAwMl0gICAxNzEuMjkyNDYxOiByZWdtYXBfcmVn
X3dyaXRlOiAgICAgMi0wMDFjIHJlZz0xNzcgdmFsPTlmMDAKICAgICAgICAgICAgIG1wdi0z
MDggICBbMDAyXSAgIDE3MS4yOTI0NjY6IHJlZ21hcF9od19yZWFkX3N0YXJ0OiAyLTAwMWMg
cmVnPTZhIGNvdW50PTEKICAgICAgICAgICAgIG1wdi0zMDggICBbMDAyXSAgIDE3MS4yOTMy
NzQ6IHJlZ21hcF9od19yZWFkX2RvbmU6ICAyLTAwMWMgcmVnPTZhIGNvdW50PTEKICAgICAg
ICAgICAgIG1wdi0zMDggICBbMDAyXSAgIDE3MS4yOTMyNzg6IHJlZ21hcF9yZWdfcmVhZDog
ICAgICAyLTAwMWMgcmVnPTZhIHZhbD0yNAogICAgICAgICAgICAgbXB2LTMwOCAgIFswMDJd
ICAgMTcxLjI5MzI4MTogcmVnbWFwX3JlZ193cml0ZTogICAgIDItMDAxYyByZWc9NmEgdmFs
PTc3CiAgICAgICAgICAgICBtcHYtMzA4ICAgWzAwMl0gICAxNzEuMjkzMjg0OiByZWdtYXBf
aHdfd3JpdGVfc3RhcnQ6IDItMDAxYyByZWc9NmEgY291bnQ9MQogICAgICAgICAgICAgbXB2
LTMwOCAgIFswMDJdICAgMTcxLjI5Mzg5NDogcmVnbWFwX2h3X3dyaXRlX2RvbmU6IDItMDAx
YyByZWc9NmEgY291bnQ9MQogICAgICAgICAgICAgbXB2LTMwOCAgIFswMDJdICAgMTcxLjI5
Mzg5NzogcmVnbWFwX2h3X3dyaXRlX3N0YXJ0OiAyLTAwMWMgcmVnPTZjIGNvdW50PTEKICAg
ICAgICAgICAgIG1wdi0zMDggICBbMDAyXSAgIDE3MS4yOTQ0ODQ6IHJlZ21hcF9od193cml0
ZV9kb25lOiAyLTAwMWMgcmVnPTZjIGNvdW50PTEKICAgICAgICAgICAgIG1wdi0zMDggICBb
MDAyXSAgIDE3MS4yOTQ1MTA6IHJlZ21hcF9yZWdfcmVhZF9jYWNoZTogMi0wMDFjIHJlZz02
MyB2YWw9ZThkOAogICAgICAgICAgICAgbXB2LTMwOCAgIFswMDJdICAgMTcxLjI5NDUxMzog
cmVnbWFwX3JlZ193cml0ZTogICAgIDItMDAxYyByZWc9NjMgdmFsPWE4ZDAKICAgICAgICAg
ICAgIG1wdi0zMDggICBbMDAyXSAgIDE3MS4yOTQ1MTY6IHJlZ21hcF9od193cml0ZV9zdGFy
dDogMi0wMDFjIHJlZz02MyBjb3VudD0xCiAgICAgICAgICAgICBtcHYtMzA4ICAgWzAwMl0g
ICAxNzEuMjk0OTc2OiByZWdtYXBfaHdfd3JpdGVfZG9uZTogMi0wMDFjIHJlZz02MyBjb3Vu
dD0xCiAgICAgICAgICAgICBtcHYtMzA4ICAgWzAwMl0gICAxNzEuMjk1MDAxOiByZWdtYXBf
cmVnX3JlYWRfY2FjaGU6IDItMDAxYyByZWc9NjMgdmFsPWE4ZDAKICAgICAgICAgICAgIG1w
di0zMDggICBbMDAyXSAgIDE3MS4yOTUwMDQ6IHJlZ21hcF9yZWdfd3JpdGU6ICAgICAyLTAw
MWMgcmVnPTYzIHZhbD1hOGYwCiAgICAgICAgICAgICBtcHYtMzA4ICAgWzAwMl0gICAxNzEu
Mjk1MDA2OiByZWdtYXBfaHdfd3JpdGVfc3RhcnQ6IDItMDAxYyByZWc9NjMgY291bnQ9MQog
ICAgICAgICAgICAgbXB2LTMwOCAgIFswMDJdICAgMTcxLjI5NTY4MDogcmVnbWFwX2h3X3dy
aXRlX2RvbmU6IDItMDAxYyByZWc9NjMgY291bnQ9MQogICAgICAgICAgICAgbXB2LTMwOCAg
IFswMDJdICAgMTcxLjMwNjEwMDogcmVnbWFwX3JlZ19yZWFkX2NhY2hlOiAyLTAwMWMgcmVn
PTYzIHZhbD1hOGYwCiAgICAgICAgICAgICBtcHYtMzA4ICAgWzAwMl0gICAxNzEuMzA2MTA4
OiByZWdtYXBfcmVnX3dyaXRlOiAgICAgMi0wMDFjIHJlZz02MyB2YWw9ZThmOAogICAgICAg
ICAgICAgbXB2LTMwOCAgIFswMDJdICAgMTcxLjMwNjExNDogcmVnbWFwX2h3X3dyaXRlX3N0
YXJ0OiAyLTAwMWMgcmVnPTYzIGNvdW50PTEKICAgICAgICAgICAgIG1wdi0zMDggICBbMDAy
XSAgIDE3MS4zMDY4ODU6IHJlZ21hcF9od193cml0ZV9kb25lOiAyLTAwMWMgcmVnPTYzIGNv
dW50PTEKICAgICAgICAgICAgIG1wdi0zMDggICBbMDAyXSAgIDE3MS4zMDY5NTQ6IHJlZ21h
cF9yZWdfcmVhZF9jYWNoZTogMi0wMDFjIHJlZz04ZiB2YWw9MzEwMAogICAgICAgICAgICAg
bXB2LTMwOCAgIFswMDJdICAgMTcxLjMwNjk1NzogcmVnbWFwX3JlZ193cml0ZTogICAgIDIt
MDAxYyByZWc9OGYgdmFsPTExNDAKICAgICAgICAgICAgIG1wdi0zMDggICBbMDAyXSAgIDE3
MS4zMDY5NjE6IHJlZ21hcF9od193cml0ZV9zdGFydDogMi0wMDFjIHJlZz04ZiBjb3VudD0x
CiAgICAgICAgICAgICBtcHYtMzA4ICAgWzAwMl0gICAxNzEuMzA3NTMyOiByZWdtYXBfaHdf
d3JpdGVfZG9uZTogMi0wMDFjIHJlZz04ZiBjb3VudD0xCiAgICAgICAgICAgICBtcHYtMzA4
ICAgWzAwMl0gICAxNzEuMzA3NTU5OiByZWdtYXBfcmVnX3JlYWRfY2FjaGU6IDItMDAxYyBy
ZWc9OTEgdmFsPWMwMAogICAgICAgICAgICAgbXB2LTMwOCAgIFswMDJdICAgMTcxLjMwNzU2
MTogcmVnbWFwX3JlZ193cml0ZTogICAgIDItMDAxYyByZWc9OTEgdmFsPWUwMAogICAgICAg
ICAgICAgbXB2LTMwOCAgIFswMDJdICAgMTcxLjMwNzU2NDogcmVnbWFwX2h3X3dyaXRlX3N0
YXJ0OiAyLTAwMWMgcmVnPTkxIGNvdW50PTEKICAgICAgICAgICAgIG1wdi0zMDggICBbMDAy
XSAgIDE3MS4zMDgwNjg6IHJlZ21hcF9od193cml0ZV9kb25lOiAyLTAwMWMgcmVnPTkxIGNv
dW50PTEKICAgICAgICAgICAgIG1wdi0zMDggICBbMDAyXSAgIDE3MS4zMDgwOTM6IHJlZ21h
cF9yZWdfcmVhZF9jYWNoZTogMi0wMDFjIHJlZz05MCB2YWw9NjQ2CiAgICAgICAgICAgICBt
cHYtMzA4ICAgWzAwMl0gICAxNzEuMzA4MDk2OiByZWdtYXBfcmVnX3dyaXRlOiAgICAgMi0w
MDFjIHJlZz05MCB2YWw9NzM3CiAgICAgICAgICAgICBtcHYtMzA4ICAgWzAwMl0gICAxNzEu
MzA4MDk5OiByZWdtYXBfaHdfd3JpdGVfc3RhcnQ6IDItMDAxYyByZWc9OTAgY291bnQ9MQog
ICAgICAgICAgICAgbXB2LTMwOCAgIFswMDJdICAgMTcxLjMwODU3MzogcmVnbWFwX2h3X3dy
aXRlX2RvbmU6IDItMDAxYyByZWc9OTAgY291bnQ9MQogICAgICAgICAgICAgbXB2LTMwOCAg
IFswMDJdICAgMTcxLjMwODYwMDogcmVnbWFwX3JlZ193cml0ZTogICAgIDItMDAxYyByZWc9
MTM3IHZhbD0xYzAwCiAgICAgICAgICAgICBtcHYtMzA4ICAgWzAwMl0gICAxNzEuMzA4NjA3
OiByZWdtYXBfaHdfcmVhZF9zdGFydDogMi0wMDFjIHJlZz02YSBjb3VudD0xCiAgICAgICAg
ICAgICBtcHYtMzA4ICAgWzAwMl0gICAxNzEuMzA5MjA0OiByZWdtYXBfaHdfcmVhZF9kb25l
OiAgMi0wMDFjIHJlZz02YSBjb3VudD0xCiAgICAgICAgICAgICBtcHYtMzA4ICAgWzAwMl0g
ICAxNzEuMzA5MjEyOiByZWdtYXBfcmVnX3JlYWQ6ICAgICAgMi0wMDFjIHJlZz02YSB2YWw9
NzcKICAgICAgICAgICAgIG1wdi0zMDggICBbMDAyXSAgIDE3MS4zMDkyMTU6IHJlZ21hcF9y
ZWdfd3JpdGU6ICAgICAyLTAwMWMgcmVnPTZhIHZhbD0zNwogICAgICAgICAgICAgbXB2LTMw
OCAgIFswMDJdICAgMTcxLjMwOTIxNzogcmVnbWFwX2h3X3dyaXRlX3N0YXJ0OiAyLTAwMWMg
cmVnPTZhIGNvdW50PTEKICAgICAgICAgICAgIG1wdi0zMDggICBbMDAyXSAgIDE3MS4zMDk5
OTQ6IHJlZ21hcF9od193cml0ZV9kb25lOiAyLTAwMWMgcmVnPTZhIGNvdW50PTEKICAgICAg
ICAgICAgIG1wdi0zMDggICBbMDAyXSAgIDE3MS4zMDk5OTk6IHJlZ21hcF9od193cml0ZV9z
dGFydDogMi0wMDFjIHJlZz02YyBjb3VudD0xCiAgICAgICAgICAgICBtcHYtMzA4ICAgWzAw
Ml0gICAxNzEuMzEwNzE0OiByZWdtYXBfaHdfd3JpdGVfZG9uZTogMi0wMDFjIHJlZz02YyBj
b3VudD0xCiAgICAgICAgICAgICBtcHYtMzA4ICAgWzAwMl0gICAxNzEuMzEwNzQ3OiByZWdt
YXBfcmVnX3JlYWRfY2FjaGU6IDItMDAxYyByZWc9OGUgdmFsPTkKICAgICAgICAgICAgIG1w
di0zMDggICBbMDAyXSAgIDE3MS4zMTA3NTA6IHJlZ21hcF9yZWdfd3JpdGU6ICAgICAyLTAw
MWMgcmVnPThlIHZhbD01CiAgICAgICAgICAgICBtcHYtMzA4ICAgWzAwMl0gICAxNzEuMzEw
NzU1OiByZWdtYXBfaHdfd3JpdGVfc3RhcnQ6IDItMDAxYyByZWc9OGUgY291bnQ9MQogICAg
ICAgICAgICAgbXB2LTMwOCAgIFswMDJdICAgMTcxLjMxMTMzMTogcmVnbWFwX2h3X3dyaXRl
X2RvbmU6IDItMDAxYyByZWc9OGUgY291bnQ9MQogICAgICAgICAgICAgbXB2LTMwOCAgIFsw
MDJdICAgMTcxLjMxMTM2MTogcmVnbWFwX2h3X3JlYWRfc3RhcnQ6IDItMDAxYyByZWc9NmEg
Y291bnQ9MQogICAgICAgICAgICAgbXB2LTMwOCAgIFswMDJdICAgMTcxLjMxMjM4NDogcmVn
bWFwX2h3X3JlYWRfZG9uZTogIDItMDAxYyByZWc9NmEgY291bnQ9MQogICAgICAgICAgICAg
bXB2LTMwOCAgIFswMDJdICAgMTcxLjMxMjM4ODogcmVnbWFwX3JlZ19yZWFkOiAgICAgIDIt
MDAxYyByZWc9NmEgdmFsPTM3CiAgICAgICAgICAgICBtcHYtMzA4ICAgWzAwMl0gICAxNzEu
MzEyMzkxOiByZWdtYXBfcmVnX3dyaXRlOiAgICAgMi0wMDFjIHJlZz02YSB2YWw9MjQKICAg
ICAgICAgICAgIG1wdi0zMDggICBbMDAyXSAgIDE3MS4zMTIzOTQ6IHJlZ21hcF9od193cml0
ZV9zdGFydDogMi0wMDFjIHJlZz02YSBjb3VudD0xCiAgICAgICAgICAgICBtcHYtMzA4ICAg
WzAwMl0gICAxNzEuMzEyODkxOiByZWdtYXBfaHdfd3JpdGVfZG9uZTogMi0wMDFjIHJlZz02
YSBjb3VudD0xCiAgICAgICAgICAgICBtcHYtMzA4ICAgWzAwMl0gICAxNzEuMzEyODk3OiBy
ZWdtYXBfaHdfcmVhZF9zdGFydDogMi0wMDFjIHJlZz02YyBjb3VudD0xCiAgICAgICAgICAg
ICBtcHYtMzA4ICAgWzAwMl0gICAxNzEuMzEzNjU3OiByZWdtYXBfaHdfcmVhZF9kb25lOiAg
Mi0wMDFjIHJlZz02YyBjb3VudD0xCiAgICAgICAgICAgICBtcHYtMzA4ICAgWzAwMl0gICAx
NzEuMzEzNjYxOiByZWdtYXBfcmVnX3JlYWQ6ICAgICAgMi0wMDFjIHJlZz0xMjQgdmFsPTIy
MAogICAgICAgICAgICAgbXB2LTMwOCAgIFswMDJdICAgMTcxLjMxMzY2NDogcmVnbWFwX3Jl
Z193cml0ZTogICAgIDItMDAxYyByZWc9MTI0IHZhbD00MjAKICAgICAgICAgICAgIG1wdi0z
MDggICBbMDAyXSAgIDE3MS4zMTM2Njc6IHJlZ21hcF9od19yZWFkX3N0YXJ0OiAyLTAwMWMg
cmVnPTZhIGNvdW50PTEKICAgICAgICAgICAgIG1wdi0zMDggICBbMDAyXSAgIDE3MS4zMTQ5
Nzc6IHJlZ21hcF9od19yZWFkX2RvbmU6ICAyLTAwMWMgcmVnPTZhIGNvdW50PTEKICAgICAg
ICAgICAgIG1wdi0zMDggICBbMDAyXSAgIDE3MS4zMTQ5ODQ6IHJlZ21hcF9yZWdfcmVhZDog
ICAgICAyLTAwMWMgcmVnPTZhIHZhbD0yNAogICAgICAgICAgICAgbXB2LTMwOCAgIFswMDJd
ICAgMTcxLjMxNDk5MDogcmVnbWFwX2h3X3dyaXRlX3N0YXJ0OiAyLTAwMWMgcmVnPTZjIGNv
dW50PTEKICAgICAgICAgICAgIG1wdi0zMDggICBbMDAyXSAgIDE3MS4zMTU0Nzk6IHJlZ21h
cF9od193cml0ZV9kb25lOiAyLTAwMWMgcmVnPTZjIGNvdW50PTEKICAgICAgICAgICAgIG1w
di0zMDggICBbMDAyXSAgIDE3MS4zMTU1MTk6IHJlZ21hcF9yZWdfcmVhZF9jYWNoZTogMi0w
MDFjIHJlZz0yIHZhbD1jYmNiCiAgICAgICAgICAgICBtcHYtMzA4ICAgWzAwMl0gICAxNzEu
MzE1NTIyOiByZWdtYXBfcmVnX3dyaXRlOiAgICAgMi0wMDFjIHJlZz0yIHZhbD00YjRiCiAg
ICAgICAgICAgICBtcHYtMzA4ICAgWzAwMl0gICAxNzEuMzE1NTI1OiByZWdtYXBfaHdfd3Jp
dGVfc3RhcnQ6IDItMDAxYyByZWc9MiBjb3VudD0xCiAgICAgICAgICAgICBtcHYtMzA4ICAg
WzAwMl0gICAxNzEuMzE2MDAyOiByZWdtYXBfaHdfd3JpdGVfZG9uZTogMi0wMDFjIHJlZz0y
IGNvdW50PTEKICAgICAgICAgIG1wdi9hby0zMTggICBbMDAzXSAgIDE3MS43NDQ0MDc6IHJl
Z21hcF9yZWdfcmVhZF9jYWNoZTogNzAwODAwMDAuYWh1YiByZWc9MCB2YWw9NzA3NzcKICAg
ICAgICAgIG1wdi9hby0zMTggICBbMDAzXSAgIDE3MS43NDQ0MjQ6IHJlZ21hcF9yZWdfd3Jp
dGU6ICAgICA3MDA4MDAwMC5haHViIHJlZz0wIHZhbD04MDA3MDc3NwogICAgICAgICAgbXB2
L2FvLTMxOCAgIFswMDNdICAgMTcxLjc0NDQzMzogcmVnbWFwX3JlZ19yZWFkX2NhY2hlOiA3
MDA4MDQwMC5pMnMgcmVnPTAgdmFsPTQwMwogICAgICAgICAgbXB2L2FvLTMxOCAgIFswMDNd
ICAgMTcxLjc0NDQzNTogcmVnbWFwX3JlZ193cml0ZTogICAgIDcwMDgwNDAwLmkycyByZWc9
MCB2YWw9ODAwMDA0MDMKICAgICAgICAgICAgIG1wdi0zMDggICBbMDAyXSAgIDE3My43NTUx
Nzg6IHJlZ21hcF9yZWdfcmVhZF9jYWNoZTogNzAwODAwMDAuYWh1YiByZWc9MCB2YWw9ODAw
NzA3NzcKICAgICAgICAgICAgIG1wdi0zMDggICBbMDAyXSAgIDE3My43NTUxODg6IHJlZ21h
cF9yZWdfd3JpdGU6ICAgICA3MDA4MDAwMC5haHViIHJlZz0wIHZhbD03MDc3NwogICAgICAg
ICAgICAgbXB2LTMwOCAgIFswMDJdICAgMTczLjc1NTE5NjogcmVnbWFwX3JlZ19yZWFkX2Nh
Y2hlOiA3MDA4MDQwMC5pMnMgcmVnPTAgdmFsPTgwMDAwNDAzCiAgICAgICAgICAgICBtcHYt
MzA4ICAgWzAwMl0gICAxNzMuNzU1MTk4OiByZWdtYXBfcmVnX3dyaXRlOiAgICAgNzAwODA0
MDAuaTJzIHJlZz0wIHZhbD00MDMK
--------------C61C59C1B0D8396DF51DA79F
Content-Type: text/plain; charset=UTF-8;
 name="broken.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="broken.txt"

QnJva2VuCi0tLS0tLQoKIyBjYXQgL3N5cy9jbGFzcy9pMmMtZGV2L2kyYy0yL25hbWUKNzAw
MGQwMDAuaTJjCgouLi4KCWkyY0A3MDAwZDAwMCB7CgkJY2xvY2stZnJlcXVlbmN5ID0gPDEw
MDAwMD47CgkJc3RhdHVzID0gIm9rYXkiOwoKCQlydDU2NDA6IHJ0NTY0MEAxYyB7CgkJCWNv
bXBhdGlibGUgPSAicmVhbHRlayxydDU2NDAiOwoJCQlyZWcgPSA8MHgxYz47CgoJCQlpbnRl
cnJ1cHQtcGFyZW50ID0gPCZncGlvPjsKCQkJaW50ZXJydXB0cyA9IDxURUdSQV9HUElPKFcs
IDMpIElSUV9UWVBFX0VER0VfRkFMTElORz47CgoJCQlyZWFsdGVrLGRtaWMxLWRhdGEtcGlu
ID0gPDE+OwoJCQlyZWFsdGVrLGRtaWMyLWRhdGEtcGluID0gPDA+OwoJCQlyZWFsdGVrLGlu
MS1kaWZmZXJlbnRpYWw7CgkJfTsKLi4uCgojIGNhdCAvcHJvYy9hc291bmQvY2FyZDAvcGNt
MHAvc3ViMC9od19wYXJhbXMKYWNjZXNzOiBNTUFQX0lOVEVSTEVBVkVECmZvcm1hdDogUzI0
X0xFCnN1YmZvcm1hdDogU1RECmNoYW5uZWxzOiAyCnJhdGU6IDQ4MDAwICg0ODAwMC8xKQpw
ZXJpb2Rfc2l6ZTogNTEyCmJ1ZmZlcl9zaXplOiA0MDk2CgojIHRyYWNlLWNtZCByZWNvcmQg
LWUgcmVnbWFwOioKIyB0cmFjZS1jbWQgcmVwb3J0CgpDUFUgMCBpcyBlbXB0eQpDUFUgMSBp
cyBlbXB0eQpjcHVzPTQKICAgICAgICAgICAgIG1wdi0yODEgICBbMDAyXSAgICA0MC4yMjc1
NDE6IHJlZ21hcF9jYWNoZV9vbmx5OiAgICA3MDA4MDAwMC5haHViIGZsYWc9MAogICAgICAg
ICAgICAgbXB2LTI4MSAgIFswMDJdICAgIDQwLjIyNzU1NDogcmVnbWFwX2NhY2hlX29ubHk6
ICAgIDcwMDgwMDAwLmFodWIgZmxhZz0wCiAgICAgICAgICAgICBtcHYtMjgxICAgWzAwMl0g
ICAgNDAuMjI3NTcyOiByZWdtYXBfY2FjaGVfb25seTogICAgNzAwODA0MDAuaTJzIGZsYWc9
MAogICAgICAgICAgICAgbXB2LTI4MSAgIFswMDJdICAgIDQwLjIzNjkwNTogcmVnbWFwX3Jl
Z19yZWFkX2NhY2hlOiAyLTAwMWMgcmVnPTY0IHZhbD0wCiAgICAgICAgICAgICBtcHYtMjgx
ICAgWzAwMl0gICAgNDAuMjM2OTIxOiByZWdtYXBfcmVnX3JlYWRfY2FjaGU6IDItMDAxYyBy
ZWc9ODAgdmFsPTAKICAgICAgICAgICAgIG1wdi0yODEgICBbMDAyXSAgICA0MC4yMzY5MzE6
IHJlZ21hcF9yZWdfcmVhZF9jYWNoZTogMi0wMDFjIHJlZz03MCB2YWw9ODAwMAogICAgICAg
ICAgICAgbXB2LTI4MSAgIFswMDJdICAgIDQwLjIzNjkzNTogcmVnbWFwX3JlZ19yZWFkX2Nh
Y2hlOiAyLTAwMWMgcmVnPTcwIHZhbD04MDAwCiAgICAgICAgICAgICBtcHYtMjgxICAgWzAw
Ml0gICAgNDAuMjM2OTM5OiByZWdtYXBfcmVnX3dyaXRlOiAgICAgMi0wMDFjIHJlZz03MCB2
YWw9ODAwOAogICAgICAgICAgICAgbXB2LTI4MSAgIFswMDJdICAgIDQwLjIzNjk1MDogcmVn
bWFwX2h3X3dyaXRlX3N0YXJ0OiAyLTAwMWMgcmVnPTcwIGNvdW50PTEKICAgICAgICAgICAg
IG1wdi0yODEgICBbMDAyXSAgICA0MC4yMzc3NzY6IHJlZ21hcF9od193cml0ZV9kb25lOiAy
LTAwMWMgcmVnPTcwIGNvdW50PTEKICAgICAgICAgICAgIG1wdi0yODEgICBbMDAyXSAgICA0
MC4yMzc4Mjg6IHJlZ21hcF9yZWdfcmVhZF9jYWNoZTogMi0wMDFjIHJlZz03MyB2YWw9MTEx
NAogICAgICAgICAgICAgbXB2LTI4MSAgIFswMDJdICAgIDQwLjIzNzgzMTogcmVnbWFwX3Jl
Z193cml0ZTogICAgIDItMDAxYyByZWc9NzMgdmFsPTgxMTQKICAgICAgICAgICAgIG1wdi0y
ODEgICBbMDAyXSAgICA0MC4yMzc4MzY6IHJlZ21hcF9od193cml0ZV9zdGFydDogMi0wMDFj
IHJlZz03MyBjb3VudD0xCiAgICAgICAgICAgICBtcHYtMjgxICAgWzAwMl0gICAgNDAuMjQx
NzIzOiByZWdtYXBfaHdfd3JpdGVfZG9uZTogMi0wMDFjIHJlZz03MyBjb3VudD0xCiAgICAg
ICAgICAgICBtcHYtMjgxICAgWzAwMl0gICAgNDAuMjQxNzk0OiByZWdtYXBfcmVnX3JlYWRf
Y2FjaGU6IDcwMDgwNDAwLmkycyByZWc9MCB2YWw9NDAwCiAgICAgICAgICAgICBtcHYtMjgx
ICAgWzAwMl0gICAgNDAuMjQxNzk4OiByZWdtYXBfcmVnX3dyaXRlOiAgICAgNzAwODA0MDAu
aTJzIHJlZz0wIHZhbD00MDUKICAgICAgICAgICAgIG1wdi0yODEgICBbMDAyXSAgICA0MC4y
NDE4MTc6IHJlZ21hcF9yZWdfd3JpdGU6ICAgICA3MDA4MDQwMC5pMnMgcmVnPTQgdmFsPTJm
CiAgICAgICAgICAgICBtcHYtMjgxICAgWzAwMl0gICAgNDAuMjQxODIwOiByZWdtYXBfcmVn
X3dyaXRlOiAgICAgNzAwODA0MDAuaTJzIHJlZz0xNCB2YWw9MTAxNTUwNAogICAgICAgICAg
ICAgbXB2LTI4MSAgIFswMDJdICAgIDQwLjI0MTgyMzogcmVnbWFwX3JlZ193cml0ZTogICAg
IDcwMDgwNDAwLmkycyByZWc9OCB2YWw9MTAwMDEKICAgIGt3b3JrZXIvdTg6MS0zNiAgICBb
MDAzXSAgICA0MC4yNDI5ODc6IHJlZ21hcF9yZWdfcmVhZF9jYWNoZTogMi0wMDFjIHJlZz02
MyB2YWw9MAogICAga3dvcmtlci91ODoxLTM2ICAgIFswMDNdICAgIDQwLjI0Mjk5MjogcmVn
bWFwX3JlZ193cml0ZTogICAgIDItMDAxYyByZWc9NjMgdmFsPWE4MTAKICAgIGt3b3JrZXIv
dTg6MS0zNiAgICBbMDAzXSAgICA0MC4yNDMwMDI6IHJlZ21hcF9od193cml0ZV9zdGFydDog
Mi0wMDFjIHJlZz02MyBjb3VudD0xCiAgICBrd29ya2VyL3U4OjEtMzYgICAgWzAwM10gICAg
NDAuMjQzNTE5OiByZWdtYXBfaHdfd3JpdGVfZG9uZTogMi0wMDFjIHJlZz02MyBjb3VudD0x
CiAgICBrd29ya2VyL3U4OjEtMzYgICAgWzAwM10gICAgNDAuMjU2OTE1OiByZWdtYXBfcmVn
X3JlYWRfY2FjaGU6IDItMDAxYyByZWc9NjMgdmFsPWE4MTAKICAgIGt3b3JrZXIvdTg6MS0z
NiAgICBbMDAzXSAgICA0MC4yNTY5MjQ6IHJlZ21hcF9yZWdfd3JpdGU6ICAgICAyLTAwMWMg
cmVnPTYzIHZhbD1lODE4CiAgICBrd29ya2VyL3U4OjEtMzYgICAgWzAwM10gICAgNDAuMjU2
OTMzOiByZWdtYXBfaHdfd3JpdGVfc3RhcnQ6IDItMDAxYyByZWc9NjMgY291bnQ9MQogICAg
a3dvcmtlci91ODoxLTM2ICAgIFswMDNdICAgIDQwLjI1NzU5MDogcmVnbWFwX2h3X3dyaXRl
X2RvbmU6IDItMDAxYyByZWc9NjMgY291bnQ9MQogICAga3dvcmtlci91ODoxLTM2ICAgIFsw
MDNdICAgIDQwLjI1NzU5NzogcmVnbWFwX3JlZ19yZWFkX2NhY2hlOiAyLTAwMWMgcmVnPWZh
IHZhbD0zZjAxCiAgICBrd29ya2VyL3U4OjEtMzYgICAgWzAwM10gICAgNDAuMjU3NjAwOiBy
ZWdtYXBfcmVnX3JlYWRfY2FjaGU6IDItMDAxYyByZWc9OTMgdmFsPTMwMzAKICAgICAgICAg
ICAgIG1wdi0yODEgICBbMDAyXSAgICA0MC4yNTc2NzA6IHJlZ21hcF9yZWdfcmVhZF9jYWNo
ZTogMi0wMDFjIHJlZz02MSB2YWw9MAogICAgICAgICAgICAgbXB2LTI4MSAgIFswMDJdICAg
IDQwLjI1NzY3NDogcmVnbWFwX3JlZ193cml0ZTogICAgIDItMDAxYyByZWc9NjEgdmFsPTk4
MDAKICAgICAgICAgICAgIG1wdi0yODEgICBbMDAyXSAgICA0MC4yNTc2Nzg6IHJlZ21hcF9o
d193cml0ZV9zdGFydDogMi0wMDFjIHJlZz02MSBjb3VudD0xCiAgICAgICAgICAgICBtcHYt
MjgxICAgWzAwMl0gICAgNDAuMjU4NDA5OiByZWdtYXBfaHdfd3JpdGVfZG9uZTogMi0wMDFj
IHJlZz02MSBjb3VudD0xCiAgICAgICAgICAgICBtcHYtMjgxICAgWzAwMl0gICAgNDAuMjU4
NDQ4OiByZWdtYXBfcmVnX3JlYWRfY2FjaGU6IDItMDAxYyByZWc9NjMgdmFsPWU4MTgKICAg
ICAgICAgICAgIG1wdi0yODEgICBbMDAyXSAgICA0MC4yNTg0NTE6IHJlZ21hcF9yZWdfd3Jp
dGU6ICAgICAyLTAwMWMgcmVnPTYzIHZhbD1lOGQ4CiAgICAgICAgICAgICBtcHYtMjgxICAg
WzAwMl0gICAgNDAuMjU4NDU0OiByZWdtYXBfaHdfd3JpdGVfc3RhcnQ6IDItMDAxYyByZWc9
NjMgY291bnQ9MQogICAgICAgICAgICAgbXB2LTI4MSAgIFswMDJdICAgIDQwLjI1OTcwMTog
cmVnbWFwX2h3X3dyaXRlX2RvbmU6IDItMDAxYyByZWc9NjMgY291bnQ9MQogICAgICAgICAg
ICAgbXB2LTI4MSAgIFswMDJdICAgIDQwLjI1OTc1MTogcmVnbWFwX2h3X3JlYWRfc3RhcnQ6
IDItMDAxYyByZWc9NmEgY291bnQ9MQogICAgICAgICAgICAgbXB2LTI4MSAgIFswMDJdICAg
IDQwLjI2MDM1NzogcmVnbWFwX2h3X3JlYWRfZG9uZTogIDItMDAxYyByZWc9NmEgY291bnQ9
MQogICAgICAgICAgICAgbXB2LTI4MSAgIFswMDJdICAgIDQwLjI2MDM2MTogcmVnbWFwX3Jl
Z19yZWFkOiAgICAgIDItMDAxYyByZWc9NmEgdmFsPTIzCiAgICAgICAgICAgICBtcHYtMjgx
ICAgWzAwMl0gICAgNDAuMjYwMzY1OiByZWdtYXBfcmVnX3dyaXRlOiAgICAgMi0wMDFjIHJl
Zz02YSB2YWw9MjQKICAgICAgICAgICAgIG1wdi0yODEgICBbMDAyXSAgICA0MC4yNjAzNjc6
IHJlZ21hcF9od193cml0ZV9zdGFydDogMi0wMDFjIHJlZz02YSBjb3VudD0xCiAgICAgICAg
ICAgICBtcHYtMjgxICAgWzAwMl0gICAgNDAuMjYwODgxOiByZWdtYXBfaHdfd3JpdGVfZG9u
ZTogMi0wMDFjIHJlZz02YSBjb3VudD0xCiAgICAgICAgICAgICBtcHYtMjgxICAgWzAwMl0g
ICAgNDAuMjYwODg1OiByZWdtYXBfaHdfcmVhZF9zdGFydDogMi0wMDFjIHJlZz02YyBjb3Vu
dD0xCiAgICAgICAgICAgICBtcHYtMjgxICAgWzAwMl0gICAgNDAuMjYzMjQ1OiByZWdtYXBf
aHdfcmVhZF9kb25lOiAgMi0wMDFjIHJlZz02YyBjb3VudD0xCiAgICAgICAgICAgICBtcHYt
MjgxICAgWzAwMl0gICAgNDAuMjYzMjUxOiByZWdtYXBfcmVnX3JlYWQ6ICAgICAgMi0wMDFj
IHJlZz0xMjQgdmFsPTQyMAogICAgICAgICAgICAgbXB2LTI4MSAgIFswMDJdICAgIDQwLjI2
MzI1NTogcmVnbWFwX3JlZ193cml0ZTogICAgIDItMDAxYyByZWc9MTI0IHZhbD0yMjAKICAg
ICAgICAgICAgIG1wdi0yODEgICBbMDAyXSAgICA0MC4yNjMyNjA6IHJlZ21hcF9od19yZWFk
X3N0YXJ0OiAyLTAwMWMgcmVnPTZhIGNvdW50PTEKICAgICAgICAgICAgIG1wdi0yODEgICBb
MDAyXSAgICA0MC4yNjQzMjU6IHJlZ21hcF9od19yZWFkX2RvbmU6ICAyLTAwMWMgcmVnPTZh
IGNvdW50PTEKICAgICAgICAgICAgIG1wdi0yODEgICBbMDAyXSAgICA0MC4yNjQzMzA6IHJl
Z21hcF9yZWdfcmVhZDogICAgICAyLTAwMWMgcmVnPTZhIHZhbD0yNAogICAgICAgICAgICAg
bXB2LTI4MSAgIFswMDJdICAgIDQwLjI2NDMzNDogcmVnbWFwX2h3X3dyaXRlX3N0YXJ0OiAy
LTAwMWMgcmVnPTZjIGNvdW50PTEKICAgICAgICAgICAgIG1wdi0yODEgICBbMDAyXSAgICA0
MC4yNjQ4Mjc6IHJlZ21hcF9od193cml0ZV9kb25lOiAyLTAwMWMgcmVnPTZjIGNvdW50PTEK
ICAgICAgICAgICAgIG1wdi0yODEgICBbMDAyXSAgICA0MC4yNjQ4NTk6IHJlZ21hcF9yZWdf
cmVhZF9jYWNoZTogMi0wMDFjIHJlZz04ZiB2YWw9MTEwMAogICAgICAgICAgICAgbXB2LTI4
MSAgIFswMDJdICAgIDQwLjI2NDg2NzogcmVnbWFwX3JlZ193cml0ZTogICAgIDItMDAxYyBy
ZWc9OGYgdmFsPTMxMDAKICAgICAgICAgICAgIG1wdi0yODEgICBbMDAyXSAgICA0MC4yNjQ4
NzE6IHJlZ21hcF9od193cml0ZV9zdGFydDogMi0wMDFjIHJlZz04ZiBjb3VudD0xCiAgICAg
ICAgICAgICBtcHYtMjgxICAgWzAwMl0gICAgNDAuMjY1OTM5OiByZWdtYXBfaHdfd3JpdGVf
ZG9uZTogMi0wMDFjIHJlZz04ZiBjb3VudD0xCiAgICAgICAgICAgICBtcHYtMjgxICAgWzAw
Ml0gICAgNDAuMjY1OTc2OiByZWdtYXBfcmVnX3JlYWRfY2FjaGU6IDItMDAxYyByZWc9OGUg
dmFsPTQKICAgICAgICAgICAgIG1wdi0yODEgICBbMDAyXSAgICA0MC4yNjU5ODE6IHJlZ21h
cF9yZWdfd3JpdGU6ICAgICAyLTAwMWMgcmVnPThlIHZhbD05CiAgICAgICAgICAgICBtcHYt
MjgxICAgWzAwMl0gICAgNDAuMjY1OTg2OiByZWdtYXBfaHdfd3JpdGVfc3RhcnQ6IDItMDAx
YyByZWc9OGUgY291bnQ9MQogICAgICAgICAgICAgbXB2LTI4MSAgIFswMDJdICAgIDQwLjI2
NzE0MjogcmVnbWFwX2h3X3dyaXRlX2RvbmU6IDItMDAxYyByZWc9OGUgY291bnQ9MQogICAg
ICAgICAgICAgbXB2LTI4MSAgIFswMDJdICAgIDQwLjI2NzE3MjogcmVnbWFwX3JlZ193cml0
ZTogICAgIDItMDAxYyByZWc9MTc3IHZhbD05ZjAwCiAgICAgICAgICAgICBtcHYtMjgxICAg
WzAwMl0gICAgNDAuMjY3MTgyOiByZWdtYXBfaHdfcmVhZF9zdGFydDogMi0wMDFjIHJlZz02
YSBjb3VudD0xCiAgICAgICAgICAgICBtcHYtMjgxICAgWzAwMl0gICAgNDAuMjY3ODQyOiBy
ZWdtYXBfaHdfcmVhZF9kb25lOiAgMi0wMDFjIHJlZz02YSBjb3VudD0xCiAgICAgICAgICAg
ICBtcHYtMjgxICAgWzAwMl0gICAgNDAuMjY3ODQ1OiByZWdtYXBfcmVnX3JlYWQ6ICAgICAg
Mi0wMDFjIHJlZz02YSB2YWw9MjQKICAgICAgICAgICAgIG1wdi0yODEgICBbMDAyXSAgICA0
MC4yNjc4NDg6IHJlZ21hcF9yZWdfd3JpdGU6ICAgICAyLTAwMWMgcmVnPTZhIHZhbD03Nwog
ICAgICAgICAgICAgbXB2LTI4MSAgIFswMDJdICAgIDQwLjI2Nzg1MTogcmVnbWFwX2h3X3dy
aXRlX3N0YXJ0OiAyLTAwMWMgcmVnPTZhIGNvdW50PTEKICAgICAgICAgICAgIG1wdi0yODEg
ICBbMDAyXSAgICA0MC4yNjg5Mzc6IHJlZ21hcF9od193cml0ZV9kb25lOiAyLTAwMWMgcmVn
PTZhIGNvdW50PTEKICAgICAgICAgICAgIG1wdi0yODEgICBbMDAyXSAgICA0MC4yNjg5NDM6
IHJlZ21hcF9od193cml0ZV9zdGFydDogMi0wMDFjIHJlZz02YyBjb3VudD0xCiAgICAgICAg
ICAgICBtcHYtMjgxICAgWzAwMl0gICAgNDAuMjY5NDU0OiByZWdtYXBfaHdfd3JpdGVfZG9u
ZTogMi0wMDFjIHJlZz02YyBjb3VudD0xCiAgICAgICAgICAgICBtcHYtMjgxICAgWzAwMl0g
ICAgNDAuMjY5NDg0OiByZWdtYXBfcmVnX3JlYWRfY2FjaGU6IDItMDAxYyByZWc9NjMgdmFs
PWU4ZDgKICAgICAgICAgICAgIG1wdi0yODEgICBbMDAyXSAgICA0MC4yNjk0ODc6IHJlZ21h
cF9yZWdfd3JpdGU6ICAgICAyLTAwMWMgcmVnPTYzIHZhbD1hOGQwCiAgICAgICAgICAgICBt
cHYtMjgxICAgWzAwMl0gICAgNDAuMjY5NDkwOiByZWdtYXBfaHdfd3JpdGVfc3RhcnQ6IDIt
MDAxYyByZWc9NjMgY291bnQ9MQogICAgICAgICAgICAgbXB2LTI4MSAgIFswMDJdICAgIDQw
LjI3MDAxMjogcmVnbWFwX2h3X3dyaXRlX2RvbmU6IDItMDAxYyByZWc9NjMgY291bnQ9MQog
ICAgICAgICAgICAgbXB2LTI4MSAgIFswMDJdICAgIDQwLjI3MTc0MDogcmVnbWFwX3JlZ19y
ZWFkX2NhY2hlOiAyLTAwMWMgcmVnPTYzIHZhbD1hOGQwCiAgICAgICAgICAgICBtcHYtMjgx
ICAgWzAwMl0gICAgNDAuMjcxNzQ4OiByZWdtYXBfcmVnX3dyaXRlOiAgICAgMi0wMDFjIHJl
Zz02MyB2YWw9YThmMAogICAgICAgICAgICAgbXB2LTI4MSAgIFswMDJdICAgIDQwLjI3MTc1
MzogcmVnbWFwX2h3X3dyaXRlX3N0YXJ0OiAyLTAwMWMgcmVnPTYzIGNvdW50PTEKICAgICAg
ICAgICAgIG1wdi0yODEgICBbMDAyXSAgICA0MC4yNzIyNDA6IHJlZ21hcF9od193cml0ZV9k
b25lOiAyLTAwMWMgcmVnPTYzIGNvdW50PTEKICAgICAgICAgICAgIG1wdi0yODEgICBbMDAy
XSAgICA0MC4yODY4ODg6IHJlZ21hcF9yZWdfcmVhZF9jYWNoZTogMi0wMDFjIHJlZz02MyB2
YWw9YThmMAogICAgICAgICAgICAgbXB2LTI4MSAgIFswMDJdICAgIDQwLjI4NjkwMTogcmVn
bWFwX3JlZ193cml0ZTogICAgIDItMDAxYyByZWc9NjMgdmFsPWU4ZjgKICAgICAgICAgICAg
IG1wdi0yODEgICBbMDAyXSAgICA0MC4yODY5MTc6IHJlZ21hcF9od193cml0ZV9zdGFydDog
Mi0wMDFjIHJlZz02MyBjb3VudD0xCiAgICAgICAgICAgICBtcHYtMjgxICAgWzAwMl0gICAg
NDAuMjg3NzQ4OiByZWdtYXBfaHdfd3JpdGVfZG9uZTogMi0wMDFjIHJlZz02MyBjb3VudD0x
CiAgICAgICAgICAgICBtcHYtMjgxICAgWzAwMl0gICAgNDAuMjg3ODQxOiByZWdtYXBfcmVn
X3JlYWRfY2FjaGU6IDItMDAxYyByZWc9OGYgdmFsPTMxMDAKICAgICAgICAgICAgIG1wdi0y
ODEgICBbMDAyXSAgICA0MC4yODc4NDQ6IHJlZ21hcF9yZWdfd3JpdGU6ICAgICAyLTAwMWMg
cmVnPThmIHZhbD0xMTQwCiAgICAgICAgICAgICBtcHYtMjgxICAgWzAwMl0gICAgNDAuMjg3
ODQ3OiByZWdtYXBfaHdfd3JpdGVfc3RhcnQ6IDItMDAxYyByZWc9OGYgY291bnQ9MQogICAg
ICAgICAgICAgbXB2LTI4MSAgIFswMDJdICAgIDQwLjI4ODMxMDogcmVnbWFwX2h3X3dyaXRl
X2RvbmU6IDItMDAxYyByZWc9OGYgY291bnQ9MQogICAgICAgICAgICAgbXB2LTI4MSAgIFsw
MDJdICAgIDQwLjI4ODMzOTogcmVnbWFwX3JlZ19yZWFkX2NhY2hlOiAyLTAwMWMgcmVnPTkx
IHZhbD1jMDAKICAgICAgICAgICAgIG1wdi0yODEgICBbMDAyXSAgICA0MC4yODgzNDE6IHJl
Z21hcF9yZWdfd3JpdGU6ICAgICAyLTAwMWMgcmVnPTkxIHZhbD1lMDAKICAgICAgICAgICAg
IG1wdi0yODEgICBbMDAyXSAgICA0MC4yODgzNDQ6IHJlZ21hcF9od193cml0ZV9zdGFydDog
Mi0wMDFjIHJlZz05MSBjb3VudD0xCiAgICAgICAgICAgICBtcHYtMjgxICAgWzAwMl0gICAg
NDAuMjg4ODA4OiByZWdtYXBfaHdfd3JpdGVfZG9uZTogMi0wMDFjIHJlZz05MSBjb3VudD0x
CiAgICAgICAgICAgICBtcHYtMjgxICAgWzAwMl0gICAgNDAuMjg4ODM4OiByZWdtYXBfcmVn
X3JlYWRfY2FjaGU6IDItMDAxYyByZWc9OTAgdmFsPTY0NgogICAgICAgICAgICAgbXB2LTI4
MSAgIFswMDJdICAgIDQwLjI4ODg0MDogcmVnbWFwX3JlZ193cml0ZTogICAgIDItMDAxYyBy
ZWc9OTAgdmFsPTczNwogICAgICAgICAgICAgbXB2LTI4MSAgIFswMDJdICAgIDQwLjI4ODg0
NDogcmVnbWFwX2h3X3dyaXRlX3N0YXJ0OiAyLTAwMWMgcmVnPTkwIGNvdW50PTEKICAgICAg
ICAgICAgIG1wdi0yODEgICBbMDAyXSAgICA0MC4yODk3OTI6IHJlZ21hcF9od193cml0ZV9k
b25lOiAyLTAwMWMgcmVnPTkwIGNvdW50PTEKICAgICAgICAgICAgIG1wdi0yODEgICBbMDAy
XSAgICA0MC4yODk4Mjg6IHJlZ21hcF9yZWdfd3JpdGU6ICAgICAyLTAwMWMgcmVnPTEzNyB2
YWw9MWMwMAogICAgICAgICAgICAgbXB2LTI4MSAgIFswMDJdICAgIDQwLjI4OTgzNzogcmVn
bWFwX2h3X3JlYWRfc3RhcnQ6IDItMDAxYyByZWc9NmEgY291bnQ9MQogICAgICAgICAgICAg
bXB2LTI4MSAgIFswMDJdICAgIDQwLjI5MTc3MjogcmVnbWFwX2h3X3JlYWRfZG9uZTogIDIt
MDAxYyByZWc9NmEgY291bnQ9MQogICAgICAgICAgICAgbXB2LTI4MSAgIFswMDJdICAgIDQw
LjI5MTc4MjogcmVnbWFwX3JlZ19yZWFkOiAgICAgIDItMDAxYyByZWc9NmEgdmFsPTc3CiAg
ICAgICAgICAgICBtcHYtMjgxICAgWzAwMl0gICAgNDAuMjkxNzg4OiByZWdtYXBfcmVnX3dy
aXRlOiAgICAgMi0wMDFjIHJlZz02YSB2YWw9MzcKICAgICAgICAgICAgIG1wdi0yODEgICBb
MDAyXSAgICA0MC4yOTE3OTI6IHJlZ21hcF9od193cml0ZV9zdGFydDogMi0wMDFjIHJlZz02
YSBjb3VudD0xCiAgICAgICAgICAgICBtcHYtMjgxICAgWzAwMl0gICAgNDAuMjkyMzIwOiBy
ZWdtYXBfaHdfd3JpdGVfZG9uZTogMi0wMDFjIHJlZz02YSBjb3VudD0xCiAgICAgICAgICAg
ICBtcHYtMjgxICAgWzAwMl0gICAgNDAuMjkyMzI0OiByZWdtYXBfaHdfd3JpdGVfc3RhcnQ6
IDItMDAxYyByZWc9NmMgY291bnQ9MQogICAgICAgICAgICAgbXB2LTI4MSAgIFswMDJdICAg
IDQwLjI5MzU3OTogcmVnbWFwX2h3X3dyaXRlX2RvbmU6IDItMDAxYyByZWc9NmMgY291bnQ9
MQogICAgICAgICAgICAgbXB2LTI4MSAgIFswMDJdICAgIDQwLjI5MzYxNjogcmVnbWFwX3Jl
Z19yZWFkX2NhY2hlOiAyLTAwMWMgcmVnPThlIHZhbD05CiAgICAgICAgICAgICBtcHYtMjgx
ICAgWzAwMl0gICAgNDAuMjkzNjE4OiByZWdtYXBfcmVnX3dyaXRlOiAgICAgMi0wMDFjIHJl
Zz04ZSB2YWw9NQogICAgICAgICAgICAgbXB2LTI4MSAgIFswMDJdICAgIDQwLjI5MzYyMzog
cmVnbWFwX2h3X3dyaXRlX3N0YXJ0OiAyLTAwMWMgcmVnPThlIGNvdW50PTEKICAgICAgICAg
ICAgIG1wdi0yODEgICBbMDAyXSAgICA0MC4yOTQxNzk6IHJlZ21hcF9od193cml0ZV9kb25l
OiAyLTAwMWMgcmVnPThlIGNvdW50PTEKICAgICAgICAgICAgIG1wdi0yODEgICBbMDAyXSAg
ICA0MC4yOTQyMTE6IHJlZ21hcF9od19yZWFkX3N0YXJ0OiAyLTAwMWMgcmVnPTZhIGNvdW50
PTEKICAgICAgICAgICAgIG1wdi0yODEgICBbMDAyXSAgICA0MC4yOTUxODM6IHJlZ21hcF9o
d19yZWFkX2RvbmU6ICAyLTAwMWMgcmVnPTZhIGNvdW50PTEKICAgICAgICAgICAgIG1wdi0y
ODEgICBbMDAyXSAgICA0MC4yOTUxODc6IHJlZ21hcF9yZWdfcmVhZDogICAgICAyLTAwMWMg
cmVnPTZhIHZhbD0zNwogICAgICAgICAgICAgbXB2LTI4MSAgIFswMDJdICAgIDQwLjI5NTE5
NDogcmVnbWFwX3JlZ193cml0ZTogICAgIDItMDAxYyByZWc9NmEgdmFsPTI0CiAgICAgICAg
ICAgICBtcHYtMjgxICAgWzAwMl0gICAgNDAuMjk1MTk2OiByZWdtYXBfaHdfd3JpdGVfc3Rh
cnQ6IDItMDAxYyByZWc9NmEgY291bnQ9MQogICAgICAgICAgICAgbXB2LTI4MSAgIFswMDJd
ICAgIDQwLjI5NjMwMTogcmVnbWFwX2h3X3dyaXRlX2RvbmU6IDItMDAxYyByZWc9NmEgY291
bnQ9MQogICAgICAgICAgICAgbXB2LTI4MSAgIFswMDJdICAgIDQwLjI5NjMwODogcmVnbWFw
X2h3X3JlYWRfc3RhcnQ6IDItMDAxYyByZWc9NmMgY291bnQ9MQogICAgICAgICAgICAgbXB2
LTI4MSAgIFswMDJdICAgIDQwLjI5ODc2OTogcmVnbWFwX2h3X3JlYWRfZG9uZTogIDItMDAx
YyByZWc9NmMgY291bnQ9MQogICAgICAgICAgICAgbXB2LTI4MSAgIFswMDJdICAgIDQwLjI5
ODc3NzogcmVnbWFwX3JlZ19yZWFkOiAgICAgIDItMDAxYyByZWc9MTI0IHZhbD0yMjAKICAg
ICAgICAgICAgIG1wdi0yODEgICBbMDAyXSAgICA0MC4yOTg3ODQ6IHJlZ21hcF9yZWdfd3Jp
dGU6ICAgICAyLTAwMWMgcmVnPTEyNCB2YWw9NDIwCiAgICAgICAgICAgICBtcHYtMjgxICAg
WzAwMl0gICAgNDAuMjk4NzkwOiByZWdtYXBfaHdfcmVhZF9zdGFydDogMi0wMDFjIHJlZz02
YSBjb3VudD0xCiAgICAgICAgICAgICBtcHYtMjgxICAgWzAwMl0gICAgNDAuMjk5NTQyOiBy
ZWdtYXBfaHdfcmVhZF9kb25lOiAgMi0wMDFjIHJlZz02YSBjb3VudD0xCiAgICAgICAgICAg
ICBtcHYtMjgxICAgWzAwMl0gICAgNDAuMjk5NTQ5OiByZWdtYXBfcmVnX3JlYWQ6ICAgICAg
Mi0wMDFjIHJlZz02YSB2YWw9MjQKICAgICAgICAgICAgIG1wdi0yODEgICBbMDAyXSAgICA0
MC4yOTk1NTU6IHJlZ21hcF9od193cml0ZV9zdGFydDogMi0wMDFjIHJlZz02YyBjb3VudD0x
CiAgICAgICAgICAgICBtcHYtMjgxICAgWzAwMl0gICAgNDAuMzAwMDU0OiByZWdtYXBfaHdf
d3JpdGVfZG9uZTogMi0wMDFjIHJlZz02YyBjb3VudD0xCiAgICAgICAgICAgICBtcHYtMjgx
ICAgWzAwMl0gICAgNDAuMzAwMTA3OiByZWdtYXBfcmVnX3JlYWRfY2FjaGU6IDItMDAxYyBy
ZWc9MiB2YWw9Y2JjYgogICAgICAgICAgICAgbXB2LTI4MSAgIFswMDJdICAgIDQwLjMwMDEx
MDogcmVnbWFwX3JlZ193cml0ZTogICAgIDItMDAxYyByZWc9MiB2YWw9NGI0YgogICAgICAg
ICAgICAgbXB2LTI4MSAgIFswMDJdICAgIDQwLjMwMDExNTogcmVnbWFwX2h3X3dyaXRlX3N0
YXJ0OiAyLTAwMWMgcmVnPTIgY291bnQ9MQogICAgICAgICAgICAgbXB2LTI4MSAgIFswMDJd
ICAgIDQwLjMwMDc1NjogcmVnbWFwX2h3X3dyaXRlX2RvbmU6IDItMDAxYyByZWc9MiBjb3Vu
dD0xCiAgICAgICAgICBtcHYvYW8tMjkwICAgWzAwM10gICAgNDAuNzIxNzU5OiByZWdtYXBf
cmVnX3JlYWRfY2FjaGU6IDcwMDgwMDAwLmFodWIgcmVnPTAgdmFsPTcwNzc3CiAgICAgICAg
ICBtcHYvYW8tMjkwICAgWzAwM10gICAgNDAuNzIxNzc2OiByZWdtYXBfcmVnX3dyaXRlOiAg
ICAgNzAwODAwMDAuYWh1YiByZWc9MCB2YWw9ODAwNzA3NzcKICAgICAgICAgIG1wdi9hby0y
OTAgICBbMDAzXSAgICA0MC43MjE3ODc6IHJlZ21hcF9yZWdfcmVhZF9jYWNoZTogNzAwODA0
MDAuaTJzIHJlZz0wIHZhbD00MDUKICAgICAgICAgIG1wdi9hby0yOTAgICBbMDAzXSAgICA0
MC43MjE3ODk6IHJlZ21hcF9yZWdfd3JpdGU6ICAgICA3MDA4MDQwMC5pMnMgcmVnPTAgdmFs
PTgwMDAwNDA1CiAgICAgICAgICAgICBtcHYtMjgxICAgWzAwMl0gICAgNDEuNjkzMTU5OiBy
ZWdtYXBfcmVnX3JlYWRfY2FjaGU6IDcwMDgwMDAwLmFodWIgcmVnPTAgdmFsPTgwMDcwNzc3
CiAgICAgICAgICAgICBtcHYtMjgxICAgWzAwMl0gICAgNDEuNjkzMTg1OiByZWdtYXBfcmVn
X3dyaXRlOiAgICAgNzAwODAwMDAuYWh1YiByZWc9MCB2YWw9NzA3NzcKICAgICAgICAgICAg
IG1wdi0yODEgICBbMDAyXSAgICA0MS42OTMyMDA6IHJlZ21hcF9yZWdfcmVhZF9jYWNoZTog
NzAwODA0MDAuaTJzIHJlZz0wIHZhbD04MDAwMDQwNQogICAgICAgICAgICAgbXB2LTI4MSAg
IFswMDJdICAgIDQxLjY5MzIwMzogcmVnbWFwX3JlZ193cml0ZTogICAgIDcwMDgwNDAwLmky
cyByZWc9MCB2YWw9NDA1Cg==
--------------C61C59C1B0D8396DF51DA79F
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--------------C61C59C1B0D8396DF51DA79F--
