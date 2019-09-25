Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C32BD82A
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Sep 2019 08:13:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34FD716C8;
	Wed, 25 Sep 2019 08:12:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34FD716C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569392001;
	bh=Ro+Q+cIDuGQ5g2NBA6Ms7Mi+IahbIeyk9Cm22+6C6wM=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hkkKY54XjdwlI5yJ0EgXQ5jR1yuHvj0Q/NeMkSckTQEUvU6A4nI+a6QbH8NrMVhhy
	 DJQFX/W/HiWM2Pg6GGZZ8FONwH5uaKqzSpXT5Ce8qaG/OtNqi99h3XdPBohLSz1i42
	 GxZwvq0hFzLl5F2qSMFKBM/viygE8T9wrllMvdWc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B0B9F8044C;
	Wed, 25 Sep 2019 08:11:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 408DEF8044C; Wed, 25 Sep 2019 08:11:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, PRX_BODYSUB_19, PRX_BODY_14, SPF_HELO_NONE,
 SPF_PASS, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 72803F802BD
 for <alsa-devel@alsa-project.org>; Wed, 25 Sep 2019 08:11:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72803F802BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YzQZ6dD0"
Received: by mail-pg1-x543.google.com with SMTP id a3so2577991pgm.13
 for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2019 23:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FJTTOaJKvD+R2lZP/fM5t0aHVcwzT+wuwMdcoXp/S+w=;
 b=YzQZ6dD0g6bgUZVC0DU7g3Q7vQqSj2iRCirshK3bRyY/M2QxQwOCfmZKQKPMcxiXgY
 854bV60EW24fy5EV0I3rQkMzBzzERlSqPfYuHW3CKq2/bSfRxabLHWMYpSuZmv23iXAF
 ZGDLDGsdOTtC8qeShdaC3xISzTY6jVwACrZhp3zVUlzuMqED3IE84Ya2Vf+FeskbBb0U
 h1f8xk63GGmQHXKw6KjzggPsGHQOEojFKtQ8eZhdEi3APmwqH2y4Qy2M4i3Zrdz28IIe
 oTHXXPnIh/wAaUbZPZVD4vL4s/ZYcfSRp2K2kPrUTxH8+xhk47ijaN8g07vWaG/1eFqP
 PSrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FJTTOaJKvD+R2lZP/fM5t0aHVcwzT+wuwMdcoXp/S+w=;
 b=Ftpx/zrUaq7e1WaYPtH4XlA6uI+PR2rMMgJug7GpqSNbFeGaZLGD7wwlYOD28togra
 mAKdw3MHDBT6xIjcopgMlsjly6sWiI01e9kSjNRWR6GioDjBI3oDCCdRV8esZXvImzi5
 BpkVDgzRoTz2YOgp6Xr+x2Rv0U0SJIouebxcdbA5Ng/LUtckrKx4ZXcbfkzAPfKI+7Bs
 huDDBU9Vkok/uhiYtT4iva5nKx3R6phdoPezFjScktec7O/muc1/vmtnih+WK4Y6XTLY
 d79L9EvS2yqMz5ka6PQ+GHNjtITTmkN1mEgxTazgTc235pBQ0RqB7iXjV2d5nJaL795O
 b/dg==
X-Gm-Message-State: APjAAAUNkL14YsQLkhUtaHLz9HcpSJb9fR7+0teHun0UtoRMxU5dt8EP
 mfWaOACiK5KD1ZgTGk38TSw=
X-Google-Smtp-Source: APXvYqwTnWdBGOS4rpKWm01PjTa95vnZHnTlSDFoB2EHmoj1pVB7gvT3oZS3FXIn+CJY1m3uHYTZdA==
X-Received: by 2002:a65:5905:: with SMTP id f5mr7278042pgu.332.1569391889495; 
 Tue, 24 Sep 2019 23:11:29 -0700 (PDT)
Received: from flamethrower ([2407:7000:aa04:fb00:ce0f:a0bf:1ece:a196])
 by smtp.gmail.com with ESMTPSA id k3sm5038357pgl.9.2019.09.24.23.11.27
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 24 Sep 2019 23:11:28 -0700 (PDT)
Date: Wed, 25 Sep 2019 18:10:49 +1200
From: Ben Russell <thematrixeatsyou@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Message-Id: <20190925181049.ac14c2d27a737ae97b924f2d@gmail.com>
In-Reply-To: <s5htv92j8un.wl-tiwai@suse.de>
References: <20190922032853.6123-1-thematrixeatsyou@gmail.com>
 <s5h5zlkm62b.wl-tiwai@suse.de>
 <20190924194525.dab812e92f8a75d5ed8d3d16@gmail.com>
 <s5htv92j8un.wl-tiwai@suse.de>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH 0/3] Make pcm_ioplug check lock status
 before locking (fixes pcm_jack lockups)
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

On Tue, 24 Sep 2019 12:18:24 +0200
Takashi Iwai <tiwai@suse.de> wrote:

> On Tue, 24 Sep 2019 09:45:25 +0200,
> Ben Russell wrote:
> > 
> > On Sun, 22 Sep 2019 22:25:48 +0200
> > Takashi Iwai <tiwai@suse.de> wrote:
> > 
> > > On Sun, 22 Sep 2019 05:28:50 +0200,
> > > Ben Russell wrote:
> > > > 
> > > > This is my first time contributing a patch to a mailing list. If I've made a mess, please let me know so I can learn how to avoid it in future.
> > > > 
> > > > The purpose of this patchset is to fix a specific common lockup in the pcm_jack plugin (from alsa-plugins). I'm not sure if this is the right approach to take, but at the very least it should make the pcm_ioplug code a bit more resilient.
> > > > 
> > > > The problem is this: When using the pcm_jack plugin, if a program attempts to play audio using the SND_PCM_FORMAT_FLOAT format, said program locks up.
> > > > 
> > > > This should be enough to reproduce the bug:
> > > > 
> > > >     pcm.rawjack {
> > > >         type jack
> > > >         playback_ports {
> > > >             0 system:playback_1
> > > >             1 system:playback_2
> > > >         }
> > > >         capture_ports {
> > > >             0 system:capture_1
> > > >             1 system:capture_2
> > > >         }
> > > >     }
> > > >     
> > > >     pcm.!default {
> > > >         type plug
> > > >         slave.pcm "rawjack"
> > > >     }
> > > > 
> > > > What's happening is that several snd_pcm_ioplug_* functions assume that the pcm mutex is locked already. It then proceeds to unlock the mutex, call a function, and then relock the mutex. When the mutex isn't locked already, the initial unlock results in a silently ignored pthread error, and the lock results in the program eventually deadlocking as it doesn't expect the mutex to be held at that point.
> > > > 
> > > > Patch 2 modifies pcm_ioplug to check if the mutex is held before doing the unlock-act-lock sequence, and if the mutex is not held then it skips the unlock and lock stages. This depends on Patch 1, which adds a snd_pcm_is_locked function to give the state of the mutex.
> > > > 
> > > > Patch 3 is completely optional. It adds assertions which make sure that all uses of snd_pcm_lock/snd_pcm_unlock are correct. On one hand this will likely result in crashes in some of the less refined parts of the code. On the other hand, when that happens, you'll know which parts need a bit more love. I know it was useful for finding this issue in the first place.
> > > > 
> > > > These patches fix the problems I am having, but if you have a more suitable approach to fixing this problem then please let me know.
> > > 
> > > Thanks for the analysis and patches.  It's indeed a serious problem we
> > > need to address.
> > > 
> > > The current semantics of locking in alsa-lib code assumes that the
> > > lock/unlock never fails.  So the "right-and-quick" fix would be just
> > > to take the patch 3 to assert() upon pthread_mutex_lock/unlock
> > > errors.  Then we need to paper over the actual invalid locks.
> > > 
> > > I do wonder, though, exactly which code path triggers the pthread
> > > mutex error?  You should be able to catch it via gdb after the patch.
> > > 
> > > 
> > > thanks,
> > > 
> > > Takashi
> > 
> > Sure thing. With patch #3 against commit 1d7a131f, this trips up on an assert:
> > 
> > $ gdb --args mpv --ao=alsa --audio-format=float RESPECOGNIZE.mp3
> > 
> > The relevant backtrace:
> > 
> > #4  0x00007ffff4b06cf3 in snd_pcm_unlock (pcm=0x5555558625c0) at pcm_local.h:1187
> > #5  0x00007ffff4b075b3 in snd_pcm_unlock (pcm=0x5555558625c0) at pcm_local.h:1187
> > 	if (pcm->lock_enabled && pcm->need_lock) {
> > 		unlock_err = pthread_mutex_unlock(&pcm->lock);
> > 		assert(unlock_err == 0); <-- this line
> > 	}
> > #6  snd_pcm_ioplug_prepare (pcm=0x5555558625c0) at pcm_ioplug.c:167
> > 	snd_pcm_ioplug_reset(pcm);
> > 	if (io->data->callback->prepare) {
> > 		snd_pcm_unlock(pcm); /* to avoid deadlock */ <-- this line
> > 		err = io->data->callback->prepare(io->data);
> > 		snd_pcm_lock(pcm);
> > 	}
> > #7  0x00007ffff4abcba0 in snd_pcm_prepare (pcm=0x5555558627c0) at pcm.c:1214
> > 	snd_pcm_lock(pcm);
> > 	if (pcm->fast_ops->prepare)
> > 		err = pcm->fast_ops->prepare(pcm->fast_op_arg); <-- this line
> > 	else
> > 		err = -ENOSYS;
> > #8  0x00005555555a2efa in ?? ()
> > 
> > Using --audio-format=s16 does not deadlock, as it goes via pcm_plugin before it can go via pcm_ioplug (it's most likely for sample format conversion):
> > 
> > #0  0x00007ffff4b07522 in snd_pcm_unlock (pcm=<optimized out>) at pcm_ioplug.c:166
> > #1  snd_pcm_ioplug_prepare (pcm=0x555555862640) at pcm_ioplug.c:167
> > #2  0x00007ffff4abcba0 in snd_pcm_prepare (pcm=0x555555862640) at pcm.c:1214
> > #3  0x00007ffff4ad2ed7 in snd_pcm_plugin_prepare (pcm=0x555555862e50) at pcm_plugin.c:159
> > 	snd_pcm_plugin_t *plugin = pcm->private_data;
> > 	int err;
> > 	err = snd_pcm_prepare(plugin->gen.slave); <-- this line
> > 	if (err < 0)
> > 		return err;
> > #4  0x00007ffff4abcba0 in snd_pcm_prepare (pcm=0x555555862840) at pcm.c:1214
> > #5  0x00005555555a2efa in ?? ()
> 
> Thanks, after reading the traces carefully, finally I figured out what
> went wrong.  In some cases, pcm->fast_op_arg isn't pcm itself but has
> a different value.  Then we call snd_pcm_lock() with pcm, but call
> fast_op with fast_op_arg as the PCM object.  This leads to the
> unexpected behavior for the plugin that tries to unlock / relock from
> the given PCM object.
> 
> So, we'd need to convert snd_pcm_lock()/unlock() with fast_op_arg or
> op_arg in most places.
> 
> A test fix patch is below.  Could you test it quickly?
> I'm going to traveling from tomorrow, so I'd like to have confirmation
> before merging into git repo.
> 
> 
> thanks,
> 
> Takashi
> 
> -- 8< --

The patch works fine. mpv works for float and s16, Wine works, Mumble works for capture and playback.

Thanks for tracking this down so quickly.

Regards,
Ben R
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
