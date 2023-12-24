Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB5A81D74C
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Dec 2023 00:48:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 968C6E10;
	Sun, 24 Dec 2023 00:48:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 968C6E10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703375321;
	bh=8VVnEEY9UT7zeCkz3btUcHSZE6n0dTeXWgjvLReZeY4=;
	h=Date:From:To:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=c8XuPa+d25vw914L1W3sj6dJgeUro7v5waJP3/orFky/hgg7SRbCykMvr50Te6I8I
	 pwXosWKmiuwmbnJvh0NRKCASZeZv466AOnmebHqp+TTKYP0OU99NTzQvBtCzCwmcLc
	 3uqD7VUVn3nfIFq1oGHzHic9G+ORrbbyp14pAjQA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B8E6F80563; Sun, 24 Dec 2023 00:48:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CD1FF8015B;
	Sun, 24 Dec 2023 00:48:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 367F0F8016D; Sun, 24 Dec 2023 00:44:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail1.merlins.org (magic.merlins.org [209.81.13.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 81064F800D2
	for <alsa-devel@alsa-project.org>; Sun, 24 Dec 2023 00:44:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81064F800D2
Received: from merlin by mail1.merlins.org with local (Exim 4.94.2 #2)
	id 1rHBfS-0002EF-8t by authid <merlin>; Sat, 23 Dec 2023 15:44:30 -0800
Date: Sat, 23 Dec 2023 15:44:30 -0800
From: Marc MERLIN <marc@merlins.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: sof-audio-pci-intel-tgl/soundwire 6.6.8 kernel outputs no sound on
 speakers but works on headphones
Message-ID: <20231223234430.GA11359@merlins.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Sysadmin: BOFH
X-URL: http://marc.merlins.org/
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: marc@merlins.org
Message-ID-Hash: VMDI2D5K4QXXE7FF5ACI6PSSCMSDNRSX
X-Message-ID-Hash: VMDI2D5K4QXXE7FF5ACI6PSSCMSDNRSX
X-MailFrom: marc@merlins.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VMDI2D5K4QXXE7FF5ACI6PSSCMSDNRSX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Howdy,

First, apologies if I'm not sending this to the right place, I could not
find an approrpriate soundwire/sof mailing list, please redirect me as
needed (I had to find an old soundwire message for reference)

laptop; Dell XPS 17 9730

merlin:~# lspci | grep -i audio
0000:00:1f.3 Multimedia audio controller: Intel Corporation Device 51ca (rev 01)

stock mainline 6.6.8 shows the device, but no sound comes out, as if it
were muted, but I do not see anyting muted in alsamixer. If I plug in
headphones, sound works, if I unplug them, no sound on speakers. Nothing
is shown as muted alsamixer and the sound levels look ok.
I ran the test as root from console so that pulseaudio/pipewire doesn't
get in the way.

Under xorg pavucontrol detects when I plug in headphones, and says
speaker unvailable, when I switch to headphones output it works, when I
unplug the headphones, speaker unavailable goes back to speaker.

So I kill X and pulseaudio, play audio on the console directly to alsa
instead of pulse and same thing, it plays but no sound on the speakers,
but sound on headphones when I plug them in

Alsamixer is using
default:0 sof-soundwire

Any idea what could be muting the speakers if alsamixer shows them
unmuted?

It is a kernel bug or userspace bug?

merlin:~# cat /proc/asound/*
cat: /proc/asound/card0: Is a directory
 0 [sofsoundwire   ]: sof-soundwire - sof-soundwire
                      Intel Soundwire SOF
  1:        : sequencer
  2: [ 0- 0]: digital audio playback
  3: [ 0- 1]: digital audio capture
  4: [ 0- 2]: digital audio playback
  5: [ 0- 4]: digital audio capture
  6: [ 0- 5]: digital audio playback
  7: [ 0- 6]: digital audio playback
  8: [ 0- 7]: digital audio playback
  9: [ 0- 2]: hardware dependent
 10: [ 0]   : control
 33:        : timer
00-02: HDA Codec 2
 0 snd_soc_sof_sdw
cat: /proc/asound/oss: Is a directory
00-00: Jack Out (*) :  : playback 1
00-01: Jack In (*) :  : capture 1
00-02: Speaker (*) :  : playback 1
00-04: Microphone (*) :  : capture 1
00-05: HDMI 1 (*) :  : playback 1
00-06: HDMI 2 (*) :  : playback 1
00-07: HDMI 3 (*) :  : playback 1
cat: /proc/asound/seq: Is a directory
cat: /proc/asound/sofsoundwire: Is a directory
G0: system timer : 4000.000us (10000000 ticks)
G3: HR timer : 0.001us (1000000000 ticks)
  Client sequencer queue 1 : stopped
P0-0-0: PCM playback 0-0-0 : 21333.333us (1 ticks) SLAVE
P0-1-1: PCM capture 0-1-1 : SLAVE
P0-2-0: PCM playback 0-2-0 : SLAVE
P0-4-1: PCM capture 0-4-1 : SLAVE
P0-5-0: PCM playback 0-5-0 : SLAVE
P0-6-0: PCM playback 0-6-0 : SLAVE
P0-7-0: PCM playback 0-7-0 : SLAVE
Advanced Linux Sound Architecture Driver Version k6.6.8-amd64-volpre-sysrq-20231218.

merlin:~# dmesg | grep -E '(snd|sof|soundcore)'
[    0.090196] software IO TLB: area num 32.
[    1.567086] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    1.567087] software IO TLB: mapped [mem 0x0000000053683000-0x0000000057683000] (64MB)
[   15.941644] snd_hda_intel 0000:00:1f.3: vgaarb: pci_notify
[   15.941656] snd_hda_intel 0000:00:1f.3: runtime IRQ mapping not provided by arch
[   15.941662] snd_hda_intel 0000:00:1f.3: DSP detected with PCI class/subclass/prog-if info 0x040100
[   15.942126] snd_hda_intel 0000:00:1f.3: SoundWire enabled on CannonLake+ platform, using SOF driver
[   15.942151] snd_hda_intel 0000:00:1f.3: vgaarb: pci_notify
[   16.089302] sof-audio-pci-intel-tgl 0000:00:1f.3: vgaarb: pci_notify
[   16.089311] sof-audio-pci-intel-tgl 0000:00:1f.3: runtime IRQ mapping not provided by arch
[   16.089317] sof-audio-pci-intel-tgl 0000:00:1f.3: power state changed by ACPI to D0
[   16.089320] sof-audio-pci-intel-tgl 0000:00:1f.3: ACPI _REG connect evaluation failed (5)
[   16.089417] sof-audio-pci-intel-tgl 0000:00:1f.3: DSP detected with PCI class/subclass/prog-if info 0x040100
[   16.089503] sof-audio-pci-intel-tgl 0000:00:1f.3: SoundWire enabled on CannonLake+ platform, using SOF driver
[   16.089542] sof-audio-pci-intel-tgl 0000:00:1f.3: enabling device (0000 -> 0002)
[   16.089937] sof-audio-pci-intel-tgl 0000:00:1f.3: vgaarb: pci_notify
[   16.090083] sof-audio-pci-intel-tgl 0000:00:1f.3: DSP detected with PCI class/subclass/prog-if 0x040100
[   16.090473] sof-audio-pci-intel-tgl 0000:00:1f.3: bound 0000:00:02.0 (ops i915_audio_component_bind_ops [i915])
[   16.102000] sof-audio-pci-intel-tgl 0000:00:1f.3: use msi interrupt mode
[   16.102152] sof-audio-pci-intel-tgl 0000:00:1f.3: enabling bus mastering
[   16.120035] sof-audio-pci-intel-tgl 0000:00:1f.3: hda codecs found, mask 4
[   16.125472] sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware info: version 2:2:0-57864
[   16.125499] sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware: ABI 3:22:1 Kernel ABI 3:23:0
[   16.125522] sof-audio-pci-intel-tgl 0000:00:1f.3: unknown sof_ext_man header type 3 size 0x30
[   16.218672] sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware info: version 2:2:0-57864
[   16.218704] sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware: ABI 3:22:1 Kernel ABI 3:23:0
[   16.235176] sof-audio-pci-intel-tgl 0000:00:1f.3: Topology: ABI 3:22:1 Kernel ABI 3:23:0
[   16.235457] sof_sdw sof_sdw: ASoC: Parent card not yet available, widget card binding deferred
[   16.285146] sof_sdw sof_sdw: hda_dsp_hdmi_build_controls: no PCM in topology for HDMI converter 3
[   16.304414] input: sof-soundwire Headset Jack as /devices/pci0000:00/0000:00:1f.3/sof_sdw/sound/card0/input12
[   16.307681] input: sof-soundwire HDMI/DP,pcm=5 as /devices/pci0000:00/0000:00:1f.3/sof_sdw/sound/card0/input13
[   16.314904] input: sof-soundwire HDMI/DP,pcm=6 as /devices/pci0000:00/0000:00:1f.3/sof_sdw/sound/card0/input14
[   16.321892] input: sof-soundwire HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:1f.3/sof_sdw/sound/card0/input15


merlin:~# lsmod | grep -E "(^snd|sof|soundwire)"
snd_seq_dummy          12288  0
snd_hrtimer            12288  1
snd_ctl_led            24576  0
snd_soc_sof_sdw        86016  3
snd_soc_intel_hda_dsp_common    16384  1 snd_soc_sof_sdw
snd_soc_intel_sof_maxim_common    20480  1 snd_soc_sof_sdw
snd_sof_probes         24576  0
snd_soc_rt711_sdca     53248  1
snd_soc_rt715_sdca     45056  1
snd_hda_codec_hdmi     90112  1
snd_soc_rt1316_sdw     28672  2
snd_soc_dmic           12288  0
snd_sof_pci_intel_tgl    12288  2
snd_sof_intel_hda_common   208896  1 snd_sof_pci_intel_tgl
snd_sof_intel_hda      24576  1 snd_sof_intel_hda_common
snd_sof_pci            24576  2 snd_sof_intel_hda_common,snd_sof_pci_intel_tgl
snd_sof_xtensa_dsp     12288  1 snd_sof_intel_hda_common
snd_sof               352256  4 snd_sof_pci,snd_sof_intel_hda_common,snd_sof_probes,snd_sof_intel_hda
snd_sof_utils          16384  1 snd_sof
snd_soc_hdac_hda       24576  1 snd_sof_intel_hda_common
snd_soc_acpi_intel_match    98304  2 snd_sof_intel_hda_common,snd_sof_pci_intel_tgl
snd_soc_acpi           16384  2 snd_soc_acpi_intel_match,snd_sof_intel_hda_common
snd_hda_intel          57344  0
snd_intel_dspcfg       36864  3 snd_hda_intel,snd_sof,snd_sof_intel_hda_common
snd_intel_sdw_acpi     16384  2 snd_sof_intel_hda_common,snd_intel_dspcfg
snd_hda_codec         217088  5 snd_hda_codec_hdmi,snd_hda_intel,snd_soc_intel_hda_dsp_common,snd_soc_hdac_hda,snd_sof_intel_hda
snd_hwdep              20480  1 snd_hda_codec
soundwire_intel        69632  5 snd_sof_intel_hda_common
snd_sof_intel_hda_mlink    40960  2 soundwire_intel,snd_sof_intel_hda_common
soundwire_cadence      40960  1 soundwire_intel
snd_hda_ext_core       40960  4 snd_sof_intel_hda_common,snd_soc_hdac_hda,snd_sof_intel_hda_mlink,snd_sof_intel_hda
snd_hda_core          147456  8 snd_hda_codec_hdmi,snd_hda_intel,snd_hda_ext_core,snd_hda_codec,snd_soc_intel_hda_dsp_common,snd_sof_intel_hda_common,snd_soc_hdac_hda,snd_sof_intel_hda
soundwire_generic_allocation    12288  1 soundwire_intel
snd_soc_core          421888  11 snd_soc_sof_sdw,snd_soc_rt715_sdca,snd_soc_rt1316_sdw,soundwire_intel,snd_sof,snd_sof_intel_hda_common,snd_soc_hdac_hda,snd_soc_rt711_sdca,snd_soc_intel_sof_maxim_common,snd_sof_probes,snd_soc_dmic
snd_compress           28672  2 snd_soc_core,snd_sof_probes
snd_pcm_dmaengine      16384  1 snd_soc_core
snd_pcm               192512  16 snd_soc_rt715_sdca,snd_hda_codec_hdmi,snd_soc_rt1316_sdw,snd_hda_intel,snd_hda_codec,soundwire_intel,snd_sof,snd_sof_intel_hda_common,snd_compress,snd_soc_rt711_sdca,snd_soc_core,snd_sof_utils,snd_soc_intel_sof_maxim_common,snd_hda_core,snd_pcm_dmaengine
snd_seq_midi           20480  0
snd_seq_midi_event     16384  1 snd_seq_midi
snd_rawmidi            53248  1 snd_seq_midi
snd_seq               106496  9 snd_seq_midi,snd_seq_midi_event,snd_seq_dummy
snd_seq_device         16384  3 snd_seq,snd_seq_midi,snd_rawmidi
snd_timer              49152  3 snd_seq,snd_hrtimer,snd_pcm
snd                   155648  21 snd_ctl_led,snd_soc_sof_sdw,snd_seq,snd_seq_device,snd_hda_codec_hdmi,snd_hwdep,snd_hda_intel,snd_hda_codec,snd_sof,snd_timer,snd_compress,snd_soc_core,snd_pcm,snd_rawmidi

Thanks,
Marc
-- 
"A mouse is a device used to point at the xterm you want to type in" - A.S.R.
 
Home page: http://marc.merlins.org/  
