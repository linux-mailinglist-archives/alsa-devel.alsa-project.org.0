Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D52E82EAC29
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Jan 2021 14:45:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F3AD169A;
	Tue,  5 Jan 2021 14:44:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F3AD169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609854318;
	bh=EiuoZfhXsqgKt5omLL6GGtbH9zsizSgQXK7RGIvfpkk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=isbR3bgEeBN+3fUs+0VNrPKCIuiyye15eFfa1taQvYxklV+lHnyMaLsl5D4w83IqD
	 /7eowfy+13CH0afaphgdbJ4WEHKwwo8cTSWqoETqvmuIkPBSj1d+nzQ9bzV0BzP7ZZ
	 I0/59KQnvKfmImusa0BY4m11+3o6O5fzzG+r6qKQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5711BF8015B;
	Tue,  5 Jan 2021 14:43:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9ABE2F8027D; Tue,  5 Jan 2021 14:43:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF3B5F80271;
 Tue,  5 Jan 2021 14:43:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF3B5F80271
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mC+Xo8Yb"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 11BB022BF3;
 Tue,  5 Jan 2021 13:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609854214;
 bh=EiuoZfhXsqgKt5omLL6GGtbH9zsizSgQXK7RGIvfpkk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mC+Xo8YbPCV+2rl6EA8BrpjyZIcJirSwv5a1LKmf7iCBWXRHNSyMRJLqRBkcYDKsY
 tIf8T3f5YIqad2P3A5k3wjACrntdny7rlzk7cOd88QiEeUiikNVxYjirlkxE+wD7Rs
 h7ULwFKKaf73POnaGEQyPVhqKnjIIx1nfGWHQgv0fdUmELhK5OQEEuZMPBxVrWWRFS
 ouzXsPnC9S6l+wKvztYQt4n/IbV6vAVTLs25PobNRshU11zP2zIAEcJiKBnlYggVzO
 Kvqpcv2CJiPDKuzfITyPPXGAayxrhH2WErKQ8AkEaF/J3RtTLDn6ve/fVt0UNXqeOM
 dufk1cG434H9g==
Received: by mail-ot1-f41.google.com with SMTP id a109so29273297otc.1;
 Tue, 05 Jan 2021 05:43:34 -0800 (PST)
X-Gm-Message-State: AOAM5335EamA1Gy5bBner0P0K4hT5FQvSQdV1nd6MDv9pgxi/Gkydnmt
 kuTTdZ22U2DGUJpB6WYiBkGy3WCw0BK4JJ99FNM=
X-Google-Smtp-Source: ABdhPJzO01xuMyg90ioZEwJ1xUG44ShymQlC2JBZNSSKovRByhT+UIeWN7gbxD3FYJPhvU28mpdriKAGBKxdzLErsMo=
X-Received: by 2002:a05:6830:2413:: with SMTP id
 j19mr58181727ots.251.1609854213337; 
 Tue, 05 Jan 2021 05:43:33 -0800 (PST)
MIME-Version: 1.0
References: <20210103135257.3611821-1-arnd@kernel.org>
 <3c19a5d5-8883-f917-a96a-f51bb188d115@perex.cz>
 <s5hble491zu.wl-tiwai@suse.de>
In-Reply-To: <s5hble491zu.wl-tiwai@suse.de>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 5 Jan 2021 14:43:17 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1FZSfzu3TA6VMhqP+3H5OD3+BhH5W=vVYEkL+ExHqpMQ@mail.gmail.com>
Message-ID: <CAK8P3a1FZSfzu3TA6VMhqP+3H5OD3+BhH5W=vVYEkL+ExHqpMQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda: fix SND_INTEL_DSP_CONFIG dependency
To: Takashi Iwai <tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, sound-open-firmware@alsa-project.org
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

On Mon, Jan 4, 2021 at 4:05 PM Takashi Iwai <tiwai@suse.de> wrote:
> On Mon, 04 Jan 2021 16:00:05 +0100, Jaroslav Kysela wrote:
> >
> > Dne 03. 01. 21 v 14:52 Arnd Bergmann napsal(a):
> > > From: Arnd Bergmann <arnd@arndb.de>
> > >
> > > The sof-pci-dev driver fails to link when built into the kernel
> > > and CONFIG_SND_INTEL_DSP_CONFIG is set to =m:
> > >
> > > arm-linux-gnueabi-ld: sound/soc/sof/sof-pci-dev.o: in function `sof_pci_probe':
> > > sof-pci-dev.c:(.text+0x1c): undefined reference to `snd_intel_dsp_driver_probe'
> > >
> > > All other drivers using this interface already use a 'select
> > > SND_INTEL_DSP_CONFIG' statement to force the it to be present, so it
> > > seems reasonable to do the same here.
> > >
> > > The stub implementation in the header makes the problem harder to find,
> > > as it avoids the link error when SND_INTEL_DSP_CONFIG is completely
> > > disabled, without any obvious upsides. Remove these stubs to make it
> > > clearer that the driver is in fact needed here.
> > >
> > > Fixes: 82d9d54a6c0e ("ALSA: hda: add Intel DSP configuration / probe code")
> > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > > ---
> > >  include/sound/intel-dsp-config.h | 17 -----------------
> > >  sound/soc/sof/Kconfig            |  2 ++
> > >  2 files changed, 2 insertions(+), 17 deletions(-)
> > >
> > > diff --git a/include/sound/intel-dsp-config.h b/include/sound/intel-dsp-config.h
> > > index d4609077c258..94667e870029 100644
> > > --- a/include/sound/intel-dsp-config.h
> > > +++ b/include/sound/intel-dsp-config.h
> > > @@ -18,24 +18,7 @@ enum {
> > >     SND_INTEL_DSP_DRIVER_LAST = SND_INTEL_DSP_DRIVER_SOF
> > >  };
> > >
> > > -#if IS_ENABLED(CONFIG_SND_INTEL_DSP_CONFIG)
> >
> > The SOF drivers selects the DSP config code only when required (for specific
> > platforms - see sound/soc/sof/intel/Kconfig).
> >
> > It seems that the above if should be modified as:
> >
> > #if IS_BUILDIN(CONFIG_SND_INTEL_DSP_CONFIG) || (defined(MODULE) &&
> > IS_MODULE(CONFIG_SND_INTEL_DSP_CONFIG))
> >
> > So the buildin drivers which do not require the DSP config probe can be
> > compiled without this dependency.
>
> As I wrote in another post, a part of the problem is that SOF PCI and
> ACPI drivers call snd_intel_dsp_driver_probe() unconditionally, even
> if no Intel driver is bound.

Makes sense. Is there an existing Kconfig that could be used to
decide whether the drivers use SND_INTEL_DSP_CONFIG or not?
Could it be part of the device specific driver_data?

According to sof_pci_ids[], all PCI IDs are Intel specific, but I can't
tell which ones need the DSP config.

> So even if changing like the above (or
> better to use IS_REACHABLE() macro) works around the issue, the call
> pattern needs to be reconsidered.

If the callers are fixed to address this, then I would expect the
IS_REACHABLE() or IS_ENABLED() to no longer be needed
either.

       Arnd
