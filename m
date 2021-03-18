Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF01A340AFC
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Mar 2021 18:06:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B45E1697;
	Thu, 18 Mar 2021 18:05:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B45E1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616087185;
	bh=oRxP1qVYQ1+vfW3RF7RNPpD6ylYcVHmT/UkgIKA95JY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L5MiEuBqizAd3L6xB5mIid7Bdg/0TM0wqaPNC+BZ+TC7Nsi8gciUA88FhW7cXf0vK
	 vCaLrcApyV7YV1Uuf+nbK3tFJ+Bx5rqZvmuhz94RiviS9PL4sE8KRchwVNc9jbj5Ct
	 B5ADkRdcf1yx4X4MjMNhgPsJKwR1zTth0vRTUG7E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1F8FF800C8;
	Thu, 18 Mar 2021 18:04:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2610F80165; Thu, 18 Mar 2021 18:04:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E48EF80124
 for <alsa-devel@alsa-project.org>; Thu, 18 Mar 2021 18:04:42 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 0C4DBA0049;
 Thu, 18 Mar 2021 18:04:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 0C4DBA0049
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1616087081; bh=51oDQfaz+F2cwkvB1TFlKzpqMns0tfLhodTdWGhDud0=;
 h=Subject:To:References:From:Cc:Date:In-Reply-To:From;
 b=5H6J52xa2hso4Q34gCIJ/2/d8lBNUZdXuoRU+6oGhmLydjUHvpfGO4wJafqoVKa9O
 kkqHoDBkHe0MVVsEXq1xz8AhKnUIDf6SkoNVEo4NhQ94h3EPZrcDasE8BDM7pAVMUw
 WlStYaFZqZpuBQ92Iy+TTZpmjsh5kM1TfC5U15qM=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 18 Mar 2021 18:04:36 +0100 (CET)
Subject: Re: [alsa-lib][PATCH 0/6] add API of equality and comparison for a
 pair of control element IDs
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
References: <20210318103013.265264-1-o-takashi@sakamocchi.jp>
 <16eab1c6-03ef-fb06-9e5d-888de1cb63b4@perex.cz>
 <20210318163715.GA273829@workstation>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <fa976b85-2d27-6e5f-9811-21e5031e39c2@perex.cz>
Date: Thu, 18 Mar 2021 18:04:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210318163715.GA273829@workstation>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, tanjeff@cccmz.de
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

Dne 18. 03. 21 v 17:37 Takashi Sakamoto napsal(a):
> On Thu, Mar 18, 2021 at 12:42:30PM +0100, Jaroslav Kysela wrote:
>> Dne 18. 03. 21 v 11:30 Takashi Sakamoto napsal(a):
>>> Hi,
>>>
>>> This patchset is a fix for bug issued in the message thread[1].
>>>
>>> In this development period, alsa-lib got new API as implementation for
>>> one of comparison algorithms to a pair of control element IDs. However,
>>> it has several issues.
>>>
>>> At first, the name, 'snd_ctl_elem_id_compare()', is inappropriate since it
>>> implements one of comparison algorithms. The name itself implies the
>>> algorithm is single and unique for control element ID. However, the
>>> target structure, 'struct snd_ctl_elem_id', is hybrid and compound one.
>>> We can not find such single and unique comparison algorithm for it.
>>>
>>> Secondary, it subtracts a pair of values in fields of 'unsigned int' type
>>> in storage size of the type. It brings integer overflow.
>>
>> I don't think that this extra handling is really required. The unsigned /
>> signed conversions are well known and the overflow results with a negative
>> signed value. Why add more branches to the instruction chain?
>  
> For this kind of question, it's preferable to write actual test:
> 
> ```
> int main()
> {
>   snd_ctl_elem_id_t *l, *r;
> 
>   snd_ctl_elem_id_alloca(&l);
>   snd_ctl_elem_id_alloca(&r);
> 
>   snd_ctl_elem_id_set_device(l, 0);
>   snd_ctl_elem_id_set_device(r, UINT_MAX);
> 
>   assert(snd_ctl_elem_id_compare(l, r) < 0);
> 
>   return 0;
> }
> ```
> 
> The assertion hits. For conversion detail:
> 
> ```
> $ cat test1.c
> #include <stdio.h>
> #include <stdlib.h>
> #include <limits.h>
> 
> int main()
> {
> 	unsigned int a, b;
> 	int diff;
> 
> 	a = 0;
> 	b = 10;
> 	diff = a - b;
> 	printf("%08x\n", diff);
> 
> 	a = 0;
> 	b = UINT_MAX;
> 	diff = a - b;
> 	printf("%08x\n", diff);
> 
> 	return EXIT_SUCCESS;
> }
> ```
> 
> The above test results in 0x00000001 for -UINT_MAX case under x386/x86_64,
> like:
> 
> ```
> $ gcc -m32 -o ./test1 ./test1.c ; ./test1
> fffffff6
> 00000001
> $ gcc -m64 -o ./test1 ./test1.c ; ./test1
> fffffff6
> 00000001
> ```
> 
> We can see integer overflow in both machine architectures due to
> calculation under 32 bit storage.
> 
> Well, let us prepare 64 bit storage for both of minuend and subtrahend
> to get negative value in 64 bit storage. In the case, narrower conversion
> to 32 bit integer is unavoidable since it's assigned to integer value
> returned from the function in your implementation. In the case, converted
> value is _not_ negative according to assignment rule in C language
> specification.
> 
> ```
> $ cat test2.c
> #include <stdio.h>
> #include <stdlib.h>
> #include <limits.h>
> 
> int main()
> {
> 	unsigned int a, b;
> 	long long diff;
> 	int ret;
> 
> 	a = 0;
> 	b = UINT_MAX;
> 
> 	// Calculate under 64 bit storage, then assign to 64 bit storage.
> 	diff = (long long)a - (long long)b;
> 	printf("%016llx\n", diff);
> 
> 	// Narrower conversion occurs now.
> 	ret = (int)diff;
> 	printf("%08x\n", ret);
> 
> 	return EXIT_SUCCESS;
> }
> $ gcc -m32 -o ./test2 ./test2.c ; ./test2
> ffffffff00000001
> 00000001
> $ gcc -m64 -o ./test2 ./test2.c ; ./test2
> ffffffff00000001
> 00000001
> ```
> 
> We can see easy example in the clause of 'Assignment operators' in the
> specification. This is the reason to use condition branches in the patchset.

The point is that none of the compared unsigned fields is really above the
31-bit range, so you're trying to resolve an academical problem instead to add
the debug checks (asserts) if the input values are in the acceptable range.
Only the numid functions require this.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
