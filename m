Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E96EF54DF86
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 12:52:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EE5E1AE0;
	Thu, 16 Jun 2022 12:51:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EE5E1AE0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655376722;
	bh=cPoldHF0kGtc9/OMHJBDY3mnrZv5jopSUZQWQamYREI=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cbeQs0NTYD/aklZ2KUG6TxnZL91ZTqdd4xD1+Dd5yEhKydGW6qNwVtgvtAJH9NEnv
	 sivA1FQuVrKVI8qzx5dF+GIYlUAg28ZsknOiv/HG5F0ARFlTBiSczpmhmRWz/9IcDP
	 YiJFcXQQh3A/6u+blwV+kV/sUcL8buWCuNSJtHXE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE8CFF8012A;
	Thu, 16 Jun 2022 12:51:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04557F801D8; Thu, 16 Jun 2022 12:51:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABAFDF800B9
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 12:50:52 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 19AC8A0040;
 Thu, 16 Jun 2022 12:50:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 19AC8A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1655376651; bh=TVfPulmQOnyiHCIwBEozm7uncjn/WRxfQ6E6uoT4rOs=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=BnYqZjqBotb1Gmn041k/rjXK6fjg1y6URdJJWjj0290Wxw4RxKQ4hHKG6JlUUW/lj
 zCQvz7V/sbcXlut0OZXqxvjJb21CWyD8S/ZOOEhCN05z7lAwpnmuXf5vVzOCQS78K/
 UAcXtMJVAfVjNS1TUt2IwKOGcWDrbRV0SqXtA678=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 16 Jun 2022 12:50:49 +0200 (CEST)
Message-ID: <927f3c77-a88b-f564-13d8-5b8600b128ed@perex.cz>
Date: Thu, 16 Jun 2022 12:50:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] aplay: Support setting timestamp
Content-Language: en-US
To: Pavel Hofman <pavel.hofman@ivitera.com>, alsa-devel@alsa-project.org
References: <20220616065426.27915-1-pavel.hofman@ivitera.com>
 <YqrmNfnn2qCZV9Kf@workstation>
 <900e96c0-6251-fa3d-42b4-847ece6e1a44@ivitera.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <900e96c0-6251-fa3d-42b4-847ece6e1a44@ivitera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 16. 06. 22 12:00, Pavel Hofman wrote:
> Dne 16. 06. 22 v 10:13 Takashi Sakamoto napsal(a):
>>
>> On Thu, Jun 16, 2022 at 08:54:26AM +0200, Pavel Hofman wrote:
>>> To allow enabling timestamp and specify its type, a new option
>>> --tstamp-type=TYPE is added. Recognized values are none (default),
>>> gettimeofday, monotonic, monotonic-raw.
>>>
>>> Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
>>> ---
>>>    aplay/aplay.1 |  4 ++++
>>>    aplay/aplay.c | 32 ++++++++++++++++++++++++++++++++
>>>    2 files changed, 36 insertions(+)
>>    
>> I prefer the idea to work for timestamp feature defined in ALSA PCM
>> interface, while I have a mixed feeling to integrate `aplay` tool, since
>> I have an intension to obsolete the tool with `axfer` tool with more
>> robust design with command argument compatibility (as much as possible).
>>
>> This is not so strong request but would I ask you to work for `axfer` tool
>> instead of `aplay`? Then, it's preferable that the name of command
>> argument is decided with enough care of all of timestamp feature in ALSA
>> PCM interface, since we have two categories of timestamps at least; e.g.
>> system timestamp and audio timestamp. As long as I know, they possibly use
>> different clock sources, thus these two timestamps have different levels
>> of clock id, I think.
>>
>> Of course, it's a loose accord in the community to obsolete `aplay`, and
>> it's easy to decide to continue aplay integration. (I'm not in leading
>> place of the project.) I'll be a bit happy if people take care of axfer
>> tool as well.
> 
> Thanks for your input. I use aplay in my project and needed to have
> tstamps enabled in proc status files for my simple code which calculates
> relative samplerate between capture and playback soundcards (one of them
> having rate adjustable - audio gadget, snd-aloop)
> https://mailman.alsa-project.org/pipermail/alsa-devel/2022-June/201647.html
> . The existing aplay did not have this feature, so I added it and
> submitted the patch. I did not know aplay was planned to be obsoleted,
> it seems to receive a healthy stream of patches.

It would be good to sync both tools (aplay/axfer) for the easy replacement. 
Could you add this code to axfer, too?

> As of the tstamp terminology - what command option would be more
> appropriate instead? Thanks a lot,

I'm fine with the proposed argument.

				Thank you,
					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
