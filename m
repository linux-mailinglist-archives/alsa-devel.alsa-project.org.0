Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 709796509BA
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Dec 2022 11:01:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED1DD2BF1;
	Mon, 19 Dec 2022 11:00:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED1DD2BF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671444080;
	bh=7awm6Tdv0Cg90AV05AVXX31DPzvwyGO1+48zwyR78ko=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=opet8ds3ju3mqqxcdzzkINXXptad5tKiq5AyawB+Sv8o006yaJJqaVSoXeqXHn0Xi
	 Gkr5G+8xvmXPsLrYu9eoIsk38YEMTSIWSuCHltb2m/Wkx7RvxYAydRAiSEu93Z/wTp
	 VhP6TFh2P48Jfgt0gqyNrhhBWswAqhkXXU23XIIo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBEF4F8047B;
	Mon, 19 Dec 2022 11:00:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E701F8025E; Mon, 19 Dec 2022 11:00:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9530DF8025E
 for <alsa-devel@alsa-project.org>; Mon, 19 Dec 2022 11:00:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9530DF8025E
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=MFQLiSdc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671444016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2L77LTJlh+TWM02KCjT0QXgg2/YWKeH8U+AND45/ryw=;
 b=MFQLiSdc1IcKzJaS7dcQVx87joIgL21v11sMcyK1kXTl6xsLKRmyU1RJRP3A4/jjR8xGv/
 SAz7DsFFq0Qx376e7/KSmSnmTopVp9duvG3jqvpSc/VzvbKhbSdJp1jBegRcYe5IrIoTAy
 carhcYhbMtCUwNNQ34ripZgkkp1UesY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-154-iiigsdNpOpKQX4XEBUTY3Q-1; Mon, 19 Dec 2022 05:00:14 -0500
X-MC-Unique: iiigsdNpOpKQX4XEBUTY3Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 w15-20020a05640234cf00b0046d32d7b153so6119614edc.0
 for <alsa-devel@alsa-project.org>; Mon, 19 Dec 2022 02:00:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2L77LTJlh+TWM02KCjT0QXgg2/YWKeH8U+AND45/ryw=;
 b=2KLd73U4aYJHU3X75b2AKcAIHYyWM1Fzeiu4a86CtE2fsmU6dijZwjn7QPI5gS4kUD
 JkXrWqjmGvmiqjmrLj/tk4gV+gMx38MCIdUmJqZeK/eRSFhxVyw6OEQ4CwpexCF9reXZ
 ICgjuACLQrt7pa/uoiEEdpzSUIC+C7ZwuGcT8+QQMISsf4OOo1OyHbkxeLNpVEtQk425
 xWInEAPfgpEzszSH8VY2mk8tVKqqOXH4S2SR5KZxYltI4lJg90L4Jnnyh8vqWU2i3XsP
 /t7uPbq12JVVFqdA0iqwnFPNlez1x2bohzKQvl4p4i8nGbEFz2eu0bq4arnipRyILkHL
 NBTQ==
X-Gm-Message-State: AFqh2kq7sdNuvn2rFqhlYlgPSoT8BKD1ej5AERXR9rsR4hyOTf5G6mYB
 WR7JLpETBz0OpOjK0t43klANzhi8peLhZPI0TzuwWNbu2Mt+eceHli/sMJQiWZuk2Bmpc5f6SWt
 4KfZjropCC8+V3ep+K/k5V84=
X-Received: by 2002:aa7:cc89:0:b0:468:3d69:ac81 with SMTP id
 p9-20020aa7cc89000000b004683d69ac81mr15809198edt.29.1671444013034; 
 Mon, 19 Dec 2022 02:00:13 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtoTXdXcGAP5qPieS3+Mkh48xVqSW7mBaIUsc6jBbyxolMG0ylpPbaR5izWlBEeOOcmfbMl7Q==
X-Received: by 2002:aa7:cc89:0:b0:468:3d69:ac81 with SMTP id
 p9-20020aa7cc89000000b004683d69ac81mr15809191edt.29.1671444012868; 
 Mon, 19 Dec 2022 02:00:12 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 g7-20020aa7d1c7000000b0046aba24985esm4146635edp.91.2022.12.19.02.00.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 02:00:12 -0800 (PST)
Message-ID: <572159b3-a1a4-8735-d435-ea574c07851f@redhat.com>
Date: Mon, 19 Dec 2022 11:00:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: =?UTF-8?Q?Re=3a_=5bregression=5d_Bug=c2=a0216818_-_The_microphone_m?=
 =?UTF-8?Q?ute_led_not_working_after_linux_6?=
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <bf52f4c5-5cca-26d7-7fb2-ac8ecb5b24c5@leemhuis.info>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <bf52f4c5-5cca-26d7-7fb2-ac8ecb5b24c5@leemhuis.info>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: LKML <linux-kernel@vger.kernel.org>, alsa-devel@alsa-project.org,
 plum <plumerlis@gmail.com>, sonic82003@gmail.com,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On 12/19/22 10:17, Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker speaking.
> 
> I noticed a regression report in bugzilla.kernel.org. As many (most?)
> kernel developer don't keep an eye on it, I decided to forward it by
> mail. Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=216818 :
> 
>>  sonic82003@gmail.com 2022-12-18 08:52:32 UTC
>>
>> The mic mute led of my ThinkPad X1 Carbon Gen 9 doesn't work anymore after updating linux to version 6.
>> I can still turn it on by  running 
>>
>> echo 1 > /sys/class/leds/platform::micmute/brightness
>>
>> With linux-lts it still works fine.
> 
> See the ticket for more details.
> 
> Note, I found a similar report that (despite my attempts to prevent
> things like this from happening) fell through the cracks here:
> https://bugzilla.kernel.org/show_bug.cgi?id=216355
> 
>>  plum 2022-08-13 02:11:01 UTC
>>
>> I upgrade to kernel 5.19.1 but found my thinkpad x1 carbon 2021's mute led stop working.
>>
>> Function is okay but LED won't light up.
>>
>> Back to kernel 5.18 and it's normal and working again.
>>
>> Fedora 36 64 bit 
>> Gnome-shell 42
> 
> From a quick research it looks to me like this is an issue for the
> sounds maintainers, as the LED itself apparently works. If that is
> something for the platform people instead please speak up.

Thanks for bringing this up, we recently hit this in Fedora too
and we have a fix/workaround there. Let me copy and paste what
I just added to bko216355 :

This is caused by a behavior change of the kernel code controlling the LED to only turn on the LED when all inputs, including e.g. the jack mic input are turned off in the alsa-mixer settings.

But most userspace code only turns the mic which it is actually using on/off when you hit the mic-mute hotkey.

Also see: https://bugzilla.redhat.com/show_bug.cgi?id=2134824

Which is the same bug.

There is a set of fixes available in the form of an alsa-ucm update which tells the kernel to ignore the state of the jack mic input restoring the old behavior:

https://git.alsa-project.org/?p=alsa-ucm-conf.git;a=commitdiff;h=79a8ec44d3dcf097f4a4492c506cbcf338324175
https://git.alsa-project.org/?p=alsa-ucm-conf.git;a=commitdiff;h=9ce9ddb4a84fb467602b716575ea1d8f2bab0c39

Regards,

Hans


