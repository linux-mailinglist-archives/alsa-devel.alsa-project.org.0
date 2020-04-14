Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A6B1A7CFA
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 15:19:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 154FC16A4;
	Tue, 14 Apr 2020 15:18:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 154FC16A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586870345;
	bh=n6+tUMS+PVSs7g3tlr9CEe7sR5/7I9PXzkO/wY61NUo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ki1sxvaLXUpvMtZ3VjAPPzFua5H25Wg5ODRrzF8kNOh3p5nRs9BFIxvXK1+XcUjbb
	 lBHXasAu1h8ta6yhbQDsGz/O3x0PPGoH93AEI3N6MQkkYJ7obBGy4pp1aAxAf6EE+2
	 +1GnNsbwOD3r+6eMf2I6H+G12JMU5bUUG/tp9/lg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28796F8014E;
	Tue, 14 Apr 2020 15:17:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E777F8013D; Tue, 14 Apr 2020 15:17:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92EF6F800B9
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 15:17:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92EF6F800B9
Received: from [222.130.141.248] (helo=[192.168.2.104])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1jOLRE-0004kb-Iy; Tue, 14 Apr 2020 13:17:17 +0000
Subject: Re: [PATCH] ALSA: hda: enable the runtime_pm for non-vgaswitcheroo
 hda controllers
To: Takashi Iwai <tiwai@suse.de>, Roy Spliet <nouveau@spliet.org>
References: <20200414101405.6992-1-hui.wang@canonical.com>
 <s5hmu7ejra2.wl-tiwai@suse.de>
 <121237cf-8ef9-2a21-8ee3-6c6954e846e2@canonical.com>
 <d73a3c02-360b-12d9-6e4b-fff60f819cd6@spliet.org>
 <9e8a7b1b-decc-d149-6b86-01946df82d54@canonical.com>
 <e2a309ca-158e-3788-cb11-30bdc6f18aea@spliet.org>
 <s5hy2qyi5dz.wl-tiwai@suse.de>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <49ede1ef-db51-400f-bf41-b3182042de22@canonical.com>
Date: Tue, 14 Apr 2020 21:17:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <s5hy2qyi5dz.wl-tiwai@suse.de>
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


On 2020/4/14 下午9:06, Takashi Iwai wrote:
> On Tue, 14 Apr 2020 14:59:01 +0200,
> Roy Spliet wrote:
>> Op 14-04-2020 om 13:56 schreef Hui Wang:
>>> On 2020/4/14 下午8:42, Roy Spliet wrote:
>>>> Dear Hui, Takashi,
>>>>
>>>> Op 14-04-2020 om 13:35 schreef Hui Wang:
>>>>> On 2020/4/14 下午6:27, Takashi Iwai wrote:
>>>>>> On Tue, 14 Apr 2020 12:14:05 +0200,
>>>>>> Hui Wang wrote:
>>>>>>> Before the pci_driver->probe() is called, the pci subsystem calls
>>>>>>> runtime_forbib() and runtime_get_sync() on this pci dev, so only call
>>>>>>> runtime_put_autosuspend() is not enough to enable the runtime_pm on
>>>>>>> this device.
>>>>>>>
>>>>>>> For controllers with vgaswitcheroo feature, the pci/quirks.c will call
>>>>>>> runtime_allow() for this dev, then the controllers could enter
>>>>>>> rt_idle/suspend/resume, but for non-vgaswitcheroo controllers like
>>>>>>> Intel hda controllers, the runtime_pm is not enabled even it calls
>>>>>>> put_autosuspend(). Need to call runtime_allow() for those controllers
>>>>>>> in the hda driver.
>>>>  From what I can tell there are no ill effects of calling
>>>> runtime_allow() twice. Technically, the check against
>>>> use_vga_switcheroo() is thus redundant.
>>>> Is there a good reason why runtime_allow() is called in the pci
>>>> quirks rather than in hda_intel? Is it a suggestion to perform this
>>>> call in hda_intel regardless of whether it's a switcheroo-device or
>>>> not, and removing calls to runtime_allow() from the PCI quirks?
>>> I guess after the hda driver calls the _allow() unconditionally, we
>>> could remove the _allow() in the pci/quirks.c. But it is no harm
>>> keeping it since _allow() could be called many times.
>> After a bit of research, I agree! It's better left in place in the PCI
>> quirks, such that in the case that hda_intel doesn't load or bind for
>> whatever reason (not compiled in e.g. an embedded kernel, new/unknown
>> PCI vendor/device identifier), the GPUs HDA device can still run-time
>> suspend.
> Right, some background information is found in the original commit
> that introduced the quirk (07f4f97d7b4b).
>
> Hui, care to resend the patch with that change, also a bit refreshing
> the patch description?

OK.

Thanks.

>
> thanks,
>
> Takashi
>
>
>> Thank you! Best,
>>
>> Roy
>>
>>> Thanks,
>>>
>>> Hui.
>>>
>>>> Thanks. Best,
>>>>
>>>> Roy
>>>>>>> Signed-off-by: Hui Wang <hui.wang@canonical.com>
>>>>>> Was this behavior changed from the earlier kernels?  I thought this
>>>>>> was left untouched because it's supposed to be set via udev rules or
>>>>>> such.
>>>>> Oh, I don't know that,  according to my test with ubuntu rootfs,
>>>>> the runtime pm is not enabled on Intel's hda controllers. But with
>>>>> the sof driver, the controller driver calls runtime_allow()
>>>>> (soc/sof/sof-pci-dev.c), so I sent this patch.
>>>>>
>>>>> Regards,
>>>>>
>>>>> Hui.
>>>>>
>>>>>> OTOH, enabling the runtime PM is almost mandatory for modern systems,
>>>>>> and I'm fine to apply this kind of forcible enablement.
>>>>>>
>>>>>>
>>>>>> thanks,
>>>>>>
>>>>>> Takashi
>>>>>>
>>>>>>
>>>>>>> ---
>>>>>>>    sound/pci/hda/hda_intel.c | 2 ++
>>>>>>>    1 file changed, 2 insertions(+)
>>>>>>>
>>>>>>> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
>>>>>>> index 8519051a426e..779705bef88b 100644
>>>>>>> --- a/sound/pci/hda/hda_intel.c
>>>>>>> +++ b/sound/pci/hda/hda_intel.c
>>>>>>> @@ -2356,6 +2356,8 @@ static int azx_probe_continue(struct azx *chip)
>>>>>>>        if (azx_has_pm_runtime(chip)) {
>>>>>>>            pm_runtime_use_autosuspend(&pci->dev);
>>>>>>> +        if (!use_vga_switcheroo(chip))
>>>>>>> +            pm_runtime_allow(&pci->dev);
>>>>>>>            pm_runtime_put_autosuspend(&pci->dev);
>>>>>>>        }
>>>>>>> -- 
>>>>>>> 2.17.1
>>>>>>>
