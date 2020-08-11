Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4D1241AB2
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Aug 2020 13:57:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D60101667;
	Tue, 11 Aug 2020 13:56:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D60101667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597147047;
	bh=LYEv1882wBs3l9V2OM1J4R/WOGYyyUPhyTE9oJDbPTQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Nz/TZhqSDkbQS+ejjU0bk2utJxN5NFS7D+KXro1rA0cJf6Ox9DXHZuVzjXWeL9rHp
	 DLJI6GeBf9NN0SIwddrYzcBVMjO5/oZ7Fv3SQLZeJRLeytY2asftTdax4oX4frp7tB
	 N4qNuVHL9qDEJwxDoK1hUPaHBZ6bX8Y+YFbKVPPI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E64AFF80161;
	Tue, 11 Aug 2020 13:55:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67F68F8015B; Tue, 11 Aug 2020 13:55:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57D45F800D3
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 13:55:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57D45F800D3
Received: from [114.253.245.60] (helo=[192.168.0.104])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1k5SsN-0007ux-SK; Tue, 11 Aug 2020 11:55:32 +0000
Subject: Re: [PATCH] ALSA: hda - fix the micmute led status for Lenovo
 ThinkCentre AIO
To: Takashi Iwai <tiwai@suse.de>
References: <20200810021659.7429-1-hui.wang@canonical.com>
 <s5hd03z6min.wl-tiwai@suse.de>
 <c8ca5bd3-d9a1-6269-e088-6bc6e3936876@canonical.com>
 <s5ha6z36lk8.wl-tiwai@suse.de>
 <01D08974-C4EB-4820-9870-42B633DC19B3@canonical.com>
 <36899086-0e36-5b9f-42cd-745e0c717871@canonical.com>
 <s5hk0y535bg.wl-tiwai@suse.de>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <043a0708-d6d0-3a5e-00e0-cb3486583e67@canonical.com>
Date: Tue, 11 Aug 2020 19:55:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <s5hk0y535bg.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>, stable@vger.kernel.org
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


On 2020/8/11 下午5:22, Takashi Iwai wrote:
> On Tue, 11 Aug 2020 11:03:55 +0200,
> Hui Wang wrote:
>>
>> On 2020/8/11 下午4:56, Kai-Heng Feng wrote:
>>> Hi,
>>>
>>>> On Aug 10, 2020, at 14:51, Takashi Iwai <tiwai@suse.de> wrote:
>>>>
>>>> On Mon, 10 Aug 2020 08:34:36 +0200,
>>>> Hui Wang wrote:
>>>>> On 2020/8/10 下午2:30, Takashi Iwai wrote:
>>>>>> On Mon, 10 Aug 2020 04:16:59 +0200,
>>>>>> Hui Wang wrote:
>>>>>>> After installing the Ubuntu Linux, the micmute led status is not
>>>>>>> correct. Users expect that the led is on if the capture is disabled,
>>>>>>> but with the current kernel, the led is off with the capture disabled.
>>>>>>>
>>>>>>> We tried the old linux kernel like linux-4.15, there is no this issue.
>>>>>>> It looks like we introduced this issue when switching to the led_cdev.
>>>>>> The behavior can be controlled via "Mic Mute-LED Mode" enum kcontrol.
>>>>>> Which value does it have now?  If it's "Follow Capture", that's the
>>>>>> correct behavior.  OTOH, if it's "Follow Mute", the LED polarity is
>>>>>> indeed wrong.
>>>>> It is "Follow Mute",  if I change it to "Follow Capture" manually, the
>>>>> led status becomes correct.
>>>> OK, thanks for confirmation.  Applied now.
>>> I wonder if it's because how brightness value passed to gpio_mute_led_set() and micmute_led_set():
>>>
>>> static int gpio_mute_led_set(struct led_classdev *led_cdev,
>>>                                enum led_brightness brightness)
>>> {
>>>           struct hda_codec *codec = dev_to_hda_codec(led_cdev->dev->parent);
>>>           struct alc_spec *spec = codec->spec;
>>>
>>>           alc_update_gpio_led(codec, spec->gpio_mute_led_mask,
>>>                               spec->mute_led_polarity, !brightness);
>>>           return 0;
>>> }
>>>
>>> static int micmute_led_set(struct led_classdev *led_cdev,
>>>                              enum led_brightness brightness)
>>> {
>>>           struct hda_codec *codec = dev_to_hda_codec(led_cdev->dev->parent);
>>>           struct alc_spec *spec = codec->spec;
>>>
>>>           alc_update_gpio_led(codec, spec->gpio_mic_led_mask,
>>>                               spec->micmute_led_polarity, !!brightness);
>>>           return 0;
>>> }
>>>
>>> Maybe we should let micmute_led_set() match gpio_mute_led_set() so the micmute polarity can be removed?
>> This will impact many many machines, I don't know if the current code
>> could work correctly or not on other machines.
> True.  But we should rather fix this, the current flag is illogical.
> I forgot about this problem while I also noticed during working on the
> led cdev conversion.
>
> I guess most of configurations can be verified with hda-emu or such.
> Let's see...

I just checked, the commit 87dc36482cab (ALSA: hda/realtek - Add LED 
class support for micmute LED) introduced this issue. In the 
micmute_led_set(), it set the led with the !!mic_mute.led_value, while 
before this commit, the driver sets the led with !mic_mute.led_value.

Add with this commit 7cdf8c49b1df (ALSA: hda: generic: Add a helper for 
mic-mute LED with LED classdev),  all micmute led updating will call 
micmute_led_set(). It impacts alc269_fixup_hp_gpio_led(), 
alc285_fixup_hp_gpio_led(), alc286_fixup_hp_gpio_led(), 
alc280_fixup_hp_gpio2_mic_hotkey() and 
alc233_fixup_lenovo_line2_mic_hotkey()

I think it is safe to change the micmute_led_set() and remove all 
spec->micmute_led_polarity = 1.

Let me write a patch.

Thanks,

Hui.

> .


>
> Takashi
