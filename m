Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECED6342893
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Mar 2021 23:15:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B6A21676;
	Fri, 19 Mar 2021 23:14:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B6A21676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616192122;
	bh=NT///SSuqxpZ/xHyNnkfINV2L63Wx/felP60NKzOLpE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SRXHzfqharv0857rKW+VsNVKbKInmlensSBY+k0UrS+bVtbS9RRd/088oBeIhEzYt
	 fQYhn8mYlT+hh6WFgJ/M1DPKmj7J3Htlk4Un/zt/GBcZ5RC8KzMhe0ItNdJG6dzEgG
	 TvT9AAgYhFbtXQLejYP8ACVR32ILOGqypVYPjg3c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B66EF8023C;
	Fri, 19 Mar 2021 23:13:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65ADEF8021C; Fri, 19 Mar 2021 23:13:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26A99F800BB
 for <alsa-devel@alsa-project.org>; Fri, 19 Mar 2021 23:13:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26A99F800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="E0z9OM6u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616192023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sUa60VJtnfGo7ykCMtbnh4yegfNWoYwImulHZIbSR+A=;
 b=E0z9OM6umiP+TkYSP0qNuxMrgnFn4QMBOksGZ0R4ovDPVmhz5QHbeKpAtbefanrQlwsKNa
 R8BFxbEBi9ZPgvp9hcYYwx+LH7jK9cFGH1NtHSH7OZPNLSe63HLIVdOLdvnlEJXcbEn9cR
 q8HfuSUhgoCicGFBTM32u82RutWmlno=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-0Y3cEVgIMOSe-IafZPtUCQ-1; Fri, 19 Mar 2021 18:13:42 -0400
X-MC-Unique: 0Y3cEVgIMOSe-IafZPtUCQ-1
Received: by mail-ej1-f72.google.com with SMTP id mj6so18879259ejb.11
 for <alsa-devel@alsa-project.org>; Fri, 19 Mar 2021 15:13:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sUa60VJtnfGo7ykCMtbnh4yegfNWoYwImulHZIbSR+A=;
 b=WT+T6ofKy56/lGTpk7YdEizanRQmAwJ9vhHD76yz5osODnhzjGB1L2iNNE4/YmeNpJ
 fH9kX2upJI3iZpOlNx+JUmdgt0wy8mmd2lxI/wYAxGH+4Sa8pWijR4XswbY7p58NU8ee
 QTQbi7DdijDCRHs6+L9Eg1LM05JUBkTFbZRVQUmTGmWAKzNptwyhhxWpYcgsuy2hrMmy
 zO83t8++lDYzaLX38mzY22m9Atz/FNZW8RdZegu1nvP/Kbs4B+LK8r8BcVeN2b4BAusJ
 IbhA0F9Wx9IZr7Y2ad4O5QHqvsQvZcqNbRWvnNbWK2glmtMoOR7lz35retocdw58ngmp
 CSzQ==
X-Gm-Message-State: AOAM531Jn4U2YsraWo9fiswwmE02KSX3LdKTj5u/1p8h/W7T6sdLEsrR
 RhQScn5G4E4mTr19rdoefAeAxlf11g4Bak2rFbkl3a2akblOgkywsQHtL5YaSu4xmnBU/ksORsQ
 8APl5lYCKUbtDNC0rkb6G+y0=
X-Received: by 2002:a05:6402:1a4f:: with SMTP id
 bf15mr12319620edb.304.1616192020990; 
 Fri, 19 Mar 2021 15:13:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxAuhJlQ1eKoUp7k8k5x/ofek9TzDyvcI+MJz0PFucfHb++Ouwyoqn1KgdH27faNxskhIOBYg==
X-Received: by 2002:a05:6402:1a4f:: with SMTP id
 bf15mr12319608edb.304.1616192020814; 
 Fri, 19 Mar 2021 15:13:40 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id v8sm4834324edx.38.2021.03.19.15.13.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 15:13:40 -0700 (PDT)
Subject: Re: [PATCH v4 6/6] ALSA: led control - add sysfs kcontrol LED marking
 layer
To: Jaroslav Kysela <perex@perex.cz>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20210317172945.842280-1-perex@perex.cz>
 <20210317172945.842280-7-perex@perex.cz>
 <a3ddb881-6580-cd25-ef3c-734e686e6942@redhat.com>
 <ba480ab5-80b7-d911-052b-53b1e8d43695@perex.cz>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <539b0f83-406c-c015-9506-47ff77950c8c@redhat.com>
Date: Fri, 19 Mar 2021 23:13:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <ba480ab5-80b7-d911-052b-53b1e8d43695@perex.cz>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>
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

On 3/19/21 7:11 PM, Jaroslav Kysela wrote:
> Dne 19. 03. 21 v 17:34 Hans de Goede napsal(a):
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
> I added already the FixedBootSequence support to alsa-lib and alsactl and the "sysset" sequence command.

Oh, nice.

I'll look into testing the FixedBootSequence + sysset changes to replace my rc.local hack.

One thing still seems to missing from the puzzle though, what about the "modprobe snd_ctl_led",
I guess we only want to do that on systems where that module is necessary, which means also having
a command for that in the FixedBootSequence ?

I guess we can use the "exec" keyword in the FixedBootSequence to do the modprobe ?

> But looking to this command now, it may be better to rename it to "sysw" ("double s" does not look so great).

"sysset" is fine by me, but so is "sysw" .

Regards,

Hans

