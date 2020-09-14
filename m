Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B8B268723
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Sep 2020 10:23:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75A261687;
	Mon, 14 Sep 2020 10:22:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75A261687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600071829;
	bh=IXgb5kGiCJHA+MkZufTQkDVqjv6NHEgSvgNxx+j/aEk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rSJOlBiU7NiK7bxTUD/cHTSSvcKSCrf8cIXboL5I+sMKVrcyprBxEhas4UhKtCLW4
	 TRdKsOqCWzHY3+CaDCMm4Z4Vf9l4cu5nBsGuzXpZdDdyI9KixVkDVxjhP6QVp83Vzx
	 YIUhMqD7k6e0LKB0KH3+zco6htAE0KJd7HWAjZJQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70C6DF80105;
	Mon, 14 Sep 2020 10:22:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BD33F80105; Mon, 14 Sep 2020 10:22:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=NICE_REPLY_A,PRX_BODY_30,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2EBFCF80105
 for <alsa-devel@alsa-project.org>; Mon, 14 Sep 2020 10:21:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EBFCF80105
Received: from [125.35.49.90] (helo=[10.0.0.22])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1kHjkG-0004vh-Kg; Mon, 14 Sep 2020 08:21:53 +0000
Subject: Re: [PATCH] ALSA: hda/realtek: Enable front panel headset LED on
 Lenovo ThinkStation P520
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
References: <20200914070231.13192-1-kai.heng.feng@canonical.com>
 <c4a9ed79-1c9d-8fbc-8c3b-eab191bd56bd@canonical.com>
 <07CC762F-BA94-43C0-A8C8-5B3C43291F3E@canonical.com>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <041af07f-6168-19ed-dddd-1fd30a75b020@canonical.com>
Date: Mon, 14 Sep 2020 16:21:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <07CC762F-BA94-43C0-A8C8-5B3C43291F3E@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Kailang Yang <kailang@realtek.com>, tiwai@suse.com,
 open list <linux-kernel@vger.kernel.org>, Thomas Hebb <tommyhebb@gmail.com>,
 Huacai Chen <chenhc@lemote.com>, Jian-Hong Pan <jian-hong@endlessm.com>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
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


On 2020/9/14 下午4:07, Kai-Heng Feng wrote:
> Hi Hui,
>
>> On Sep 14, 2020, at 16:04, Hui Wang <hui.wang@canonical.com> wrote:
>>
>> Thanks Kaiheng, and we just had one P520 in the Beijing office and I also worked on this issue happenly. Does the led change according to jack plugging in or plugging out with your patch?
> No, the LED won't reflect the jack plugging status.
>
> The LED is always on under Windows, so we are doing the same here.

Weird, the bug's title is "The backlight for a headset connector didn't 
light up after connecting a headset" and the QA in Beijing office also 
requires the led could change according to plugging or no plugging.

>
> Kai-Heng
>
>> I also prepared a patchset but my patchset has more code than yours, please take a look. :-)
>>
>> Thanks.
>>
>> Hui.
>>
>> On 2020/9/14 下午3:02, Kai-Heng Feng wrote:
>>> On Lenovo P520, the front panel headset LED isn't lit up right now.
>>>
>>> Realtek states that the LED needs to be enabled by ALC233's GPIO2, so
>>> let's do it accordingly to light the LED up.
>>>
>>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>>> ---
>>>   sound/pci/hda/patch_realtek.c | 7 +++++++
>>>   1 file changed, 7 insertions(+)
>>>
>>> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
>>> index c521a1f17096..ba941bd0b792 100644
>>> --- a/sound/pci/hda/patch_realtek.c
>>> +++ b/sound/pci/hda/patch_realtek.c
>>> @@ -6017,6 +6017,7 @@ static void alc_fixup_thinkpad_acpi(struct hda_codec *codec,
>>>   #include "hp_x360_helper.c"
>>>     enum {
>>> +	ALC269_FIXUP_GPIO2,
>>>   	ALC269_FIXUP_SONY_VAIO,
>>>   	ALC275_FIXUP_SONY_VAIO_GPIO2,
>>>   	ALC269_FIXUP_DELL_M101Z,
>>> @@ -6194,6 +6195,10 @@ enum {
>>>   };
>>>     static const struct hda_fixup alc269_fixups[] = {
>>> +	[ALC269_FIXUP_GPIO2] = {
>>> +		.type = HDA_FIXUP_FUNC,
>>> +		.v.func = alc_fixup_gpio2,
>>> +	},
>>>   	[ALC269_FIXUP_SONY_VAIO] = {
>>>   		.type = HDA_FIXUP_PINCTLS,
>>>   		.v.pins = (const struct hda_pintbl[]) {
>>> @@ -7013,6 +7018,8 @@ static const struct hda_fixup alc269_fixups[] = {
>>>   	[ALC233_FIXUP_LENOVO_MULTI_CODECS] = {
>>>   		.type = HDA_FIXUP_FUNC,
>>>   		.v.func = alc233_alc662_fixup_lenovo_dual_codecs,
>>> +		.chained = true,
>>> +		.chain_id = ALC269_FIXUP_GPIO2
>>>   	},
>>>   	[ALC233_FIXUP_ACER_HEADSET_MIC] = {
>>>   		.type = HDA_FIXUP_VERBS,
