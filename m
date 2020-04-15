Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A69D1A9372
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 08:44:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E668E1684;
	Wed, 15 Apr 2020 08:43:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E668E1684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586933086;
	bh=Kn0UdrJgbD3EWsm7YqhVT7kyhAmGfBTHZHhYMoD953Q=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zvvbjem6CKnLsVsXyD2ZbudgCcBomDXyQwhFeLNfsochmd35Wm5GMyui19oWhp1GD
	 CwZfkXdQRM4PVlC8l+W9OF+0I38rStYRK16JcV5eUvGGuSylgoR/GkSPphFT8pWAwr
	 kJz1AhQnAY534VOpPddMG7idqSTUBDPvRiwbmM4c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02D08F80229;
	Wed, 15 Apr 2020 08:43:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF6EBF80245; Wed, 15 Apr 2020 08:42:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 548C4F800ED
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 08:42:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 548C4F800ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="JBaxlwxM"
Received: by mail-io1-xd44.google.com with SMTP id 19so119827ioz.10
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 23:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=7xLwOvqOG3eN1Mc2nvKJ9XeCkdGO4gaYkFyy85CGQGE=;
 b=JBaxlwxM0ExhYWUj/BwYXdk4kebiuGHK69qeigfiH9ZkhuodzwC15WNkkrvSCF21Da
 nJ1h5gRjat/dkV4iUJQTy13JnfffzAjPvmD06NHq/Fj1SeRTcJTymHu9exzl974OoPX9
 hEaR89FXZRXknWXH4WkdkBwSdg+a99bxjchIc2w8SEFGCN4YNN2fyU7BuJFuUMNUO85j
 S+DJXpXn9OuqzjOaNPNRotCGwfWTvmQOcy69K3tpypkjYC/fPcA1prAFgPwumvzqOhNs
 EfMyGUHBy41F2Rog7G520I5PzmoUcH32678vDburBdJCllQ8jsX0f1tm32OshI7RturR
 UI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=7xLwOvqOG3eN1Mc2nvKJ9XeCkdGO4gaYkFyy85CGQGE=;
 b=YtpbpNa1Jcm3E9IRC9CWDUbkBaspYAfLqGB65F216B843UBgwajwOqSKePTCYirbrs
 YahaLasntdxeE+JNewqfegsEilkbE6GJOIgDT6OnWLRYaJmsqOxQkAj2EdQAgbNBDGol
 FCzK8Q5k/0grh7FvqYlZNWn6DOUg7V4kmG85vLFNSvJWoJskQsosz4bKUM9y37Qlb9Uz
 1A9mxcf+1e9ECZRS6cB7babN2DQmYDVOkLg733s7i76fpIduStv5TQe3SvkCroIRd6/T
 aiiXSeKp1S7jQtFenijI4QsGBGgkXSiOUxgUwNKjnn+yXPpmVNYgxjFdB9NSNJV4dbJi
 LELA==
X-Gm-Message-State: AGi0PubXJ9j0dzV+riGKpk4z9V/5xeNB7jNcRSn0LEFY0oc3OwbSC4QB
 jOsQ5gpP7EcwG7MgJ8dpuHYV98owbrLgy4lzwX4=
X-Google-Smtp-Source: APiQypL88g8zK8yM5nrtDLUOIXo7AeIswLd2eRd8Z53lvmX4oDCUGwLmiZMSWazl4moBtsnK/e9H79F5TmLmxVrMxJc=
X-Received: by 2002:a6b:b547:: with SMTP id e68mr21814952iof.173.1586932970705; 
 Tue, 14 Apr 2020 23:42:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:a58b:0:0:0:0:0 with HTTP; Tue, 14 Apr 2020 23:42:50
 -0700 (PDT)
In-Reply-To: <ae69c1b0-b347-4366-4bb0-383aed69c4b1@redhat.com>
References: <20200413145957.22459-1-youling257@gmail.com>
 <ae69c1b0-b347-4366-4bb0-383aed69c4b1@redhat.com>
From: youling 257 <youling257@gmail.com>
Date: Wed, 15 Apr 2020 14:42:50 +0800
Message-ID: <CAOzgRdboPmLBZBMOdcPFXPne9faf5BtuY3thmes1+Sz8PNRJnQ@mail.gmail.com>
Subject: Re: [PATCH] bytcht-es8316: fix Speaker or Headphone no sound if
 enable Mic or Headset
To: Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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

2020-04-13 23:46 GMT+08:00, Hans de Goede <hdegoede@redhat.com>:
> Also you say you use pulseaudio for your testing,
> AFAIK pulse does not suffer from the problem the
> alsaucm commands you mention do,
I said "remove the EnableSeq.conf Disable all output, i can get speaker
and headphone work on ubuntu focal with pulseaudio."
>so as long as
> you only use pulse things should work.
Disable all inputs / outputs, pulseaudio sound not work.

> Regards,
>
> Hans
>
>
>
>
>>
>> Signed-off-by: youling257 <youling257@gmail.com>
>> ---
>>   ucm2/codecs/es8316/EnableSeq.conf | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/ucm2/codecs/es8316/EnableSeq.conf
>> b/ucm2/codecs/es8316/EnableSeq.conf
>> index 551b79b..53bb115 100644
>> --- a/ucm2/codecs/es8316/EnableSeq.conf
>> +++ b/ucm2/codecs/es8316/EnableSeq.conf
>> @@ -1,6 +1,4 @@
>>   # Disable all inputs / outputs
>> -cset "name='Speaker Switch' off"
>> -cset "name='Headphone Switch' off"
>>   cset "name='Headset Mic Switch' off"
>>   cset "name='Internal Mic Switch' off"
>>
>>
>
>
