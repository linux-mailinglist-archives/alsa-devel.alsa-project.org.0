Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 511A02E3117
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Dec 2020 13:27:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C59D385D;
	Sun, 27 Dec 2020 13:26:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C59D385D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609072061;
	bh=2lioiQr5+0c0aCDfLNTyTSt+fpBj7H0JDWChTDh9j4I=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fwm7gjsc7A0K4gS1/BGanCMWC27vxV+3HKf59wFKIASgL11ZHCJ1RROsx5QeMHK0X
	 TMBCdAjTadKlniyXxFVOzx2F8wP7oA1MD0ZTRD/tud5mWnPV3Bv1w+LvB3NhB1n69I
	 K6sJhU1Q2iQHhp2KQBziPt0zm2KUgHJ0fFn8scao=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43545F800C8;
	Sun, 27 Dec 2020 13:26:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFD38F8022B; Sun, 27 Dec 2020 13:25:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C08CF800C8
 for <alsa-devel@alsa-project.org>; Sun, 27 Dec 2020 13:25:57 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id AA212A003F;
 Sun, 27 Dec 2020 13:25:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz AA212A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1609071955; bh=EmOt0A6PHLu32fXP2vwKVSM5PzkFHcqaQzCYF5FQwJo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ukuP/mt0l2FwRLFGE6FzwdntU2kkeaD0QmTmvF38Octi5vh/4g4rrlx7yYulejr/h
 2YacJwwCCvoyMSBScXT/Fyr5007M/xNJuzyt0RyG+4YvczpqJNLZIck4tFhY/L73JF
 Q5ZkeuQacbZMA63j9PZyZKKW8EJ9MG6hIEzik8i8=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Sun, 27 Dec 2020 13:25:52 +0100 (CET)
Subject: Re: [PATCH 9/9] conf: remove dead code from get_hexachar
To: Takashi Iwai <tiwai@suse.de>, Alex Henrie <alexhenrie24@gmail.com>
References: <20201226213547.175071-1-alexhenrie24@gmail.com>
 <20201226213547.175071-10-alexhenrie24@gmail.com>
 <s5hwnx3ejaw.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <e158d9bb-e074-df76-d267-76756012c6dc@perex.cz>
Date: Sun, 27 Dec 2020 13:25:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <s5hwnx3ejaw.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Dne 27. 12. 20 v 9:37 Takashi Iwai napsal(a):
> On Sat, 26 Dec 2020 22:35:47 +0100,
> Alex Henrie wrote:
>>
>> Signed-off-by: Alex Henrie <alexhenrie24@gmail.com>
>> ---
>>  src/conf.c | 9 +--------
>>  1 file changed, 1 insertion(+), 8 deletions(-)
>>
>> diff --git a/src/conf.c b/src/conf.c
>> index 44d1bfde..970ad643 100644
>> --- a/src/conf.c
>> +++ b/src/conf.c
>> @@ -877,16 +877,9 @@ static int get_nonwhite(input_t *input)
>>  
>>  static inline int get_hexachar(input_t *input)
>>  {
>> -	int c, num = 0;
>> -
>> +	int c;
>>  	c = get_char(input);
>> -	if (c >= '0' && c <= '9') num |= (c - '0') << 4;
>> -	else if (c >= 'a' && c <= 'f') num |= (c - 'a') << 4;
>> -	else if (c >= 'A' && c <= 'F') num |= (c - 'A') << 4;
>>  	c = get_char(input);
>> -	if (c >= '0' && c <= '9') num |= (c - '0') << 0;
>> -	else if (c >= 'a' && c <= 'f') num |= (c - 'a') << 0;
>> -	else if (c >= 'A' && c <= 'F') num |= (c - 'A') << 0;
>>  	return c;
> 
> The current code is obviously wrong and the suggested fix goes even to
> a wronger direction :)  The function should return num instead.
> 
> I wonder how this did't hit any problem, so far.  Maybe 0x prefix was
> rarely used, fortunately.

It's a bit recent code. I fixed the return value now. It's for \xFF not for
0xFF prefix. Thank you for your investigation, Alex.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
