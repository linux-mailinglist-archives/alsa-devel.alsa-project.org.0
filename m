Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 841457B3F0E
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Sep 2023 10:12:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BC0CFC2;
	Sat, 30 Sep 2023 10:11:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BC0CFC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696061538;
	bh=cT3MAUntzaGu0EQw2r9/j9HnKitinhxyZ9WlvaT8Z20=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=irB5xQT9iJJNjOVIEBU4qzojchNF/jU+C0Lg50Nqby3yARzspXZ5Wd0mMznMtQ2ph
	 KxwfkpUfy625hG8miihEWEZPb2NLDh2EggjddVsPIMC8gPC5BzyASJnQJqjClIyaeg
	 Zp0bJ1hLUj7gOBA3JSL10esBp4C0tiVJvk88sMe0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F497F805B6; Sat, 30 Sep 2023 10:08:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7356BF805AE;
	Sat, 30 Sep 2023 10:08:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81CC3F8016A; Wed, 27 Sep 2023 21:14:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from csmtpq2-prd-nl1-vmo.edge.unified.services
 (csmtpq2-prd-nl1-vmo.edge.unified.services [84.116.50.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 204B2F80130
	for <alsa-devel@alsa-project.org>; Wed, 27 Sep 2023 21:14:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 204B2F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=blueyonder.co.uk header.i=@blueyonder.co.uk
 header.a=rsa-sha256 header.s=meg.feb2017 header.b=BK/RYELM
Received: from csmtp2-prd-nl1-vmo.nl1.unified.services ([100.107.82.134]
 helo=csmtp2-prd-nl1-vmo.edge.unified.services)
	by csmtpq2-prd-nl1-vmo.edge.unified.services with esmtps  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <sboyce@blueyonder.co.uk>)
	id 1qlZzW-00Fen1-18
	for alsa-devel@alsa-project.org; Wed, 27 Sep 2023 21:14:34 +0200
Received: from [192.168.10.244] ([82.32.17.210])
	by csmtp2-prd-nl1-vmo.edge.unified.services with ESMTPA
	id lZzUq9eoeMRAilZzUqBiUJ; Wed, 27 Sep 2023 21:14:33 +0200
X-SourceIP: 82.32.17.210
X-Authenticated-Sender: sboyce@blueyonder.co.uk
X-Spam: 0
X-Authority: v=2.4 cv=d+kzizvE c=1 sm=1 tr=0 ts=65147f19 cx=a_exe
 a=xwbGgp66NgX51+oEeDXSrg==:117 a=xwbGgp66NgX51+oEeDXSrg==:17
 a=IkcTkHD0fZMA:10 a=zNV7Rl7Rt7sA:10 a=x7bEGLp0ZPQA:10
 a=LsY_pDxX3eF9cKILWiQA:9 a=QEXdDO2ut3YA:10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=blueyonder.co.uk;
	s=meg.feb2017; t=1695842073;
	bh=Uu/oTjpG9FS5ZPpLED3hBXmrhVdruzECMAZYFtKI/8M=;
	h=Date:Reply-To:Subject:To:Cc:References:From:In-Reply-To;
	b=BK/RYELMl28jcyLCvQJUMMd6vKjadWKaESnpylwufC39j2zG12eVdQSWqRJaI2l/F
	 CK3VCAgly1yiHsiGXGyvY5KnP4Xxx8SZO3zVNn3DmLQg864wxerH7AwyVBvbPqoRlb
	 bGRbgHNiwy7NVk97zGTxNJCoq2jR1MS5P1KqOj9OvAlAi4ewzWfjNGmxVezw7LKlkm
	 I16BdUwnQX/lEUx2JZ7YeN2Yr4IR9wdKK95I+3V07jBMrLx56/p1UP1adWgqaufKt6
	 T9oOkab0Z+Zfrk3hEtcyfVD8i8OkzRIkpoxeUcGwvRzmCq89ud1eRpxz9DzXJsxZv5
	 6bnz+PVNipRKA==
Message-ID: <20798069-6057-4e52-9c79-8d851e0afadd@blueyonder.co.uk>
Date: Wed, 27 Sep 2023 20:14:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Ryzen 9 7950x sound module does not not build
To: Randy Dunlap <rdunlap@infradead.org>, Bagas Sanjaya
 <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ALSA <alsa-devel@alsa-project.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <213f93b5-bffe-479f-a111-f8a7e44cd293@blueyonder.co.uk>
 <61821f15-78e2-4594-8f39-545ecaa97000@infradead.org>
 <5903832d-7d27-4847-b161-48b9f7e92ee6@blueyonder.co.uk>
 <ZRLWIkyngsasQbQ7@debian.me>
 <6a6d7683-78f2-4511-976d-eb42d3b59c89@blueyonder.co.uk>
 <40672e60-3913-4794-b84a-742b7c16d361@infradead.org>
 <4b2c3b4e-9b21-4f80-95e1-58aa7f58131e@blueyonder.co.uk>
 <7afa193e-6bf1-4792-89e1-ca72bc4588e9@infradead.org>
Content-Language: en-GB
From: Sid Boyce <sboyce@blueyonder.co.uk>
Organization: blueyonder.co.uk
In-Reply-To: <7afa193e-6bf1-4792-89e1-ca72bc4588e9@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: 
 MS4xfHrs+g2aO6fnOLSILp9gB5kMqaPTJNowTbW0w1Cm8lY447AY62y8sG8XKDt/dIP556q+ZwGtL46yGYpTwBzMYIK2MeObyUhqkKIxuPOCw+Wo6stN0qwT
 Wrgm1GBWmX0Re8FMc7iwJDwbjWaYY2kwkgDMmrRWhABggOe7kaDMCPPR2of6DgK9uUAl7ON/W+/hbw8M7SJefZRaQn5nLF6uO+ZWP5RQ5agKrwwGlefAW7Co
 azCXhK7/XLnanMoQEaY/ayKKhQPGo6QnmXLPPzQra9v0/ZxVMDYG5ueGWsX41cFLiwUmq6KZEAbZFsbFwdZcEDe0ob8IqKyTg5G8k7HETVJiXPoj6ZvIM8fC
 +JOx9y6zhDyKlXb9AboS9K2eqZ3MpfWAe9dQKWeFNwvbMxkVnU0S7sjSP63l5Dpmd/hvvZxB
X-MailFrom: sboyce@blueyonder.co.uk
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: IEL2GHW7UIZLFYKPZ3QEFWNCMFUOTEYO
X-Message-ID-Hash: IEL2GHW7UIZLFYKPZ3QEFWNCMFUOTEYO
X-Mailman-Approved-At: Sat, 30 Sep 2023 08:08:48 +0000
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: sboyce@blueyonder.co.uk
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IEL2GHW7UIZLFYKPZ3QEFWNCMFUOTEYO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 27/09/2023 16:40, Randy Dunlap wrote:
>
> On 9/27/23 04:27, Sid Boyce wrote:
>> On 26/09/2023 23:13, Randy Dunlap wrote:
> || The snd-rpl-pci-acp6x driver only supports
> || vendor=0x1022, device=0x15e2, and PCI revision=0x62.
>
>>> lspci -vv
>>
>> 01:00.1 Audiodevice: NVIDIA Corporation Device 10fa (rev a1)
>>         Subsystem: NVIDIA Corporation Device 1f82
>>         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
>>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>>         Latency: 0, Cache Line Size: 64 bytes
>>         Interrupt: pin B routed to IRQ 80
>>         IOMMU group: 11
>>         Region 0: Memory at fc080000 (32-bit, non-prefetchable) [size=16K]
>>         Capabilities: [60] Power Management version 3
>>                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
>>                 Status: D3 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
>>         Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
>>                 Address: 0000000000000000  Data: 0000
>>         Capabilities: [78] Express (v2) Endpoint, MSI 00
>>                 DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s unlimited, L1 <64us
>>                         ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 75W
>>                 DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
>>                         RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
>>                         MaxPayload 256 bytes, MaxReadReq 512 bytes
>>                 DevSta: CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr- TransPend-
>>                 LnkCap: Port #0, Speed 8GT/s, Width x16, ASPM L0s L1, Exit Latency L0s <512ns, L1 <4us
>>                         ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp+
>>                 LnkCtl: ASPM L0s L1 Enabled; RCB 64 bytes, Disabled- CommClk+
>>                         ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>>                 LnkSta: Speed 2.5GT/s (downgraded), Width x16
>>                         TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>>                 DevCap2: Completion Timeout: Range AB, TimeoutDis+ NROPrPrP- LTR+
>>                          10BitTagComp- 10BitTagReq- OBFF Via message, ExtFmt- EETLPPrefix-
>>                          EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
>>                          FRS- TPHComp- ExtTPHComp-
>>                          AtomicOpsCap: 32bit- 64bit- 128bitCAS-
>>                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR- 10BitTagReq- OBFF Disabled,
>>                          AtomicOpsCtl: ReqEn-
>>                 LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
>>                          EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
>>                          Retimer- 2Retimers- CrosslinkRes: unsupported
>>         Capabilities: [100 v2] Advanced Error Reporting
>>                 UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
>>                 UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
>>                 UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
>>                 CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr-
>>                 CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
>>                 AERCap: First Error Pointer: 00, ECRCGenCap- ECRCGenEn- ECRCChkCap- ECRCChkEn-
>>                         MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
>>                 HeaderLog: 00000000 00000000 00000000 00000000
>>         Kernel driver in use: snd_hda_intel
>>         Kernel modules: snd_hda_intel
>>
>> 0b:00.6 Audiodevice: Advanced Micro Devices, Inc. [AMD] Family 17h/19h HD AudioController
>>         DeviceName: Realtek ALC897 Audio
>>         Subsystem: ASUSTeK Computer Inc. Device 87fb
>>         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
>>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>>         Latency: 0, Cache Line Size: 64 bytes
>>         Interrupt: pin C routed to IRQ 81
>>         IOMMU group: 24
>>         Region 0: Memory at fc500000 (32-bit, non-prefetchable) [size=32K]
>>         Capabilities: [48] Vendor Specific Information: Len=08 <?>
>>         Capabilities: [50] Power Management version 3
>>                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
>>                 Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
>>         Capabilities: [64] Express (v2) Endpoint, MSI 00
>>                 DevCap: MaxPayload 256 bytes, PhantFunc 0, Latency L0s <4us, L1 unlimited
>>                         ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 0W
>>                 DevCtl: CorrErr- NonFatalErr- FatalErr- UnsupReq-
>>                         RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
>>                         MaxPayload 256 bytes, MaxReadReq 512 bytes
>>                 DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
>>                 LnkCap: Port #0, Speed 16GT/s, Width x16, ASPM L0s L1, Exit Latency L0s <64ns, L1 <1us
>>                         ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
>>                 LnkCtl: ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
>>                         ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
>>                 LnkSta: Speed 16GT/s, Width x16
>>                         TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>>                 DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR-
>>                          10BitTagComp+ 10BitTagReq- OBFF Not Supported, ExtFmt+ EETLPPrefix+, MaxEETLPPrefixes 1
>>                          EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
>>                          FRS- TPHComp- ExtTPHComp-
>>                          AtomicOpsCap: 32bit- 64bit- 128bitCAS-
>>                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR- 10BitTagReq- OBFF Disabled,
>>                          AtomicOpsCtl: ReqEn-
>>                 LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
>>                          EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
>>                          Retimer- 2Retimers- CrosslinkRes: unsupported
>>         Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
>>                 Address: 00000000fee00000  Data: 0000
>>         Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
>>         Capabilities: [2a0 v1] Access Control Services
>>                 ACSCap: SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
>>                 ACSCtl: SrcValid- TransBlk- ReqRedir- CmpltRedir- UpstreamFwd- EgressCtrl- DirectTrans-
>>         Kernel driver in use: snd_hda_intel
>>         Kernel modules: snd_hda_intel
>>
> Sid, do you have some reason to believe that one of these devices should use the
> snd-rpl-pci-acp6x driver?  I don't see that either one of them is the correct
> vendor/device ID pair for that driver, but I would prefer that someone who is
> familiar with the driver & device jump in here...
>
Switched to pulseaudio, results are absolutely the same as with pipewire.

After reboot without USB dongle only the Digital Stereo (IEC958) showed 
in kmix.

Plugged in the USB dongle in order to get sound working.

-- 
Sid Boyce ... Hamradio License G3VBV, Keen licensed Private Pilot
Retired IBM/Amdahl Mainframes and Sun/Fujitsu Servers Tech Support Specialist
Microsoft Windows Free Zone - Linux used for all Computing Tasks

