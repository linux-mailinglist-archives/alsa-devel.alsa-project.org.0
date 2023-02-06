Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9F068B872
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Feb 2023 10:19:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA7391E8;
	Mon,  6 Feb 2023 10:18:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA7391E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675675153;
	bh=JyVMpLFR1Qsw8FGCpsMY/tFsIT0RloU4vytFEPz2N/k=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=iOcO14ErDw23m3TqF5zHrVOhGTeVcDH8JnOPE48JF1SNLfzLwMuyK5eGDk3wqqSUf
	 Oory0DhzW2rPvFv8RAFKHramOk1wcOKohhQ3oJX7rL2poq5KGAsb3aeEHv1OWr6M2Q
	 OtgKLAcM5dXb9cZiILKM0ch7Fyh1HbHlGYnV2WmQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7AF5F804FB;
	Mon,  6 Feb 2023 10:18:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD95BF804F1; Mon,  6 Feb 2023 10:18:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53F75F8014B
 for <alsa-devel@alsa-project.org>; Mon,  6 Feb 2023 10:18:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53F75F8014B
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 secure) header.d=perex.cz header.i=@perex.cz header.a=rsa-sha256
 header.s=default header.b=tkA1ulHl
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id B8A2211C3;
 Mon,  6 Feb 2023 10:18:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz B8A2211C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1675675082; bh=UmrCRxoYcIdmE0MvBkiBS/DT6mqNtSfNXsdEEcHDlIQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=tkA1ulHljbSQPxWWmV/5RjZLOuMZN8gUaMG7qE9h1mmvKrln8n8DUw2wK5P9uEdU1
 qwocI7tEqFC2rtt+q9NxopRLuvoXGWF5Ej6p9bISZujWCN/yLlqLzjCP0e3YAy32wE
 Ala7iverTprOgOL2bT4GF7A+jrl4ijOAoem24ER4=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon,  6 Feb 2023 10:17:58 +0100 (CET)
Message-ID: <2f17d941-ebf5-9cf6-f8cd-e6bf249d36f7@perex.cz>
Date: Mon, 6 Feb 2023 10:17:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: Overflow in calculating audio timestamp
Content-Language: en-US
To: Alan Young <consult.awy@gmail.com>, o-takashi@sakamocchi.jp,
 pierre-louis.bossart@linux.intel.com
References: <70ff4e3a-b171-131c-a039-4fc99aa4bbfc@gmail.com>
 <Y9xWlbhPg3PteH5G@workstation>
 <2598bf64-708c-cf62-e634-44db5a850226@gmail.com>
 <74350bce-a6ea-c3b8-7b00-4deb47f7e623@perex.cz>
 <e2ab7f52-4fc9-bcff-5051-5590ca4f8496@gmail.com>
 <fa44f39c-4dea-5433-fd89-1286ed6a94da@perex.cz>
 <4a1eb148-d246-7a10-9eac-57408d57cf74@gmail.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <4a1eb148-d246-7a10-9eac-57408d57cf74@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 06. 02. 23 9:52, Alan Young wrote:
> Hi Jaroslav,
> 
> On 04/02/2023 15:40, Jaroslav Kysela wrote:
>> For 32-bit apps the boundary is near to UINT32_MAX (see
>> recalculate_boundary() function). So only one crossing point is not
>> enough to cover a decent time range.
>>
>> There should be a better check, if the add operation crosses the U64
>> range for snd_BUG_ON. In my eyes, it looks safer to use counter here
>> and do the checks
>> in the function which uses this value.
> 
> 
> I think you are misunderstanding how crossed_boundary is used. It
> relates to a single call of snd_pcm_update_hw_ptr0(), which should be
> called once per period, or at the very least once per buffer-size. In
> its processing, it may be detected that the boundary has been crossed.
> There are three separate tests that could result in this but only one
> should actually happen during a single call. The snd_BUG_ON() is just to
> detect (report on) a failure in that logic.

Oops, the `snd_BUG_ON(crossed_boundary != 1)` check is fine, of course. I 
thought that `if (crossed_boundary)` checks for `if (runtime->hw_ptr_wrap)` 
which has a different meaning. Thank you for your explanation.

> None of this restricts the total number of frames that might be
> processed, as a result of multiple boundary crossings.

Unfortunately, for 64-bit systems, it works only for up to 2 iterations, 
because boundary is nearby LONG_MAX (see snd_pcm_hw_params()).

> Changing hw_ptr_wrap to be a boundary-wrap-counter instead of its
> current use as the cumulative number of frames processed at boundary
> wraps would not make any useful difference.

At least, we should not have a problem even with the 64-bit boundary crossing 
in the hw_ptr0 function. But given the fact, that it's impossible to reach 
this limit, the fix for the timestamp calculation would be sufficient at the 
moment.

And `snd_BUG_ON(runtime->hw_ptr_wrap < runtime->boundary);` check may be 
useful when the hw_ptr_wrap is updated.

			Thanks,
				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

