Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 249EC332596
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Mar 2021 13:39:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB51317C3;
	Tue,  9 Mar 2021 13:38:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB51317C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615293554;
	bh=V4hoR/N2wD1Kf29R0gQQe2HeJB9C/8YjUehGuJReBBg=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NCGAoKBOOylu9U8vtie+93XykpaKCb8L1OpuLnxB2UK4D6JfG1eNyEg40qcjx+Th4
	 HxqbcWaG4ghdWjPhy6r6lnQQRVQFWw0dF9v2A6bTu6fav/zsS1mg8IpktM5glJ4CMo
	 Qs4ic2e+Mz90hLAD7j/FbRRIZYjcSxO/bvNDjd2U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B732F80256;
	Tue,  9 Mar 2021 13:37:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84CBDF8014E; Tue,  9 Mar 2021 13:37:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06290F8014E
 for <alsa-devel@alsa-project.org>; Tue,  9 Mar 2021 13:37:29 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id E9F27A0040;
 Tue,  9 Mar 2021 13:37:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz E9F27A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1615293448; bh=a7zJel/T4lcYutz33CVQoVAk7F1/JbnjlqRC6f0Z25k=;
 h=Subject:To:References:From:Cc:Date:In-Reply-To:From;
 b=U8Rui4DwKPbg/yq+IxxgdMkJWQIiev9jBtxPjQqBRfMgzl+Yy9AVoXrKaHv6+Me2j
 +8OFHJqyL1PIeGhXCUFhKgNyiYVXaJBtiINShCC2Glb3WewXK+Q+1YN46mmr3HzdNt
 kLLQ4obm1UAHgRdYbO7LXROlWvX2ct6EJrHJZz3s=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue,  9 Mar 2021 13:37:26 +0100 (CET)
Subject: Re: alsa-lib's new API issue (snd_ctl_elem_id_compare)
To: alsa-devel@alsa-project.org
References: <20210308125817.GA212288@workstation>
 <5e26625d-3db1-0600-47f8-057c0101d6b1@perex.cz>
 <20210309003803.GA215306@workstation>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <cfadffa0-b89f-13d2-5b52-67842cc4b372@perex.cz>
Date: Tue, 9 Mar 2021 13:37:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210309003803.GA215306@workstation>
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

Dne 09. 03. 21 v 1:38 Takashi Sakamoto napsal(a):
> On Mon, Mar 08, 2021 at 03:33:46PM +0100, Jaroslav Kysela wrote:
>> Dne 08. 03. 21 v 13:58 Takashi Sakamoto napsal(a):
>>> My concerns are:
>>>
>>> 1. evaluation of numid field is not covered.
>>>
>>> This is not preferable since ALSA control core implementation covers two
>>> types of comparison; numid only, and the combination iface, device,
>>> subdevice, name, and index fields. If the API is produced for general use
>>> cases, it should correctly handle the numid-only case, in my opinion.
>>
>> My motivation was to allow to use this function for qsort() for example. The
>> numid and full-field comparisons are two very different things.
>  
> Yep. I easily associated sort implementation in hcontrol API or simple
> mixer API from your implementation
> 
> However, the new API is a part of control API and it just achieves things without
> any supplemental information given from userspace implementation.

It's not required, if documented. Nobody forces to use this function in the
app code.

> For the above comparison API, as I described, it's not appropriate. ID
> structure for control element is not comparable, thus it should be dropped
> or replaced with equality function such as 'snd_ctl_elem_id_equal()'.

I don't require the numid match at this point. The numid is not known or may
change for the id entered by the user. So I need to forcefully ignore it.

If we need a function which follow numid + full id comparison, then we can
introduce it. I agree that it should return only a boolean return value in
this case.

> When you need any sorting algorithms, it should be implemented in
> application side or alsa-lib API in the other layer such as hcontrol and
> simple mixer since control API should follow to specification of ALSA
> control written in kernel land.

I don't follow your arguments here. The numid and full field comparisons are
two different things. The caller must know things behind the scene.
The snd_ctl_elem_id_compare() function may be used as a quick backend for the
full field comparisons with the optimized execution (reduce app -> library calls).

The enums conversion to integers: I think that we're safe here. The interface
enum numbers cannot change and we know the range (and the order), so it's safe.

Lastly, the qsort() with snd_ctl_id_compare() as an argument will produce a
consistent, understandable result, right?

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
