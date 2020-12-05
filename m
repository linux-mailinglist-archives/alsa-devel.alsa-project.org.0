Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB002CF8FD
	for <lists+alsa-devel@lfdr.de>; Sat,  5 Dec 2020 03:39:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FD5518B2;
	Sat,  5 Dec 2020 03:38:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FD5518B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607135972;
	bh=VwTXRe1DvVzs8Vphnn0ZtEKuOd/Nphz0hnHbP2Hl1tI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QBBNAOYyMPpX4ftOb4lLbf4DrE2ZO7uVhdGcq5UpeJE6ECMxadX2D0afItKIen4+q
	 8kIvxWa7EuGrcsfoxtjwKltZfgeNGC6mBWYye4TRGr/pzt3ZWj9h4OWpkk0z18ThDf
	 Wot5HmwaXIYMYtyQ7xc0396FPE0FGG2bGEw6wrIE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B8BDF80254;
	Sat,  5 Dec 2020 03:37:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3179F8016D; Sat,  5 Dec 2020 03:37:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53940F800E8
 for <alsa-devel@alsa-project.org>; Sat,  5 Dec 2020 03:37:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53940F800E8
Received: from [111.196.65.193] (helo=[192.168.0.105])
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1klNS8-0005UN-8U; Sat, 05 Dec 2020 02:37:40 +0000
Subject: Re: [PATCH] ALSA: hda/realtek: make bass spk volume adjustable on a
 yoga laptop
To: Takashi Iwai <tiwai@suse.de>
References: <20201204123459.71474-1-hui.wang@canonical.com>
 <s5hblf94lki.wl-tiwai@suse.de>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <37d313c3-3e1c-66a5-6c7a-ab5f71cf0d75@canonical.com>
Date: Sat, 5 Dec 2020 10:37:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <s5hblf94lki.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, stable@vger.kernel.org
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


On 12/4/20 11:50 PM, Takashi Iwai wrote:
> On Fri, 04 Dec 2020 13:34:59 +0100,
> Hui Wang wrote:
>> This also make the headset button work on this machine.
> Hm, the description isn't clearly related with the code changes.
> Could you elaborate a bit more?  The functions you changed are used
> commonly, so it needs clarification.
>
>
> thanks,
>
> Takashi

OK, will change the description in the v2.

Thanks,

Hui.

>
>> Cc: <stable@vger.kernel.org>
>> Signed-off-by: Hui Wang <hui.wang@canonical.com>
>> ---
>>   sound/pci/hda/patch_realtek.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
>> index 8616c5624870..5a905fa1b33a 100644
>> --- a/sound/pci/hda/patch_realtek.c
>> +++ b/sound/pci/hda/patch_realtek.c
>> @@ -3104,6 +3104,7 @@ static void alc_disable_headset_jack_key(struct hda_codec *codec)
>>   	case 0x10ec0215:
>>   	case 0x10ec0225:
>>   	case 0x10ec0285:
>> +	case 0x10ec0287:
>>   	case 0x10ec0295:
>>   	case 0x10ec0289:
>>   	case 0x10ec0299:
>> @@ -3130,6 +3131,7 @@ static void alc_enable_headset_jack_key(struct hda_codec *codec)
>>   	case 0x10ec0215:
>>   	case 0x10ec0225:
>>   	case 0x10ec0285:
>> +	case 0x10ec0287:
>>   	case 0x10ec0295:
>>   	case 0x10ec0289:
>>   	case 0x10ec0299:
>> @@ -8578,6 +8580,11 @@ static const struct snd_hda_pin_quirk alc269_pin_fixup_tbl[] = {
>>   		{0x14, 0x90170110},
>>   		{0x19, 0x04a11040},
>>   		{0x21, 0x04211020}),
>> +	SND_HDA_PIN_QUIRK(0x10ec0287, 0x17aa, "Lenovo", ALC285_FIXUP_THINKPAD_HEADSET_JACK,
>> +		{0x14, 0x90170110},
>> +		{0x17, 0x90170111},
>> +		{0x19, 0x03a11030},
>> +		{0x21, 0x03211020}),
>>   	SND_HDA_PIN_QUIRK(0x10ec0286, 0x1025, "Acer", ALC286_FIXUP_ACER_AIO_MIC_NO_PRESENCE,
>>   		{0x12, 0x90a60130},
>>   		{0x17, 0x90170110},
>> -- 
>> 2.25.1
>>
