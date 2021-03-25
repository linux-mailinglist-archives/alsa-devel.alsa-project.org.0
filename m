Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E52348D21
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Mar 2021 10:39:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1DACE1674;
	Thu, 25 Mar 2021 10:38:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1DACE1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616665152;
	bh=2tpuLMQCwpz37mrD0+0uSUwgBgfcTGRt6zJl2TkZLdw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a1zpYRjhbgrKGVmQAxfI86/5P3Enq0iMXX1+0kT/N+sWRjNFeq3RMJokE76Q+M1Ho
	 QmrIs9r0dRYw2tM2eAevpXsBBeJP7sdjpYIWR9m1Vycl9s+9c/bki4z98TFzVJenwZ
	 WthETif3vgrnQ9pkHeMouFvLVAwGvQ3r1fSD+XWA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 220D4F8026F;
	Thu, 25 Mar 2021 10:38:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2EB1F8026D; Thu, 25 Mar 2021 10:38:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90490F80104
 for <alsa-devel@alsa-project.org>; Thu, 25 Mar 2021 10:38:06 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id E5C64A0042;
 Thu, 25 Mar 2021 10:38:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz E5C64A0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1616665085; bh=m40vUxZYaBCFgv5JXNt+otVXhF33b32KBeePsOXeylE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=COtQgjIf7SS1U+9r6pyVoZgOEQL5VrPbPU+Zey6x7BDrCppwysRmKEzFt8ID44Adi
 M4+g6/8BU6wmB/hQbkC6xGXiVbQFNtdgzSBPVyBlhEvHJAUpqVYdKchaXEAT31rwoX
 ei5aRoS8LcZUzo8QVn+nzwhcJWCXg5zP/hmvTyM8=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 25 Mar 2021 10:37:52 +0100 (CET)
Subject: Re: [PATCH v4 2/2] ASoC: rt715:add micmute led state control supports
To: "Yuan, Perry" <Perry.Yuan@dell.com>, Mark Brown <broonie@kernel.org>,
 "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
 "Limonciello, Mario" <Mario.Limonciello@dell.com>,
 "hdegoede@redhat.com" <hdegoede@redhat.com>
References: <20210301093834.19524-1-Perry_Yuan@Dell.com>
 <20210308172409.GF4656@sirena.org.uk>
 <SJ0PR19MB4528847687FEEE4A4DED8E3F84659@SJ0PR19MB4528.namprd19.prod.outlook.com>
 <604693cc-08c7-2b5f-632a-58ed537c54a0@perex.cz>
 <SJ0PR19MB4528A75314336D1B756CAFE784629@SJ0PR19MB4528.namprd19.prod.outlook.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <8719e146-3606-aec7-5ba1-fceba383be51@perex.cz>
Date: Thu, 25 Mar 2021 10:37:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <SJ0PR19MB4528A75314336D1B756CAFE784629@SJ0PR19MB4528.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "oder_chiou@realtek.com" <oder_chiou@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "mgross@linux.intel.com" <mgross@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "pobrn@protonmail.com" <pobrn@protonmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
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

Dne 25. 03. 21 v 9:19 Yuan, Perry napsal(a):
> Hi Jaroslav:
> 
>> -----Original Message-----
>> From: Jaroslav Kysela <perex@perex.cz>
>> Sent: Monday, March 22, 2021 10:38 PM
>> To: Yuan, Perry; Mark Brown; pierre-louis.bossart@linux.intel.com;
>> Limonciello, Mario; hdegoede@redhat.com
>> Cc: pobrn@protonmail.com; oder_chiou@realtek.com; tiwai@suse.com;
>> mgross@linux.intel.com; lgirdwood@gmail.com; alsa-devel@alsa-
>> project.org; linux-kernel@vger.kernel.org; platform-driver-
>> x86@vger.kernel.org
>> Subject: Re: [PATCH v4 2/2] ASoC: rt715:add micmute led state control
>> supports
>>
>>
>> [EXTERNAL EMAIL]
>>
>> Dne 22. 03. 21 v 10:25 Yuan, Perry napsal(a):
>>> Hi Mark:
>>>
>>>> -----Original Message-----
>>>> From: Mark Brown <broonie@kernel.org>
>>>> Sent: Tuesday, March 9, 2021 1:24 AM
>>>> To: Yuan, Perry
>>>> Cc: pobrn@protonmail.com; pierre-louis.bossart@linux.intel.com;
>>>> oder_chiou@realtek.com; perex@perex.cz; tiwai@suse.com;
>>>> hdegoede@redhat.com; mgross@linux.intel.com; Limonciello, Mario;
>>>> lgirdwood@gmail.com; alsa-devel@alsa-project.org; linux-
>>>> kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org
>>>> Subject: Re: [PATCH v4 2/2] ASoC: rt715:add micmute led state control
>>>> supports
>>>>
>>>> On Mon, Mar 01, 2021 at 05:38:34PM +0800, Perry Yuan wrote:
>>>>
>>>>> +	/* Micmute LED state changed by muted/unmute switch */
>>>>> +	if (mc->invert) {
>>>>> +		if (ucontrol->value.integer.value[0] || ucontrol-
>>>>> value.integer.value[1]) {
>>>>> +			micmute_led = LED_OFF;
>>>>> +		} else {
>>>>> +			micmute_led = LED_ON;
>>>>> +		}
>>>>> +		ledtrig_audio_set(LED_AUDIO_MICMUTE, micmute_led);
>>>>> +	}
>>>>
>>>> These conditionals on inversion seem weird and counterintuitive.  If
>>>> we're going with this approach it would probably be clearer to define
>>>> a custom operation for the affected controls that wraps the standard
>>>> one and adds the LED setting rather than keying off invert like this.
>>>
>>> Currently the sof soundwire driver has no generic led control yet.
>>> This patch can handle the led control needs for MIC mute LED, definitely
>> the patch is a short term solution.
>>> There is a feature request discussion when we started to implement this
>> solution.
>>> https://github.com/thesofproject/linux/issues/2496#issuecomment-
>> 713892
>>> 620
>>>
>>> The workable way for now is that we put the LED mute control to the
>> codec driver.
>>> When there is new and full sound LED solution implemented, this part
>> will be also optimized.
>>> The Hardware privacy feature needs this patch to handle the Mic mute
>> led state change.
>>> Before that full solution ready in kernel, could we take this as short term
>> solution?
>>
>> Perry, it's about the machine detection. Your code is too much generic even
>> for the top-level LED trigger implementation. We need an extra check, if the
>> proper LED's are really controlled on the specific hardware. Other hardware
>> may use RT715 for a different purpose. Use DMI / ACPI checks to detect this
>> hardware and don't misuse the inversion flag to enable this code.
>>
>> 						Jaroslav
>>
>> --
>> Jaroslav Kysela <perex@perex.cz>
>> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
> 
> In the V2 patch, I have added the machine detection, but some guys thought that I should remove the detection for it is harmless to other system
> So I remove it in the following patches.
> 
> Is it Ok for you if I add below detection of Dell system which enable the privacy feature ?
>  
> Then the mute led control will be called normally and Mic mute will be successfully configured.
> There is no any impaction to other systems.
> 
> 
> +#if IS_ENABLED(CONFIG_DELL_PRIVACY) 
> .....
> +#endif

I think that you misunderstood the request. It's about the runtime detection
not about the compile time detection. An example for DMI check is in
sound/soc/intel/boards/sof_sdw.c / sof_sdw_quirk_table .

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
