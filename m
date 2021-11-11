Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F7844D5BE
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Nov 2021 12:22:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D27761661;
	Thu, 11 Nov 2021 12:21:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D27761661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636629759;
	bh=JGDTOubghn9DbwDxfUWaiEvFwseu53XTmvyosU/KnjQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FeterJkO84hocnxrwRFZqARMxWW5KtfzNsNmslmc8nRmy3cKenDZ3HVHfRe+6btiK
	 CpGpqIRs/G+q6qnNxunQUOMo3taj4rC9OeAX+j16t5wczBu4vHjDPJsJeyuLbtkHyi
	 Zy9UqLigoCa3y2tW6osrFz9keyrLhv1w7g73rZ6g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44B30F802E3;
	Thu, 11 Nov 2021 12:21:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7C78F802D2; Thu, 11 Nov 2021 12:21:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 867A0F80054
 for <alsa-devel@alsa-project.org>; Thu, 11 Nov 2021 12:21:13 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id AF82DA0040;
 Thu, 11 Nov 2021 12:21:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz AF82DA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1636629667; bh=0R2kuYYgDCpcLn6tz/g+dQMEGtgvXoUtN8tiRUOnq5M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IAEnmIhzeRV/+xzCEE1+eXacP3zZijfcMxlG2/F1h6JjXl4gbT9rXs3tV9GRGwD9i
 tM8xy9dZdqzAY3a9jVPWy3G05yD4Cw+E+ux9UwsEwgCCvESvbTG1/mQEC8WIDKTAle
 rGpYoHlNwB8J1s7xHvwGxnZYVaZjA0ZdFCt3a+Jk=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 11 Nov 2021 12:20:55 +0100 (CET)
Message-ID: <aaeb8737-b339-e647-eb82-dcf8dfc63792@perex.cz>
Date: Thu, 11 Nov 2021 12:20:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] ALSA: usb-audio: add the profile name of Dell desktop
Content-Language: en-US
To: Hui Wang <hui.wang@canonical.com>, =?UTF-8?B?U2h1bWluZyBb6IyD5pu46YqY?=
 =?UTF-8?Q?=5d?= <shumingf@realtek.com>,
 "broonie@kernel.org" <broonie@kernel.org>, "tiwai@suse.de" <tiwai@suse.de>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>
References: <20211111091914.20917-1-shumingf@realtek.com>
 <7e82a4cd-ed51-e853-7338-eb570c88cb68@perex.cz>
 <3654e59d-52bd-5442-39d1-f017f5a14b2b@perex.cz>
 <7be27e54d3ce41b2ade3e062c939ece2@realtek.com>
 <835606a2-586d-c5cb-7aa9-5775d14a4383@canonical.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <835606a2-586d-c5cb-7aa9-5775d14a4383@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 =?UTF-8?B?RGVyZWsgW+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 "Yijun.Shen@dell.com" <Yijun.Shen@dell.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
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

On 11. 11. 21 11:44, Hui Wang wrote:
> 
> On 11/11/21 6:40 PM, Shuming [范書銘] wrote:
>> Hi Jaroslav,
>>
>>>>>> Add the profile name to let userspace pick correct UCM profile
>>>>> It's no longer necessary to force the card names in the drivers. UCM
>>>>> can match the USB vendor / device IDs from the 'components' string, too.
>>>>>
>>>>> I think that we should abandon this way of the UCM configuration
>>>>> selection for new devices with device IDs. The kernel already
>>>>> exports necessary information to select the right UCM configuration
>>>>> in the user
>>>> space.
>>>>
>>>> Untested example:
>>>>
>>>>
>>> https://github.com/perexg/alsa-ucm-conf/commit/74ced65440b5011bbec1680
>>>> b2804c8a9c82b5152
>>>>
>>>> 					Jaroslav
>>> Thanks a lot. I will take your example to test.
>> I had tested with USB-Audio.conf that the system seems not to apply the UCM config.
>>
>> The related info of the test machine shows below.
>> root@Latitude-5410:/usr/share/alsa/ucm2/USB-Audio# cat /proc/asound/cards
>>    0 [PCH            ]: HDA-Intel - HDA Intel PCH
>>                         HDA Intel PCH at 0xcc338000 irq 153
>>    1 [Rear           ]: USB-Audio - USB audio Rear
>>                         Generic USB audio Rear at usb-0000:00:14.0-2.2, high speed
>>    2 [FRONT          ]: USB-Audio - USB audio FRONT
>>                         Generic USB audio FRONT at usb-0000:00:14.0-2.1, high speed
>>
>> root@Latitude-5410:/usr/share/alsa/ucm2/USB-Audio# alsaucm --version
>> alsaucm: version 1.2.2
>>
>> root@Latitude-5410:/usr/share/alsa/ucm2/USB-Audio# lsusb
>> Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
>> Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
>> Bus 002 Device 002: ID 8564:4000 Transcend Information, Inc. RDF8
>> Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
>> Bus 001 Device 003: ID 0a5c:5842 Broadcom Corp. 58200
>> Bus 001 Device 002: ID 0bda:5532 Realtek Semiconductor Corp. Integrated_Webcam_HD
>> Bus 001 Device 008: ID 04f3:0235 Elan Microelectronics Corp. Optical Mouse
>> Bus 001 Device 007: ID 1c4f:0002 SiGma Micro Keyboard TRACER Gamma Ivory
>> Bus 001 Device 006: ID 0bda:4c55 Realtek Semiconductor Corp. USB2.0 Hub
>> Bus 001 Device 009: ID 0bda:4c54 Realtek Semiconductor Corp.
>>
>> May I ask you to give me some suggestions?
> Looks like the alsa-lib in the ubuntu 20.04 doesn't support it.

I cannot comment specific distribution packages. It seems that alsa-lib-1.2.2 
in Ubuntu has many later UCM upstream changes, but I cannot verify, if it's 
enough for this file. I would recommend to use upstream alsa-lib and 
alsa-ucm-conf 1.2.5 or later (from the repository) for tests.

Also, please, create an issue or pull request on github for this problem:

   https://github.com/alsa-project/alsa-ucm-conf/issues

We can resolve it there.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
