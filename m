Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6DB3389B6
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 11:11:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CC3B16EC;
	Fri, 12 Mar 2021 11:10:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CC3B16EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615543885;
	bh=G7WrYfneBhLEr+t5TzSWej2Ch2f9WTCEli3jbWHXUsc=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Nza71ORHeeFwFePhiYU6bm3NRMnPQ/QZALwp8rBQjmdt0VcCqcCUFzkr1xEYvqtxH
	 LyFcyqZpKSkpKHHB9Nr/vU7cOJBJP5/hSLNu5rgnZNHpqzucsDn5tf4VTAFSlMWwf5
	 4aH/w9U1iHut7K98R69Z3Trtli14OlZEod0rtPSY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76ABBF800BF;
	Fri, 12 Mar 2021 11:09:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95F56F801D8; Fri, 12 Mar 2021 11:09:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BBE3F8012A
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 11:09:45 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id E20BEA003F;
 Fri, 12 Mar 2021 11:09:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz E20BEA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1615543784; bh=SzBO1sbOfJ39N0amin2/v6dS7nLDd9BgYXs+zhhfzrk=;
 h=Subject:To:References:From:Cc:Date:In-Reply-To:From;
 b=Z37N+bgvMJfFhWwyS32uw81+gYi65TV2jiWCTpvoKqmx7Zr6bBXMkwwGWxP3PzNx0
 HeDKeiIRIzysSFycUaQid+eqvKA4Y7G06NJ4ppWclBHCBctBWQXQSs/amez0aZzWG9
 ZVgVguD1rIrW7R/Bj7gqoVryQZxHfoL+BeBsq1LU=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 12 Mar 2021 11:09:42 +0100 (CET)
Subject: Re: alsa-lib's new API issue (snd_ctl_elem_id_compare)
To: alsa-devel@alsa-project.org
References: <20210308125817.GA212288@workstation>
 <5e26625d-3db1-0600-47f8-057c0101d6b1@perex.cz>
 <20210309003803.GA215306@workstation>
 <cfadffa0-b89f-13d2-5b52-67842cc4b372@perex.cz>
 <20210311124628.GA407735@workstation>
 <bb3e0483-e348-2b9a-14cc-ca01992c73dd@perex.cz>
 <20210312013517.GA412450@workstation>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <c1714fde-4638-bd24-c8c4-9fc0c63ba1a5@perex.cz>
Date: Fri, 12 Mar 2021 11:09:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210312013517.GA412450@workstation>
Content-Type: text/plain; charset=utf-8
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

Dne 12. 03. 21 v 2:35 Takashi Sakamoto napsal(a):
> On Thu, Mar 11, 2021 at 02:22:45PM +0100, Jaroslav Kysela wrote:
>>> Hm. I believe that you agree with the fact that we can make various
>>> algorithms to compare a pair of IDs for control elements. When focusing
>>> on fields except for numid, we can make the other algorithms against your
>>> implementation, since the ID structure is compound one. Each of the
>>> algorithms can return different result.
>>>
>>> Here, I'd like to shift the discussion to the name of new API. Although it
>>> has the most common name, 'snd_ctl_id_compare', it just has one of
>>> comparison algorithms. I have a concern that the name can gives wrong idea
>>> to users that the ID structure for control element had design to be able to
>>> be compared by itself and it would just be a single comparison algorithm.
>>>
>>> I suggest to rename the new API to express that it implements one of
>>> comparison algorithm. In a case of numid comparison, it would be
>>> 'snd_ctl_id_compare_by_numid()'. For your case,
>>> 'snd_ctl_id_compare_by_name_arithmetic' or something suitable.
>>
>> Perhaps, we can add a third argument defining the sorting algorithm, so we
>> don't bloat the symbol tables so much when we add a new sorting type (enum).
>> It would mean that the function cannot be used as a direct argument to
>> qsort(), but I think that the apps add usually an extra code to own callback
>> depending on containers, anyway. Is it more appropriate for you?
> 
> I've already investigated the idea you describe, however I concluded
> that it has more complexity than convenience.
> 
> For example, the prototype would be:
> 
> ```
> int new_api(const snd_ctl_elem_id_t *l, const snd_ctl_elem_id_t *r,
>             int (*algorithm)(const snd_ctl_elem_id_t *,
>                              const snd_ctl_elem_id_t *));
> ```
> 
> For usage with qsort_r(3), programmer should do:
> 
> ```
> int my_algo(const snd_ctl_elem_id_t *l, snd_ctl_elem_id_t *r)
> {
>    ...
> }
> 
> qsort_r(base, nmemb, size, new_api, my_algo);
> ```

I meant:

```
int new_api(const snd_ctl_elem_id_t *id1, const const snd_ctl_elem_id_t *id2,
            snd_ctl_compare_type_t ctype)
{
   ...
}

int my_algo(void *a, void *b)
{
	struct mystruct *my1 = a;
	struct mystruct *my2 = b;
	... possible extra code ...
	return new_api(&my1->id, &my2->id, SND_CTL_COMPARE_FULL_WO_NUMID);
}

qsort(base, nmemb, size, my_algo);

int my_algo_r(void *a, void *b, void *opaque)
{
	struct config *cfg = opaque;
	struct mystruct *my1 = a;
	struct mystruct *my2 = b;
	.. possibe extra code ..
	return new_api(&my1->id, &my2->id, cfg->sort_type);
}

qsort_r(base, nmemb, size, my_algo_r, cfg);
```

So I don't see a real drawback in the real use. Of course, each API has some
pros and cons, but I think that mine is easier for the common cases than the
set of functions. The two argument functions can be used directly only with
qsort() anyway.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
