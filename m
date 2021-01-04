Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEED2E919B
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jan 2021 09:17:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8CB7166B;
	Mon,  4 Jan 2021 09:16:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8CB7166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609748264;
	bh=UmuQit6Mvkub/CxGVA+ky8L3/W6bBFJZYgJqNqxQiro=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RrpzINRIXfjTUEpKmxpodQTA8QBKfOiSU199J4opap0slzPODgDWDmHIBrYZYC5F1
	 xnQRNuit+Ls06Xfaf7shI+3F2greAgamT+TKOgf7nS6Yw9NOi8dJKuWJLAWhe6YR1x
	 Ype5pfwhhlBHb4uLHdjXrPhQXux5YhDpMBpQixHc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DD9AF80166;
	Mon,  4 Jan 2021 09:16:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6055F80167; Mon,  4 Jan 2021 09:15:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 009B8F80165
 for <alsa-devel@alsa-project.org>; Mon,  4 Jan 2021 09:15:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 009B8F80165
Received: from mail-oi1-f198.google.com ([209.85.167.198])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1kwL1i-0001HV-7Q
 for alsa-devel@alsa-project.org; Mon, 04 Jan 2021 08:15:42 +0000
Received: by mail-oi1-f198.google.com with SMTP id j25so20560110oie.12
 for <alsa-devel@alsa-project.org>; Mon, 04 Jan 2021 00:15:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R6nqnTM+ujmxlgjwGvBpR5yONq8+2Nvfgjpa+0ulriU=;
 b=sXZZIf/wDL30rh7BdmZckgk5qJrPQcqWI9mUCnBdO7tu11x/lZStnklznAWhOr8O0Q
 B6JSuF56goc0kq2FNsRnfuFbSZ+gM9CNKLQubqro03trlTK9s/W+fT5avD9JiEMJmF7D
 7B2RqXaX86mFff6sj75Eq643YUMJv5RLO8sbhK/L6IKJc3SecaYh9KkaEa2fxtluf9Sy
 iG+CmObAqBhgXv1xF4QH68bMBTy0t7IHPHdXCjft/IJqPhUEmAY/L4kY4zoFtY52aPiN
 sLB5sIkxAV4Rh6/nTkWtsR+gt/BDe3PLBMD9BQgo1oUFrt2vy1/LcNDAKXnX8it1Eo15
 6uiQ==
X-Gm-Message-State: AOAM531+Tm1WZo6pHrlIdD3UbC/2TenYu+xRwEZVqPRlqacXloSVcZrZ
 HAKdvcaJ+3/lIznJYky1Pq3vss5x4SCtKzdk+K3UAGT0L6XGHcrn2ZBVv8c+KTpw96An4MgsnH9
 vjFPHTpayxxYCta8mMlx2ZDSUbP5EGi8TC6iJjk9IJWFWDrAVTgi5Mobh
X-Received: by 2002:a9d:4816:: with SMTP id c22mr49518001otf.358.1609748141223; 
 Mon, 04 Jan 2021 00:15:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJznzVsJM7hEPKoepjCa/BnR/MmTOPrGUy7hOexPPjjxu4Y5y8KLmh34CeekI7i0+XEYbZ1hm8LQ1uU5cX5sTpE=
X-Received: by 2002:a9d:4816:: with SMTP id c22mr49517972otf.358.1609748140795; 
 Mon, 04 Jan 2021 00:15:40 -0800 (PST)
MIME-Version: 1.0
References: <20201229133817.190160-1-kai.heng.feng@canonical.com>
 <20201229133817.190160-2-kai.heng.feng@canonical.com>
 <s5hr1n6b5yp.wl-tiwai@suse.de>
 <CAAd53p77EGZqFcMrDSNQU+TkdWMgath7+M-41hwn5WOhDpZqcg@mail.gmail.com>
 <s5ha6ttaxmy.wl-tiwai@suse.de>
In-Reply-To: <s5ha6ttaxmy.wl-tiwai@suse.de>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Mon, 4 Jan 2021 16:15:28 +0800
Message-ID: <CAAd53p5d2jOEo=udVB58FjcTGJHGHs7ovH0B-gjwuas-L6Y4rQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: SOF: Intel: hda: Avoid checking jack on system
 suspend
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Keyon Jie <yang.jie@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Payal Kshirsagar <payalskshirsagar1234@gmail.com>, daniel.baluta@nxp.com,
 Marcin Rajwa <marcin.rajwa@linux.intel.com>,
 "moderated list:SOUND - SOUND OPEN FIRMWARE \(SOF\) DRIVERS"
 <sound-open-firmware@alsa-project.org>
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

On Fri, Jan 1, 2021 at 4:07 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Thu, 31 Dec 2020 19:06:43 +0100,
> Kai-Heng Feng wrote:
> >
> > On Thu, Dec 31, 2020 at 6:55 PM Takashi Iwai <tiwai@suse.de> wrote:
> > >
> > > On Tue, 29 Dec 2020 14:38:15 +0100,
> > > Kai-Heng Feng wrote:
> > > >
> > > > System takes a very long time to suspend after commit 215a22ed31a1
> > > > ("ALSA: hda: Refactor codec PM to use direct-complete optimization"):
> > > > [   90.065964] PM: suspend entry (s2idle)
> > > > [   90.067337] Filesystems sync: 0.001 seconds
> > > > [   90.185758] Freezing user space processes ... (elapsed 0.002 seconds) done.
> > > > [   90.188713] OOM killer disabled.
> > > > [   90.188714] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
> > > > [   90.190024] printk: Suspending console(s) (use no_console_suspend to debug)
> > > > [   90.904912] intel_pch_thermal 0000:00:12.0: CPU-PCH is cool [49C], continue to suspend
> > > > [  321.262505] snd_hda_codec_realtek ehdaudio0D0: Unable to sync register 0x2b8000. -5
> > > > [  328.426919] snd_hda_codec_realtek ehdaudio0D0: Unable to sync register 0x2b8000. -5
> > > > [  329.490933] ACPI: EC: interrupt blocked
> > > >
> > > > That commit keeps codec suspended during the system suspend. However,
> > > > SOF driver's runtime resume, which is for system suspend, calls
> > > > hda_codec_jack_check() and schedules jackpoll_work. The jackpoll
> > > > work uses snd_hda_power_up_pm() which tries to resume the codec in
> > > > system suspend path, hence blocking the suspend process.
> > > >
> > > > So only check jack status if it's not in system PM process.
> > >
> > > After your previous patch set, the legacy HDA does queue the
> > > jackpoll_work only if jackpoll_interval is set.  I suppose rather the
> > > same rule would be applied?
> >
> > It's queued in hda_codec_pm_complete(), which happens at the end of PM process.
> > This one is queued in the middle of PM suspend, so it's not the same here.
>
> But why do we need the jack status check explicitly there if
> hda_codec_pm_complete() already does it (via re-queuing the resume)?

Because hda_resume() is called for both system and runtime resume, but
hda_codec_pm_complete() only gets called for system resume. So we
still need to cover the runtime resume case.

However, we can use pm_request_resume() to wakeup the codec and do the
jack detection, instead of queueing jackpoll_work directly. I'll do
the change in v2.

Kai-Heng

>
> thanks,
>
> Takashi
>
> >
> > Kai-Heng
> >
> > >
> > >
> > > thanks,
> > >
> > > Takashi
> > >
> > > >
> > > > Fixes: 215a22ed31a1 ("ALSA: hda: Refactor codec PM to use direct-complete optimization")
> > > > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > > > ---
> > > >  sound/soc/sof/intel/hda-dsp.c | 3 ++-
> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
> > > > index 7d00107cf3b2..1c5e05b88a90 100644
> > > > --- a/sound/soc/sof/intel/hda-dsp.c
> > > > +++ b/sound/soc/sof/intel/hda-dsp.c
> > > > @@ -685,7 +685,8 @@ static int hda_resume(struct snd_sof_dev *sdev, bool runtime_resume)
> > > >       /* check jack status */
> > > >       if (runtime_resume) {
> > > >               hda_codec_jack_wake_enable(sdev, false);
> > > > -             hda_codec_jack_check(sdev);
> > > > +             if (sdev->system_suspend_target == SOF_SUSPEND_NONE)
> > > > +                     hda_codec_jack_check(sdev);
> > > >       }
> > > >
> > > >       /* turn off the links that were off before suspend */
> > > > --
> > > > 2.29.2
> > > >
> >
