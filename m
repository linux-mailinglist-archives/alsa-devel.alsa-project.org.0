Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A76BEFC8A7
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Nov 2019 15:18:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 089001614;
	Thu, 14 Nov 2019 15:17:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 089001614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573741091;
	bh=zScMMNkmq5eaU/B7KPp8EfyoaGX3W8wSO6BtpQp+Wbs=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dyhH2a9Rib3lW4N4Q+1b77f88313bYyCLHLvtBi0MSIEW+x1j8BU+7oldQfdCrAZM
	 eQcFK990+QnDBggPJHmQkV8QL2HagB7t/OZhfJzhufDfXTvn52Q0j+iVm+zJ5ZgFtg
	 P4sFv1/WviVHg5HXxuFuCisPi7DRcDuwqERmgvFo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 142B6F800CD;
	Thu, 14 Nov 2019 15:16:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45C2EF800CF; Thu, 14 Nov 2019 15:16:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E8E7F800CC
 for <alsa-devel@alsa-project.org>; Thu, 14 Nov 2019 15:16:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E8E7F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="cXJBERrM"
Received: by mail-ot1-x344.google.com with SMTP id d5so4955610otp.4
 for <alsa-devel@alsa-project.org>; Thu, 14 Nov 2019 06:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SRdGFxFM+twz+TlNBAB/igv43ep6CezFD3fRHbSX3nU=;
 b=cXJBERrM/6Oxog6lGwI0NcfMAGjf8EBoyxsG+0FuKPbk3yT6RyhE98/cX3RqG1Qwzp
 NS2hIU/IM8yf+BLpfXRDytz/aEr1eCkPdf8f6AmV0QWC5HBHg4EvgW0kUlXwKhb2ih8h
 Q364BH/NG9qJkUqvltNd8zFcmWr3QYQ+kzEKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SRdGFxFM+twz+TlNBAB/igv43ep6CezFD3fRHbSX3nU=;
 b=aN5Vdc+F8yMbAjTios9pogX1ZDh+EQlrq5tdkSPz4PGhiBASd5to7WMVLk+RQL69po
 frGqErVOmCvlWb+idzLemaXHTIQNCuHyGHXgHKgu15w+NkjIjde1a7HELGvFCF53yqIA
 +HAudNNth66zt/zwPHaBAQGjUhf9ks2SlbLbSN3GOyTE/r7jothS1WxkiRzOJyGh9Mgx
 x5c/41puW7RwoqDJBZLdjxZ+oisuJTeY/t2Kve4UBLRSlklv232lj5wpuGQAtsC7xXCI
 3V/QmAMldROoUD/h7QkZwH6HD91LMPebYMWvvYK6xN1iuis0DApeOGQAy2gJxAIlNTlc
 G8OA==
X-Gm-Message-State: APjAAAWERvQz/EKpLzJ5/N8ap0m7WADBF+SHiYrAAdIioCwCJxslL66F
 7SEF+MVE/7HiRybk4DimNphlcR7q1v3EVRLS/vB0Sw==
X-Google-Smtp-Source: APXvYqwVSixNkYuN7JVsHDtvGhf/BlCuiSbsyTd7C6HbXXLbX5cn+5wseuFf/7g38it5svaZQHrWs8pkF/cIIyJLJmM=
X-Received: by 2002:a05:6830:1aef:: with SMTP id
 c15mr7853569otd.200.1573740975849; 
 Thu, 14 Nov 2019 06:16:15 -0800 (PST)
MIME-Version: 1.0
References: <20191112171715.128727-1-paulhsia@chromium.org>
 <s5h1rud7yel.wl-tiwai@suse.de>
 <CAJaf1TaZzsPdydcMZMemVSkjRvhYvx7ZxY2JEvExQ56B+MjQLQ@mail.gmail.com>
 <s5h7e446raw.wl-tiwai@suse.de> <s5hftisnh3s.wl-tiwai@suse.de>
In-Reply-To: <s5hftisnh3s.wl-tiwai@suse.de>
From: Chih-Yang Hsia <paulhsia@chromium.org>
Date: Thu, 14 Nov 2019 22:16:04 +0800
Message-ID: <CAJaf1TYwbsuNZ_RmRfo7ZcVPJ04e4Dh3G1e3kVYPQh_sX9TgWQ@mail.gmail.com>
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

On Wed, Nov 13, 2019 at 7:36 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Wed, 13 Nov 2019 10:47:51 +0100,
> Takashi Iwai wrote:
> >
> > On Wed, 13 Nov 2019 08:24:41 +0100,
> > Chih-Yang Hsia wrote:
> > >
> > > On Wed, Nov 13, 2019 at 2:16 AM Takashi Iwai <tiwai@suse.de> wrote:
> > > >
> > > > On Tue, 12 Nov 2019 18:17:13 +0100,
> > > > paulhsia wrote:
> > > > >
> > > > > Since
> > > > > - snd_pcm_detach_substream sets runtime to null without stream lock and
> > > > > - snd_pcm_period_elapsed checks the nullity of the runtime outside of
> > > > >   stream lock.
> > > > >
> > > > > This will trigger null memory access in snd_pcm_running() call in
> > > > > snd_pcm_period_elapsed.
> > > >
> > > > Well, if a stream is detached, it means that the stream must have been
> > > > already closed; i.e. it's already a clear bug in the driver that
> > > > snd_pcm_period_elapsed() is called against such a stream.
> > > >
> > > > Or am I missing other possible case?
> > > >
> > > >
> > > > thanks,
> > > >
> > > > Takashi
> > > >
> > >
> > > In multithreaded environment, it is possible to have to access both
> > > `interrupt_handler` (from irq) and `substream close` (from
> > > snd_pcm_release) at the same time.
> > > Therefore, in driver implementation, if "substream close function" and
> > > the "code section where snd_pcm_period_elapsed() in" do not hold the
> > > same lock, then the following things can happen:
> > >
> > > 1. interrupt_handler -> goes into snd_pcm_period_elapsed with a valid
> > > sustream pointer
> > > 2. snd_pcm_release_substream: call close without blocking
> > > 3. snd_pcm_release_substream: call snd_pcm_detache_substream and set
> > > substream->runtime to NULL
> > > 4. interrupt_handler -> call snd_pcm_runtime() and crash while
> > > accessing fields in `substream->runtime`
> > >
> > > e.g. In intel8x0.c driver for ac97 device,
> > > In driver intel8x0.c, `snd_pcm_period_elapsed` is called after
> > > checking `ichdev->substream` in `snd_intel8x0_update`.
> > > And if a `snd_pcm_release` call from alsa-lib and pass through close()
> > > and run to snd_pcm_detach_substream() in another thread, it's possible
> > > to trigger a crash.
> > > I can reproduce the issue within a multithread VM easily.
> > >
> > > My patches are trying to provide a basic protection for this situation
> > > (and internal pcm lock between detach and elapsed), since
> > > - the usage of `snd_pcm_period_elapsed` does not warn callers about
> > > the possible race if the driver does not  force the order for `calling
> > > snd_pcm_period_elapsed` and `close` by lock and
> > > - lots of drivers already have this hidden issue and I can't fix them
> > > one by one (You can check the "snd_pcm_period_elapsed usage" and the
> > > "close implementation" within all the drivers). The most common
> > > mistake is that
> > >   - Checking if the substream is null and call into snd_pcm_period_elapsed
> > >   - But `close` can happen anytime, pass without block and
> > > snd_pcm_detach_substream will be trigger right after it
> >
> > Thanks, point taken.  While this argument is valid and it's good to
> > harden the PCM core side, the concurrent calls are basically a bug,
> > and we'd need another fix in anyway.  Also, the patch 2 makes little
> > sense; there can't be multiple close calls racing with each other.  So
> > I'll go for taking your fix but only the first patch.
> >
> > Back to this race: the surfaced issue is, as you pointed out, the race
> > between snd_pcm_period_elapsed() vs close call.  However, the
> > fundamental problem is the pending action after the PCM trigger-stop
> > call.  Since the PCM trigger doesn't block nor wait until the hardware
> > actually stops the things, the driver may go to the other step even
> > after this "supposed-to-be-stopped" point.  In your case, it goes up
> > to close, and crashes.  If we had a sync-stop operation, the interrupt
> > handler should have finished before moving to the close stage, hence
> > such a race could be avoided.
> >
> > It's been a long known problem, and some drivers have the own
> > implementation for stop-sync.  I think it's time to investigate and
> > start implementing the fundamental solution.
>
> BTW, what we need essentially for intel8x0 is to just call
> synchronize_irq() before closing, at best in hw_free procedure:
>
> --- a/sound/pci/intel8x0.c
> +++ b/sound/pci/intel8x0.c
> @@ -923,8 +923,10 @@ static int snd_intel8x0_hw_params(struct snd_pcm_substream *substream,
>
>  static int snd_intel8x0_hw_free(struct snd_pcm_substream *substream)
>  {
> +       struct intel8x0 *chip = snd_pcm_substream_chip(substream);
>         struct ichdev *ichdev = get_ichdev(substream);
>
> +       synchronize_irq(chip->irq);
>         if (ichdev->pcm_open_flag) {
>                 snd_ac97_pcm_close(ichdev->pcm);
>                 ichdev->pcm_open_flag = 0;
>
>
> The same would be needed also at the beginning of the prepare, as the
> application may restart the stream without release.
>
> My idea is to add sync_stop PCM ops and call it from PCM core at
> snd_pcm_prepare() and snd_pcm_hw_free().
>
Will adding synchronize_irq() in snd_pcm_hw_free there fix the race issue?
Is it possible to have sequence like the following steps ?
- [Thread 1] snd_pcm_hw_free: just pass synchronize_irq()
- [Thread 2] another interrupt come -> snd_intel8x0_update() -> goes
into the lock region of snd_pcm_period_elapsed() and passes the
PCM_RUNTIME_CHECK (right before snd_pcm_running())
- [Thread 1] snd_pcm_hw_free finished() -> snd_pcm_detach_substream()
-> runtime=NULL
- [Thread 2] Execute snd_pcm_running and crash

I can't trigger the issue after adding the synchronize_irq(), but
maybe it's just luck. Correct my if I miss something.

Thanks,
Paul




>
> thanks,
>
> Takashi
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
