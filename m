Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A3D719CB
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 15:53:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94BC718A1;
	Tue, 23 Jul 2019 15:52:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94BC718A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563890007;
	bh=E+lQH8H+oGvyUcDav/U8JmKZNjwwAmrJ4dlCX2iop9E=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lF+5dkTZ0VU7my5obSSr8SbrVW2RII/1w/ZOPesLlv2etPShNdlUFSpbloDyGTlDr
	 ipfWR0ryOlTtBY5QWRD8nMKxAgO1SYbsDjvD/Si9/3wGqTaKscKbf6pN1dJgg8QaB9
	 mSQneaYgyemZKEW0yNaZZNkcYXrBfpM5MHRMAzuA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EE37F8044B;
	Tue, 23 Jul 2019 15:51:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBB61F80448; Tue, 23 Jul 2019 15:51:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCC00F80227
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 15:51:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCC00F80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QBi2yLUH"
Received: by mail-pg1-x542.google.com with SMTP id w10so19477216pgj.7
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 06:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=iieAYOuoQNwyrS3dY4/FXtAdVnIv4y3zEt6WfnxberI=;
 b=QBi2yLUHpAPrxVmIpm/So8E76VZkVKgKQcUchzNQ3F1+wpsRGN4CV2XRnMhmZIJfEz
 6zBaRa3wzEBgZK/TXJ4Jt69RuxOpBVo4HYvMxIRE85lKV/yqrs5OwKo/HwV9xivvdHWZ
 +FdiDnRN/6xO7MI0K2lNaPgIEGxK5mZDJCIdYYPYlQD/MoLxUFSShEXYz8XQOdPrEm9y
 OuC7zvaZ1dRddcDNYaptRuyybKnf+T+8GASIkZeze7kLcRpauuCM4vq1TZk2EFW9/Eqz
 n6OqYPipcMGnjXRTtCA6ojoDIe90pGcN0ln3VTmEkv0fxhu6NQWCOgpTtuJR7AhLkhbD
 WnuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=iieAYOuoQNwyrS3dY4/FXtAdVnIv4y3zEt6WfnxberI=;
 b=uOIozdB5319VSivBiFkHBk7zYAVcSIcug0vP9yPbCFyc9HaPQ6W2aHmnxL2IxEl1qD
 YKFkcZFctMAPMkOh7Pvv48VSegdNg5fwOHZ0ucN7SNmyw52l3SG0mBBnoUtE9YBVvSu0
 eeDbYJq2k1U6a7BhdHrOfoopUL6rUHIxHDxRcEA1PfV4uHkfW3X6JATeOnrUvJe1/n7f
 Ww+oUFB23wv3Wb1fEwV6J5VmPFQXm4P5KzmaCgV72TIDKVigIkcXvjMDAH4WgM6uONzl
 +WI4iz7B2JZkirucjVkhSnJMSm0LL4SgDbsTt6NOtMjVzv4GVxutfqQTLBsN/CxRo7mH
 pgLg==
X-Gm-Message-State: APjAAAWq4aRdcr0sMeMKluCN+SYPB9XpP9noOfaIhnglgBZKwM913WTx
 EJojCvxFEbpFOJO75ZKmMzo=
X-Google-Smtp-Source: APXvYqyJm6C/KHEou+VhElLDQqxp0NqTiGzqbfFqyUUCsrST+UYbYP4pqzkywRDeV55i1NZGYphPbA==
X-Received: by 2002:a62:2b81:: with SMTP id r123mr5701513pfr.108.1563889888708; 
 Tue, 23 Jul 2019 06:51:28 -0700 (PDT)
Received: from ?IPv6:2402:f000:4:72:808::177e? ([2402:f000:4:72:808::177e])
 by smtp.gmail.com with ESMTPSA id q21sm27138226pgb.48.2019.07.23.06.51.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 23 Jul 2019 06:51:28 -0700 (PDT)
To: Takashi Iwai <tiwai@suse.de>
References: <20190723134020.25972-1-baijiaju1990@gmail.com>
 <s5htvbc50cc.wl-tiwai@suse.de>
From: Jia-Ju Bai <baijiaju1990@gmail.com>
Message-ID: <57696d77-922b-51d6-0623-5c6f4fe2b972@gmail.com>
Date: Tue, 23 Jul 2019 21:51:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <s5htvbc50cc.wl-tiwai@suse.de>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 huangfq.daxian@gmail.com, tglx@linutronix.de, allison@lohutok.net
Subject: Re: [alsa-devel] [PATCH] ALSA: isa: gus: Fix a possible
 null-pointer dereference in snd_gf1_mem_xfree()
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Thanks for the quick reply :)
I think you are right, and I did not consider "if (alloc->last == block)"
Sorry for the false report...


Best wishes,
Jia-Ju Bai

On 2019/7/23 21:47, Takashi Iwai wrote:
> On Tue, 23 Jul 2019 15:40:20 +0200,
> Jia-Ju Bai wrote:
>> In snd_gf1_mem_xfree(), there is an if statement on line 72 and line 74
>> to check whether block->next is NULL:
>>      if (block->next)
>>
>> When block->next is NULL, block->next is used on line 84:
>>      block->next->prev = block->prev;
>>
>> Thus, a possible null-pointer dereference may occur in this case.
> There is already a check beforehand:
>
> 	if (alloc->last == block) {
>
> and the code path you're referring to is only after this check fails,
> i.e. it's no last entry, hence block->next can be never NULL.
>
> So the current code is OK.
>
>
> thanks,
>
> Takashi
>
>> To fix this possible bug, block->next is checked before using it.
>>
>> This bug is found by a static analysis tool STCheck written by us.
>>
>> Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
>> ---
>>   sound/isa/gus/gus_mem.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/sound/isa/gus/gus_mem.c b/sound/isa/gus/gus_mem.c
>> index cb02d18dde60..ed6205b88057 100644
>> --- a/sound/isa/gus/gus_mem.c
>> +++ b/sound/isa/gus/gus_mem.c
>> @@ -81,7 +81,8 @@ int snd_gf1_mem_xfree(struct snd_gf1_mem * alloc, struct snd_gf1_mem_block * blo
>>   		if (block->prev)
>>   			block->prev->next = NULL;
>>   	} else {
>> -		block->next->prev = block->prev;
>> +		if (block->next)
>> +			block->next->prev = block->prev;
>>   		if (block->prev)
>>   			block->prev->next = block->next;
>>   	}
>> -- 
>> 2.17.0
>>
>>

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
