Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDF428BA7C
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Oct 2020 16:12:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AED3E1690;
	Mon, 12 Oct 2020 16:11:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AED3E1690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602511935;
	bh=Cd+eCB+XbVh0CqGByF0+m/xC7FzxQLBlmRLFHuHmJTE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KX/ubMjiEi9BXLOo5dZc8nQncbYrLRb7U0UAYUGD7QjIhKlxclLcwz/b7YMwi7a5K
	 kTR0YZ9t7PsfVSpZfQtCb4DOdtooC5U/GjV4aGH6sJ8zlYbe9X+0uub4qrQJKM5oC2
	 PG1hEQ0c4WGQ3rAd3HfaYr16bUiMcdH0yVfhIlrE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70299F8020D;
	Mon, 12 Oct 2020 16:10:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5607EF80217; Mon, 12 Oct 2020 16:10:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_78,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61983F80141
 for <alsa-devel@alsa-project.org>; Mon, 12 Oct 2020 16:10:24 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 304E6A0042;
 Mon, 12 Oct 2020 16:10:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 304E6A0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1602511824; bh=joOHDeUVSNZquizcRn7PrSark7NBlmpRxRqq4ueEm+4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=2lG+rZOZPz2PwU9dUBGqbnXhXR1Wdq/NXgK4pKlf9MUjPywag9Ey2u430bnPSluxY
 ZA5E97l5FgOAjjumqaYv2KNG2nR6e9s5NIZvSYJjVHp2PJ01GDvA+mO5TTt1wWX7mJ
 mxK5GRvR1OFyEKoYLx4ry+4Mg7+VrbFJ9zjm0vGI=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 12 Oct 2020 16:10:11 +0200 (CEST)
Subject: Re: [PATCH] ALSA: compress: allow pause and resume during draining
To: Vinod Koul <vkoul@kernel.org>
References: <20201006062105.GQ2968@vkoul-mobl>
 <4bbc385b-d35a-8766-7981-034455287225@linux.intel.com>
 <000d01d69d58$4e2db6f0$ea8924d0$@samsung.com> <s5hr1q7sa9f.wl-tiwai@suse.de>
 <831bbfcf-9720-9100-8633-65932b415cab@perex.cz>
 <s5ha6wusb2l.wl-tiwai@suse.de> <20201012052525.GH2968@vkoul-mobl>
 <s5hk0vwq65o.wl-tiwai@suse.de> <20201012122423.GJ2968@vkoul-mobl>
 <5b26cdd5-8a15-fa26-86af-13bfbfad5341@perex.cz>
 <20201012135540.GK2968@vkoul-mobl>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <777e0046-1e3a-e702-c070-cac4c0525ccd@perex.cz>
Date: Mon, 12 Oct 2020 16:10:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201012135540.GK2968@vkoul-mobl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, khw0178.kim@samsung.com, lgirdwood@gmail.com,
 Takashi Iwai <tiwai@suse.de>, s47.kang@samsung.com, tiwai@suse.com,
 'Pierre-Louis Bossart' <pierre-louis.bossart@linux.intel.com>,
 kimty@samsung.com, hmseo@samsung.com, Gyeongtaek Lee <gt82.lee@samsung.com>,
 pilsun.jang@samsung.com, tkjung@samsung.com
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

Dne 12. 10. 20 v 15:55 Vinod Koul napsal(a):
> On 12-10-20, 15:29, Jaroslav Kysela wrote:
>> Dne 12. 10. 20 v 14:24 Vinod Koul napsal(a):
>>> On 12-10-20, 09:01, Takashi Iwai wrote:
>>>> On Mon, 12 Oct 2020 07:25:25 +0200,
>>>
>>>>> So what if we add another state but keep it in kernel (hidden from
>>>>> userspace)...?
>>>>
>>>> That's fine, then it's just a kernel's business, and it should be
>>>> determined which one makes the code better.
>>>>
>>>> But, there are things to be considered, though:
>>>>
>>>> - SNDRV_PCM_STATE_* is defined as snd_pcm_state_t with __bitwise.
>>>>   This indicates that the type has to be defined in that way
>>>>   explicitly.
>>>>
>>>> - Having a value over SNDRV_PCM_STATE_LAST internally is hackish.
>>>>
>>>>> Right now tinycompress does not make use of PCM streams, kernel handles
>>>>> these. I am not aware of any other implementation.
>>>>>
>>>>> So if the scope if within compress then it might work...
>>>>
>>>> Yes.  But currently the API uses SND_PCM_* even for the compress
>>>> stuff.  Changing this value means to have influence on PCM, even if
>>>> PCM stuff doesn't use it yet.  (At least you'd need to increase
>>>> SND_PCM_STATE_LAST, for example.)
>>>>
>>>> That said, if we want to change only for compress API by assuming that
>>>> the impact must be negligible, the first step would be to move from
>>>> SND_PCM_STATE_* to the own state, SND_COMPRESS_STATE_*.  The values
>>>> should be compatible, but this has to be changed at first.  Then you
>>>> can introduce a new value there.
>>>
>>> I think that sounds reasonable to me, we should not have used
>>> SNDRV_PCM_STATE_* in the first place and long term fix for this should
>>> be SNDRV_COMPRESS_STATE_
>>>
>>> I will cook a patch for this
>>
>> Although the impact is not high, I do think that we should enable the new
>> behaviour conditionally (when the user space asks for it) even if the state
>> values are split. I think that the whole thread is about 'how to extend the
>> current APIs'. The hidden way is really not so nice.
>>
>> Unfortunately, there are no reserved fields in the snd_compr_params structure
>> for this, but I see the similarity with the 'no_wake_mode' field which
>> controls the driver behaviour.
> 
> I was not really thinking of exporting the states to userspace.
> Tinycompress does not use it, I do not see any uses of it to enable
> userspace with it.. Do you think it should be exposed? If so why..?

I don't think that it's required to expose the state for the compressed API to
add this new feature. I just talk about to activate the new feature
conditionally. The question is how to extend the API now.

> Worst case we add an ioctl to query the state.. the state transitions
> are anyway result of control ops on the stream
> 
> Btw what was the motivation for pcm to expose the stream states..?

The driver may change the state when underrun / overrun or an I/O error occurs
and there's also mmap write/read mode, so the traditional read/write with an
error code handling does not work here. Also, the user space should know the
state anyway, so it's better to have all parts synced.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
