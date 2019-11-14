Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3593BFCADE
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Nov 2019 17:39:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9948D165F;
	Thu, 14 Nov 2019 17:39:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9948D165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573749597;
	bh=j8+2soiEen3XLbiF5o3em6IT3V4q96AlZUXOMSKC2JI=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nouly/SXoi4LDoZkWPxC5k/OdebwxXcrN0apT4EapGs4ryOiPxeQ43yIjywfmUujD
	 sKic7topg2YE2bz1qY5OBaz/vkDM/+w+Xt+9skMIsGHFRSHrhUw74ZeLcsSiLTCmp7
	 7otVO94YvE96DYvl1GRfyz3q237e7+3AU8ECd/Zc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C43FAF800EC;
	Thu, 14 Nov 2019 17:38:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11081F800CF; Thu, 14 Nov 2019 17:38:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E679EF80084
 for <alsa-devel@alsa-project.org>; Thu, 14 Nov 2019 17:38:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E679EF80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="XFnbzIou"
Received: by mail-ot1-x342.google.com with SMTP id b16so5374566otk.9
 for <alsa-devel@alsa-project.org>; Thu, 14 Nov 2019 08:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q17Vz56Lz1GgFf83icIor/sOTwRzLf9Uxkx/4Lh/cUc=;
 b=XFnbzIouRqLtmtOdJkt7axfOtgjFS/FUBeybD84+3+dN4XnZsOfe1Apq7pMjjRvlr4
 dWIot2mOXaKWRgtDJkRBKkxo47N4s8f1xIn7wjwM3YzKfFxErQTQ84ZUFizQ+UTOcorv
 pviWuwhEqviJXtaL/NLJ841S71svrBIuvBPjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q17Vz56Lz1GgFf83icIor/sOTwRzLf9Uxkx/4Lh/cUc=;
 b=s5GxHbv5QvxZsEFsBjNZg0KHZWgxgN2RSqBmGRpNERcXhWFb0jEhaHLkK9fCAqSLen
 YLN1ryp9CI3nQVQmV84uxtR36tR3Xc6S+eGLApiAyIcwnWGJiGXfULiGp9GtKTtr6dDD
 zJ7goyCpl0x+dShSV9rRJMWMXxkMKrOSZw4pE7FEqrmvvw6gpshWU+bRhdZnXITtk4ME
 D9FfTed2lffNH7cu5p2mgDKTlw1r0bNHvEX8JzuFT/mD2gyT06c2R+L7MiS5KwYMwZBD
 Y1+Go+SyipPoLfVrFLD3aJIqgwTXxfCQzpxl/exf1Ppf8SCEBsl0R3b0f2WEkdFuuvhZ
 lcWQ==
X-Gm-Message-State: APjAAAWtGyIok7dc+rYwD3mBsX58RVFOIR7cPlXdIyGCVYwbO09ovzVl
 1plS5yczmUDyEZ5A9Mca1yJDZKuEJjJU7jvX8nFtMzzx6Zc=
X-Google-Smtp-Source: APXvYqywkMkprEVoIjGj5F9y8DQyvWnI9dSsfgC23H64OGrqUbunisT3dqytVUWEwR1zVWCOt1K26ZHWOf7q5NSc52g=
X-Received: by 2002:a9d:154:: with SMTP id 78mr7708111otu.294.1573749485907;
 Thu, 14 Nov 2019 08:38:05 -0800 (PST)
MIME-Version: 1.0
References: <20191112171715.128727-1-paulhsia@chromium.org>
 <s5h1rud7yel.wl-tiwai@suse.de>
 <CAJaf1TaZzsPdydcMZMemVSkjRvhYvx7ZxY2JEvExQ56B+MjQLQ@mail.gmail.com>
 <s5h7e446raw.wl-tiwai@suse.de> <s5hftisnh3s.wl-tiwai@suse.de>
 <CAJaf1TYwbsuNZ_RmRfo7ZcVPJ04e4Dh3G1e3kVYPQh_sX9TgWQ@mail.gmail.com>
 <s5h36eqmtf3.wl-tiwai@suse.de>
In-Reply-To: <s5h36eqmtf3.wl-tiwai@suse.de>
From: Chih-Yang Hsia <paulhsia@chromium.org>
Date: Fri, 15 Nov 2019 00:37:54 +0800
Message-ID: <CAJaf1TbOqOeRqN6jfAeHVu6drTZ9wBUHf5J9uy4-Ng1Pkr5nww@mail.gmail.com>
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

On Thu, Nov 14, 2019 at 10:20 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Thu, 14 Nov 2019 15:16:04 +0100,
> Chih-Yang Hsia wrote:
> >
> > On Wed, Nov 13, 2019 at 7:36 PM Takashi Iwai <tiwai@suse.de> wrote:
> > >
> > > On Wed, 13 Nov 2019 10:47:51 +0100,
> > > Takashi Iwai wrote:
> > > >
> > > > On Wed, 13 Nov 2019 08:24:41 +0100,
> > > > Chih-Yang Hsia wrote:
> > > > >
> > > > > On Wed, Nov 13, 2019 at 2:16 AM Takashi Iwai <tiwai@suse.de> wrote:
> > > > > >
> > > > > > On Tue, 12 Nov 2019 18:17:13 +0100,
> > > > > > paulhsia wrote:
> > > > > > >
> > > > > > > Since
> > > > > > > - snd_pcm_detach_substream sets runtime to null without stream lock and
> > > > > > > - snd_pcm_period_elapsed checks the nullity of the runtime outside of
> > > > > > >   stream lock.
> > > > > > >
> > > > > > > This will trigger null memory access in snd_pcm_running() call in
> > > > > > > snd_pcm_period_elapsed.
> > > > > >
> > > > > > Well, if a stream is detached, it means that the stream must have been
> > > > > > already closed; i.e. it's already a clear bug in the driver that
> > > > > > snd_pcm_period_elapsed() is called against such a stream.
> > > > > >
> > > > > > Or am I missing other possible case?
> > > > > >
> > > > > >
> > > > > > thanks,
> > > > > >
> > > > > > Takashi
> > > > > >
> > > > >
> > > > > In multithreaded environment, it is possible to have to access both
> > > > > `interrupt_handler` (from irq) and `substream close` (from
> > > > > snd_pcm_release) at the same time.
> > > > > Therefore, in driver implementation, if "substream close function" and
> > > > > the "code section where snd_pcm_period_elapsed() in" do not hold the
> > > > > same lock, then the following things can happen:
> > > > >
> > > > > 1. interrupt_handler -> goes into snd_pcm_period_elapsed with a valid
> > > > > sustream pointer
> > > > > 2. snd_pcm_release_substream: call close without blocking
> > > > > 3. snd_pcm_release_substream: call snd_pcm_detache_substream and set
> > > > > substream->runtime to NULL
> > > > > 4. interrupt_handler -> call snd_pcm_runtime() and crash while
> > > > > accessing fields in `substream->runtime`
> > > > >
> > > > > e.g. In intel8x0.c driver for ac97 device,
> > > > > In driver intel8x0.c, `snd_pcm_period_elapsed` is called after
> > > > > checking `ichdev->substream` in `snd_intel8x0_update`.
> > > > > And if a `snd_pcm_release` call from alsa-lib and pass through close()
> > > > > and run to snd_pcm_detach_substream() in another thread, it's possible
> > > > > to trigger a crash.
> > > > > I can reproduce the issue within a multithread VM easily.
> > > > >
> > > > > My patches are trying to provide a basic protection for this situation
> > > > > (and internal pcm lock between detach and elapsed), since
> > > > > - the usage of `snd_pcm_period_elapsed` does not warn callers about
> > > > > the possible race if the driver does not  force the order for `calling
> > > > > snd_pcm_period_elapsed` and `close` by lock and
> > > > > - lots of drivers already have this hidden issue and I can't fix them
> > > > > one by one (You can check the "snd_pcm_period_elapsed usage" and the
> > > > > "close implementation" within all the drivers). The most common
> > > > > mistake is that
> > > > >   - Checking if the substream is null and call into snd_pcm_period_elapsed
> > > > >   - But `close` can happen anytime, pass without block and
> > > > > snd_pcm_detach_substream will be trigger right after it
> > > >
> > > > Thanks, point taken.  While this argument is valid and it's good to
> > > > harden the PCM core side, the concurrent calls are basically a bug,
> > > > and we'd need another fix in anyway.  Also, the patch 2 makes little
> > > > sense; there can't be multiple close calls racing with each other.  So
> > > > I'll go for taking your fix but only the first patch.
> > > >
> > > > Back to this race: the surfaced issue is, as you pointed out, the race
> > > > between snd_pcm_period_elapsed() vs close call.  However, the
> > > > fundamental problem is the pending action after the PCM trigger-stop
> > > > call.  Since the PCM trigger doesn't block nor wait until the hardware
> > > > actually stops the things, the driver may go to the other step even
> > > > after this "supposed-to-be-stopped" point.  In your case, it goes up
> > > > to close, and crashes.  If we had a sync-stop operation, the interrupt
> > > > handler should have finished before moving to the close stage, hence
> > > > such a race could be avoided.
> > > >
> > > > It's been a long known problem, and some drivers have the own
> > > > implementation for stop-sync.  I think it's time to investigate and
> > > > start implementing the fundamental solution.
> > >
> > > BTW, what we need essentially for intel8x0 is to just call
> > > synchronize_irq() before closing, at best in hw_free procedure:
> > >
> > > --- a/sound/pci/intel8x0.c
> > > +++ b/sound/pci/intel8x0.c
> > > @@ -923,8 +923,10 @@ static int snd_intel8x0_hw_params(struct snd_pcm_substream *substream,
> > >
> > >  static int snd_intel8x0_hw_free(struct snd_pcm_substream *substream)
> > >  {
> > > +       struct intel8x0 *chip = snd_pcm_substream_chip(substream);
> > >         struct ichdev *ichdev = get_ichdev(substream);
> > >
> > > +       synchronize_irq(chip->irq);
> > >         if (ichdev->pcm_open_flag) {
> > >                 snd_ac97_pcm_close(ichdev->pcm);
> > >                 ichdev->pcm_open_flag = 0;
> > >
> > >
> > > The same would be needed also at the beginning of the prepare, as the
> > > application may restart the stream without release.
> > >
> > > My idea is to add sync_stop PCM ops and call it from PCM core at
> > > snd_pcm_prepare() and snd_pcm_hw_free().
> > >
> > Will adding synchronize_irq() in snd_pcm_hw_free there fix the race issue?
> > Is it possible to have sequence like the following steps ?
> > - [Thread 1] snd_pcm_hw_free: just pass synchronize_irq()
> > - [Thread 2] another interrupt come -> snd_intel8x0_update() -> goes
> > into the lock region of snd_pcm_period_elapsed() and passes the
> > PCM_RUNTIME_CHECK (right before snd_pcm_running())
>
> This shouldn't happen because at the point snd_pcm_hw_free() the
> stream has been already in the SETUP state, i.e. with trigger PCM
> callback, the hardware has been programmed not to generate the PCM
> stream IRQ.
>
Thanks for pointing that out.
snd_pcm_drop() will be called right before accessing `opts->hw_free`
and device dma will be stopped by SNDRV_PCM_TRIGGER_STOP.
And snd_pcm_prepare() will be called when the device is not running.
So synchronize_irq() should be enough for both of them.

I have a patch like this now in intel8x0:

diff --git a/sound/pci/intel8x0.c b/sound/pci/intel8x0.c
index 6ff94d8ad86e..728588937673 100644
--- a/sound/pci/intel8x0.c
+++ b/sound/pci/intel8x0.c
@@ -923,8 +923,10 @@ static int snd_intel8x0_hw_params(struct
snd_pcm_substream *substream,

 static int snd_intel8x0_hw_free(struct snd_pcm_substream *substream)
 {
+       struct intel8x0 *chip = snd_pcm_substream_chip(substream);
        struct ichdev *ichdev = get_ichdev(substream);

+       synchronize_irq(chip->irq);
        if (ichdev->pcm_open_flag) {
                snd_ac97_pcm_close(ichdev->pcm);
                ichdev->pcm_open_flag = 0;
@@ -993,6 +995,7 @@ static int snd_intel8x0_pcm_prepare(struct
snd_pcm_substream *substream)
        struct snd_pcm_runtime *runtime = substream->runtime;
        struct ichdev *ichdev = get_ichdev(substream);

+       synchronize_irq(chip->irq);
        ichdev->physbuf = runtime->dma_addr;
        ichdev->size = snd_pcm_lib_buffer_bytes(substream);
        ichdev->fragsize = snd_pcm_lib_period_bytes(substream);

If that looks good to you, I can upload the patch to pw as well.
Then we can upstream the intel8x0 patch and the first change I made in
this series (the elapse one).
Does that sound good to you?

Thanks,
Paul

>
> Takashi
>
>
> > - [Thread 1] snd_pcm_hw_free finished() -> snd_pcm_detach_substream()
> > -> runtime=NULL
> > - [Thread 2] Execute snd_pcm_running and crash
> >
> > I can't trigger the issue after adding the synchronize_irq(), but
> > maybe it's just luck. Correct my if I miss something.
> >
> > Thanks,
> > Paul
> >
> >
> >
> >
> > >
> > > thanks,
> > >
> > > Takashi
> >
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
