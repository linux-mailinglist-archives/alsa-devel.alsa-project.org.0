Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDEC3876EE
	for <lists+alsa-devel@lfdr.de>; Tue, 18 May 2021 12:50:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F21F16E4;
	Tue, 18 May 2021 12:49:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F21F16E4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621335048;
	bh=Wm/TfblM38jkPN4eSrLnNfculnjTU0+UlUI7GtF3Mqo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nUeKwq+eiWu7sBLl7RJIFJO3u2v51yYwaQnyxDdOfNakFIIwpW5cvQ/c8gzjI9jeO
	 whgZALfW5/SKmvS15XUyk4B7zLd/wSq1aHwiXPilz/nBU1m62pxWpzw4+HEbxPh5BZ
	 3qTRlnU0maf0Zk+76vG+QCI89yhNt4GdFzmBDP0w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D822DF8012C;
	Tue, 18 May 2021 12:49:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBD3FF80217; Tue, 18 May 2021 12:49:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1DAF5F80139
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 12:49:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DAF5F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Kqy/kJv8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621334952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c9o82/t1aU9A0RyJMcIxIuK9ctk3HZPsg/UH7WfdZC0=;
 b=Kqy/kJv8NwaUPbyFInS0p3MNt6uyqnfbVvcJpLogZtGLVgVxc8IIHsdiAgIHuFl0AG8DYM
 ah3jVfdGaZnsUpVbTWd2ewrnAs0RO2ipzDYoaSRbtUE1vwLVEm7h1qd/2VWjRK921/0y46
 l/mx21skmntfXUU4cf0GLmSeHmdmYzM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-HAC1FHBPNOqZhZUNfTs09w-1; Tue, 18 May 2021 06:49:11 -0400
X-MC-Unique: HAC1FHBPNOqZhZUNfTs09w-1
Received: by mail-ed1-f69.google.com with SMTP id
 r19-20020a05640251d3b02903888eb31cafso5534007edd.13
 for <alsa-devel@alsa-project.org>; Tue, 18 May 2021 03:49:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c9o82/t1aU9A0RyJMcIxIuK9ctk3HZPsg/UH7WfdZC0=;
 b=CNQmysgppoq2ysnRBsVhXHD+gexEFkc1sLgkIToixBEp9UHLsmyLBMouRrltegRghD
 upt3sQU4Q5UN6Ll0+RE9kIsrwLUVPelC792+XIb5UAt9EzUyqohzo4xFrZu5OE+0Ojel
 1CGeBjNX+ZyijrLgU4bj3/3yAwHF+cT2y11wqUxcmNI9e/UZSbKgzuqTv6qcHnvtHOkL
 bveu0xTi5LynYzhcSrfIEidzOrl9iUE5BD/4enrQ4+P9iE8p8pimszKimbBs+FgA/TuO
 TQ1SoTrmfz1Ip0xlimQtrtPtSuTn/A109qOuW57BNxUqXUA0zklUbRZcXARZ3KthbzJc
 Rv5Q==
X-Gm-Message-State: AOAM531AV+T1ltvpueJoGSHoUNgNDDt+EEfmw55RcjmE2+Ia0PJVfZ8c
 XVH1Zgp3TtYTQwlkJusnoNEBQWzBFVao1f0GD/qFeNjuwFD23xIPQmrIVErImc/VuDsa+WI4w/f
 JR3HGtrZbi+gqm8UbuUqsF/0=
X-Received: by 2002:a17:906:680d:: with SMTP id
 k13mr5386889ejr.371.1621334949973; 
 Tue, 18 May 2021 03:49:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyh1mcxlm43khVavmHz8Zmh3/+pHSIR9oAwFtuz2qwrtj+DWSf260PGu/51LsXVMMut+7eB4A==
X-Received: by 2002:a17:906:680d:: with SMTP id
 k13mr5386865ejr.371.1621334949787; 
 Tue, 18 May 2021 03:49:09 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id n13sm2080198ejk.97.2021.05.18.03.49.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 03:49:09 -0700 (PDT)
Subject: Re: [PATCH v7 1/2] platform/x86: dell-privacy: Add support for Dell
 hardware privacy
To: "Yuan, Perry" <Perry.Yuan@dell.com>,
 "pobrn@protonmail.com" <pobrn@protonmail.com>,
 "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
 "oder_chiou@realtek.com" <oder_chiou@realtek.com>,
 "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
 "mgross@linux.intel.com" <mgross@linux.intel.com>
References: <20210412091919.27608-1-Perry_Yuan@Dell.com>
 <8176ceda-cdbf-b733-128d-0766eb6d180d@redhat.com>
 <SJ0PR19MB45288D5EFF2BD8B9926E40DD84589@SJ0PR19MB4528.namprd19.prod.outlook.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <3657cfda-02d8-85b7-a9d2-257ded63e175@redhat.com>
Date: Tue, 18 May 2021 12:49:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <SJ0PR19MB45288D5EFF2BD8B9926E40DD84589@SJ0PR19MB4528.namprd19.prod.outlook.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 Dell Client Kernel <Dell.Client.Kernel@dell.com>,
 "mario.limonciello@outlook.com" <mario.limonciello@outlook.com>
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

Hi Perry,

On 5/6/21 11:48 AM, Yuan, Perry wrote:
> Hi Hans.
> I changed the driver in V8 as your comments.
> Just one Kconfig change , It will cause some built error .

<snip>

>>> diff --git a/drivers/platform/x86/dell/Kconfig
>>> b/drivers/platform/x86/dell/Kconfig
>>> index e0a55337f51a..05d124442b25 100644
>>> --- a/drivers/platform/x86/dell/Kconfig
>>> +++ b/drivers/platform/x86/dell/Kconfig
>>> @@ -204,4 +204,18 @@ config DELL_WMI_SYSMAN
>>>  	  To compile this driver as a module, choose M here: the module will
>>>  	  be called dell-wmi-sysman.
>>>
>>> +config DELL_PRIVACY
>>> +	tristate "Dell Hardware Privacy Support"
>>> +	depends on ACPI
>>> +	depends on ACPI_WMI
>>> +	depends on INPUT
>>> +	depends on DELL_LAPTOP
>>> +	depends on LEDS_TRIGGER_AUDIO
>>> +	select DELL_WMI
>>
>> DELL_WMI is not a helper library which can be selected, please use depends
>> on here.
>>
>> More in general I'm a bit worried about the dependencies being added to dell-
>> laptop.c and dell-wmi.c on the new dell-privacy-wmi.ko module.
>>
>> What if e.g. dell-laptop.c gets builtin while dell-privacy-wmi.c is a module.
>>
>> Then we have dell-laptop.c depending on the dell_privacy_present linker-
>> symbol, but that symbol is in a module, so the main vmlinuz binary will fail to
>> link due to that missing symbol.
>>
>> To fix this you need to add:
>>
>> 	depends on DELL_PRIVACY || DELL_PRIVACY = n
>>
>> To the Kconfig sections for both DELL_WMI and DELL_LAPTOP
> 
> If I add "depends on DELL_PRIVACY || DELL_PRIVACY = n" to both DELL_WMI and DELL_LAPTOP
> The compile will report error "recursive dependency detected"
> I do not think the dell-laptop will be builtin option as we know.
> 
> I am confused that why the symbol will be failed to link like that ?
> because the compiler can find the dell_privacy_present which is defined in one common header file.

The issue is that e.g the dell-laptop code may be builtin into the kernel
(so part of the vmlinuz file) while the dell-privacy code could be build
as a module (so as a dell-privacy.ko file) in this case building the vmlinuz
file will fail at the linking stage since the dell_privacy_present() symbol
is not part of vmlinuz where as the dell-laptop code which needs that
symbol is part of vmlinuz.

The reason why these circular dependency issues trigger is because the
dell-privacy.ko module actually does not depend (at a symbol level) on
dell-laptop / dell-wmi at all. It is the other way around dell-laptop
and dell-wmi use symbols from dell-privacy, where as dell-privacy can
be loaded into the kernel without dell-wmi / dell-laptop being loaded
just fine.

Now there is a functional dependency where dell-privacy does not do much
when it is not called form the event handler in dell-wmi, but this is not
a code-level dependency.

I've been thinking a bit about this and I've come to the following
conclusions:

1. dell-privacy should not depend on dell-laptop at all, the only reason
dell-laptop calls into dell-privacy is to not register a mic-mute LED if
dell-laptop is not build at all then it will also not register the mic-mute
LED, so the dependency of dell-privacy on dell-laptop can be dropped.

2. Building dell-privacy without also building dell-wmi is a different story
this will work fine, but the dell-privacy module will the mostly just sit 
there (it will provide the sysfs files) without really doing anything.

Also since dell-wmi will depend on dell-privacy when it is enabled,
dell-privacy will always need to be loaded when dell-wmi is loaded.

The dell-privacy code really is an extension to / plugin of the dell-wmi
code; and since the 2 always need to be loaded together anyways, it would
be better to put the code in a single kernel-module (less overhead loading
modules that way) and this also neatly solves the builtin vs module
dependency issue.

This way we can simply make DELL_PRIVACY a boolean option which controls if
privacy support gets added to the dell-wmi module or not, but since it is
now built into the same module (if enabled) we can never have the case where
one part is built into the kernel and the other into a .ko file.

I'm currently preparing a set of changes which implements this, because
this is sort of hard to describe with words and I hope that providing a
patch implemeting the suggested change make things a bit more clear.

I'll send another email when the changes are ready.

Regards,

Hans

