Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC01345C1C
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Mar 2021 11:44:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B9AD1676;
	Tue, 23 Mar 2021 11:43:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B9AD1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616496243;
	bh=6ZCqKCIFUsaX+XiJEhRoEmRTtkZx4sRkULrH1YOzBdo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bcDdzi1VbxbitZeqnaEL+/FViB83qm3Srk96k4WQjCMTFPmG2PiNmTPZ0/aa/QPFn
	 vslsV57g6u8nDxinVmgLSxcIenP/hjHmHQvefsPzcOo9oAof50UOeHkl3eLgRPKmkf
	 hELQVwcMU3gz1EJo3p0mIW7iNWliW8in+pCiouM4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93F91F80104;
	Tue, 23 Mar 2021 11:42:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8ED24F8025F; Tue, 23 Mar 2021 11:42:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 030E6F80104
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 11:42:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 030E6F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="E7eobvS2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616496150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=seJufNQA6R/aHWG0ldoDbr0UH3wC+oARwWaFTTjjy/w=;
 b=E7eobvS2ksMqf8zjtdfMKYMkrvP+sVFfGXHiUqhqOzav3gy/W0NwDY/YubbgAbzZ072Ccj
 ysRF1Z2C9dlodB2Zp5pAYbJWZAc6e0KeoGavO5jIPY3HFYjoh3itXMILE2KWByUTRCTEiY
 hsWT+8WChsJXo9qvsfecq25hoo/CM40=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-IZFZ1RArOeKr5J1YVn02YQ-1; Tue, 23 Mar 2021 06:42:28 -0400
X-MC-Unique: IZFZ1RArOeKr5J1YVn02YQ-1
Received: by mail-ej1-f70.google.com with SMTP id di5so873911ejc.1
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 03:42:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=seJufNQA6R/aHWG0ldoDbr0UH3wC+oARwWaFTTjjy/w=;
 b=kPad16n3ZQvOgQuXR2u9P6+kpCN9ZBigepnCZ0m7KGHrO9LerH7aKyV7nW4WjvPDk6
 SF25Q88GXdDlvbWS56ZX4XT6HrWd0PMWiZFZFRl3EqOAB8qeP3BcqeikTgHim85XfVPK
 dCL5GBcGEjmCUobU8dvDQLhhtkzDvEdbvMNJsPylLjOyY6HduD4TSDfd9YZq0f6nrvXJ
 SX+yE9QOdr5PketRPOvIVf+tEACBC43Pqk7xqavrzcTW4ej0QqNaacKjBH2SnZRLRsJE
 XziHgIRT2OHgCJrMqQYTadX0TfQvqhDVFj82Wz8A/4HJAtUnlv3Zgm0A8p9qUAIDGxWW
 eaxw==
X-Gm-Message-State: AOAM530U6Mw0YJGz3Q94P/rSwrBNgj3ytpXqfJZ/SBGRFML1aQRFctvp
 Tbvt/6T/os/J62FoPihG8qooeSRtco0eu3qr+Oy3gckPgufM7JEYY+dkNMZIb9svZ86F0YqI+vk
 a8dYh6KtZH9obPrOc4sT3W5g=
X-Received: by 2002:a17:906:2818:: with SMTP id
 r24mr4267844ejc.502.1616496147239; 
 Tue, 23 Mar 2021 03:42:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqv1bcAR42UNa6Mn7H5r4Cx3S+AWK7/NA4fKPcRzhO4Wp1pzs3B6lvJDrcgzSKo9KQyHJbeg==
X-Received: by 2002:a17:906:2818:: with SMTP id
 r24mr4267838ejc.502.1616496147065; 
 Tue, 23 Mar 2021 03:42:27 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id u15sm12881441eds.6.2021.03.23.03.42.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 03:42:26 -0700 (PDT)
Subject: Re: [PATCH v4 6/6] ALSA: led control - add sysfs kcontrol LED marking
 layer
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>
References: <20210317172945.842280-1-perex@perex.cz>
 <20210317172945.842280-7-perex@perex.cz>
 <a3ddb881-6580-cd25-ef3c-734e686e6942@redhat.com>
 <s5h5z1nf47r.wl-tiwai@suse.de>
 <3820909c-29ce-9f3f-d1e6-c4611e06abe4@redhat.com>
 <s5h35wqff1m.wl-tiwai@suse.de>
 <a2018c94-8731-de29-e447-92457176a1b4@redhat.com>
 <s5hy2eidul2.wl-tiwai@suse.de>
 <a9a62884-da5b-ef2a-10ec-e414e6784677@perex.cz>
 <s5hblbaciqh.wl-tiwai@suse.de> <s5ha6quci82.wl-tiwai@suse.de>
 <65943f72-6489-24fa-f6af-a2bae8824d90@perex.cz>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <a437a531-61ae-c064-94a3-938195577c7d@redhat.com>
Date: Tue, 23 Mar 2021 11:42:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <65943f72-6489-24fa-f6af-a2bae8824d90@perex.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Curtis Malainey <cujomalainey@google.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Dylan Reid <dgreid@google.com>
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

On 3/23/21 11:31 AM, Jaroslav Kysela wrote:
> Dne 23. 03. 21 v 10:49 Takashi Iwai napsal(a):
>> On Tue, 23 Mar 2021 10:38:46 +0100,
>> Takashi Iwai wrote:
>>>
>>> On Mon, 22 Mar 2021 15:16:30 +0100,
>>> Jaroslav Kysela wrote:
>>>>
>>>> Dne 20. 03. 21 v 10:48 Takashi Iwai napsal(a):
>>>>
>>>>>> With other OS you mean e.g. Android?  Android has device-specific
>>>>>> init-scripts which can either call alsactl or directly do the
>>>>>> echo-s.
>>>>>
>>>>> Also ChromeOS.  I'd like to get a general consensus before moving
>>>>> forward.
>>>>
>>>> Where are ChromeOS people? They could join to the discussion which is floating
>>>> few months now. Perhaps, the gmail's spam filter does not allow them to
>>>> communicate with us ;-)
>>>
>>> Also adding Dylan and Mark to Cc.
>>>
>>> FYI, the patch set is:
>>>   https://lore.kernel.org/alsa-devel/20210317172945.842280-1-perex@perex.cz/
>>
>> ... and now back to the topic.
>>
>> So the primary question is whether we want the sysfs entries to allow
>> user-space defining the mute-LED vs control binding externally.  With
>> this, the mute LED is supposed to be set up via udev rules that
>> triggers some alsactl stuff, and the rest is handled in an extension
>> in UCM profile.  If this approach is acceptable on all platforms, we
>> can go for it.  That was the question to other platforms like Android
>> and ChromeOS.
>>
>>
>> And, now looking into the details, I have a few more questions:
>>
>> - The binding with SNDRV_CTL_ELEM_* bit flag is handy for some drivers
>>   but not for everything; e.g. if we want to add the binding in ASoC
>>   machine driver, an API like
>>     snd_ctl_bind_mute_led(card, elem_id, inverted);
>>   would be easier.  It'd be essentially an internal call of the sysfs
>>   binding.
> 
> I would probably create more universal helper for the access field. It may be
> handy to update other flags like INACTIVE or so. Something like:
> 
>   snd_ctl_update_access(card, elem_id, access_mask, access_bits);

For the ASoC machine drivers this functions would ideally take an element-name
not the numeric id, because the machine-driver has no idea of the ids and
the ids are not really stable (they may change when e.g. a new mixer
element is added to the codec).

> 
> If we decide to move this information out of access field, we can replace
> those calls with another function.
> 
> For ASoC codecs, it may be difficult to do such calls in the init phase,
> because the card is not bound to the component. But yes, I agree that this
> setting should be handled in the upper layer (machine) than the component layer.
> 
>>  (I haven't checked, but might this be also more
>>   straightforward conversion for HD-audio case, too?)
> 
> I don't think that it brings a simplification. The id composition is more
> complex than 'if (codec->led_flag) access |= LED_GROUP'.
> 
>> - The binding in the kernel could (should?) be shown in the sysfs
>>   output.  Currently it seems handled differently?
> 
> It isn't. The LED group is stored in the access field and my implementation
> tracks those bits per elements. So, the sysfs LED code updates those bits,
> too. The settings is preserved even if you reload the ctl-led module.
> 
>> - Specifying the numid may the code simpler in kernel side?
>>   alsactl has already the string parser.
> 
> Yes, but it's not so handy for scripting / UCM. I can add find-ctl-numid
> lookup to UCM, of course, but what about standard shell scripting?

I would prefer for the sysfs API to accept element-names too, as
I mentioned above that would even be better for in kernel use, let
alone for a userspace API.

Regards,

Hans

