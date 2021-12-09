Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F4E46F6BD
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Dec 2021 23:23:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82C512169;
	Thu,  9 Dec 2021 23:22:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82C512169
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639088629;
	bh=3vRT03v9Xpke2dEXqZkcKngdVBobLhrqcp9LAG6zXbo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vAyR2m6uPh98p7Z2G+xjZQBFiwZ1GPsbL9rtBr8M21gEQbLSNGyygF80zD22nYn7a
	 U1lDQsF0bFZzOIq4xP1nKREs0h29jkXsgp40zMRu1E51TXe7UStCTBj0cGiTx8lo0S
	 aKCG7x3YXz5ONGrBblMQNGNVSOkseNiXuz/w/P/Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1521F804BD;
	Thu,  9 Dec 2021 23:22:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 202B3F804AE; Thu,  9 Dec 2021 23:22:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id D05C9F8028D
 for <alsa-devel@alsa-project.org>; Thu,  9 Dec 2021 23:22:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D05C9F8028D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1639088550468589067-webhooks-bot@alsa-project.org>
References: <1639088550468589067-webhooks-bot@alsa-project.org>
Subject: microphone disappeared on alsa-ucm-conf 1.2.6.1
Message-Id: <20211209222237.202B3F804AE@alsa1.perex.cz>
Date: Thu,  9 Dec 2021 23:22:37 +0100 (CET)
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

alsa-project/alsa-lib issue #200 was edited from galibozek:

after upgrade alsa-ucm-conf 1.2.5.1-1 to 1.2.6.1-1 (arch linux) my microphone disappeared on lenovo t14 gen2i

Similar to: https://bugs.archlinux.org/task/71180

```
00:1f.3 Audio device: Intel Corporation Tiger Lake-LP Smart Sound Technology Audio Controller (rev 20) (prog-if 80)
        Subsystem: Lenovo Device 22c9
        Flags: bus master, fast devsel, latency 64, IRQ 187, IOMMU group 12
        Memory at 603dbc0000 (64-bit, non-prefetchable) [size=16K]
        Memory at 603da00000 (64-bit, non-prefetchable) [size=1M]
        Capabilities: <access denied>
        Kernel driver in use: sof-audio-pci-intel-tgl
        Kernel modules: snd_hda_intel, snd_sof_pci_intel_tgl
```
```
kernel: input: sof-hda-dsp Mic as /devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input9
kernel: input: sof-hda-dsp Headphone as /devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input10
kernel: input: sof-hda-dsp HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input11
kernel: input: sof-hda-dsp HDMI/DP,pcm=4 as /devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input12
kernel: input: sof-hda-dsp HDMI/DP,pcm=5 as /devices/pci0000:00/0000:00:1f.3/skl_hda_dsp_generic/sound/card0/input13
systemd-udevd[513]: controlC0: Process '/usr/bin/alsactl restore 0' failed with exit code 99.
alsactl[1136]: alsa-lib main.c:1412:(snd_use_case_mgr_open) error: failed to import hw:0 use case configuration -2
alsactl[1136]: alsa-lib main.c:1412:(snd_use_case_mgr_open) error: failed to import hw:0 use case configuration -2
alsactl[1136]: Found hardware: "sof-hda-dsp" "Realtek ALC257" "HDA:80862812,80860101,00100000 HDA:10ec0257,17aa22c9,00100001 cfg-dmics:2" "" ""
alsactl[1136]: Hardware is initialized using a generic method
audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295 ses=4294967295 msg='unit=alsa-restore comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=? res=success'
plasmashell[1688]: org.kde.plasma.pulseaudio: No object for name "alsa_output.pci-0000_00_1f.3-platform-skl_hda_dsp_generic.stereo-fallback.monitor"
kernel: snd_hda_codec_realtek ehdaudio0D0: didn't find PCM for DAI Digital Codec DAI
kernel: snd_hda_codec_realtek ehdaudio0D0: ASoC: error at snd_soc_dai_startup on Digital Codec DAI: -22
kernel: snd_hda_codec_realtek ehdaudio0D0: didn't find PCM for DAI Digital Codec DAI
kernel: snd_hda_codec_realtek ehdaudio0D0: ASoC: error at snd_soc_dai_startup on Digital Codec DAI: -22
```

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/200
Repository URL: https://github.com/alsa-project/alsa-lib
