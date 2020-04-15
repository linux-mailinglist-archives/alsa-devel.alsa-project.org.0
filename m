Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D95F1A9591
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 10:07:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA8861673;
	Wed, 15 Apr 2020 10:06:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA8861673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586938025;
	bh=SwlFueX/lTVo9RvZdMr5oEa9YIMO7rWdiwaR8nq0AjU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ai6hN9ZjpaigmsmKqHT+37H6yLY7A2SFSvY3Gm4e3G5atQy9mkC7jngaBUbYsRZjY
	 p2mIYQMMmf0BOr9WY3SYHsjZzvJ02U8/hkI5l5JLenaHXPrs+tBbMxFQmu8/c35zzA
	 0ZyLIAmktRT1HvOl8BjVl8z0cYXnxGkXk8vRih+0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DCB8F80266;
	Wed, 15 Apr 2020 10:05:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18ABBF8025F; Wed, 15 Apr 2020 10:05:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 086A5F80124
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 10:05:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 086A5F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="DSf2iTkJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586937934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SwlFueX/lTVo9RvZdMr5oEa9YIMO7rWdiwaR8nq0AjU=;
 b=DSf2iTkJNoP1L+RiZJ/okaQbnD2oUpV7dAbeRY9hkQuqHrYOGYbUMQQeAllCQgKwiKnQuQ
 Mb8PAIqV5lnRRdiZThhOclAghmocmSfSPtZc+0VH4pFBXLs7rnsuvEE22P+r2YQo8BuSN9
 PUH2QfJWI8vFHTLPJMltPpJ9tPhvpdQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-xHMVZlvCM0GJkaZGBGrohw-1; Wed, 15 Apr 2020 04:05:32 -0400
X-MC-Unique: xHMVZlvCM0GJkaZGBGrohw-1
Received: by mail-wr1-f70.google.com with SMTP id 11so3865551wrc.3
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 01:05:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TrQ8vzAzvsY4n/BCu0hg/ACQWvjJU5zWf9nc28j0HBo=;
 b=ogk1lD7UWCZkewgke1Ohor6sC6GkGhJisNimsMQxLoC3yrwWDEwD/BUtqBxXvIhHNV
 C60G8awagbJmShlJnU0RFv79/0gBvtWRKDuZhNJ1/JKp+qciI9tk3GZMh8ds51SAhSm+
 XacF/UjvJsM2yfcawpnqoc2MSd8lbTPE8Byvt6aTz99iyd0+VJ481VwuPIvWP5BNWTRH
 g1fYEdwcWfxa7JnS2DWGlVhYkG4OOaWcD/81SqBL1CetjnL2xtEpJWgd3B9mRu90izl7
 8Fixzg2YrKEOxjLf/BrGLvM8ZT4EfNq7hsX1R2LuI6i9KUK03uJVCSu30CeWtAX1Hmk1
 tNJg==
X-Gm-Message-State: AGi0PuZR3teORb4hL2FcIQ4ClLVKDDjPoROZQtN2LY6IaQlkxld74Yoe
 /BSYOsv3t0+E3rhAYhwHWDPX8DGfDNQHyikrXvr2PZFmS1SvgnRt9E9HaqaBwO/XDnZZCP+dPii
 2brP1+f5Gezd/f0U4iR83D3U=
X-Received: by 2002:a5d:410a:: with SMTP id l10mr27319200wrp.355.1586937931102; 
 Wed, 15 Apr 2020 01:05:31 -0700 (PDT)
X-Google-Smtp-Source: APiQypI94MpeO9JUDjJSiE+/FFaHmGXXh+AXNF9Caq4jkGftFlqkYB0YfCYB5eE+F/nU8cCMO+nQrg==
X-Received: by 2002:a5d:410a:: with SMTP id l10mr27319186wrp.355.1586937930825; 
 Wed, 15 Apr 2020 01:05:30 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id n6sm22140336wmn.10.2020.04.15.01.05.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Apr 2020 01:05:30 -0700 (PDT)
Subject: Re: [PATCH] bytcht-es8316: fix Speaker or Headphone no sound if
 enable Mic or Headset
To: youling 257 <youling257@gmail.com>, Jaroslav Kysela <perex@perex.cz>
References: <20200413145957.22459-1-youling257@gmail.com>
 <ae69c1b0-b347-4366-4bb0-383aed69c4b1@redhat.com>
 <d6146d62-a20a-f6a0-64f0-65cea7253948@perex.cz>
 <CAOzgRdbgOykctcteVMLJqqyeXwww2ekzUrbzLbu0jtCoU_5Xgg@mail.gmail.com>
 <CAOzgRdbWCCVB_UWe8s0crWkWhDDqGTy+9nd2oK9UcRaGLDLvxQ@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <c3cac47b-a4a6-f6e2-29ab-098836c230d4@redhat.com>
Date: Wed, 15 Apr 2020 10:05:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAOzgRdbWCCVB_UWe8s0crWkWhDDqGTy+9nd2oK9UcRaGLDLvxQ@mail.gmail.com>
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

On 4/15/20 8:30 AM, youling 257 wrote:
> please remove es8316 cx2072x rt5672 Disable all inputs / outputs.

No not going to happen. We need sane defaults.

There is something wrong with your setup lets try to figure
out what is wrong rather then change these UCM profiles in
a way which only makes things worse.

Regards,

Hans



>=20
> 2020-04-15 14:26 GMT+08:00, youling 257 <youling257@gmail.com>:
>> boot enter ubuntu no sound at all if EnableSeq.conf disable all output.
>> =E2=80=9C The PA should activate HiFi verb only once.=E2=80=9D i don't t=
hink so.
>>
>>
>> 2020-04-14 16:07 GMT+08:00, Jaroslav Kysela <perex@perex.cz>:
>>> Dne 13. 04. 20 v 17:46 Hans de Goede napsal(a):
>>>> Hi,
>>>>
>>>> On 4/13/20 4:59 PM, youling257 wrote:
>>>>> alsaucm -c bytcht-es8316 set _verb HiFi set _enadev Mic, Speaker will
>>>>> no
>>>>> sound.
>>>>> alsaucm -c bytcht-es8316 set _verb HiFi set _enadev Headset, Headphon=
e
>>>>> will no sound.
>>>>
>>>> I see the problem, so the idea of the global EnableSequence is
>>>> to set defaults and then the EnableSequence of currently active
>>>> devices run on top.
>>>
>>> It's ok, it's just a wrong use of the alsaucm command. The PA should
>>> activate
>>> HiFi verb only once. Those two commands run the verb EnableSequence
>>> twice.
>>>
>>> The correct test should be:
>>>
>>> alsaucm -i -c bytcht-es8316 set _verb HiFi
>>> alsaucm>> set _enadev Speaker
>>> alsaucm>> set _enadev Headphone
>>> alsaucm>> set _enadev Mic
>>> alsaucm>> set _enadev Headset
>>>
>>> ... you may run the enable commands with a delay for tests.
>>>
>>> The current UCM is designed for one task (application). I am playing wi=
th
>>> an
>>>
>>> idea to extend the alsactl state daemon to preserve the UCM settings an=
d
>>> state
>>> for multiple applications using an RPC mechanism (dbus?).
>>>
>>> =09=09=09=09=09=09Jaroslav
>>>
>>> --
>>> Jaroslav Kysela <perex@perex.cz>
>>> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
>>>
>>
>=20

