Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 350372BA9E2
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Nov 2020 13:15:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B896216F8;
	Fri, 20 Nov 2020 13:14:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B896216F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605874510;
	bh=A+VmBdHcB29AXJTL2QTmhrtS5h3l8S0gOiW1wvwY6QY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tVKALVY8tP8JcLXpGIWhNiVOdr8zdhf9XAMYsmrTmD7dVKAzKrdRtXRrUd/YLQ5EO
	 4iy5ZHJ6lyv6gYybweAkSPEiyR9AtPoKUlh0criLbqp90/EPm1W28pVBS1TzlQqUQI
	 p5cevCjAsC+1Kg/vTifiSAQeG2x5/5wAR3R6KEE8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AD33F800C5;
	Fri, 20 Nov 2020 13:13:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0411FF8016C; Fri, 20 Nov 2020 13:13:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 4959EF800F3
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 13:13:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4959EF800F3
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1605874407411180019-webhooks-bot@alsa-project.org>
References: <1605874407411180019-webhooks-bot@alsa-project.org>
Subject: Lenovo t14s amd only Dummy Device as output in pulseaudio
Message-Id: <20201120121336.0411FF8016C@alsa1.perex.cz>
Date: Fri, 20 Nov 2020 13:13:36 +0100 (CET)
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

alsa-project/alsa-ucm-conf issue #61 was opened from J-Bu:

Hi,

since upgrading to alsa-ucm 1.2.4 I only have a "Dummy Device" instead of the internal speaker. When using alsa-ucm 1.2.3 all is fine.  I'm not quite sure if this is a pulseaudio or alsa issue maybe you can guide me in the right direction

Output of lspci:
```
06:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Device 1637
	Subsystem: Lenovo Device 5082
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 32 bytes
	Interrupt: pin B routed to IRQ 85
	Region 0: Memory at fd3c8000 (32-bit, non-prefetchable) [size=16K]
	Capabilities: [48] Vendor Specific Information: Len=08 <?>
	Capabilities: [50] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0-,D1+,D2+,D3hot+,D3cold+)
		Status: D0 NoSoftRst- PME-Enable+ DSel=0 DScale=0 PME+
	Capabilities: [64] Express (v2) Legacy Endpoint, MSI 00
		DevCap:	MaxPayload 256 bytes, PhantFunc 0, Latency L0s <4us, L1 unlimited
			ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
		DevCtl:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
			MaxPayload 128 bytes, MaxReadReq 512 bytes
		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
		LnkCap:	Port #0, Speed 16GT/s, Width x16, ASPM L0s L1, Exit Latency L0s <64ns, L1 <1us
			ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
		LnkCtl:	ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 16GT/s (ok), Width x16 (ok)
			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
		DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR-
			 10BitTagComp+ 10BitTagReq- OBFF Not Supported, ExtFmt+ EETLPPrefix+, MaxEETLPPrefixes 1
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS-
			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR- OBFF Disabled,
			 AtomicOpsCtl: ReqEn-
		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
		Address: 00000000fee09000  Data: 4024
	Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
	Kernel driver in use: snd_hda_intel
```

I bisected the issue:
```
git bisect start
# good: [dbac4c3e7ad05b4eb17964688fd9f07c61b8d336] ucm2: fix more indentation issues
git bisect good dbac4c3e7ad05b4eb17964688fd9f07c61b8d336
# bad: [334b12e9a796cddf70779b68418ee7ad52ba1d14] sof-soundwire: use the codecs/hda/hdmi.conf macro
git bisect bad 334b12e9a796cddf70779b68418ee7ad52ba1d14
# bad: [8a9609cc694cb1de501a67d7c091edaa9a338932] cht-bsw-rt5672: Add Lenovo ThinkPad 10 specific configuration
git bisect bad 8a9609cc694cb1de501a67d7c091edaa9a338932
# good: [9f2dae6a560c60593c24aa4b85aed07418f9dd8e] sof-soundwire: initial UCM2 version
git bisect good 9f2dae6a560c60593c24aa4b85aed07418f9dd8e
# bad: [73c105b4707b601de63d1f24641e65e5ac23f3a6] DB820c/DB845c: move to Qualcomm/ tree
git bisect bad 73c105b4707b601de63d1f24641e65e5ac23f3a6
# good: [38e5906cd1b18b6f4df5a1d35ca535325e7b65a0] sof-hda-dsp: fix the device order (Hdmi devices)
git bisect good 38e5906cd1b18b6f4df5a1d35ca535325e7b65a0
# bad: [6b8518c431cac18a825bd7342875f54b44cb7afc] DAISY-I2S: move to Samsung/snow/snow.conf
git bisect bad 6b8518c431cac18a825bd7342875f54b44cb7afc
# bad: [dcef48f13d4f5db79b006755074940b94730a883] HDA-Intel: add support for AMD acp microphone devices
git bisect bad dcef48f13d4f5db79b006755074940b94730a883
# first bad commit: [dcef48f13d4f5db79b006755074940b94730a883] HDA-Intel: add support for AMD acp microphone devices
```

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/61
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
