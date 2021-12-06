Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCAF46AE53
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 00:21:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCF63222C;
	Tue,  7 Dec 2021 00:20:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCF63222C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638832865;
	bh=4G12lVCyYsbFJZLtFskMGgsqcQBX5CKnPy23wEwcf0U=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QGikaju0tFj0w9/1rcq0a8ziJTTKMJBXivvmcr1nVBeMk28AnH29sxkXkuP9j4+iS
	 N2xNp3bz0kX+YTA5JmnDVZ97O+Sqf3fWSLzT45VFHl7WZ6hpBTgQ1FZhCNfzPbxsXe
	 IatzvKYi1DlBqvJIP2W3jvkunsFc5VKzGNQCiFYA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A268F804ED;
	Tue,  7 Dec 2021 00:19:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A225AF804EC; Tue,  7 Dec 2021 00:19:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from hz.preining.info (hz.preining.info [IPv6:2a01:4f9:2a:1a08::2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8EEAAF804E4
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 00:19:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EEAAF804E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=preining.info header.i=@preining.info
 header.b="ODvpuzpE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=preining.info; s=201909; h=In-Reply-To:Content-Type:MIME-Version:References
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bdNTJuG7qPkSNYD7pu01vNHqkcgwmfzmIF/5ZnZkl9I=; b=ODvpuzpEdOFqKZKpfRZYYL1Q7z
 80Kx6JF+HIW9egTqwC5QWS3AUzxt4Hl0vWxTOxlkG00CbmUsqi470uzfCPmkN2O3LXj6A1n7hr2uo
 K5vDgsf5SQPuVMErMI443twWbYunJIgXZ8Cd1oLOr4dp1jHkF14nefEKpoY0mWe/n5JpL5ECEP+4p
 pd8CkD5Oz/3GqCZa5P91nKJK4EmsNYvjTGMHunJs4jLzCNsNs4zWnn/ezdv3vCi7otsSI0K5fBzsQ
 +67lR/hgqKs8k2XenFByL9QQ0wV/Xz7K/iZCQOnf28BKuT47YliqmfrbHuYj01eNW1H609ToyPYxm
 OeSrqrPg==;
Received: from tvk213002.tvk.ne.jp ([180.94.213.2] helo=bulldog.preining.info)
 by hz.preining.info with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <norbert@preining.info>)
 id 1muNGe-0002ls-UZ; Mon, 06 Dec 2021 23:19:33 +0000
Received: by bulldog.preining.info (Postfix, from userid 1000)
 id 2FFF51A7B23B4; Tue,  7 Dec 2021 08:19:29 +0900 (JST)
Date: Tue, 7 Dec 2021 08:19:29 +0900
From: Norbert Preining <norbert@preining.info>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: Support for 8086:ae20 Intel Smart Sound Technology on Fujitsu
 Lifebook
Message-ID: <Ya6agUY8ClmkONp7@bulldog.preining.info>
References: <Yat56SpjuUAxm2Gc@sakefilet.preining.info>
 <94bfe11e-c774-4f9e-1cec-297fcedfef85@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94bfe11e-c774-4f9e-1cec-297fcedfef85@linux.intel.com>
Cc: alsa-devel@alsa-project.org
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

Dear Pierre-Louis, dear all,

(please cc)

thanks for your answer, much appreciated.

On Mon, 06 Dec 2021, Pierre-Louis Bossart wrote:
> if you are looking at Windows, the string you want to look for starts
> with 'CTLR_DEV_', not 'DEV_'

Thanks, didn't know. The string I found is
	CTRL_DEV_02C8

> > 00:1f.3 Multimedia audio controller: Intel Corporation Comet Lake PCH-LP cAVS
> 
> This is the one you want details on. please share the results of:
> 
> cat /sys/bus/pci/devices/0000\:00\:1f.3/device
> cat /sys/bus/pci/devices/0000\:00\:1f.3/class
> 
> and sudo lspci  -vvv -s 00:1f.3

Here they are

[~] cat /sys/bus/pci/devices/0000\:00\:1f.3/device 
0x02c8
[~] cat /sys/bus/pci/devices/0000\:00\:1f.3/class
0x040100
[~] sudo lspci -vvv -s 00:1f.3
00:1f.3 Multimedia audio controller: Intel Corporation Comet Lake PCH-LP cAVS
        Subsystem: Fujitsu Client Computing Limited Comet Lake PCH-LP cAVS
        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 32, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 173
        IOMMU group: 13
        Region 0: Memory at a2130000 (64-bit, non-prefetchable) [size=16K]
        Region 4: Memory at 604e000000 (64-bit, non-prefetchable) [size=1M]
        Capabilities: [50] Power Management version 3
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=55mA PME(D0-,D1-,D2-,D3hot+,D3cold+)
                Status: D3 NoSoftRst+ PME-Enable+ DSel=0 DScale=0 PME-
        Capabilities: [80] Vendor Specific Information: Len=14 <?>
        Capabilities: [60] MSI: Enable+ Count=1/1 Maskable- 64bit+
                Address: 00000000fee008d8  Data: 0000
        Kernel driver in use: snd_hda_intel
        Kernel modules: snd_hda_intel, snd_soc_skl, snd_sof_pci_intel_cnl
[~]


When I check with pavucontrol I only see 
	Built-in Audio Analog Stereo
as input source, and there is no reaction to sound (and it is unmuted).
So I guess this is the device connected to the plug on the side of the
laptop.

(please cc)

All the best

Norbert

--
PREINING Norbert                              https://www.preining.info
Fujitsu Research  +  IFMGA Guide  +  TU Wien  +  TeX Live  + Debian Dev
GPG: 0x860CDC13   fp: F7D8 A928 26E3 16A1 9FA0 ACF0 6CAC A448 860C DC13
