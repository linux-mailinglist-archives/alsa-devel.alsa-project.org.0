Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF80065EACA
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Jan 2023 13:37:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44353B080;
	Thu,  5 Jan 2023 13:36:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44353B080
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672922268;
	bh=kzh51tjZf6BbDdOPHf1kZXyHTEo9Dw/XL/zrdcGX7xw=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=V4leBn0sBswrUN4RcIoC4YKMQn4cvl04o+iASkjctXejKawPKztUegb0e9o3gncmI
	 vRLbDhfGpcchojGW026vr4OkyE8RH9M88gpWKxnKWgk4nwis5Tgr4RVwpVSyjFc6xP
	 7KE5x9Www9GwwVJU64GActwgV2nCyBzjFJSt4Kzk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0AD8F804AD;
	Thu,  5 Jan 2023 13:36:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1DCBF8047B; Thu,  5 Jan 2023 13:36:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9EB0F8022B
 for <alsa-devel@alsa-project.org>; Thu,  5 Jan 2023 13:36:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9EB0F8022B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=YcuqlDvx
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D8B8E418E8
 for <alsa-devel@alsa-project.org>; Thu,  5 Jan 2023 12:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1672922198;
 bh=kzh51tjZf6BbDdOPHf1kZXyHTEo9Dw/XL/zrdcGX7xw=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=YcuqlDvxZx2hL7xIWUQ+yAHUDnBlvuJIWy6uyizaA3KRQTcNFxPa+napu8KgWd9r7
 t+65Gg7GXjajDQakXvHr9/VnPUkpH4O+BltyYxdXRd9jjZClSRAop9EVEG7h55QArP
 qIG6Ki9B9JhMYxI3ltgl5v0Oa7y52sPsV4QB0T+HgXV8Wq/xQTkGz3qJMYcDza7RuP
 3sL/NWhjcn3xT7aBLW941w7to6wMwv05Gf4EO00lMrB/ZY9zG+ednYJ56Xt3N/NioV
 EKB/n5YZFoeVz5RikJT/ssqgCe2S0dVGfu1i1Ho8tNuMS/pdEDg/RoAG0M6mLyFIcD
 JVF0t8fmCNk7g==
Received: by mail-pg1-f200.google.com with SMTP id
 bk2-20020a056a02028200b004a7e2a790d2so613963pgb.18
 for <alsa-devel@alsa-project.org>; Thu, 05 Jan 2023 04:36:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kzh51tjZf6BbDdOPHf1kZXyHTEo9Dw/XL/zrdcGX7xw=;
 b=gtB1Ajr7dLUN2e61ybarrQv45yM/AYh12biaGJK5suKeODNCa9y/2jDhUf59HdkDz5
 WVSw18mXpsP2ifYB3UN+mBivRUK7p+OBq4GsZVCDyCVE4fGt2eQyzLhqI0gFMNjTgpmX
 NH4zZJzTEvn0VU+oKwH5oJAfxAHklq3HMUSD6dzN792CAO5tN4gt3NrtShUxA2LiImgM
 v6gruYeARZ9Uhm8ZnCY124Ow/2ws7b2zS4HwAh9pua9vDcPMIlOW7ex9UyH74Z9nMaCv
 gTIc6P5EZSj+EL8Gp3tx7i9aFoGXiFmlKiNxOFibO3gCPCYm0+5nmtSPNLIkIlgw5Vbp
 0xOg==
X-Gm-Message-State: AFqh2kpxLcHy6H3PQ3tEOB1dM12ucSMFc7OS4zhBUmvzXAoqJn6bDWV/
 vrNjutqXW2FvgaQPjaXRWZO85+zwwvGxv6QcEV7CBGzWPn2DH++8clJEColZlxM5pJXhVtNn7AG
 rV0cqOoC4pPHE6RmWt58BBYxqY3+LSgIOukc/yr0p5vS8Xrmmcv23dTLx
X-Received: by 2002:a17:90b:264d:b0:226:1564:643c with SMTP id
 pa13-20020a17090b264d00b002261564643cmr2141356pjb.206.1672922197368; 
 Thu, 05 Jan 2023 04:36:37 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuun2bnIY+7fARFwqKZukGuDM/4YSe5TQaJtRRag9XzMpW4qx7Lfzm80FSsGQJStYmB3SRogQZy5gR1d0VvdPc=
X-Received: by 2002:a17:90b:264d:b0:226:1564:643c with SMTP id
 pa13-20020a17090b264d00b002261564643cmr2141349pjb.206.1672922196882; Thu, 05
 Jan 2023 04:36:36 -0800 (PST)
MIME-Version: 1.0
References: <20220719144753.252231-1-kai.heng.feng@canonical.com>
 <bd59b06a-de49-2a1a-d2a2-351957fec6d0@perex.cz>
 <CAAd53p6ru7CJ=pJ2knCL5pgU_Y+nA=yTPscKk225zTD-fv4qQg@mail.gmail.com>
 <34bddb2f-dc57-c08c-358e-26cf7824c203@perex.cz>
 <514f0fda-9475-e163-fd64-0bc675dd3447@linux.intel.com>
 <CAAd53p5xkjKkpvZu2nNu5EaJC9d060g5GAhV_gRD2ouGjKY9AQ@mail.gmail.com>
In-Reply-To: <CAAd53p5xkjKkpvZu2nNu5EaJC9d060g5GAhV_gRD2ouGjKY9AQ@mail.gmail.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Thu, 5 Jan 2023 20:36:25 +0800
Message-ID: <CAAd53p4Jcfo1_jsCd98_HxzkfqhUxS_7h7vM5a2dcK4fRYS1RA@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda: Skip creating captures in SOF context
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>, tiwai@suse.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, Aug 15, 2022 at 3:55 PM Kai-Heng Feng
<kai.heng.feng@canonical.com> wrote:
>
> On Wed, Jul 20, 2022 at 9:31 PM Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> wrote:
> >
> >
> >
> > On 7/20/22 02:52, Jaroslav Kysela wrote:
> > > Dne 20. 07. 22 v 3:45 Kai-Heng Feng napsal(a):
> > >> On Tue, Jul 19, 2022 at 11:41 PM Jaroslav Kysela <perex@perex.cz> wrote:
> > >>>
> > >>> Dne 19. 07. 22 v 16:47 Kai-Heng Feng napsal(a):
> > >>>> On HP laptops that use SOF driver for DMIC, the micmute LED doesn't
> > >>>> light up when mic is muted after commit 9b014266ef8a ("ASoC: SOF:
> > >>>> topology: use new sound control LED layer").
> > >>>>
> > >>>> The micmute LED itself is still working via sysfs, but it doesn't follow
> > >>>> mute anymore. That's because unlike vendors like Dell and Lenovo, HP
> > >>>> laptops use HDA codec to control mute LEDs instead of ACPI. So on HP
> > >>>> laptops, both SOF and HDA create captures with
> > >>>> SNDRV_CTL_ELEM_ACCESS_MIC_LED access, snd_ctl_led_set_state() considers
> > >>>> there are two different kcontrols and one of them is not muted.
> > >>>
> > >>> It does not mean that it's a wrong behavior. When both controls are muted, the
> > >>> LED should be turned on. It just requires that all inputs are off (and it may
> > >>> be the default - probably we can set in UCM or so). If you turn the "Capture
> > >>> Switch" off in amixer / alsamixer, do things work as expected ?
> > >>
> > >> Yes. When all captures are muted the micmute LED is on.
> > >>
> > >>>
> > >>>> So skip creating captures for HDA when it's called from SOF, the
> > >>>> captures are already handled by SOF.
> > >>>
> > >>> The capture controls are for other inputs like external analog microphone. If
> > >>> it is required to suppress the MIC LED for some hardware, just skip the
> > >>> "spec->mic_mute_led = 1" assignment in hda_generic.c . Also, the check
> > >>> "codec->core.type != HDA_DEV_ASOC" is not sufficient, because you don't know,
> > >>> if the topology really sets the MIC LED flag.
> > >>
> > >> AFAIK the external analog microphone on DMIC laptop is driven by SOF driver too.
> > >> If those capture controls are indeed needed for external analog mics,
> > >> use UCM to mute them by default won't work either.
> > >
> > > Could you describe this ? I though that only DMIC is handled by SOF when HDA
> > > codec is in the system. There is a separate analog codec for external analog
> > > microphone or the HDA codec is somehow connected to SOF/DSP ? If so, how ?
> >
> > The HDA codec is connected in the same way in all cases, there's no
> > hardware/electrical/routing difference.
> >
> > When used, the SOF driver will handle ALL links, be they DMIC or
> > HDAudio. The difference for HDaudio is that instead of a single DMA
> > transfer (DDR->FIFO), we have a first 'Host' DMA into the DSP SRAM, some
> > processing and a second 'Link' DMA from DSP SRAM to the HDaudio FIFO
> > (reversed flow for capture).
>
> So is this approach sufficient for this issue? Or should I explore
> other possibilities?

A gentle ping...

>
> Kai-Heng
>
> >
