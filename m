Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E10A638CEDC
	for <lists+alsa-devel@lfdr.de>; Fri, 21 May 2021 22:19:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15A9F16C6;
	Fri, 21 May 2021 22:18:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15A9F16C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621628375;
	bh=lhMpSXxA7fPCFl6g7e1aOrOLDPd6KFq4agHf5hdY5u8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fdy+eodhSKdjeZgiPlOh2kxBkrHLnMmk4vb8jJGYokqIL8NxbSh6k3sI3rJ2UuJyL
	 Wbl7hSAGDNQ/cEmtTuBS9WuY7SMnKk8cXasnTJ6MF2k+MdtvFv3ZzshQlW6B+j/xfs
	 k48FjiPduFl519XdLSbeM2rcv+48JzuyDKSDS89U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3380F80153;
	Fri, 21 May 2021 22:18:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EAA19F801DB; Fri, 21 May 2021 22:18:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_13,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C15C4F800E5
 for <alsa-devel@alsa-project.org>; Fri, 21 May 2021 22:17:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C15C4F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NtYDl6wk"
Received: by mail-qt1-x835.google.com with SMTP id c10so16212953qtx.10
 for <alsa-devel@alsa-project.org>; Fri, 21 May 2021 13:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lALXTrtuzBL6U47ezWjlHPry6M4Q3hJ0ZXqmWa/oTS8=;
 b=NtYDl6wkQWqCxxPTvR6Ar4CNJg4wGlszLkksjpntX1YPWp3rn0bLJKuunSTYFaF6ro
 Eu6mZ8ZkOSGy6WHXgzRyxtz7ZsUH8/9Ec2mWziPzsERq2VIuounde86uUG+7AvKKlqbi
 0j91jXUvR8QdA01AJflXw7kE+PkKkmvPZLOxqY9naGAsmweS6e7qZO9MwAa3YpHWy103
 T4APckTZAPE72lOE0BhcUww5jAxADZTpWlv5kI3O+B3JryPUu0gufCHgov6lypCOw4TI
 X3iReAISl0VNqwrr63Xuyn3YwJhs5NPVMxnwPS2y2VbD68DhEsFWw+3jJYJxpTCkWBJC
 BWXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lALXTrtuzBL6U47ezWjlHPry6M4Q3hJ0ZXqmWa/oTS8=;
 b=h9uZsafTaJxuzBlGJqTUEAU63vkjjRaesB8FwUePs3lN05+rkqX6VPM+OGQNZZSAY6
 Xk8OvAqEb+9JYEjNb0qDSS62jRuPdYHHcZNiqyhA+rswHImOm4dRi9NAfhVt36g+DyL7
 Jr07vwrn5GnSw/Mu8/dqUR9IzkC6dJG1Inz4M4ePNOXgheLnDqgqZ9/G4ATFg3x01IYt
 /iUeSOrO/TaEgffKLbbDTMalPZnZJp7QlPd5J29qhs9S1uxbogtOfa1Cn7TIgeFwMOxz
 bIEuJoCZsrRoE+jm6r/Y4Sc6+/Fq7iyJnGZXII/zNiODzXH1IwWxCtQY7IzwaRjLRXdn
 NOuw==
X-Gm-Message-State: AOAM533j5KDQqAfDFM3TSiQF57nJdjVEHnzNaDTixZp2kQuZaVoYCPxB
 aRUEFC8NmIZawp1+M0WthEA8NRG0rgG6QvpEeEM=
X-Google-Smtp-Source: ABdhPJztn+XA/IWmE58o0jYP3iRXwrbk85mgCL8IwMmabO9Yn6nW+ARk2JCwbKdkj02DwG0CpEc1/CDF261r6OxD+Jo=
X-Received: by 2002:ac8:4b42:: with SMTP id e2mr13251421qts.210.1621628274416; 
 Fri, 21 May 2021 13:17:54 -0700 (PDT)
MIME-Version: 1.0
References: <S90HTQ.U7YWJKIETGYG2@gmail.com>
In-Reply-To: <S90HTQ.U7YWJKIETGYG2@gmail.com>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Fri, 21 May 2021 17:12:18 -0300
Message-ID: <CAEsQvct-zfxAFCO_rGJTh+eeNyq1MELekxoYKh51EM-wYKWqEQ@mail.gmail.com>
Subject: Re: Motu M4 - where to report this issue?
To: Georges Basile Stavracas Neto <georges.stavracas@gmail.com>
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

On Fri, May 21, 2021 at 3:50 PM Georges Basile Stavracas Neto
<georges.stavracas@gmail.com> wrote:
>
> Greetings ALSA community,

Hey, Georges!

>
> I recently acquired a Motu M4 interface, and seems to be working
> well so far. Everyday usage is completely functional.
>
> However, I noticed an odd sound artifact that happens from time
> to time when using DAWs like Ardour and Waveform11. It's a windy,
> ghostly sound that happens whenever I open any DAWs (the simple
> act of opening them triggers this). Interestingly, audio apps that
> use PulseAudio do not suffer from this issue. It's hard to describe
> it, so I recorded a video reproducing this problem:
>
> https://youtu.be/bM8x-YuXLVI
>
> A few things I've discovered while trying to understand what's
> going on:
>
> * It only happens with apps that use JACK or ALSA APIs. Using
>   PulseAudio (through PipeWire) does not trigger it.

I assume you are using PipeWire for JACK support and using "pw-jack
ardour" for example to start Ardour.

Could you stop PipeWire with "systemctl --user stop pipewire.service
pipewire.socket pipewire-media-session.service pipewire-pulse.service
pipewire-pulse.socket" and try to reproduce your issue using the
aplay/arecord commands?

Does the dmesg show anything unusual? Perhaps you should enable the
kernel boot option "snd_usb_audio.dyndbg=+p"

>
> * Seems like this sound is not an artifact of the interface; it
>   appears that this odd sound is sent to the interface through
>   USB. (You can see this in the video.)
>
> * It's triggered per track; in the video, for example, the drums
>   and keyboard tracks are affected independetly.
>
> I was oriented in #alsa at Freenode that the output of 'alsa-info'
> might be helpful, so here it is:
>
> http://alsa-project.org/db/?f=62f686710cc6c9344a8986707bf3d09248c514d1
>
> (I'm running this on top of a 5.12.5 kernel, which should include
> this fix: https://bugzilla.kernel.org/show_bug.cgi?id=207023)
>
> I'd like to know where should I report this bug (kernel bugzilla?),
> and if there's any other information I can provide to help fixing
> it.

Bugzilla definitely is the way to go.

You may need to recompile your kernel with suggested patch changes
over and over again.

>
> With respect,
> Georges
>
>
