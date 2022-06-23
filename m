Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5652A5573C4
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jun 2022 09:19:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A99D21B3C;
	Thu, 23 Jun 2022 09:18:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A99D21B3C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655968784;
	bh=vIEOc6rLnwpgDwoV0D/YFZzl6w6c3BwHRhA6PNlPVFo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BR94l4YGsgugKjBULp0qe4DMZUWpNcZ8Slb57zTEh82pEYmYCGlmi/f/59oXDZbDD
	 xGSGVnsZo1MATotc58qWYuRbyZASh0R7ndbP/wHmRfEqvRzqLrZ+YHo5WtXxHzKJwL
	 0zb5hzJ0E05pGs/OwVzg8ErA7xy62DJNUOKPVX60=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 201FEF800D0;
	Thu, 23 Jun 2022 09:18:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27C9FF804C1; Thu, 23 Jun 2022 09:18:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24997F800D0
 for <alsa-devel@alsa-project.org>; Thu, 23 Jun 2022 09:18:33 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 7430DA0040;
 Thu, 23 Jun 2022 09:18:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 7430DA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1655968713; bh=2dRNKdPxWWO39lv0JjkJbAXnLmbp6K8xarieZKwBAhU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cESO39HXZ5QN9AJi560OAaFfrQbUQAozz8+Z4eFre9dBcXzuubFKP1dJ7R90JT0g6
 JJQwznEG9yUjhJ5blZvZimBEk3ZZ+B2tHjpL8b1PzdwgKifPsZia6aKlbbcz1knZRL
 0hdPTXAg65INrMU+XquvWtcxYIgjdFSOsOa78L3c=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 23 Jun 2022 09:18:29 +0200 (CEST)
Message-ID: <fac65634-a702-84c4-da8d-60e01d309c7c@perex.cz>
Date: Thu, 23 Jun 2022 09:18:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: Quirks for MacroSilicon MS2100/MS2106
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, John Veness <john-linux@pelago.org.uk>
References: <795d8e1a-8fc7-2302-613e-ff1743de5c16@pelago.org.uk>
 <878rpnncov.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <878rpnncov.wl-tiwai@suse.de>
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

On 23. 06. 22 7:58, Takashi Iwai wrote:

>> Even with this patch, there is a remaining problem, which is not present
>> in the MS2109. The sound sample values range from 0x0000 to 0x7fff, with
>> silence around 0x4000, i.e. 15-bit-ish audio. This actually sounds OK to
>> the ear (although half as loud as it should be), but looks odd when
>> looking at the waveform, and makes volume meters always think the sound
>> is very loud.
>>
>> To convert to s16le, I can bitshift one bit left, and subtract 32768.
>> I'm told that this isn't something that can or should be done in the
>> kernel, but should be in userspace. Any more advice on how to fix this
>> remaining quirk would be very welcome.
> 
> Ouch, this is painful.  We haven't had any devices that require a
> 15 bit unsigned format, and maybe we don't want to add it to the
> common standard format just for one funky device, either.  Such data
> processing could be done in alsa-lib, but for the proper interaction
> with the user-space, the kernel should provide some information so
> that user-space can process the data accordingly.  However, we have no
> proper way defined for it generically, so far.
> 
> Maybe an easy way would be to create an alsa-lib external plugin, and
> apply it per device.  Jaroslav, could it be done via UCM?

I agree that we may start with a special plugin for this format. The UCM can 
use any alsa-lib configuration now. So PA/PW should work with this very 
specific hardware when properly configured.

Note that we have SNDRV_PCM_FORMAT_SPECIAL for such cases. It will imply that 
the applications will fail when the special conversion plugin is not used. The 
minor issue may be with the silence routines (which is already with the 
improper format).

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
