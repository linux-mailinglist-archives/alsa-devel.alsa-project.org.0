Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F395FAAE8
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Nov 2019 08:26:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 057F91666;
	Wed, 13 Nov 2019 08:25:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 057F91666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573630005;
	bh=M6qv1ThrjyBOCuAC5ztIBpMDDF+L6u/5281lFU2jvA4=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u2Eta+szJh7GoPJwag5d8r/J0iF6sUvVuB9kL85iED3O/uIpOQkj4A1ZaL/YM46v+
	 rhQCFQ/gXmIi5+Se9MV7ng6one7WQJkGmMYdT9a4KlRIV/skQCE3f+nMIkeKnogYu3
	 Z6owkhdWz1uDBFafLfv1U/Gvo0VEj61TUjmyhPzM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6B0FF80275;
	Wed, 13 Nov 2019 08:25:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8D99F80506; Wed, 13 Nov 2019 08:24:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DDEE7F80275
 for <alsa-devel@alsa-project.org>; Wed, 13 Nov 2019 08:24:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDEE7F80275
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="ihgDbrP3"
Received: by mail-ot1-x342.google.com with SMTP id d5so783710otp.4
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 23:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Cw82Z7YfxL1T0WRyGKJbhospSN2a6L7ddj/UV4Mdvrc=;
 b=ihgDbrP3mYJhLcPkvw/MdUwnNTMWbySH/59Y34+0qjCU8soyEtPCMQ4Lq3mCRSvcmj
 3bnM96r95d9uww5hDh9YnfCPDCDHatMP2nhONdrBOsGEzUR1ZnuRDoolTFn0VIQaHPq4
 yRYp04+QIGl3drCiwficIAsRf9mFUK0J47fgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cw82Z7YfxL1T0WRyGKJbhospSN2a6L7ddj/UV4Mdvrc=;
 b=YanOFd8jNwh+lHvnwvjeqjDbz5NUK5E1usVnR+27GIbfr7UIgHqA3KbNdDHGmzwXOZ
 K02n6pqp9TGp705/WbIygcz+TllUwZlJjgIXrbfHtf4d3VJeOcROJ2wkZUGD5llbNXx6
 zonRfF/wt5JP7yq0oiub/65FLw8nyg3jPywpAnq/f84A3Zqh/1TU9bGUBZ0khiGxm5iO
 Lxwkj7PZOwIncxWD6QxEGvks5Y6TYiuobd0jDTBo8DmVZvljvTstK59NtiJMNH8XtPB9
 wsk5Ra8aRb2UWYcB2veeaTfsXqvWXDJO1I0HMjncOMr4BbogXA9wF3cHs95T86ieMtRt
 10Sw==
X-Gm-Message-State: APjAAAUKbrHI5oOsnUrQqsVYgTJHxBOlHmyHKpzuXvNbLqkxqa6kU+z7
 JyBtX6j9VjReLDqJx3j2QHeBKJw5Sh3n4Mt5Z7TtTw==
X-Google-Smtp-Source: APXvYqyUHqjUDE+NYm38Q78Rn0V8WJDBDDjcJJ+6/rfxexh23AV26y67eWOYyrAWkd6wWTKUgp+c1SqKjwcFrQYAcBE=
X-Received: by 2002:a05:6830:1e4c:: with SMTP id
 e12mr1479662otj.358.1573629893695; 
 Tue, 12 Nov 2019 23:24:53 -0800 (PST)
MIME-Version: 1.0
References: <20191112171715.128727-1-paulhsia@chromium.org>
 <s5h1rud7yel.wl-tiwai@suse.de>
In-Reply-To: <s5h1rud7yel.wl-tiwai@suse.de>
From: Chih-Yang Hsia <paulhsia@chromium.org>
Date: Wed, 13 Nov 2019 15:24:41 +0800
Message-ID: <CAJaf1TaZzsPdydcMZMemVSkjRvhYvx7ZxY2JEvExQ56B+MjQLQ@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>
Subject: Re: [alsa-devel] [PATCH 0/2] ALSA: pcm: Fix race condition in
	runtime access
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

On Wed, Nov 13, 2019 at 2:16 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Tue, 12 Nov 2019 18:17:13 +0100,
> paulhsia wrote:
> >
> > Since
> > - snd_pcm_detach_substream sets runtime to null without stream lock and
> > - snd_pcm_period_elapsed checks the nullity of the runtime outside of
> >   stream lock.
> >
> > This will trigger null memory access in snd_pcm_running() call in
> > snd_pcm_period_elapsed.
>
> Well, if a stream is detached, it means that the stream must have been
> already closed; i.e. it's already a clear bug in the driver that
> snd_pcm_period_elapsed() is called against such a stream.
>
> Or am I missing other possible case?
>
>
> thanks,
>
> Takashi
>

In multithreaded environment, it is possible to have to access both
`interrupt_handler` (from irq) and `substream close` (from
snd_pcm_release) at the same time.
Therefore, in driver implementation, if "substream close function" and
the "code section where snd_pcm_period_elapsed() in" do not hold the
same lock, then the following things can happen:

1. interrupt_handler -> goes into snd_pcm_period_elapsed with a valid
sustream pointer
2. snd_pcm_release_substream: call close without blocking
3. snd_pcm_release_substream: call snd_pcm_detache_substream and set
substream->runtime to NULL
4. interrupt_handler -> call snd_pcm_runtime() and crash while
accessing fields in `substream->runtime`

e.g. In intel8x0.c driver for ac97 device,
In driver intel8x0.c, `snd_pcm_period_elapsed` is called after
checking `ichdev->substream` in `snd_intel8x0_update`.
And if a `snd_pcm_release` call from alsa-lib and pass through close()
and run to snd_pcm_detach_substream() in another thread, it's possible
to trigger a crash.
I can reproduce the issue within a multithread VM easily.

My patches are trying to provide a basic protection for this situation
(and internal pcm lock between detach and elapsed), since
- the usage of `snd_pcm_period_elapsed` does not warn callers about
the possible race if the driver does not  force the order for `calling
snd_pcm_period_elapsed` and `close` by lock and
- lots of drivers already have this hidden issue and I can't fix them
one by one (You can check the "snd_pcm_period_elapsed usage" and the
"close implementation" within all the drivers). The most common
mistake is that
  - Checking if the substream is null and call into snd_pcm_period_elapsed
  - But `close` can happen anytime, pass without block and
snd_pcm_detach_substream will be trigger right after it

Best,
Paul

> >
> > paulhsia (2):
> >   ALSA: pcm: Fix stream lock usage in snd_pcm_period_elapsed()
> >   ALSA: pcm: Use stream lock in snd_pcm_detach_substream()
> >
> >  sound/core/pcm.c     | 8 +++++++-
> >  sound/core/pcm_lib.c | 8 ++++++--
> >  2 files changed, 13 insertions(+), 3 deletions(-)
> >
> > --
> > 2.24.0.rc1.363.gb1bccd3e3d-goog
> >
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
