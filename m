Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D1523B1A3
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Aug 2020 02:23:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 908B81670;
	Tue,  4 Aug 2020 02:22:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 908B81670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596500607;
	bh=TFjPfLZZt3q/ZEtdfUGnfTUPtkYeovXYAoEeMJ4SwSE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bb69SCs5H65cyvX+HlQsajpYSCKJdk17QCdLwaLLFUl+JCQygjVrVBRXO4oEtMFVK
	 ROjyyC/uhJMi5a8HfSKlIbjSH7GaxkEwbqmodorDtiTeaQHAduYGTZc0ssh+rGSeKB
	 GUfX94EeC87nUbfZ2zL06i2jJkcBP1BTlCQPoP4A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9CA0F800B7;
	Tue,  4 Aug 2020 02:21:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8ED3F80218; Tue,  4 Aug 2020 02:21:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=NICE_REPLY_A,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8C2AF800BD
 for <alsa-devel@alsa-project.org>; Tue,  4 Aug 2020 02:21:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8C2AF800BD
Received: from [114.252.213.24] (helo=[192.168.0.104])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1k2ki1-000136-Dk; Tue, 04 Aug 2020 00:21:37 +0000
Subject: Re: [PATCH] Revert "ALSA: hda: call runtime_allow() for all hda
 controllers"
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>
References: <20200803064638.6139-1-hui.wang@canonical.com>
 <0db4f5fe-7895-2d00-8ce3-96f1245000ab@linux.intel.com>
 <s5hwo2f3cux.wl-tiwai@suse.de>
 <6f583ccc-2251-384d-bc20-aa17c83a45b4@linux.intel.com>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <e832bdc6-99d2-072d-87c4-2bbc868c099e@canonical.com>
Date: Tue, 4 Aug 2020 08:21:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6f583ccc-2251-384d-bc20-aa17c83a45b4@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, stable@vger.kernel.org
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


On 2020/8/4 上午1:00, Pierre-Louis Bossart wrote:
>
>
> On 8/3/20 11:36 AM, Takashi Iwai wrote:
>> On Mon, 03 Aug 2020 17:27:12 +0200,
>> Pierre-Louis Bossart wrote:
>>>
>>>
>>>
>>> On 8/3/20 1:46 AM, Hui Wang wrote:
>>>> This reverts commit 9a6418487b56 ("ALSA: hda: call runtime_allow()
>>>> for all hda controllers").
>>>>
>>>> The reverted patch already introduced some regressions on some
>>>> machines:
>>>>    - on gemini-lake machines, the error of "azx_get_response timeout"
>>>>      happens in the hda driver.
>>>>    - on the machines with alc662 codec, the audio jack detection 
>>>> doesn't
>>>>      work anymore.
>>>>
>>>> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=208511
>>>> Cc: <stable@vger.kernel.org>
>>>> Signed-off-by: Hui Wang <hui.wang@canonical.com>
>>>> ---
>>>>    sound/pci/hda/hda_intel.c | 1 -
>>>>    1 file changed, 1 deletion(-)
>>>>
>>>> diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
>>>> index e699873c8293..e34a4d5d047c 100644
>>>> --- a/sound/pci/hda/hda_intel.c
>>>> +++ b/sound/pci/hda/hda_intel.c
>>>> @@ -2352,7 +2352,6 @@ static int azx_probe_continue(struct azx *chip)
>>>>          if (azx_has_pm_runtime(chip)) {
>>>>            pm_runtime_use_autosuspend(&pci->dev);
>>>> -        pm_runtime_allow(&pci->dev);
>>>>            pm_runtime_put_autosuspend(&pci->dev);
>>>>        }
>>>
>>> Do I get this right that this permanently disables pm_runtime on all
>>> Intel HDaudio controllers?
>>
>> It just drops the unconditional enablement of runtime PM.
>> It can be enabled via sysfs, and that's the old default (let admin
>> enabling it via udev or whatever).
>
> Sorry I am confused now.
> Kai seemed to suggest in the Bugzilla comments that this would be 
> temporary, until these problems with i915 and ALC662 get fixed?

I planed to debug the issue of ALC662, but so far, I haven't got the 
machine,  It is difficult to debug power issues without a physical 
machine. Once I get the machine, I will debug it and try to find the 
root cause.

Thanks,

Hui.

