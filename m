Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4548E3C2058
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Jul 2021 09:56:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE58E15F2;
	Fri,  9 Jul 2021 09:55:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE58E15F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625817403;
	bh=VHE0vFEd2oK7TYcUaw6/RffuRnmDmDupq1M82eetWh8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H5k8+dJ5FBZRSRkOo5cxobW+WCHebV+yIfmvYY2ZMyPpCYp+3RhESe8CzQRsDForQ
	 I4TaNSkuoEo9+e7H6lZ54Xlq8FmduPmcrLBrGzgqYmUhnA2zE79+b0uNd+r92YvvV/
	 QED1d0Hal4lfse1Ga8WyQSOR1X6260zXkuHkNxcA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31683F80171;
	Fri,  9 Jul 2021 09:55:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94FBDF80224; Fri,  9 Jul 2021 09:55:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80F17F8012A
 for <alsa-devel@alsa-project.org>; Fri,  9 Jul 2021 09:55:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80F17F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com
 header.b="HKvNx0LV"
Received: from [192.168.0.107] (unknown [123.112.64.126])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id D2B0540327; 
 Fri,  9 Jul 2021 07:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1625817304;
 bh=tmN0WBJgf6IfOdSnEspz8bRbAjRIL5smYwzeBHuLg0c=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type;
 b=HKvNx0LVD8RxvsB7qyKzL8eiWgOCXXJitokapjjletZ5IfCV755VnTeDyESRBxOzz
 mcCwPysMYiFTq/KWSGQIl8sQDK2aE6b7cWvWSOVH3mLDz0YAaV/h/DMWv8TWVaYOH3
 5DqS0h+t8Syss0UdKculmdqb8IX0fO88PjF6z6dTNER1DHlL51oZqgNyr0Kf1B+8wQ
 B9bJYOjfp8s+5lWO7C6sjKyk4kBlH44VBUUQYVF6lZnz/7Gx1jcHnyEE6DpS3uLuii
 uC1k6gwLPDLG/ICz/S0kI8k1sH4EeUFD+e0HbwqCWPrRIFYsARDALdKJsWNpHKYJ18
 dkfhYc08MDitQ==
Subject: Re: [PATCH] ALSA: hda/proc - dump the coeff with the capital letters
To: Takashi Iwai <tiwai@suse.de>
References: <20210709023345.6359-1-hui.wang@canonical.com>
 <s5hr1g753h3.wl-tiwai@suse.de>
From: Hui Wang <hui.wang@canonical.com>
Message-ID: <f6b53edf-9443-5160-56ed-926690d7c376@canonical.com>
Date: Fri, 9 Jul 2021 15:54:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <s5hr1g753h3.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Cc: alsa-devel@alsa-project.org
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


On 7/9/21 3:52 PM, Takashi Iwai wrote:
> On Fri, 09 Jul 2021 04:33:45 +0200,
> Hui Wang wrote:
>> Sometimes we need to dump the coeff to debug the audio issues, and
>> need to compare it with the log of RTHDDump.exe under Windows, this is
>> the coeff under Windows and Linux:
>> Vendor widget coefficient value under Windows
>> Index 0x00  0x0002
>> Index 0x01  0xAAAA
>> Index 0x02  0x8AAA
>>
>> Processing caps: benign=0, ncoeff=91 under Linux
>> Coeff 0x00: 0x0002
>> Coeff 0x01: 0xaaaa
>> Coeff 0x02: 0x8aaa
>>
>> Windows prints the hex number with capital letter while Linux prints
>> the hex number with lower case letter, it adds the trouble when
>> comparing them. Let us change it to use capital letter.
> I'm not convinced by that argument, sorry.  You have to convert the
> strings in anyway (e.g. "Index" vs "Coeff" and strip colon).  If we
> were to provide a compatible string intentionally, we'd have to fix
> it, but that's not the case.
>
> Also, there can be already some tools to use the proc file and parse
> the values as of now, and such a change would break them.

OK, got it.

Thanks.

>
> thanks,
>
> Takashi
>
>> Signed-off-by: Hui Wang <hui.wang@canonical.com>
>> ---
>>   sound/pci/hda/hda_proc.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/sound/pci/hda/hda_proc.c b/sound/pci/hda/hda_proc.c
>> index 00c2eeb2c472..9037c87665b6 100644
>> --- a/sound/pci/hda/hda_proc.c
>> +++ b/sound/pci/hda/hda_proc.c
>> @@ -590,7 +590,7 @@ static void print_proc_caps(struct snd_info_buffer *buffer,
>>   		snd_hda_codec_write(codec, nid, 0, AC_VERB_SET_COEF_INDEX, i);
>>   		val = snd_hda_codec_read(codec, nid, 0, AC_VERB_GET_PROC_COEF,
>>   					 0);
>> -		snd_iprintf(buffer, "    Coeff 0x%02x: 0x%04x\n", i, val);
>> +		snd_iprintf(buffer, "    Coeff 0x%02X: 0x%04X\n", i, val);
>>   	}
>>   	snd_hda_codec_write(codec, nid, 0, AC_VERB_SET_COEF_INDEX, oldindex);
>>   }
>> -- 
>> 2.25.1
>>
