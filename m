Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E70D1AAAF3
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 16:56:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9EA4825;
	Wed, 15 Apr 2020 16:56:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9EA4825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586962615;
	bh=2pdEJSKHf8MPZcsGwYWfNh2yt8/VEr0ylVnNNs3hPug=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Nwp1hJhsCMWN4fxQqdQZwhxkrSILp5arugdE+a2FL4zbIHvmVfXCr8avUL4y7MDND
	 54v5TsWvEXEpoukiaqBSPBD7nYNCX9Cd5tF/y0cuoKxJ/+dqIVTiccQt/4b/vcWSVf
	 qjkmtihGD3Qu8eF/MY8o7Yek9NsY0pDEoWQPuxW0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3757F80229;
	Wed, 15 Apr 2020 16:55:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DBB5F80245; Wed, 15 Apr 2020 16:55:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 KHOP_HELO_FCRDNS, SPF_HELO_NONE, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0476F80115
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 16:55:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0476F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="YqAtwUu2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586962501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2pdEJSKHf8MPZcsGwYWfNh2yt8/VEr0ylVnNNs3hPug=;
 b=YqAtwUu2A/XNy3jGCd9A9Bv2FsqKiwFKpUI7bX2gwU+WUABnAmprYJh/6/7qNjeFY4OOhW
 pNunJVsBbje3h0WGtB/uYS9dYAJiSCoamFbcXdu8l27lUMLHpaHO0bEOK67bdJPTY7TGQk
 X6SF725MYTb7sQW4cV7dJMosotVI/I8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-RVdbBeWtMpS4_M37QIklwA-1; Wed, 15 Apr 2020 10:54:56 -0400
X-MC-Unique: RVdbBeWtMpS4_M37QIklwA-1
Received: by mail-wm1-f71.google.com with SMTP id y1so5897824wmj.3
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 07:54:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4Z3Z1eorx2LwhJZCEaKpIw7Et/DDHWLyQzNaVssy5vk=;
 b=o1w6M6G5suoRBE43ms5MVeIiTCTHopJNf7gYK0NmfVK/NBLVBy+siagxmhuJ0btGX9
 02ycGLfb3JvJMxLCMgf3TpypD3mOW5f01Oo7PW/+wzqkQhrrITLvWgWqcHNCMIcFIucP
 NY/zjvYrzLU+QVHrXSM7Ji6vF8XPAvD4cme697cOxS2prntT2gboEf4eQSVF4D02ef34
 xNGcN7VGcnyPFL+KoTqNQAUFdJ7uSrCUqYign9WbTN5kcZ8cNAm/c7aFMusXBz44iIyQ
 pr/iirl2juMxObEd6tSbSIOIq1Mkt6+3JghdmUNAJg/YNL78hXV6pos8yoOx47woD17t
 HxZg==
X-Gm-Message-State: AGi0PuZ5ZYvJDRfAJ8kEE8+v+QtaNbxGDJswgakqhbZ4TvamD7oluQ5u
 252lIiu7uCShfOuD2mmGECBIT37BOfCdYRSiU/Tf0aVvlFz6X0QR3pwo86vVTZkrQYfcLQa4Ey1
 hkfQZYzBAEKF9CYzKft/OXFQ=
X-Received: by 2002:a7b:c842:: with SMTP id c2mr5954766wml.154.1586962495348; 
 Wed, 15 Apr 2020 07:54:55 -0700 (PDT)
X-Google-Smtp-Source: APiQypLC7h1tis961uANfyfeuEt/4QvynNNo5KdrYVqYIGn1oDYq2QD7CwbJoADcY63DsHHaKYktjw==
X-Received: by 2002:a7b:c842:: with SMTP id c2mr5954750wml.154.1586962495072; 
 Wed, 15 Apr 2020 07:54:55 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id b4sm18745962wrv.42.2020.04.15.07.54.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Apr 2020 07:54:54 -0700 (PDT)
Subject: Re: [PATCH] bytcht-es8316: fix Speaker or Headphone no sound if
 enable Mic or Headset
To: youling 257 <youling257@gmail.com>
References: <20200413145957.22459-1-youling257@gmail.com>
 <ae69c1b0-b347-4366-4bb0-383aed69c4b1@redhat.com>
 <d6146d62-a20a-f6a0-64f0-65cea7253948@perex.cz>
 <CAOzgRdbgOykctcteVMLJqqyeXwww2ekzUrbzLbu0jtCoU_5Xgg@mail.gmail.com>
 <2c1d70d1-6a77-9d06-96df-86c602c1e2e8@redhat.com>
 <CAOzgRdYsy3MZCO4NvuBL_-SDpSyiLrnc5oesfMhqHdeg+zAhgA@mail.gmail.com>
 <21488b92-601f-9acf-09fd-4537c8eb9b1a@redhat.com>
 <CAOzgRda2vkNzibgwMzcHFWBryVddn9WyjmpVu7swVa+JzecpwA@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <759c6592-880e-93d0-66a6-598089695ec9@redhat.com>
Date: Wed, 15 Apr 2020 16:54:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAOzgRda2vkNzibgwMzcHFWBryVddn9WyjmpVu7swVa+JzecpwA@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org
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

On 4/15/20 4:50 PM, youling 257 wrote:
> 2020-04-15 16:45 GMT+08:00, Hans de Goede <hdegoede@redhat.com>:
>> Hi,
>>
>> On 4/15/20 10:18 AM, youling 257 wrote:
>>> 2020-04-15 16:04 GMT+08:00, Hans de Goede <hdegoede@redhat.com>:
>>>> Hi,
>>>>
>>>> On 4/15/20 8:26 AM, youling 257 wrote:
>>>>> boot enter ubuntu no sound at all if EnableSeq.conf disable all outpu=
t.
>>>>> =E2=80=9C The PA should activate HiFi verb only once.=E2=80=9D i don'=
t think so.
>>>>
>>>> Which version of pulseaudio does the Ubuntu you are using have?
>>> pulseaudio (1:13.99.1-1ubuntu2) packages.ubuntu.com/focal/pulseaudio
>>
>> Ah yes then you are likely hitting the bug I was talking about.
>>
>> Can you please file a bug against Ubuntu for this?
>=20
> open a bug, https://bugs.launchpad.net/ubuntu/+source/pulseaudio/+bug/187=
2970

Great, thank you.

Regards,

Hans

