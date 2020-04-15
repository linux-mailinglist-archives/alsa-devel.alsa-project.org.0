Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9D91A961F
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 10:20:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44D711663;
	Wed, 15 Apr 2020 10:19:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44D711663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586938827;
	bh=pAaB7cLfP4se4AkJroIXBxxnUKsyNnwWNAcJ3ycac9M=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I423xD50T+jQdwg3fQXgzaEzgnw87Kb+/6lyGmjRHrusUZmsPBGiNDBY7xIln9iJg
	 K8wfAKvSTAs1xyQZ/v9itzEWmDHqB3HGCupRCpXp+QLrAKIt8ZxhZLWEe5rSh8IOz5
	 +4FDWGfm1sAv324wI+u/eVqE0XmbzKICLkwstxM0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C976F80229;
	Wed, 15 Apr 2020 10:18:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54EF6F80245; Wed, 15 Apr 2020 10:18:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DED3EF80124
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 10:18:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DED3EF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hzhC2lJF"
Received: by mail-io1-xd41.google.com with SMTP id n10so16229124iom.3
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 01:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=28f4xL3Uduz4PLbG7TijKs1EqgRBi7VfUJ6jfe+c0Ic=;
 b=hzhC2lJFJcwZ+0AYorOkTEQUHmpTi/XguyqZChPAtgm303/KDQAXW2bWZSkEYGrQNe
 SM44F4IwlW4LK/GXOw37Df/ZkYShoD6rQLMYG/UPIhJeryi9hZPXLGXEBMJBH8AtU+pB
 Mjr3ni0ilT1Yu9+QmZTbgW+PEHIxohvwByqyWf4H4ebpP6HFQXgMfj6X8mkcbXPZKDDu
 B9AnE/LyB3aVjaR9Hlh+MHLdP9saaTpjBQgJNMS3SrsRfg5s3N45CpgLMEpmCbqQ7XjL
 mWTmJLyg+oWjCoTFnFEz22+GevKao+/u043+4iSBZzHDSoXUm//e3l+AX4xp/JHkbWY2
 oKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=28f4xL3Uduz4PLbG7TijKs1EqgRBi7VfUJ6jfe+c0Ic=;
 b=cBaggoxSGDoF+cpth8DLVO77tLiTtaxnPxv889NsfP6K+Nt+Zkos5rY+ZK03pZun00
 +SuFvoM+8roTQTW/t4c0wJdjOViO2JLfBwiTVDhZpFC6XQNFHL20jjM91GyljInk7XWr
 DQMfnSROCaLCV/31duTQMYr4b3gmgcbdvvVvljya6R7GdnxzSWVKH2lj1KKKP50QcWEO
 eQ3PXcGjx1gJuGyxP+/uBFeGGo2D/qDLQpWzcyWgdeut05jBVP6KS6QcjZj8Tj64pVam
 G5AQppWtgal7somh84yKwSGMoYYm+qvnGn6nS8B68q5VM6nptAqmCS5RAjgMtAELQwcK
 /DJg==
X-Gm-Message-State: AGi0PuYBFpE/0zpAyMrBMtWEjRB7ByLAZ1ct/Vt2CqX0ukFpnqN05jwr
 ZW/KexphCPcamDtRwmGJLsXBaDb143y6/Qnj7Wk=
X-Google-Smtp-Source: APiQypJ+4gCPYewTSVOfWTJdwHxEXxuGC3G5fo2UMKRoSuiCjfsEpigD5QK7cGstoEDwglP/ePx2RWmIzz6GDQFUQbA=
X-Received: by 2002:a02:4b03:: with SMTP id q3mr24214033jaa.30.1586938714206; 
 Wed, 15 Apr 2020 01:18:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:a58b:0:0:0:0:0 with HTTP; Wed, 15 Apr 2020 01:18:33
 -0700 (PDT)
In-Reply-To: <2c1d70d1-6a77-9d06-96df-86c602c1e2e8@redhat.com>
References: <20200413145957.22459-1-youling257@gmail.com>
 <ae69c1b0-b347-4366-4bb0-383aed69c4b1@redhat.com>
 <d6146d62-a20a-f6a0-64f0-65cea7253948@perex.cz>
 <CAOzgRdbgOykctcteVMLJqqyeXwww2ekzUrbzLbu0jtCoU_5Xgg@mail.gmail.com>
 <2c1d70d1-6a77-9d06-96df-86c602c1e2e8@redhat.com>
From: youling 257 <youling257@gmail.com>
Date: Wed, 15 Apr 2020 16:18:33 +0800
Message-ID: <CAOzgRdYsy3MZCO4NvuBL_-SDpSyiLrnc5oesfMhqHdeg+zAhgA@mail.gmail.com>
Subject: Re: [PATCH] bytcht-es8316: fix Speaker or Headphone no sound if
 enable Mic or Headset
To: Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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

2020-04-15 16:04 GMT+08:00, Hans de Goede <hdegoede@redhat.com>:
> Hi,
>
> On 4/15/20 8:26 AM, youling 257 wrote:
>> boot enter ubuntu no sound at all if EnableSeq.conf disable all output.
>> =E2=80=9C The PA should activate HiFi verb only once.=E2=80=9D i don't t=
hink so.
>
> Which version of pulseaudio does the Ubuntu you are using have?
pulseaudio (1:13.99.1-1ubuntu2) packages.ubuntu.com/focal/pulseaudio
what patch?
> There was a bug in pulseaudio 13.99.1 wrt the handling of UCM
> profiles. The pulseaudio from Fedora 31 updates has a fix
> for this, maybe Ubuntu's version is missing this fix?
>
> Regards,
>
> Hans
>
>
>
>
>
>
>
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
>>> 						Jaroslav
>>>
>>> --
>>> Jaroslav Kysela <perex@perex.cz>
>>> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
>>>
>>
>
>
