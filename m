Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9EB7486CA
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jul 2023 16:48:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E694741;
	Wed,  5 Jul 2023 16:47:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E694741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688568506;
	bh=Yh3Nkvh1bzqlDdHfApTg6NPTU0awFrvYzztO8uv3LP0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GXpzvIvVBvDB1i5ZRo77RJkoXEIpEyP8/yuQ5GIlJwSFyw4yf4zC0qODCgef6pMqR
	 mNat4pn5DWB6EhJJL2710TE0tfLRhvgtoul2xTD6buUjvQdeTGqJBPmDwOWzQZj9IC
	 C8XkhFN3jlH4Qb85oDn/lzaBgRXgkF8mqbl2rorM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2CBEFF80132; Wed,  5 Jul 2023 16:47:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A5BCBF80124;
	Wed,  5 Jul 2023 16:47:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 125A6F80125; Wed,  5 Jul 2023 16:47:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3AC8FF80104
	for <alsa-devel@alsa-project.org>; Wed,  5 Jul 2023 16:47:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3AC8FF80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KLUwvwQf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688568448; x=1720104448;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Yh3Nkvh1bzqlDdHfApTg6NPTU0awFrvYzztO8uv3LP0=;
  b=KLUwvwQfujA8Nn++kO7b/iCVyQX8zy3dlOCWmlopXgOE34cz5oCGEguo
   8QcbVhVBYUXXHr8fdXSa2EMHqXLeYgWvlTWnOLQtwjBko1L48mkhySI3F
   V6MDmux2HzBeGW2i7v8g/ckzeJgPEL0bczQYx4W3wFSb44VLGB7hZjBNV
   opa/oZuo3rac1YiKMxAJ/p7ssEf6n95llo6MMF0YkVogfijzRwbfgCzLA
   cQKnQxrAdt2YhexzTQKhYwQDUPwLUQXS0TIcl1RTK3q8YGPsFTP2XBKgB
   mrBln3uvnhYTMvHrvttEp0agE9PhltG219J9C4eNvb96SRiwSkA5xH6xf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="366845288"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200";
   d="scan'208";a="366845288"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 07:47:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="669430482"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200";
   d="scan'208";a="669430482"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 07:47:23 -0700
Message-ID: <b82e9ab6-5ae5-a414-f3f0-e864bf5a0a62@linux.intel.com>
Date: Wed, 5 Jul 2023 16:47:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [bug report] ALSA: jack: Access input_dev under mutex
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, Dan Carpenter <dan.carpenter@linaro.org>
Cc: alsa-devel@alsa-project.org
References: <cf95f7fe-a748-4990-8378-000491b40329@moroto.mountain>
 <87sfa42j76.wl-tiwai@suse.de>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87sfa42j76.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UW63ZGJVFXADJ6Y2C6PPPRY2U23ALDDB
X-Message-ID-Hash: UW63ZGJVFXADJ6Y2C6PPPRY2U23ALDDB
X-MailFrom: amadeuszx.slawinski@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UW63ZGJVFXADJ6Y2C6PPPRY2U23ALDDB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 7/4/2023 10:07 AM, Takashi Iwai wrote:
> On Mon, 03 Jul 2023 16:18:27 +0200,
> Dan Carpenter wrote:
>>
>> Hello Amadeusz Sławiński,
>>
>> The patch 1b6a6fc5280e: "ALSA: jack: Access input_dev under mutex"
>> from Apr 12, 2022, leads to the following Smatch static checker
>> warning:
>>
>> 	sound/core/jack.c:673 snd_jack_report()
>> 	warn: sleeping in atomic context
>>
>> sound/core/jack.c
>>      663         jack->hw_status_cache = status;
>>      664
>>      665         list_for_each_entry(jack_kctl, &jack->kctl_list, list)
>>      666                 if (jack_kctl->sw_inject_enable)
>>      667                         mask_bits |= jack_kctl->mask_bits;
>>      668                 else
>>      669                         snd_kctl_jack_report(jack->card, jack_kctl->kctl,
>>      670                                              status & jack_kctl->mask_bits);
>>      671
>>      672 #ifdef CONFIG_SND_JACK_INPUT_DEV
>> --> 673         mutex_lock(&jack->input_dev_lock);
>>                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>
>> That patch adds this mutex but we can't take mutex because we're already
>> holding a spinlock.  The problematic call trees are:
>>
>> virtsnd_event_notify_cb() <- disables preempt
>> virtsnd_disable_event_vq() <- disables preempt
>> -> virtsnd_event_dispatch()
>>     -> virtsnd_jack_event()
>>        -> snd_jack_report()
>>
>> The virtsnd_event_notify_cb() and virtsnd_disable_event_vq() functions
>> take the spin_lock_irqsave(&queue->lock, flags);
> 
> Indeed it was no good choice to use the mutex there inside the report
> function.  It's supposed to be callable from an irq-disabled context,
> too.
> 
> How about simply using the device refcount like below?
> 
> Although we may drop the mutex from snd_jack, it can can be left, as
> it's still useful for protecting a potential race between creation and
> deletion.
> 
> 
> thanks,
> 
> Takashi
> 
> -- 8< --
> --- a/sound/core/jack.c
> +++ b/sound/core/jack.c
> @@ -654,6 +654,7 @@ void snd_jack_report(struct snd_jack *jack, int status)
>   	struct snd_jack_kctl *jack_kctl;
>   	unsigned int mask_bits = 0;
>   #ifdef CONFIG_SND_JACK_INPUT_DEV
> +	struct input_dev *idev;
>   	int i;
>   #endif
>   
> @@ -670,17 +671,15 @@ void snd_jack_report(struct snd_jack *jack, int status)
>   					     status & jack_kctl->mask_bits);
>   
>   #ifdef CONFIG_SND_JACK_INPUT_DEV
> -	mutex_lock(&jack->input_dev_lock);
> -	if (!jack->input_dev) {
> -		mutex_unlock(&jack->input_dev_lock);
> +	idev = input_get_device(jack->input_dev);
> +	if (!idev)
>   		return;
> -	}
>   
>   	for (i = 0; i < ARRAY_SIZE(jack->key); i++) {
>   		int testbit = ((SND_JACK_BTN_0 >> i) & ~mask_bits);
>   
>   		if (jack->type & testbit)
> -			input_report_key(jack->input_dev, jack->key[i],
> +			input_report_key(idev, jack->key[i],
>   					 status & testbit);
>   	}
>   
> @@ -688,13 +687,13 @@ void snd_jack_report(struct snd_jack *jack, int status)
>   		int testbit = ((1 << i) & ~mask_bits);
>   
>   		if (jack->type & testbit)
> -			input_report_switch(jack->input_dev,
> +			input_report_switch(idev,
>   					    jack_switch_types[i],
>   					    status & testbit);
>   	}
>   
> -	input_sync(jack->input_dev);
> -	mutex_unlock(&jack->input_dev_lock);
> +	input_sync(idev);
> +	input_put_device(idev);
>   #endif /* CONFIG_SND_JACK_INPUT_DEV */
>   }
>   EXPORT_SYMBOL(snd_jack_report);


Looking at code it looks like it should also work. Will schedule test 
run tomorrow to see if it causes any problems.
