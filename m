Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEEA12CA735
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Dec 2020 16:39:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6096817CD;
	Tue,  1 Dec 2020 16:38:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6096817CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606837158;
	bh=6zVbxA+lVoKZxeARmXIa2LB4LCQkemB6U5f96SjZayA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fvUYN7TxjEl6i8LZwUFPwqfO1J1Es6Nie3uFcqhPXOP8QYm5NNHDezJ9Hwwca756T
	 XMJP9i09GAbjwh7ybEK1Cy296AE51UfAfHGljq1HswMdfqK9EPph9e0ALz3fze9325
	 E2ftByHjMTFMxndClXhZ2YnbmC3jwvGapEGaWeE8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 857C9F8016D;
	Tue,  1 Dec 2020 16:37:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56939F8016C; Tue,  1 Dec 2020 16:37:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_135,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37A64F80158
 for <alsa-devel@alsa-project.org>; Tue,  1 Dec 2020 16:37:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37A64F80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="HlAu5V+K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606837047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BwZaIUwQe/3t//DTUOdD5UwvJ1BdHVdv+07t5o/FhBk=;
 b=HlAu5V+KxLkjHsgg5+5XA/Hdm2buW0dVAACTZfduwyoiCv0KxDGlitaT68vsGG5RORTbtI
 Zz9scGPeJc8e+eXCgsWpLyxAXadOwutA0sBil5b7/TO314anSpvVS222UocdsXGtDzawlk
 w72GBitRGV1UuR1cuVYcvgbEu8QfxPw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-X6Yf9yiKOy6IZOfjX4jP7Q-1; Tue, 01 Dec 2020 10:37:24 -0500
X-MC-Unique: X6Yf9yiKOy6IZOfjX4jP7Q-1
Received: by mail-ej1-f72.google.com with SMTP id n17so1426181eja.23
 for <alsa-devel@alsa-project.org>; Tue, 01 Dec 2020 07:37:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BwZaIUwQe/3t//DTUOdD5UwvJ1BdHVdv+07t5o/FhBk=;
 b=DdIASsobXR5RxItBOWN+cYPD/E3N1T5tW4W0U02MkE+siPzuyfIbT9SB2CpeWNjmwU
 qtwK/INup3lwncYp7Q/XYb1N1fktulTroU2HVp9EHr+O03qqYuexZYvb9ZsMWh30CMr7
 zJdfjlIaO7hp6Pmrb8zRh4MvmXRVFfKaYlEq/wjQIqvuO6jVdeO7HLTKb8WeaxP51HyQ
 UZT/wFhbJeunSQDCoGBYwGhzt5aryyzg+rKMFAYzDuXSpbY0vA/V10jRehf5/WHqbB25
 yhznRhYuTVT/6FuVqRPg/MgxYglsFWNRSuI13iWUOMJjwqbu2guBaZ7XS1NFH0vTRNjb
 uPbg==
X-Gm-Message-State: AOAM533eKWlbmT59eCBJQSrjBakex84FgcN5PryVp8gQR5tFsbSMogFe
 FFs81/ApAk2RRODXM5+F8+S8wFfYAd5rTKINFBZRJWUjyZanh/usvMfRcl8MT9CfyON9P0ncTWu
 4NvtHTc9KW8LfM9OXHDh+qvU=
X-Received: by 2002:a50:9ee6:: with SMTP id a93mr3669230edf.174.1606837043228; 
 Tue, 01 Dec 2020 07:37:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx2G/mYgN3DRNRi9iNpKwnu8DQx9FVHVw2IXl1JnjOsoFbRb/9nu7m/1cA96dOcetp1aD7B0A==
X-Received: by 2002:a50:9ee6:: with SMTP id a93mr3669201edf.174.1606837042933; 
 Tue, 01 Dec 2020 07:37:22 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id mc25sm58855ejb.58.2020.12.01.07.37.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 07:37:21 -0800 (PST)
Subject: Re: Asoc: Intel: SST (CHT) regression in asoc/for-5.11
To: Takashi Iwai <tiwai@suse.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
References: <93cc93a1-82bd-f5a3-4e19-4cfc65c868e7@redhat.com>
 <2d9d0d43-8239-01e2-3787-98dfd305e369@linux.intel.com>
 <7b50862a-d7e3-6a72-833d-5c8283c8deab@linux.intel.com>
 <s5h5z5ld1ox.wl-tiwai@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <34a9096c-75a4-90ff-3bb0-4f32ecda4cee@redhat.com>
Date: Tue, 1 Dec 2020 16:37:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <s5h5z5ld1ox.wl-tiwai@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Jie Yang <yang.jie@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Bard liao <yung-chuan.liao@linux.intel.com>
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

On 12/1/20 3:46 PM, Takashi Iwai wrote:
> On Tue, 01 Dec 2020 04:24:58 +0100,
> Pierre-Louis Bossart wrote:
>>
>>
>>
>>
>>> On 11/29/20 6:24 AM, Hans de Goede wrote:
>>>> Hi All,
>>>>
>>>> To test the code to dynamically switch between SST/SOF support on BYT/CHT
>>>> from the kernel commandline I merged:
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/log/?h=for-5.11 
>>>>
>>>>
>>>> Into my personal tree (mostly Linus' master + some pending patches from
>>>> myself).
>>>>
>>>> After this I was getting the following errors in dmesg when using
>>>> sound on
>>>> a Medion E2228T laptop with a CHT SoC + NAU8824 codec:
>>>>
>>>> [   53.805205] intel_sst_acpi 808622A8:00: Wait timed-out
>>>> condition:0x0, msg_id:0x1 fw_state 0
>>>> [   53.805479] intel_sst_acpi 808622A8:00: fw returned err -16
>>>> [   53.806281] sst-mfld-platform sst-mfld-platform: ASoC: PRE_PMD:
>>>> pcm0_in event failed: -16
>>>> [   54.829548] intel_sst_acpi 808622A8:00: Wait timed-out
>>>> condition:0x0, msg_id:0x1 fw_state 0
>>>> [   54.829596] intel_sst_acpi 808622A8:00: fw returned err -16
>>>> [   54.829668] sst-mfld-platform sst-mfld-platform: ASoC: POST_PMD:
>>>> media0_out event failed: -
>>>> [   55.853230] intel_sst_acpi 808622A8:00: Wait timed-out
>>>> condition:0x0, msg_id:0x1 fw_state 0
>>>> [   55.853244] intel_sst_acpi 808622A8:00: fw returned err -16
>>>> [   55.853269] sst-mfld-platform sst-mfld-platform: ASoC: POST_PMD:
>>>> codec_out0 mix 0 event fai
>>>> [   56.876435] intel_sst_acpi 808622A8:00: Wait timed-out
>>>> condition:0x0, msg_id:0x1 fw_state 0
>>>> [   56.876481] intel_sst_acpi 808622A8:00: fw returned err -16
>>>> [   56.876563] sst-mfld-platform sst-mfld-platform: ASoC: POST_PMD:
>>>> media0_out mix 0 event fai
>>>> [   61.847455] intel_sst_acpi 808622A8:00: FW sent error response 0x40015
>>>> [   61.847564] intel_sst_acpi 808622A8:00: fw returned err -1
>>>> [   61.847659] sst-mfld-platform sst-mfld-platform: ASoC: error at
>>>> snd_soc_dai_startup on ssp2
>>>> [   61.847722]  SSP2-Codec: ASoC: BE open failed -1
>>>> [   61.847754]  Audio Port: ASoC: failed to start some BEs -1
>>>> [   61.847786] intel_sst_acpi 808622A8:00: FW sent error response 0x40006
>>>> [   64.301284] intel_sst_acpi 808622A8:00: FW sent error response 0x90001
>>>> [   64.301545] intel_sst_acpi 808622A8:00: not suspending FW!!, Err: -2
>>>>
>>>> Dropping the asoc/for-5.11 merge and just cherry-picking
>>>> Pierre-Louis' changes
>>>> for the dynamic switching makes these go away. So this seems to be
>>>> caused by
>>>> other changes in asoc/for-5.11.
>>>>
>>>> So any clues where to start looking for this, or should I just
>>>> bisect this?
>>>
>>> Thanks for reporting this Hans.
>>>
>>> The only thing that comes to my mind is Morimoto-san's series which
>>> modified snd_soc_dai_startup, but that was back in September and
>>> should be in 5.10-rcX
>>>
>>> Will give it a try on my side as well.
>>
>> I was able to reproduce this error with Mark's for-next branch on a
>> CHT device w/ rt5640, and git bisect points to this commit:
>>
>> a27b421f1d04b201c474a15ee1591919c81fb413 is the first bad commit
>> commit a27b421f1d04b201c474a15ee1591919c81fb413
>> Author: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
>> Date:   Tue Nov 17 13:50:01 2020 -0800
>>
>>     ASoC: pcm: call snd_soc_dapm_stream_stop() in soc_pcm_hw_clean
>>
>>     Currently, the SND_SOC_DAPM_STREAM_START event is sent during
>>     pcm_prepare() but the SND_SOC_DAPM_STREAM_STOP event is
>>     sent only in dpcm_fe_dai_shutdown() after soc_pcm_close().
>>     This results in an imbalance between when the DAPM widgets
>>     receive the PRE/POST_PMU/PMD events. So call
>>     snd_soc_dapm_stream_stop() in soc_pcm_hw_clean() before the
>>     snd_soc_pcm_component_hw_free() to keep the stream_stop DAPM
>>     event balanced with the stream_start event in soc_pm_prepare().
>>
>>     Also, in order to prevent duplicate DAPM stream events,
>>     remove the call for DAPM STREAM_START event in dpcm_fe_dai_prepare()
>>     and the call for DAPM STREAM_STOP event in dpcm_fe_dai_shutdown().
>>
>>     Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
>>     Reviewed-by: Pierre-Louis Bossart
>> <pierre-louis.bossart@linux.intel.com>
>>     Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
>>     Link:
>> https://lore.kernel.org/r/20201117215001.163107-1-ranjani.sridharan@linux.intel.com
>>     Signed-off-by: Mark Brown <broonie@kernel.org>
>>
>>  sound/soc/soc-pcm.c | 10 +++-------
>>  1 file changed, 3 insertions(+), 7 deletions(-)
>>
>>
>> I am not sure why this break the Atom/SST driver, this was reviewed
>> and seemed legit - even required IIRC to deal with topology pipelines
>> initialized on-demand. Reverting this patch restores functionality. I
>> would guess it's the DAPM_STREAM_START that's now missing (or in the
>> 'wrong' location) and causing issues?

Pierre-Louis, thank you for bisecting this.

> 
> Indeed the DAPM_START_STREAM call completely disappeared after the
> patch, which looks very wrong.

Yes that probably explains this issue.

>> Hans, can you confirm if indeed this is the same issue on your devices?

I've tried reverting the commit and I can confirm that asoc/for-5.11
works fine with the commit reverted.

Regards,

Hans

