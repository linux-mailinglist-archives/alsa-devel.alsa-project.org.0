Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B59363E0A
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Apr 2021 10:54:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3010B851;
	Mon, 19 Apr 2021 10:54:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3010B851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618822494;
	bh=amXfTGNZuVah1sWrF1xDSCdGJ7sU+YXohrws/sRIUrc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RVFMcd42SasOB7PhmKg87fmOpuH4dvbBCvXw3Wash3L4wajsdlb8JBWSJnZOcJSjy
	 AFBQeGEnwNk81gyHAMtjP77dHhfXJ+S2DGikmIJuUtTbyN/wqadFv7+PPpUwWDTRAH
	 KxmxQXUNUY+gpizq3rIoCmKWzexP5AParBft01c0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E1F2F8019B;
	Mon, 19 Apr 2021 10:53:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5CB0DF80227; Mon, 19 Apr 2021 10:53:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_30,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C650FF800C5
 for <alsa-devel@alsa-project.org>; Mon, 19 Apr 2021 10:53:16 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id E6B9DA003F;
 Mon, 19 Apr 2021 10:53:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz E6B9DA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1618822395; bh=VCcX0eOhdUiAF3FdImVJr1aLUrp2jAo+B91EHPRx9kY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=G8vRVjU49wfDis4hQaoa0R5063pw9vddTirXoNYnY3Bt3eP7XnZJx3F+ej2JU4L7r
 qDTsiE9xgY5XmGUmBrc5zrDdOHYqseU3F4fPTBd+NV+hZnB27VywkwVM/COBlna3WN
 1RHjADK9zCfwa+GSM2Np/nOZWCy8s2+ET7gUGhJQ=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 19 Apr 2021 10:52:54 +0200 (CEST)
Subject: Re: [PATCH] ASoC: rt711-sdca: remove capture switch controls
To: "Yang, Libin" <libin.yang@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "shumingf@realtek.com" <shumingf@realtek.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>
References: <20210415091609.13695-1-shumingf@realtek.com>
 <6c5b52e2-c875-9b30-60dd-d4bec77a9215@linux.intel.com>
 <BN6PR11MB1652220DB80760FD18B8308290499@BN6PR11MB1652.namprd11.prod.outlook.com>
 <9146794c-d4a1-8dd8-4ab1-7c9c44a7703b@perex.cz>
 <MWHPR11MB1663671582DCB35BE88C5B5590499@MWHPR11MB1663.namprd11.prod.outlook.com>
 <606f8e2d-40d5-8de0-1a06-9c8da016652d@perex.cz>
 <MWHPR11MB1663B46AB115359FDBDDB29F90499@MWHPR11MB1663.namprd11.prod.outlook.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <d3aa7b7c-4384-9fd8-d814-e2bcbf0da9d2@perex.cz>
Date: Mon, 19 Apr 2021 10:52:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <MWHPR11MB1663B46AB115359FDBDDB29F90499@MWHPR11MB1663.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: "oder_chiou@realtek.com" <oder_chiou@realtek.com>,
 "jack.yu@realtek.com" <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "derek.fang@realtek.com" <derek.fang@realtek.com>,
 "flove@realtek.com" <flove@realtek.com>
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

Dne 19. 04. 21 v 9:17 Yang, Libin napsal(a):
> Hi Jaroslav,
> 
>> -----Original Message-----
>> From: Jaroslav Kysela <perex@perex.cz>
>> Sent: 2021年4月19日 14:57
>> To: Yang, Libin <libin.yang@intel.com>; Pierre-Louis Bossart <pierre-
>> louis.bossart@linux.intel.com>; shumingf@realtek.com; broonie@kernel.org;
>> lgirdwood@gmail.com
>> Cc: oder_chiou@realtek.com; jack.yu@realtek.com; alsa-devel@alsa-
>> project.org; lars@metafoo.de; derek.fang@realtek.com; flove@realtek.com
>> Subject: Re: [PATCH] ASoC: rt711-sdca: remove capture switch controls
>>
>> Dne 19. 04. 21 v 8:50 Yang, Libin napsal(a):
>>> Hi Jaroslav,
>>>
>>>> -----Original Message-----
>>>> From: Jaroslav Kysela <perex@perex.cz>
>>>> Sent: 2021年4月19日 14:32
>>>> To: Yang, Libin <libin.yang@intel.com>; Pierre-Louis Bossart <pierre-
>>>> louis.bossart@linux.intel.com>; shumingf@realtek.com;
>>>> broonie@kernel.org; lgirdwood@gmail.com
>>>> Cc: oder_chiou@realtek.com; jack.yu@realtek.com; alsa-devel@alsa-
>>>> project.org; lars@metafoo.de; derek.fang@realtek.com;
>>>> flove@realtek.com
>>>> Subject: Re: [PATCH] ASoC: rt711-sdca: remove capture switch controls
>>>>
>>>> Dne 19. 04. 21 v 7:14 Yang, Libin napsal(a):
>>>>> Hi Pierre,
>>>>>
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>>>>> Sent: 2021年4月15日 19:26
>>>>>> To: shumingf@realtek.com; broonie@kernel.org;
>> lgirdwood@gmail.com
>>>>>> Cc: oder_chiou@realtek.com; jack.yu@realtek.com; alsa-devel@alsa-
>>>>>> project.org; lars@metafoo.de; Yang, Libin <libin.yang@intel.com>;
>>>>>> derek.fang@realtek.com; flove@realtek.com
>>>>>> Subject: Re: [PATCH] ASoC: rt711-sdca: remove capture switch
>>>>>> controls
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 4/15/21 4:16 AM, shumingf@realtek.com wrote:
>>>>>>> From: Shuming Fan <shumingf@realtek.com>
>>>>>>>
>>>>>>> The settings of the switch control already set by DAPM event.
>>>>>>> These switch controls might the user confused why it can't disable
>>>>>>> the
>>>>>> capture.
>>>>>>
>>>>>> Sorry, not following. This control is used in the alsa-ucm-conf
>>>>>> that was just merged
>>>>>>
>>>>>> https://github.com/alsa-project/alsa-ucm-
>>>>>> conf/commit/197025656ec456331d1a34357b113913ec3b187f#diff-
>>>>>>
>>>>
>> 0e1c627ea89ee148fdb41aa6b3ba7851ba9c20eb43c1b87b9e0ce92164273dc3R
>>>>>> 7
>>>>>>
>>>>>> Is this saying this commit needs to be fixed with a follow-up PR?
>>>>>> Libin, are you working on this?
>>>>>
>>>>> Yes, I will submit a patch for UCM after this patch is merged.
>>>>>
>>>>> The background is Jaroslav requires using codec HW kcontrol for
>>>>> capture volume/switch. Shuming and I worked on it. At first we
>>>>> wanted to use FU0F to replace PGA kcontrol. But Shuming found FU0F
>>>>> is used in
>>>> DAPM.
>>>>> So it is not proper for the capture volume/switch. And Shuming will
>>>>> remove the FU0F kcontrol.
>>>>
>>>> Is switch control name aligned with the volume control name after
>>>> this change?
>>>
>>> This patch is removing "FU0F Capture Switch". Before this patch, there
>>> is "FU0F Capture Switch" and "FU0F Capture Volume". After this patch
>>> is applied, "FU0F Capture Switch" is removed. So the UCM
>>> https://github.com/alsa-project/alsa-ucm-
>> conf/blob/57ead84278f641d411e
>>> 3ccbb5c8a4b64141904ba/ucm2/codecs/rt711-sdca/init.conf#L7
>>> of "FU0F Capture Switch" setting needs to be removed.
>>>
>>>> I mean "A Capture Switch" + "A Capture Volume" not "A Capture Switch"
>>>> + "B Capture Volume".
>>>
>>> We couldn't find a proper codec kcontrol for RT711 capture. So we have
>>> to continue using PGA kcontrol.
>>
>> It's really confusing then. What does "FU0F Capture Volume" ? It's really
>> difficult to judge something when I don't know the codec diagram.
> 
> "FU0F Capture Volume" will still control the volume of rt711 capture.
> But "FU0F Capture Switch" will be removed. Because DAPM is using
> this the same node. These is a conflict when we do below:
> 1. mute "FU0F Capture Switch". And the kcontrol will mute the
>     Corresponding node in codec.
> 2. use arecord to capture from the rt711-sdca headset
> 3. DAPM will auto unmute the node which "FU0F Capture Switch" has 
>      muted.
> 4. So we will capture the sound, even "FU0F Capture Switch" shows the 
>     state is "muted" (this is wrong)
> 
> So Shuming decided to remove the "FU0F Capture Switch" kcontrol.

I see. In this case, the auto-route settings should differ from the mixer
settings. So the mute flag should be logical _OR_ from both DAPM and the mixer
settings. And because the codec is able to do the hw mute, why to prevent the
export of this feature?

So I propose do do (pseudo code):

struct rt711_sdca_priv {
	bool fu0f_dapm_mute;
	bool fu0f_mixer_mute;
};

/* called from both dapm event and kontrol put callback (on change) */
/* the dapm event and put callback will modify only rt711_sdca_priv fields */
static void set_f0f_mute(rt711_priv)
{
	int mute = rt711_priv->fu0f_dapm_mute || rt711_priv->fu0f_mixer_mute;
	set_fu0f_mute_register(mute);
}

With this implementation, all is consistent to the user space.

>> Anyway, the switch and volume for the given I/O should have identical name
>> and they should differ only in the suffix describing the stream and
>> functionality.
> 
> We won't touch "CaptureSwitch" and "CaptureVolume" for rt711-sdca.

Yes, but the hw controls should be used instead DSP controls, if they are
available.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
