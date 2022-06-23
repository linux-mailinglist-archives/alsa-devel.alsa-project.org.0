Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3866D5575EC
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jun 2022 10:52:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C07061B4A;
	Thu, 23 Jun 2022 10:51:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C07061B4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655974349;
	bh=FW8L/bk5u8eins9qMdKYof4JCDFWWKOkttr9gjzr6iY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sb0fMpQ7hL1IM63RrKtt7/XZNjVK9ct4ikGJ7U47L5XhbPeGPYOuVq6xSVU7gHmpl
	 JEN/llD6TRzjc2+pA+4R6PRNMA+P/XgEh65yz3M21cYOoww0LkJBRv2/0xH7PozhGa
	 uQ1wkKwr+eV4DNLTUeTvWz/TR/VUQdJH61L1rdQw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4073BF804CC;
	Thu, 23 Jun 2022 10:51:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F37D1F804C1; Thu, 23 Jun 2022 10:51:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2E9AF800CB
 for <alsa-devel@alsa-project.org>; Thu, 23 Jun 2022 10:51:23 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 511AFA0040;
 Thu, 23 Jun 2022 10:51:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 511AFA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1655974283; bh=JJ4tXK6zg07YF+pEhNc1p0PMCyaS6CmpDG/KbFAcJUk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Zpfaa06oZwnl+AJg6R8M0uoBHeMpIpwC4lx9dLSPue+pwpye2ecv7JjpWkX87Alwd
 6qiJvHEGN9WsB0gIRk3buY2Qu2sApT9zv25EDboQ1A4Sr9G6znQREhIRvpS2kw3PVL
 KkGwPRK+Gl+lbLKiFre1VShky8rzhqNO3QGa35TY=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 23 Jun 2022 10:51:18 +0200 (CEST)
Message-ID: <3b6cef6b-674d-339a-7221-c72d54805bca@perex.cz>
Date: Thu, 23 Jun 2022 10:51:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: Quirks for MacroSilicon MS2100/MS2106
Content-Language: en-US
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>, Takashi Iwai <tiwai@suse.de>, 
 John Veness <john-linux@pelago.org.uk>
References: <795d8e1a-8fc7-2302-613e-ff1743de5c16@pelago.org.uk>
 <878rpnncov.wl-tiwai@suse.de> <fac65634-a702-84c4-da8d-60e01d309c7c@perex.cz>
 <298967f1-841b-4b39-9a6e-8bf22c49181d@www.fastmail.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <298967f1-841b-4b39-9a6e-8bf22c49181d@www.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Hector Martin <marcan@marcan.st>
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

On 23. 06. 22 10:24, Takashi Sakamoto wrote:
> Hi,
> 
> On Thu, Jun 23, 2022, at 16:18, Jaroslav Kysela wrote:
>> On 23. 06. 22 7:58, Takashi Iwai wrote:
>>
>>>> Even with this patch, there is a remaining problem, which is not present
>>>> in the MS2109. The sound sample values range from 0x0000 to 0x7fff, with
>>>> silence around 0x4000, i.e. 15-bit-ish audio. This actually sounds OK to
>>>> the ear (although half as loud as it should be), but looks odd when
>>>> looking at the waveform, and makes volume meters always think the sound
>>>> is very loud.
>>>>
>>>> To convert to s16le, I can bitshift one bit left, and subtract 32768.
>>>> I'm told that this isn't something that can or should be done in the
>>>> kernel, but should be in userspace. Any more advice on how to fix this
>>>> remaining quirk would be very welcome.
>>>
>>> Ouch, this is painful.  We haven't had any devices that require a
>>> 15 bit unsigned format, and maybe we don't want to add it to the
>>> common standard format just for one funky device, either.  Such data
>>> processing could be done in alsa-lib, but for the proper interaction
>>> with the user-space, the kernel should provide some information so
>>> that user-space can process the data accordingly.  However, we have no
>>> proper way defined for it generically, so far.
>>>
>>> Maybe an easy way would be to create an alsa-lib external plugin, and
>>> apply it per device.  Jaroslav, could it be done via UCM?
>>
>> I agree that we may start with a special plugin for this format. The UCM can
>> use any alsa-lib configuration now. So PA/PW should work with this very
>> specific hardware when properly configured.
>>
>> Note that we have SNDRV_PCM_FORMAT_SPECIAL for such cases. It will imply that
>> the applications will fail when the special conversion plugin is not used. The
>> minor issue may be with the silence routines (which is already with the
>> improper format).
> 
> I think the combination of format/subformat is available in the case.
> 
> Actually the odd frame format is within 16 bit slot, so SNDRV_PCM_FORMAT_U16
> or so is available. Then we can define new subformat to notify userspace; e.g.
> SNDRV_PCM_SUBFORMAT_MODEL_SPECIFIC.
> 
> The cons is that we need to add new subformat, thus update asound.h. On the
> other hand, the pros is that existent userspace stuffs still handle the odd format
> and user can hear playback sound at least even if the loudness is not expected.

It's a question if the cutted half-wave samples should be sent to D/A in this 
case. Also, if the high-bit (U16) is set, the resulting sample value for D/A 
is completely incorrect. It's not only about loudness. My opinion is to not 
use the U16 sample format for this and handle this hw as special one until the 
format is more common (which I do not expect) to extend the format list.

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
