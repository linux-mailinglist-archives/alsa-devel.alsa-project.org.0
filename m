Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F25DF320D30
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Feb 2021 20:34:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86F521674;
	Sun, 21 Feb 2021 20:33:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86F521674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613936067;
	bh=3MvxlGlweB/cl8SNM5XghsepQBGu/plUrSWVI3Y61ok=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W0YLkm6R3SoiEMmN6ln44EllJehXL4x3lmi2MkJhHTivs9EJz4dI1py+XPYfp/A2g
	 vcGU4Y61bN02G1KvpYsQgAtejrHlUXlTa8K6W1uV349ioULXo5jzTsDGhc4+q9Djnh
	 jt/Ci8bzW68J3aSCJPauWJ3bw12o7jo0QsnmIfpg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5543F80167;
	Sun, 21 Feb 2021 20:32:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A590F8016A; Sun, 21 Feb 2021 20:32:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8F22F800F3
 for <alsa-devel@alsa-project.org>; Sun, 21 Feb 2021 20:32:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8F22F800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Mn3b/YCu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613935966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bDVgXkx5AYHrHNwmpTsf7YgIlq9YRJripauuXjQ9rh8=;
 b=Mn3b/YCuKon+8WDJLpBpHsP38HStUmzuH1ARw717jOJODxiRq451Oyq2HROXsSs7LX6llN
 NVTsDfuiaOb14WJWS40GT+1FIpoNTLUzeBhJ5mhmBTY92YpgP6GKZMBgtpftypz1xS4T8X
 mibUlcASF/zWmrHiiqkHyi4+Z9GS45I=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-erwhyGT7NXuWzlO12gsoEQ-1; Sun, 21 Feb 2021 14:32:44 -0500
X-MC-Unique: erwhyGT7NXuWzlO12gsoEQ-1
Received: by mail-ej1-f69.google.com with SMTP id bx12so3272470ejc.15
 for <alsa-devel@alsa-project.org>; Sun, 21 Feb 2021 11:32:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bDVgXkx5AYHrHNwmpTsf7YgIlq9YRJripauuXjQ9rh8=;
 b=UxIuEVQ0KisxRepW/yjXTHs/uarYt9/zxVJl4yV6HzjN3CuRL99JKfVibINmhjnvNk
 b4fXwAbhXcHs9WOHUubd5kSrtfKYl3nOxHKydlfKTYVnJnuKSqaT7T00eLbQ3F97Yt2H
 JFv6vYs1VTyDpQ9BVTOlhAKegjTbKAsYz8/7oY77b49u9OOj82ubGWhjMLfJsJikhSSE
 xywoSYbR0woh55GUv5ktXx1VClEa8ZWCNYFKNzD0cdSPkoa8WnnvxhnADec3WwjmhAcR
 9XJClOEd+vTo9jrI/Y7uVnqGar7OE4kdsOrYLSro1S2Pf2q4frCqY2NgBf0CDzrJGMAp
 390Q==
X-Gm-Message-State: AOAM533Ppe+Lo6+psqdI69/PHcANFO6AyLRFl797LZTb75gtdCyHcpz3
 PF6SrpsUvwb6LM8iCLtLrh7oI0E7Wa+EoMk+HqKcTunbspN0Gukl++d80fJ2WrRXx+38WaJ7VwW
 XDYroB+BYRy/QlGuNaNNNuQc=
X-Received: by 2002:a50:a45b:: with SMTP id v27mr19166024edb.141.1613935963178; 
 Sun, 21 Feb 2021 11:32:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxW4TSrUzqAQfwlKAEzAafsG2P5OrWiESzQX0IN6k4dOyxxnCTiFoSleYvMh1zNbuW6dn3MNg==
X-Received: by 2002:a50:a45b:: with SMTP id v27mr19166013edb.141.1613935963043; 
 Sun, 21 Feb 2021 11:32:43 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id t19sm7739876ejs.122.2021.02.21.11.32.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 11:32:42 -0800 (PST)
Subject: Re: [PATCH v2 0/5] ALSA: control - add generic LED API
To: Jaroslav Kysela <perex@perex.cz>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20210215172418.1322825-1-perex@perex.cz>
 <d1582696-b8db-7c7e-3279-9ce016a7fa8a@redhat.com>
 <1509c137-c977-c9af-95c4-8d4040e619e3@perex.cz>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <30904946-0d70-c13e-91c7-5cf65387fef1@redhat.com>
Date: Sun, 21 Feb 2021 20:32:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1509c137-c977-c9af-95c4-8d4040e619e3@perex.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>, Perry Yuan <Perry.Yuan@dell.com>
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

On 2/21/21 7:01 PM, Jaroslav Kysela wrote:
> Dne 21. 02. 21 v 14:14 Hans de Goede napsal(a):
> 
>>> v2 changes:
>>>   - fix the locking - remove the controls_rwsem read lock
>>>     in the element get (the consistency is already protected
>>>     with the global snd_ctl_led_mutex and possible partial
>>>     value writes are catched with the next value change
>>>     notification callback)
>>
>> I'm afraid that lockdep still is unhappy. With v2 there is a new
>> (different) lockdep warning.
> 
>> If you can send me another fixup-diff then I'll make sure to
>> test this before you do a v3, so that we can be sure that
>> all cases which my setup catches are resolved before sending
>> out v3.
> 
> Thank you for your test. This change (on top of v2) should resolve this
> remaining lockdep:

I can confirm that I'm not seeing any more lockdeps warning after
applying this on top of v2 of the series.

Regards,

Hans



> diff --git a/sound/core/control.c b/sound/core/control.c
> index c9f062fada0a..494f0154e8be 100644
> --- a/sound/core/control.c
> +++ b/sound/core/control.c
> @@ -2051,7 +2051,9 @@ void snd_ctl_register_layer(struct snd_ctl_layer_ops *lops)
>  	for (card_number = 0; card_number < SNDRV_CARDS; card_number++) {
>  		card = snd_card_ref(card_number);
>  		if (card) {
> +			down_read(&card->controls_rwsem);
>  			lops->lregister(card);
> +			up_read(&card->controls_rwsem);
>  			snd_card_unref(card);
>  		}
>  	}
> @@ -2113,10 +2115,12 @@ static int snd_ctl_dev_register(struct snd_device *device)
>  				  &snd_ctl_f_ops, card, &card->ctl_dev);
>  	if (err < 0)
>  		return err;
> +	down_read(&card->controls_rwsem);
>  	down_read(&snd_ctl_layer_rwsem);
>  	for (lops = snd_ctl_layer; lops; lops = lops->next)
>  		lops->lregister(card);
>  	up_read(&snd_ctl_layer_rwsem);
> +	up_read(&card->controls_rwsem);
>  	return 0;
>  }
> 
> @@ -2137,10 +2141,12 @@ static int snd_ctl_dev_disconnect(struct snd_device
> *device)
>  	}
>  	read_unlock_irqrestore(&card->ctl_files_rwlock, flags);
> 
> +	down_read(&card->controls_rwsem);
>  	down_read(&snd_ctl_layer_rwsem);
>  	for (lops = snd_ctl_layer; lops; lops = lops->next)
>  		lops->ldisconnect(card);
>  	up_read(&snd_ctl_layer_rwsem);
> +	up_read(&card->controls_rwsem);
> 
>  	return snd_unregister_device(&card->ctl_dev);
>  }
> diff --git a/sound/core/control_led.c b/sound/core/control_led.c
> index cafe4c82ca35..b8bb8fd46686 100644
> --- a/sound/core/control_led.c
> +++ b/sound/core/control_led.c
> @@ -235,11 +235,10 @@ static void snd_ctl_led_register(struct snd_card *card)
>  	mutex_lock(&snd_ctl_led_mutex);
>  	snd_ctl_led_card_valid[card->number] = true;
>  	mutex_unlock(&snd_ctl_led_mutex);
> -	down_read(&card->controls_rwsem);
> +	/* the register callback is already called with held card->controls_rwsem */
>  	list_for_each_entry(kctl, &card->controls, list)
>  		for (ioff = 0; ioff < kctl->count; ioff++)
>  			snd_ctl_led_notify(card, SNDRV_CTL_EVENT_MASK_VALUE, kctl, ioff);
> -	up_read(&card->controls_rwsem);
>  	snd_ctl_led_refresh();
>  }
> 
> 
> 					Jaroslav
> 

