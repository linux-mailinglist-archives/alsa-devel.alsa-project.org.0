Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE84207941
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jun 2020 18:35:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 371EC187E;
	Wed, 24 Jun 2020 18:34:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 371EC187E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593016500;
	bh=nAFTTBJS/G1X5gfMWuZe737ie2te0/lp/9uoNm0Yl+4=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ksup15OmPLgxjZdTNx8gVOZTWHEh1WOvqq9JTooUfp6LE6qyOHwYMySbwoWAbxtNT
	 ywsgoJzAUydIZrkLUI++Eww7nHZy6q/D1B7VfqENXwR9fhqNBlnW2MWGPVcEkLt2qj
	 ewXbuH97SRz+krG9nDV8oN5fLYuy7YqwwsJFvU6o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 485A2F800B2;
	Wed, 24 Jun 2020 18:33:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB4FAF8015A; Wed, 24 Jun 2020 18:33:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89F45F800B2
 for <alsa-devel@alsa-project.org>; Wed, 24 Jun 2020 18:33:10 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 8C250A0040;
 Wed, 24 Jun 2020 18:33:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 8C250A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1593016389; bh=yLkIXNMg1FQiuZzD4XDA3dJnn8JuQCdecVAaErCQdRY=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=neRVvC4WXSHE2jcJSaQkrHy8HeECBgT2khjm1kXdOrvpLfYMwHWXmy4bGAfID3Xl+
 lyBCOmBr/mgJrYsuQMIkffy5/XhDkB2nxuZ0Y91E8zMlxlMDEzjuVkfP2gYc4ccHFI
 Z6uCbd8bUeX8hDZmwFX8SouvOgYaSSBwdqe5ecOo=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 24 Jun 2020 18:33:01 +0200 (CEST)
Subject: Re: [PATCH] ALSA: core: Warn on empty module
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
References: <20200624160300.21703-1-tiwai@suse.de>
 <8d9cd8bf-9023-f3f7-e62d-167da5263714@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <6e04386e-d5f7-7e59-3641-13b551de9392@perex.cz>
Date: Wed, 24 Jun 2020 18:33:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <8d9cd8bf-9023-f3f7-e62d-167da5263714@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Dne 24. 06. 20 v 18:13 Pierre-Louis Bossart napsal(a):
> 
> 
> On 6/24/20 11:03 AM, Takashi Iwai wrote:
>> The module argument passed to snd_card_new() must be a valid non-NULL
>> pointer when the module support is enabled.  Since ASoC driver passes
>> the argument from each snd_soc_card definition, one may forget to set
>> the owner field and lead to a NULL module easily.
>>
>> For catching such an overlook, add a WARN_ON() in snd_card_new().
>> Also, put the card->module assignment in the ifdef block for a very
>> minor optimization.
>>
>> Signed-off-by: Takashi Iwai <tiwai@suse.de>
>> ---
>>    sound/core/init.c | 3 +++
>>    1 file changed, 3 insertions(+)
>>
>> diff --git a/sound/core/init.c b/sound/core/init.c
>> index b02a99766351..0478847ba2b8 100644
>> --- a/sound/core/init.c
>> +++ b/sound/core/init.c
>> @@ -203,7 +203,10 @@ int snd_card_new(struct device *parent, int idx, const char *xid,
>>    	mutex_unlock(&snd_card_mutex);
>>    	card->dev = parent;
>>    	card->number = idx;
>> +#ifdef MODULE
>> +	WARN_ON(!module);
>>    	card->module = module;
>> +#endif
>>    	INIT_LIST_HEAD(&card->devices);
>>    	init_rwsem(&card->controls_rwsem);
>>    	rwlock_init(&card->ctl_files_rwlock);
> 
> Would it make sense to also change the ASoC code to use THIS_MODULE
> instead of card->owner?
> 
> /* card bind complete so register a sound card */
> ret = snd_card_new(card->dev, SNDRV_DEFAULT_IDX1, SNDRV_DEFAULT_STR1,
> 		card->owner, 0, &card->snd_card);
> 
> A quick grep shows we are setting .owner = THIS_MODULE pretty much all
> the time for machine drivers.
> 

THIS_MODULE is defined when the object file is created (compile time). We want 
to assign the real module which creates the card here, not "snd_soc_core" 
which is misleading.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
