Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFCE1B5434
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Apr 2020 07:27:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BF7816EC;
	Thu, 23 Apr 2020 07:26:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BF7816EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587619640;
	bh=3XhKSAiiPz2i6EsNSwOQ5oT23yODaSlmAHZBehfINHg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lHVmBpu6MQSD0VDQgRUIJiKYAK/UJMj+7p6aQeY/5ycsI3lIwwyvqu4lXD7K4too8
	 SGjJ9wRU/EsTDxkGDDjbdtRax81ITpNHrm+wl+LUqXSXI12A8HxWK7qrE6TWFOdxVu
	 AZkPJi+kZTpNOKVZ3HV20e7NvxnJljE15KAIenm4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AAC10F80121;
	Thu, 23 Apr 2020 07:25:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DC22F801EC; Thu, 23 Apr 2020 07:24:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12712F800FF
 for <alsa-devel@alsa-project.org>; Thu, 23 Apr 2020 07:24:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12712F800FF
Received: from [111.196.67.54] (helo=[192.168.2.106])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1jRULB-0002Qi-6j; Thu, 23 Apr 2020 05:24:01 +0000
Subject: Re: [PATCH] ALSA: hda: Always use jackpoll helper for jack update
 after resume
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20200422203744.26299-1-tiwai@suse.de>
 <s5hblnjxn7i.wl-tiwai@suse.de>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <a9c9886b-9707-a4fe-639c-3b1b6a87723e@canonical.com>
Date: Thu, 23 Apr 2020 13:23:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <s5hblnjxn7i.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
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


On 2020/4/23 上午4:46, Takashi Iwai wrote:
> On Wed, 22 Apr 2020 22:37:44 +0200,
> Takashi Iwai wrote:
>> HD-audio codec driver applies a tricky procedure to forcibly perform
>> the runtime resume by mimicking the usage count even if the device has
>> been runtime-suspended beforehand.  This was needed to assure to
>> trigger the jack detection update after the system resume.
>>
>> And recently we also applied the similar logic to the HD-audio
>> controller side.  However this seems leading to some inconsistency,
>> and eventually PCI controller gets screwed up.
>>
>> This patch is an attempt to fix and clean up those behavior: instead
>> of the tricky runtime resume procedure, the existing jackpoll work is
>> scheduled when such a forced codec resume is required.  The jackpoll
>> work will power up the codec, and this alone should suffice for the
>> jack status update in usual cases.  If the extra polling is requested
>> (by checking codec->jackpoll_interval), the manual update is invoked
>> after that, and the codec is powered down again.
>>
>> Also, we filter the spurious wake up of the codec from the controller
>> runtime resume by checking codec->relaxed_resume flag.  If this flag
>> is set, basically we don't need to wake up explicitly, but it's
>> supposed to be done via the audio component notifier.
>>
>> Fixes: c4c8dd6ef807 ("ALSA: hda: Skip controller resume if not needed")
>> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> Note that this patch discards the previous forced resume logic
> introduced in commit b5a236c175b0
>      ALSA: hda - Enforces runtime_resume after S3 and S4 for each codec
>
> So, Hui, could you check whether it still works for such a device?
> Or at least tests with a few known working devices are helpful.

I tested the patch on the machine which has the detection issue of  
"ALSA: hda - Enforces runtime_resume after S3 and S4 for each codec", 
the new patch worked well. The headphone could be detected after s3/s4.

And I don't have other machines at the moment since I worked at home 
recently, so only tested this patch on one machine, it worked well.

Regards,

Hui.


>
> Also, Kai, it'd be appreciated if you can test whether it causes
> regression on Intel HDMI audio.  Currently I have no enough test
> machines due to lockdown, unfortunately.
>
>
> Thanks!
>
> Takashi
>
>
>> ---
>>   sound/pci/hda/hda_codec.c | 28 +++++++++++++++++-----------
>>   sound/pci/hda/hda_intel.c | 17 ++---------------
>>   2 files changed, 19 insertions(+), 26 deletions(-)
>>
>> diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
>> index 86a632bf4d50..7e3ae4534df9 100644
>> --- a/sound/pci/hda/hda_codec.c
>> +++ b/sound/pci/hda/hda_codec.c
>> @@ -641,8 +641,18 @@ static void hda_jackpoll_work(struct work_struct *work)
>>   	struct hda_codec *codec =
>>   		container_of(work, struct hda_codec, jackpoll_work.work);
>>   
>> -	snd_hda_jack_set_dirty_all(codec);
>> -	snd_hda_jack_poll_all(codec);
>> +	/* for non-polling trigger: we need nothing if already powered on */
>> +	if (!codec->jackpoll_interval && snd_hdac_is_power_on(&codec->core))
>> +		return;
>> +
>> +	/* the power-up/down sequence triggers the runtime resume */
>> +	snd_hda_power_up_pm(codec);
>> +	/* update jacks manually if polling is required, too */
>> +	if (codec->jackpoll_interval) {
>> +		snd_hda_jack_set_dirty_all(codec);
>> +		snd_hda_jack_poll_all(codec);
>> +	}
>> +	snd_hda_power_down_pm(codec);
>>   
>>   	if (!codec->jackpoll_interval)
>>   		return;
>> @@ -2951,18 +2961,14 @@ static int hda_codec_runtime_resume(struct device *dev)
>>   static int hda_codec_force_resume(struct device *dev)
>>   {
>>   	struct hda_codec *codec = dev_to_hda_codec(dev);
>> -	bool forced_resume = hda_codec_need_resume(codec);
>>   	int ret;
>>   
>> -	/* The get/put pair below enforces the runtime resume even if the
>> -	 * device hasn't been used at suspend time.  This trick is needed to
>> -	 * update the jack state change during the sleep.
>> -	 */
>> -	if (forced_resume)
>> -		pm_runtime_get_noresume(dev);
>>   	ret = pm_runtime_force_resume(dev);
>> -	if (forced_resume)
>> -		pm_runtime_put(dev);
>> +	/* schedule jackpoll work for jack detection update */
>> +	if (codec->jackpoll_interval ||
>> +	    (pm_runtime_suspended(dev) && hda_codec_need_resume(codec)))
>> +		schedule_delayed_work(&codec->jackpoll_work,
>> +				      codec->jackpoll_interval);
>>   	return ret;
>>   }
>>   
>> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
>> index 9f995576cff1..0310193ea1bd 100644
>> --- a/sound/pci/hda/hda_intel.c
>> +++ b/sound/pci/hda/hda_intel.c
>> @@ -1004,7 +1004,8 @@ static void __azx_runtime_resume(struct azx *chip, bool from_rt)
>>   
>>   	if (status && from_rt) {
>>   		list_for_each_codec(codec, &chip->bus)
>> -			if (status & (1 << codec->addr))
>> +			if (!codec->relaxed_resume &&
>> +			    (status & (1 << codec->addr)))
>>   				schedule_delayed_work(&codec->jackpoll_work,
>>   						      codec->jackpoll_interval);
>>   	}
>> @@ -1044,9 +1045,7 @@ static int azx_suspend(struct device *dev)
>>   static int azx_resume(struct device *dev)
>>   {
>>   	struct snd_card *card = dev_get_drvdata(dev);
>> -	struct hda_codec *codec;
>>   	struct azx *chip;
>> -	bool forced_resume = false;
>>   
>>   	if (!azx_is_pm_ready(card))
>>   		return 0;
>> @@ -1058,19 +1057,7 @@ static int azx_resume(struct device *dev)
>>   	if (azx_acquire_irq(chip, 1) < 0)
>>   		return -EIO;
>>   
>> -	/* check for the forced resume */
>> -	list_for_each_codec(codec, &chip->bus) {
>> -		if (hda_codec_need_resume(codec)) {
>> -			forced_resume = true;
>> -			break;
>> -		}
>> -	}
>> -
>> -	if (forced_resume)
>> -		pm_runtime_get_noresume(dev);
>>   	pm_runtime_force_resume(dev);
>> -	if (forced_resume)
>> -		pm_runtime_put(dev);
>>   	snd_power_change_state(card, SNDRV_CTL_POWER_D0);
>>   
>>   	trace_azx_resume(chip);
>> -- 
>> 2.16.4
>>
