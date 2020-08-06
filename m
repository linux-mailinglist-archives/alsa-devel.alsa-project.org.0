Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 244A523DA59
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Aug 2020 14:33:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5B71829;
	Thu,  6 Aug 2020 14:33:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5B71829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596717236;
	bh=R5s3tNIZzh6LjR5ysFEOh+cq1RuBbskzq8/65K946E8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gCcn78EKOekJ2XUwueFCEEDzYXJ2S9wYiaTDOVOf1R8dyWS4QmfWDG1GBtlu8E1sD
	 4w2GGu0q3yglN16Vrs/FGDKW3xhLOodZekza72uwD0AQJvFucuQgETOzzqF7YrL4MZ
	 ran7xIP7lJ1i9+3tSu4zsQ3Vo390s2Dn6giNYVEs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD5ABF800B7;
	Thu,  6 Aug 2020 14:32:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B28D0F80159; Thu,  6 Aug 2020 14:32:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF57FF80086;
 Thu,  6 Aug 2020 14:32:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF57FF80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="LzclXlaY"
Received: by mail-ej1-x644.google.com with SMTP id qc22so35313716ejb.4;
 Thu, 06 Aug 2020 05:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=VQPX01nYHMMD3TnfVpa0LuD2yyEUiiANMfY1MyBmwis=;
 b=LzclXlaYgC8IJETlIqghcs+f9doM60ENZScuJLD+yFRIBvfbFX7DAPOYPBdEKJMMga
 WYaBg1WFFZbCzM01RwVp2n71qH9n3oHn/7hpq7KveOg8d96t2yH1AizjXxzDeQvnFpig
 og0d+efvUezf9+W5KKKaeFaPiUIdOOqMHEvKE4e9oeeJ4dOJ+W1+t34jzVr676tHqQ3f
 CjH0gwcpna8AejQ2ver4bOJULMuMG6VFa78GoR/OOSDVu/TdM5Fj2WxraVhKv7Mgb/9q
 ujwHJr3BhqisyBcAkpGsfvEwuqImkMwvU8rzNwGHr/FfhqV3CU6oOTRnEFnRWU87MDdr
 vIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=VQPX01nYHMMD3TnfVpa0LuD2yyEUiiANMfY1MyBmwis=;
 b=hj4Y/2HOS/Vy7O3O2LglZed9oKpa368Y0tdMYvFBxA0u0liE44vutrjvoh7gOmsSqz
 itWuHEAFozEE+jJj/dgGjf3D87z7Us1UfOBwOXRr3i4LOTFlGqwgdfVLVARO9J64FRgG
 YArVXiY+tFCaxtpfCUkMMXY22CsE+qadJJNUyRtJ1/wXS5Cav/TFn/axeWnffQXfKkhG
 5GrgOxrmE+IMJW+ghVWTe4ohJc50zxeUeY8np5xidRKNseuU0akn0VdBMUKn+JfEt4Ce
 2Oce8wUwjY1XWFwanSeMkEWhy63dWfYArHw6i9e1ywVD3untREGZ/yr0glFBrnXbCiS1
 9/DA==
X-Gm-Message-State: AOAM533dUj1CE4gVpQx1xb/EeldckZBkYVDVeRFgbaFGLFEE+XuXxEVv
 XNZ80Y8oJlvaWTCZcFN5EpDcT7dTX7f86t0lTi0=
X-Google-Smtp-Source: ABdhPJyC8Z2im/D8OB+EbxtVB23GfloFEN+niSeUPxn1DLLpWZ1JVIfIK9eSldJODD1oN3QAeuRfDzE6VF/FK6TvIRM=
X-Received: by 2002:a17:907:372:: with SMTP id
 rs18mr4019492ejb.146.1596717122682; 
 Thu, 06 Aug 2020 05:32:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAGnHSEkpYqyZJjG587FSVUzYX2zV1tm83zj+uGjF4e24o4iAMA@mail.gmail.com>
 <20200806020601.GA6286@laptop>
 <CAGnHSEnMhF-1y7rL=JsmcFdTNVaA5ygv5N4TS9dhpORyOm+H_A@mail.gmail.com>
 <20200806091458.GA360003@workstation>
In-Reply-To: <20200806091458.GA360003@workstation>
From: Tom Yan <tom.ty89@gmail.com>
Date: Thu, 6 Aug 2020 20:31:51 +0800
Message-ID: <CAGnHSEkV9cpWoQKP1mT7RyqyTvGrZu045k=3W45Jm=mBidqDnw@mail.gmail.com>
Subject: Re: Why doesn't mixer control (values) have some kind of locking
 mechanism? (mutex?)
To: Tom Yan <tom.ty89@gmail.com>, alsa-devel@alsa-project.org, 
 alsa-user@alsa-project.org, pulseaudio-discuss@lists.freedesktop.org, 
 pierre-louis.bossart@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
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

Yeah I suppose a "full" lock would do. (That was what I was trying to
point out. I don't really understand Pierre's message. I merely
suppose you need some facility in the kernel anyway so that you can
lock from userspace.) I hope that amixer the utility will at least
have the capability to reschedule/wait by then though (instead of just
"failing" like in your python demo).

As for the compare-and-swap part, it's just a plus. Not that
"double-looping" for *each* channel doesn't work. It just again seems
silly and primitive (and was once confusing to me).

On Thu, 6 Aug 2020 at 17:15, Takashi Sakamoto <o-takashi@sakamocchi.jp> wrote:
>
> Hi,
>
> On Thu, Aug 06, 2020 at 04:57:02PM +0800, Tom Yan wrote:
> > The problem/race I am trying to point out is, one process can
> > get()/read before another finishing its get()+put() pair (which is
> > required by volume setting/adjusting), so something like
> > get1()->get2()->put1()->put2() could easily happen (where each put()
> > relies on / is "configured" with volumes of their respective get()).
> > The lock will need to intentionally stall further get()/read as well.
>
> In my opinion, in the above case, it's possible to serialize each
> transaction which consists of get/put (read/write in userspace
> application) with lock/unlock mechanism.
>
> +-----------+-----------+
> | process A | process B |
> +-----------+-----------+
> |   lock    |           |
> |   get     |           |
> |           |lock(EPERM)| reschedule lock/get/set/unlock actions
> |   set     |           |
> |           |lock(EPERM)| reschedule lock/get/set/unlock actions
> |  unlock   |           |
> |           |   lock    |
> |           |   get     |
> |           |   set     |
> |           |  unlock   |
> +-----------+-----------+
>
> (Of course, the above is achieved when the series of operations is done
> by userspace applications. For simplicity, I don't mention about
> in-kernel initiators of the get/set actions. In this point, I don't
> address to the message Pierre posted.)
>
> > If we for some reason want to avoid using locks, put() needs to be
> > atomic by design (like, "embed" get() in itself and use arrays for
> > volume values, instead of requiring those to be implemented in the
> > userspace manually / with a loop). Unfortunately that isn't the case
> > in ALSA.
>
> I get your intension is something like compare-and-swap[1]. At present,
> ALSA control core has no functionality like it, but it's worth to
> investigate. The ioctl request should includes a pair of 'struct
> snd_ctl_elem_value' in its argument. In a design of ALSA control
> core, the pair should be processed in each driver since ALSA control
> core has no 'cache' of the content of 'struct snd_ctl_elem_value' except
> for user-defined control element set.
>
> Here, would I ask your opinion to the lock/get/set/unlock actions
> from userspace? It can really not be one of solution for the issue?
>
> [1] https://en.wikipedia.org/wiki/Compare-and-swap
>
>
> Regards
>
> Takashi Sakamoto
