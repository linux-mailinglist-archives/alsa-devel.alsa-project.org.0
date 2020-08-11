Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D29A2418B2
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Aug 2020 11:06:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BB291666;
	Tue, 11 Aug 2020 11:05:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BB291666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597136759;
	bh=65wMe/vrbxH6QWAg42a9TL/u93FxqoQnbCzoo4WOEEg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YDnuABFc8QHqqe9VcQ9YSHU/uZoS8/dMQnoTVCJ1kes9pFbIbOWWOSXraPkWmkuNv
	 aGbYDrcoqwlOggDqDhRwyxmt+uW762CwUo4uZX9a57RjQzgNkYt7qoBtwEeC4HSI+v
	 a4Ot0mPgtJfUhWkko8eZmj08nLxfzkCQP97CDnG8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C39E0F800D3;
	Tue, 11 Aug 2020 11:04:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 645A2F8015B; Tue, 11 Aug 2020 11:04:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC17CF800D3
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 11:04:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC17CF800D3
Received: from 1.general.hwang4.us.vpn ([10.172.67.16])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1k5QCR-0002qD-5f; Tue, 11 Aug 2020 09:04:03 +0000
Subject: Re: [PATCH] ALSA: hda - fix the micmute led status for Lenovo
 ThinkCentre AIO
To: Kai-Heng Feng <kai.heng.feng@canonical.com>, Takashi Iwai <tiwai@suse.de>
References: <20200810021659.7429-1-hui.wang@canonical.com>
 <s5hd03z6min.wl-tiwai@suse.de>
 <c8ca5bd3-d9a1-6269-e088-6bc6e3936876@canonical.com>
 <s5ha6z36lk8.wl-tiwai@suse.de>
 <01D08974-C4EB-4820-9870-42B633DC19B3@canonical.com>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <36899086-0e36-5b9f-42cd-745e0c717871@canonical.com>
Date: Tue, 11 Aug 2020 17:03:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <01D08974-C4EB-4820-9870-42B633DC19B3@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 stable@vger.kernel.org
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


On 2020/8/11 下午4:56, Kai-Heng Feng wrote:
> Hi,
>
>> On Aug 10, 2020, at 14:51, Takashi Iwai <tiwai@suse.de> wrote:
>>
>> On Mon, 10 Aug 2020 08:34:36 +0200,
>> Hui Wang wrote:
>>>
>>> On 2020/8/10 下午2:30, Takashi Iwai wrote:
>>>> On Mon, 10 Aug 2020 04:16:59 +0200,
>>>> Hui Wang wrote:
>>>>> After installing the Ubuntu Linux, the micmute led status is not
>>>>> correct. Users expect that the led is on if the capture is disabled,
>>>>> but with the current kernel, the led is off with the capture disabled.
>>>>>
>>>>> We tried the old linux kernel like linux-4.15, there is no this issue.
>>>>> It looks like we introduced this issue when switching to the led_cdev.
>>>> The behavior can be controlled via "Mic Mute-LED Mode" enum kcontrol.
>>>> Which value does it have now?  If it's "Follow Capture", that's the
>>>> correct behavior.  OTOH, if it's "Follow Mute", the LED polarity is
>>>> indeed wrong.
>>> It is "Follow Mute",  if I change it to "Follow Capture" manually, the
>>> led status becomes correct.
>> OK, thanks for confirmation.  Applied now.
> I wonder if it's because how brightness value passed to gpio_mute_led_set() and micmute_led_set():
>
> static int gpio_mute_led_set(struct led_classdev *led_cdev,
>                               enum led_brightness brightness)
> {
>          struct hda_codec *codec = dev_to_hda_codec(led_cdev->dev->parent);
>          struct alc_spec *spec = codec->spec;
>
>          alc_update_gpio_led(codec, spec->gpio_mute_led_mask,
>                              spec->mute_led_polarity, !brightness);
>          return 0;
> }
>
> static int micmute_led_set(struct led_classdev *led_cdev,
>                             enum led_brightness brightness)
> {
>          struct hda_codec *codec = dev_to_hda_codec(led_cdev->dev->parent);
>          struct alc_spec *spec = codec->spec;
>
>          alc_update_gpio_led(codec, spec->gpio_mic_led_mask,
>                              spec->micmute_led_polarity, !!brightness);
>          return 0;
> }
>
> Maybe we should let micmute_led_set() match gpio_mute_led_set() so the micmute polarity can be removed?

This will impact many many machines, I don't know if the current code 
could work correctly or not on other machines.

Thanks,

Hui.

>
> Kai-Heng
>
>>
>> Takashi
