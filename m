Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 03487ADF7A
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2019 21:33:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 748711667;
	Mon,  9 Sep 2019 21:33:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 748711667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568057633;
	bh=tUqBtNCk3oASMJoCHi+OMpgIxzO4Jm3j9uIHzF8qd8U=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GK/4Zu2qzUP+uKDPceIGZNwviMJmgFS/mwBJZ7fCnIhaw6wVKRZjQJidzQibE4gu6
	 l/lHgSvmLUkTXM1zaj05gxieLE9UFWqo0/NjxomXI/CqMMpvExKHF4cGP/w9TlbxDZ
	 wOehunBzUIqKVtllrLAmvVbU++8dAjADyLBkaoqQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AC6F1F804FD;
	Mon,  9 Sep 2019 21:32:08 +0200 (CEST)
X-Original-To: Alsa-devel@alsa-project.org
Delivered-To: Alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB8B7F80323; Mon,  9 Sep 2019 21:32:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B52C7F800C9
 for <Alsa-devel@alsa-project.org>; Mon,  9 Sep 2019 21:32:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B52C7F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NQszwosl"
Received: by mail-qt1-x82a.google.com with SMTP id o12so17662568qtf.3
 for <Alsa-devel@alsa-project.org>; Mon, 09 Sep 2019 12:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t2/pE2i4uOwnZh5IhmVSW3kxohLajH8iRBwP/GsU7NE=;
 b=NQszwoslAiMiB8mkefayU8GnR0qVBseNC1wZ7ogbQwXV7+1GCMfAm9pmHd8Hi7V+Jt
 FzUUzUfL3W+0V7k835gP2REUyKJZeoLXniDZwleLLTIVhFGfCdnIXjfFdRpJRjSkkZRl
 lj8T5NuqhsY+xgLOGUbDBwDlWHYaSekYyR7vGR3ecvX3PmO8VQWBhO6mlmothily4fhn
 BakaqLb26ucbUr4klBgt30ftW6XtlBofyby7gIBe9+I0sznjtfSGI61s3ivhnrr+nLiL
 xvI2yO0+noLlxxl9agYWLP9xFiq7pmJmif9BjdReYHcfEtnlMwQH6G/cm0QSt9enme+7
 9aVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t2/pE2i4uOwnZh5IhmVSW3kxohLajH8iRBwP/GsU7NE=;
 b=oBCxcUUbY/TtaUDnkjp0gBTY5+LZ/CYk/aTu6lP5gCJ7ddW4blf4k4yk0ueQzTpZfn
 N/jj9QRtyNPTfzHpn03Q+wLeTtLaRSjotgz8O89shj3/6cJthIhsnvqNbV9RjfXLhx3k
 FklppIxcUUit5IoLOBSVOI/tICKoD/R8TLL/lJGBXOAwknjbCPCEuXFH++rOqZF3525G
 dG8afgN7qpIbdXMRLh/yu59Y+n3RyKhPQNgQsQD2cFkmn+3EToAHjkF0UZs6ikFSmPjY
 hNfZ4kFbLeeWxdKmqjLjPgsWL6gm+FDvXzvBk/mwJ4rtDYLCjOUqRI1UogHeJZq4W3CR
 pZNw==
X-Gm-Message-State: APjAAAUZSDrcOlFZQl5gXLXWLGw9jvz6FJ+R6YBF1Kzxpa5CdyWxVUEm
 d1lUETiSFOy9tk9LUkFqwDWc5p6dspUEuR2qJDm5dqNg
X-Google-Smtp-Source: APXvYqx1colFegNpGWLMijL6hvMMGLpQbT/n/9Sn0KP+ogszmy3MT617fYv5Z90QoY0w0IxTxTedw2y9xcJpr/tRn9w=
X-Received: by 2002:ac8:2dd8:: with SMTP id q24mr1179668qta.118.1568057520973; 
 Mon, 09 Sep 2019 12:32:00 -0700 (PDT)
MIME-Version: 1.0
References: <CA+SWvNx9hGJN0v9erykioJUKyd726VzfP4b77u0RUHh_mgFooQ@mail.gmail.com>
 <CA+SWvNyUAyBQd9ktaZpvV8R7XcK8opA1_VQeMEnPfmr6jcSANQ@mail.gmail.com>
 <s5hzhjd9xg4.wl-tiwai@suse.de>
In-Reply-To: <s5hzhjd9xg4.wl-tiwai@suse.de>
From: Pavel Hofman <pavhofman@gmail.com>
Date: Mon, 9 Sep 2019 21:31:49 +0200
Message-ID: <CA+SWvNw_=Fj_3M3sqVP767OOR+YDY=6-rPtPgmGXg+BcvuG3oA@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] Measuring Device Throughput - MMAP vs. RW
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, Sep 9, 2019 at 7:44 PM Takashi Iwai <tiwai@suse.de> wrote:

> > The mmap fluctuations seem to be fixed by using increases in hardware
> > pointer pcm->hw.ptr values instead of frames variable. Please do these
> > values wrap up or do they grow  to max long? Still contiguous after 10
> > minutes of running.
>
> Could you elaborate the requirement?  The description isn't clear to
> me.
>

I need to slave EP OUT of asynchronous USB-audio gadget  (i.e. device) to
another (output) soundcard in the system so that adaptive resampling in the
chain "USB gadget -> processing -> output soundcard" is avoided.  For that
I need to measure average throughput to/from alsa hw:X devices, to gather
data for the feedback endpoint implemented by the gadget driver.  I do not
have any control over configuration of the devices, the feedback must run
independently of the rest of the chain, of the applications used.

In snd_pcm_hw_mmap_commit I subtract the advancement of pcm->hw.ptr from
value approx. 10 seconds ago, divided by passed nanosecs measured by
clock_gettime(CLOCK_MONOTONIC). For that I need the pcm->hw.ptr either to
be monotonic, or I just reset the averaging if a non-monotony is detected
(hw pointer in previous (n-1) call of snd_pcm_hw_mmap_commit was higher
than  current value).

For better precision, would it make sense to update the pcm->hw.ptr with
snd_pcm_avail call in that method? It may not be even possible in that
method due to some locking, I really do not know. But my precision
requirements are not very strict since I can average over long time
(minutes) for the feedback (the clock difference is usually very small).


>
> You should be able to skip XRUN check by changing the stop_threshold.
> Setting it to the boundary size essentially means skipping XRUN
> checks.
>

Actually if  xruns could be detected by discontinuity of the hw pointer, I
would not need any other method.


> In anyway, I put Pierre to Cc, as he's done some works in the past for
> the accurate position reporting on HD-audio and USB-audio devices.
> He can give a better hint in this regard.


Thanks a lot, I very much appreciate your help. I do not know these
low-level alsa details. But I will gladly learn.

Pavel.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
