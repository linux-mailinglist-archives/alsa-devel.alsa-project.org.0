Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 223A85AC594
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Sep 2022 19:07:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FF8D167A;
	Sun,  4 Sep 2022 19:06:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FF8D167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662311245;
	bh=NZgcywcrXXZWwqvUUDHuOxtU8cPQt4VQq6KbLMw4ics=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dIoUYJhZ83EtjbPLi7Da5TLYF3H9viX2hF6ndWQmOJw09RcOkwDBU1fdS7vPZreph
	 bMxzvE1dhG2YioyNs1MoaarL8webDK4ONP49Xnt/ylxeKps5OeGuyW2YQzixeDz6Ro
	 Tq36yT7PgHzUbZoPGPqbb3AIXE4lkARSn/DYuPHg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93E91F8016E;
	Sun,  4 Sep 2022 19:06:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55B92F800CC; Sun,  4 Sep 2022 19:06:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E32C7F800CC
 for <alsa-devel@alsa-project.org>; Sun,  4 Sep 2022 19:06:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E32C7F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="OYP4jkcI"
Received: by mail-yb1-xb2a.google.com with SMTP id 130so4303201ybz.9
 for <alsa-devel@alsa-project.org>; Sun, 04 Sep 2022 10:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=i3qcw7HhCaizDTCANFYTUOQc7++Sck55u+h2cOgbcPs=;
 b=OYP4jkcIlMcod+Km7VNNnzjl/iJl8P+f+6yVA47ZdGTO3/+q4+BlixDe/RvXAN9SNp
 US2Eyn4jiiloGxRe3SDN0i89ntN9NUAeVYfkAmFqybzdPv9gVWOx2vACZmwWT+/GiFUa
 M8n5X9fufVUQna1T6WT2ksxjMe131y3B7HuMjv5jiQ/wDwSTy7XYzRQDVpeq+SaGdv2L
 H5dMGjalCG6+ZMKbA33wP+Guvh64bUvZzt3iW8kCyLtdaxj1rZkrrsO5zglrfZMSqmYC
 9aF3DFyCUCXZADs0ty/CtscuCA3v8QSDJubLJKOowqSX//5fYgn9KuIAU30TJ+/ZQGAI
 RLFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=i3qcw7HhCaizDTCANFYTUOQc7++Sck55u+h2cOgbcPs=;
 b=sNXf7kGJwUBmdvH/oq/kZESZVU7kp6CrpiBe49WBKYMNPnJekoHR54yeIgiFdDzJ3T
 3UPQ/CKNHlnJC3AKtLx58UuKJbkaEZCNvoQTB+hEYBOezwgJWJPrhKSoW+nbQ2sQGeLr
 R5OzWaDZa4AJhOeqSe3dt/zgj8Y81n9ADjm4ksXo/4beJXp9beIi6wkNnP9jw/lOJbCy
 RmBMW7LVJvBzPhqyDeFkx8c7A6lWzK/hjtDruIwhTxhuRDNhpSZi2bKMAe05SoAIo9ft
 +RPsSYZWyYK2yfP7C7GWun952AI6H7qirm2MUahpkKdNLPIO+47uUmV8zLpqxmFB7bF1
 6pRQ==
X-Gm-Message-State: ACgBeo29KSerhBfVbCjjuSO8szZeH4nTk22CGU6WPD+oLSAw8xRf7ooz
 3GQk6KRjufaedHZuezdz5izriTl5zQA3EmodwkM=
X-Google-Smtp-Source: AA6agR4JfByjOTAG8W/b1uuPrWeQICvH9XJtruS1rRFbLq82UO6Hgg/YMreK7N3rx29y884t8A1ednfv0aoNQ1HxifQ=
X-Received: by 2002:a25:dfc5:0:b0:6a6:8214:d4f5 with SMTP id
 w188-20020a25dfc5000000b006a68214d4f5mr7909640ybg.155.1662311175820; Sun, 04
 Sep 2022 10:06:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAFcO6XN7JDM4xSXGhtusQfS2mSBcx50VJKwQpCq=WeLt57aaZA@mail.gmail.com>
 <87edwrl9i8.wl-tiwai@suse.de>
In-Reply-To: <87edwrl9i8.wl-tiwai@suse.de>
From: butt3rflyh4ck <butterflyhuangxx@gmail.com>
Date: Mon, 5 Sep 2022 01:06:05 +0800
Message-ID: <CAFcO6XPxCN7DEXbUvtRTKq+ku0OJA21gCz_dqMacDpsNUrsUhg@mail.gmail.com>
Subject: Re: A new null-ptr-deref Write bug in snd_pcm_format_set_silence
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: cuibixuan@linux.alibaba.com, LKML <linux-kernel@vger.kernel.org>,
 alsa-devel@alsa-project.org, tiwai@suse.com
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

I have tested this patch, it works well.

Regards,
 butt3rflyh4ck.

On Sun, Sep 4, 2022 at 6:27 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Sun, 04 Sep 2022 11:48:37 +0200,
> butt3rflyh4ck wrote:
> >
> > Hi, there is a new null-ptr-deref Write bug in
> > snd_pcm_format_set_slience in sound/core/pcm_misc.c in the latest
> > upstream kernel and can reproduce it.
> > We call SNDCTL_DSP_SYNC and SNDCTL_DSP_SPEED in multiple threads to
> > trigger the vulnerability.
> >
> > See the Call Trace:
> > ==================================================================
> > Call Trace:
> >  <TASK>
> >  __dump_stack lib/dump_stack.c:88 [inline]
> >  dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
> >  kasan_report+0xb1/0x1e0 mm/kasan/report.c:495
> >  check_region_inline mm/kasan/generic.c:183 [inline]
> >  kasan_check_range+0x13d/0x180 mm/kasan/generic.c:189
> >  memset+0x20/0x40 mm/kasan/shadow.c:44
> >  snd_pcm_format_set_silence sound/core/pcm_misc.c:441 [inline]
> >  snd_pcm_format_set_silence+0x215/0x350 sound/core/pcm_misc.c:424
> >  snd_pcm_oss_sync+0x60e/0x800 sound/core/oss/pcm_oss.c:1690
> >  snd_pcm_oss_ioctl+0x2087/0x3420 sound/core/oss/pcm_oss.c:2634
> >  vfs_ioctl fs/ioctl.c:51 [inline]
> >  __do_sys_ioctl fs/ioctl.c:870 [inline]
> >  __se_sys_ioctl fs/ioctl.c:856 [inline]
> >  __x64_sys_ioctl+0x193/0x200 fs/ioctl.c:856
> >  do_syscall_x64 arch/x86/entry/common.c:50 [inline]
> >  do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
> >  entry_SYSCALL_64_after_hwframe+0x63/0xcd
> > ==================================================================
> > We can see the function snd_pcm_format_set_silence code below:
> > ```
> > int snd_pcm_format_set_silence(snd_pcm_format_t format, void *data,
> > unsigned int samples)
> > {
> >         int width;
> >         unsigned char *dst;
> >         const unsigned char *pat;
> >
> >         if (!valid_format(format))
> >                 return -EINVAL;
> >         if (samples == 0)
> >                 return 0;
> >         width = pcm_formats[(INT)format].phys; /* physical width */
> >         pat = pcm_formats[(INT)format].silence;
> >         if (!width || !pat)
> >                 return -EINVAL;
> >         /* signed or 1 byte data */
> >         if (pcm_formats[(INT)format].signd == 1 || width <= 8) {
> >                 unsigned int bytes = samples * width / 8;
> >                 memset(data, *pat, bytes);    ///// [1] ---------> data is NULL
> >                 return 0;
> >         }
> >        ......
> > }
> > ```
> > [1], the data pointer is NULL, we can know snd_pcm_format_set_silence
> > called in line 1690 in sound/core/oss/pcm_oss.c from call stack trace.
> > let we see code below:
> > ```
> > static int snd_pcm_oss_sync(struct snd_pcm_oss_file *pcm_oss_file)
> > {
> >         int err = 0;
> >         unsigned int saved_f_flags;
> >         struct snd_pcm_substream *substream;
> >         struct snd_pcm_runtime *runtime;
> >         snd_pcm_format_t format;
> >         unsigned long width;
> >         size_t size;
> >
> >         substream = pcm_oss_file->streams[SNDRV_PCM_STREAM_PLAYBACK];
> >         if (substream != NULL) {
> >                 runtime = substream->runtime;
> >                 if (atomic_read(&substream->mmap_count))
> >                         goto __direct;
> >                 err = snd_pcm_oss_make_ready(substream);
> >                 if (err < 0)
> >                         return err;
> >                 atomic_inc(&runtime->oss.rw_ref);
> >                 if (mutex_lock_interruptible(&runtime->oss.params_lock)) {
> >                         atomic_dec(&runtime->oss.rw_ref);
> >                         return -ERESTARTSYS;
> >                 }
> >                 format = snd_pcm_oss_format_from(runtime->oss.format);
> >                 width = snd_pcm_format_physical_width(format);
> >                 if (runtime->oss.buffer_used > 0) {
> > #ifdef OSS_DEBUG
> >                         pcm_dbg(substream->pcm, "sync: buffer_used\n");
> > #endif
> >                         size = (8 * (runtime->oss.period_bytes -
> > runtime->oss.buffer_used) + 7) / width;
> >                         snd_pcm_format_set_silence(format,
> >                                                    runtime->oss.buffer
> > + runtime->oss.buffer_used,   ///// [2]
> >                                                    size);
> >                         err = snd_pcm_oss_sync1(substream,
> > runtime->oss.period_bytes);
> >                         if (err < 0)
> >                                 goto unlock;
> >                 } else if (runtime->oss.period_ptr > 0) {
> >
> > ```
> > [2]  runtime->oss.buffer + runtime->oss.buffer_used is the data
> > pointer, but runtime->oss.buffer is NULL here but it doesn't make
> > sense.
> > runtime->oss.buffter is allocated by kvzalloc, if runtime->oss_buffer
> > is NULL, it would return an ENOMEM error.
> > Maybe I think there is a race condition, the runtime->oss.buffer is
> > freed and set to NULL but we can use runtime->oss.buffter via ioctl.
>
> Yeah, likely it's in a small race window between two calls.
>
> Could you try the patch below?
>
>
> thanks,
>
> Takashi
>
> ---
> --- a/sound/core/oss/pcm_oss.c
> +++ b/sound/core/oss/pcm_oss.c
> @@ -1672,14 +1672,14 @@ static int snd_pcm_oss_sync(struct snd_pcm_oss_file *pcm_oss_file)
>                 runtime = substream->runtime;
>                 if (atomic_read(&substream->mmap_count))
>                         goto __direct;
> -               err = snd_pcm_oss_make_ready(substream);
> -               if (err < 0)
> -                       return err;
>                 atomic_inc(&runtime->oss.rw_ref);
>                 if (mutex_lock_interruptible(&runtime->oss.params_lock)) {
>                         atomic_dec(&runtime->oss.rw_ref);
>                         return -ERESTARTSYS;
>                 }
> +               err = snd_pcm_oss_make_ready_locked(substream);
> +               if (err < 0)
> +                       goto unlock;
>                 format = snd_pcm_oss_format_from(runtime->oss.format);
>                 width = snd_pcm_format_physical_width(format);
>                 if (runtime->oss.buffer_used > 0) {



-- 
Active Defense Lab of Venustech
