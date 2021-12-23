Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9817447E39F
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Dec 2021 13:39:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B1321913;
	Thu, 23 Dec 2021 13:38:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B1321913
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640263184;
	bh=i5LjiSPn1HBoFyweiXkeQw7tYmvTpvxUdDcKhZlcA5c=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qbxPXME69NqidXvZiJCnMnCrDJKlNLhG5yvFPj9hJ/8oq13dszd83Hln5Mac8ILLw
	 Ohj3jXJSuI5/V5bh9gw1ElIMGmMtA95kVJQzSH98Dd3wlJ/DeQcYiXtL1Px0HFMhWd
	 afbRC4L3zQgAWTcZxCVwPNKJoUVJGSeQ+qhV0nKU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96E40F80084;
	Thu, 23 Dec 2021 13:38:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7C93F80105; Thu, 23 Dec 2021 13:38:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF193F80084
 for <alsa-devel@alsa-project.org>; Thu, 23 Dec 2021 13:38:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF193F80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VJ/DO19r"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 01597B81FE3;
 Thu, 23 Dec 2021 12:38:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3022BC36AE9;
 Thu, 23 Dec 2021 12:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640263103;
 bh=i5LjiSPn1HBoFyweiXkeQw7tYmvTpvxUdDcKhZlcA5c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VJ/DO19rhmg5j8io9OLdeflUpUju9fxYa4SRBHne6GYRi3Lo6Cc7BNI2M++CRPB2w
 jGI5YpGm1E4Eqq4Cjc6N6BuSWQWlZnuSXvrAlQU6BZkmQSEXLCh+SQg33NV+iGeFYi
 NtJF6o2w435m13uG28Dah9+7slFmzjel20tywxofRcKi3lOV1/adbJMtnF83MnxHPP
 tTSnMTA63B5bfo5gqNnl9e5Ar+qkJYQifs1LeEzcXrfU70vpDZPDbRuJEKtWD6jkIF
 c4TnWh+G77G8B1MZXTHUcXbZgT8IB2GLrl5+D6kKX35l/PUg3ywF2uE+3DIKADi7N4
 KICI5QSx9+fSQ==
Date: Thu, 23 Dec 2021 13:38:19 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 3/5] ASoC: Intel: add machine driver for SOF+ES8336
Message-ID: <20211223133819.6e828605@coco.lan>
In-Reply-To: <20211223124515.31096a6a@coco.lan>
References: <20211004213512.220836-1-pierre-louis.bossart@linux.intel.com>
 <20211004213512.220836-4-pierre-louis.bossart@linux.intel.com>
 <20211121190035.2a5e3ad7@sal.lan>
 <137f321b-0be3-eeb2-b6f3-a88d687f7848@linux.intel.com>
 <20211223124515.31096a6a@coco.lan>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 tiwai@suse.de, Huajun Li <huajun.li@intel.com>, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

Em Thu, 23 Dec 2021 12:45:15 +0100
Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:

> Hi Pierre-Louis,
> 
> Em Mon, 22 Nov 2021 10:45:35 -0600
> Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com> escreveu:
> 
> > Hi Mauro,
> > 
> > >> Add machine driver to support APL/GLK/TGL platforms.
> > >> The TGL platform supports DMIC, APL and GLK do not.  
> > > 
> > > I just bought a Comet Lake notebook with ES8336, but I'm having a hard
> > > time to make audio work on it.  
> > 
> > Yes, we're aware of this design and we've tried to help. There's a
> > series of devices based on this I2C/I2S device, which is the exception
> > to the rule that all Windows-based designs are based on HDaudio or
> > SoundWire. Intel wasn't informed of this device so we we've added quirks
> > device after device, as bug reports came in.
> > 
> > The CometLake enablement is tracked at
> > https://github.com/thesofproject/linux/issues/3248
> > 
> > I will upstream the two quirks for CometLake later today.
> > 
> > The latest hacky recipe to get the driver to probe is at
> > https://github.com/thesofproject/linux/pull/3107
> > 
> > There is still work to do for the 'topology' part. The comment
> > https://github.com/thesofproject/linux/issues/3248#issuecomment-959573378 has
> > a tar file with 3 possible options for the I2S/SSP connection.
> > 
> > The remaining part will be the codec driver, which is problematic for
> > now, we're still waiting for updates from the vendor and it's unclear
> > if/when they will be submitted.
> 
> Sorry for taking a long time to answer. I lost access to the notebook,
> due to a travel.
> 
> I applied all "es8336" branches from your tree altogether:
> 
> 	8af10fc5d7f4 (HEAD) Merge remote-tracking branch 'plbossart/fix/es8336-codec' into HEAD
> 	f47dc3daf1da Merge remote-tracking branch 'plbossart/fix/es8336-cml' into HEAD
> 	b8df4ae02c0a Merge remote-tracking branch 'plbossart/fix/es8336-acpi-hid' into HEAD
> 	5e149dc4d6e9 (plbossart/fix/sof-es8336-quirk) fixup! ALSA: intel-nhlt: add helper to detect SSP link mask
> 
> Unfortunately, it is failing to modprobe the SOF driver:
> 
> [    3.479810] snd_hda_intel 0000:00:1f.3: DSP detected with PCI class/subclass/prog-if info 0x040100
> [    3.479828] snd_hda_intel 0000:00:1f.3: Digital mics found on Skylake+ platform, using SOF driver
> [    3.479830] [681] snd_hda_intel 0000:00:1f.3: HDAudio driver not selected, aborting probe
> [    3.655569] snd_soc_skl 0000:00:1f.3: DSP detected with PCI class/subclass/prog-if info 0x040100
> [    3.655587] snd_soc_skl 0000:00:1f.3: Digital mics found on Skylake+ platform, using SOF driver
> [    3.706810] RPC: Registered named UNIX socket transport module.
> [    3.730708] sof-audio-pci-intel-cnl 0000:00:1f.3: DSP detected with PCI class/subclass/prog-if info 0x040100
> [    3.730728] sof-audio-pci-intel-cnl 0000:00:1f.3: Digital mics found on Skylake+ platform, using SOF driver
> [    3.730952] sof-audio-pci-intel-cnl 0000:00:1f.3: enabling device (0000 -> 0002)
> [    3.731103] sof-audio-pci-intel-cnl 0000:00:1f.3: DSP detected with PCI class/subclass/prog-if 0x040100
> [    3.731204] sof-audio-pci-intel-cnl 0000:00:1f.3: bound 0000:00:02.0 (ops i915_audio_component_bind_ops [i915])
> [    3.741143] sof-audio-pci-intel-cnl 0000:00:1f.3: use msi interrupt mode
> [    3.791894] [80] sof-audio-pci-intel-cnl 0000:00:1f.3: intel_nhlt_get_dmic_geo: found 2 format definitions
> [    3.791898] [80] sof-audio-pci-intel-cnl 0000:00:1f.3: intel_nhlt_get_dmic_geo: max channels found 2
> [    3.791900] [80] sof-audio-pci-intel-cnl 0000:00:1f.3: intel_nhlt_get_dmic_geo: Array with 2 dmics
> [    3.791902] [80] sof-audio-pci-intel-cnl 0000:00:1f.3: intel_nhlt_get_dmic_geo: dmic number 2 max_ch 2
> [    3.791904] sof-audio-pci-intel-cnl 0000:00:1f.3: hda codecs found, mask 4
> [    3.793102] sof-audio-pci-intel-cnl 0000:00:1f.3: Firmware info: version 1:9:2-e096c
> [    3.793108] sof-audio-pci-intel-cnl 0000:00:1f.3: Firmware: ABI 3:20:0 Kernel ABI 3:18:0
> [    3.793110] sof-audio-pci-intel-cnl 0000:00:1f.3: warn: FW ABI is more recent than kernel
> [    3.793114] sof-audio-pci-intel-cnl 0000:00:1f.3: unknown sof_ext_man header type 3 size 0x30
> [    3.852602] Bluetooth: BNEP socket layer initialized
> [    3.891581] sof-audio-pci-intel-cnl 0000:00:1f.3: Firmware info: version 1:9:2-e096c
> [    3.891585] sof-audio-pci-intel-cnl 0000:00:1f.3: Firmware: ABI 3:20:0 Kernel ABI 3:18:0
> [    3.891588] sof-audio-pci-intel-cnl 0000:00:1f.3: warn: FW ABI is more recent than kernel
> [    3.901310] sof-essx8336 sof-essx8336: quirk SSP2
> [    3.903162] sof-audio-pci-intel-cnl 0000:00:1f.3: Topology: ABI 3:20:0 Kernel ABI 3:18:0
> [    3.903167] sof-audio-pci-intel-cnl 0000:00:1f.3: warn: topology ABI is more recent than kernel
> [    3.903180] sof-audio-pci-intel-cnl 0000:00:1f.3: error: can't connect DAI SSP0.OUT stream SSP0-Codec
> [    3.903182] sof-audio-pci-intel-cnl 0000:00:1f.3: error: failed to add widget id 0 type 27 name : SSP0.OUT stream SSP0-Codec
> [    3.903184] sof-essx8336 sof-essx8336: ASoC: failed to load widget SSP0.OUT
> [    3.903185] sof-essx8336 sof-essx8336: ASoC: topology: could not load header: -22
> [    3.903187] sof-audio-pci-intel-cnl 0000:00:1f.3: error: tplg component load failed -22
> [    3.903191] sof-audio-pci-intel-cnl 0000:00:1f.3: error: failed to load DSP topology -22
> [    3.903193] sof-audio-pci-intel-cnl 0000:00:1f.3: ASoC: error at snd_soc_component_probe on 0000:00:1f.3: -22
> [    3.903201] sof-essx8336 sof-essx8336: ASoC: failed to instantiate card -22
> [    3.903302] sof-essx8336 sof-essx8336: snd_soc_register_card failed: -22
> [    3.903304] sof-essx8336: probe of sof-essx8336 failed with error -22
> 
> Any hints about how to fix the topology issues on it?

Adding a quirk to modprobe partially solved the issue:

	https://github.com/thesofproject/linux/issues/3248#issuecomment-1000275241

With that, the speaker is now working fine, but microphone is marked
as unavailable, and headphones aren't working yet.

Thanks,
Mauro
