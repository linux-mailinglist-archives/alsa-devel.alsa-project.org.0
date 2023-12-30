Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 291158221C4
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jan 2024 20:09:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1C1CE85;
	Tue,  2 Jan 2024 20:09:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1C1CE85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704222581;
	bh=GeOldI5c7/t6muoCGTMnLmytEPBPfHAMzSMSDSCAFO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lPvUnA6pxoFkzrkHSKQu25/4D7vdHUdBpuSKXtInGdKXhjcHFGskpgwVIhcHvoZfx
	 r+8gIdM8ilOTta4zJO+0A/aZkEO1iUYODuTR6b8MykQ8bbV5ExgloJbOkUMMdCXNZx
	 Wsaecz2UVQ64k9PXjlnwh6/T5Y1O6X+wp6LvTcXk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 627ABF806E5; Tue,  2 Jan 2024 20:07:02 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 07F87F806CF;
	Tue,  2 Jan 2024 20:07:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E29C6F80424; Tue,  2 Jan 2024 20:04:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from isilmar-4.linta.de (isilmar-4.linta.de [136.243.71.142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3A240F80051
	for <alsa-devel@alsa-project.org>; Tue,  2 Jan 2024 20:04:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A240F80051
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
X-isilmar-external: YES
Received: from shine.dominikbrodowski.net (shine.brodo.linta [10.2.0.112])
	by isilmar-4.linta.de (Postfix) with ESMTPSA id 5CD412002DB;
	Sat, 30 Dec 2023 07:27:53 +0000 (UTC)
Received: by shine.dominikbrodowski.net (Postfix, from userid 1000)
	id 1B011A0083; Sat, 30 Dec 2023 08:27:43 +0100 (CET)
Date: Sat, 30 Dec 2023 08:27:43 +0100
From: Dominik Brodowski <linux@dominikbrodowski.net>
To: Takashi Iwai <tiwai@suse.de>
Cc: peter.ujfalusi@linux.intel.com, lgirdwood@gmail.com, broonie@kernel.org,
	perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: Oops in hdac_hda_dev_probe (6.7-rc7)
Message-ID: <ZY_Gb8-rncuOjRq-@shine.dominikbrodowski.net>
References: <ZYvUIxtrqBQZbNlC@shine.dominikbrodowski.net>
 <87sf3lxiet.wl-tiwai@suse.de>
 <ZY7kosArPqhlCfOA@shine.dominikbrodowski.net>
 <874jg1x7ao.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874jg1x7ao.wl-tiwai@suse.de>
Message-ID-Hash: T4VTFS4V7BBSYRK5GWXUXFXGKHFMIZXT
X-Message-ID-Hash: T4VTFS4V7BBSYRK5GWXUXFXGKHFMIZXT
X-MailFrom: linux@dominikbrodowski.net
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T4VTFS4V7BBSYRK5GWXUXFXGKHFMIZXT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Am Fri, Dec 29, 2023 at 06:11:43PM +0100 schrieb Takashi Iwai:
> On Fri, 29 Dec 2023 16:24:18 +0100,
> Dominik Brodowski wrote:
> > 
> > Hi Takashi,
> > 
> > many thanks for your response. Your patch helps half-way: the oops goes
> > away, but so does the sound... With your patch, the decisive lines in dmesg
> > are:
> > 
> > 	sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware info: version 2:2:0-57864
> > 	sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware: ABI 3:22:1 Kernel ABI 3:23:0
> > 	sof_sdw sof_sdw: ASoC: CODEC DAI intel-hdmi-hifi1 not registered
> > 	sof_sdw sof_sdw: snd_soc_register_card failed -517
> > 	sof_sdw sof_sdw: ASoC: CODEC DAI intel-hdmi-hifi1 not registered
> > 	sof_sdw sof_sdw: snd_soc_register_card failed -517
> > 	platform sof_sdw: deferred probe pending
> > 
> > With a revert of the a0575b4add21, it is:
> > 
> > 	sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware info: version 2:2:0-57864
> > 	sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware: ABI 3:22:1 Kernel ABI 3:23:0
> > 	sof-audio-pci-intel-tgl 0000:00:1f.3: Topology: ABI 3:22:1 Kernel ABI 3:23:0
> > 	sof_sdw sof_sdw: ASoC: Parent card not yet available, widget card binding deferred
> > 	sof_sdw sof_sdw: hda_dsp_hdmi_build_controls: no PCM in topology for HDMI converter 3
> > 	input: sof-soundwire HDMI/DP,pcm=5 as /devices/pci0000:00/0000:00:1f.3/sof_sdw/sound/card0/input14
> > 	input: sof-soundwire HDMI/DP,pcm=6 as /devices/pci0000:00/0000:00:1f.3/sof_sdw/sound/card0/input15
> > 	input: sof-soundwire HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:1f.3/sof_sdw/sound/card0/input16
> > 
> > Maybe this helps a bit further?
> 
> Thanks for quick testing.
> It shows at least that my guess wasn't wrong.
> 
> The problem could be the initialization order in the caller side.
> Can the patch below work instead?

Unfortunately, no:

sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware info: version 2:2:0-57864
sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware: ABI 3:22:1 Kernel ABI 3:23:0
sof_sdw sof_sdw: ASoC: CODEC DAI intel-hdmi-hifi1 not registered
sof_sdw sof_sdw: snd_soc_register_card failed -517
sof_sdw sof_sdw: ASoC: CODEC DAI intel-hdmi-hifi1 not registered
sof_sdw sof_sdw: snd_soc_register_card failed -517
platform sof_sdw: deferred probe pending

Thanks,	
	Dominik
