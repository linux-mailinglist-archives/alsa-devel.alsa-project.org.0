Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6B979191E
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Sep 2023 15:49:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E9497F1;
	Mon,  4 Sep 2023 15:48:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E9497F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693835339;
	bh=arUhh/Kv/CyNjgswcHt7eMh6dp7uQ8qHxAr5cFxhojk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Q8MN/DcweSpDHP0k1QQscnWG5WEvp2xbT5xu4WTGWOMHwvBLgaq4eUdnv0FRf545z
	 nCtuywFQ2EtEN4ThBJSFp2wF05ZRWnj7N8ukSOdRpY89JBsZO36RXlXF3WiLtaKJA9
	 /TjF6upvoX+yt3GArOKI11GhrMKcOzfWqbqYJtY0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B828AF80537; Mon,  4 Sep 2023 15:48:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BDCCF80431;
	Mon,  4 Sep 2023 15:48:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA449F8047D; Mon,  4 Sep 2023 15:48:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6E570F80236
	for <alsa-devel@alsa-project.org>; Mon,  4 Sep 2023 15:47:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E570F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Wux5zVK9
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 384DiTQB024253;
	Mon, 4 Sep 2023 08:47:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=9lo+H9wIA0QecRCLjQGWgsacOvhyB7kUZKO0cOScbL4=; b=
	Wux5zVK9I6ysDTldkw439DZ7iuIxeZsjuqzuRQS+57uqzx7XMNyfiXf7OHZkcAZ9
	ROHzys19LxwRtld+luyTyX6FcujLO6vh1ywONFeXH0PYHK2jh5ktrIFg6OpIHSJQ
	nBWuUal7hP0QQYl7S9Eyuw2UokZzlc3q8N6WTrja7JI2QIGzW3UBuDWW2HfgO6Vz
	8nC6IMO5Jx5R8TqcBzrHhxoKPre2OOurKQAWog5B6cxZaJoO08vgCfTyIv7Jc/CH
	OwGOCLGun/IkRyvNzgbUnjbLbB2G6RvybZgGGm8tyW9GTU7nnU5wmvcdtWc5qeXq
	JdpNVcBuJ4vfOtO/Xd24zw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3sv1fhsxxx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Sep 2023 08:47:51 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Mon, 4 Sep
 2023 14:47:49 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Mon, 4 Sep 2023 14:47:49 +0100
Received: from [198.61.65.243] (LONN2DGDQ73.ad.cirrus.com [198.61.65.243])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 86A70B06;
	Mon,  4 Sep 2023 13:47:49 +0000 (UTC)
Message-ID: <0dc89771-07d5-6a3a-3ca6-7b99cf53ab98@opensource.cirrus.com>
Date: Mon, 4 Sep 2023 14:47:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v1] ALSA: hda: cs35l41: Support mute notifications for
 CS35L41 HDA
To: Takashi Iwai <tiwai@suse.de>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Vitaly Rodionov
	<vitalyr@opensource.cirrus.com>
References: <20230825120525.1337417-1-sbinding@opensource.cirrus.com>
 <87edjr7218.wl-tiwai@suse.de>
 <32a62c2f-5000-132c-255c-8ccd135ba60f@opensource.cirrus.com>
 <87h6oisz9c.wl-tiwai@suse.de>
 <71808adb-bf54-a34b-5a63-70d454e3d426@opensource.cirrus.com>
 <87zg22jf53.wl-tiwai@suse.de>
From: Stefan Binding <sbinding@opensource.cirrus.com>
In-Reply-To: <87zg22jf53.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: umK4einIf2IGBY1d8zKE3lvG83gXAtp7
X-Proofpoint-GUID: umK4einIf2IGBY1d8zKE3lvG83gXAtp7
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: EFCQAW6EZ4W3UDXZLI4KGH6TZCNKUC2S
X-Message-ID-Hash: EFCQAW6EZ4W3UDXZLI4KGH6TZCNKUC2S
X-MailFrom: prvs=461170b156=sbinding@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EFCQAW6EZ4W3UDXZLI4KGH6TZCNKUC2S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On 04/09/2023 13:29, Takashi Iwai wrote:
> On Mon, 04 Sep 2023 14:00:20 +0200,
> Stefan Binding wrote:
>>
>> On 29/08/2023 15:23, Takashi Iwai wrote:
>>> On Tue, 29 Aug 2023 16:18:12 +0200,
>>> Stefan Binding wrote:
>>>> On 25/08/2023 13:13, Takashi Iwai wrote:
>>>>> On Fri, 25 Aug 2023 14:05:25 +0200,
>>>>> Stefan Binding wrote:
>>>>>> From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
>>>>>>
>>>>>> Some laptops require a hardware based mute system, where when a hotkey
>>>>>> is pressed, it forces the amp to be muted.
>>>>>>
>>>>>> For CS35L41, when the hotkey is pressed, an acpi notification is sent
>>>>>> to the CS35L41 Device Node. The driver needs to handle this notification
>>>>>> and call a _DSM function to retrieve the mute state.
>>>>>>
>>>>>> Since the amp is only muted during playback, the driver will only mute
>>>>>> or unmute if playback is occurring, otherwise it will save the mute
>>>>>> state for when playback starts.
>>>>>>
>>>>>> Only one handler can be registered for the acpi notification, but all
>>>>>> amps need to receive that notification, we can register a single handler
>>>>>> inside the Realtek HDA driver, so that it can then notify through the
>>>>>> component framework.
>>>>>>
>>>>>> Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
>>>>>> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
>>>>> We don't do normally in this way.  The ACPI hot key handling is done
>>>>> via user-space, and user-space daemon triggers the mute of the
>>>>> system.
>>>>>
>>>>> Can't the ACPI notify the key event on those machines?
>>>> This feature is not the "normal" mute button on a keyboard, it is a
>>>> custom request
>>>> from a manufacturer which only mutes the audio on the speakers.
>>>> On previous generations, this was achieved using a GPIO controlled by
>>>> the BIOS/EC.
>>>> However, since CS35L41 does not have such GPIO, we must control it by
>>>> other means.
>>>>
>>>> Our solution, which we have to share with the Windows driver, it to use ACPI
>>>> notifications to tell the driver to mute the amps when the shortcut is
>>>> pressed.
>>>>
>>>> Does this seem like a valid exception to the typical approach?
>>> It's still the question whether we have to do this inevitably in the
>>> kernel in a way like that.  It sounds quite unusual.  Why this must be
>>> handled directly?  IOW, what's the difference from the "normal" mute
>>> button?
>>>
>>> And, even if we take this approach, it leaves the device muted without
>>> exposing it to user-space.  Then user wouldn't know what happens.
>>>
>>>
>>> thanks,
>>>
>>> Takashi
>> We spoke to the ODM for this system to get a more detailed explanation
>> of this feature.
>> The keyboard shortcut enables something called "Unobtrusive
>> Mode". According to their explanation:
>>
>> - Unobtrusive mode is distinct to normal mute, as it only mutes the speakers
>> - There is no requirement to update the volume controls, as the screen
>> backlight will be off anyway in this mode
>> - All other unobtrusive mode functions are enabled without user-space
>> dependencies, and they would prefer not to make speaker mute an
>> exception
> Thanks, it gives a bit better clue.
> The remaining question is rather the exact behavior of this
> "unobtrusive mode".  How is it triggered, and what's the exact
> expectation?  e.g. It must secretly mute the speaker?  That is, it
> must not  expose the mixer state change to user-space?  Or is it tied
> with the normal mixer state and user may unmute again?
>
>
> Takashi
 From what we understand, unobtrusive mode, which is activated by a 
keyboard shortcut (not a single key), performs several operations, such as:
- muting the speaker (headphones remain unmuted)
- dimming/shutting down the LCD backlight
- turning off keyboard backlight and any keyboard LEDs
Apart from muting the speaker, all of these operations are done in 
hardware, as the keyboard shortcut still works in the BIOS.
Previous laptops with this feature appear to use a GPIO to mute the 
speaker, and we are informed that on those laptops userspace was not 
informed of the mute.
Since CS35L41 does not have a GPIO mute, we had to use a different 
solution, involving ACPI notifications, which request the driver to mute.
The same mechanism is used in Windows.
Our understanding is that it is not intended for the mute to be 
overridden by userspace.
Similarly, on previous laptops, userspace could not override this mute, 
since it was not informed of it.

Thanks,
Stefan
