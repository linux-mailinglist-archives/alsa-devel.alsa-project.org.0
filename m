Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A33EB399105
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Jun 2021 18:59:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B5191709;
	Wed,  2 Jun 2021 18:59:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B5191709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622653199;
	bh=jrTfj4sC+GPM8Ryk5hwn0dFPMHBL1Cdfvz7t6I7XSH8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JbRKJcIXce0nB139AN4RUeXj4q5htVo4ZZl+K7urEdV88/F3UT/dDuqIIoqphxmXP
	 V1szzHFf4nzArqdcVwp4XjIAFKVDrOJBOOM27tW7k7955tfS8mshgynrkjGrJlZIbz
	 T5CbJBdeN6PHQkfc/kAO+IPDIYTz8KpzPDfMqMg0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87A52F80425;
	Wed,  2 Jun 2021 18:58:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6BF9F80424; Wed,  2 Jun 2021 18:58:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DC58F80103
 for <alsa-devel@alsa-project.org>; Wed,  2 Jun 2021 18:58:16 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id A8577A0042;
 Wed,  2 Jun 2021 18:58:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz A8577A0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1622653095; bh=sT4RPi+meQb9+r/aEG+lNDSsof33NXU66YQc/AJrJuc=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
 b=EDxP/DFGEm8Ectgw2QDYhfIdSOOTmXVLGT3qWdbYXVIG7Xkc7jhLQwKPGAWO/zQ3k
 zoWdiu+zvtIZ4/pDzh2+60fleVHOsfySK3ebUv+5TnqdTXUhVniCe1fSXTU4H6ZO/I
 hgm3G4KtQ3ruYhj08hu4yVN0A3NQGfkH/VI/crVg=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed,  2 Jun 2021 18:58:11 +0200 (CEST)
Subject: Re: [PATCH] ALSA: timer: Fix master timer notification
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20210602113823.23777-1-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <179e8e18-006d-f32b-ace9-3dd60ab7332b@perex.cz>
Date: Wed, 2 Jun 2021 18:58:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210602113823.23777-1-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: stable@vger.kernel.org
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

On 02. 06. 21 13:38, Takashi Iwai wrote:
> snd_timer_notify1() calls the notification to each slave for a master
> event, but it passes a wrong event number.  It should be +10 offset,
> corresponding to SNDRV_TIMER_EVENT_MXXX, but it's incorrectly with
> +100 offset.  Casually this was spotted by UBSAN check via syzkaller.
> 
> Reported-by: syzbot+d102fa5b35335a7e544e@syzkaller.appspotmail.com
> Cc: <stable@vger.kernel.org>
> Link: https://lore.kernel.org/r/000000000000e5560e05c3bd1d63@google.com
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

> ---
>  sound/core/timer.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/core/timer.c b/sound/core/timer.c
> index 6898b1ac0d7f..92b7008fcdb8 100644
> --- a/sound/core/timer.c
> +++ b/sound/core/timer.c
> @@ -520,9 +520,10 @@ static void snd_timer_notify1(struct snd_timer_instance *ti, int event)
>  		return;
>  	if (timer->hw.flags & SNDRV_TIMER_HW_SLAVE)
>  		return;
> +	event += 10; /* convert to SNDRV_TIMER_EVENT_MXXX */
>  	list_for_each_entry(ts, &ti->slave_active_head, active_list)
>  		if (ts->ccallback)
> -			ts->ccallback(ts, event + 100, &tstamp, resolution);
> +			ts->ccallback(ts, event, &tstamp, resolution);
>  }
>  
>  /* start/continue a master timer */
> 


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
