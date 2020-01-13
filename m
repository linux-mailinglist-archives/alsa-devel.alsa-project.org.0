Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C60413AACB
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:24:13 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8D042152;
	Mon, 13 Jan 2020 16:29:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8D042152
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8ECC1F80273;
	Mon, 13 Jan 2020 16:22:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A5F4F80271; Mon, 13 Jan 2020 16:22:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80A03F8026A
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 16:22:47 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 73B1DA003F;
 Mon, 13 Jan 2020 16:22:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 73B1DA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1578928967; bh=x8J2xsr4cqZCSOkoJ09KQur/D9Pi6/lWHpAUBPlMOVM=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
 b=EhHHd/fu8+7facf0UHow2rFAGYc7EPNZg2wruIvuGuKfpjsp4x8xmZ2PKwes/TOIj
 LbzymSqUbHqu2fbLTp9EF9H7N1n5etn17wu3YLwBGjdEBy99s2Ljh1h8MQCE7qP1o6
 DFa8TIiKnDkLwSAuVkfeWNf4eBeSj8FEcRxNAqLI=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 13 Jan 2020 16:22:45 +0100 (CET)
To: Tim Schumacher <tim@timakro.de>
References: <20200109221032.GA74081@impa>
 <7294fce2-716e-00c2-665f-587424b96eb0@perex.cz> <20200113142753.GA22538@impa>
 <6d433182-fb2a-d883-a9b3-80110efb89c2@perex.cz> <20200113145904.GA30843@impa>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <17b002d5-2cc6-ba4a-1a92-4e9be2798f08@perex.cz>
Date: Mon, 13 Jan 2020 16:22:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200113145904.GA30843@impa>
Content-Language: en-US
Cc: ALSA development <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] Bug report for changes in ucm2 with chtrt5645 card
 on Lenovo Miix 320
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

Dne 13. 01. 20 v 15:59 Tim Schumacher napsal(a):
> 'alsaucm set _verb HiFi' gives
> 
>      ALSA lib utils.c:261:(uc_mgr_config_load) could not open configuration file /usr/share/alsa/ucm2/HDA Intel PCH/HDA Intel PCH.conf
>      alsaucm: unable to obtain card list: No such file or directory
> 
> but that seems unrelated to the problem because it's the same
> output whether I delete LENOVO-80XF-LenovoMIIX320_10ICR-LNVNB161216.conf
> and the sound works or I try your patch.

Ok, try 'alsaucm -c hw:0 set _verb HiFi'.

					Jaroslav

> 
> - Tim
> 
> On 2020-01-13, Jaroslav Kysela wrote:
>> Dne 13. 01. 20 v 15:27 Tim Schumacher napsal(a):
>>> The patch doesn't help unfortunately. Deleting
>>> LENOVO-80XF-LenovoMIIX320_10ICR-LNVNB161216.conf still works with the
>>> patch installed. Can I help debug this somehow?
>>
>> If you have latest alsa-utils, the command 'alsaucm dump text' should work,
>> otherwise try 'alsaucm set _verb HiFi'.
>>
>> 					Jaroslav
>>
>>>
>>> - Tim
>>>
>>> On 2020-01-13, Jaroslav Kysela wrote:
>>>> Dne 09. 01. 20 v 23:10 Tim Schumacher napsal(a):
>>>>> Hi alsa devs,
>>>>>
>>>>> I'm on Arch Linux on a rather uncommon laptop (Lenovo Miix 320) and my sound
>>>>> stopped working on the upgrade from alsa-lib 1.1.9 to 1.2.1. wabbits on
>>>>> IRC helped me track down the problem to a change in the
>>>>> /usr/share/alsa/ucm (now /usr/share/alsa/ucm2) files. It seems like
>>>>> /usr/share/alsa/ucm2/chtrt5645/HiFi-dmic2.conf and a symlink at
>>>>> /usr/share/alsa/ucm2/chtrt5645/LENOVO-80XF-LenovoMIIX320_10ICR-LNVNB161216.conf
>>>>> were specifically added for this laptop but in the contrary they break the
>>>>> sound for me.
>>>>>
>>>>> After the upgrade to alsa-lib 1.2.1 the sound is not working. The commands play no sound:
>>>>>
>>>>>        pasuspender -- speaker-test --nloops=1 --channels=2 --test=wav --device=hw:0,0
>>>>>        pasuspender -- speaker-test --nloops=1 --channels=2 --test=wav --device=hw:0,1
>>>>>
>>>>> And this is the alsa-info.sh output http://alsa-project.org/db/?f=f883910a5c5101b4b1ea4202d1fe84ccd139f796
>>>>>
>>>>> After deleting the /usr/share/alsa/ucm2/chtrt5645/LENOVO-80XF-LenovoMIIX320_10ICR-LNVNB161216.conf
>>>>> symlink both commands from above play sound and this is the alsa-info.sh
>>>>> output http://alsa-project.org/db/?f=e759eb9118a191b6c3b8c021fed58abc9cf95076
>>>>
>>>> Thanks. I forgot to fix the file path in chtrt5645/chtrt5645-dmic2.conf .
>>>> Could you test this patch?
>>>>
>>>> https://github.com/alsa-project/alsa-ucm-conf/commit/74f2a0f0884df7b9f2d08d07456a3bc37d1a512e
>>>>
>>>> 				Jaroslav
>>>>
>>>> -- 
>>>> Jaroslav Kysela <perex@perex.cz>
>>>> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
>>>>
>>
>>
>> -- 
>> Jaroslav Kysela <perex@perex.cz>
>> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
>>


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
