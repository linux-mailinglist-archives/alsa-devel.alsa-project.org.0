Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0452DB9E0
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Dec 2020 04:57:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B16D17FA;
	Wed, 16 Dec 2020 04:56:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B16D17FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608091066;
	bh=/EZ3hnh3tCT3Pu/dI+brZIT+CXkeheprTDKua7XnpGk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gNWqXTPLHxDpNUKPETlb7EYEYIhPHa+JCkgIVPA+8WsHnVsr4WfRKG6GoguTPRpXf
	 okomGw/O9sOTl15dGReNZJwd75VDEfrg9qCeFA4RMpCAAgZ22AtK/plv5HxvB7Pyed
	 aYY+pGtam9USVXc8XEhj5DDvom2z60ZrBN1T6UyQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3199F80171;
	Wed, 16 Dec 2020 04:56:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B60BBF80240; Wed, 16 Dec 2020 04:56:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88976F8014B
 for <alsa-devel@alsa-project.org>; Wed, 16 Dec 2020 04:55:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88976F8014B
Received: from mail-ot1-f70.google.com ([209.85.210.70])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1kpNur-0006eI-1g
 for alsa-devel@alsa-project.org; Wed, 16 Dec 2020 03:55:53 +0000
Received: by mail-ot1-f70.google.com with SMTP id s14so3911103otk.18
 for <alsa-devel@alsa-project.org>; Tue, 15 Dec 2020 19:55:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0YnRXOD4PUaDILXLWc59affCqiJpj0zEXk4lLYQ6Bm0=;
 b=QTS2wKZleA7b/3lI9wZBRJheyGUhyqZgclsva+Mon5fN3vwZ8hqrEwhmDGVPaALy3o
 UKzEqGk7gkAspj/h7x+0AX8OL5oLz+cVqDmP+mV489wCzeJP63lkkutLqa+lQJ5f+PAe
 AYXNEGvN81PH0f7EK1xZixzygZMWvTgshPUl2+UT10X22sRe8zMCrgyDsRhZ5hEcA0Tv
 uv+xK7ePj3uW5Qu9XOkCLCWDpPSX9UKzj5b7oRRK/ap+w8YBZXfD8bLz9nAxhuK96N8M
 KSgI1iZuv0nVYv+nUcK1YImqrzbGC7+E/cm8HFsOrPHj7U56MfBNBVKYdvZ8TlLfvO3l
 kJMA==
X-Gm-Message-State: AOAM530ivzzRubfelDo2VQdFX0FqidYLEWr3BbRCsXFCJt4H8kfDhaq0
 sPWbbSGVHXNkWZTHdkNeF2QCpdsRowvP3X9fQNiMB8HZbk7slm1CgwQpUqcJb09LbfJvsvSGJkK
 pXqocrQC4pd1KNdAeE7bqZ1xuYR4+hhS2h7xSHvgOFkEdFTpb+mqyODgt
X-Received: by 2002:a9d:4e08:: with SMTP id p8mr25061049otf.188.1608090951588; 
 Tue, 15 Dec 2020 19:55:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxMdtsvVnM7znK3t0xlksZhGRyjG4B4puDMBVwFJUDbD0mIdQ//MKl/mnau5KyvPxM1dkIGxNfMVik5AU/ysgw=
X-Received: by 2002:a9d:4e08:: with SMTP id p8mr25061027otf.188.1608090951112; 
 Tue, 15 Dec 2020 19:55:51 -0800 (PST)
MIME-Version: 1.0
References: <9I9CLQ.GP190FSJBRXK3@canonical.com>
 <f05cb5ff-b5b1-2882-ba4a-380e696b2569@linux.intel.com>
 <J74DLQ.CON4PD1O51YN@canonical.com>
 <47ec2533-584c-d7f3-4489-e3a043e658e1@linux.intel.com>
 <c3989d32-2949-048d-5fa2-8e586a17677c@linux.intel.com>
 <CAAd53p4Fh5LEEyg478GUS9O+zPPvb65jVWj3YYRt6GFkP-jaJQ@mail.gmail.com>
 <1afda15d-1ea7-3a8f-6dcc-37f747ff7bac@linux.intel.com>
In-Reply-To: <1afda15d-1ea7-3a8f-6dcc-37f747ff7bac@linux.intel.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Wed, 16 Dec 2020 11:55:39 +0800
Message-ID: <CAAd53p7=kHLsZcNNy3AH8Y08=50Y4sVs_PMTDimRCY9ZOC3gsQ@mail.gmail.com>
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

On Wed, Dec 16, 2020 at 1:59 AM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
>
>
>
> >>> Something's not adding up here.
> >>
> >> Seems like you can enable CONFIG_SND_SOC_INTEL_KBL (and all other
> >> platforms), without enabling CONFIG_SND_SOC_INTEL_SKYLAKE, which enables
> >> building of snd_soc_skl module... I would say that there is something
> >> wrong with module dependencies in Kconfig :/
>
> rather the Makefile is wrong, see below.
>
> >
> > Yes that's exactly what happened here.
> > So I wonder why we need to separate CONFIG_SND_SOC_INTEL_SKYLAKE from
> > other configs...
> >
> >> Will look at it tomorrow. In the meantime any chance we can get the
> >> config which was used, to confirm my suspicion?
> >
> > Ubuntu 5.8 kernel has this:
> > # CONFIG_SND_SOC_INTEL_SKYLAKE is not set
> > CONFIG_SND_SOC_INTEL_SKL=m
> > CONFIG_SND_SOC_INTEL_APL=m
> > CONFIG_SND_SOC_INTEL_KBL=m
> > CONFIG_SND_SOC_INTEL_GLK=m
> > # CONFIG_SND_SOC_INTEL_CNL is not set
> > # CONFIG_SND_SOC_INTEL_CFL is not set
> > # CONFIG_SND_SOC_INTEL_CML_H is not set
> > # CONFIG_SND_SOC_INTEL_CML_LP is not set
> > CONFIG_SND_SOC_INTEL_SKYLAKE_FAMILY=m
> > CONFIG_SND_SOC_INTEL_SKYLAKE_SSP_CLK=m
> > # CONFIG_SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC is not set
>
> that would be needed to support DMIC+HDaudio platforms (with the
> Connexant restriction).

So should I enable this option? Is it safe for platforms with Connexant codec?

>
> > CONFIG_SND_SOC_INTEL_SKYLAKE_COMMON=m
> >
> > So I guess we can do something like this?
> > diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
> > index 1c5114dedda9..c8142520532e 100644
> > --- a/sound/hda/intel-dsp-config.c
> > +++ b/sound/hda/intel-dsp-config.c
> > @@ -417,7 +417,7 @@ int snd_intel_dsp_driver_probe(struct pci_dev *pci)
> >                          return SND_INTEL_DSP_DRIVER_SOF;
> >          }
> >
> > -
> > +#if IS_REACHABLE(CONFIG_SND_SOC_INTEL_SKYLAKE)
> >          if (cfg->flags & FLAG_SST) {
> >                  if (cfg->flags & FLAG_SST_ONLY_IF_DMIC) {
> >                          if (snd_intel_dsp_check_dmic(pci)) {
> > @@ -428,6 +428,7 @@ int snd_intel_dsp_driver_probe(struct pci_dev *pci)
> >                          return SND_INTEL_DSP_DRIVER_SST;
> >                  }
> >          }
> > +#endif
> >
> >          return SND_INTEL_DSP_DRIVER_LEGACY;
> >   }
> >
> > Kai-Heng
>
> Can you try this instead, the dependencies are indeed wrong in the Makefile:

Ok, compiling a kernel for user to test...

Kai-Heng

>
> diff --git a/sound/soc/intel/Makefile b/sound/soc/intel/Makefile
> index 4e0248d2accc..7c5038803be7 100644
> --- a/sound/soc/intel/Makefile
> +++ b/sound/soc/intel/Makefile
> @@ -5,7 +5,7 @@ obj-$(CONFIG_SND_SOC) += common/
>   # Platform Support
>   obj-$(CONFIG_SND_SST_ATOM_HIFI2_PLATFORM) += atom/
>   obj-$(CONFIG_SND_SOC_INTEL_CATPT) += catpt/
> -obj-$(CONFIG_SND_SOC_INTEL_SKYLAKE) += skylake/
> +obj-$(CONFIG_SND_SOC_INTEL_SKYLAKE_COMMON) += skylake/
>   obj-$(CONFIG_SND_SOC_INTEL_KEEMBAY) += keembay/
>
>   # Machine support
>
>
