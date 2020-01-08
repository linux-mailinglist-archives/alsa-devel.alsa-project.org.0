Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F4E133E89
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jan 2020 10:50:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B0CF173F;
	Wed,  8 Jan 2020 10:49:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B0CF173F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578477001;
	bh=/VJXVOKxxpR427l5PQh6MVDUznppNGbvIfKy7kpVVGc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ywm0idMUtY+RbV6JvCHjTHlo3badbRVUv73bxO39xZmzvmZM/rohyjJJNS3xjb2ZM
	 VNmEI9QH4UGZeMz2oyzrnDUD+S1GGk2tqxTBc+bu83y317luINL9NBjc7H+warVL+q
	 BFFKTdNbjpfX+YmmFzLVY5haq9CVd+j8VgVTD71k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F43FF801ED;
	Wed,  8 Jan 2020 10:49:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD5E9F801DA; Wed,  8 Jan 2020 10:49:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36A5CF8010A
 for <alsa-devel@alsa-project.org>; Wed,  8 Jan 2020 10:49:04 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 38280A003F;
 Wed,  8 Jan 2020 10:49:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 38280A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1578476944; bh=MvpYVGNPBQzUzDGMn0hQ4eO0/j3Yczjca7o3iT4MRBI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=UgXXRvQPBXIZQQoPxPa4cVaLV6bz5DUzYQaJVred+yucWFZcOBNk8gnQTo//QKQ33
 uCh8/QhP5W3CrjXY7tpcafMXmMN2MN4JiPWxUMjA73Zc/jcexTkQ/MPFtB4HInV5wS
 3W2WRPLHq0aRP+GY4ZczHweJ7PJmHu1MCkc+vvhw=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed,  8 Jan 2020 10:49:01 +0100 (CET)
To: Kailang <kailang@realtek.com>,
 "Takashi Iwai (tiwai@suse.de)" <tiwai@suse.de>
References: <6d3af68aa0fe48848c62943e9a342698@realtek.com>
 <e37b9322-5f47-2d8d-45d0-100169300747@perex.cz>
 <5407c706a98f4a4fa6f04740bed72b67@realtek.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <bd57d464-3e46-0a5f-4aab-10c636360d99@perex.cz>
Date: Wed, 8 Jan 2020 10:49:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <5407c706a98f4a4fa6f04740bed72b67@realtek.com>
Content-Language: en-US
Cc: "\(alsa-devel@alsa-project.org\)" <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] Add quirk for Lenovo X1 Yoga
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

Dne 08. 01. 20 v 10:37 Kailang napsal(a):
> Hi Jaroslav,
> 
> Had Your Redhat kernel implement the Intel SOF driver?
> PCH Dmic need to enable by SOF driver.
> If it had SOF driver, it doesn't need to apply this patch.
> SOF could via UCM to control bass speaker volume.

Hi,

It's not correct. Those platforms have 4 speakers and we need to route the 
stereo stream to all of them. The SOF driver uses the same HDA codec driver as 
the HDA legacy driver (snd-hda-intel), so the situation is similar. UCM just 
controls, if the second pair speakers is activated or not.

So, we need this for both legacy and SOF, otherwise the "bass" speakers will 
be routed from another HDA DAC.

				Jaroslav

> 
> BR,
> Kailang
> 
>> -----Original Message-----
>> From: Jaroslav Kysela <perex@perex.cz>
>> Sent: Wednesday, January 8, 2020 5:30 PM
>> To: Kailang <kailang@realtek.com>; Takashi Iwai (tiwai@suse.de)
>> <tiwai@suse.de>
>> Cc: (alsa-devel@alsa-project.org) <alsa-devel@alsa-project.org>
>> Subject: Re: [alsa-devel] Add quirk for Lenovo X1 Yoga
>>
>> Dne 08. 01. 20 v 10:19 Kailang napsal(a):
>>> Hi Takashi,
>>>
>>> Attach patch was for Lenovo X1 Yoga.
>>
>> Remove the 'Fixes:' line. It's the different device. Otherwise:
>>
>> Reviewed-by: Jaroslav Kysela <perex@perex.cz>
>>
>>>
>>> BR,
>>> Kailang
>>>
>>>
>>> _______________________________________________
>>> Alsa-devel mailing list
>>> Alsa-devel@alsa-project.org
>>> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
>>>
>>
>>
>> --
>> Jaroslav Kysela <perex@perex.cz>
>> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
>>
>> ------Please consider the environment before printing this e-mail.


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
