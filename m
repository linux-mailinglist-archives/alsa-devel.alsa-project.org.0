Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B54342B5E
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Mar 2021 10:04:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C3C31684;
	Sat, 20 Mar 2021 10:03:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C3C31684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616231076;
	bh=iDNH2B/b2jn6rDjyLWAC9Ap6xCr+KAUVMkYo0odQAok=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BGzRj3BaVMAOIFvJQDKDFg8E3vSfQ+xlFKwz5g1sIiuEY1QUlj6m1zKSGd/5mddA7
	 eUdOu2sfE++iqBXIeQnK6PbRhZVrMtAADJ0QxjvJTKE3L2GmotFMKvSdGJ7bLDWZ2R
	 yjc7jWUm2uDLCfNFfOxJjYR/7yX4bmtJc39vRur8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76002F80171;
	Sat, 20 Mar 2021 10:03:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3905EF80165; Sat, 20 Mar 2021 10:03:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46A03F800BB
 for <alsa-devel@alsa-project.org>; Sat, 20 Mar 2021 10:02:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46A03F800BB
Received: from [123.112.71.70] (helo=[192.168.0.106])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1lNXVT-00019g-PW; Sat, 20 Mar 2021 09:02:52 +0000
Subject: Re: [PATCH v2 2/2] ALSA: hda/realtek: call alc_update_headset_mode()
 in hp_automute_hook
To: Takashi Iwai <tiwai@suse.de>
References: <20210319075903.6480-1-hui.wang@canonical.com>
 <20210319075903.6480-2-hui.wang@canonical.com> <s5hlfajfnvw.wl-tiwai@suse.de>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <da978bec-89e8-03e0-a3b2-44a9910d4514@canonical.com>
Date: Sat, 20 Mar 2021 17:02:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <s5hlfajfnvw.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, kailang@realtek.com
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


On 3/19/21 6:17 PM, Takashi Iwai wrote:
> On Fri, 19 Mar 2021 08:59:03 +0100,
> Hui Wang wrote:
>> We found the alc_update_headset_mode() is not called on some machines
>> when unplugging the headset, as a result, the mode of the
>> ALC_HEADSET_MODE_UNPLUGGED can't be set, then the current_headset_type
>> is not cleared, if users plug a differnt type of headset next time,
>> the determine_headset_type() will not be called and the audio jack is
>> set to the headset type of previous time.
>>
>> On the Dell machines which connect the dmic to the PCH, if we open
>> the gnome-sound-setting and unplug the headset, this issue will
>> happen. Those machines disable the auto-mute by ucm and has no
>> internal mic in the input source, so the update_headset_mode() will
>> not be called by cap_sync_hook or automute_hook when unplugging, and
>> because the gnome-sound-setting is opened, the codec will not enter
>> the runtime_suspend state, so the update_headset_mode() will not be
>> called by alc_resume when unplugging. In this case the
>> hp_automute_hook is called when unplugging, so add
>> update_headset_mode() calling to this function.
>>
>> Signed-off-by: Hui Wang <hui.wang@canonical.com>
>> ---
>>   sound/pci/hda/patch_realtek.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
>> index 442e555de44c..c928704da20b 100644
>> --- a/sound/pci/hda/patch_realtek.c
>> +++ b/sound/pci/hda/patch_realtek.c
>> @@ -5447,6 +5447,7 @@ static void alc_update_headset_jack_cb(struct hda_codec *codec,
>>   				       struct hda_jack_callback *jack)
>>   {
>>   	snd_hda_gen_hp_automute(codec, jack);
>> +	alc_update_headset_mode(codec);
>>   }
> This change was described in the above, but ...
>
>>   
>>   static void alc_probe_headset_mode(struct hda_codec *codec)
>> @@ -5559,7 +5560,7 @@ static void alc288_update_headset_jack_cb(struct hda_codec *codec,
>>   {
>>   	struct alc_spec *spec = codec->spec;
>>   
>> -	alc_update_headset_jack_cb(codec, jack);
>> +	snd_hda_gen_hp_automute(codec, jack);
>>   	/* Headset Mic enable or disable, only for Dell Dino */
>>   	alc_update_gpio_data(codec, 0x40, spec->gen.hp_jack_present);
> This change isn't clear why it's needed from the description.
> Does it man that only ALC288 shouldn't call alc_update_headset_mode()
> by some reason?
Oh, I thought this is a normal audio jack, doesn't support 
headphone/headset and microphone. Will fix it in the v3.
>
> thanks,
>
> Takashi
