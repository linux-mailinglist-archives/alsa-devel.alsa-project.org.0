Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9324E1899F2
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Mar 2020 11:51:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 146BB1750;
	Wed, 18 Mar 2020 11:50:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 146BB1750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584528685;
	bh=sZ3NyTx50aktjWA+ilIR1u2zXlmNCTb5WrgL8wea/s8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M8c46CGPb/o0R3UqYP6VHph+Z6YN2oxM5a8/py0SaWCsBiRxR+osTBSM5BkfLOuAH
	 7+9zZgKL94JgkgYri8S9XvqAvPkn895FOYiTpHymt6bVZxyEJgLS8m9EjaEWhr0VMN
	 F7SL7p/cYZcPeoQWENSonXQiERDTzwuyUCZh41O8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F341AF800B7;
	Wed, 18 Mar 2020 11:49:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21D90F80132; Wed, 18 Mar 2020 11:49:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25BB7F800B7
 for <alsa-devel@alsa-project.org>; Wed, 18 Mar 2020 11:49:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25BB7F800B7
IronPort-SDR: gzIoJgddW3BoYTiDjsMyEASYe58QLRXDMu1VYb/c/vpBoQyW/gs5tnDp6SQ2EewyHQsGx2FmLr
 x1g1JMmEMsrA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2020 03:49:37 -0700
IronPort-SDR: 6nD/civf1X1VTM445hEQVCR8wZBfwTXx7kueZpouG9q6wgYQobfi3GdLSKGEQsyQfNthr8xMc/
 JW3egpM/xqWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,566,1574150400"; d="scan'208";a="324128902"
Received: from hwang33-mobl.ccr.corp.intel.com (HELO [10.254.210.239])
 ([10.254.210.239])
 by orsmga001.jf.intel.com with ESMTP; 18 Mar 2020 03:49:34 -0700
Subject: Re: snd_hda_intel/sst-acpi sound breakage on suspend/resume since
 5.6-rc1
To: Dominik Brodowski <linux@dominikbrodowski.net>,
 cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com,
 liam.r.girdwood@linux.intel.com, broonie@kernel.org, perex@perex.cz,
 tiwai@suse.com
References: <20200318063022.GA116342@light.dominikbrodowski.net>
From: Keyon Jie <yang.jie@linux.intel.com>
Message-ID: <41d0b2b5-6014-6fab-b6a2-7a7dbc4fe020@linux.intel.com>
Date: Wed, 18 Mar 2020 18:49:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200318063022.GA116342@light.dominikbrodowski.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: curtis@malainey.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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



On 3/18/20 2:30 PM, Dominik Brodowski wrote:
> Hi!
> 
> While 5.5.x works fine, mainline as of ac309e7744be (v5.6-rc6+) causes me
> some sound-related trouble: after boot, the sound works fine -- but once I
> suspend and resume my broadwell-based XPS13, I need to switch to headphone
> and back to speaker to hear something. But what I hear isn't music but
> garbled output.
> 
> A few dmesg snippets from v5.6-rc6-9-gac309e7744be which might be of
> interest. I've highlighted the lines differing from v.5.5.x which might be
> of special interest:
> 
> 	...
> 	snd_hda_intel 0000:00:03.0: enabling device (0000 -> 0002)
> 	usbcore: registered new interface driver snd-usb-audio
> 	snd_hda_intel 0000:00:03.0: bound 0000:00:02.0 (ops i915_audio_component_bind_ops)
> 	input: HDA Intel HDMI HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:03.0/sound/card0/input13
> 	input: HDA Intel HDMI HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:03.0/sound/card0/input14
> 	input: HDA Intel HDMI HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:03.0/sound/card0/input15
> 	input: HDA Intel HDMI HDMI/DP,pcm=9 as /devices/pci0000:00/0000:00:03.0/sound/card0/input16
> 	input: HDA Intel HDMI HDMI/DP,pcm=10 as /devices/pci0000:00/0000:00:03.0/sound/card0/input17
> 	Console: switching to colour frame buffer device 240x67
> !!!	sst-acpi INT3438:00: WARN: Device release is not defined so it is not safe to unbind this driver while in use
> 	i915 0000:00:02.0: fb0: i915drmfb frame buffer device
> 	sst-acpi INT3438:00: DesignWare DMA Controller, 8 channels
> 	psmouse serio1: synaptics: Unable to query device: -5
> 	haswell-pcm-audio haswell-pcm-audio: Direct firmware load for intel/IntcPP01.bin failed with error -2
> 	haswell-pcm-audio haswell-pcm-audio: fw image intel/IntcPP01.bin not available(-2)
> 	haswell-pcm-audio haswell-pcm-audio: FW loaded, mailbox readback FW info: type 01, - version: 00.00, build 77, source commit id: 876ac6906f31a43b6772b23c7c983ce9dcb18a19
> 	rt286 i2c-INT343A:00: ASoC: sink widget DMIC1 overwritten
> 	rt286 i2c-INT343A:00: ASoC: source widget DMIC1 overwritten
> 	broadwell-audio broadwell-audio: snd-soc-dummy-dai <-> System Pin mapping ok
> 	broadwell-audio broadwell-audio: snd-soc-dummy-dai <-> Offload0 Pin mapping ok
> 	broadwell-audio broadwell-audio: snd-soc-dummy-dai <-> Offload1 Pin mapping ok
> 	broadwell-audio broadwell-audio: snd-soc-dummy-dai <-> Loopback Pin mapping ok
> 	broadwell-audio broadwell-audio: rt286-aif1 <-> snd-soc-dummy-dai mapping ok
> 	input: broadwell-rt286 Headset as /devices/pci0000:00/INT3438:00/broadwell-audio/sound/card1/input18
> 	...
> 	ALSA device list:
> 	  #0: HDA Intel HDMI at 0xf7218000 irq 48
> 	  #1: DellInc.-XPS139343--0TM99H
> 	...
> !!!	haswell-pcm-audio haswell-pcm-audio: warning: stream is NULL, no stream to reset, ignore it.
> !!!	haswell-pcm-audio haswell-pcm-audio: warning: stream is NULL, no stream to free, ignore it.
> 
> (these last two messages already are printed a couple of time after boot, and then
> again during a suspend/resume cycle. On v.5.5.y, there are similar messages
> "no context buffer need to restore!"). Everything is built-in, no modules
> are loaded.
> 
> Unfortunately, I cannot bisect this issue easily -- i915 was broken for
> quite some time on this system[*], prohibiting boot...
> 
> Thanks for taking a look at this issue!
> 
> 	Dominik
> 
> 
> [*] https://gitlab.freedesktop.org/drm/intel/issues/1151
> 

Hi Dominik,

Thanks for reporting, yes, this is Keyon(Yang Jie) here, we do have 
several other Broadwell comercial platforms in the market, adding Curtis 
from Google in case they may hit similar issue once upgrading to the 
latest kernel.

 From your description above, it looks the ucm and pulseaudio is 
involved, can you help do a quick try if using aplay directly will hit 
the same issue?

Thanks,
~Keyon
