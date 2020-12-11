Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C78F2D75A9
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Dec 2020 13:33:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E5191746;
	Fri, 11 Dec 2020 13:32:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E5191746
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607690022;
	bh=17V9g139FlW9mv6SHXqBKxHtjin95Ta0aw9id/6ZKU8=;
	h=Date:From:Subject:To:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kipuvnakkIJFAthY/C7p2oayyJvDE/Uz7HlQIjG8c5/rgDoB5XCYqQggGu+fmnhsb
	 blUrYEajHtUZsv+PcdxN2dP2abJd5VIWTSpU4vc462xWOcuL11BxORhNNexw+JCrDh
	 9HsW94G715Xbtd64ae9+ok+6GEEFdu3mD53YfhRM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CCC09F801D8;
	Fri, 11 Dec 2020 13:32:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42DABF8020D; Fri, 11 Dec 2020 13:32:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A43C7F8014E
 for <alsa-devel@alsa-project.org>; Fri, 11 Dec 2020 13:31:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A43C7F8014E
Received: from mail-pf1-f200.google.com ([209.85.210.200])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1knhaW-0003Ax-89
 for alsa-devel@alsa-project.org; Fri, 11 Dec 2020 12:31:56 +0000
Received: by mail-pf1-f200.google.com with SMTP id u3so6251940pfm.22
 for <alsa-devel@alsa-project.org>; Fri, 11 Dec 2020 04:31:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:message-id:in-reply-to
 :references:mime-version;
 bh=EpR3nSoEfPjW0/1SVnwHgL2ILk6sZT3y7eXiGv2rQnE=;
 b=W9lWBSQenE81upWOEF6Qu2qWBGus1LhZRgeraArFwvP/H6ljZ7hqFmjkJvTHpNZw7g
 GyQlJnhQPMYinay7DQmk/kb2P//Km+qBTUKVeb1sEkQzOadjb1Tjcn1hiAQexdyA8CuU
 gfcXoYwewuJ1iRUmsbKglMAerEAkvgjDNaaoZqmpzh7uNgMWy/CbB2hyi7ZpEgGsGX13
 01A9APari513X4H36Ih90CkUlQ+Ncy2wPNAEhW2ziaWZ7KyZFXGG3kz9vwAuueeB34gd
 f8AJHtA//zLZIavXMosn/hhCttaEZvG44c77k+zWhh6bLKLKMA+s8iuv/5RlzrS4yg0l
 US4Q==
X-Gm-Message-State: AOAM531BCbS2LWYUfNf4a+3YFR1q18goCPk3xe+wulVIBmM4OEcJR8zu
 +nyRNnpw4FfPai2dUcLNsU2W3UfLpXe3XGqazsh4jQEgf6stWdJ9muTP842zh31hgJOQuY49Qmg
 1hLtGmZZWH3dK37o2pk9lCI2ZbmtdYg97kDuvSX69
X-Received: by 2002:a17:90a:34cb:: with SMTP id
 m11mr13090930pjf.181.1607689914856; 
 Fri, 11 Dec 2020 04:31:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzc1za/GEw/PBHQau4avynsi2CoEamTdx6hGrNp9s5NdfU+P4WEo539U+EzHzKVabwF10ISHA==
X-Received: by 2002:a17:90a:34cb:: with SMTP id
 m11mr13090899pjf.181.1607689914428; 
 Fri, 11 Dec 2020 04:31:54 -0800 (PST)
Received: from 2001-b011-3815-53c7-64ab-5844-692c-7180.dynamic-ip6.hinet.net
 (2001-b011-3815-53c7-64ab-5844-692c-7180.dynamic-ip6.hinet.net.
 [2001:b011:3815:53c7:64ab:5844:692c:7180])
 by smtp.gmail.com with ESMTPSA id g9sm10326621pgk.73.2020.12.11.04.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 04:31:53 -0800 (PST)
Date: Fri, 11 Dec 2020 20:31:45 +0800
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: How to annotate USB jacks without jack detection?
To: Takashi Iwai <tiwai@suse.de>
Message-Id: <XGD6LQ.QCIHGKLLO2WF@canonical.com>
In-Reply-To: <s5hv9d8pv90.wl-tiwai@suse.de>
References: <0SY5LQ.NPOPM8PL9XNK1@canonical.com> <s5hv9d8pv90.wl-tiwai@suse.de>
X-Mailer: geary/3.38.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: SOUND <alsa-devel@alsa-project.org>
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



On Fri, Dec 11, 2020 at 10:06, Takashi Iwai <tiwai@suse.de> wrote:
> On Fri, 11 Dec 2020 08:14:24 +0100,
> Kai-Heng Feng wrote:
>> 
>>  Hi,
>> 
>>  There are some UAC1 devices come with jacks, but without jack
>>  detection ability. And many USB/Thunderbolt docks are equipped with
>>  such USB device.
>> 
>>  Userspace like PulseAudio automatically switch to USB audio when 
>> they
>>  gets plugged. However, auto-switching to UAC1 device can be
>>  problematic because it may not connected to any headset or speaker.
>> 
>>  So I wonder what's the best way to let userspace know the USB device
>>  is a jack without jack detection ability? Through sysfs or dedicated
>>  UCM conf?
> 
> It's a good question.  AFAIK, that's a long-standing problem, and most
> of such devices provide the jack detection via HID, which is,
> obviously, a completely different driver.  So, if HID driver actually
> creates input devices, we'd need to associate them with the sound card
> somehow (likely in user-space).  But I have no clear idea what's the
> best approach yet.

I didn't know that. Thanks for the info!
That explains the reason why HP TBT dock can do jack detection under 
Windows, while it's just a UAC1 device.

> 
> Also, I'm not sure whether HID device really gives the right jack
> detection event.  A cheap UAC1 device I have here doesn't seem to give
> the jack detection but only the mute/volume events, as it seems...

For the HP TBT dock I can see a plug/unplug events, from its USB HID 
interface.

> 
> OTOH, there are some UAC2 devices providing the jack detection in the
> USB-audio interface, and they seem work as is of now.

Now I know the event is from its HID interface, let me see if I can 
hook them together.

Kai-Heng

> 
> 
> thanks,
> 
> Takashi

