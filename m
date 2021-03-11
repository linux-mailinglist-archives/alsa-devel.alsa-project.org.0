Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EA83379D0
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 17:46:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21F871773;
	Thu, 11 Mar 2021 17:45:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21F871773
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615481187;
	bh=reaOPT77pFZ3BOjSYxQtqOv5nBAtkllZVaNFv558wJs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OL4Gr9v3gq+Or5oudI5oFlkjkrRFRGLnn6kK3t+hheZWaxPh+pVNqGzDWfOVhvtTV
	 NjJOuujw6J458pL34LATt8uJ1EGHM/8+uqU5ZFBmzxnjXEe4CedNAsLG0wavp+wDTd
	 ok0s3aI3aPruQmtNFgJf1Gwimy5aCtFt989pBfVE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA2E0F8019B;
	Thu, 11 Mar 2021 17:44:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34CF2F80227; Thu, 11 Mar 2021 17:44:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E01F8F8015B
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 17:44:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E01F8F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="YqzXi2sF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615481085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z/iM70UPGw0q9UWS7Bab1CEgThmuc/GO6xycqGWpyPQ=;
 b=YqzXi2sF3C3bEXWqxwoLamjfzqEd636Q2QF5PxLMtFj1sWGW9TnbmWzkdK/A4gpmHS8cGx
 hew6cV5/JmjRbAbhNcQzaAtRkqUkzEMnaEj11ZXolcUCWUkA4yWQtElQiE6P7w+O/ATcyN
 9m4i1UgEJSHRIFpvuMhn+2W4BxXAS3w=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-wZbyjDvQPkCaT7gj7Qamkw-1; Thu, 11 Mar 2021 11:44:41 -0500
X-MC-Unique: wZbyjDvQPkCaT7gj7Qamkw-1
Received: by mail-ed1-f72.google.com with SMTP id o15so10195858edv.7
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 08:44:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z/iM70UPGw0q9UWS7Bab1CEgThmuc/GO6xycqGWpyPQ=;
 b=tB2wznBV1Z9k22TzqbIcKEEG5U+FWbhhPDGPp3xR87xnCVm7MbAdvsySafGmk0lfC+
 6VgzqMZwJT11/+sA0KssN52w7nhpgojyhONGla+bqk0T9cveG3dNiWLkJtFEAYweHew9
 uUYsDcLHZUSrzaxxF8aFq4/YbpyA3i5sXgO+8ZPrAdtS98y4EOrIHRQYPNL1N8Gq/Vz3
 8FjtDppxuiHC2go6svabNQZ13y1jcM3bcCrleNfE7Agz6x7SvBNCIKovirR8/J5MP/dm
 cPSOn8KHKFO1ZgzYPIYXl7WRZ8lyfECmevP20it9XngIHV0M3Qya8udzXTX5BPJR+9Qt
 No6Q==
X-Gm-Message-State: AOAM533u0neS0AbmvKH1HknVQczG8WZnd+l6vTEGVt0N1qxB4a6md11y
 ePWfEz1LXqcaBf8ZHsI1w+9RbzC1RmvKBK3A6tE9OKNwVtf9A0lgJgO1DD41O9fuBU266t/k2Yw
 c+u1zyDPJYDgSTpQe0eiPfNQ=
X-Received: by 2002:a50:ed83:: with SMTP id h3mr9800241edr.140.1615481078541; 
 Thu, 11 Mar 2021 08:44:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxL7jFXDPeGf/e3SfN+B7SLEqL3rrJi/VXQkdEil/cRez1PHAT5oigV36mjVHkV6YPHS8zc6w==
X-Received: by 2002:a50:ed83:: with SMTP id h3mr9800226edr.140.1615481078297; 
 Thu, 11 Mar 2021 08:44:38 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id lu26sm1545776ejb.33.2021.03.11.08.44.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 08:44:37 -0800 (PST)
Subject: Re: [PATCH 1/2] ASoC: intel: atom: Stop advertising non working S24LE
 support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jie Yang <yang.jie@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
References: <20210309105520.9185-1-hdegoede@redhat.com>
 <e1af1b57-d384-0dce-6362-c39197cf2063@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <1c6f6608-5da3-1d57-1673-97ea22930ff9@redhat.com>
Date: Thu, 11 Mar 2021 17:44:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <e1af1b57-d384-0dce-6362-c39197cf2063@linux.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, stable@vger.kernel.org
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

Hi,

On 3/9/21 4:42 PM, Pierre-Louis Bossart wrote:
> 
> 
> On 3/9/21 4:55 AM, Hans de Goede wrote:
>> The SST firmware's media and deep-buffer inputs are hardcoded to
>> S16LE, the corresponding DAIs don't have a hw_params callback and
>> their prepare callback also does not take the format into account.
>>
>> So far the advertising of non working S24LE support has not caused
>> issues because pulseaudio defaults to S16LE, but changing pulse-audio's
>> config to use S24LE will result in broken sound.
>>
>> Pipewire is replacing pulse now and pipewire prefers S24LE over S16LE
>> when available, causing the problem of the broken S24LE support to
>> come to the surface now.
>>
>> Cc: stable@vger.kernel.org
>> BugLink: https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/866
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> Humm, that is strange.
> I can't recall such limitations in the firmware, and the SSP support does make use of 24 bits.
> Please give me a couple of days to double-check what's missing.

Note this is not about the format between the DSP (the DSP's SSP) and the codec,
this is the format between userspace and the DSP.

As is mentioned by the reporter of this issue:
https://github.com/thesofproject/sof/issues/3868#issuecomment-796809535
Both in that issue but also here:
https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/530#note_791736

And independently reproduced by my here:
https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/866#note_830336

The S24LE format ATM does not work when passed from userspace, this is
supposed to take 24 bits sampled packed into 32 bits ints (so padded
with 1 0 byte to make 32 bits per sample), but to actually get working
playback with the SST driver, the following commands are necessary:

ffmpeg -i /usr/share/sounds/alsa/Side_Left.wav -ar 96000 -f s32le -ac 2 test.raw
aplay --dump-hw-params -D"hw:1,0" -r48000 -c2 -fS24_LE test.raw

Note how the ffmpeg command to generate a working set of raw samples
is set to convert to full 32 bit samples, rather then 0 padded 24 bit
samples. Generating a .raw file with the same -f s32le argument to
ffmpeg and then playing it with aplay -fS24_LE while using the SOF
driver results in static. Where as with the SST driver it results
in working sound. This shows that the 2 clearly interpret the format
differently and it looks like the SST driver is interpreting it wrong.

Maybe the SST driver should advertise S32_LE support instead, SOF
advertised both S24_LE and S32_LE and the S32_LE format is the
one which works with .raw files generated with ffmpeg's -f s32le
option when using the SOF drv.

Note the format is not the only issue though, to get normal speed / pitch
playback, the file needs to be converted to a sample rate of 96KHz 
and then played back at 48 KHz, hence the "-ar 96000" argument to
ffmpeg to get normal playback when using aplay -fS24_LE with the SST driver.

Because of both these fmt and playback speed issues I decided to just
drop the SNDRV_PCM_FMTBIT_S24_LE support in my patch. I guess we could
try to fix it, but since the plan is the phase out the SST support for
these devices this year I believe that we should not spend too much
time on trying to fix the SST driver here.  Dropping the SNDRV_PCM_FMTBIT_S24_LE
is a simple workaround to bridge the time until we complete drop the
SST support.

Regards,

Hans



> 
>> ---
>>   sound/soc/intel/atom/sst-mfld-platform-pcm.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
>> index 9e9b05883557..aa5dd590ddd5 100644
>> --- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
>> +++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
>> @@ -488,14 +488,14 @@ static struct snd_soc_dai_driver sst_platform_dai[] = {
>>           .channels_min = SST_STEREO,
>>           .channels_max = SST_STEREO,
>>           .rates = SNDRV_PCM_RATE_44100|SNDRV_PCM_RATE_48000,
>> -        .formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE,
>> +        .formats = SNDRV_PCM_FMTBIT_S16_LE,
>>       },
>>       .capture = {
>>           .stream_name = "Headset Capture",
>>           .channels_min = 1,
>>           .channels_max = 2,
>>           .rates = SNDRV_PCM_RATE_44100|SNDRV_PCM_RATE_48000,
>> -        .formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE,
>> +        .formats = SNDRV_PCM_FMTBIT_S16_LE,
>>       },
>>   },
>>   {
>> @@ -506,7 +506,7 @@ static struct snd_soc_dai_driver sst_platform_dai[] = {
>>           .channels_min = SST_STEREO,
>>           .channels_max = SST_STEREO,
>>           .rates = SNDRV_PCM_RATE_44100|SNDRV_PCM_RATE_48000,
>> -        .formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE,
>> +        .formats = SNDRV_PCM_FMTBIT_S16_LE,
>>       },
>>   },
>>   {
>>
> 

