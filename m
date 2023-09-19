Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 360917A5F0D
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 12:09:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65555A4A;
	Tue, 19 Sep 2023 12:08:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65555A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695118160;
	bh=itUnSJXLn9yGvv/1aouTT5nNHJEY8NbOndeV8HQeOA4=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bztlKg4lJTSXWgzIbtt8FIz7/B+h1D17KjuGq96xFMFTncQ0eOy1nPkPbLoxSBIz2
	 TNbDPIH2/rVDkUr6CT5m42M6znqRCYjX9uMM/V2HH0RowQf/jk5U2jc6Be9ISa1To+
	 GTn4m/FbKeXuV1vinvm7czbOFE85oxfKBtDJzlX4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92468F8055A; Tue, 19 Sep 2023 12:08:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 41338F801F5;
	Tue, 19 Sep 2023 12:08:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24DD7F8025A; Tue, 19 Sep 2023 12:08:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 058AFF80124
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 12:07:55 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 75F8C11D3;
	Tue, 19 Sep 2023 12:07:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 75F8C11D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1695118074; bh=g71YaR2NX363/3hfBwRMHi2sPcajcnv/d3ZHoD5pU0Y=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
	b=v8FSjQwX6wzLm6reWTLUtrTYTEqb9vLYBDTv5XB2hYRsGfxECHEYW+tGLO1MJqyvF
	 JtafJO9S1svGnN64jHuMIB88lLClBr9D5B4vWd5yKMzIMo8W52I9TfHhDkPDh7mkBJ
	 2Wj5GAOhPmJLceFblRZlxGEq/hDXJqHZW0lmwy0I=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue, 19 Sep 2023 12:07:51 +0200 (CEST)
Message-ID: <0e6aac35-eb1f-311d-b246-cec5aefab62c@perex.cz>
Date: Tue, 19 Sep 2023 12:07:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Takashi Iwai <tiwai@suse.de>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20230912162526.7138-1-perex@perex.cz>
 <fd153436-d128-c1b9-dee0-ba03224fa013@intel.com>
 <f7dfdbd9-b8c0-fd65-1280-256e9a82fca2@perex.cz>
 <63b3eb26-3a76-5993-bd65-c3461a264b95@intel.com>
 <de412997-627d-9ad2-b9c2-cbdb78b70f5d@perex.cz>
 <89b0c3e8-2834-ba69-831b-51ea0621edb6@intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Subject: Re: [RFC PATCH] ALSA: pcm: Introduce MSBITS subformat API extension
In-Reply-To: <89b0c3e8-2834-ba69-831b-51ea0621edb6@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: U6DUNWFXWI5FEEDH57GHLEKT757AH6H5
X-Message-ID-Hash: U6DUNWFXWI5FEEDH57GHLEKT757AH6H5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U6DUNWFXWI5FEEDH57GHLEKT757AH6H5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 19. 09. 23 11:28, Cezary Rojewski wrote:
> On 2023-09-18 5:04 PM, Jaroslav Kysela wrote:
>> On 18. 09. 23 15:55, Cezary Rojewski wrote:
> 
> ...
> 
>>>> This is for a special case when the drivers do not set
>>>> snd_pcm_hw_constraint_subformats (all current drivers). In this case,
>>>> the default is to handle STD and MAX subformat bits.
>>>>
>>>> This constraint should be applied only one time. So this prevents to
>>>> install it twice.
>>>
>>> I believe we could avoid special-case approach. Have a copy/intersection
>>> helpers in place and utilize iterations-with-sentinel-entry. Provided
>>> such in v2 of my series.
>>
>> I don't think that it's required to carry the format->subformat map in
>> struct snd_pcm_hardware. Only few drivers will use it, so the separate
>> constraint is fine. Also, you can remove a lot of your added code to the
>> pcm_misc and ASoC core (copy, masking, allocating) when the affected
>> drivers install the map using the constraint call.
> 
> I believe the question isn't how few or how many, but are there users or
> not. The answer to that question is: there are users of the subformat
> feature.
> 
> Adding an array of subformats to the snd_pcm_hardware makes things
> explicit, example being sound/soc/intel/avs/pcm.c. That's a win from
> maintenance point of view. Another thing is that we could utilize
> subformat to drop msbits entirely in the future. To summarize, to make
> subformat a first class citizen, we should avoid special-casing anything
> related to it.

I would argue that the snd_pcm_hardware is just a static template which is 
refined by constraints (runtime) anyway. The new constraint which is called 
directly in the PCM open callback means really minimal changes in the core 
code and ASoC core code. We can implement more robust way on demand in future 
when we have a better picture for the subformat mask usage.

>> Few points:
>>
>> 1) PCM API interface changes should be separate, you mixing unused
>> helpers and separating vital functionality for drivers
> 
> What I could do is shuffle the code a bit e.g.: let snd_pcm_hw_copy() be
> introduced along the ASoC changes. Frankly that was the initial approach
> (forgotten to update the commit message of 04/17 so it still talks about
> code that's no longer part of the commit).

The first patch should cover the vital code which is required for the 
subformat extension in the PCM core code. When we have this base, you can work 
on other things.

>> 2) if you copy 90% of my code, I don't think that Suggested-by: tag is fine
>>
>> Could you do your work on top of my patch?
> 
> I'm afraid this isn't a fair claim. The feature is driven by validation
> and this has been conducted be me or my folks entirely. Given the scarce
> guidance provided in [1] I still provided a valid WIP in [2] and
> expected to iterate over it given the feedback. Closing the discussion
> by taking a single patch away from the series and re-authoring it is not
> a welcoming way to do a review. Perhaps Co-developed-by: then?

I don't follow you. My patch can be also changed - I've not heard any review 
except cosmetic changes. I am just telling you that the patch is a good base 
for all other changes. I think that the best way is to finish the base 
extension in sound/core at first without any helpers and so on and then work 
on other parts.

> Please note that the code differs. I do believe that splitting the API
> and the constrains into separate patches is a better approach from
> maintenance point of view.

It does not make sense to extend API without constraints. The splitting does 
not help here.

> Proposed readability improvements have also
> been applied in v2. For reasons provided in previous paragraphs, I chose > to avoid the chicken-bit and treat subformat constraints in generic
> fashion. Also, validation shows that without updating
> snd_pcm_subformat_names[] in pcm.c the code ends with UBSAN during

Yes, I missed that. I can put it to my v3 when we agree on the constraints.

> runtime. I've already addressed that, even in v1.
> 
> I'm happy to continue the technical discussion as there are still points
> to discuss. Let's do so in v2 of the series [3].

Unfortunately, you are not working with the technical discussion anyway. 
Changing comments adding empty lines, renaming variables to make you happy is 
not a nice way to co-operate with others and then act as the author of the 
CODE (not comments) is really bad. Everyone has own coding style and you're 
forcing your opinion.

Also, I though about {} end-of-array mark (remove 
SNDRV_PCM_FORMAT_CONSTRAINT_END), but I found that I prefer to have the 
possibility to skip the MSBITS_MAX settings for the given format. It may make 
sense in a situation when the MSBITS configuration is too rare to be added as 
the API bit.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

