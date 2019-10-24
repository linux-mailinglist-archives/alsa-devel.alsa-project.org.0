Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6F1E2F9C
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Oct 2019 12:56:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACE9F167E;
	Thu, 24 Oct 2019 12:56:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACE9F167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571914611;
	bh=KmXUkAmMGso/pWBlnBsH9WPxzBb+FJhhtc7ErazS9p4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UyJ4C63Q88L55qfcQKcJJQ9/Sn73CXZOGNi8NeohXOcoM0S9GHgJWAnukGA0VxFW7
	 bf4mWzB5ZXzsli3SlOYCFwhj1TNs6yeWCoy7MCoGdL5sr1eNU0uAskJCWaIfGWreoH
	 YZyHrDPYyWp5hTdN96v9QSplZEvxoOoTbZ+HMfK4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E6D6F80377;
	Thu, 24 Oct 2019 12:55:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F86CF8036B; Thu, 24 Oct 2019 12:55:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9864BF80137
 for <alsa-devel@alsa-project.org>; Thu, 24 Oct 2019 12:55:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9864BF80137
Received: from [114.245.47.48] (helo=localhost.localdomain)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <aaron.ma@canonical.com>)
 id 1iNalg-0000GJ-H0; Thu, 24 Oct 2019 10:55:01 +0000
To: Takashi Iwai <tiwai@suse.de>, Kailang <kailang@realtek.com>
References: <20191022153855.14368-1-aaron.ma@canonical.com>
 <s5hpniodaq4.wl-tiwai@suse.de> <848ebd7fd86e4c05936e70f500f718e9@realtek.com>
 <892889ae-0ce1-fbf6-d19f-50a5686e84c2@canonical.com>
 <ed97b6a8bd9445ecb48bc763d9aaba7a@realtek.com> <s5ha79qxwh3.wl-tiwai@suse.de>
From: Aaron Ma <aaron.ma@canonical.com>
Autocrypt: addr=aaron.ma@canonical.com; prefer-encrypt=mutual; keydata=
 mQENBFffeLkBCACi4eE4dPsgWN6B9UDOVcAvb5QgU/hRG6yS0I1lGKQv4KA+bke0c5g8clbO
 9gIlIl2bityfA9NzBsDik4Iei3AxMbFyxv9keMwcOFQBIOZF0P3f05qjxftF8P+yp9QTV4hp
 BkFzsXzWRgXN3r8hU8wqZybepF4B1C83sm2kQ5A5N0AUGbZli9i2G+/VscG9sWfLy8T7f4YW
 MjmlijCjoV6k29vsmTWQPZ7EApNpvR5BnZQPmQWzkkr0lNXlsKcyLgefQtlwg6drK4fe4wz0
 ouBIHJEiXE1LWK1hUzkCUASra4WRwKk1Mv/NLLE/aJRqEvF2ukt3uVuM77RWfl7/H/v5ABEB
 AAG0IUFhcm9uIE1hIDxhYXJvbi5tYUBjYW5vbmljYWwuY29tPokBNwQTAQgAIQUCV994uQIb
 AwULCQgHAgYVCAkKCwIEFgIDAQIeAQIXgAAKCRDNxCzQfVU6ntJ9B/9aVy0+RkLqF9QpLmw+
 LAf1m3Fd+4ZarPTerqDqkLla3ekYhbrEtlI1mYuB5f+gtrIjmcW27gacHdslKB9YwaL8B4ZB
 GJKhcrntLg4YPzYUnXZkHHTv1hMw7fBYw82cBT+EbG0Djh6Po6Ihqyr3auHhfFcp1PZH4Mtq
 6hN5KaDZzF/go+tRF5e4bn61Nhdue7mrhFSlfkzLG2ehHWmRV+S91ksH81YDFnazK0sRINBx
 V1S8ts3WJ2f1AbgmnDlbK3c/AfI5YxnIHn/x2ZdXj1P/wn7DgZHmpMy5DMuk0gN34NLUPLA/
 cHeKoBAF8emugljiKecKBpMTLe8FrVOxbkrauQENBFffeLkBCACweKP3Wx+gK81+rOUpuQ00
 sCyKzdtMuXXJ7oL4GzYHbLfJq+F+UHpQbytVGTn3R5+Y61v41g2zTYZooaC+Hs1+ixf+buG2
 +2LZjPSELWPNzH9lsKNlCcEvu1XhyyHkBDbnFFHWlUlql3nSXMo//dOTG/XGKaEaZUxjCLUC
 8ehLc16DJDvdXsPwWhHrCH/4k92F6qQ14QigBMsl75jDTDJMEYgRYEBT1D/bwxdIeoN1BfIG
 mYgf059RrWax4SMiJtVDSUuDOpdwoEcZ0FWesRfbFrM+k/XKiIbjMZSvLunA4FIsOdWYOob4
 Hh0rsm1G+fBLYtT+bE26OWpQ/lSn4TdhABEBAAGJAR8EGAEIAAkFAlffeLkCGwwACgkQzcQs
 0H1VOp6p5Af/ap5EVuP1AhFdPD3pXLNrUUt72W3cuAOjXyss43qFC2YRjGfktrizsDjQU46g
 VKoD6EW9XUPgvYM+k8BJEoXDLhHWnCnMKlbHP3OImxzLRhF4kdlnLicz1zKRcessQatRpJgG
 NIiD+eFyh0CZcWBO1BB5rWikjO/idicHao2stFdaBmIeXvhT9Xp6XNFEmzOmfHps+kKpWshY
 9LDAU0ERBNsW4bekOCa/QxfqcbZYRjrVQvya0EhrPhq0bBpzkIL/7QSBMcdv6IajTlHnLARF
 nAIofCEKeEl7+ksiRapL5Nykcbt4dldE3sQWxIybC94SZ4inENKw6I8RNpigWm0R5w==
Message-ID: <e618acfb-535f-e560-c135-a3fde43dae77@canonical.com>
Date: Thu, 24 Oct 2019 18:54:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <s5ha79qxwh3.wl-tiwai@suse.de>
Content-Language: en-US
Cc: "hui.wang@canonical.com" <hui.wang@canonical.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH] ALSA: hda/realtek - Fix 2 front mics of
	codec 0x623
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 10/24/19 6:35 PM, Takashi Iwai wrote:
> On Thu, 24 Oct 2019 09:20:19 +0200,
> Kailang wrote:
>>
>> Hi Takashi,
>>
>> Attach patch was support ALC623.
> 
> Thanks, applied now.
> 
> Aaron, could you rebase your patch and resubmit?
> 
> 

Yes I will.
One line of same changes.

Thanks,
Aaron

> Takashi
> 
>>
>> BR,
>> Kailang
>>
>>> -----Original Message-----
>>> From: Aaron Ma <aaron.ma@canonical.com>
>>> Sent: Wednesday, October 23, 2019 6:06 PM
>>> To: Kailang <kailang@realtek.com>; Takashi Iwai <tiwai@suse.de>
>>> Cc: perex@perex.cz; hui.wang@canonical.com; alsa-devel@alsa-project.org;
>>> linux-kernel@vger.kernel.org
>>> Subject: Re: [PATCH] ALSA: hda/realtek - Fix 2 front mics of codec 0x623
>>>
>>> On 10/23/19 4:44 PM, Kailang wrote:
>>>>
>>>>
>>>>> -----Original Message-----
>>>>> From: Takashi Iwai <tiwai@suse.de>
>>>>> Sent: Wednesday, October 23, 2019 12:08 AM
>>>>> To: Aaron Ma <aaron.ma@canonical.com>
>>>>> Cc: perex@perex.cz; Kailang <kailang@realtek.com>;
>>>>> hui.wang@canonical.com; alsa-devel@alsa-project.org;
>>>>> linux-kernel@vger.kernel.org
>>>>> Subject: Re: [PATCH] ALSA: hda/realtek - Fix 2 front mics of codec
>>>>> 0x623
>>>>>
>>>>> On Tue, 22 Oct 2019 17:38:55 +0200,
>>>>> Aaron Ma wrote:
>>>>>>
>>>>>> These 2 ThinkCentres installed a new realtek codec ID 0x623, it has
>>>>>> 2 front mics with the same location on pin 0x18 and 0x19.
>>>>>>
>>>>>> Apply fixup ALC283_FIXUP_HEADSET_MIC to change 1 front mic location
>>>>>> to right, then pulseaudio can handle them.
>>>>>> One "Front Mic" and one "Mic" will be shown, and audio output works
>>>>>> fine.
>>>>>>
>>>>>> Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
>>>>>
>>>>> I'd like to have Kailang's review about the new codec before applying.
>>>>>
>>>>> Kailang, could you take a look?
>>>> OK.
>>>> I will post you the patch for ALC623 codec tomorrow.
>>>> Thanks.
>>>
>>> Cc me too.
>>>
>>> Thank you.
>>> Aaron
>>>
>>>>
>>>>>
>>>>>
>>>>> thanks,
>>>>>
>>>>> Takashi
>>>>>
>>>>>> ---
>>>>>>  sound/pci/hda/patch_realtek.c | 3 +++
>>>>>>  1 file changed, 3 insertions(+)
>>>>>>
>>>>>> diff --git a/sound/pci/hda/patch_realtek.c
>>>>>> b/sound/pci/hda/patch_realtek.c index b000b36ac3c6..c34d8b435f58
>>>>>> 100644
>>>>>> --- a/sound/pci/hda/patch_realtek.c
>>>>>> +++ b/sound/pci/hda/patch_realtek.c
>>>>>> @@ -7186,6 +7186,8 @@ static const struct snd_pci_quirk
>>>>>> alc269_fixup_tbl[]
>>>>> = {
>>>>>>  	SND_PCI_QUIRK(0x17aa, 0x312f, "ThinkCentre Station",
>>>>> ALC294_FIXUP_LENOVO_MIC_LOCATION),
>>>>>>  	SND_PCI_QUIRK(0x17aa, 0x313c, "ThinkCentre Station",
>>>>> ALC294_FIXUP_LENOVO_MIC_LOCATION),
>>>>>>  	SND_PCI_QUIRK(0x17aa, 0x3151, "ThinkCentre Station",
>>>>>> ALC283_FIXUP_HEADSET_MIC),
>>>>>> +	SND_PCI_QUIRK(0x17aa, 0x3178, "ThinkCentre Station",
>>>>> ALC283_FIXUP_HEADSET_MIC),
>>>>>> +	SND_PCI_QUIRK(0x17aa, 0x3176, "ThinkCentre Station",
>>>>>> +ALC283_FIXUP_HEADSET_MIC),
>>>>>>  	SND_PCI_QUIRK(0x17aa, 0x3902, "Lenovo E50-80",
>>>>> ALC269_FIXUP_DMIC_THINKPAD_ACPI),
>>>>>>  	SND_PCI_QUIRK(0x17aa, 0x3977, "IdeaPad S210",
>>>>> ALC283_FIXUP_INT_MIC),
>>>>>>  	SND_PCI_QUIRK(0x17aa, 0x3978, "Lenovo B50-70",
>>>>>> ALC269_FIXUP_DMIC_THINKPAD_ACPI), @@ -9187,6 +9189,7 @@ static
>>>>> const struct hda_device_id snd_hda_id_realtek[] = {
>>>>>>  	HDA_CODEC_ENTRY(0x10ec0298, "ALC298", patch_alc269),
>>>>>>  	HDA_CODEC_ENTRY(0x10ec0299, "ALC299", patch_alc269),
>>>>>>  	HDA_CODEC_ENTRY(0x10ec0300, "ALC300", patch_alc269),
>>>>>> +	HDA_CODEC_ENTRY(0x10ec0623, "ALC623", patch_alc269),
>>>>>>  	HDA_CODEC_REV_ENTRY(0x10ec0861, 0x100340, "ALC660",
>>>>> patch_alc861),
>>>>>>  	HDA_CODEC_ENTRY(0x10ec0660, "ALC660-VD", patch_alc861vd),
>>>>>>  	HDA_CODEC_ENTRY(0x10ec0861, "ALC861", patch_alc861),
>>>>>> --
>>>>>> 2.17.1
>>>>>>
>>>>>
>>>>> ------Please consider the environment before printing this e-mail.
>> [2 0000-add-support-alc623.patch <application/octet-stream (base64)>]
>>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
