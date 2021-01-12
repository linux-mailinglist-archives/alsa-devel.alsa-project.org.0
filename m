Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 788E42F3776
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jan 2021 18:46:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1115016A5;
	Tue, 12 Jan 2021 18:46:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1115016A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610473612;
	bh=yQy15MJL5fzkrfj+vl5+UYZ1VVCRzmMX5WM3Fu+9Q6E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F5wC12x5/sjrkFYAXgB6OChaZsJEO1AoouubKSR+d1mlzPfrYf4sAAmpevIy/yfRn
	 oU9L4+oxc9dZKOuRToHs8vhS2Df+lMxRzGPm0aFD695om3LVqCrtPWw1fRbpijjA7T
	 CcSh9mHLrF4DG+JBGsN6inL+Ea3NZkHl5gr9zZ9U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86B1DF800B9;
	Tue, 12 Jan 2021 18:45:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3819F8025E; Tue, 12 Jan 2021 18:45:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CC5CF800B9
 for <alsa-devel@alsa-project.org>; Tue, 12 Jan 2021 18:45:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CC5CF800B9
Received: from mail-lf1-f71.google.com ([209.85.167.71])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1kzNj4-0003Um-QS
 for alsa-devel@alsa-project.org; Tue, 12 Jan 2021 17:45:02 +0000
Received: by mail-lf1-f71.google.com with SMTP id a19so1329362lfd.8
 for <alsa-devel@alsa-project.org>; Tue, 12 Jan 2021 09:45:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=suRULWjvyvwLLkjv322Q9lcXNMqjmrzWw3W6X82LJRo=;
 b=k0G2TXFqtQtLVQTJ+0IX7PewIp42Y/ivCko2udAyof0ZXVBtdT10/8chgMH3xk2gtU
 AYIHiTl0el6aKafdaq3Qih9oDqaBG3WUakbL7ygooztFayA+0SjwVcxlp5SntoXPKljF
 DQQ09Bh9JBpR8zNzKqPdu6PxrdIfR5xeObA+FBJ33/ikEa8qF4jFqkB/fagTy3v0dY9k
 6vCFWO1efi9OfYsIPTXNWANu+j/tGbE8QaTsWeQesDu07uDLW9p1yoY/QpAcWTTS8SRA
 aOF4DfRcue8pmXwG66Z95hctEGrVo5n7fn8FM27Xd7yNoxuf7+FhcBG5kh3BqDEBeR6o
 igxA==
X-Gm-Message-State: AOAM530UDKfqJs0E7wBNHgNNjwbjrs2b9oOikuscFZ5O83l+DCjAoGoa
 nO9VeW6OqSRmykd1j4zAR6lpdVzH2qcJ/65hhMcbHVlKGwf3P8AaLVK8N6/EdXuSkAV8hZYPooN
 bSw9fXVM6ymzCzdPYgUbCxFd68T0wZUitta/vEYWx2m+8aadozMVBpVIw
X-Received: by 2002:a19:8316:: with SMTP id f22mr45488lfd.10.1610473502104;
 Tue, 12 Jan 2021 09:45:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz3ezkhzyKn1TJn7lwMcaTCjEJDk2t2c2uIeLsEIyN5rMwG+2TmQPqTbNWq4exLlRzBD4IBFPl8ruBo/890cqA=
X-Received: by 2002:a19:8316:: with SMTP id f22mr45468lfd.10.1610473501732;
 Tue, 12 Jan 2021 09:45:01 -0800 (PST)
MIME-Version: 1.0
References: <20210112130704.1201406-1-kai.heng.feng@canonical.com>
 <s5h1reqs3av.wl-tiwai@suse.de>
In-Reply-To: <s5h1reqs3av.wl-tiwai@suse.de>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Wed, 13 Jan 2021 01:44:48 +0800
Message-ID: <CAAd53p4O8ut-qKzB-qWFobXcAeWpVdHhdczLBu+aWsV=SyPCDA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] ALSA: hda/realtek: Power up codec when setting LED
 via COEF and GPIO
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jian-Hong Pan <jhp@endlessos.org>, Kailang Yang <kailang@realtek.com>,
 Thomas Hebb <tommyhebb@gmail.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, Mark Brown <broonie@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, daniel.baluta@nxp.com
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

On Tue, Jan 12, 2021 at 9:17 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Tue, 12 Jan 2021 14:06:59 +0100,
> Kai-Heng Feng wrote:
> >
> > System takes a very long time to suspend after commit 215a22ed31a1
> > ("ALSA: hda: Refactor codec PM to use direct-complete optimization"):
> > [   90.065964] PM: suspend entry (s2idle)
> > [   90.067337] Filesystems sync: 0.001 seconds
> > [   90.185758] Freezing user space processes ... (elapsed 0.002 seconds) done.
> > [   90.188713] OOM killer disabled.
> > [   90.188714] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
> > [   90.190024] printk: Suspending console(s) (use no_console_suspend to debug)
> > [   90.904912] intel_pch_thermal 0000:00:12.0: CPU-PCH is cool [49C], continue to suspend
> > [  321.262505] snd_hda_codec_realtek ehdaudio0D0: Unable to sync register 0x2b8000. -5
> > [  328.426919] snd_hda_codec_realtek ehdaudio0D0: Unable to sync register 0x2b8000. -5
> > [  329.490933] ACPI: EC: interrupt blocked
> >
> > That commit keeps the codec suspended during the system suspend. However,
> > led_suspend() for mute and micmute led writes codec register, triggers
> > a pending wake up. The wakeup is then handled in __device_suspend() by
> > the following:
> > - pm_runtime_disable() to handle the wakeup event.
> > - device is no longer is suspended state, direct-complete isn't taken.
> > - pm_runtime_enable() to balance disable_depth.
> >
> > if (dev->power.direct_complete) {
> >       if (pm_runtime_status_suspended(dev)) {
> >               pm_runtime_disable(dev);
> >               if (pm_runtime_status_suspended(dev)) {
> >                       pm_dev_dbg(dev, state, "direct-complete ");
> >                       goto Complete;
> >               }
> >
> >               pm_runtime_enable(dev);
> >       }
> >       dev->power.direct_complete = false;
> > }
> >
> > Since direct-complete doens't apply anymore, the codec's system suspend
> > routine is used.
> >
> > This doesn't play well with SOF driver. When its runtime resume is
> > called for system suspend, hda_codec_jack_check() schedules
> > jackpoll_work which uses snd_hdac_is_power_on() to check whether codec
> > is suspended. Because of the previous pm_runtime_enable(),
> > snd_hdac_is_power_on() returns false and jackpoll continues to run, and
> > snd_hda_power_up_pm() cannot power up an already suspended codec in
> > multiple attempts, causes the long delay on system suspend.
> >
> > When direct-complete path is taken, snd_hdac_is_power_on() returns true
> > and hda_jackpoll_work() is skipped by accident. This is still not
> > correct, and it will be addressed by later patch.
> >
> > Explicitly runtime resume codec on setting LED to solve the issue.
> >
> > Fixes: 215a22ed31a1 ("ALSA: hda: Refactor codec PM to use direct-complete optimization")
>
> Hmm, I really don't get this.
>
> alc_update_gpio_data() calls snd_hda_codec_write() in the end, and
> this function goes over bus->exec_verb call.  And for the legacy HDA
> codec, it's codec_exec_verb in hda_codec.c, which has already
> snd_hda_power_up_pm().
>
> What's the missing piece?

Thanks for pointing this out!

The missing piece here is that the issue only happens when both mute
and micmute LED are off, so alc_update_gpio_data() doesn't do anything
to turn the LED off during suspend.
If LED is on, turning off LED will indeed resume the codec and the
issue doesn't happen.
So this patch is unnecessary. Will send v4.

Kai-Heng


>
>
>
> thanks,
>
> Takashi
>
> > ---
> > v3:
> >  New patch.
> >
> >  sound/pci/hda/patch_realtek.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> > index 3c1d2a3fb1a4..304a7bc89fcd 100644
> > --- a/sound/pci/hda/patch_realtek.c
> > +++ b/sound/pci/hda/patch_realtek.c
> > @@ -4164,7 +4164,10 @@ static void alc_update_gpio_led(struct hda_codec *codec, unsigned int mask,
> >  {
> >       if (polarity)
> >               enabled = !enabled;
> > +     /* temporarily power up/down for setting GPIO */
> > +     snd_hda_power_up_pm(codec);
> >       alc_update_gpio_data(codec, mask, !enabled); /* muted -> LED on */
> > +     snd_hda_power_down_pm(codec);
> >  }
> >
> >  /* turn on/off mute LED via GPIO per vmaster hook */
> > @@ -4287,8 +4290,10 @@ static void alc_update_coef_led(struct hda_codec *codec,
> >       if (polarity)
> >               on = !on;
> >       /* temporarily power up/down for setting COEF bit */
> > +     snd_hda_power_up_pm(codec);
> >       alc_update_coef_idx(codec, led->idx, led->mask,
> >                           on ? led->on : led->off);
> > +     snd_hda_power_down_pm(codec);
> >  }
> >
> >  /* update mute-LED according to the speaker mute state via COEF bit */
> > --
> > 2.29.2
> >
