Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B717D3F8843
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Aug 2021 15:02:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41A2A167B;
	Thu, 26 Aug 2021 15:01:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41A2A167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629982927;
	bh=UwfqJ+xNETzFZOgfXrNC4G3t3z9T/npAXGAis3umquk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bl8KiRYt4ARTT1D8gi8WmxQH6s1x16djYI3iE2HY8wAmh0Zrtk5auhEmwP1OabTlL
	 2Z+7Kd0+8C3X/mZLY6NcAaTR68lN36Q98f4I5Swe7RJ7lV7tjrZf7wtRJeg81JLQrs
	 xSwPhHwhXpX5CWz3YM/FmQPuvY1g2DeJeJWPIi+Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7EE1F800FD;
	Thu, 26 Aug 2021 15:00:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADB8FF801D8; Thu, 26 Aug 2021 15:00:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BAF08F80054
 for <alsa-devel@alsa-project.org>; Thu, 26 Aug 2021 15:00:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAF08F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="QBD94bAv"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17Q5tlTu023865; 
 Thu, 26 Aug 2021 08:00:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=oaucBcNem0UqN0Yj7Scq1n2quOuJbSZoNlFoYuws1G0=;
 b=QBD94bAv92yoi1Sikua4Z43dEm2RcDustvL2tej6cSWRj4yavo8jpwGOO2yAGLTTXwkE
 8smADaIcn+vbCMZihJqdX2hiIekRdEhuiDUZG/sATgci4uiSauYkcn51kD17g9HkTf37
 vQ3JndvmWKT0e68l2P8jSZoUdVWs/0N8qtkj/kxGyu6DueaeU8oSpcZ5H9O+O8ys82yU
 nq9ygJdIqjdA0J+b6Nq116n6qozKLVvrzsX2aHe1Tazuu+U/Qz/Bsfd+QfRpKW9CkSX0
 xBptQr4xPNGOGXLltLZU+L9OPXg1aAjAp40tTfKvNAOPyqK4Zf2r7lNLbS0l1sbqyaxS SA== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3anr2espdj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 26 Aug 2021 08:00:35 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Thu, 26 Aug
 2021 14:00:33 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Thu, 26 Aug 2021 14:00:33 +0100
Received: from [198.90.238.186] (unknown [198.90.238.186])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E85112A9;
 Thu, 26 Aug 2021 13:00:32 +0000 (UTC)
Subject: Re: [PATCH 2/2] ALSA: hda/cs8409: Prevent pops and clicks during
 reboot
To: Takashi Iwai <tiwai@suse.de>
References: <20210812183433.6330-1-vitalyr@opensource.cirrus.com>
 <20210812183433.6330-2-vitalyr@opensource.cirrus.com>
 <s5h1r6xlvrs.wl-tiwai@suse.de> <s5hczqgil3v.wl-tiwai@suse.de>
 <6595e87d-1dae-b536-c17b-eafa07d04bbe@opensource.cirrus.com>
 <s5hpmuce05m.wl-tiwai@suse.de>
 <e3df5f97-bf43-7eb8-e15d-4ab11dbae7ef@opensource.cirrus.com>
 <s5hczq0yc72.wl-tiwai@suse.de> <s5hfsuwwkew.wl-tiwai@suse.de>
 <9a3c2f9e-e2a5-702f-bd3f-7348097a0500@opensource.cirrus.com>
 <s5h5yvswg6h.wl-tiwai@suse.de>
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Message-ID: <b6eec544-d4df-b951-362a-203ed2e049e1@opensource.cirrus.com>
Date: Thu, 26 Aug 2021 14:00:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <s5h5yvswg6h.wl-tiwai@suse.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Proofpoint-GUID: pvDxTqmUMzPhGB3SthY44mowqOvVEGWQ
X-Proofpoint-ORIG-GUID: pvDxTqmUMzPhGB3SthY44mowqOvVEGWQ
X-Proofpoint-Spam-Reason: safe
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

On 26/08/2021 1:20 pm, Takashi Iwai wrote:
> On Thu, 26 Aug 2021 13:49:32 +0200,
> Vitaly Rodionov wrote:
>> On 26/08/2021 11:49 am, Takashi Iwai wrote:
>>> On Thu, 26 Aug 2021 08:03:45 +0200,
>>> Takashi Iwai wrote:
>>>> On Wed, 25 Aug 2021 20:04:05 +0200,
>>>> Vitaly Rodionov wrote:
>>>>> Actually when codec is suspended and we do reboot from UI, then sometimes we
>>>>> see suspend() calls in kernel log and no pops, but sometimes
>>>>>
>>>>> we still have no suspend() on reboot and we hear pops. But when we do reboot
>>>>> from command line: > sudo reboot  then we always have pops and no suspend()
>>>>> called.
>>>>>
>>>>> Then we have added extra logging and we can see that on reboot codec somehow
>>>>> getting resume() call and we run jack detect on resume that causing pops.
>>>> Hm, it's interesting who triggers the runtime resume.
>>>>
>>>>> We were thinking about possible solution for that and we would propose some
>>>>> changes in generic code hda_bind.c:
>>>>>
>>>>> static void hda_codec_driver_shutdown(struct device *dev) { +   if (codec->
>>>>> patch_ops.suspend) +      codec->patch_ops.suspend(codec);
>>>>> snd_hda_codec_shutdown(dev_to_hda_codec(dev)); +  hda_codec_driver_remove
>>>>> (dev_to_hda_codec(dev)); }
>>>> Sorry, it's no-no.  The suspend can't be called unconditionally, and
>>>> the driver unbind must not be called in the callback itself.
>>>>
>>>> Does the patch below work instead?
>>> Sorry there was a typo.  A bit more revised patch is below.
>>>
>>>
>>> Takashi
>>>
>>> --- a/sound/pci/hda/hda_intel.c
>>> +++ b/sound/pci/hda/hda_intel.c
>>> @@ -1383,14 +1383,17 @@ static void azx_free(struct azx *chip)
>>>    	hda->freed = 1;
>>>    }
>>>    -static int azx_dev_disconnect(struct snd_device *device)
>>> +static void __azx_disconnect(struct azx *chip)
>>>    {
>>> -	struct azx *chip = device->device_data;
>>>    	struct hdac_bus *bus = azx_bus(chip);
>>>      	chip->bus.shutdown = 1;
>>>    	cancel_work_sync(&bus->unsol_work);
>>> +}
>>>    +static int azx_dev_disconnect(struct snd_device *device)
>>> +{
>>> +	__azx_disconnect(device->device_data);
>>>    	return 0;
>>>    }
>>>    @@ -2356,8 +2359,10 @@ static void azx_shutdown(struct pci_dev
>>> *pci)
>>>    	if (!card)
>>>    		return;
>>>    	chip = card->private_data;
>>> -	if (chip && chip->running)
>>> +	if (chip && chip->running) {
>>> +		__azx_disconnect(chip);
>>>    		azx_shutdown_chip(chip);
>>> +	}
>>>    }
>>>      /* PCI IDs */
>> Hi Takashi,
>>
>> Applied fix and tested on dolphin HW. Issue still there, here is
>> captured screen on reboot from command line:
>>
>> reboot capture
>>
>> Reboot from UI works differently, no resume() call in this case.
> Thanks for quick testing.
>
> After reconsideration, I believe we can even take a simpler path.
> Use pm_runtime_force_suspend(), and keep suspended by
> pm_runtime_disable() call afterwards.
>
> Below is another test patch.  Could you check whether this works
> better?
>
>
> Takashi
>
> --- a/sound/pci/hda/hda_codec.c
> +++ b/sound/pci/hda/hda_codec.c
> @@ -2986,13 +2986,11 @@ void snd_hda_codec_shutdown(struct hda_codec *codec)
>   {
>   	struct hda_pcm *cpcm;
>   
> -	if (pm_runtime_suspended(hda_codec_dev(codec)))
> -		return;
> -
>   	list_for_each_entry(cpcm, &codec->pcm_list_head, list)
>   		snd_pcm_suspend_all(cpcm->pcm);
>   
> -	pm_runtime_suspend(hda_codec_dev(codec));
> +	pm_runtime_force_suspend(hda_codec_dev(codec));
> +	pm_runtime_disable(hda_codec_dev(codec));
>   }
>   
>   /*

Hi Takashi,

Thank you very much! Yes, that works fine.  suspend() has been called on 
reboot and no pops.

I still have previous patch in the code, so let me remove it and test it 
again with only snd_hda_codec_shutdown() changes.

Thanks,

Vitaly



