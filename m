Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F62D2DCD9A
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Dec 2020 09:27:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1EA61814;
	Thu, 17 Dec 2020 09:26:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1EA61814
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608193669;
	bh=SAvb2i89VFBE1usJaP3sthE+QpuqYJRPtjsrDCrEikA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WHe/NrlpZVtBF1N4L3PXbOmKOASzb/+SC/0/a6EdaA1zQabGN0fjo4ObzCRLMdDSS
	 zBmqRLnPXycdadZOGLCEyJOeYycSEGpNCRRsJ8v/03+IUcEAaxb9hB8SI9Pg3dCu+K
	 qR/+rEj8QEE0R+NpLC37fCWxv+kaf18xeSCNRubs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2495AF80278;
	Thu, 17 Dec 2020 09:26:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6D3FF80278; Thu, 17 Dec 2020 09:26:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6D80F8014B
 for <alsa-devel@alsa-project.org>; Thu, 17 Dec 2020 09:26:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6D80F8014B
Received: from mail-lf1-f72.google.com ([209.85.167.72])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1kpobs-0000HO-MT
 for alsa-devel@alsa-project.org; Thu, 17 Dec 2020 08:26:04 +0000
Received: by mail-lf1-f72.google.com with SMTP id h64so15239036lfd.18
 for <alsa-devel@alsa-project.org>; Thu, 17 Dec 2020 00:26:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=318flit9Dm+ZwsHBDY7shbWO6DQaalLU5o16lN0/k+U=;
 b=ffOB/VmuJ0nF0AF+TwjueW4GOFsPJmO4ahNKfFMILBzFstmG048ju8ePv2xIShcWfC
 QxZNC4l6FixWhmEDJA3uCY+BaEv94UYnOFZVRc6RXrnMOc19R9NXsejl/aShSvpvu+42
 KkhkTTudGBKBH61bf+mMccBy04kzdmnUCepnZM9di3P6/nkntNGGPOGCH6PUSulVGGUD
 Gwzlo43J7lty8pvV8pC20R3ZFkcSFlGWornVjY0ZwqzplsfECUgdgLCUyHTvZIgb5W4U
 xzTECyw8IE7YLronkXs0kgiwCZA3fvOFK3r4c+wHh38HoZOzEOyq5OZYGjEf+bKeWFvw
 hk6Q==
X-Gm-Message-State: AOAM531qp4NFE6KIXa9Fv47ASRJQgEynnJXnzTadCWP1PYd9umk55WGT
 3L4IYR6NfXBVmWSUgAcjaoypQs4YHCnjbfHNtP3eJPsGrl6K02wAkiISx7s6FVXpHOhqg2VVkDB
 snLPiw9jBXVwfFrWZSC+ACfMvgJyiisN/iw/79OtlcRmGd6XkhxGp8iA+
X-Received: by 2002:a05:651c:315:: with SMTP id
 a21mr17032010ljp.403.1608193563678; 
 Thu, 17 Dec 2020 00:26:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzhFrRf6UZVnoJlLr9hyrXGQDi91dpC6tfJWsCAC/pUeFSXse5WDsBfRiK+cjSJG6xE+5neUWUXVlEKQiLGi/M=
X-Received: by 2002:a05:651c:315:: with SMTP id
 a21mr17032005ljp.403.1608193563311; 
 Thu, 17 Dec 2020 00:26:03 -0800 (PST)
MIME-Version: 1.0
References: <9I9CLQ.GP190FSJBRXK3@canonical.com>
 <f05cb5ff-b5b1-2882-ba4a-380e696b2569@linux.intel.com>
 <J74DLQ.CON4PD1O51YN@canonical.com>
 <47ec2533-584c-d7f3-4489-e3a043e658e1@linux.intel.com>
 <c3989d32-2949-048d-5fa2-8e586a17677c@linux.intel.com>
 <CAAd53p4Fh5LEEyg478GUS9O+zPPvb65jVWj3YYRt6GFkP-jaJQ@mail.gmail.com>
 <1afda15d-1ea7-3a8f-6dcc-37f747ff7bac@linux.intel.com>
 <CAAd53p7=kHLsZcNNy3AH8Y08=50Y4sVs_PMTDimRCY9ZOC3gsQ@mail.gmail.com>
In-Reply-To: <CAAd53p7=kHLsZcNNy3AH8Y08=50Y4sVs_PMTDimRCY9ZOC3gsQ@mail.gmail.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Thu, 17 Dec 2020 16:25:52 +0800
Message-ID: <CAAd53p7Fn-kO67RVd8K4WoLqkOhc_qWhKO5BdATDJMcJkBNRGg@mail.gmail.com>
Subject: Re: [Sound-open-firmware] SoF support for 8086:9d71?
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Cc: SOUND <alsa-devel@alsa-project.org>, sound-open-firmware@alsa-project.org,
 =?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
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

On Wed, Dec 16, 2020 at 11:55 AM Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
>
> On Wed, Dec 16, 2020 at 1:59 AM Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> wrote:
> >
> >
> >
> > >>> Something's not adding up here.
> > >>
> > >> Seems like you can enable CONFIG_SND_SOC_INTEL_KBL (and all other
> > >> platforms), without enabling CONFIG_SND_SOC_INTEL_SKYLAKE, which enables
> > >> building of snd_soc_skl module... I would say that there is something
> > >> wrong with module dependencies in Kconfig :/
> >
> > rather the Makefile is wrong, see below.
> >
> > >
> > > Yes that's exactly what happened here.
> > > So I wonder why we need to separate CONFIG_SND_SOC_INTEL_SKYLAKE from
> > > other configs...
> > >
> > >> Will look at it tomorrow. In the meantime any chance we can get the
> > >> config which was used, to confirm my suspicion?
> > >
> > > Ubuntu 5.8 kernel has this:
> > > # CONFIG_SND_SOC_INTEL_SKYLAKE is not set
> > > CONFIG_SND_SOC_INTEL_SKL=m
> > > CONFIG_SND_SOC_INTEL_APL=m
> > > CONFIG_SND_SOC_INTEL_KBL=m
> > > CONFIG_SND_SOC_INTEL_GLK=m
> > > # CONFIG_SND_SOC_INTEL_CNL is not set
> > > # CONFIG_SND_SOC_INTEL_CFL is not set
> > > # CONFIG_SND_SOC_INTEL_CML_H is not set
> > > # CONFIG_SND_SOC_INTEL_CML_LP is not set
> > > CONFIG_SND_SOC_INTEL_SKYLAKE_FAMILY=m
> > > CONFIG_SND_SOC_INTEL_SKYLAKE_SSP_CLK=m
> > > # CONFIG_SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC is not set
> >
> > that would be needed to support DMIC+HDaudio platforms (with the
> > Connexant restriction).
>
> So should I enable this option? Is it safe for platforms with Connexant codec?
>
> >
> > > CONFIG_SND_SOC_INTEL_SKYLAKE_COMMON=m
> > >
> > > So I guess we can do something like this?
> > > diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
> > > index 1c5114dedda9..c8142520532e 100644
> > > --- a/sound/hda/intel-dsp-config.c
> > > +++ b/sound/hda/intel-dsp-config.c
> > > @@ -417,7 +417,7 @@ int snd_intel_dsp_driver_probe(struct pci_dev *pci)
> > >                          return SND_INTEL_DSP_DRIVER_SOF;
> > >          }
> > >
> > > -
> > > +#if IS_REACHABLE(CONFIG_SND_SOC_INTEL_SKYLAKE)
> > >          if (cfg->flags & FLAG_SST) {
> > >                  if (cfg->flags & FLAG_SST_ONLY_IF_DMIC) {
> > >                          if (snd_intel_dsp_check_dmic(pci)) {
> > > @@ -428,6 +428,7 @@ int snd_intel_dsp_driver_probe(struct pci_dev *pci)
> > >                          return SND_INTEL_DSP_DRIVER_SST;
> > >                  }
> > >          }
> > > +#endif
> > >
> > >          return SND_INTEL_DSP_DRIVER_LEGACY;
> > >   }
> > >
> > > Kai-Heng
> >
> > Can you try this instead, the dependencies are indeed wrong in the Makefile:
>
> Ok, compiling a kernel for user to test...

Well, this happens:
ERROR: modpost: "skl_dsp_set_dma_control"
[sound/soc/intel/skylake/snd-soc-skl-ssp-clk.ko] undefined!
make[1]: *** [scripts/Makefile.modpost:111: sound/Module.symvers] Error 1
make[1]: *** Deleting file 'sound/Module.symvers'
make: *** [Makefile:1709: modules] Error 2

Kai-Heng

>
> Kai-Heng
>
> >
> > diff --git a/sound/soc/intel/Makefile b/sound/soc/intel/Makefile
> > index 4e0248d2accc..7c5038803be7 100644
> > --- a/sound/soc/intel/Makefile
> > +++ b/sound/soc/intel/Makefile
> > @@ -5,7 +5,7 @@ obj-$(CONFIG_SND_SOC) += common/
> >   # Platform Support
> >   obj-$(CONFIG_SND_SST_ATOM_HIFI2_PLATFORM) += atom/
> >   obj-$(CONFIG_SND_SOC_INTEL_CATPT) += catpt/
> > -obj-$(CONFIG_SND_SOC_INTEL_SKYLAKE) += skylake/
> > +obj-$(CONFIG_SND_SOC_INTEL_SKYLAKE_COMMON) += skylake/
> >   obj-$(CONFIG_SND_SOC_INTEL_KEEMBAY) += keembay/
> >
> >   # Machine support
> >
> >
