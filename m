Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2D3C71CEB
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Nov 2025 03:19:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AFE66020F;
	Thu, 20 Nov 2025 03:19:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AFE66020F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1763605171;
	bh=LzDs7K4XvKXPlfIOz5vfv86Fs04G+sj5JBbtIiEUPAw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Behn8nFIJ8U2gj7VBnq6woYgNBeiQVk4s2FDZ2gB79G62l9nwBjjAF7JGOFl+RWdr
	 rDd1A/7nurKYJN8SZjRhRvLz3NW/nsCnfZyEjGQap3MlkRSDxF9a5xu/8OU0+B1nF6
	 b+5AEok2BOnI3HNsRWhNfQnOwT5ZTTlY1M9HbWJ8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C64E8F805D4; Thu, 20 Nov 2025 03:18:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B167F805CB;
	Thu, 20 Nov 2025 03:18:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 956D8F8021D; Thu, 20 Nov 2025 03:18:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 87CEEF8001E
	for <alsa-devel@alsa-project.org>; Thu, 20 Nov 2025 03:18:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87CEEF8001E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <187995815cae4300-webhooks-bot@alsa-project.org>
In-Reply-To: <187995815bc2e900-webhooks-bot@alsa-project.org>
References: <187995815bc2e900-webhooks-bot@alsa-project.org>
Subject: No soundcards recognised by ALSA after upgrading to Linux 6.17.8 from
 Linux 6.17.1 (Lenovo Yoga Slim 7 14ILL10, cs42l43)
Date: Thu, 20 Nov 2025 03:18:38 +0100 (CET)
Message-ID-Hash: 4DWLBJR6YXM4B27WQVUJDUDJE4ATGXU7
X-Message-ID-Hash: 4DWLBJR6YXM4B27WQVUJDUDJE4ATGXU7
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4DWLBJR6YXM4B27WQVUJDUDJE4ATGXU7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #645 was opened from emfol:

After upgrading to Linux 6.17.8 (from Linux 6.17.1), the sound card is no longer recognized.

I ran the `alsa-info.sh` script after booting each one of the kernels and the results follow:

- 6.17.1: https://alsa-project.org/db/?f=5887d318c6cd7866365a0f134eeaf5721f33b82d
- 6.17.8: https://alsa-project.org/db/?f=a5ca95f07b9a1844c102f63e6c0e36cd2e5755ef

#### DMESG 6.17.8

```
Nov 19 22:33:46 ys7i14-em kernel: sof-audio-pci-intel-lnl 0000:00:1f.3: SoundWire enabled on CannonLake+ platform, using SOF driver
Nov 19 22:33:46 ys7i14-em kernel: sof-audio-pci-intel-lnl 0000:00:1f.3: enabling device (0000 -> 0002)
Nov 19 22:33:46 ys7i14-em kernel: sof-audio-pci-intel-lnl 0000:00:1f.3: DSP detected with PCI class/subclass/prog-if 0x040100
Nov 19 22:33:46 ys7i14-em kernel: sof-audio-pci-intel-lnl 0000:00:1f.3: bound 0000:00:02.0 (ops intel_audio_component_bind_ops [xe])
Nov 19 22:33:46 ys7i14-em kernel: sof-audio-pci-intel-lnl 0000:00:1f.3: use msi interrupt mode
Nov 19 22:33:46 ys7i14-em kernel: sof-audio-pci-intel-lnl 0000:00:1f.3: hda codecs found, mask 4
Nov 19 22:33:46 ys7i14-em kernel: sof-audio-pci-intel-lnl 0000:00:1f.3: NHLT device BT(0) detected, ssp_mask 0x4
Nov 19 22:33:46 ys7i14-em kernel: sof-audio-pci-intel-lnl 0000:00:1f.3: BT link detected in NHLT tables: 0x4
Nov 19 22:33:46 ys7i14-em kernel: sof-audio-pci-intel-lnl 0000:00:1f.3: DMICs detected in NHLT tables: 4
Nov 19 22:33:46 ys7i14-em kernel: sof-audio-pci-intel-lnl 0000:00:1f.3: Firmware paths/files for ipc type 1:
Nov 19 22:33:46 ys7i14-em kernel: sof-audio-pci-intel-lnl 0000:00:1f.3:  Firmware file:     intel/sof-ipc4/lnl/sof-lnl.ri
Nov 19 22:33:46 ys7i14-em kernel: sof-audio-pci-intel-lnl 0000:00:1f.3:  Firmware lib path: intel/sof-ipc4-lib/lnl
Nov 19 22:33:46 ys7i14-em kernel: sof-audio-pci-intel-lnl 0000:00:1f.3:  Topology file:     intel/sof-ipc4-tplg/sof-lnl-cs42l43-l0-4ch.tplg
Nov 19 22:33:46 ys7i14-em kernel: sof-audio-pci-intel-lnl 0000:00:1f.3: Loaded firmware library: ADSPFW, version: 2.13.0.1
Nov 19 22:33:46 ys7i14-em kernel: sof-audio-pci-intel-lnl 0000:00:1f.3: Booted firmware version: 2.13.0.1
```

#### DMESG 6.17.1 

```
Nov 19 22:22:14 ys7i14-em kernel: sof-audio-pci-intel-lnl 0000:00:1f.3: SoundWire enabled on CannonLake+ platform, using SOF driver
Nov 19 22:22:14 ys7i14-em kernel: sof-audio-pci-intel-lnl 0000:00:1f.3: enabling device (0000 -> 0002)
Nov 19 22:22:14 ys7i14-em kernel: sof-audio-pci-intel-lnl 0000:00:1f.3: DSP detected with PCI class/subclass/prog-if 0x040100
Nov 19 22:22:14 ys7i14-em kernel: sof-audio-pci-intel-lnl 0000:00:1f.3: bound 0000:00:02.0 (ops intel_audio_component_bind_ops [xe])
Nov 19 22:22:14 ys7i14-em kernel: sof-audio-pci-intel-lnl 0000:00:1f.3: use msi interrupt mode
Nov 19 22:22:14 ys7i14-em kernel: sof-audio-pci-intel-lnl 0000:00:1f.3: hda codecs found, mask 4
Nov 19 22:22:14 ys7i14-em kernel: sof-audio-pci-intel-lnl 0000:00:1f.3: NHLT device BT(0) detected, ssp_mask 0x4
Nov 19 22:22:14 ys7i14-em kernel: sof-audio-pci-intel-lnl 0000:00:1f.3: BT link detected in NHLT tables: 0x4
Nov 19 22:22:14 ys7i14-em kernel: sof-audio-pci-intel-lnl 0000:00:1f.3: DMICs detected in NHLT tables: 4
Nov 19 22:22:14 ys7i14-em kernel: sof-audio-pci-intel-lnl 0000:00:1f.3: Firmware paths/files for ipc type 1:
Nov 19 22:22:14 ys7i14-em kernel: sof-audio-pci-intel-lnl 0000:00:1f.3:  Firmware file:     intel/sof-ipc4/lnl/sof-lnl.ri
Nov 19 22:22:14 ys7i14-em kernel: sof-audio-pci-intel-lnl 0000:00:1f.3:  Firmware lib path: intel/sof-ipc4-lib/lnl
Nov 19 22:22:14 ys7i14-em kernel: sof-audio-pci-intel-lnl 0000:00:1f.3:  Topology file:     intel/sof-ipc4-tplg/sof-lnl-cs42l43-l0-4ch.tplg
Nov 19 22:22:14 ys7i14-em kernel: sof-audio-pci-intel-lnl 0000:00:1f.3: Loaded firmware library: ADSPFW, version: 2.13.0.1
Nov 19 22:22:15 ys7i14-em kernel: sof-audio-pci-intel-lnl 0000:00:1f.3: Booted firmware version: 2.13.0.1
Nov 19 22:22:15 ys7i14-em kernel: sof-audio-pci-intel-lnl 0000:00:1f.3: Topology: ABI 3:29:1 Kernel ABI 3:23:1
Nov 19 22:22:15 ys7i14-em kernel: sof_sdw sof_sdw: ASoC: Parent card not yet available, widget card binding deferred
Nov 19 22:22:15 ys7i14-em kernel: sof-audio-pci-intel-lnl 0000:00:1f.3: Loaded firmware library: ADSPFW, version: 2.13.0.1
Nov 19 22:22:21 ys7i14-em kernel: sof_sdw sof_sdw: Setting CS42L43 Speaker volume limit to 128
Nov 19 22:22:21 ys7i14-em kernel: sof_sdw sof_sdw: hda_dsp_hdmi_build_controls: no PCM in topology for HDMI converter 3
Nov 19 22:22:21 ys7i14-em kernel: input: sof-soundwire Jack as /devices/pci0000:00/0000:00:1f.3/sof_sdw/sound/card0/input14
Nov 19 22:22:21 ys7i14-em kernel: input: sof-soundwire HDMI/DP,pcm=5 as /devices/pci0000:00/0000:00:1f.3/sof_sdw/sound/card0/input15
Nov 19 22:22:21 ys7i14-em kernel: input: sof-soundwire HDMI/DP,pcm=6 as /devices/pci0000:00/0000:00:1f.3/sof_sdw/sound/card0/input16
Nov 19 22:22:21 ys7i14-em kernel: input: sof-soundwire HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:1f.3/sof_sdw/sound/card0/input17
Nov 19 22:33:07 ys7i14-em systemd[1]: sys-devices-pci0000:00-0000:00:1f.3-sof_sdw-sound-card0-controlC0.device: Failed to enqueue SYSTEMD_WANTS job, ignoring: Transaction for sound.target/start is destructive (reboot.target has 'start' job queued, but 'stop' is included in transaction).
```

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/645
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
