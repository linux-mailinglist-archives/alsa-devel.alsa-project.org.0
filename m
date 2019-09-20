Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D63B8E0F
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Sep 2019 11:52:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FE92166D;
	Fri, 20 Sep 2019 11:51:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FE92166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568973158;
	bh=WwEtXk+kDl+pdA9rxBHN7czQFUkvlVHsP5udu3OklW4=;
	h=From:To:References:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qGCOkgKsNh74TeI/dXU4+ThB09OkVZo0DCam+23VDqLjUBoAZ1mFJYtpQ4ewjJol2
	 wAj8+nEFZGlAap9KeXLBX1yVclU8x0dii6YHIDAQl6LD8fqFaIs2ckDBPyG+bAw4Vv
	 NblXhfOj28fT+SmJaKr1FIu3kWpB97gEEuk2bgh8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E530F80146;
	Fri, 20 Sep 2019 11:50:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9183F80096; Fri, 20 Sep 2019 11:50:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=FREEMAIL_FROM,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from ns.iliad.fr (ns.iliad.fr [212.27.33.1])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54CD5F80096
 for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2019 11:50:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54CD5F80096
Received: from ns.iliad.fr (localhost [127.0.0.1])
 by ns.iliad.fr (Postfix) with ESMTP id ECD44206C4;
 Fri, 20 Sep 2019 11:50:47 +0200 (CEST)
Received: from [192.168.108.37] (freebox.vlq16.iliad.fr [213.36.7.13])
 by ns.iliad.fr (Postfix) with ESMTP id A703720140;
 Fri, 20 Sep 2019 11:50:47 +0200 (CEST)
From: Marc Gonzalez <marc.w.gonzalez@free.fr>
To: alsa-devel@alsa-project.org
References: <f7861989-8a2d-ed89-8f1f-68bad7013a34@free.fr>
Message-ID: <d67b68b9-49c0-6f78-4649-27b3b437a65f@free.fr>
Date: Fri, 20 Sep 2019 11:50:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f7861989-8a2d-ed89-8f1f-68bad7013a34@free.fr>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ;
 Fri Sep 20 11:50:47 2019 +0200 (CEST)
Cc: Takashi Iwai <tiwai@suse.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] Propagating audio properties along the audio path
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

On 17/09/2019 17:33, Marc Gonzalez wrote:

> Disclaimer: I've never worked in the sound/ layer, and it is possible that
> some of my questions are silly or obvious.
> 
> Basically, I'm trying to implement some form of eARC(*) on an arm64 SoC.
> (*) enhanced Audio Return Channel (from HDMI 2.1)
> 
> The setup looks like this:
> 
> A = Some kind of audio source, typically a TV or game console
> B = The arm64 SoC, equipped with some nice speakers
> 
>    HDMI
> A ------> B
> 
> If we look inside B, we actually have
> B1 = an eARC receiver (input = HDMI, output = I2S)
> B2 = an audio DSP (input = I2S, output = speakers)
> 
>     I2S        ?
> B1 -----> B2 -----> speakers
> 
> 
> If I read the standard right, B is supposed to advertise which audio formats
> it supports, and A is supposed to pick "the best". For the sake of argument,
> let's say A picks "PCM, 48 kHz, 8 channels, 16b".
> 
> At some point, B receives audio packets, parses the Channel Status, and
> determines that A is sending "PCM, 48 kHz, 8 channels, 16b". The driver
> then configures the I2S link, and forwards the audio stream over I2S to
> the DSP.
> 
> QUESTION_1:
> How is the DSP supposed to "learn" the properties of the audio stream?
> (AFAIU, they're not embedded in the data, so there must be some side-channel?)
> I assume the driver of B1 is supposed to propagate the info to the driver of B2?
> (Via some call-backs? By calling a function in B2?)
> 
> QUESTION_2:
> Does it ever make sense for B2 to ask B1 to change the audio properties?
> (Not sure if B1 is even allowed to renegotiate.)

I think it boils down to the "Dynamic PCM" abstraction?

	https://www.kernel.org/doc/html/latest/sound/soc/dpcm.html


The downstream driver (7500 lines) is tough to ingest for a noob.

	https://source.codeaurora.org/quic/la/kernel/msm-4.4/tree/sound/soc/msm/msm8998.c?h=LE.UM.1.3.r3.25

I'll keep chipping at whatever docs I can find.


One more concern popped up: if the audio stream changes mid-capture
(for example, a different TV program uses different audio settings),
then I would detect this in the eARC receiver, but it's not clear
(to me) how to propagate the info to the DSP...

I'm not even sure when the HW params actually get applied...
Is it for SNDRV_PCM_IOCTL_PREPARE? SNDRV_PCM_IOCTL_START?

I couldn't find much documentation for the IOCTLs in the kernel:

$ git grep SNDRV_PCM_IOCTL  Documentation/
Documentation/sound/designs/tracepoints.rst:value to these parameters, then execute ioctl(2) with SNDRV_PCM_IOCTL_HW_REFINE
Documentation/sound/designs/tracepoints.rst:or SNDRV_PCM_IOCTL_HW_PARAMS. The former is used just for refining available
Documentation/sound/designs/tracepoints.rst:        SNDRV_PCM_IOCTL_HW_REFINE only. Applications can select which
Documentation/sound/designs/tracepoints.rst:        SNDRV_PCM_IOCTL_HW_PARAMS, this mask is ignored and all of parameters
Documentation/sound/designs/tracepoints.rst:        SNDRV_PCM_IOCTL_HW_REFINE to retrieve this flag, then decide candidates
Documentation/sound/designs/tracepoints.rst:        of parameters and execute ioctl(2) with SNDRV_PCM_IOCTL_HW_PARAMS to


Regards.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
