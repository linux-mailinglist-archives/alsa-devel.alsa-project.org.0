Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 972ED8221BF
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jan 2024 20:08:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1647BE9D;
	Tue,  2 Jan 2024 20:08:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1647BE9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704222495;
	bh=jClnt4rzvFUUv7Eom43v4OTG5gscrsuV/WZCXvUpXa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pTk1BFdevuaYcI0QC8U1VGljiaP8xnwoC8YO65Uflgix4j6Fhy22fV/jIwI4Zq5ap
	 T/3+duE+dQBr9I7F6JHMq0735tOlSXcYgt1JU+buCKGBdRgga1G7xGnb45DYE54mel
	 NsKK5I1/IwV81Obd53pMgYGZebYTNIRzVIq6LAyc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DFE7F80616; Tue,  2 Jan 2024 20:06:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 116D3F8061E;
	Tue,  2 Jan 2024 20:06:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C72FF8065C; Tue,  2 Jan 2024 20:00:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from isilmar-4.linta.de (isilmar-4.linta.de [136.243.71.142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4AAB7F80699
	for <alsa-devel@alsa-project.org>; Tue,  2 Jan 2024 19:54:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AAB7F80699
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
	by isilmar-4.linta.de (Postfix) with ESMTPSA id 2AAD42002EC;
	Tue,  2 Jan 2024 17:38:32 +0000 (UTC)
Received: by shine.dominikbrodowski.net (Postfix, from userid 1000)
	id E6FCBA0083; Tue,  2 Jan 2024 18:37:45 +0100 (CET)
Date: Tue, 2 Jan 2024 18:37:45 +0100
From: Dominik Brodowski <linux@dominikbrodowski.net>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: Oops in hdac_hda_dev_probe (6.7-rc7)
Message-ID: <ZZRJ6VNJlQ97bnjF@shine.dominikbrodowski.net>
References: <ZYvUIxtrqBQZbNlC@shine.dominikbrodowski.net>
 <87sf3lxiet.wl-tiwai@suse.de>
 <ZY7kosArPqhlCfOA@shine.dominikbrodowski.net>
 <874jg1x7ao.wl-tiwai@suse.de>
 <ZY_Gb8-rncuOjRq-@shine.dominikbrodowski.net>
 <87plyovwg7.wl-tiwai@suse.de>
 <3260e806-a708-4462-9d4e-346e54143a65@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3260e806-a708-4462-9d4e-346e54143a65@linux.intel.com>
Message-ID-Hash: 3JIVJ62NNM6QXJMFCN2XMEBOC2F3B6BH
X-Message-ID-Hash: 3JIVJ62NNM6QXJMFCN2XMEBOC2F3B6BH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3JIVJ62NNM6QXJMFCN2XMEBOC2F3B6BH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Am Tue, Jan 02, 2024 at 11:08:47AM +0200 schrieb Péter Ujfalusi:
> 
> 
> On 30/12/2023 12:03, Takashi Iwai wrote:
> > On Sat, 30 Dec 2023 08:27:43 +0100,
> > Dominik Brodowski wrote:
> >>
> >> Am Fri, Dec 29, 2023 at 06:11:43PM +0100 schrieb Takashi Iwai:
> >>> On Fri, 29 Dec 2023 16:24:18 +0100,
> >>> Dominik Brodowski wrote:
> >>>>
> >>>> Hi Takashi,
> >>>>
> >>>> many thanks for your response. Your patch helps half-way: the oops goes
> >>>> away, but so does the sound... With your patch, the decisive lines in dmesg
> >>>> are:
> >>>>
> >>>> 	sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware info: version 2:2:0-57864
> >>>> 	sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware: ABI 3:22:1 Kernel ABI 3:23:0
> >>>> 	sof_sdw sof_sdw: ASoC: CODEC DAI intel-hdmi-hifi1 not registered
> >>>> 	sof_sdw sof_sdw: snd_soc_register_card failed -517
> >>>> 	sof_sdw sof_sdw: ASoC: CODEC DAI intel-hdmi-hifi1 not registered
> >>>> 	sof_sdw sof_sdw: snd_soc_register_card failed -517
> >>>> 	platform sof_sdw: deferred probe pending
> >>>>
> >>>> With a revert of the a0575b4add21, it is:
> >>>>
> >>>> 	sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware info: version 2:2:0-57864
> >>>> 	sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware: ABI 3:22:1 Kernel ABI 3:23:0
> >>>> 	sof-audio-pci-intel-tgl 0000:00:1f.3: Topology: ABI 3:22:1 Kernel ABI 3:23:0
> >>>> 	sof_sdw sof_sdw: ASoC: Parent card not yet available, widget card binding deferred
> >>>> 	sof_sdw sof_sdw: hda_dsp_hdmi_build_controls: no PCM in topology for HDMI converter 3
> >>>> 	input: sof-soundwire HDMI/DP,pcm=5 as /devices/pci0000:00/0000:00:1f.3/sof_sdw/sound/card0/input14
> >>>> 	input: sof-soundwire HDMI/DP,pcm=6 as /devices/pci0000:00/0000:00:1f.3/sof_sdw/sound/card0/input15
> >>>> 	input: sof-soundwire HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:1f.3/sof_sdw/sound/card0/input16
> >>>>
> >>>> Maybe this helps a bit further?
> >>>
> >>> Thanks for quick testing.
> >>> It shows at least that my guess wasn't wrong.
> >>>
> >>> The problem could be the initialization order in the caller side.
> >>> Can the patch below work instead?
> >>
> >> Unfortunately, no:
> >>
> >> sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware info: version 2:2:0-57864
> >> sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware: ABI 3:22:1 Kernel ABI 3:23:0
> >> sof_sdw sof_sdw: ASoC: CODEC DAI intel-hdmi-hifi1 not registered
> >> sof_sdw sof_sdw: snd_soc_register_card failed -517
> >> sof_sdw sof_sdw: ASoC: CODEC DAI intel-hdmi-hifi1 not registered
> >> sof_sdw sof_sdw: snd_soc_register_card failed -517
> >> platform sof_sdw: deferred probe pending
> > 
> > Hm, then it might be the logical failure of that commit.
> > Peter?
> > 
> > Without a fix in the next few days, we'll have to revert it before
> > 6.7.
> 
> The fix for this was sent early December:
> https://lore.kernel.org/linux-sound/20231207095425.19597-1-peter.ujfalusi@linux.intel.com/

Yes, that patch fixes the issue (all built-in here).

Thanks,
	Dominik
