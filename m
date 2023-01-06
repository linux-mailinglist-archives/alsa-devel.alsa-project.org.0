Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 211B665FACF
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Jan 2023 06:02:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AD5FD915;
	Fri,  6 Jan 2023 06:01:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AD5FD915
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672981326;
	bh=HLedwd1+3El7BOY0G2TT+9YHwuHPcX/SiLSzCxrnSKk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=u7G9SyC62Kl/2KjrOhbpdMd3k6BD/qO2BnYR59pIs45O481UdRhDMswq7lDP/Lt17
	 4YiT5VlqNSqQ5Yh68zbWlTVGj6GNxayrP7OKJpJJeb4rNQE20sUO17r0jRF1fqvkcJ
	 P6EVQOM3OlsGkmWmSwMy5qfHFKv2s+mb5rguJj3Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 160B5F8022B;
	Fri,  6 Jan 2023 06:01:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DFBFF80217; Fri,  6 Jan 2023 06:01:06 +0100 (CET)
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
 by alsa1.perex.cz (Postfix) with ESMTPS id 79FD3F80217
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 06:00:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79FD3F80217
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=H3riTjmz
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4F5A6418E8
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 05:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1672981258;
 bh=VjK+soZmeM7SKVDJ28iDB0gliwiKEw0ymz/jEaR8lgk=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=H3riTjmzJ2ixvPHISUVBIUTpdNId2JWabUFOyCWcFkFLuzLlqSaies1luGigYoq2I
 8pvQ6s40PA0zTSuuM89+bI2KnLW46a0xLtsK0T5/Gei86L1btLTJ3rHlj4uomVyGki
 Npce3UiYIBjlipx+qXO//k5fx7T1WxotK4Wl+MWLPyog6VdQfErBtBW7YN+DZ01/A5
 zQTBpoO3+p+JB+1MDhYwJukfPffsxGHX37jp7YmqNMcMBuGgfRF9n74kXBcNU1Y1q8
 GWyT3R+XE06cFIWQbTTRBKHd6DfWjjltglCsOHQdcKkscmxwqp9D9dmFnPFYCDiX/R
 7yYb+UJnD/jAw==
Received: by mail-pg1-f197.google.com with SMTP id
 l63-20020a639142000000b0047942953738so456514pge.15
 for <alsa-devel@alsa-project.org>; Thu, 05 Jan 2023 21:00:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VjK+soZmeM7SKVDJ28iDB0gliwiKEw0ymz/jEaR8lgk=;
 b=avHM4seTPAXdjpO8Y9VbvzedJFKDEgZUOwHfQAdj5A1kVtbZaX6FbX2QL+srdMQZ+S
 lhOgYBWONh/wvaAHTev45axhrdF/Hs9w9vZxwsmhyog1mpWGIrYKy5/8xd6X92yOJFtb
 P9GyQl3lX3rGb8ticLdqSqj5eRFBxKHUcXGvXECgyIuPFcQer7J+B++pQQ/pY8/a9NJl
 1Vg7wZbGa0HjNvzSWFrF/Qe3rRnwribH3l5i9C17Aw5HTdyYpFiyNLMziesGM/oeQKd9
 qGnLy9g/keW7l66uN/ZGz8LRLODbz0IjrUYcXvDljs63eHNZEiZtHubo91ajEXBE2SFO
 cvpw==
X-Gm-Message-State: AFqh2kpzgaks98+YfKl075Kh5ByTNSeSdLhJKAafHNdob0t9w0ZYzNBO
 INnI/sQ/9m2DWwjvZNG9q30YlHlQQERUmlDlBVeVTY0a3qvto9HNtEvZKphgcHHjomVFp+n3eFH
 D0QZoFtSE9hLX63X3rumIUvq0qkET1y/3h6QNCTO11NgPn6n0ibCs5Atx
X-Received: by 2002:a65:6741:0:b0:477:f6be:b65b with SMTP id
 c1-20020a656741000000b00477f6beb65bmr3768778pgu.362.1672981256688; 
 Thu, 05 Jan 2023 21:00:56 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsFMj3RxZH9KyqSDBcEip7IlWhll6+Cvv+Zt4Zj2R3waKMbXg3eZrNPT30QXdLNRJjJ6Xzjb70Wih1iDfWfxjQ=
X-Received: by 2002:a65:6741:0:b0:477:f6be:b65b with SMTP id
 c1-20020a656741000000b00477f6beb65bmr3768768pgu.362.1672981256079; Thu, 05
 Jan 2023 21:00:56 -0800 (PST)
MIME-Version: 1.0
References: <20220719144753.252231-1-kai.heng.feng@canonical.com>
 <bd59b06a-de49-2a1a-d2a2-351957fec6d0@perex.cz>
 <CAAd53p6ru7CJ=pJ2knCL5pgU_Y+nA=yTPscKk225zTD-fv4qQg@mail.gmail.com>
 <34bddb2f-dc57-c08c-358e-26cf7824c203@perex.cz>
 <514f0fda-9475-e163-fd64-0bc675dd3447@linux.intel.com>
 <CAAd53p5xkjKkpvZu2nNu5EaJC9d060g5GAhV_gRD2ouGjKY9AQ@mail.gmail.com>
 <CAAd53p4Jcfo1_jsCd98_HxzkfqhUxS_7h7vM5a2dcK4fRYS1RA@mail.gmail.com>
 <144a8a27-ac7a-6d3b-1744-26fe0806deee@perex.cz>
In-Reply-To: <144a8a27-ac7a-6d3b-1744-26fe0806deee@perex.cz>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Fri, 6 Jan 2023 13:00:44 +0800
Message-ID: <CAAd53p6d846H9UKYm8CeDaYNN0qY8u0Wy9tAa3Re0bVPN8tr3w@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda: Skip creating captures in SOF context
To: Jaroslav Kysela <perex@perex.cz>
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
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Jaroslav,

On Thu, Jan 5, 2023 at 8:43 PM Jaroslav Kysela <perex@perex.cz> wrote:
>
> On 05. 01. 23 13:36, Kai-Heng Feng wrote:
> > On Mon, Aug 15, 2022 at 3:55 PM Kai-Heng Feng
> > <kai.heng.feng@canonical.com> wrote:
> >>
> >> On Wed, Jul 20, 2022 at 9:31 PM Pierre-Louis Bossart
> >> <pierre-louis.bossart@linux.intel.com> wrote:
> >>>
> >>>
> >>>
> >>> On 7/20/22 02:52, Jaroslav Kysela wrote:
> >>>> Dne 20. 07. 22 v 3:45 Kai-Heng Feng napsal(a):
> >>>>> On Tue, Jul 19, 2022 at 11:41 PM Jaroslav Kysela <perex@perex.cz> wrote:
> >>>>>>
> >>>>>> Dne 19. 07. 22 v 16:47 Kai-Heng Feng napsal(a):
> >>>>>>> On HP laptops that use SOF driver for DMIC, the micmute LED doesn't
> >>>>>>> light up when mic is muted after commit 9b014266ef8a ("ASoC: SOF:
> >>>>>>> topology: use new sound control LED layer").
> >>>>>>>
> >>>>>>> The micmute LED itself is still working via sysfs, but it doesn't follow
> >>>>>>> mute anymore. That's because unlike vendors like Dell and Lenovo, HP
> >>>>>>> laptops use HDA codec to control mute LEDs instead of ACPI. So on HP
> >>>>>>> laptops, both SOF and HDA create captures with
> >>>>>>> SNDRV_CTL_ELEM_ACCESS_MIC_LED access, snd_ctl_led_set_state() considers
> >>>>>>> there are two different kcontrols and one of them is not muted.
> >>>>>>
> >>>>>> It does not mean that it's a wrong behavior. When both controls are muted, the
> >>>>>> LED should be turned on. It just requires that all inputs are off (and it may
> >>>>>> be the default - probably we can set in UCM or so). If you turn the "Capture
> >>>>>> Switch" off in amixer / alsamixer, do things work as expected ?
> >>>>>
> >>>>> Yes. When all captures are muted the micmute LED is on.
> >>>>>
> >>>>>>
> >>>>>>> So skip creating captures for HDA when it's called from SOF, the
> >>>>>>> captures are already handled by SOF.
> >>>>>>
> >>>>>> The capture controls are for other inputs like external analog microphone. If
> >>>>>> it is required to suppress the MIC LED for some hardware, just skip the
> >>>>>> "spec->mic_mute_led = 1" assignment in hda_generic.c . Also, the check
> >>>>>> "codec->core.type != HDA_DEV_ASOC" is not sufficient, because you don't know,
> >>>>>> if the topology really sets the MIC LED flag.
> >>>>>
> >>>>> AFAIK the external analog microphone on DMIC laptop is driven by SOF driver too.
> >>>>> If those capture controls are indeed needed for external analog mics,
> >>>>> use UCM to mute them by default won't work either.
> >>>>
> >>>> Could you describe this ? I though that only DMIC is handled by SOF when HDA
> >>>> codec is in the system. There is a separate analog codec for external analog
> >>>> microphone or the HDA codec is somehow connected to SOF/DSP ? If so, how ?
> >>>
> >>> The HDA codec is connected in the same way in all cases, there's no
> >>> hardware/electrical/routing difference.
> >>>
> >>> When used, the SOF driver will handle ALL links, be they DMIC or
> >>> HDAudio. The difference for HDaudio is that instead of a single DMA
> >>> transfer (DDR->FIFO), we have a first 'Host' DMA into the DSP SRAM, some
> >>> processing and a second 'Link' DMA from DSP SRAM to the HDaudio FIFO
> >>> (reversed flow for capture).
> >>
> >> So is this approach sufficient for this issue? Or should I explore
> >> other possibilities?
> >
> > A gentle ping...
>
> This Mic LED problem was resolved through UCM for the moment:
>
> https://github.com/alsa-project/alsa-ucm-conf/commit/79a8ec44d3dcf097f4a4492c506cbcf338324175

That solves the issue, thanks!

Kai-Heng

>
> More discussion:
>
> https://bugzilla.redhat.com/show_bug.cgi?id=2134824
>
>                                         Jaroslav
>
> --
> Jaroslav Kysela <perex@perex.cz>
> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
