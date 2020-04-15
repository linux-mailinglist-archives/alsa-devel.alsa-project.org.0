Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D21DF1A9348
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 08:32:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 800751680;
	Wed, 15 Apr 2020 08:31:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 800751680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586932329;
	bh=UMZWS4rmA48CcZdr5MmCRqrm3XrMtE+HCKm/ggk65N0=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FPzB6P4HOn0/Je0N6IH+nDd+udZETzwxUtnYDkMtrXK0j4wEYW4l59k2in8B5T0S5
	 hOv3S/ix37tlVaXleX7oU66QjPgbs1vc8NNFRPK0EoEaKgcefq+HQ44Fr6THVdAJai
	 JVx14kIucwIaPtGn5kLoj720CBF/9Gi0RD5xHoAY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADA34F800ED;
	Wed, 15 Apr 2020 08:30:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E1B9F80245; Wed, 15 Apr 2020 08:30:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DACDF800ED
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 08:30:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DACDF800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="iEm4uxcI"
Received: by mail-io1-xd41.google.com with SMTP id b12so15943564ion.8
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 23:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ls1XhUem9yTYUvPdkwlL5SvgaksFH/LnsF6FBq0ImXU=;
 b=iEm4uxcIcxLnug55av4tiGWuBfSunaU7SMHn3+Qj2YSYU8XsgE61qgnYry4JTtYPQH
 sbNNjqpoLLKeaWCwZfLFAJsDb3hrilbmgF7FfO+7u6XrD+YRPZXzp5lHAWsFDlVwmI3y
 Sf+aIbTFKtiPwBUvZpMBPm2vQFT3MoWKfyyjjHY6G0XN6Odo33zpz21Z3whmlFDcO7Xr
 8x8Nm7EXR2deNcMpi8JSQKJR36svuLqZ0uFjXxqMOBPqx+pPGSo0oWwxPCgyAfaN6xex
 zcXfeZIOUIX5bu7nDrgeiLVF8Xa42m4GPhdJI12/YktvkiuNBOGBJ8BoYIi4bGt5G8hz
 a5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ls1XhUem9yTYUvPdkwlL5SvgaksFH/LnsF6FBq0ImXU=;
 b=i5+HMmuBn9QU8FL+LXm0lQxcJxzdLZCmvbaWUodHy9Ts8w/7nYvVbnM6VTJJzcCRcW
 txNpTGP2/wsLRruwNvh54wSpwXFTuOBpftyWphT4YdmFJCQVlQLM0ebQkbKVmh7zT27q
 ZLxyJ4Uaz6Ieeh3rduyD7IpD1n8NC+JG0kyXQkihRRSJrKTPqZgB8GGbGTOIcv963Cjx
 +wT+wcsTwfu843ASxsYDZY10OWMvdXqTeqwXIzQ+dkXY//BrPH9gzX8HeXbqNIDOB20N
 Q7+uY6QKA6K27fYFJcEWi8+LotTuCbQeEyobMuQENNVs/OZMupQIy7JuRomtr+ScFKVs
 3oew==
X-Gm-Message-State: AGi0PuYxJs13kItZmhiRnLGt5DjApoXuoIYXm3ucF9Wl6alptIHn4uo0
 vsrfLd0IPpQBeuYx+jMwhSi/QUPr3Qp6y39Zl/4=
X-Google-Smtp-Source: APiQypIgLTxl+w9IuwS+AiSlcsxnN9qSocoMEthCz7iDhY7eB8Iqn0JU5wGrPuphr45YWmPCmPK/MnhNc1ko8N+wQnE=
X-Received: by 2002:a02:40c9:: with SMTP id n192mr15821405jaa.91.1586932214123; 
 Tue, 14 Apr 2020 23:30:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:a58b:0:0:0:0:0 with HTTP; Tue, 14 Apr 2020 23:30:13
 -0700 (PDT)
In-Reply-To: <CAOzgRdbgOykctcteVMLJqqyeXwww2ekzUrbzLbu0jtCoU_5Xgg@mail.gmail.com>
References: <20200413145957.22459-1-youling257@gmail.com>
 <ae69c1b0-b347-4366-4bb0-383aed69c4b1@redhat.com>
 <d6146d62-a20a-f6a0-64f0-65cea7253948@perex.cz>
 <CAOzgRdbgOykctcteVMLJqqyeXwww2ekzUrbzLbu0jtCoU_5Xgg@mail.gmail.com>
From: youling 257 <youling257@gmail.com>
Date: Wed, 15 Apr 2020 14:30:13 +0800
Message-ID: <CAOzgRdbWCCVB_UWe8s0crWkWhDDqGTy+9nd2oK9UcRaGLDLvxQ@mail.gmail.com>
Subject: Re: [PATCH] bytcht-es8316: fix Speaker or Headphone no sound if
 enable Mic or Headset
To: Jaroslav Kysela <perex@perex.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org
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

please remove es8316 cx2072x rt5672 Disable all inputs / outputs.

2020-04-15 14:26 GMT+08:00, youling 257 <youling257@gmail.com>:
> boot enter ubuntu no sound at all if EnableSeq.conf disable all output.
> =E2=80=9C The PA should activate HiFi verb only once.=E2=80=9D i don't th=
ink so.
>
>
> 2020-04-14 16:07 GMT+08:00, Jaroslav Kysela <perex@perex.cz>:
>> Dne 13. 04. 20 v 17:46 Hans de Goede napsal(a):
>>> Hi,
>>>
>>> On 4/13/20 4:59 PM, youling257 wrote:
>>>> alsaucm -c bytcht-es8316 set _verb HiFi set _enadev Mic, Speaker will
>>>> no
>>>> sound.
>>>> alsaucm -c bytcht-es8316 set _verb HiFi set _enadev Headset, Headphone
>>>> will no sound.
>>>
>>> I see the problem, so the idea of the global EnableSequence is
>>> to set defaults and then the EnableSequence of currently active
>>> devices run on top.
>>
>> It's ok, it's just a wrong use of the alsaucm command. The PA should
>> activate
>> HiFi verb only once. Those two commands run the verb EnableSequence
>> twice.
>>
>> The correct test should be:
>>
>> alsaucm -i -c bytcht-es8316 set _verb HiFi
>> alsaucm>> set _enadev Speaker
>> alsaucm>> set _enadev Headphone
>> alsaucm>> set _enadev Mic
>> alsaucm>> set _enadev Headset
>>
>> ... you may run the enable commands with a delay for tests.
>>
>> The current UCM is designed for one task (application). I am playing wit=
h
>> an
>>
>> idea to extend the alsactl state daemon to preserve the UCM settings and
>> state
>> for multiple applications using an RPC mechanism (dbus?).
>>
>> 						Jaroslav
>>
>> --
>> Jaroslav Kysela <perex@perex.cz>
>> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
>>
>
