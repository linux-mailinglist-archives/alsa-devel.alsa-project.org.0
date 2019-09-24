Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE0EBC33A
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2019 09:47:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A0AF82B;
	Tue, 24 Sep 2019 09:47:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A0AF82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569311277;
	bh=Z1yr4e89IBAUtEeyYZZxUgbwbwQWkLNxIVSRph86SbE=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gML6mo7Ur6iCVvnZMsLV0O22rYBqesphgFrVH6vkRF2dvWQBbZUaE7LSK0OLBciHL
	 YnRl5eZ8hzoZcOEmFtNHtDM3VD6P9avXzN2kedwi3TBeFzV5CRL0C17eJfbd+BkRS8
	 X0MsP5fYFlLgV/Xg/PolLaUJidw+X1dGX16Atub4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11EA6F8048D;
	Tue, 24 Sep 2019 09:46:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06DA1F8045F; Tue, 24 Sep 2019 09:46:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, PRX_BODYSUB_19, PRX_BODY_14, SPF_HELO_NONE,
 SPF_PASS, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 406D8F802BD
 for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2019 09:46:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 406D8F802BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="cjQTYFEc"
Received: by mail-pg1-x541.google.com with SMTP id v27so807139pgk.10
 for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2019 00:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EG+JlvfbvFilPuIaABBLqKFGRC7blvRxdL9s7RAp/fE=;
 b=cjQTYFEcLBWps0JvhZmKdXIwuUAZTLmB9Gc+I7+/TokFzfI2WdQN1bHqrNd09IoYtW
 1eKpi87rGOFwhOvsKiMGSS5jsZkLM2zlixYfpto/0v2alrjkKUZCYS+n+H1ze7mpCICS
 X3/nn9LP4molCd+YR11p4qyQQndKSIvfXcFDUK2eKby+AxuvyMaGahSLZo3Boh5usxn3
 Qy6W+AsIKJgoFqp0FCdUtP/8Csm9FNtgGOOkEdZaM+E95QxJbssQFpZkTQAzLZpPPKWQ
 Rvj9kDa+H4EZiPXSpIpbk8o9KUoXt+wYPaxWyNAvBNQyJduUmk+4KxUyY9wS/iiAWUeE
 nyAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EG+JlvfbvFilPuIaABBLqKFGRC7blvRxdL9s7RAp/fE=;
 b=jZjbY+XqZBk9GsBCR98BpKUCwJFOEdMRR6F6/DQSHAw2L+TnTOz31FRFEfnQEVyrPy
 Celgf6OyEuJphru6uviCNyHi6x7zR0XBgd/zQaPwa88Jgbg2orGUnCGRds3OsGbLv+u2
 N0keVV4L5S/eqyApigqDksqVjoPjRg7APMcjJRGYUFPqXoL93aRqDCCFUkWzLvxPaFgE
 Dz8RYW4nd/aerDQGiejF6ia53symiRzJ5L0M7ESKDhs/LX1fKrMSpodQvInEcVD+a8d8
 HvKzCwAl/VyArPoGwwA2fcvs6TmLEEwomtCAa+YHCszjn1C6EVLlL7+HNbKvgzRXqqHO
 80HQ==
X-Gm-Message-State: APjAAAUytVjEVE+lX6k6ir32XzOm35J78r9G94Ldj1u0LcNJ58kMxy2q
 sYO3vQzyjyjW4jvfnOB1Sug=
X-Google-Smtp-Source: APXvYqzck8ztydxAXDHsX41js2pQVVNFoqNQVnsoEVd8OLy2kLOw6/Wh6W37RUtbsf7tcU1q7sk4Kg==
X-Received: by 2002:a63:a55c:: with SMTP id r28mr1786322pgu.303.1569311166136; 
 Tue, 24 Sep 2019 00:46:06 -0700 (PDT)
Received: from flamethrower ([2407:7000:aa04:fb00:ce0f:a0bf:1ece:a196])
 by smtp.gmail.com with ESMTPSA id y2sm2598340pfe.126.2019.09.24.00.46.03
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 24 Sep 2019 00:46:05 -0700 (PDT)
Date: Tue, 24 Sep 2019 19:45:25 +1200
From: Ben Russell <thematrixeatsyou@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Message-Id: <20190924194525.dab812e92f8a75d5ed8d3d16@gmail.com>
In-Reply-To: <s5h5zlkm62b.wl-tiwai@suse.de>
References: <20190922032853.6123-1-thematrixeatsyou@gmail.com>
 <s5h5zlkm62b.wl-tiwai@suse.de>
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

On Sun, 22 Sep 2019 22:25:48 +0200
Takashi Iwai <tiwai@suse.de> wrote:

> On Sun, 22 Sep 2019 05:28:50 +0200,
> Ben Russell wrote:
> > 
> > This is my first time contributing a patch to a mailing list. If I've made a mess, please let me know so I can learn how to avoid it in future.
> > 
> > The purpose of this patchset is to fix a specific common lockup in the pcm_jack plugin (from alsa-plugins). I'm not sure if this is the right approach to take, but at the very least it should make the pcm_ioplug code a bit more resilient.
> > 
> > The problem is this: When using the pcm_jack plugin, if a program attempts to play audio using the SND_PCM_FORMAT_FLOAT format, said program locks up.
> > 
> > This should be enough to reproduce the bug:
> > 
> >     pcm.rawjack {
> >         type jack
> >         playback_ports {
> >             0 system:playback_1
> >             1 system:playback_2
> >         }
> >         capture_ports {
> >             0 system:capture_1
> >             1 system:capture_2
> >         }
> >     }
> >     
> >     pcm.!default {
> >         type plug
> >         slave.pcm "rawjack"
> >     }
> > 
> > What's happening is that several snd_pcm_ioplug_* functions assume that the pcm mutex is locked already. It then proceeds to unlock the mutex, call a function, and then relock the mutex. When the mutex isn't locked already, the initial unlock results in a silently ignored pthread error, and the lock results in the program eventually deadlocking as it doesn't expect the mutex to be held at that point.
> > 
> > Patch 2 modifies pcm_ioplug to check if the mutex is held before doing the unlock-act-lock sequence, and if the mutex is not held then it skips the unlock and lock stages. This depends on Patch 1, which adds a snd_pcm_is_locked function to give the state of the mutex.
> > 
> > Patch 3 is completely optional. It adds assertions which make sure that all uses of snd_pcm_lock/snd_pcm_unlock are correct. On one hand this will likely result in crashes in some of the less refined parts of the code. On the other hand, when that happens, you'll know which parts need a bit more love. I know it was useful for finding this issue in the first place.
> > 
> > These patches fix the problems I am having, but if you have a more suitable approach to fixing this problem then please let me know.
> 
> Thanks for the analysis and patches.  It's indeed a serious problem we
> need to address.
> 
> The current semantics of locking in alsa-lib code assumes that the
> lock/unlock never fails.  So the "right-and-quick" fix would be just
> to take the patch 3 to assert() upon pthread_mutex_lock/unlock
> errors.  Then we need to paper over the actual invalid locks.
> 
> I do wonder, though, exactly which code path triggers the pthread
> mutex error?  You should be able to catch it via gdb after the patch.
> 
> 
> thanks,
> 
> Takashi

Sure thing. With patch #3 against commit 1d7a131f, this trips up on an assert:

$ gdb --args mpv --ao=alsa --audio-format=float RESPECOGNIZE.mp3

The relevant backtrace:

#4  0x00007ffff4b06cf3 in snd_pcm_unlock (pcm=0x5555558625c0) at pcm_local.h:1187
#5  0x00007ffff4b075b3 in snd_pcm_unlock (pcm=0x5555558625c0) at pcm_local.h:1187
	if (pcm->lock_enabled && pcm->need_lock) {
		unlock_err = pthread_mutex_unlock(&pcm->lock);
		assert(unlock_err == 0); <-- this line
	}
#6  snd_pcm_ioplug_prepare (pcm=0x5555558625c0) at pcm_ioplug.c:167
	snd_pcm_ioplug_reset(pcm);
	if (io->data->callback->prepare) {
		snd_pcm_unlock(pcm); /* to avoid deadlock */ <-- this line
		err = io->data->callback->prepare(io->data);
		snd_pcm_lock(pcm);
	}
#7  0x00007ffff4abcba0 in snd_pcm_prepare (pcm=0x5555558627c0) at pcm.c:1214
	snd_pcm_lock(pcm);
	if (pcm->fast_ops->prepare)
		err = pcm->fast_ops->prepare(pcm->fast_op_arg); <-- this line
	else
		err = -ENOSYS;
#8  0x00005555555a2efa in ?? ()

Using --audio-format=s16 does not deadlock, as it goes via pcm_plugin before it can go via pcm_ioplug (it's most likely for sample format conversion):

#0  0x00007ffff4b07522 in snd_pcm_unlock (pcm=<optimized out>) at pcm_ioplug.c:166
#1  snd_pcm_ioplug_prepare (pcm=0x555555862640) at pcm_ioplug.c:167
#2  0x00007ffff4abcba0 in snd_pcm_prepare (pcm=0x555555862640) at pcm.c:1214
#3  0x00007ffff4ad2ed7 in snd_pcm_plugin_prepare (pcm=0x555555862e50) at pcm_plugin.c:159
	snd_pcm_plugin_t *plugin = pcm->private_data;
	int err;
	err = snd_pcm_prepare(plugin->gen.slave); <-- this line
	if (err < 0)
		return err;
#4  0x00007ffff4abcba0 in snd_pcm_prepare (pcm=0x555555862840) at pcm.c:1214
#5  0x00005555555a2efa in ?? ()

Regards,
Ben R
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
