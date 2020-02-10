Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB4A1576DF
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 13:56:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02F39167A;
	Mon, 10 Feb 2020 13:55:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02F39167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581339370;
	bh=MBhHwQBTMpVYcHhZQR3fYf1mrbo/ut3f1vD/Co/Iv7U=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gxXHS99Y8j7QwrP57JWBSORssedMYRCx6IMcACLxexapjiS38Qr/7gWlSIxkKGy2m
	 Oc/RNC7yDjl/F3kIwDA6dHylJpE34i0ZyjTTf4Y1fTGb01F2yLjkimidMHbHjnvxd2
	 WVM1nxSaEAjWqSF6lBweuYsSvb991uVfp4xGK0TI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CF43F80158;
	Mon, 10 Feb 2020 13:54:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0449EF80157; Mon, 10 Feb 2020 13:54:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64EDFF80118
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 13:54:22 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 792C4A003F;
 Mon, 10 Feb 2020 13:54:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 792C4A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1581339262; bh=QTil6lPXAvwuaGLAcTiBqVpzioD2el6BMS1713NKgNU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=JM/xiLEJeTmouEpvZczVpkko2/QBb+n9GHOz7m7c7x+p6rHUDTEgUfBBwJp2s/2BA
 x4O70GyT0V2bzM8GpM6XQYuyNqRs6gfIi/EzTp4UIAWFI90abKvZ6V2tsYFC5NW4GN
 UxJjK89PfnJo0yIgGPmAMgmBoN1uo1bDMe8211Qc=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 10 Feb 2020 13:54:18 +0100 (CET)
To: Benjamin Poirier <benjamin.poirier@gmail.com>,
 Kailang <kailang@realtek.com>
References: <20191129144027.14765-1-perex@perex.cz> <20200210025249.GA2700@f3>
 <20200210030416.GA3302@f3>
 <b31f7280948d4cff91ab5dfcd1e14024@realtek.com>
 <20200210121450.GA3072@f3>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <026068c1-7189-762f-d0e7-16ef08a9de3d@perex.cz>
Date: Mon, 10 Feb 2020 13:54:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200210121450.GA3072@f3>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH] ALSA: hda - fixup for the bass speaker on
 Lenovo Carbon X1 7th gen
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dne 10. 02. 20 v 13:14 Benjamin Poirier napsal(a):
> On 2020/02/10 09:11 +0000, Kailang wrote:
>> Hi,
>>
>> This platform speaker 2 bind DAC 0x2 was default.
> 
> No, 0x6 was the default. commits d2cd795c4ece & 54a6a7dc107d changed it
> to 0x2 which reduced the max volume.
> 
>> Use ALC295_FIXUP_DISABLE_DAC3 model will place to DAC 0x3.
>> DAC 0x3 was use as Headphone.
> 
> No, none of these quirks have an effect on the headphones.
> 
> 
> Do you have a ThinkPad X1 Carbon 7th gen to actually test this code?
> 
> If you do, in the output of dmidecode, under "System Information",
> what's the "Product Name" and "Version"? And what's the pci sub device
> id for the audio device? The behavior you're describing doesn't match
> the behavior of the laptop I have here sitting in front of me.
> 
> Anyways, I've just tested the headphone port on my machine with the
> change I posted earlier and it still works as expected - when I plug in
> headphones, sound comes out through the headphones, when I unplug the
> headphones, sound comes out through the four speakers loud and clear.
> 
> Here's the relevant part of Node 0x17 from /proc/asound/card0/codec#0
> with different quirks applied and the level of sound output through the
> speakers:
> 
> no quirk
>    Connection: 3
>       0x02 0x03 0x06*
>    -> loud volume
> ALC285_FIXUP_SPEAKER2_TO_DAC1
>    Connection: 3
>       0x02* 0x03 0x06
>    In-driver Connection: 1
>       0x02
>    -> weak volume
> ALC295_FIXUP_DISABLE_DAC3
>    Connection: 3
>       0x02 0x03* 0x06
>    In-driver Connection: 2
>       0x02 0x03
>    -> loud volume

Kailang, what's the difference between nodes 0x02 and 0x03 for this codec? Or 
the DACs are setup differently?

The problem with those Realtek codecs is that they have many "hidden" 
functions controlled by the undocumented registers.

I have not tested 0x03. Also, both pair of stereo speakers should be connected 
to one DAC for X1 otherwise we will lose the volume control.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
