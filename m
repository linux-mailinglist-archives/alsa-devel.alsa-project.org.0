Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1E18225E2
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jan 2024 01:18:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA7A1E8C;
	Wed,  3 Jan 2024 01:18:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA7A1E8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704241135;
	bh=Vx37C83QB2jrSGY5/F8oVXT22XGQ0chUcVzTZecQAfY=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=sYyQVCA1Lxw5BOcEr0xRMlxo8uKxd3xSg1Aw/fYDGTQc5a00lzquTgbWqGYt5AO2z
	 jUqMRMjSkJNOELAzvNXFhqqGa9FDOaSXq7lt5k2qLl6gKO5kyK0UUw/MvS2HvgR6lO
	 qbiZsn38XulzMtq8O0nCa0u3Ts21qf4ehXbe4fq4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D8B4F805ED; Wed,  3 Jan 2024 01:18:16 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 00012F805D4;
	Wed,  3 Jan 2024 01:18:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9FA7DF80549; Wed,  3 Jan 2024 01:17:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail1.merlins.org (magic.merlins.org [209.81.13.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0EC62F80424
	for <alsa-devel@alsa-project.org>; Wed,  3 Jan 2024 01:17:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EC62F80424
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=merlins.org
	; s=key; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=n/9nnWnRZ0rimxBlp0vSyLr4rtsMJ7FSkkGqraZvLKI=; b=iU2uRpkY373lNHg703bjxe3fRQ
	Qf/qwQ72U2JKK6U+FV1dRSAk3ZxdwArZoHIWg61bBp2JoM2qPgLNB1bVIyrhzN3x2BQ7iK9ie55UY
	VDmpOvadZuEPCpOYU+jgWFkj0IfqbokpWzmg5tOJf2CdVbTR+K3qlw+Zd+OSH6njDNmLKbUhtI22d
	M/Bwx49pdm3J1jksdYbjGYoEpQ+1NM3hg0AkgKqJ7JR37Cj+4UbP2Mzq6Nj4fWqKzG6PYCt/xsW3y
	eSYkGny+GNdPTpZwkw5U4CnF9A2rlm8AjanCjJN/4vCCDB11KIjKke89YoRrQbaKsarnJvDifHazo
	geRJzsRQ==;
Received: from lfbn-idf3-1-20-89.w81-249.abo.wanadoo.fr ([81.249.147.89]:40104
 helo=merlin.svh.merlins.org)
	by mail1.merlins.org with esmtpsa
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim
 4.94.2 #2)
	id 1rIZAJ-00019z-Oj by authid <merlins.org> with srv_auth_plain;
 Wed, 27 Dec 2023 11:02:03 -0800
Received: from merlin by merlin.svh.merlins.org with local (Exim 4.96)
	(envelope-from <marc@merlins.org>)
	id 1rIZAI-0002RZ-0i;
	Wed, 27 Dec 2023 11:02:02 -0800
Date: Wed, 27 Dec 2023 11:02:02 -0800
From: Marc MERLIN <marc@merlins.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: sof-audio-pci-intel-tgl/soundwire 6.6.8 kernel outputs no sound
 on speakers but works on headphones
Message-ID: <ZYx0qurc3PfaxfT5@merlins.org>
References: <20231223234430.GA11359@merlins.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231223234430.GA11359@merlins.org>
X-Sysadmin: BOFH
X-URL: http://marc.merlins.org/
X-SA-Exim-Connect-IP: 81.249.147.89
X-SA-Exim-Mail-From: marc@merlins.org
Message-ID-Hash: FGKG4A3BWJ6GNSQDDHEMBFE36V77427X
X-Message-ID-Hash: FGKG4A3BWJ6GNSQDDHEMBFE36V77427X
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FGKG4A3BWJ6GNSQDDHEMBFE36V77427X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

I'm still stuck with no sound :-/
I did more testing and 6.5.0-14-generic from ubuntu gives sound when I
boot it in ubuntu 23, but the same kernel in debian 12, seems to load
but gives a device that only gives sound via headphones. Nothing through
the speakers, and they are not muted (as checked in alsamixer)

I ran a diff between dmesg between the 2 boots, and I do see when
running the same kernel in debian12:
input: sof-soundwire Headset Jack as /devices/pci0000:00/0000:00:1f.3/sof_sdw/sound/card0/input27
input: sof-soundwire HDMI/DP,pcm=5 as /devices/pci0000:00/0000:00:1f.3/sof_sdw/sound/card0/input28
input: sof-soundwire HDMI/DP,pcm=6 as /devices/pci0000:00/0000:00:1f.3/sof_sdw/sound/card0/input29
input: sof-soundwire HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:1f.3/sof_sdw/sound/card0/input30
sof-audio-pci-intel-tgl 0000:00:1f.3: ipc tx error for 0x60010000 (msg/reply size: 108/20): -5
sof-audio-pci-intel-tgl 0000:00:1f.3: HW params ipc failed for stream 1
sof-audio-pci-intel-tgl 0000:00:1f.3: ASoC: error at snd_soc_pcm_component_hw_params on 0000:00:1f.3: -5
sof-audio-pci-intel-tgl 0000:00:1f.3: ipc tx error for 0x60010000 (msg/reply size: 108/20): -5
sof-audio-pci-intel-tgl 0000:00:1f.3: HW params ipc failed for stream 1
sof-audio-pci-intel-tgl 0000:00:1f.3: ASoC: error at snd_soc_pcm_component_hw_params on 0000:00:1f.3: -5
sof-audio-pci-intel-tgl 0000:00:1f.3: ipc tx error for 0x60010000 (msg/reply size: 108/20): -5
sof-audio-pci-intel-tgl 0000:00:1f.3: HW params ipc failed for stream 1
sof-audio-pci-intel-tgl 0000:00:1f.3: ASoC: error at snd_soc_pcm_component_hw_params on 0000:00:1f.3: -5
sof-audio-pci-intel-tgl 0000:00:1f.3: ipc tx error for 0x60010000 (msg/reply size: 108/20): -5
sof-audio-pci-intel-tgl 0000:00:1f.3: HW params ipc failed for stream 1
sof-audio-pci-intel-tgl 0000:00:1f.3: ASoC: error at snd_soc_pcm_component_hw_params on 0000:00:1f.3: -5
sof-audio-pci-intel-tgl 0000:00:1f.3: ipc tx error for 0x60010000 (msg/reply size: 108/20): -5
sof-audio-pci-intel-tgl 0000:00:1f.3: HW params ipc failed for stream 1


merlin:/boot/sound# dmesg |grep intel-tgl
[   14.629851] sof-audio-pci-intel-tgl 0000:00:1f.3: DSP detected with PCI class/subclass/prog-if info 0x040100
[   14.631966] sof-audio-pci-intel-tgl 0000:00:1f.3: SoundWire enabled on CannonLake+ platform, using SOF driver
[   14.633819] sof-audio-pci-intel-tgl 0000:00:1f.3: enabling device (0000 -> 0002)
[   14.635615] sof-audio-pci-intel-tgl 0000:00:1f.3: DSP detected with PCI class/subclass/prog-if 0x040100
[   14.637179] sof-audio-pci-intel-tgl 0000:00:1f.3: bound 0000:00:02.0 (ops i915_audio_component_bind_ops [i915])
[   14.650766] sof-audio-pci-intel-tgl 0000:00:1f.3: use msi interrupt mode
[   14.668269] sof-audio-pci-intel-tgl 0000:00:1f.3: hda codecs found, mask 4
[   14.674395] sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware info: version 2:2:0-57864
[   14.675880] sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware: ABI 3:22:1 Kernel ABI 3:23:0
[   14.677283] sof-audio-pci-intel-tgl 0000:00:1f.3: unknown sof_ext_man header type 3 size 0x30
[   14.771750] sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware info: version 2:2:0-57864
[   14.773456] sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware: ABI 3:22:1 Kernel ABI 3:23:0
[   14.791223] sof-audio-pci-intel-tgl 0000:00:1f.3: Topology: ABI 3:22:1 Kernel ABI 3:23:0
[   23.851544] sof-audio-pci-intel-tgl 0000:00:1f.3: ipc tx error for 0x60010000 (msg/reply size: 108/20): -5
[   23.851573] sof-audio-pci-intel-tgl 0000:00:1f.3: HW params ipc failed for stream 1
[   23.851575] sof-audio-pci-intel-tgl 0000:00:1f.3: ASoC: error at snd_soc_pcm_component_hw_params on 0000:00:1f.3: -5
[   23.852609] sof-audio-pci-intel-tgl 0000:00:1f.3: ipc tx error for 0x60010000 (msg/reply size: 108/20): -5
[   23.852622] sof-audio-pci-intel-tgl 0000:00:1f.3: HW params ipc failed for stream 1
[   23.852630] sof-audio-pci-intel-tgl 0000:00:1f.3: ASoC: error at snd_soc_pcm_component_hw_params on 0000:00:1f.3: -5
[   23.853634] sof-audio-pci-intel-tgl 0000:00:1f.3: ipc tx error for 0x60010000 (msg/reply size: 108/20): -5
[   23.853645] sof-audio-pci-intel-tgl 0000:00:1f.3: HW params ipc failed for stream 1
[   23.853653] sof-audio-pci-intel-tgl 0000:00:1f.3: ASoC: error at snd_soc_pcm_component_hw_params on 0000:00:1f.3: -5
[   23.854644] sof-audio-pci-intel-tgl 0000:00:1f.3: ipc tx error for 0x60010000 (msg/reply size: 108/20): -5
[   23.854646] sof-audio-pci-intel-tgl 0000:00:1f.3: HW params ipc failed for stream 1
(...) many lines deleted

I realize that userspace is different and it could be a problem
with pipewire and wireplumber, but the ASoC errors above look
like a kernel issue. What do you think?


merlin:/boot/sound$ diff -u inxi_aA_*
--- inxi_aA_deb	2023-12-27 08:22:43.869118470 -0800
+++ inxi_aA_ubnt	2023-12-27 09:23:06.442760237 -0800
@@ -1,9 +1,10 @@
 Audio:
-  Device-1: Intel vendor: Dell driver: sof-audio-pci-intel-tgl
+  Device-1: Intel Raptor Lake-P/U/H cAVS vendor: Dell
+    driver: sof-audio-pci-intel-tgl
     alternate: snd_hda_intel,snd_sof_pci_intel_tgl bus-ID: 0000:00:1f.3
     chip-ID: 8086:51ca class-ID: 0401
-  API: ALSA v: k6.5.0-14-generic status: kernel-api with: aoss
-    type: oss-emulator tools: alsamixer,amixer
-  Server-1: PipeWire v: 0.3.65 status: active with: 1: pipewire-pulse
+  API: ALSA v: k6.5.0-14-generic status: kernel-api
+    tools: alsactl,alsamixer,amixer
+  Server-1: PipeWire v: 0.3.79 status: active with: 1: pipewire-pulse
     status: active 2: wireplumber status: active 3: pipewire-alsa type: plugin
-    4: pw-jack type: plugin tools: pactl,pw-cat,pw-cli,wpctl
+    tools: pw-cat,pw-cli,wpctl

merlin:/boot/sound$ diff -u wpctl_status_*
shows
 Audio
  ├─ Devices:
  │      44. sof-soundwire                       [alsa]
  │  
  ├─ Sinks:
- │  *   53. sof-soundwire Stereo                [vol: 1.00]
+ │      45. sof-soundwire HDMI / DisplayPort 3 Output [vol: 1.00]
+ │      46. sof-soundwire HDMI / DisplayPort 2 Output [vol: 1.00]
+ │      47. sof-soundwire HDMI / DisplayPort 1 Output [vol: 1.00]
+ │      48. sof-soundwire Headphones            [vol: 1.00]
+ │  *   49. sof-soundwire Speaker               [vol: 0.90]
  │  
  ├─ Sink endpoints:
  │  
  ├─ Sources:
+ │      50. sof-soundwire Headset Microphone    [vol: 1.00]
+ │  *   51. sof-soundwire SoundWire microphones [vol: 0.76]

Thanks,
Marc
-- 
"A mouse is a device used to point at the xterm you want to type in" - A.S.R.
 
Home page: http://marc.merlins.org/                       | PGP 7F55D5F27AAF9D08
