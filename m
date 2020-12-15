Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FB72DB30F
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Dec 2020 18:55:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB0421819;
	Tue, 15 Dec 2020 18:54:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB0421819
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608054923;
	bh=M9+Tb2oMpvfVtXoTXW0Tuehu5NN/wmtReXau3qlY6Qc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n8C+3ITydLA6/EsyH+2Frxj0bcvWdoxVkiiU7mjZeTyEDrVvsRYGzzdK2RQicjxxz
	 l76suyxWAeNo9/buUobFF7E9Lg+sPrCTT9kLPDTWC1HKOIZcPkmD++YZYHniRPfvTF
	 2YWZ/AM8X7y12aKRoC76bz7iesDLVvK+ENM2yctg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B72E5F8028B;
	Tue, 15 Dec 2020 18:54:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD940F80259; Tue, 15 Dec 2020 18:54:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57D5AF80259
 for <alsa-devel@alsa-project.org>; Tue, 15 Dec 2020 18:53:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57D5AF80259
Received: from mail-ot1-f71.google.com ([209.85.210.71])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1kpEWK-0006Q7-2h
 for alsa-devel@alsa-project.org; Tue, 15 Dec 2020 17:53:56 +0000
Received: by mail-ot1-f71.google.com with SMTP id q5so9597173otc.11
 for <alsa-devel@alsa-project.org>; Tue, 15 Dec 2020 09:53:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=K2XrxwXGMOdp6r1Fx2QuIOjm4GjBJ60DEVGmIY4BXkU=;
 b=muvL8GTwhUVckWIFfC6YnZWQAhk4UWbytJw51fLPSkal4rtNsRglP4nrFDNPrr6Dkm
 sVX57xuN+HAQy1kLRD32y0lbc2nFK6/1ZM8NXme/RYJ2vVdPLLxLNhX0uwHV7mhcecAB
 8yx2Ts9MTts1DURElaALp2yshgjE+6SUzD98Mv0m1Bb7m9DlOaGb6ix8lUPsTX6Tpf1A
 LgAl1SGyGgdamxcHo7k1O8+ZjjdEXkWCfv8AlLRQYD1qnPc4QKiEeCUMWUWluDbef946
 G1dKS25qwmZkfs53F10cEAAtcvItsiniRq4sLr5PZkGro2zsdQsH0+sc19+WlgpUrZRt
 pPjw==
X-Gm-Message-State: AOAM530M45PU5J59C/lUBq6h3oiHqlWZXAu+qyBjS1GJ9TplUZCcK8B5
 skuhHByYePdW4WUn5Z6aSVRfteHHINm7aUeOtCm3mwg1pERanAEL8gRg1SmSaaOiSRh7sSw8Xkk
 I8BKpPiKQoGKDcipijHgupeLjk/K07s2cdcBembNX1Lh8gem1rEbBDDMl
X-Received: by 2002:a4a:3791:: with SMTP id r139mr23371325oor.87.1608054834483; 
 Tue, 15 Dec 2020 09:53:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyqjspjbycXo1sMPeuXENOrz97Q2dpO3ypZ2837gAKwaF2QvBO4Ml+xA1ucei23yY+/++YnDCc6xxtLik4VIes=
X-Received: by 2002:a4a:3791:: with SMTP id r139mr23371289oor.87.1608054833874; 
 Tue, 15 Dec 2020 09:53:53 -0800 (PST)
MIME-Version: 1.0
References: <9I9CLQ.GP190FSJBRXK3@canonical.com>
 <f05cb5ff-b5b1-2882-ba4a-380e696b2569@linux.intel.com>
 <J74DLQ.CON4PD1O51YN@canonical.com>
 <47ec2533-584c-d7f3-4489-e3a043e658e1@linux.intel.com>
 <c3989d32-2949-048d-5fa2-8e586a17677c@linux.intel.com>
In-Reply-To: <c3989d32-2949-048d-5fa2-8e586a17677c@linux.intel.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Wed, 16 Dec 2020 01:53:42 +0800
Message-ID: <CAAd53p4Fh5LEEyg478GUS9O+zPPvb65jVWj3YYRt6GFkP-jaJQ@mail.gmail.com>
Subject: Re: [Sound-open-firmware] SoF support for 8086:9d71?
To: =?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: SOUND <alsa-devel@alsa-project.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 sound-open-firmware@alsa-project.org
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

On Wed, Dec 16, 2020 at 1:48 AM Amadeusz S=C5=82awi=C5=84ski
<amadeuszx.slawinski@linux.intel.com> wrote:
>
> On 12/15/2020 6:21 PM, Pierre-Louis Bossart wrote:
> >
> >
> > On 12/14/20 9:54 PM, Kai-Heng Feng wrote:
> >>
> >>
> >> On Mon, Dec 14, 2020 at 13:33, Pierre-Louis Bossart
> >> <pierre-louis.bossart@linux.intel.com> wrote:
> >>>
> >>>> On more recent kernels legacy HDA stops working for device 8086:9d71=
:
> >>>> [   47.211381] snd_hda_intel 0000:00:1f.3: DSP detected with PCI
> >>>>  class/subclass/prog-if info 0x040100
> >>>> [   47.211383] snd_hda_intel 0000:00:1f.3: Digital mics found on
> >>>>  Skylake+ platform, using SST driver
> >>>>
> >>>> However, only legacy HDA supports it:
> >>>> 00:1f.3 Multimedia audio controller [0401]: Intel Corporation
> >>>> Sunrise  Point-LP HD Audio [8086:9d71] (rev 21)
> >>>> ..
> >>>>      Kernel modules: snd_hda_intel
> >>>>
> >>>> Ubuntu kernel doesn't select SND_SOC_INTEL_SKYLAKE, which builds
> >>>>  snd-soc-skl, because based on the Kconfig description SOF should
> >>>> support  it.
> >>>>
> >>>> I wonder if SND_SOC_INTEL_SKYLAKE should be select again?
> >>>
> >>> SOF does not support Skylake and Kabylake, and only the Up2 board for
> >>> APL. I am not sure what you mean by 'recent' kernels since this
> >>> dynamic selection has been in place for a year now?
> >>
> >> Ubuntu kernel only changed this in 20.10 release.
> >>
> >>>
> >>> At any rate, to make this work again:
> >>>
> >>> 1. You can select SND_SOC_INTEL_SKYLAKE or alternatively to be more
> >>> accurate:
> >>>
> >>> SND_SOC_INTEL_SKL
> >>> SND_SOC_INTEL_APL
> >>> SND_SOC_INTEL_KBL
> >>>
> >>> There are known issues with Conexant codecs, typically on HP devices,
> >>> only Realtek codecs are supported.
> >>
> >> Right, so we can't really enable this for generic distros like Ubuntu.
> >>
> >> Let me think of a more generic solution.
> >
> > Re-thinking about this, I actually don't know how this problem occurred=
:
> > the tables are conditionally built so you would only select SST if you
> > had the drivers compiled in.
> >
> > see sound/hda/intel-dsp-config.c:
> >
> > /* Kabylake-LP */
> > #if IS_ENABLED(CONFIG_SND_SOC_INTEL_KBL)
> >      {
> >          .flags =3D FLAG_SST,
> >          .device =3D 0x9d71,
> >          .dmi_table =3D (const struct dmi_system_id []) {
> >              {
> >                  .ident =3D "Google Chromebooks",
> >                  .matches =3D {
> >                      DMI_MATCH(DMI_SYS_VENDOR, "Google"),
> >                  }
> >              },
> >              {}
> >          }
> >      },
> >      {
> >          .flags =3D FLAG_SST | FLAG_SST_ONLY_IF_DMIC,
> >          .device =3D 0x9d71,
> >      },
> > #endif
> >
> > Something's not adding up here.
>
> Seems like you can enable CONFIG_SND_SOC_INTEL_KBL (and all other
> platforms), without enabling CONFIG_SND_SOC_INTEL_SKYLAKE, which enables
> building of snd_soc_skl module... I would say that there is something
> wrong with module dependencies in Kconfig :/

Yes that's exactly what happened here.
So I wonder why we need to separate CONFIG_SND_SOC_INTEL_SKYLAKE from
other configs...

> Will look at it tomorrow. In the meantime any chance we can get the
> config which was used, to confirm my suspicion?

Ubuntu 5.8 kernel has this:
# CONFIG_SND_SOC_INTEL_SKYLAKE is not set
CONFIG_SND_SOC_INTEL_SKL=3Dm
CONFIG_SND_SOC_INTEL_APL=3Dm
CONFIG_SND_SOC_INTEL_KBL=3Dm
CONFIG_SND_SOC_INTEL_GLK=3Dm
# CONFIG_SND_SOC_INTEL_CNL is not set
# CONFIG_SND_SOC_INTEL_CFL is not set
# CONFIG_SND_SOC_INTEL_CML_H is not set
# CONFIG_SND_SOC_INTEL_CML_LP is not set
CONFIG_SND_SOC_INTEL_SKYLAKE_FAMILY=3Dm
CONFIG_SND_SOC_INTEL_SKYLAKE_SSP_CLK=3Dm
# CONFIG_SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC is not set
CONFIG_SND_SOC_INTEL_SKYLAKE_COMMON=3Dm

So I guess we can do something like this?
diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index 1c5114dedda9..c8142520532e 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -417,7 +417,7 @@ int snd_intel_dsp_driver_probe(struct pci_dev *pci)
                        return SND_INTEL_DSP_DRIVER_SOF;
        }

-
+#if IS_REACHABLE(CONFIG_SND_SOC_INTEL_SKYLAKE)
        if (cfg->flags & FLAG_SST) {
                if (cfg->flags & FLAG_SST_ONLY_IF_DMIC) {
                        if (snd_intel_dsp_check_dmic(pci)) {
@@ -428,6 +428,7 @@ int snd_intel_dsp_driver_probe(struct pci_dev *pci)
                        return SND_INTEL_DSP_DRIVER_SST;
                }
        }
+#endif

        return SND_INTEL_DSP_DRIVER_LEGACY;
 }

Kai-Heng

>
> Thanks,
> Amadeusz
