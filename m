Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F197790CA6
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Sep 2023 17:09:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53CF23E8;
	Sun,  3 Sep 2023 17:08:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53CF23E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693753760;
	bh=Q01XaucQ+ogPT/fZgt2B1C/JxZ73zJODW6fKdFLZbuU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=o5dFxSzEaVGv5xT/ALttfn+taguKqwTpvrHO2BOvwmD5umLKX1X/vXD9RQCf9OYQf
	 kDRpiBda6mUfzSFBAY7Itb+JBaZnl7jc6X5//MkE6LChetfHHkmP6id+6Ej94CjhFw
	 cN5q5/MT8x6zVlmw3tolzI0mkKLFePaYIEcSiD5Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A0B5F80549; Sun,  3 Sep 2023 17:08:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A3D8F80431;
	Sun,  3 Sep 2023 17:08:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7ED86F8047D; Sun,  3 Sep 2023 17:08:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp.smtpout.orange.fr (smtp-29.smtpout.orange.fr
 [80.12.242.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 76535F80141
	for <alsa-devel@alsa-project.org>; Sun,  3 Sep 2023 17:08:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76535F80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256
 header.s=t20230301 header.b=hpsDbBq0
Received: from [192.168.1.18] ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id coi3qCr0AbNd0coi4qbqwR; Sun, 03 Sep 2023 17:08:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1693753703;
	bh=3vbBQKPo4LJHiDDNu1Lpt1WO/D8AzSItjWjmWe5gbq8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=hpsDbBq0hKZCwQat/ZIqq9w4sx53uM36YjYqIk+2GzJJnrbYsApNAK6K376YZMh3Y
	 YridCz3gFWp99me5kiRpM16zf2tf34HZ36JkGtxfTHRa1D1vh2XMPJy5u8EtwO16gO
	 Yn2lXRujKdf5NwRv4+ELdOABRCwznCAfk+ClZB4b85aPxetGtTJdubXx/8D+lYVV50
	 5PNFxk55viO4pR6TjXvvEb2ortM6IId3uWUMgOKGho1dsj2uCVJ8OuafX4i0ouPeuZ
	 SrXDiuvpDBYtfW8jPB/SEOU7K/mRTYhhNHnLdqogvBwp3CraKUGNEFDuWNEn4vR+ma
	 VXSZagSubZefA==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 03 Sep 2023 17:08:23 +0200
X-ME-IP: 86.243.2.178
Message-ID: <6014901d-8fe6-9e80-171e-a1017cc9e0f9@wanadoo.fr>
Date: Sun, 3 Sep 2023 17:08:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] ALSA: scarlett2: Fix a potential memory leak in
 scarlett2_init_notify()
Content-Language: fr, en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: "Geoffrey D. Bennett" <g@b4.vu>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org
References: 
 <73aab53d53df156a5df2bc61314ff26448526749.1693744859.git.christophe.jaillet@wanadoo.fr>
 <87zg23l4bn.wl-tiwai@suse.de>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <87zg23l4bn.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: M2X4BXQUZFTE73IJ4BCACRUOPHQXTZS6
X-Message-ID-Hash: M2X4BXQUZFTE73IJ4BCACRUOPHQXTZS6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M2X4BXQUZFTE73IJ4BCACRUOPHQXTZS6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Le 03/09/2023 à 16:27, Takashi Iwai a écrit :
> On Sun, 03 Sep 2023 14:41:45 +0200,
> Christophe JAILLET wrote:
>>
>> If kmalloc() fails, we should release 'mixer->urb'.
> 
> This is released at the common error path in mixer.c,
> snd_usb_mixer_free(), hence it's not needed.

Agreed, sorry for the noise.

CJ

> 
> And, even if freeing here, you must NULL-clear mixer->urb, too;
> otherwise it'll lead to double-free.
> 
> 
> thanks,
> 
> Takashi
> 
>>
>> Fixes: 9e4d5c1be21f ("ALSA: usb-audio: Scarlett Gen 2 mixer interface")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>>   sound/usb/mixer_scarlett_gen2.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
>> index 9d11bb08667e..a439c7f64b2e 100644
>> --- a/sound/usb/mixer_scarlett_gen2.c
>> +++ b/sound/usb/mixer_scarlett_gen2.c
>> @@ -4060,8 +4060,10 @@ static int scarlett2_init_notify(struct usb_mixer_interface *mixer)
>>   		return -ENOMEM;
>>   
>>   	transfer_buffer = kmalloc(private->wMaxPacketSize, GFP_KERNEL);
>> -	if (!transfer_buffer)
>> +	if (!transfer_buffer) {
>> +		usb_free_urb(mixer->urb);
>>   		return -ENOMEM;
>> +	}
>>   
>>   	usb_fill_int_urb(mixer->urb, dev, pipe,
>>   			 transfer_buffer, private->wMaxPacketSize,
>> -- 
>> 2.34.1
>>
> 

