Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 511EE13AA76
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:16:34 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A77218B8;
	Mon, 13 Jan 2020 15:35:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A77218B8
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C96E2F801EB;
	Mon, 13 Jan 2020 15:34:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 229DDF801EB; Mon, 13 Jan 2020 15:34:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA46CF80122
 for <alsa-devel@alsa-project.org>; Mon, 13 Jan 2020 15:34:21 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id E6288A0042;
 Mon, 13 Jan 2020 15:34:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz E6288A0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1578926060; bh=6sHMlq39e2f1hMNVGLdvZwLf/8etIrHFZkaMDtn8Nus=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
 b=aP9XkUgDTWejyIecGA8hthSUn6jJlTKqOeqImnyBj6B+KKGu9WDfPawlniSLoMQLK
 dwZVdkEoCE9Ofd4riW6bLPzcKpMBLQYETLczrFAhBl0JXPGVRgqiBow2M2RQB49Ehx
 3ocuaJqOe50T+CjttfR3qTNSpYHLEtqbSSaU6Kv0=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 13 Jan 2020 15:34:18 +0100 (CET)
To: Tim Schumacher <tim@timakro.de>
References: <20200109221032.GA74081@impa>
 <7294fce2-716e-00c2-665f-587424b96eb0@perex.cz> <20200113142753.GA22538@impa>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <6d433182-fb2a-d883-a9b3-80110efb89c2@perex.cz>
Date: Mon, 13 Jan 2020 15:34:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200113142753.GA22538@impa>
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

Dne 13. 01. 20 v 15:27 Tim Schumacher napsal(a):
> The patch doesn't help unfortunately. Deleting
> LENOVO-80XF-LenovoMIIX320_10ICR-LNVNB161216.conf still works with the
> patch installed. Can I help debug this somehow?

If you have latest alsa-utils, the command 'alsaucm dump text' should work, 
otherwise try 'alsaucm set _verb HiFi'.

					Jaroslav

> 
> - Tim
> 
> On 2020-01-13, Jaroslav Kysela wrote:
>> Dne 09. 01. 20 v 23:10 Tim Schumacher napsal(a):
>>> Hi alsa devs,
>>>
>>> I'm on Arch Linux on a rather uncommon laptop (Lenovo Miix 320) and my sound
>>> stopped working on the upgrade from alsa-lib 1.1.9 to 1.2.1. wabbits on
>>> IRC helped me track down the problem to a change in the
>>> /usr/share/alsa/ucm (now /usr/share/alsa/ucm2) files. It seems like
>>> /usr/share/alsa/ucm2/chtrt5645/HiFi-dmic2.conf and a symlink at
>>> /usr/share/alsa/ucm2/chtrt5645/LENOVO-80XF-LenovoMIIX320_10ICR-LNVNB161216.conf
>>> were specifically added for this laptop but in the contrary they break the
>>> sound for me.
>>>
>>> After the upgrade to alsa-lib 1.2.1 the sound is not working. The commands play no sound:
>>>
>>>       pasuspender -- speaker-test --nloops=1 --channels=2 --test=wav --device=hw:0,0
>>>       pasuspender -- speaker-test --nloops=1 --channels=2 --test=wav --device=hw:0,1
>>>
>>> And this is the alsa-info.sh output http://alsa-project.org/db/?f=f883910a5c5101b4b1ea4202d1fe84ccd139f796
>>>
>>> After deleting the /usr/share/alsa/ucm2/chtrt5645/LENOVO-80XF-LenovoMIIX320_10ICR-LNVNB161216.conf
>>> symlink both commands from above play sound and this is the alsa-info.sh
>>> output http://alsa-project.org/db/?f=e759eb9118a191b6c3b8c021fed58abc9cf95076
>>
>> Thanks. I forgot to fix the file path in chtrt5645/chtrt5645-dmic2.conf .
>> Could you test this patch?
>>
>> https://github.com/alsa-project/alsa-ucm-conf/commit/74f2a0f0884df7b9f2d08d07456a3bc37d1a512e
>>
>> 				Jaroslav
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
