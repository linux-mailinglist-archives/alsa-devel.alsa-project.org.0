Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FC11895D8
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Mar 2020 07:32:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10844176E;
	Wed, 18 Mar 2020 07:31:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10844176E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584513151;
	bh=i5vrPHwjUsgvpOH/d6VCawWGpLKXYmqFNv/GLP+6f80=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SfZzl8S3wFxrTfwROW/CSG/aN0l/Gp+0ZYcwFX+oL9zzlCZLjhYUfx1b1988sOYPb
	 Brc/DDUlMRxhk7QTSUkI2T686TfUlsUnWl5k/PJVK1pM5I4P4/aXDkNxr3cAhv5N6C
	 O12gwXy9deHSPAaav9MygOtcVGLHeVBUXb5XoV1k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA8E3F80139;
	Wed, 18 Mar 2020 07:30:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFCABF80139; Wed, 18 Mar 2020 07:30:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from isilmar-4.linta.de (isilmar-4.linta.de [136.243.71.142])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECC65F80058
 for <alsa-devel@alsa-project.org>; Wed, 18 Mar 2020 07:30:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECC65F80058
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
Received: from light.dominikbrodowski.net (brodo.linta [10.1.0.102])
 by isilmar-4.linta.de (Postfix) with ESMTPSA id 06012200ADE;
 Wed, 18 Mar 2020 06:30:28 +0000 (UTC)
Received: by light.dominikbrodowski.net (Postfix, from userid 1000)
 id 42A1820821; Wed, 18 Mar 2020 07:30:22 +0100 (CET)
Date: Wed, 18 Mar 2020 07:30:22 +0100
From: Dominik Brodowski <linux@dominikbrodowski.net>
To: cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com,
 liam.r.girdwood@linux.intel.com, yang.jie@linux.intel.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Subject: snd_hda_intel/sst-acpi sound breakage on suspend/resume since 5.6-rc1
Message-ID: <20200318063022.GA116342@light.dominikbrodowski.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

Hi!

While 5.5.x works fine, mainline as of ac309e7744be (v5.6-rc6+) causes me
some sound-related trouble: after boot, the sound works fine -- but once I
suspend and resume my broadwell-based XPS13, I need to switch to headphone
and back to speaker to hear something. But what I hear isn't music but
garbled output.

A few dmesg snippets from v5.6-rc6-9-gac309e7744be which might be of
interest. I've highlighted the lines differing from v.5.5.x which might be
of special interest:

	...
	snd_hda_intel 0000:00:03.0: enabling device (0000 -> 0002)
	usbcore: registered new interface driver snd-usb-audio
	snd_hda_intel 0000:00:03.0: bound 0000:00:02.0 (ops i915_audio_component_bind_ops)
	input: HDA Intel HDMI HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:03.0/sound/card0/input13
	input: HDA Intel HDMI HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:03.0/sound/card0/input14
	input: HDA Intel HDMI HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:03.0/sound/card0/input15
	input: HDA Intel HDMI HDMI/DP,pcm=9 as /devices/pci0000:00/0000:00:03.0/sound/card0/input16
	input: HDA Intel HDMI HDMI/DP,pcm=10 as /devices/pci0000:00/0000:00:03.0/sound/card0/input17
	Console: switching to colour frame buffer device 240x67
!!!	sst-acpi INT3438:00: WARN: Device release is not defined so it is not safe to unbind this driver while in use
	i915 0000:00:02.0: fb0: i915drmfb frame buffer device
	sst-acpi INT3438:00: DesignWare DMA Controller, 8 channels
	psmouse serio1: synaptics: Unable to query device: -5
	haswell-pcm-audio haswell-pcm-audio: Direct firmware load for intel/IntcPP01.bin failed with error -2
	haswell-pcm-audio haswell-pcm-audio: fw image intel/IntcPP01.bin not available(-2)
	haswell-pcm-audio haswell-pcm-audio: FW loaded, mailbox readback FW info: type 01, - version: 00.00, build 77, source commit id: 876ac6906f31a43b6772b23c7c983ce9dcb18a19
	rt286 i2c-INT343A:00: ASoC: sink widget DMIC1 overwritten
	rt286 i2c-INT343A:00: ASoC: source widget DMIC1 overwritten
	broadwell-audio broadwell-audio: snd-soc-dummy-dai <-> System Pin mapping ok
	broadwell-audio broadwell-audio: snd-soc-dummy-dai <-> Offload0 Pin mapping ok
	broadwell-audio broadwell-audio: snd-soc-dummy-dai <-> Offload1 Pin mapping ok
	broadwell-audio broadwell-audio: snd-soc-dummy-dai <-> Loopback Pin mapping ok
	broadwell-audio broadwell-audio: rt286-aif1 <-> snd-soc-dummy-dai mapping ok
	input: broadwell-rt286 Headset as /devices/pci0000:00/INT3438:00/broadwell-audio/sound/card1/input18
	...
	ALSA device list:
	  #0: HDA Intel HDMI at 0xf7218000 irq 48
	  #1: DellInc.-XPS139343--0TM99H
	...
!!!	haswell-pcm-audio haswell-pcm-audio: warning: stream is NULL, no stream to reset, ignore it.
!!!	haswell-pcm-audio haswell-pcm-audio: warning: stream is NULL, no stream to free, ignore it.

(these last two messages already are printed a couple of time after boot, and then
again during a suspend/resume cycle. On v.5.5.y, there are similar messages
"no context buffer need to restore!"). Everything is built-in, no modules
are loaded.

Unfortunately, I cannot bisect this issue easily -- i915 was broken for
quite some time on this system[*], prohibiting boot...

Thanks for taking a look at this issue!

	Dominik


[*] https://gitlab.freedesktop.org/drm/intel/issues/1151
