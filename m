Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0DD34287A
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Mar 2021 23:10:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5CC7167C;
	Fri, 19 Mar 2021 23:09:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5CC7167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616191825;
	bh=P0/V8DwbQyeUrSeyfSpWwzyolLvE+B/gB72VLP9fSjg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zy0gTxokaLL5b3SSkWcPvc64VNmTlTySSqQE2Wnok0apcVTI2DKa2vmutaAr7vx1i
	 ehlBGPxQ7tf39/402jMTSzqbnH719doCQ9GPENMTF/21LZHczAc37af4fcvOlncPTZ
	 ++ar7leQ9Zbf/WzIs7jKvryptg8wJ4MifHv4xqro=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A6F4F801F7;
	Fri, 19 Mar 2021 23:08:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 493D1F8021C; Fri, 19 Mar 2021 23:08:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0917EF800E0
 for <alsa-devel@alsa-project.org>; Fri, 19 Mar 2021 23:08:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0917EF800E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="R+C3zMdM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616191717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AXQkITVK9aVWL6VkpZfrauceW8JNmaoJTH/pyOcd9RM=;
 b=R+C3zMdM9dlMrdJ7sl/+VEhiZ5cxVbGlQdsX7vPbZoBX1w46/WjZTtSvetshQEr3Lp4dro
 40wjQMBws1sSlShWD8h55/3IOO95d30yRlqvyHivFBKS4NzjLwPLRKcmjTzycSy73JNiwW
 URkU22IrIOCXXB2qnCb5pZZCckL9raw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-iPKA1WHAM2yUwLM3DCuRIQ-1; Fri, 19 Mar 2021 18:08:35 -0400
X-MC-Unique: iPKA1WHAM2yUwLM3DCuRIQ-1
Received: by mail-ed1-f69.google.com with SMTP id o15so23578054edv.7
 for <alsa-devel@alsa-project.org>; Fri, 19 Mar 2021 15:08:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AXQkITVK9aVWL6VkpZfrauceW8JNmaoJTH/pyOcd9RM=;
 b=fuaKtBIjL1mf6sQBDV9LvSsr/bM6AMIrb69cZfMuGr+kamCUkoD177WwSF8QUHBASd
 WTMD7vKLXBhhD2LzmYC2jMIJxy7qb3hUTPaShE8Y/B6E4bn2H7toJt0sEwSkGoutprf5
 UCIBV2ZrUKeE97jjWda5JypabGUHwpu76EjJuIblQL35FRa9l+XIcx1ZhkKP6AlnT8/p
 RODf+GGp8oTC5hMJRFgX/jG5tZbnQp61N/L14t5Y5vOxBWf7s+1Ys56E+3KHVsIA4m2Y
 vstCktHT3PXPbSDTt4SnxcOS+kSDN/hMKoqj3UJL1q3PNsPfZAEhEn0SeX+8nlmOOMZP
 R6gw==
X-Gm-Message-State: AOAM531Zppj8xnEyMd+f+KYbTYQ+W8RcvhZGzE/Q45Ker4oqBK02a41h
 +WeNr2ZPbAqZGOD/F2CxVQutPmyOAcVUaaX0xKUlmxwkmZF+2KM8VaI2KvGMWKNtKW6FYkMKNpW
 Y+r8YPLpmuAmELhpSBSoKOOl8hlt7Q9K7zFmAaFSEW4FjhnySW7iLJTasHpllHaEVQ5mVg/4I8V
 Q=
X-Received: by 2002:a05:6402:1393:: with SMTP id
 b19mr12136732edv.333.1616191714456; 
 Fri, 19 Mar 2021 15:08:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy57EA0b7Oaag/5dvAJj6vw/Wo9k55sOoOYD5xyIhrcS3xhs2/vTPlP2l/b7x7Kn/w+cW9o5w==
X-Received: by 2002:a05:6402:1393:: with SMTP id
 b19mr12136707edv.333.1616191714243; 
 Fri, 19 Mar 2021 15:08:34 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id z9sm5013307edr.75.2021.03.19.15.08.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 15:08:33 -0700 (PDT)
Subject: Re: [PATCH v4 6/6] ALSA: led control - add sysfs kcontrol LED marking
 layer
To: Takashi Iwai <tiwai@suse.de>
References: <20210317172945.842280-1-perex@perex.cz>
 <20210317172945.842280-7-perex@perex.cz>
 <a3ddb881-6580-cd25-ef3c-734e686e6942@redhat.com>
 <s5h5z1nf47r.wl-tiwai@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <3820909c-29ce-9f3f-d1e6-c4611e06abe4@redhat.com>
Date: Fri, 19 Mar 2021 23:08:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <s5h5z1nf47r.wl-tiwai@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: ALSA development <alsa-devel@alsa-project.org>
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

On 3/19/21 6:22 PM, Takashi Iwai wrote:
> On Fri, 19 Mar 2021 17:34:39 +0100,
> Hans de Goede wrote:
>>
>> Hi,
>>
>> On 3/17/21 6:29 PM, Jaroslav Kysela wrote:
>>> We need to manage the kcontrol entries association for the LED trigger
>>> from the user space. This patch adds a layer to the sysfs tree like:
>>>
>>> /sys/devices/virtual/sound/ctl-led/mic
>>>    + card0
>>>    |  + attach
>>>    |  + detach
>>>    |  ...
>>>    + card1
>>>       + attach
>>>       ...
>>>
>>> Operations:
>>>
>>>   attach and detach
>>>     - amixer style ID is accepted and easy strings for numid and
>>>       simple names
>>>   reset
>>>     - reset all associated kcontrol entries
>>>   list
>>>     - list associated kcontrol entries (numid values only)
>>>
>>> Additional symlinks:
>>>
>>> /sys/devices/virtual/sound/ctl-led/mic/card0/card ->
>>>   /sys/class/sound/card0
>>>
>>> /sys/class/sound/card0/controlC0/led-mic ->
>>>   /sys/devices/virtual/sound/ctl-led/mic/card0
>>>
>>> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
>>
>> Thank you so much for this patch.
>>
>> I've given this new version a try, dropping my sound/soc/codecs/rt56??.c patches to set the access-flags directly.
>>
>> And with these 3 lines in /etc/rc.d/rc.local I get nicely working control of the mute
>> LED build into the (detachable) USB-keyboard's mute hot-key:
>>
>> modprobe snd_ctl_led
>> echo -n name="Speaker Channel Switch" > /sys/class/sound/card1/controlC1/led-speaker/attach
>> echo -n name="HP Channel Switch" > /sys/class/sound/card1/controlC1/led-speaker/attach
>>
>> This needs to be replaced by some UCM profile code doing the equivalent of course,
>> but for a proof-of-concept test of the kernel API this introduces the above will do.
> 
> IMO, that's the question: how we'll enable this in future.  If the
> binding of the control/mute mapping is provided via UCM, it's supposed
> to be changeable by each user.  Then the current sysfs permission
> doesn't fit.  OTOH, if it's 0666, it's accessible to all users even
> remotely, which is worse than the access with the normal sound device
> file.  Or if it's supposed to be changed via udev stuff or systemd?
> Or is it just for debugging?
> 
> Through a quick glance over the series, I'm fine to take those
> patches, but the only concern is the sysfs entries.  Basically, once
> when we use sysfs entries, it's set in stone.  So we should be very
> clear about our strategy how to deploy the control/mute mapping
> regarding using those sysfs entries.
> 
> OTOH, if the interface is thought for debugging or development
> purpose, it could be done in debugfs, which we can keep playing in
> further development, too.
> 
> And, BTW, the mute LED mode setup doesn't have to be sysfs entries;
> we'd need primarily only the flags for inverted LED behavior, and
> those are only two, so it could be simply module options.  Then it's
> even easier for users to set up than tweaking sysfs entries.

The flexibility offered by this new sysfs API is necessary for the ASoC
codec drivers, because Mark does not want to have which controls are
tied to the LED triggers hard-coded inside the codec drivers.

So as Jaroslav mentions in his reply, the plan is to have the UCM
profiles contain commands to setup the LED triggers to this new
sysfs API.

Regards,

Hans

