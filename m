Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6268260EEE3
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 06:05:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09F231F53;
	Thu, 27 Oct 2022 06:04:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09F231F53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666843530;
	bh=Kk7jGmpYh7BuEQG+CjHJqGjl/1akiO61v00WaoUY8Fk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o0rQIsnquU5+dlB2Kdt3pVslgQm82SKM7cfy7JVApW8fihRFquBFM9JsHeRA4qJEH
	 NCR5GHGwaodFTwrvzMoweUwVDvwQwAnrNdvoXzJxOLycT50WNX/qlZ0LO4V2fe9ceA
	 2A3mDo47TnYGvt543VOOU/mppzjXIdyUGlqLgiGU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9343BF80496;
	Thu, 27 Oct 2022 06:04:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E38EF8025E; Thu, 27 Oct 2022 06:04:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
 HEADER_FROM_DIFFERENT_DOMAINS, NICE_REPLY_A, PRX_BODY_30, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS,
 URIBL_ZEN_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C7EBF80100
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 06:04:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C7EBF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="djdp3vBO"
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-12c8312131fso466811fac.4
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 21:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=O4zxOHr5pL/tZbv/Lney9NNoy+V8TXoApZzVW+UpE9c=;
 b=djdp3vBObrtKXk5iR2I5mQ+gUxa3qFdrLVOfoGTRZRKq0CjbUBqUL47z3HYzO5ZEvS
 xUP1b7enKhRqRrp9dPgJSFx0sBgq1QzRSBLZ/PvFJrNtaaWNkd4MxBHUHpf/FBxYBHEn
 tvO6HWb7/j3VZ2LClPg+V9COXkNFTcAi0L3LHy96UTepRVVwmc+NpZuuEIRdbqNbPdTF
 rSgGpzGBj0vrOz9t85G5yvbSfrPMejBFPNCX3i34fArLuTe8xDissBOe4KZm/0he5yB4
 y44Dvn/DvwnXa5zEKJgnNjqMf+50N4Zj+pQIVq3klkWlzE+pO/ZyNQO2hXSeVoww78s4
 FjMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O4zxOHr5pL/tZbv/Lney9NNoy+V8TXoApZzVW+UpE9c=;
 b=COB2XmhFf2q5Kz/GvjPYEdEPxUr0KLr+kvcFGh/7pJKHTdGyrvs3eCVWmiXSDmocQt
 jhuZe3X1QoFVkp5DSkL9n8vAP/Ap6A6KBCx0DnQCH4ah29Cjpok9/aGi0cPFXRDVvQK2
 KTI9WDPnGcprf5KRZJjsMza8Ob85VE0GHq2y8K+Pck/W/o4wcKq6qOa4z0Ma4RGIjZQb
 +Fi2cdcNH+gbq3QjBBk9f3+qwZzqpA6achGteZmWymiTiSXvWjPgDMZCM7h24ShNLTpy
 wK5IAF52U2xLCwi3F0/As8gd4V4wnaV8idzg0/Upf45ysS+YHRBVkXK7ZMhWAKEqPdZK
 GJZw==
X-Gm-Message-State: ACrzQf2bA1mtvjo41jWlmDuA2NHAiLoF6bDOia3vt9u91a8eCemd5Y2K
 +RXULlRp4w2iZ/YASiknmu8=
X-Google-Smtp-Source: AMsMyM7jk2gdeNDOiu2o8p6WCnnUCNOLAYix7ph4jJIVEGB/+VOj7vRGrGyD1yt/IGRHpLJ+hzO0FA==
X-Received: by 2002:a05:6870:2052:b0:132:7b2:2fe6 with SMTP id
 l18-20020a056870205200b0013207b22fe6mr4473033oad.98.1666843464841; 
 Wed, 26 Oct 2022 21:04:24 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 r5-20020aca5d05000000b0035956747d07sm44594oib.17.2022.10.26.21.04.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Oct 2022 21:04:24 -0700 (PDT)
Message-ID: <9330bab0-1fbf-95a7-8d97-af522762f470@roeck-us.net>
Date: Wed, 26 Oct 2022 21:04:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] ALSA: Use del_timer_sync() before freeing timer
To: Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>
References: <20221026231236.6834b551@gandalf.local.home>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20221026231236.6834b551@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Stephen Boyd <sboyd@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Thomas Gleixner <tglx@linutronix.de>,
 Linus Torvalds <torvalds@linux-foundation.org>
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

On 10/26/22 20:12, Steven Rostedt wrote:
> From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
> 
> The current code for freeing the emux timer is extremely dangerous:
> 
>    CPU0				CPU1
>    ----				----
> snd_emux_timer_callback()
> 			    snd_emux_free()
> 			      spin_lock(&emu->voice_lock)
> 			      del_timer(&emu->tlist); <-- returns immediately
> 			      spin_unlock(&emu->voice_lock);
> 			      [..]
> 			      kfree(emu);
> 
>    spin_lock(&emu->voice_lock);
> 
>   [BOOM!]
> 
> Instead just use del_timer_sync() which will wait for the timer to finish
> before continuing. No need to check if the timer is active or not when
> doing so.
> 
> This doesn't fix the race of a possible re-arming of the timer, but at
> least it won't use the data that has just been freed.
> 
> Cc: stable@vger.kernel.org
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   sound/synth/emux/emux.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/sound/synth/emux/emux.c b/sound/synth/emux/emux.c
> index 5ed8e36d2e04..a2ee78809cfb 100644
> --- a/sound/synth/emux/emux.c
> +++ b/sound/synth/emux/emux.c
> @@ -131,10 +131,7 @@ int snd_emux_free(struct snd_emux *emu)
>   	if (! emu)
>   		return -EINVAL;
>   
> -	spin_lock_irqsave(&emu->voice_lock, flags);
> -	if (emu->timer_active)
> -		del_timer(&emu->tlist);
> -	spin_unlock_irqrestore(&emu->voice_lock, flags);
> +	del_timer_sync(&emu->tlist);
>   
>   	snd_emux_proc_free(emu);
>   	snd_emux_delete_virmidi(emu);

