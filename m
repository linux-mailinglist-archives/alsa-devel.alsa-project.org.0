Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B65561646F
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Nov 2022 15:06:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 320E5167F;
	Wed,  2 Nov 2022 15:06:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 320E5167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667398019;
	bh=UkVwzErMvpsvbDA6B1v7Br2CwAYGnrS4Z4sFGRcnJ48=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g7aJLByq+G8YpTg5MEtArypji9gZ3LCGYiq0IMUb0llYnHg+d/JK36PI09q5gwfBf
	 IOwNUecEPY/L7GHGSlfqJCKKv32gTTuNP7XKqhSNrkcIhqoaatd9ELAENol1KjM577
	 9damy18fDir0hsGEf+naxRy7+95BH6HvnyUxN+uE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87876F80423;
	Wed,  2 Nov 2022 15:06:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94BBCF8026D; Wed,  2 Nov 2022 15:06:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70985F80155
 for <alsa-devel@alsa-project.org>; Wed,  2 Nov 2022 15:05:43 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 00843A003F;
 Wed,  2 Nov 2022 15:05:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 00843A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1667397943; bh=VUl0RXQyalJYDZDvUWd3ekU4t7uDakyPlOZaQS/GAzw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JLqZCsGeiipGaHAf05J6vEK5W8uGM7/HOB2OowNKy2dm0UYq+UlLFaoJjPvm2gB81
 F8V+6g1zcJRCek4KWbdb9NR8fi+p3mplsyju74nd6iHlhGFAO9GlyPKXrcMUZf2VDT
 3M9Q3mOOb+nlH2/CpYS9e+iemqGLZ2y6JBTRH6MI=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed,  2 Nov 2022 15:05:40 +0100 (CET)
Message-ID: <3de26c91-9645-7e0a-a18d-8dfa10eecbbb@perex.cz>
Date: Wed, 2 Nov 2022 15:05:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] ALSA: usb-audio: Fix regression with Dell Dock jack
 detection
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20221102113404.11291-1-tiwai@suse.de>
 <9b0c4f2d-1856-a80d-ad9d-9b34436fdc1c@perex.cz> <877d0dtvm2.wl-tiwai@suse.de>
 <8735b1tvbs.wl-tiwai@suse.de> <8166d07d-804b-f81e-7b2b-c848da851527@perex.cz>
 <87r0ylsexn.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <87r0ylsexn.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 02. 11. 22 13:45, Takashi Iwai wrote:

> BTW, while looking at this bug, I noticed another bug in alsa-lib
> src/ucm/main.c.  The check in snd_use_case_parse_ctl_elem_id() should
> be rather to the value, not the identifier:
> 
> --- a/src/ucm/main.c
> +++ b/src/ucm/main.c
> @@ -2793,7 +2793,7 @@ int snd_use_case_parse_ctl_elem_id(snd_ctl_elem_id_t *dst,
>   	    strcmp(ucm_id, "CaptureSwitch"))
>   		return -EINVAL;
>   	snd_ctl_elem_id_clear(dst);
> -	if (strcasestr(ucm_id, "name="))
> +	if (strcasestr(value, "name="))
>   		return __snd_ctl_ascii_elem_id_parse(dst, value, NULL);
>   	iface = SND_CTL_ELEM_IFACE_MIXER;
>   	if (jack_control)

Oops. Thanks, it looks like an obvious thinko. Fixed right now.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
