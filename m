Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9107B3C7344
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jul 2021 17:30:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1568C168C;
	Tue, 13 Jul 2021 17:29:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1568C168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626190211;
	bh=Ku80l16oagNS2BsOF+i9JJBUXNx4e7L04/w83UxXH5Y=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BxCi0v2xQV4k+wBVDodaHK0lL5pck3FF52M9dczeTRULZAjVS7akpcLK83qNHruBQ
	 n+ummMTQw8xV5bwT9oIWf+Fs1rXMVMhRlJu/CaeLH9gmMpysiGWPBKdBnv82R71S4E
	 lCA6vVoi5odv6hYHh8tFrbjuY4VHjsx4dXAAond4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E64DF8016A;
	Tue, 13 Jul 2021 17:28:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56F09F80229; Tue, 13 Jul 2021 17:28:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36BFDF8016A
 for <alsa-devel@alsa-project.org>; Tue, 13 Jul 2021 17:28:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36BFDF8016A
X-IronPort-AV: E=McAfee;i="6200,9189,10044"; a="209999093"
X-IronPort-AV: E=Sophos;i="5.84,236,1620716400"; d="scan'208";a="209999093"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 08:23:26 -0700
X-IronPort-AV: E=Sophos;i="5.84,236,1620716400"; d="scan'208";a="493853521"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.237.180.79])
 ([10.237.180.79])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2021 08:23:22 -0700
Subject: Re: [PATCH 02/51] ALSA: core: Add managed card creation
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20210713142857.19654-1-tiwai@suse.de>
 <20210713142857.19654-3-tiwai@suse.de>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Message-ID: <9d6ce40b-101e-5b16-cd6c-8734aea4c4fd@linux.intel.com>
Date: Tue, 13 Jul 2021 17:23:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713142857.19654-3-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 7/13/2021 4:28 PM, Takashi Iwai wrote:

...

> +
> +/**
> + * snd_devm_card_new - managed snd_card object creation
> + * @parent: the parent device object
> + * @idx: card index (address) [0 ... (SNDRV_CARDS-1)]
> + * @xid: card identification (ASCII string)
> + * @module: top level module for locking
> + * @extra_size: allocate this extra size after the main soundcard structure
> + * @card_ret: the pointer to store the created card instance
> + *
> + * This function works like snd_card_new() but manages the allocated resource
> + * via devres, i.e. you don't need to free explicitly.
> + *
> + * When a snd_card object is created with this function and registered via
> + * snd_card_register(), the very first devres action to call snd_card_free()
> + * is added automatically.  In that way, the resource disconnection is assured
> + * at first, then released in the expected order.
> + */
> +int snd_devm_card_new(struct device *parent, int idx, const char *xid,
> +		      struct module *module, int extra_size,
> +		      struct snd_card **card_ret)
> +{
> +	struct snd_card *card;
> +	int err;
> +
> +	*card_ret = NULL;
> +	if (extra_size < 0)
> +		extra_size = 0;
Maybe just make extra_size unsigned or even better size_t?

...

>   
>   /**
>    * snd_card_ref - Get the card object from the index
> @@ -481,6 +547,7 @@ EXPORT_SYMBOL_GPL(snd_card_disconnect_sync);
>   
>   static int snd_card_do_free(struct snd_card *card)
>   {
> +	card->releasing = true;
>   #if IS_ENABLED(CONFIG_SND_MIXER_OSS)
>   	if (snd_mixer_oss_notify_callback)
>   		snd_mixer_oss_notify_callback(card, SND_MIXER_OSS_NOTIFY_FREE);
> @@ -498,7 +565,8 @@ static int snd_card_do_free(struct snd_card *card)
>   #endif
>   	if (card->release_completion)
>   		complete(card->release_completion);
> -	kfree(card);
> +	if (!card->managed)
> +		kfree(card);
>   	return 0;
>   }
>   
> @@ -539,6 +607,9 @@ int snd_card_free(struct snd_card *card)
>   	DECLARE_COMPLETION_ONSTACK(released);
>   	int ret;
>   
> +	if (card->releasing)
> +		return 0;
> +

"card->releasing" use feels bit racy to me... something like below would 
break it?

thread1                   thread2
snd_card_free()
if(card->releasing) == false
thread1 goes sleep
                           snd_card_do_free()
                           card->releasing = true
                           run until the end
thread1 resume
continues with trying to release

>   	card->release_completion = &released;
>   	ret = snd_card_free_when_closed(card);
>   	if (ret)
> @@ -745,6 +816,11 @@ int snd_card_add_dev_attr(struct snd_card *card,
>   }
>   EXPORT_SYMBOL_GPL(snd_card_add_dev_attr);
>   
> +static void trigger_card_free(void *data)
> +{
> +	snd_card_free(data);
> +}
> +
>   /**
>    *  snd_card_register - register the soundcard
>    *  @card: soundcard structure
> @@ -768,6 +844,15 @@ int snd_card_register(struct snd_card *card)
>   		if (err < 0)
>   			return err;
>   		card->registered = true;
> +	} else {
> +		if (card->managed)
> +			devm_remove_action(card->dev, trigger_card_free, card);

Not sure I understand, we are in _register function, so why do we remove 
action?

> +	}
> +
> +	if (card->managed) {
> +		err = devm_add_action(card->dev, trigger_card_free, card);
> +		if (err < 0)
> +			return err;
>   	}
>   
>   	err = snd_device_register_all(card);
> 

