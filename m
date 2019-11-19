Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C6F102E73
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Nov 2019 22:45:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C32051694;
	Tue, 19 Nov 2019 22:44:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C32051694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574199948;
	bh=ayAiEDVfFDfiLS1EajCfyy0Rzpw0ask3aR3VDWbrqP8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LoVjtP4xqKw+2Tc7LzQEywx96655otT9rUZQ3S9fTWT6svwj7gYSdWdRtgSsctzvN
	 S1hHUHz91uLm+lKzykUML1PO2ZLtqXLM8yx5uRA6eI7vsJDoa7d63eB7Vs0EA/f0LG
	 JFLbqsRZGzbPQ8aZq2jJ0KQQNSK8IVZ0uqNW2iLY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21BA8F80145;
	Tue, 19 Nov 2019 22:44:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4219FF80138; Tue, 19 Nov 2019 22:44:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF101F800FF
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 22:43:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF101F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="Rw9KREUS"
Received: by mail-io1-xd41.google.com with SMTP id i11so1452170iol.13
 for <alsa-devel@alsa-project.org>; Tue, 19 Nov 2019 13:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lb9MwoSdjhF5GYwGkI2XXEUP6MKU9g08lmNwzz1XWr8=;
 b=Rw9KREUSr24SjaLraFQ6WasO9Ah4dIqY+B1EdmllvrXpGkMKua9Ljqd1EczJ32Z+TQ
 nhcEl7XEw/meLOeo7gC3XSFcSb9aiHSCZ2Vh76kL8B/s2SZLspEwb2SBqDHZeFYWjvTk
 ZbCsZuvwyqX59EvmUemko3+h+6nowdtPw+6K5sJLZgK5OXWnN72dfZopEdXL7vm8KBsC
 hGIZnf6p8S5NpoN6uTS1enimIhzx8uSm5z/qhYorOwGFgzSZjSweArjBXzxLC8E9Q46w
 c11rThJWYyKGXGLYwd3Lnqmf/cSXccLzfNAolqehdh+JpCw6xPMwQODS6Y3JhMEzjzTa
 pTdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lb9MwoSdjhF5GYwGkI2XXEUP6MKU9g08lmNwzz1XWr8=;
 b=bIjguWMRnzvHF+O5qBk5mIpJRXX60wJEIwANWpY0s3p6dbaXUrwUeFN7LcMLli7S5h
 Cip/VV9ppalWxJRwKly2PBEK9/7jPLkn03FY8qYmaXFJCbFA2OEFCqDdjZnGMjYTYdPB
 MGiqnYkjVt8wGpG2Zyrat+n82Pnv/MBeeUQsLZsayaEnmmh1T0Xy/eG8crZcUSSqVKTp
 xuvI6Ktf0xD1rIvPxcDNhs7RK7On5xdzLGZpz12D39krfNBZTu7GJ0EmiKcu64HVfZq2
 9GUTL0H6vsivbMzKEj8Zse4NngS//oecXl/1q3ItakBkIA7PXl3U32S495CJkRnq/0lr
 /nPA==
X-Gm-Message-State: APjAAAUkZ4DFoflJzH5bHe8DfLDu29H6Xg6rXb25tkBy88OI0rD9dUyD
 TAAIcNwaghYHBUtx/8b1kIio5a4eNf9n25B8TtN9uQ==
X-Google-Smtp-Source: APXvYqxu9ZIO8F5T2zvZG1N/xFRpNshU/RDDgLm4xFUws6igKebwTcffxi2DsvEMQ0sCYtFFVdp1BYXSgmFVQuEnCTw=
X-Received: by 2002:a05:6638:8c:: with SMTP id v12mr86182jao.122.1574199835805; 
 Tue, 19 Nov 2019 13:43:55 -0800 (PST)
MIME-Version: 1.0
References: <20191117085308.23915-1-tiwai@suse.de>
 <20191117085308.23915-8-tiwai@suse.de>
 <3b407a02-b791-52a4-2335-e21d8ab732dd@linux.intel.com>
 <s5hy2wdyq3t.wl-tiwai@suse.de>
 <CAFQqKeWgqHwrCSSbLrkuCHkBww2g4dsBcF93SDN_ZK_-KSe5tg@mail.gmail.com>
 <s5hpnhpyng6.wl-tiwai@suse.de>
 <CAFQqKeWPgPWpDgZUPvOqSFUY2Zq=8zW-=LhYimtg0S0Hqpc43A@mail.gmail.com>
 <s5hmucszzni.wl-tiwai@suse.de>
 <3fc820272992362a56881abf7230f1500fdfdd2a.camel@linux.intel.com>
 <s5hblt8z7ow.wl-tiwai@suse.de>
 <030249cd63d754bd70ce5de5c58e04784eecebff.camel@linux.intel.com>
 <s5hv9rgxohq.wl-tiwai@suse.de>
 <ce61828881dea0fffd2c26a92ad2571ab3565404.camel@linux.intel.com>
 <s5hy2wbwo8c.wl-tiwai@suse.de>
In-Reply-To: <s5hy2wbwo8c.wl-tiwai@suse.de>
From: "Sridharan, Ranjani" <ranjani.sridharan@intel.com>
Date: Tue, 19 Nov 2019 13:43:43 -0800
Message-ID: <CAFQqKeVsQ1AjjKgS-HJ0-mg7JbbmMVjJcUB7wbvsbyz9e2TqLg@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 7/8] ALSA: pcm: Add card sync_irq field
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

On Tue, Nov 19, 2019 at 1:28 PM Takashi Iwai <tiwai@suse.de> wrote:

> On Tue, 19 Nov 2019 17:36:46 +0100,
> Ranjani Sridharan wrote:
> >
> > On Tue, 2019-11-19 at 09:24 +0100, Takashi Iwai wrote:
> > > On Tue, 19 Nov 2019 08:40:25 +0100,
> > > Ranjani Sridharan wrote:
> > > >
> > > > > >
> > > > > > Hi Takashi,
> > > > > >
> > > > > > I just realized that In the SOF driver, we only set the
> > > > > > component
> > > > > > driver ops. The pcm ops are set when creating the new pcm. So,
> > > > > > should I
> > > > > > also add the sync_stop op in the component driver and set the
> > > > > > pcm
> > > > > > sync_stop op to point to the component sync_stop op? Just
> > > > > > wanted to
> > > > > > confirm if I am on the right track.
> > > > >
> > > > > Yes, I didn't touch this yet, but that's the way to go I suppose.
> > > > > One caveat is that this ops is optional and needs NULL as
> > > > > default,
> > > > > hence you'd need to set only when defined, like copy_user, page
> > > > > or
> > > > > mmap ops, at least.
> > > >
> > > > Hi Takashi,
> > > >
> > > > This is what I tried in the SOF driver:
> > > > https://github.com/thesofproject/linux/pull/1513/commits
> > > >
> > > > And it seems to cause the system to hang when I stop the stream and
> > > > I
> > > > have no meaningful logs to pinpoint to the problem. Could you
> > > > please
> > > > have a look at the 4 commits that I have added to your series and
> > > > let
> > > > me know what I could be missing?
> > >
> > > I couldn't find anything obvious.  Could you try without changing
> > > snd_sof_pcm_period_elapsed(), i.e. only adding the stuff and calling
> > > sync_stop, in order to see whether the additional stuff broke
> > > anything?
> > It is indeed the removal of snd_sof_pcm_period_elapsed() that makes the
> > device hang when the stream is stoppped. But that's a bit surprising
> > given that all I tried was using the snd_pcm_period_elapsed() directly
> > instead of scheduling the delayed work to call it.
>
> If I read the code correctly, this can't work irrelevantly from the
> sync_stop stuff.  The call of period_elapsed is from
> hda_dsp_stream_check() which is performed in bus->reg_lock spinlock in
> hda_dsp_stream_threaded_handler().  Meanwhile, the XRUN trigger goes
> to hda_dsp_pcm_trigger() that follows hda_dsp_stream_trigger(), and
> this function expects the sleepable context due to
> snd_sof_dsp_read_poll_timeout() call.
>
> So something like below works?
>
>
> Takashi
>
> --- a/sound/soc/sof/intel/hda-stream.c
> +++ b/sound/soc/sof/intel/hda-stream.c
> @@ -592,8 +592,11 @@ static bool hda_dsp_stream_check(struct hdac_bus
> *bus, u32 status)
>                                 continue;
>
>                         /* Inform ALSA only in case not do that with IPC */
> -                       if (sof_hda->no_ipc_position)
> -                               snd_sof_pcm_period_elapsed(s->substream);
> +                       if (sof_hda->no_ipc_position) {
> +                               spin_unlock_irq(&bus->reg_lock);
> +                               snd_pcm_period_elapsed(s->substream);
> +                               spin_lock_irq(&bus->reg_lock);
>
Thanks, Takashi. Yes, I realized it this morning as well that it is due to
the reg_lock. It does work with this change now. I will run some stress
tests with this change and get back with the results.

Thanks,
Ranjani
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
