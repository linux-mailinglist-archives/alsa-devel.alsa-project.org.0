Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF5C540A9C
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 20:23:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD17417A3;
	Tue,  7 Jun 2022 20:22:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD17417A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654626216;
	bh=VSdwwBq8sMp66r6+dnU+Ncnhtcz/SeLyiXCS++7eTV4=;
	h=Date:From:Subject:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:From;
	b=IcEQfNDzAlxPeLywlMlfRv0A5niWUVwS2sMxn3uzJXZpm7V2XRB9z9keZKhHNYLqO
	 RbPGIkI4nZrmCCwbHwXLjQxddMbJIMHzPWUzL9oKsPSKyNRG3QA9eO4tpXrU2lewx+
	 mvlAUyFs2rRvs4xIwbI8Zaqs5kJmzh9qaZoqxJRs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 136F6F80248;
	Tue,  7 Jun 2022 20:22:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F72EF80159; Tue,  7 Jun 2022 20:22:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.tpi.com (mail.tpi.com [50.126.108.186])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B17FF800ED
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 20:22:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B17FF800ED
Received: from [10.0.0.212] (sushi.tpi.com [10.0.0.212])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by mail.tpi.com (Postfix) with ESMTPSA id 0508747EC7AC;
 Tue,  7 Jun 2022 11:22:19 -0700 (PDT)
Message-ID: <2527f90b-eb5a-98ce-6b7f-d3b048a7dd8c@tpi.com>
Date: Tue, 7 Jun 2022 11:22:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
From: Dean Gehnert <deang@tpi.com>
Subject: Re: [PATCH] ASoC: topology: Avoid card NULL deref in
 snd_soc_tplg_component_remove()
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, linux-kernel@vger.kernel.org
References: <20220603201425.2590-1-deang@tpi.com>
 <238510b7-fc5f-4f1b-9e25-6e38b49c2535@linux.intel.com>
Content-Language: en-US
Organization: TriplePoint, Inc.
In-Reply-To: <238510b7-fc5f-4f1b-9e25-6e38b49c2535@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, stable@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>
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
Reply-To: deang@tpi.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 6/7/22 00:40, Amadeusz Sławiński wrote:
> On 6/3/2022 10:14 PM, Dean Gehnert wrote:
>> Don't deference card in comp->card->snd_card before checking for NULL card.
>>
>> During the unloading of ASoC kernel modules, there is a kernel oops in
>> snd_soc_tplg_component_remove() that happens because comp->card is set to
>> NULL in soc_cleanup_component().
>>
>> Cc: Liam Girdwood <lgirdwood@gmail.com>
>> Cc: Mark Brown <broonie@kernel.org>
>> Cc: Jaroslav Kysela <perex@perex.cz>
>> Cc: Takashi Iwai <tiwai@suse.com>
>> Cc: alsa-devel@alsa-project.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: stable@vger.kernel.org
>> Fixes: 7e567b5ae063 ("ASoC: topology: Add missing rwsem around snd_ctl_remove() calls")
>> Signed-off-by: Dean Gehnert <deang@tpi.com>
>> ---
>>   sound/soc/soc-topology.c | 10 +++++++---
>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
>> index 3f9d314fba16..cf0efe1147c2 100644
>> --- a/sound/soc/soc-topology.c
>> +++ b/sound/soc/soc-topology.c
>> @@ -2613,15 +2613,18 @@ EXPORT_SYMBOL_GPL(snd_soc_tplg_component_load);
>>   /* remove dynamic controls from the component driver */
>>   int snd_soc_tplg_component_remove(struct snd_soc_component *comp)
>>   {
>> -    struct snd_card *card = comp->card->snd_card;
>> +    struct snd_card *card;
>>       struct snd_soc_dobj *dobj, *next_dobj;
>>       int pass;
>>         /* process the header types from end to start */
>>       for (pass = SOC_TPLG_PASS_END; pass >= SOC_TPLG_PASS_START; pass--) {
>>   +        card = (comp->card) ? comp->card->snd_card : NULL;
>> +
>>           /* remove mixer controls */
>> -        down_write(&card->controls_rwsem);
>> +        if (card)
>> +            down_write(&card->controls_rwsem);
>>           list_for_each_entry_safe(dobj, next_dobj, &comp->dobj_list,
>>               list) {
>
> I'm pretty sure that quite a lot of operations in this list_for_each_entry_safe() loop require existing card...
I get your point... Many of the cases in the loop, the functions are also dereferencing 'comp->card->', so this patch may not be the actual root cause fix... It worked for us since the kernel oops no longer happens, but looks like there are many more dereferences that could still cause problems.
>
> And trying to investigate more closely, there is no soc_cleanup_component() mentioned in commit message, for quite a few kernel versions - seems to have been removed during v5.5-rc1.
Ah yes! You are correct. soc_cleanup_component() functionality has been moved to soc_remove_component() in later kernels.
>
> I would say to not merge this, unless problem can be reproduced with latest kernel and even then would consider if it is a correct fix.
Agreed... This patch made our our kernel oops go away, however, we are going to dig deeper into the kernel oops call stack to see if I can find the root cause problem. There is something going on with the sound cleanup since this happens during rmmod... We just need to dig deeper and see if we can find what is really causing the problems.
>
>>   @@ -2660,7 +2663,8 @@ int snd_soc_tplg_component_remove(struct snd_soc_component *comp)
>>                   break;
>>               }
>>           }
>> -        up_write(&card->controls_rwsem);
>> +        if (card)
>> +            up_write(&card->controls_rwsem);
>>       }
>>         /* let caller know if FW can be freed when no objects are left */
>
