Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 264E375CB3
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2019 04:07:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0C5C1F72;
	Fri, 26 Jul 2019 04:06:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0C5C1F72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564106855;
	bh=gGqVaIIcniSaFBdND9mqkBwzzmiqHgg0jROWQ7HKERc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=buuFvcaYnYiYDU6WuRLvYMoHkE6ArXpRBcCUvJtEPQyIbmecfbGtccb6aIyWqyJvZ
	 ev0iqQ1N0UE5Jp6w7OUYnYKLQ6mVclTGckP7UuraVbeiigonwFlKExKSgwJyqq0jEV
	 OfkkUFxWPW2NKPFZ8/lp4OM8b55QAq7drbOfNYL0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3BEDF80393;
	Fri, 26 Jul 2019 04:05:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6B4CCF80393; Fri, 26 Jul 2019 04:05:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2D6EF801A4
 for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2019 04:05:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2D6EF801A4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="hWnrUtBc"
Received: by mail-pf1-x444.google.com with SMTP id c3so545426pfa.13
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 19:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=cCr2oTsYVgIcEXvmtc7DlfGkkVp1TEqKVaiHx8VkY0g=;
 b=hWnrUtBcKGH6duUC6atM3dFoGEBxjthHp13HPcOGJP3NvGrheBc5ubV7GtbnVrlUG5
 w5xBX1gRoM47ksIqKWOFmWXir+gUPA0Gh2eTDKgpymSSztq9tcT/zBuN/n0rKnfOUuca
 qEBOAK2NsqTXHIFBuLpt5vzs2eCB9GmKpjPB+kgUHv7LrzqssPl1EAlagaMpS3cl11B5
 Ddh3fFfxS5tzaLVHZMBeZDV1ZxTtRHvN9GoQhg8GT5xbsqmQxdkN3vS5pSlF/m8Bxnq0
 02OcN90av2yFVbUIr4WKCyoepL+F+iRgaISztNFR+JUkamvg6b92qQRwAurdm9kPr6/f
 qF7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=cCr2oTsYVgIcEXvmtc7DlfGkkVp1TEqKVaiHx8VkY0g=;
 b=CJ4UYq91z2PKNsGn7WIVbwTih9at3S/j0GrLsBII8SK67zlR0l8JMV5SDcx4Lw22zm
 388bt4+kG91FMp0m2bGC199OawROjtUWzU0Hoj09jKUR4JV9zIdEVYnPlWTtIh/k2uPa
 NNUJmHnZjXV7b0UjotQgr9rS5zGcVH39UmPkOuk8oM2vOc+8F8tonRRrL4z6YvBHeBhu
 eR6bK0kI1atXOiH/y2F5+Lpnjj+Spny0EGnO5ZSXxeMl/Ge+eq8O8RodnZGWJWSD8dws
 WBGn0xE+fONYt8kGiN9OOWXJb37Y6XRWijw5PeCYFZeLiRl7+QDaOvvQ3c2s8l6luYHr
 Jrag==
X-Gm-Message-State: APjAAAWwmDjE7AqpMpyVDy3/0vlNL9wGzG6eXTVEjr9JiulAeo3r6QbS
 JXv/mxYPqBNr45Uf/Utfulg=
X-Google-Smtp-Source: APXvYqyW0cJeyN4gZGlH3R5yMUABavXqQ5fq8IodhkOzNunm92SeAYGrTnWkOwPKwtBRZvJudMSzfg==
X-Received: by 2002:a17:90a:4806:: with SMTP id
 a6mr96016852pjh.38.1564106742844; 
 Thu, 25 Jul 2019 19:05:42 -0700 (PDT)
Received: from ?IPv6:2402:f000:4:72:808::177e? ([2402:f000:4:72:808::177e])
 by smtp.gmail.com with ESMTPSA id b126sm75007442pfa.126.2019.07.25.19.05.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Jul 2019 19:05:42 -0700 (PDT)
To: Takashi Iwai <tiwai@suse.de>
References: <20190725082733.15234-1-baijiaju1990@gmail.com>
 <s5hy30myuvw.wl-tiwai@suse.de>
From: Jia-Ju Bai <baijiaju1990@gmail.com>
Message-ID: <5ef03517-a52f-fe24-30e9-62466d4a1319@gmail.com>
Date: Fri, 26 Jul 2019 10:05:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <s5hy30myuvw.wl-tiwai@suse.de>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, rfontana@redhat.com, tglx@linutronix.de
Subject: Re: [alsa-devel] [PATCH] ALSA: i2c: ak4xxx-adda: Fix a possible
 null pointer dereference in build_adc_controls()
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



On 2019/7/25 23:52, Takashi Iwai wrote:
> On Thu, 25 Jul 2019 10:27:33 +0200,
> Jia-Ju Bai wrote:
>> In build_adc_controls(), there is an if statement on line 773 to check
>> whether ak->adc_info is NULL:
>> 	if (! ak->adc_info ||
>> 		! ak->adc_info[mixer_ch].switch_name)
>>
>> When ak->adc_info is NULL, it is used on line 792:
>>      knew.name = ak->adc_info[mixer_ch].selector_name;
>>
>> Thus, a possible null-pointer dereference may occur.
>>
>> To fix this bug, referring to lines 773 and 774, ak->adc_info
>> and ak->adc_info[mixer_ch].selector_name are checked before being used.
>>
>> This bug is found by a static analysis tool STCheck written by us.
>>
>> Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
>> ---
>>   sound/i2c/other/ak4xxx-adda.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/sound/i2c/other/ak4xxx-adda.c b/sound/i2c/other/ak4xxx-adda.c
>> index 5f59316f982a..9a891470e84a 100644
>> --- a/sound/i2c/other/ak4xxx-adda.c
>> +++ b/sound/i2c/other/ak4xxx-adda.c
>> @@ -775,11 +775,13 @@ static int build_adc_controls(struct snd_akm4xxx *ak)
>>   				return err;
>>   
>>   			memset(&knew, 0, sizeof(knew));
>> -			knew.name = ak->adc_info[mixer_ch].selector_name;
>> -			if (!knew.name) {
>> +			if (! ak->adc_info ||
>> +				! ak->adc_info[mixer_ch].selector_name) {
>>   				knew.name = "Capture Channel";
>>   				knew.index = mixer_ch + ak->idx_offset * 2;
>>   			}
>> +			else
>> +				knew.name = ak->adc_info[mixer_ch].selector_name;
>>   
>>   			knew.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
>>   			knew.info = ak4xxx_capture_source_info;
> The code change itself looks good, but please follow the standard
> coding style.  In short: please run checkpatch.pl, fix errors (some
> warnings may be ignored) and resubmit.

Okay, thanks for the advice.
I will send a v2 patch.


Best wishes,
Jia-Ju Bai
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
