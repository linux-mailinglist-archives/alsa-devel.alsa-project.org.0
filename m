Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E30319FA12
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Apr 2020 18:25:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC724167F;
	Mon,  6 Apr 2020 18:24:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC724167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586190337;
	bh=h21Llu5D3+C2ZIeWZxj+EehNL/U+kTD0Ac7XsYsMhl4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PO+++l505DBmdvRM23TYyhZpYgzqvFzmFG+KxEgOF5RszRLII52/lIb397vLmio5z
	 G3PGl2S5njxIEVZVSCKqLXT4KoXh4D42OvpATag7DWAKIGhMMln8dxnhKOGFQZ04sZ
	 oP4z2aKm7luXt+6guTYZnyZcEuq2sCbnfpF5yXGk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6DFFF800CC;
	Mon,  6 Apr 2020 18:23:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F2D5F80143; Mon,  6 Apr 2020 18:23:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8176FF800CC
 for <alsa-devel@alsa-project.org>; Mon,  6 Apr 2020 18:23:50 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id AE822A003F;
 Mon,  6 Apr 2020 18:23:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz AE822A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1586190229; bh=IihJDFkSm3IhkIMxZ6gHNJ3REgvsjsso3oU2PL+co/k=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=zcVlA0F8xUEOE+3vUcUm4HR82dY29S15KEnczQcqOu7gMucR9DDBk2CFEmIZUdUzF
 0Ft1Yrp1WRLirS/eP9F2OJ4w8ftL4na+8MEjoXaPXrtHSlNAsNtxXvXI/YNu6mksm6
 IcbUUWW2TOfhgZfyeRXXgYTz1zhdc03FYGf0e3is=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon,  6 Apr 2020 18:23:47 +0200 (CEST)
Subject: Re: [PATCH 5/5] cht-bsw-rt5672: Fix HiFi-stereo-dmic2 conf not
 loading / working
To: Hans de Goede <hdegoede@redhat.com>
References: <20200405183454.34515-1-hdegoede@redhat.com>
 <20200405183454.34515-5-hdegoede@redhat.com>
 <1e466650-dc6f-4757-a36b-6f32639e99be@perex.cz>
 <08414d2b-0498-4e38-3178-b7549d6534ff@redhat.com>
 <39890bf8-a247-9e00-a842-84a07fec5a99@perex.cz>
 <7ea2a4f9-060b-99ea-ddde-90cb8f1c8be2@redhat.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <415cfe32-3592-82ea-c37b-a8fdbed3e9ec@perex.cz>
Date: Mon, 6 Apr 2020 18:23:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <7ea2a4f9-060b-99ea-ddde-90cb8f1c8be2@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

Dne 06. 04. 20 v 14:13 Hans de Goede napsal(a):
> Hi,
> 
> On 4/6/20 1:28 PM, Jaroslav Kysela wrote:
>> Dne 06. 04. 20 v 11:50 Hans de Goede napsal(a):
>>> Hi,
>>>
>>> On 4/6/20 11:34 AM, Jaroslav Kysela wrote:
>>>> Dne 05. 04. 20 v 20:34 Hans de Goede napsal(a):
>>>>> Fix HiFi-stereo-dmic2 conf not loading because of references to
>>>>> non existing devices in the ConflictingDevices sections.
>>>>>
>>>>> Stop playing Rename + Remove tricks with the output (Speaker2) and
>>>>> input (DMIC1) devices which we do not want to be part of this config,
>>>>> this does not work now that we only allow devices which are actually
>>>>> part of our config in the ConflictingDevices sections.
>>>>
>>>> The Remove and Rename operations should also manage (remove and rename) devices in ConflictingDevices/SupportedDevices sections. What's the exact error you hit?
>>>>
>>>> If I simulate this via ucm-validator I get this device structure:
>>>>
>>>>      Verb: "HiFi"
>>>>         File: HiFi-stereo-dmic2.conf
>>>>         Device: "Headphones"
>>>>           ConflictingDevices.0 = Speaker
>>>>           Value.PlaybackPriority = 300
>>>>           Value.PlaybackPCM = 'hw:${CardId}'
>>>>           Value.JackControl = 'Headphone Jack'
>>>>         Device: "Headset"
>>>>           ConflictingDevices.0 = Mic
>>>>           Value.CapturePriority = 300
>>>>           Value.CapturePCM = 'hw:${CardId}'
>>>>           Value.JackControl = 'Headset Mic Jack'
>>>>         Device: "Speaker"
>>>>           ConflictingDevices.0 = Headphones
>>>>           Value.PlaybackPriority = 200
>>>>           Value.PlaybackPCM = 'hw:${CardId}'
>>>>         Device: "Mic"
>>>>           ConflictingDevices.0 = Headset
>>>>           Value.CapturePriority = 200
>>>>           Value.CapturePCM = 'hw:${CardId}'
>>>>
>>>> It appears like an issue in alsa-lib.
>>>
>>> With an unmodified UCM2 profile I get the following:
>>>
>>> [hans@localhost ~]$ alsaucm -c cht-bsw-rt5672 set _verb HiFi set _enadev Speaker
>>> ALSA lib parser.c:1138:(verb_dev_list_add) error: unable to find device 'Speaker2'
>>> ALSA lib parser.c:1433:(parse_verb_file) error: device management error in verb 'HiFi'
>>> ALSA lib main.c:962:(snd_use_case_mgr_open) error: failed to import cht-bsw-rt5672 use case configuration -2
>>> alsaucm: error failed to open sound card cht-bsw-rt5672: No such file or directory
>>>
>>> Note the _enadev does not matter, things break before it gets parsed,
>>> if I replace Speaker with XXX I get the exact same errors.
>>>
>>> I'm happy to try any alsa-lib patches on this (Thinkpad8) hw for you.
>>
>> I think that I found the culprit. Could you test this, please?
>>
>> https://github.com/alsa-project/alsa-lib/commit/c9605484d165d2b707f78eef14a224b0b47ba322
> 
> I added that patch to the alsa-lib-1.2.2 package, did a build and
> installed it, unfortunately it does not help:
> 
> [hans@localhost ~]$ rpm -q alsa-lib
> alsa-lib-1.2.2-1.hdg1.fc33.x86_64
> [hans@localhost ~]$ alsaucm -c cht-bsw-rt5672 set _verb HiFi set _enadev Speaker
> ALSA lib parser.c:1138:(verb_dev_list_add) error: unable to find device 'Speaker2'
> ...

Another one line fix:

https://github.com/alsa-project/alsa-lib/commit/fb48ad9e4f6b84fd4ade689bd79e3a3c37d3e034

						Jaroslav


> 
> Regards,
> 
> Hans
> 


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
