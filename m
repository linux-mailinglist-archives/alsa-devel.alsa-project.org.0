Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8858231140
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jul 2020 20:06:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BDB6172E;
	Tue, 28 Jul 2020 20:06:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BDB6172E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595959612;
	bh=0Ua1ja880B5IXX5sTNY5a4Vw0BHAGfEfKDZ7Rk8BpiY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mn/5ylJZlzZfDCcbo96itH4KYmz2qiQ9jt5DB5j23GTIPFGBaHo56C5Phlr8Hf+//
	 4BqLRWw5qqGyacm1Rq9vWJN2Ia9G88UzGngijp/E3dR2+9JWgBgY8cBdtbN0N0F0ZN
	 KXH0IfnTq0n7Vu7iCiOGndif60C0rv3cpDUf6x5E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BDC9F80227;
	Tue, 28 Jul 2020 20:05:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59650F8021E; Tue, 28 Jul 2020 20:05:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from cable.insite.cz (cable.insite.cz [84.242.75.189])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2424F800DE
 for <alsa-devel@alsa-project.org>; Tue, 28 Jul 2020 20:05:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2424F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="SM9s20sf"; 
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="FDj6v26g"
Received: from localhost (localhost [127.0.0.1])
 by cable.insite.cz (Postfix) with ESMTP id 61013A1F6762F;
 Tue, 28 Jul 2020 20:04:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1595959499; bh=0Ua1ja880B5IXX5sTNY5a4Vw0BHAGfEfKDZ7Rk8BpiY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=SM9s20sfgGP0FeELhDH+yscejczptlNBWam7tXBIlnurilTpQjQO69IqmeJDZraxK
 JXxArbsYA6PDdrFuR1peiTm2ZRyADoeqDx+wtcE9ZhfXnn/6Gs+x3HzSRqMT1Ou+vu
 ll8qQIxO4BQcMHkxVmEeLIWYxKQhMjld2u0ykAEA=
Received: from cable.insite.cz ([84.242.75.189])
 by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TaxkpFL5EWxn; Tue, 28 Jul 2020 20:04:54 +0200 (CEST)
Received: from [192.168.105.151] (ip28.insite.cz [81.0.237.28])
 (Authenticated sender: pavel)
 by cable.insite.cz (Postfix) with ESMTPSA id CD31BA1F4B1B4;
 Tue, 28 Jul 2020 20:04:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1595959493; bh=0Ua1ja880B5IXX5sTNY5a4Vw0BHAGfEfKDZ7Rk8BpiY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=FDj6v26gEJVt+yYdOFUpuDB1BTi5wuuWWSTkpNbiHgg7EKxGlTdTxf4Ta7i7jPFn/
 D8GTfeEBMJUk3XXYz7xU0P7mDCKoh5dOGyTYjGvomnle92ptcfnmZv5j/s27TiItwI
 NDvUzXPYG5HeNjWJ9rCeW0Ffpib+I5x1FlSafQPc=
Subject: Re: pcm_meter.c issue at s16_update
To: Takashi Iwai <tiwai@suse.de>
References: <f56d6a67-014a-e562-c253-830c0ec03717@ivitera.com>
 <9957e124-be4b-cdc9-ffad-579b631455df@ivitera.com>
 <s5hd04ffu4m.wl-tiwai@suse.de>
From: Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <fd493c4d-797e-d76d-771d-7c7483ffdea7@ivitera.com>
Date: Tue, 28 Jul 2020 20:04:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <s5hd04ffu4m.wl-tiwai@suse.de>
Content-Type: text/plain; charset=iso-8859-2
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
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

Dne 28. 07. 20 v 19:04 Takashi Iwai napsal(a):
> On Tue, 28 Jul 2020 18:46:00 +0200,
> Pavel Hofman wrote:
>>
>>
>>>
>>> The debug around the event looks like this, suddenly meter->now drops down:
>>>
>>> s16_update 1: meter->now 2567498, s16->old 2566593, size 905
>>> s16_update 1: meter->now 2568401, s16->old 2567498, size 903
>>> s16_update 1: meter->now 20786, s16->old 20786, size 0
>>> s16_update 1: meter->now 1065, s16->old 20786, size -19721
>>> s16_update 1: meter->now 24839, s16->old 24838, size 1
>>> s16_update 1: meter->now 701, s16->old 24839, size -24138
>>> s16_update 1: meter->now 1253162, s16->old 701, size 1252461
>>> s16_update 1: meter->now 1255148, s16->old 1253162, size 1986
>>>
>>> ..........
>>>
>>> s16_update 1: meter->now 11136, s16->old 10261, size 875
>>> s16_update 1: meter->now 22525, s16->old 22524, size 1
>>> s16_update 1: meter->now 963, s16->old 22525, size -21562
>>> s16_update 1: meter->now 1270914, s16->old 963, size 1269951
>>> s16_update 1: meter->now 1272917, s16->old 1270914, size 2003
>>>
>>
>> I think the problem is that s16->old is not reset when status.appl_ptr
>> is zeroed and starts running again. There is a call
>>
>> static void s16_reset(snd_pcm_scope_t *scope)
>> {
>> 	snd_pcm_scope_s16_t *s16 = scope->private_data;
>> 	snd_pcm_meter_t *meter = s16->pcm->private_data;
>> 	s16->old = meter->now;
>> }
>>
>> but I do not know when this method is called and whether the meter->now
>> is already assigned to the newly zeroed status.appl_ptr.
> 
> Would adding atomic_add(&meter->reset, 1) in snd_pcm_meter_reset()
> help?
> 
Unfortunately not.

s16_reset is called correctly, setting s16->old = meter->now;  But at
that time meter->now is still 22751, setting s16->old to the same value.

s16_update 1: meter->now 22751, s16->old 22751, size 0

However, in the next update call meter->now comes from the freshly
started application pointer:

s16_update 1: meter->now 839, s16->old 22751, size -21912


Of course this helps:

-       if (size < 0)
-               size += spcm->boundary;
+       if (size < 0) {
+               size = meter->now;
+               s16->old = 0;
+       }

But I understand this is not a solution because:

* it will not work at reaching spcm->boundary (after thousands of hours?)
* it will cause the same problem when the stream is rewound (which is
the problem now too) - size will equal to large meter->now (length from
the beginning of the stream minus the rewound = large number).


BTW, please why is snd_pcm_meter_update_scope called only in capture stream?

Thanks,

Pavel.


