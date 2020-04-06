Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD08E19F48E
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Apr 2020 13:30:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FD6F1616;
	Mon,  6 Apr 2020 13:29:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FD6F1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586172623;
	bh=AlqYLZPYDJXm6QWhvYjxOLomy3clTKaE2/WQmrbaen0=;
	h=From:Subject:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pj3IP7M58B3O0QDmHP3cuRc9E8KmnV26+9aRRri9W+0QEYAHWZ6bG6vrFpO6HwFIw
	 uCBKTxQrYX8oAGinH39QB3eDKiEOPobiQtvkmkwfNVpnHVQ2+dVeNxvquRflaI7vUw
	 mv7QPavVCe3pLhqY2DAGQrUsA2NRLhPg3rBTdfZ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EB80F80150;
	Mon,  6 Apr 2020 13:28:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE41AF80143; Mon,  6 Apr 2020 13:28:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A482CF800CC
 for <alsa-devel@alsa-project.org>; Mon,  6 Apr 2020 13:28:34 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 58399A003F;
 Mon,  6 Apr 2020 13:28:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 58399A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1586172505; bh=GKxh5uI8akn21Z8DG7OHKqeXAgQR2JjYY+2W6ngePvU=;
 h=From:Subject:To:Cc:References:Date:In-Reply-To:From;
 b=nrwjdmXmshsbDDVQjWGL8hBuUjg4x4NpBNj9kIOOIE5+yk884QUUhN/sEp9P+OlR5
 6CT9D1lORNa5xZu4lq1ASqzic4ED25ibPjxsZjbf9oBEdb9jLiWFM5fRosb7/Oiipc
 fzD6EABkNDS+FMDhb8npTlJ2VJAfVvHmf1Ysl8so=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon,  6 Apr 2020 13:28:23 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [PATCH 5/5] cht-bsw-rt5672: Fix HiFi-stereo-dmic2 conf not
 loading / working
To: Hans de Goede <hdegoede@redhat.com>
References: <20200405183454.34515-1-hdegoede@redhat.com>
 <20200405183454.34515-5-hdegoede@redhat.com>
 <1e466650-dc6f-4757-a36b-6f32639e99be@perex.cz>
 <08414d2b-0498-4e38-3178-b7549d6534ff@redhat.com>
Message-ID: <39890bf8-a247-9e00-a842-84a07fec5a99@perex.cz>
Date: Mon, 6 Apr 2020 13:28:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <08414d2b-0498-4e38-3178-b7549d6534ff@redhat.com>
Content-Type: text/plain; charset=utf-8
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

Dne 06. 04. 20 v 11:50 Hans de Goede napsal(a):
> Hi,
> 
> On 4/6/20 11:34 AM, Jaroslav Kysela wrote:
>> Dne 05. 04. 20 v 20:34 Hans de Goede napsal(a):
>>> Fix HiFi-stereo-dmic2 conf not loading because of references to
>>> non existing devices in the ConflictingDevices sections.
>>>
>>> Stop playing Rename + Remove tricks with the output (Speaker2) and
>>> input (DMIC1) devices which we do not want to be part of this config,
>>> this does not work now that we only allow devices which are actually
>>> part of our config in the ConflictingDevices sections.
>>
>> The Remove and Rename operations should also manage (remove and rename) devices in ConflictingDevices/SupportedDevices sections. What's the exact error you hit?
>>
>> If I simulate this via ucm-validator I get this device structure:
>>
>>    Verb: "HiFi"
>>       File: HiFi-stereo-dmic2.conf
>>       Device: "Headphones"
>>         ConflictingDevices.0 = Speaker
>>         Value.PlaybackPriority = 300
>>         Value.PlaybackPCM = 'hw:${CardId}'
>>         Value.JackControl = 'Headphone Jack'
>>       Device: "Headset"
>>         ConflictingDevices.0 = Mic
>>         Value.CapturePriority = 300
>>         Value.CapturePCM = 'hw:${CardId}'
>>         Value.JackControl = 'Headset Mic Jack'
>>       Device: "Speaker"
>>         ConflictingDevices.0 = Headphones
>>         Value.PlaybackPriority = 200
>>         Value.PlaybackPCM = 'hw:${CardId}'
>>       Device: "Mic"
>>         ConflictingDevices.0 = Headset
>>         Value.CapturePriority = 200
>>         Value.CapturePCM = 'hw:${CardId}'
>>
>> It appears like an issue in alsa-lib.
> 
> With an unmodified UCM2 profile I get the following:
> 
> [hans@localhost ~]$ alsaucm -c cht-bsw-rt5672 set _verb HiFi set _enadev Speaker
> ALSA lib parser.c:1138:(verb_dev_list_add) error: unable to find device 'Speaker2'
> ALSA lib parser.c:1433:(parse_verb_file) error: device management error in verb 'HiFi'
> ALSA lib main.c:962:(snd_use_case_mgr_open) error: failed to import cht-bsw-rt5672 use case configuration -2
> alsaucm: error failed to open sound card cht-bsw-rt5672: No such file or directory
> 
> Note the _enadev does not matter, things break before it gets parsed,
> if I replace Speaker with XXX I get the exact same errors.
> 
> I'm happy to try any alsa-lib patches on this (Thinkpad8) hw for you.

I think that I found the culprit. Could you test this, please?

https://github.com/alsa-project/alsa-lib/commit/c9605484d165d2b707f78eef14a224b0b47ba322

			Thank you,
				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
