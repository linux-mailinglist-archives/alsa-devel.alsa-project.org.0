Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00300213A32
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 14:45:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D39916AB;
	Fri,  3 Jul 2020 14:44:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D39916AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593780311;
	bh=S+jmvjVzkPboLiac4oXZjOqMsZ7BLx3JFY+emeM8CDM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V3XyWFRcSLTd7JaGd9fu5h9olgTAWnkzeUbLOIu7ziZXDe+LGZCJIMvjmo8cF2+ds
	 u+dVcYM0Bc+dvLgqiHIjuFWJjmJ4yAiO/NSIu51rfsUzTT4xb2hVvINHN6gbBw9vBT
	 wiJLUiUtsQnYY8dddiiuplcftdy/0qGPz4CDaKw0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DB1BF800E0;
	Fri,  3 Jul 2020 14:43:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 574F3F80217; Fri,  3 Jul 2020 14:43:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D023DF800E2
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 14:43:18 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 40E20A003F;
 Fri,  3 Jul 2020 14:43:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 40E20A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1593780198; bh=srW0UOcPGozhNqld8/mxHIoiHYjPi/aX2dcKEOeoKgo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=etLkYW/m+0HtZloIk6OCbAQFq/J+WwwJmi4sgzHSGd2aa7MIVAGeWoxiMjraLGP0o
 cbRP05jJl1fZC7sEyKJUJoJehf0xTE5qc+2xhBC3e09SmsYDxdHLDFCtwgCwF2ozul
 DuQ0gqXbG1usUQXuRAL54dV3TDO6+TdmLIhtJ6KY=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri,  3 Jul 2020 14:43:09 +0200 (CEST)
Subject: Re: [External] Re: [PATCH v2 2/2] ALSA: hda/realtek - Replace Lenovo
 Thinkpad X1 Carbon 7th quirk
To: Mark Pearson <mpearson@lenovo.com>,
 Benjamin Poirier <benjamin.poirier@gmail.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <20200703080005.8942-1-benjamin.poirier@gmail.com>
 <20200703080005.8942-3-benjamin.poirier@gmail.com>
 <58a7791c-0db4-a585-c550-3d3e9576191c@perex.cz>
 <SG2PR03MB3324D74B5A539F69DBDDE0F5BD6A0@SG2PR03MB3324.apcprd03.prod.outlook.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <a09194c3-3f2e-823c-e455-b7c5e7d73e28@perex.cz>
Date: Fri, 3 Jul 2020 14:43:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <SG2PR03MB3324D74B5A539F69DBDDE0F5BD6A0@SG2PR03MB3324.apcprd03.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Kailang Yang <kailang@realtek.com>, Takashi Iwai <tiwai@suse.com>,
 Hui Wang <hui.wang@canonical.com>, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Vincent Bernat <vincent@bernat.ch>, Even Brenden <evenbrenden@gmail.com>
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

Dne 03. 07. 20 v 12:59 Mark Pearson napsal(a):
> 
>> -----Original Message-----
>> From: Alsa-devel <alsa-devel-bounces@alsa-project.org> On Behalf Of
>> Jaroslav Kysela
>> Sent: Friday, July 3, 2020 6:34 AM
>>
>> Dne 03. 07. 20 v 10:00 Benjamin Poirier napsal(a):
>>> As a result of commit d2cd795c4ece ("ALSA: hda - fixup for the bass
>>> speaker on Lenovo Carbon X1 7th gen"), the sound output level on my machine, an
>>> X1 Carbon 7th gen, was reduced to ~65% of its previous level when playing
>>> certain sounds. [1]
>>>
> <snip>
>>
>> Thank you for this work. Perhaps, Takashi will have some comments to
>> improve this quirk.
> Seconded - thank you!
> 
> <snip>
>>
>>> It is possible that the X1 Carbon 8th gen would benefit from the same
>>> changes but I don't have a device to test that. Fixups are reordered so
>>> that the devices for 7th & 8th gen can share the same chain after the first
>>> fixup. The resulting chain is:
>>
>> 8th gen hardware should be similar, so the new fixup should be applied to this
>> hw, too.
>>
> We'll do some testing here and confirm the fixes on the X1C7 and X1C8 (and Yoga)
> 
> Do let me know if there is any details Lenovo can provide that would help

The functionality of this patch is same like the hda-verb command is executed 
with the current kernel (run as root):

hda-verb /dev/snd/hwC0D0 0x17 SET_CONNECT_SEL 1

You can control tweeters with 'Speaker' volume control.
And headphones and bass speakers with the 'Headphone' volume control.

						Jaroslav


> 
> Mark
> 


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
