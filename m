Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B712790C97
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Sep 2023 17:05:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 177CFFA;
	Sun,  3 Sep 2023 17:05:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 177CFFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693753553;
	bh=RyzipRvxLZ76rcd0exvkbf2Og4itSpu5Xi90cCIyb4I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DMC5x2b1Gngl+a2XUJd26dbEjTFYbOh/vxAfBPAYVXanr2tUBsI+OmFluWQnPcSzx
	 jvbbgZhuJa3DYb1e+MYHZH1W2AhvsCPBQBhGADx4+aJNP0WJ9mO5GPN+7q1SxlYuiF
	 A4Jqaq87KRb8cXMNbKHqlHksUzrLYnJD44cVF2kM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46FB6F80494; Sun,  3 Sep 2023 17:05:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7269FF80431;
	Sun,  3 Sep 2023 17:05:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24921F8047D; Sun,  3 Sep 2023 17:04:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp.smtpout.orange.fr (smtp-13.smtpout.orange.fr
 [80.12.242.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6AA67F80141
	for <alsa-devel@alsa-project.org>; Sun,  3 Sep 2023 17:04:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AA67F80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256
 header.s=t20230301 header.b=XUSqYTLh
Received: from [192.168.1.18] ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id coedqFIfsPnvscoedq11w0; Sun, 03 Sep 2023 17:04:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1693753488;
	bh=jKoUYb09gGu7FzODWXf/YNYwwFG/WPF7F5CxMSBP/HI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=XUSqYTLhGozU6PLT24lNsYtT/2KsRirBALIAlLT0ExJ0CwqoCZNtqftriK8hX7G6m
	 44k4wJcpKYnS/4JW/fYW+lhL3Kd+wO+G98jAvbZvbOmQBAr9xO3pHi+Uv2P/QQerNY
	 wMsqDcidCNnc2V/thuAdH37Q/p8/A2QJzPuAAjB6Bb4PJhATYKzY7Fh31LyYG10zcv
	 nzUg/algK73W7i2Y6UOAMu7zxcU2J98GslvvLtHohEeOGqwhYD66+YTUx8iRhtn6YC
	 fh2wj5Mr3hIG12wO6jpqYoynIx/OHiXs15LV7JNYsJ7zjmCe7zY0QxLaLlzSvPriQu
	 l32SvQ7+hUsNQ==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 03 Sep 2023 17:04:48 +0200
X-ME-IP: 86.243.2.178
Message-ID: <8cde2320-517f-3a38-8c3f-f807791c6c52@wanadoo.fr>
Date: Sun, 3 Sep 2023 17:04:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] ALSA: usb-audio: Fix a potential memory leak in
 scarlett2_init_notify()
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 alsa-devel@alsa-project.org
References: 
 <fc275ed315b9157952dcf2744ee7bdb78defdb5f.1693746347.git.christophe.jaillet@wanadoo.fr>
 <871qffmj2d.wl-tiwai@suse.de>
Content-Language: fr
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <871qffmj2d.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: OGHOQOYBQAITV5JN5DUPQ64PD6WNFH5M
X-Message-ID-Hash: OGHOQOYBQAITV5JN5DUPQ64PD6WNFH5M
X-MailFrom: christophe.jaillet@wanadoo.fr
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OGHOQOYBQAITV5JN5DUPQ64PD6WNFH5M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Le 03/09/2023 à 16:23, Takashi Iwai a écrit :
> On Sun, 03 Sep 2023 15:06:00 +0200,
> Christophe JAILLET wrote:
>>
>> If usb_alloc_coherent() or usb_urb_ep_type_check() fail, we should release
>> the resources previously allocated.
> 
> Those are freed in the caller side, start_input_streams() instead.

Thanks for the fast review.

Hmpm, If IIUC, resources allocated *before* the ending "ep->num_urbs++" 
still need to be freed here, otherwise free_midi_urbs() in the caller 
will not free them.

Do you agree?

If yes, I can send v2 which would look like:
	usb_alloc_urb()
	if (err)
		return -ENOMEM

	usb_alloc_coherent()
	if (err) {
		usb_free_urb()
		urb = NULL
		return -ENOMEM
	}
	
	 usb_urb_ep_type_check()
	if (err) {
		usb_free_coherent()
		usb_free_urb()
		urb = NULL
		return -err
	}

Or, if yuo prefer, with an error handling path just like below, but 
without the final free_midi_urbs() + a comment explaining that the 
caller does this part of job instead.

CJ

> 
> 
> thanks,
> 
> Takashi
> 
>>
>> Fixes: ff49d1df79ae ("ALSA: usb-audio: USB MIDI 2.0 UMP support")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>>   sound/usb/midi2.c | 17 ++++++++++++++---
>>   1 file changed, 14 insertions(+), 3 deletions(-)
>>
>> diff --git a/sound/usb/midi2.c b/sound/usb/midi2.c
>> index a27e244650c8..4109c82adff6 100644
>> --- a/sound/usb/midi2.c
>> +++ b/sound/usb/midi2.c
>> @@ -302,7 +302,8 @@ static int alloc_midi_urbs(struct snd_usb_midi2_endpoint *ep)
>>   		ctx->urb = usb_alloc_urb(0, GFP_KERNEL);
>>   		if (!ctx->urb) {
>>   			dev_err(&ep->dev->dev, "URB alloc failed\n");
>> -			return -ENOMEM;
>> +			err = -ENOMEM;
>> +			goto err_free_all;
>>   		}
>>   		ctx->ep = ep;
>>   		buffer = usb_alloc_coherent(ep->dev, len, GFP_KERNEL,
>> @@ -310,7 +311,8 @@ static int alloc_midi_urbs(struct snd_usb_midi2_endpoint *ep)
>>   		if (!buffer) {
>>   			dev_err(&ep->dev->dev,
>>   				"URB buffer alloc failed (size %d)\n", len);
>> -			return -ENOMEM;
>> +			err = -ENOMEM;
>> +			goto err_free_cur_urb;
>>   		}
>>   		if (ep->interval)
>>   			usb_fill_int_urb(ctx->urb, ep->dev, ep->pipe,
>> @@ -322,13 +324,22 @@ static int alloc_midi_urbs(struct snd_usb_midi2_endpoint *ep)
>>   		if (err < 0) {
>>   			dev_err(&ep->dev->dev, "invalid MIDI EP %x\n",
>>   				endpoint);
>> -			return err;
>> +			goto err_free_cur_dma;
>>   		}
>>   		ctx->urb->transfer_flags = URB_NO_TRANSFER_DMA_MAP;
>>   		ep->num_urbs++;
>>   	}
>>   	ep->urb_free = ep->urb_free_mask = GENMASK(ep->num_urbs - 1, 0);
>>   	return 0;
>> +
>> +err_free_cur_dma:
>> +	usb_free_coherent(ep->dev, len, buffer, ctx->urb->transfer_dma);
>> +err_free_cur_urb:
>> +	usb_free_urb(ctx->urb);
>> +	ctx->urb = NULL;
>> +err_free_all:
>> +	free_midi_urbs(ep);
>> +	return err;
>>   }
>>   
>>   static struct snd_usb_midi2_endpoint *
>> -- 
>> 2.34.1
>>
> 

