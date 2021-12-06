Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B78D46AE84
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 00:37:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BA912353;
	Tue,  7 Dec 2021 00:36:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BA912353
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638833859;
	bh=zN+9TEljUERr/qzgu4GGTgKF0ehFalc7GHWbDtrmj5U=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mNTYHClgsChN1LM/k3pPO1mRxGrurjXx+Z2su2wY9Sr24gl31s9i+wWH7RyQlJ9WE
	 ygEd8vPQfKI34BPr2NgNMSQlDYUk7DKJA9RVCT9DaIaqCVsYALYzVQrvHSrEyww+ph
	 SzDhnplYRgJZqLnNMJqxV79hjQajw8T6vnKC9ufE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CCA2F804ED;
	Tue,  7 Dec 2021 00:36:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7910BF804EC; Tue,  7 Dec 2021 00:36:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 170C0F80118
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 00:36:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 170C0F80118
X-IronPort-AV: E=McAfee;i="6200,9189,10190"; a="323688574"
X-IronPort-AV: E=Sophos;i="5.87,292,1631602800"; d="scan'208";a="323688574"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2021 15:36:11 -0800
X-IronPort-AV: E=Sophos;i="5.87,292,1631602800"; d="scan'208";a="462054472"
Received: from jcsee-mobl2.ccr.corp.intel.com (HELO [10.209.128.127])
 ([10.209.128.127])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2021 15:36:10 -0800
Subject: Re: Support for 8086:ae20 Intel Smart Sound Technology on Fujitsu
 Lifebook
To: Norbert Preining <norbert@preining.info>
References: <Yat56SpjuUAxm2Gc@sakefilet.preining.info>
 <94bfe11e-c774-4f9e-1cec-297fcedfef85@linux.intel.com>
 <Ya6agUY8ClmkONp7@bulldog.preining.info>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <f01c9a7f-7534-c4fa-ea24-c5bf4d120128@linux.intel.com>
Date: Mon, 6 Dec 2021 17:36:08 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <Ya6agUY8ClmkONp7@bulldog.preining.info>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
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



> [~] cat /sys/bus/pci/devices/0000\:00\:1f.3/device 
> 0x02c8

so that's CometLake LP

> [~] cat /sys/bus/pci/devices/0000\:00\:1f.3/class
> 0x040100

this one means the audio DSP is enabled, but might not be required for
your platform.

> [~] sudo lspci -vvv -s 00:1f.3
> 00:1f.3 Multimedia audio controller: Intel Corporation Comet Lake PCH-LP cAVS
>         Subsystem: Fujitsu Client Computing Limited Comet Lake PCH-LP cAVS
>         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Latency: 32, Cache Line Size: 64 bytes
>         Interrupt: pin A routed to IRQ 173
>         IOMMU group: 13
>         Region 0: Memory at a2130000 (64-bit, non-prefetchable) [size=16K]
>         Region 4: Memory at 604e000000 (64-bit, non-prefetchable) [size=1M]
>         Capabilities: [50] Power Management version 3
>                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=55mA PME(D0-,D1-,D2-,D3hot+,D3cold+)
>                 Status: D3 NoSoftRst+ PME-Enable+ DSel=0 DScale=0 PME-
>         Capabilities: [80] Vendor Specific Information: Len=14 <?>
>         Capabilities: [60] MSI: Enable+ Count=1/1 Maskable- 64bit+
>                 Address: 00000000fee008d8  Data: 0000
>         Kernel driver in use: snd_hda_intel

and this means the kernel did not detect an interface that requires the DSP.

Looking at your alsa-info log, an alternate explanation is that your
distribution forces the use of the

snd_intel_dspcfg: dsp_driver=1 option, which will select the HDaudio
legacy.

If you happen to have a device with microphones attached to the PCH, not
the HDaudio codec, then by design you *cannot* use the legacy HDaudio
driver (snd-hda-intel). you will have to use the SOF driver
(snd-sof-pci-intel-cnl).

Can you check in /etc/modprobe.d/*.conf if you see a configuration that
sets this module parameter?

If you see this option set, try to comment it out and reboot. You should
really avoid setting the dsp_driver option since it will bypass the
autodetection and might result in the wrong driver being used.

