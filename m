Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED635F45EC
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Oct 2022 16:51:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C76D51709;
	Tue,  4 Oct 2022 16:50:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C76D51709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664895104;
	bh=GwXpTbT/4KvzO2rf6LQ1upwlWU87erLSBYL865qkNrY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K7CoF1L1K/qKwErcMZlkqzwoA2KMcU/eWKtm4qKACOak8QVGt/ELvqQKwi979j2oF
	 yD2CKET+Mwo+dabQ/JiGm/huutHigHEKroqlhjjLSN961qOP6YcDroFIQxCVBcVZQN
	 OVtCxlr4rRgdXL6xa8TDD8dMfXZyK4coGlN1qZ00=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 548C8F801F5;
	Tue,  4 Oct 2022 16:50:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2AEDF801EC; Tue,  4 Oct 2022 16:50:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 73CFEF800C1
 for <alsa-devel@alsa-project.org>; Tue,  4 Oct 2022 16:50:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73CFEF800C1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1664895045102411032-webhooks-bot@alsa-project.org>
References: <1664895045102411032-webhooks-bot@alsa-project.org>
Subject: tgl dmic volume too low
Message-Id: <20221004145047.B2AEDF801EC@alsa1.perex.cz>
Date: Tue,  4 Oct 2022 16:50:47 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #224 was edited from yuvalk:

x1carbon gen 9 (tiger lake)
all capture devices at max volume (mic boost, capture, dmic0 front, dmic0 rear, dmic1 2nd front, dmic1 2nd rear, PGA2.0 2 M)
still reads from mic is ~5-7% (as can be seen in `arecord -vv --format=dat /dev/null` )

device is using sof-audio-pci-intel-tgl:
```
$ sudo lspci -vvv -s 00:1f.3
00:1f.3 Audio device: Intel Corporation Tiger Lake-LP Smart Sound Technology Audio Controller (rev 20) (prog-if 80)
	Subsystem: Lenovo Device 22d5
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 64
	Interrupt: pin A routed to IRQ 185
	IOMMU group: 13
	Region 0: Memory at 603d1c8000 (64-bit, non-prefetchable) [size=16K]
	Region 4: Memory at 603d000000 (64-bit, non-prefetchable) [size=1M]
	Capabilities: [50] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=55mA PME(D0-,D1-,D2-,D3hot+,D3cold+)
		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [80] Vendor Specific Information: Len=14 <?>
	Capabilities: [60] MSI: Enable+ Count=1/1 Maskable- 64bit+
		Address: 00000000fee00998  Data: 0000
	Kernel driver in use: sof-audio-pci-intel-tgl
	Kernel modules: snd_hda_intel, snd_sof_pci_intel_tgl

```

this is with linux-5.19.11 on arch linux
sof-firmware 2.2.2-1
alsa-card-profiles 1:0.3.58-1
alsa-lib 1.2.7.2-1
alsa-topology-conf 1.2.5.1-1
alsa-ucm-conf 1.2.7.2-1
alsa-utils 1.2.7-1

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/224
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
