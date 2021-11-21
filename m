Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C54B458608
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Nov 2021 20:02:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECCD71697;
	Sun, 21 Nov 2021 20:01:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECCD71697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637521338;
	bh=AyM2tYdgliO5izaM1KRne8DJGtyBDFGw5pk9sm/GLfc=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S5dfxNKEdQjpoaQ7zj304QPYh7Mqx/ArkeSi6CjZG+tSnynCz/HZ9TEgtedhZlN+m
	 5GkYKmBmf49umRW5Isl2JMbPSYYP1SyTMpBE91tW3XwCRHTVDXi93U7oKxwjc+xO3a
	 xzkac41/1LUzBsfHsYF4+tXPeJ/WCo+vhoYbf4ZY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59C9CF804AB;
	Sun, 21 Nov 2021 20:00:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC598F8049E; Sun, 21 Nov 2021 20:00:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7DCF7F80115
 for <alsa-devel@alsa-project.org>; Sun, 21 Nov 2021 20:00:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DCF7F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VcpoFgZH"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 74E17604DC;
 Sun, 21 Nov 2021 19:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637521241;
 bh=AyM2tYdgliO5izaM1KRne8DJGtyBDFGw5pk9sm/GLfc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VcpoFgZHaslhaAqgaT3u5UsOYi2/wgWJwoBvKO+Hx9vI9aKH/szI/9ui24QFQdpiF
 dAMOBmN+/nEYxVrbsqYY/uQM6qjmi+HHTbW8JCb0Dyc82S/DA16leHV2ItHYWY1Spg
 UvP4uBMZMv8DtYfZGf/a9jqU04e6MVZ5d9bfdtFiDoDNfqb1/XoO/123g8yu0XeZh2
 UsEFn3+6kCUaEtMAFnFnYYwH2pXCDDrHrmeWYggyLa+96YC8S6MlCAihgOaeHOTwaO
 Qy8JsVuj31acGopTMbzoirLaLJFi9QQFIWiWSlCe8kummhgRUUtpcFmwmijA+sDG/w
 V+vLCGVoYLUcg==
Date: Sun, 21 Nov 2021 19:00:35 +0000
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 3/5] ASoC: Intel: add machine driver for SOF+ES8336
Message-ID: <20211121190035.2a5e3ad7@sal.lan>
In-Reply-To: <20211004213512.220836-4-pierre-louis.bossart@linux.intel.com>
References: <20211004213512.220836-1-pierre-louis.bossart@linux.intel.com>
 <20211004213512.220836-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org,
 Huajun Li <huajun.li@intel.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

Hi,

Em Mon,  4 Oct 2021 16:35:10 -0500
Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com> escreveu:

> Add machine driver to support APL/GLK/TGL platforms.
> The TGL platform supports DMIC, APL and GLK do not.

I just bought a Comet Lake notebook with ES8336, but I'm having a hard
time to make audio work on it.

some info about the system from dmidecode:

    BIOS Information
	Vendor: HUAWEI
	Version: 1.35
	Release Date: 06/23/2021
    System Information
        Manufacturer: HUAWEI
        Product Name: BOHB-WAX9
        Version: M1110
    Base Board Information
        Manufacturer: HUAWEI
        Product Name: BOHB-WAX9-PCB-B2
        Version: M1110

Some relevant data from DSDT:

	 * Original Table Header:
	 *     Signature        "DSDT"
	 *     Length           0x00033D35 (212277)
	 *     Revision         0x02
	 *     Checksum         0x38
	 *     OEM ID           "HUAWEI"
	 *     OEM Table ID     "CML-ULT"
	 *     OEM Revision     0x00000002 (2)
	 *     Compiler ID      "    "
	 *     Compiler Version 0x01000013 (16777235)

        Device (ESSX)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Name (_HID, "ESSX8336")  // _HID: Hardware ID
            Name (_CID, "ESSX8336")  // _CID: Compatible ID
            Name (_DDN, "ES8336")  // _DDN: DOS Device Name
            Name (_UID, One)  // _UID: Unique ID
            Name (SBUF, ResourceTemplate ()
            {
                I2cSerialBusV2 (0x0010, ControllerInitiated, 0x00061A80,
                    AddressingMode7Bit, "\\_SB.PCI0.I2C1",
                    0x00, ResourceConsumer, , Exclusive,
                    )
                GpioIo (Exclusive, PullDefault, 0x0000, 0x0000, IoRestrictionOutputOnly,
                    "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,
                    )
                    {   // Pin list
                        0x0000
                    }
                GpioIo (Exclusive, PullDefault, 0x0000, 0x0000, IoRestrictionOutputOnly,
                    "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,
                    )
                    {   // Pin list
                        0x0000
                    }
                GpioInt (Edge, ActiveHigh, ExclusiveAndWake, PullDefault, 0x0000,
                    "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,
                    )
                    {   // Pin list
                        0x0000
                    }
            })


lpci output:

    00:1f.3 Multimedia audio controller [0401]: Intel Corporation Comet Lake PCH-LP cAVS [8086:02c8]
	Subsystem: QUANTA Computer Inc Device [152d:125d]
	Flags: bus master, fast devsel, latency 32, IRQ 149
	Memory at b121c000 (64-bit, non-prefetchable) [size=16K]
	Memory at b1000000 (64-bit, non-prefetchable) [size=1M]
	Capabilities: [50] Power Management version 3
	Capabilities: [80] Vendor Specific Information: Len=14 <?>
	Capabilities: [60] MSI: Enable+ Count=1/1 Maskable- 64bit+
	Kernel driver in use: sof-audio-pci-intel-cnl
	Kernel modules: snd_hda_intel, snd_soc_skl, snd_sof_pci_intel_cnl

So far I was unable to make speaker/mic to work on it on none of the
tree modes (SOF, SST, legacy). With SST, nothing is recognized.
With legacy mode, only HDMI works. With SOF, it says sound is disabled.

On SOF mode, sof-essx8336 doesn't load (it loads instead snd_soc_es8316).
While I never played with SOF, I suspect that it is because there's 
no entry for ES8336 at soc-acpi-intel-cml-match.c nor there are any 
firmwares for CML available at upstream sof-bin tree.

Also, it currently complains about different firmware ABIs:

[    9.547277] sof-audio-pci-intel-cnl 0000:00:1f.3: Firmware info: version 1:9:0-fa857
[    9.547313] sof-audio-pci-intel-cnl 0000:00:1f.3: Firmware: ABI 3:19:0 Kernel ABI 3:18:0
[    9.547316] sof-audio-pci-intel-cnl 0000:00:1f.3: warn: FW ABI is more recent than kernel
[    9.577525] sof-audio-pci-intel-cnl 0000:00:1f.3: Topology: ABI 3:19:0 Kernel ABI 3:18:0
[    9.577536] sof-audio-pci-intel-cnl 0000:00:1f.3: warn: topology ABI is more recent than kernel
[    9.617573] input: sof-hda-dsp HDMI/DP,pcm=1 as /devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input14
[    9.622472] input: sof-hda-dsp HDMI/DP,pcm=2 as /devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input15
[    9.623151] input: sof-hda-dsp HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input16

Any tips to make it start producing some sound?

More details at:
	https://alsa-project.org/db/?f=29b323d31ab516c5683356f5af56a2a631085bf9

PS.: Tests were done against next-20211118.

Thanks!
Mauro
