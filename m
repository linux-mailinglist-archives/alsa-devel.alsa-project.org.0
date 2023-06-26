Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCBD73E0B2
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 15:34:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AB31A4E;
	Mon, 26 Jun 2023 15:33:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AB31A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687786457;
	bh=al3qAFhG0xPK1EpjwK9cSwRnrUKaOkUGbWVQChLd2Es=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bdZppmhFEwywcgCZijvwMeyFfiOiAQ7b7omnSIVrBcnX8f3xOBImAD+M2A5s03wcO
	 m6pJxBd3KZTWEy0LNG2Gr7PO6OScTjYi+cTfuWEtnunVO8jF6b+JUBt0ySTYDpMQ0P
	 qQi8zLolzbmGFlHuBCGR1skwKWU1dKCh6u141B8Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8369F80534; Mon, 26 Jun 2023 15:33:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 142B7F80212;
	Mon, 26 Jun 2023 15:33:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DEE22F8027B; Mon, 26 Jun 2023 15:33:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C0315F80212
	for <alsa-devel@alsa-project.org>; Mon, 26 Jun 2023 15:32:47 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id EB2841E18;
	Mon, 26 Jun 2023 15:32:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz EB2841E18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1687786367; bh=P4b7pQGf/nmZaFg3tRkshnVDvy5ehhcr3/lNB4wKevk=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
	b=INm+DvE15zSIDUunAUMNiMSC6/hpj0qh3QF2GvxufGkWEaPvEN9DjdE2RAZvM5/L2
	 w5l3jtSrcHcxm00BbLxBo7sj/8HP9D5alhZ1K4pooC04EUlWfrNuzDg1LN0atr0TcB
	 rdKJhvemxKr2z4c45NgTGaFfkY2kAIKm/vsy2wH0=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Mon, 26 Jun 2023 15:32:40 +0200 (CEST)
Message-ID: <fb9db138-82a3-678c-bb94-035f923b3e16@perex.cz>
Date: Mon, 26 Jun 2023 15:32:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: Tuo Li <islituo@gmail.com>, tiwai@suse.com, alsa-devel@alsa-project.org,
 Linux Kernel <linux-kernel@vger.kernel.org>, baijiaju1990@outlook.com
References: 
 <CADm8Tek6t0WedK+3Y6rbE5YEt19tML8BUL45N2ji4ZAz1KcN_A@mail.gmail.com>
 <877crqwvi1.wl-tiwai@suse.de>
 <CADm8Tenfy8joto5WLCqQWjfT8WimsbJgOss0hJe-ciyDRMrSXw@mail.gmail.com>
 <871qhywucj.wl-tiwai@suse.de> <4d0931bf-b356-6969-5aaf-b663d7f2b21a@perex.cz>
 <87wmzqv64o.wl-tiwai@suse.de> <45445f57-0a73-59e6-6f3d-3983ce93a324@perex.cz>
 <87ttuuv5m6.wl-tiwai@suse.de> <87jzvquzyr.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [BUG] ALSA: core: pcm_memory: a possible data race in
 do_alloc_pages()
In-Reply-To: <87jzvquzyr.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: JLNUMSV5JSPO3B3GYDTABARACRFFBFHO
X-Message-ID-Hash: JLNUMSV5JSPO3B3GYDTABARACRFFBFHO
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JLNUMSV5JSPO3B3GYDTABARACRFFBFHO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 26. 06. 23 15:15, Takashi Iwai wrote:
> On Mon, 26 Jun 2023 13:13:21 +0200,
> Takashi Iwai wrote:
>>
>> On Mon, 26 Jun 2023 13:09:00 +0200,
>> Jaroslav Kysela wrote:
>>>
>>> On 26. 06. 23 13:02, Takashi Iwai wrote:
>>>> On Mon, 26 Jun 2023 09:56:47 +0200,
>>>> Jaroslav Kysela wrote:
>>>>>
>>>>> On 26. 06. 23 9:33, Takashi Iwai wrote:
>>>>>> On Mon, 26 Jun 2023 09:31:18 +0200,
>>>>>> Tuo Li wrote:
>>>>>>>
>>>>>>>
>>>>>>> Hello,
>>>>>>>
>>>>>>> Thank you for your reply!
>>>>>>
>>>>>> FWIW, the simplest fix would be something like below, just extending
>>>>>> the mutex coverage.  But it'll serialize the all calls, so it might
>>>>>> influence on the performance, while it's the safest way.
>>>>>
>>>>> It may be better to update total_pcm_alloc_bytes before
>>>>> snd_dma_alloc_dir_pages() call and decrease this value when allocation
>>>>> fails to allow parallel allocations. Then the mutex can be held only
>>>>> for the total_pcm_alloc_bytes variable update.
>>>>
>>>> Yes, it'd work.  But a tricky part is that the actual allocation size
>>>> can be bigger, and we need to correct the total_pcm_alloc_bytes after
>>>> the allocation result.  So the end result would be a patch like below,
>>>> which is a bit more complex than the previous simpler approach.  But
>>>> it might be OK.
>>>
>>> The patch looks good, but it may be better to move the "post" variable
>>> updates to an inline function (mutex lock - update - mutex unlock) for
>>> a better readability.
>>
>> Sounds like a good idea.  Let me cook later.
> 
> ... and here it is.
> 
> If that looks OK, I'll submit a proper fix patch.
> 
> 
> thanks,
> 
> Takashi
> 
> --- a/sound/core/pcm_memory.c
> +++ b/sound/core/pcm_memory.c
> @@ -31,15 +31,41 @@ static unsigned long max_alloc_per_card = 32UL * 1024UL * 1024UL;
>   module_param(max_alloc_per_card, ulong, 0644);
>   MODULE_PARM_DESC(max_alloc_per_card, "Max total allocation bytes per card.");
>   
> +static void __update_allocated_size(struct snd_card *card, ssize_t bytes)

Missing inline ? May be also used for

> +static void update_allocated_size(struct snd_card *card, ssize_t bytes)
> +static void decrease_allocated_size(struct snd_card *card, size_t bytes)

The rest is fine in my eyes.

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

				Thanks,
					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

