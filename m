Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C21AE4F2
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Sep 2019 09:54:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E85F4166B;
	Tue, 10 Sep 2019 09:53:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E85F4166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568102060;
	bh=GzOHn6QmeA2mP9cObaV8B1srLHH2pmph06keFn4dHMs=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JbZ30sRXYwTQUMw8SnWsiXJVPW/WtLA9ZKs63TZtCo9dTeibE6/fPTZC7av/3gpAK
	 jysNpslfWs2SL0/ulvH4BESxfWpkt3mjIxEUah78lML2BMET1pD8isKk2pn7N+Sm8s
	 mzC9WyAJD/3t02kp0LQCydGFAr4zJLJztw00WKPA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 693F9F80393;
	Tue, 10 Sep 2019 09:52:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B2FFF80368; Tue, 10 Sep 2019 09:52:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
 FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64334F800C9
 for <alsa-devel@alsa-project.org>; Tue, 10 Sep 2019 09:52:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64334F800C9
Received: by mail-qk1-f196.google.com with SMTP id y144so7971277qkb.7
 for <alsa-devel@alsa-project.org>; Tue, 10 Sep 2019 00:52:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u9GytuQLzyYATbhV+IjgAeDxZXKzpVILhMpRGkoLMn0=;
 b=EftAfQ5LgFBjNWYPYqqkdSNw/bC4ltFpA1SYZN66+hpISBuaixxvpBgLqn1Lh85UU/
 LyU5ePxXwP4D+RoskgL2B0UeGaj1kIxBzV5w6mI9OAZvkGKdysReNFHrb6IkGeapAi71
 LLPxLYnNGee0JVX5l2qQKABjWU/Lac1gRgy5zFg1PdkQ0rgfRRzpht3oYgNeotE0efIx
 wQxVFW01tjJMS5mr4g4c+YG+eY3sYEWPpY1NMkaNWTWfsE7FHZWYb6C4fLrIsQQ8GwuK
 F8dygSaaOhU8CMk2IUt5P91KPVI72YLLIwPYWbhLF58V/PokWKvyTIODocfjKRZN8urL
 HpXw==
X-Gm-Message-State: APjAAAWhx6puCK5VRi/9ZFKHMcA/E0wSxkNBJ2CeU+HZg30jAWlCNI/g
 lmu3tV1C0Qnyc7oxj6MFJOsP7jTLwvTuMy/osnc=
X-Google-Smtp-Source: APXvYqxln7Q1Hrqv0ev3shLxwwtKOqlgoIIxBQOyHa8+xJM7nUB9taTaEV46rFMYCch7AxGOs2gefPx1RVZCtak+A8o=
X-Received: by 2002:ae9:ee06:: with SMTP id i6mr7307279qkg.3.1568101949751;
 Tue, 10 Sep 2019 00:52:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190909195159.3326134-1-arnd@arndb.de>
 <3b69e0ec-63cb-4888-9faa-acb7638d71dc@linux.intel.com>
 <CAK8P3a0WDB_UvAnwfPDyR_maEefE4Qh++fHxAP61=8JfOFmy6w@mail.gmail.com>
 <s5hef0oaav5.wl-tiwai@suse.de>
In-Reply-To: <s5hef0oaav5.wl-tiwai@suse.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 10 Sep 2019 09:52:13 +0200
Message-ID: <CAK8P3a2-gMbuN-17MC6ZsDwvPGCHmbJojKYGnrUshxhazATPRg@mail.gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Pan Xiuli <xiuli.pan@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Evan Green <evgreen@chromium.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: SOF: Intel: work around
 snd_hdac_aligned_read link failure
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

On Tue, Sep 10, 2019 at 9:06 AM Takashi Iwai <tiwai@suse.de> wrote:
> On Mon, 09 Sep 2019 22:51:23 +0200, Arnd Bergmann wrote:
> >
> > On Mon, Sep 9, 2019 at 10:39 PM Pierre-Louis Bossart
> > <pierre-louis.bossart@linux.intel.com> wrote:
> > >
> > > On 9/9/19 2:51 PM, Arnd Bergmann wrote:
> > > > When CONFIG_SND_HDA_ALIGNED_MMIO is selected by another driver
> > > > (i.e. Tegra) that selects CONFIG_SND_HDA_CORE as a loadable
> > > > module, but SND_SOC_SOF_HDA_COMMON is built-in, we get a
> > > > link failure from some functions that access the hda register:
> > > >
> > > > sound/soc/sof/intel/hda.o: In function `hda_ipc_irq_dump':
> > > > hda.c:(.text+0x784): undefined reference to `snd_hdac_aligned_read'
> > > > sound/soc/sof/intel/hda-stream.o: In function `hda_dsp_stream_threaded_handler':
> > > > hda-stream.c:(.text+0x12e4): undefined reference to `snd_hdac_aligned_read'
> > > > hda-stream.c:(.text+0x12f8): undefined reference to `snd_hdac_aligned_write'
> > > >
> > > > Add an explicit 'select' statement as a workaround. This is
> > > > not a great solution, but it's the easiest way I could come
> > > > up with.
> > >
> > > Thanks for spotting this, I don't think anyone on the SOF team looked at
> > > this. Maybe we can filter with depends on !TEGRA or
> > > !SND_HDA_ALIGNED_MMIO at the SOF Intel top-level instead?
> >
> > That doesn't sound much better than my approach, but could also work.
> > One idea that I had but did not manage to implement was to move out
> > the snd_hdac_aligned_read/write functions from the core hda code
> > into a separate file. I think that would be the cleanest solution,
> > as it decouples the problem from any drivers.
>
> Yeah, that's a tricky problem because of the reverse-selection, as
> usual...
>
> Another solution would be to just avoid byte/word access but use only
> long access, i.e. replace snd_hdac_chip_readb() with
> snd_hdac_chip_readl() with the aligned register and bit shift.
> The aligned access helper is needed only for the register that isn't
> aligned with 4 bytes offset.

Ok, so basically open-coding the aligned access to RIRBSTS?
That sounds like a much nicer workaround. So in place of

                        sd_status = snd_hdac_stream_readb(s, SD_STS);
                        dev_vdbg(bus->dev, "stream %d status 0x%x\n",
                                 s->index, sd_status);
                        snd_hdac_stream_writeb(s, SD_STS, sd_status);

I suppose one could just readl/writel SOF_HDA_ADSP_REG_CL_SD_CTL
and print the shifted value, right?

While I know nothing about the underlying requirements, I wonder
about two things that stick out to me:

1. the existing code just writes back the same byte it has read. If
    this write has no side-effects, why write it at all? OTOH, if it has
    side-effects, isn't the aligned implementation of writing the whole
    word in snd_hdac_aligned_write()  fundamentally flawed?

2. Doesn't the read-modify-write cycle in snd_hdac_aligned_write()
   need locking to work correctly?

          Arnd
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
