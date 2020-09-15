Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBF8269AA5
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Sep 2020 02:45:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35323168D;
	Tue, 15 Sep 2020 02:45:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35323168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600130752;
	bh=r8OpBFUJaw9trizu1ZU7tomg1B6moUMLg7v27LTPZmg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GibywNTBYTkKrHlESEylN5qDguTX3XQDVXnHxvI9R5LBBTVdEHp3Nc32aRXKepQ5m
	 SPyOOx2FLpt+FOaix4uBcCzkIFYU0HETPVX0TZR/8hRbG7q0X9Sv5VtUWqDp2J6xx0
	 55tB2vvxXRENp07PJLDQQm+ld5eOhlDjFnrybuXU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26FE0F800F1;
	Tue, 15 Sep 2020 02:44:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 648B1F8015C; Tue, 15 Sep 2020 02:44:07 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9000F800AA
 for <alsa-devel@alsa-project.org>; Tue, 15 Sep 2020 02:34:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9000F800AA
Received: from [123.112.108.22] (helo=[192.168.0.106])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1kHyuw-0007LQ-2C; Tue, 15 Sep 2020 00:33:54 +0000
Subject: Re: [PATCH] ALSA: hda/realtek: Enable front panel headset LED on
 Lenovo ThinkStation P520
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
References: <20200914070231.13192-1-kai.heng.feng@canonical.com>
 <c4a9ed79-1c9d-8fbc-8c3b-eab191bd56bd@canonical.com>
 <07CC762F-BA94-43C0-A8C8-5B3C43291F3E@canonical.com>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <b3d97430-027e-a753-9c07-c16142735c5e@canonical.com>
Date: Tue, 15 Sep 2020 08:33:44 +0800
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

OK,  then looks fine to me.

Acked-by:Hui Wang <hui.wang@canonical.com>

On 2020/9/14 下午4:07, Kai-Heng Feng wrote:
> Hi Hui,
>
>> On Sep 14, 2020, at 16:04, Hui Wang <hui.wang@canonical.com> wrote:
>>
>> Thanks Kaiheng, and we just had one P520 in the Beijing office and I also worked on this issue happenly. Does the led change according to jack plugging in or plugging out with your patch?
> No, the LED won't reflect the jack plugging status.
>
> The LED is always on under Windows, so we are doing the same here.
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
