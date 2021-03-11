Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC41A3373B9
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 14:24:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5852517F4;
	Thu, 11 Mar 2021 14:23:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5852517F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615469078;
	bh=8Wjc52jz7tUQgbhMsd1WPTQnUJoxexJODpk6qxB2l9g=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j5saDeiJmTZEwjzTkVyDPhVdgs0Gqk9gsSYFohlyvHOLg94dKUIsuhCO9t+5xxn4Q
	 jPGpbRawgrewejo+WLoUQG6PRtdara7oWHjBmGKBvS/33aPi4mSMoU9WD6sbaIiyIv
	 h0uZ7KUs8geZj6YWEhxfm9oa3h1XZslx21Dxaz+M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86C91F80256;
	Thu, 11 Mar 2021 14:23:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95EC2F80227; Thu, 11 Mar 2021 14:23:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6421BF8015B
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 14:22:47 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 51BABA003F;
 Thu, 11 Mar 2021 14:22:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 51BABA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1615468967; bh=l/ZckV8r8tiDjX3vTN2fyQOw6HyVa5Wfc5hEBtquwiU=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
 b=zYp/lFSIssp/EKQ4kAddbygiQGF1Zod1zDV3KYL+YPs26taqTkfk26+tyw8DTXb9V
 2Lwo7UhQJilF2/oCAo8uGwtgu8HnkhMsO4VFKAi1relrmYZi5F8PIEtFz/v08vui8i
 OLQSer0WLyeAglqOddwI2UdD2ymJXOFP7p5/U6dY=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 11 Mar 2021 14:22:45 +0100 (CET)
Subject: Re: alsa-lib's new API issue (snd_ctl_elem_id_compare)
To: alsa-devel@alsa-project.org
References: <20210308125817.GA212288@workstation>
 <5e26625d-3db1-0600-47f8-057c0101d6b1@perex.cz>
 <20210309003803.GA215306@workstation>
 <cfadffa0-b89f-13d2-5b52-67842cc4b372@perex.cz>
 <20210311124628.GA407735@workstation>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <bb3e0483-e348-2b9a-14cc-ca01992c73dd@perex.cz>
Date: Thu, 11 Mar 2021 14:22:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311124628.GA407735@workstation>
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

Dne 11. 03. 21 v 13:46 Takashi Sakamoto napsal(a):
> Hi,
> 
> Sorry to be late for reply but I have a bit busy for patchset to test
> programs of axfer in alsa-utils[1].
> 
> On Tue, Mar 09, 2021 at 01:37:26PM +0100, Jaroslav Kysela wrote:
>> Dne 09. 03. 21 v 1:38 Takashi Sakamoto napsal(a):
>>> On Mon, Mar 08, 2021 at 03:33:46PM +0100, Jaroslav Kysela wrote:
>>>> Dne 08. 03. 21 v 13:58 Takashi Sakamoto napsal(a):
>>>>> My concerns are:
>>>>>
>>>>> 1. evaluation of numid field is not covered.
>>>>>
>>>>> This is not preferable since ALSA control core implementation covers two
>>>>> types of comparison; numid only, and the combination iface, device,
>>>>> subdevice, name, and index fields. If the API is produced for general use
>>>>> cases, it should correctly handle the numid-only case, in my opinion.
>>>>
>>>> My motivation was to allow to use this function for qsort() for example. The
>>>> numid and full-field comparisons are two very different things.
>>>  
>>> Yep. I easily associated sort implementation in hcontrol API or simple
>>> mixer API from your implementation
>>>
>>> However, the new API is a part of control API and it just achieves things without
>>> any supplemental information given from userspace implementation.
>>
>> It's not required, if documented. Nobody forces to use this function in the
>> app code.
>>
>>> For the above comparison API, as I described, it's not appropriate. ID
>>> structure for control element is not comparable, thus it should be dropped
>>> or replaced with equality function such as 'snd_ctl_elem_id_equal()'.
>>
>> I don't require the numid match at this point. The numid is not known or may
>> change for the id entered by the user. So I need to forcefully ignore it.
>>
>> If we need a function which follow numid + full id comparison, then we can
>> introduce it. I agree that it should return only a boolean return value in
>> this case.
>>
>>> When you need any sorting algorithms, it should be implemented in
>>> application side or alsa-lib API in the other layer such as hcontrol and
>>> simple mixer since control API should follow to specification of ALSA
>>> control written in kernel land.
>>
>> I don't follow your arguments here. The numid and full field comparisons are
>> two different things. The caller must know things behind the scene.
>> The snd_ctl_elem_id_compare() function may be used as a quick backend for the
>> full field comparisons with the optimized execution (reduce app -> library calls).
>>
>> The enums conversion to integers: I think that we're safe here. The interface
>> enum numbers cannot change and we know the range (and the order), so it's safe.
>>
>> Lastly, the qsort() with snd_ctl_id_compare() as an argument will produce a
>> consistent, understandable result, right?
> 
> Hm. I believe that you agree with the fact that we can make various
> algorithms to compare a pair of IDs for control elements. When focusing
> on fields except for numid, we can make the other algorithms against your
> implementation, since the ID structure is compound one. Each of the
> algorithms can return different result.
> 
> Here, I'd like to shift the discussion to the name of new API. Although it
> has the most common name, 'snd_ctl_id_compare', it just has one of
> comparison algorithms. I have a concern that the name can gives wrong idea
> to users that the ID structure for control element had design to be able to
> be compared by itself and it would just be a single comparison algorithm.
> 
> I suggest to rename the new API to express that it implements one of
> comparison algorithm. In a case of numid comparison, it would be
> 'snd_ctl_id_compare_by_numid()'. For your case,
> 'snd_ctl_id_compare_by_name_arithmetic' or something suitable.

Perhaps, we can add a third argument defining the sorting algorithm, so we
don't bloat the symbol tables so much when we add a new sorting type (enum).
It would mean that the function cannot be used as a direct argument to
qsort(), but I think that the apps add usually an extra code to own callback
depending on containers, anyway. Is it more appropriate for you?

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
