Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3081A7B8A
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 14:58:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD3E616AC;
	Tue, 14 Apr 2020 14:57:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD3E616AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586869104;
	bh=BU9x1tm1AUKAnMTwNLwQJGM84CaHqKKkFKQce2k/a7U=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H4Gpk4iN15oVa20exXDBptBRpRCwBceQ5l+SaL8OafQGe/iMoKvsc9fiK3jgViIV+
	 zuk1vdWTyLeGKUMV9Nv08HbWRs9x0IW83H+jQnhxybEKRYRFGuL+/aPW1OeepXx3b6
	 4fOrkbtKb9VWbJqbFQNP+N+4t53xvzQfl4Ii3LqE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E30B8F8013D;
	Tue, 14 Apr 2020 14:56:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4D2BF8013D; Tue, 14 Apr 2020 14:56:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9141F800B9
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 14:56:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9141F800B9
Received: from [222.130.141.248] (helo=[192.168.2.104])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1jOL7B-00033s-Uh; Tue, 14 Apr 2020 12:56:34 +0000
Subject: Re: [PATCH] ALSA: hda: enable the runtime_pm for non-vgaswitcheroo
 hda controllers
To: Roy Spliet <nouveau@spliet.org>, Takashi Iwai <tiwai@suse.de>
References: <20200414101405.6992-1-hui.wang@canonical.com>
 <s5hmu7ejra2.wl-tiwai@suse.de>
 <121237cf-8ef9-2a21-8ee3-6c6954e846e2@canonical.com>
 <d73a3c02-360b-12d9-6e4b-fff60f819cd6@spliet.org>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <9e8a7b1b-decc-d149-6b86-01946df82d54@canonical.com>
Date: Tue, 14 Apr 2020 20:56:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <d73a3c02-360b-12d9-6e4b-fff60f819cd6@spliet.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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


On 2020/4/14 下午8:42, Roy Spliet wrote:
> Dear Hui, Takashi,
>
> Op 14-04-2020 om 13:35 schreef Hui Wang:
>>
>> On 2020/4/14 下午6:27, Takashi Iwai wrote:
>>> On Tue, 14 Apr 2020 12:14:05 +0200,
>>> Hui Wang wrote:
>>>> Before the pci_driver->probe() is called, the pci subsystem calls
>>>> runtime_forbib() and runtime_get_sync() on this pci dev, so only call
>>>> runtime_put_autosuspend() is not enough to enable the runtime_pm on
>>>> this device.
>>>>
>>>> For controllers with vgaswitcheroo feature, the pci/quirks.c will call
>>>> runtime_allow() for this dev, then the controllers could enter
>>>> rt_idle/suspend/resume, but for non-vgaswitcheroo controllers like
>>>> Intel hda controllers, the runtime_pm is not enabled even it calls
>>>> put_autosuspend(). Need to call runtime_allow() for those controllers
>>>> in the hda driver.
>
> From what I can tell there are no ill effects of calling 
> runtime_allow() twice. Technically, the check against 
> use_vga_switcheroo() is thus redundant.
> Is there a good reason why runtime_allow() is called in the pci quirks 
> rather than in hda_intel? Is it a suggestion to perform this call in 
> hda_intel regardless of whether it's a switcheroo-device or not, and 
> removing calls to runtime_allow() from the PCI quirks?

I guess after the hda driver calls the _allow() unconditionally, we 
could remove the _allow() in the pci/quirks.c. But it is no harm keeping 
it since _allow() could be called many times.

Thanks,

Hui.

> Thanks. Best,
>
> Roy
>>>>
>>>> Signed-off-by: Hui Wang <hui.wang@canonical.com>
>>> Was this behavior changed from the earlier kernels?  I thought this
>>> was left untouched because it's supposed to be set via udev rules or
>>> such.
>>
>> Oh, I don't know that,  according to my test with ubuntu rootfs, the 
>> runtime pm is not enabled on Intel's hda controllers. But with the 
>> sof driver, the controller driver calls runtime_allow() 
>> (soc/sof/sof-pci-dev.c), so I sent this patch.
>>
>> Regards,
>>
>> Hui.
>>
>>> OTOH, enabling the runtime PM is almost mandatory for modern systems,
>>> and I'm fine to apply this kind of forcible enablement.
>>>
>>>
>>> thanks,
>>>
>>> Takashi
>>>
>>>
>>>> ---
>>>>   sound/pci/hda/hda_intel.c | 2 ++
>>>>   1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
>>>> index 8519051a426e..779705bef88b 100644
>>>> --- a/sound/pci/hda/hda_intel.c
>>>> +++ b/sound/pci/hda/hda_intel.c
>>>> @@ -2356,6 +2356,8 @@ static int azx_probe_continue(struct azx *chip)
>>>>       if (azx_has_pm_runtime(chip)) {
>>>>           pm_runtime_use_autosuspend(&pci->dev);
>>>> +        if (!use_vga_switcheroo(chip))
>>>> +            pm_runtime_allow(&pci->dev);
>>>>           pm_runtime_put_autosuspend(&pci->dev);
>>>>       }
>>>> -- 
>>>> 2.17.1
>>>>
