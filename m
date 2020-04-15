Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 102B21A958C
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 10:06:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E3D01666;
	Wed, 15 Apr 2020 10:05:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E3D01666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586937978;
	bh=weIFFw/SOoBLUC9lsYyHjYbCndu8Vi3vsSfOFQ5Bp1I=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dWxU5ZoFod6E6EzlXEwrnV/XsIRdU3e7/2wIf50+J+JAAa4A3ooHyXHGuL61M4jOq
	 P9JnAwm1Zh6bkWDi6HIIiIs8FCCHZZC+RFaVXGbYOrjZKMSDA9H0ladiwuABqpcLB4
	 19rCQyq9gKyBQvVX9hbXMvXneejEl5HchsdlJPxA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85ACDF80115;
	Wed, 15 Apr 2020 10:04:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F0FCF80124; Wed, 15 Apr 2020 10:04:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6146DF80124
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 10:04:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6146DF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="f8uG3msu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586937858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=weIFFw/SOoBLUC9lsYyHjYbCndu8Vi3vsSfOFQ5Bp1I=;
 b=f8uG3msuozfty/V1fgnKXm4VKau3zaNrhhbCdBCX7/F14/qPvsFXpdbvOlQsh4fJzb1uWk
 kuYB2C8p8w0Cm+is+0A3TQP9LhgqRxhb3Yn3XR32FHbO1Em8m815KOc5dh436/SOVYK9Y/
 kI/uSmYSFap2mDAzx+Ste2TunqNg5U4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-KZinwtR6PoiSceIXMt51aQ-1; Wed, 15 Apr 2020 04:04:15 -0400
X-MC-Unique: KZinwtR6PoiSceIXMt51aQ-1
Received: by mail-wm1-f69.google.com with SMTP id b203so4632270wmd.6
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 01:04:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tf6C9ucsZSTKsDY99V0vf/3Eo3EXYH8CS3EEouLej6I=;
 b=NYmG82MNbzVpBB6CO4i3ptqyFHS+NcCGbe2PQ+kXWNeO2LjR/jK4leJZVTBNCutxlE
 InmkwhhOervYKalJS1Z6AhRooJu0S3B5MtE/WPI+waQXqzt6Zb/1rcUA0qstCLa5n/ad
 sBU3bYNTB/drxUs7b8MtxYwg29l4ZeV/fPYC/HyuY8eLlTSV337RiyxC8//h/9ABR6x1
 HqW1Cv9RRk+2/dTIDlAvDElqOaaf+jaJjYZOFw+jk89Tn8wI3j/65OdxQDLC9HXvNfKe
 Yo2CTYdmCFk3Anwhjh4BlxsLD+Qekp1kDJMFAwoi2Gf11DXtbF0r2g7vMURCQIBpfZ5v
 cyXQ==
X-Gm-Message-State: AGi0PuYloUCZGhPU1o3LVlo+qQVLoEHcl5jTtbyqmWqlwSp2qP/Sonzw
 oDznwIZjeOZ/ONQfyNPLSmPBnvfnuI/MmEnFDncIEpGARUW/OUlV45qY4q6rYDxo1NDoniphG6N
 LlTkWznLwTQFMrTMWZARMuIk=
X-Received: by 2002:a5d:6945:: with SMTP id r5mr4598245wrw.363.1586937854161; 
 Wed, 15 Apr 2020 01:04:14 -0700 (PDT)
X-Google-Smtp-Source: APiQypKdYrsVUdIhrfOxKYIg3FiMBVsbOIOo2uUhN8U8QBn5b70crtWZi8K1/sV1vBubtN0lhDuzxg==
X-Received: by 2002:a5d:6945:: with SMTP id r5mr4598221wrw.363.1586937853956; 
 Wed, 15 Apr 2020 01:04:13 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id k133sm22836735wma.0.2020.04.15.01.04.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Apr 2020 01:04:13 -0700 (PDT)
Subject: Re: [PATCH] bytcht-es8316: fix Speaker or Headphone no sound if
 enable Mic or Headset
To: youling 257 <youling257@gmail.com>, Jaroslav Kysela <perex@perex.cz>
References: <20200413145957.22459-1-youling257@gmail.com>
 <ae69c1b0-b347-4366-4bb0-383aed69c4b1@redhat.com>
 <d6146d62-a20a-f6a0-64f0-65cea7253948@perex.cz>
 <CAOzgRdbgOykctcteVMLJqqyeXwww2ekzUrbzLbu0jtCoU_5Xgg@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <2c1d70d1-6a77-9d06-96df-86c602c1e2e8@redhat.com>
Date: Wed, 15 Apr 2020 10:04:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAOzgRdbgOykctcteVMLJqqyeXwww2ekzUrbzLbu0jtCoU_5Xgg@mail.gmail.com>
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

On 4/15/20 8:26 AM, youling 257 wrote:
> boot enter ubuntu no sound at all if EnableSeq.conf disable all output.
> =E2=80=9C The PA should activate HiFi verb only once.=E2=80=9D i don't th=
ink so.

Which version of pulseaudio does the Ubuntu you are using have?

There was a bug in pulseaudio 13.99.1 wrt the handling of UCM
profiles. The pulseaudio from Fedora 31 updates has a fix
for this, maybe Ubuntu's version is missing this fix?

Regards,

Hans







>=20
>=20
> 2020-04-14 16:07 GMT+08:00, Jaroslav Kysela <perex@perex.cz>:
>> Dne 13. 04. 20 v 17:46 Hans de Goede napsal(a):
>>> Hi,
>>>
>>> On 4/13/20 4:59 PM, youling257 wrote:
>>>> alsaucm -c bytcht-es8316 set _verb HiFi set _enadev Mic, Speaker will =
no
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
>> HiFi verb only once. Those two commands run the verb EnableSequence twic=
e.
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
h an
>>
>> idea to extend the alsactl state daemon to preserve the UCM settings and
>> state
>> for multiple applications using an RPC mechanism (dbus?).
>>
>> =09=09=09=09=09=09Jaroslav
>>
>> --
>> Jaroslav Kysela <perex@perex.cz>
>> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
>>
>=20

