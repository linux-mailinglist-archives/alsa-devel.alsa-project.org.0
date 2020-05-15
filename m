Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5091D4F49
	for <lists+alsa-devel@lfdr.de>; Fri, 15 May 2020 15:32:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D20361663;
	Fri, 15 May 2020 15:31:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D20361663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589549552;
	bh=xKSRvgkS7o8TiZ3PKuU3Q7gAdmGM1gzawdcUnNqG5Vw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TL+uTjoyrCaCiY76rOPd+pq0UEINYgliYYoVOKzxVAlacav8+cQkDncfTCYM7OIV9
	 vVnc+DjcvHI14Dc5cNerHHNgY7mHvP+vSLXX5lbC0RjWdZoTAoJa2z2c3qSEHTx+tl
	 9Y18zN/81p6/aGgBVbBfF87ODBd3Yt2Ywj23gIIU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E09E4F80253;
	Fri, 15 May 2020 15:30:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 436EDF80247; Fri, 15 May 2020 15:30:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24F1AF800B8
 for <alsa-devel@alsa-project.org>; Fri, 15 May 2020 15:30:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24F1AF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=precisionplanting.com
 header.i=@precisionplanting.com header.b="WefS8Yr2"
Received: by mail-lj1-x229.google.com with SMTP id w10so2274147ljo.0
 for <alsa-devel@alsa-project.org>; Fri, 15 May 2020 06:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=precisionplanting.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kl876/BdSn9RYxcTJT3LSQEtfYDYRnHoZtHgwfFJNqI=;
 b=WefS8Yr2Z2puEIwrjS69yuD8OYhAJEeTjOiC4QCEVTPGQTXfls9hK7njYaBi1c/M2i
 u95g2OP9vhE26Gbs/EnygIHWHengbgMSc9LMw4ODRWCDLJQS+T5F6yuWVgafRWUOAGv9
 MwvP6HEl+nal7Qe8OMEROpXNxv7hgyQtRCkD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kl876/BdSn9RYxcTJT3LSQEtfYDYRnHoZtHgwfFJNqI=;
 b=OCVSPOf7C4bP2B3cw8QjQhCpQd3l6gEEt4f9i1rcta0GxjVvbxnYuMZQo3zXyh7WJR
 enemoljU/1v7Vii2mSWfOvnO86P7sef3NF4ODuWjCqHQ2Tr8chHxS472XSh1mv0hoqGo
 QPekqiIbbQOnAkHISYTAKk/cGoPKOYfq1j52ucoY931+90myJ5ZS9o8QqExGM5fcRqjv
 lYL3/D98wXnAkoAlOlLZVOuaNcyaRGWf8JGkDxHMfIrvurzbow6XHTWOE6+eg6iL3sh9
 A1BflpY73G+fzREKhIj7sOadBs842FgobeCc9qlAGuS1UBkNgHptkfrK5hmTiWHBTBME
 0EFw==
X-Gm-Message-State: AOAM532EgXcRYyetEF2H+WcZnr22GDLRJy7hykd+Go42Kfm6/Gcw14s7
 cYLhoc5Ga8rYVxt1Wndgq5dn4mZbpy/5qGRXPWHFgQ==
X-Google-Smtp-Source: ABdhPJwGUZfw5nP6185CYbJgXkdO0SMZO6b4G8qv3V3k7xqT5vQVOynj59RMuXSsjdP6LrmzoZObb7EwMo3jazC1D7U=
X-Received: by 2002:a2e:b4d0:: with SMTP id r16mr2379718ljm.129.1589549436506; 
 Fri, 15 May 2020 06:30:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAOyfbRXsKi-7bvnRNhoR6Vu7ET1oM5CJ6tEKwcDchy48ExpFvQ@mail.gmail.com>
 <s5hsgg1odpw.wl-tiwai@suse.de>
In-Reply-To: <s5hsgg1odpw.wl-tiwai@suse.de>
From: Dexter Travis <dexter.travis@precisionplanting.com>
Date: Fri, 15 May 2020 08:30:25 -0500
Message-ID: <CAOyfbRVwrjFHzDhim1dXgOHgGQkWJ5Czn4ANWe+L4JWwqnrq8g@mail.gmail.com>
Subject: Re: core: snd_card_disconnect/snd_card_free: hang when card
 unregistered
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
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

Takashi,

Thank you.  That is helpful.  In my case we are embedded deeply enough
that there is only one application playing sounds so it may be
possible to improve our user space side to properly close down the
sound.

When power comes back I do not need to resume playing the previous
sound.  From the kernel side is it possible to force the sound to
abort or stop?

How do more easily removed sound devices handle this?  For example a
USB or other hot-pluggable sound device?



Regards,


Dexter

On Fri, May 15, 2020 at 2:32 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Thu, 14 May 2020 23:04:09 +0200,
> Dexter Travis wrote:
> >
> > In my system during certain power events the power rail for the
> > TLV320AIC3120 goes away and may come back.
> >
> > To accommodate this I have added a call to snd_soc_unregister_card as
> > soon as I notice via GPIO that this power has been removed.  I then
> > call snd_soc_register_card to re-install the sound card after power is
> > restored.
> >
> > If no sound is playing when the asynchronous power removal occurs this
> > works fine.
> >
> > If a sound is playing one of two things will occur.  In the first case
> > the sound driver comes back and sound is restored when power is
> > restored. In the second case my deferred work function which calls the
> > snd_soc_unregister_card function gets hung and does not return.
> >
> > I have traced the difference to the wait_for_completion call in
> > snd_card_free.  if snd_card_disconnect adds files to shutdown_files
> > list then wait_for_completion will hang forever.
> >
> > Any suggestions on how to further debug this?
> >
> > How to force the immediate unregister of the card even if a sound is playing?
>
> You can unregister the devices, i.e. they disappear from the
> user-space.  However, the old stream and the belonging objects are
> still alive, hence you can't release the resources entirely until the
> user-space closes and drops the remaining one.  The completion is
> waiting for the release of those remaining handles.  So, if you try to
> register again the same objects, it'll conflict.
>
> IOW, it'll be really messy if you try to disconnect and release the
> whole resources temporarily and restore again.  I guess the current
> best would be to limit a part of components somehow during the
> temporary absence.
>
> The temporary stop of a stream isn't well handled in the core API,
> admittedly, it's a known problem.  We're considering to introduce a
> new state, but it's still under evaluation.
>
>
> thanks,
>
> Takashi
