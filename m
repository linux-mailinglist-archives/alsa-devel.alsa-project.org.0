Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 558F98221C0
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jan 2024 20:08:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DABFBE8A;
	Tue,  2 Jan 2024 20:08:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DABFBE8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704222510;
	bh=oKhJf3n1cMB9x62W62JgegL4YxXrFEM0IUw/XE2X0Fw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nHMaYjBkG3MGs7jnGoLVstEO9a3VJpxiyhAvs81fAE0oIiWzOvOg6M+3G7rTUGcI6
	 ++5ii+4ap2IFiKNz2VMh390LUx2FshepJOAXgJMqXS0OBcuMG9Zqoh6gww2FydoI7X
	 saJZ/OHdBBGhbur16WKN3bOkRvQPQbErMTRcIqFo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C57F8F8064F; Tue,  2 Jan 2024 20:06:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F080F8064C;
	Tue,  2 Jan 2024 20:06:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8011DF80537; Tue,  2 Jan 2024 20:00:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 40561F8057A
	for <alsa-devel@alsa-project.org>; Tue,  2 Jan 2024 19:54:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40561F8057A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Ttzh2bqT;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=N5682qh9;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=Ttzh2bqT;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=N5682qh9
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 903A61FCED;
	Tue,  2 Jan 2024 09:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1704187501;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=10ALmBdejT/UDcEl5ROuUx4qyQxUrE5NQXpj4f4LXhM=;
	b=Ttzh2bqTXlR+ctkzKcEGO5U82EgJsVZmlsMID1iJI8iHitzJnSoO9kql9D8Ik6UlfE2MPp
	Q/HSwPqijdFbNc2jQa0r0yhcTiEnrRWrsBomjmvKixTKb5fIT4s7K06IVMwjDeWOCfzD8H
	M2VqJ7QzaYCFPq2scRGQtvZcdeLrP3k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1704187501;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=10ALmBdejT/UDcEl5ROuUx4qyQxUrE5NQXpj4f4LXhM=;
	b=N5682qh9z3GlftWXoHQBcq/L08wRXX07bHovWWirdPKPKiJQrL9ZBEK69eKSTTSIsPwgJF
	2h+vvg7JI6azhcCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1704187501;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=10ALmBdejT/UDcEl5ROuUx4qyQxUrE5NQXpj4f4LXhM=;
	b=Ttzh2bqTXlR+ctkzKcEGO5U82EgJsVZmlsMID1iJI8iHitzJnSoO9kql9D8Ik6UlfE2MPp
	Q/HSwPqijdFbNc2jQa0r0yhcTiEnrRWrsBomjmvKixTKb5fIT4s7K06IVMwjDeWOCfzD8H
	M2VqJ7QzaYCFPq2scRGQtvZcdeLrP3k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1704187501;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=10ALmBdejT/UDcEl5ROuUx4qyQxUrE5NQXpj4f4LXhM=;
	b=N5682qh9z3GlftWXoHQBcq/L08wRXX07bHovWWirdPKPKiJQrL9ZBEK69eKSTTSIsPwgJF
	2h+vvg7JI6azhcCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 336B213AC6;
	Tue,  2 Jan 2024 09:25:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rZVDC23Wk2XpCgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 02 Jan 2024 09:25:01 +0000
Date: Tue, 02 Jan 2024 10:25:00 +0100
Message-ID: <87y1d8ulxv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: Dominik Brodowski <linux@dominikbrodowski.net>,
	Mark Brown <broonie@kernel.org>,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: Oops in hdac_hda_dev_probe (6.7-rc7)
In-Reply-To: <3260e806-a708-4462-9d4e-346e54143a65@linux.intel.com>
References: <ZYvUIxtrqBQZbNlC@shine.dominikbrodowski.net>
	<87sf3lxiet.wl-tiwai@suse.de>
	<ZY7kosArPqhlCfOA@shine.dominikbrodowski.net>
	<874jg1x7ao.wl-tiwai@suse.de>
	<ZY_Gb8-rncuOjRq-@shine.dominikbrodowski.net>
	<87plyovwg7.wl-tiwai@suse.de>
	<3260e806-a708-4462-9d4e-346e54143a65@linux.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.10 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[13];
	 MID_CONTAINS_FROM(1.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[dominikbrodowski.net,kernel.org,gmail.com,perex.cz,suse.com,alsa-project.org,vger.kernel.org,linux.intel.com,lists.linux.dev];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
Authentication-Results: smtp-out2.suse.de;
	none
Message-ID-Hash: 6A7MSA4IROLSTUUMI6HPUC3JX5MCX5RG
X-Message-ID-Hash: 6A7MSA4IROLSTUUMI6HPUC3JX5MCX5RG
X-MailFrom: tiwai@suse.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6A7MSA4IROLSTUUMI6HPUC3JX5MCX5RG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 02 Jan 2024 10:08:47 +0100,
Péter Ujfalusi wrote:
> 
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
> 
> It had the correct Fixes tag but it did not made it to 6.7-rc while
> a0575b4add21 did made it.
> 
> Mark, Takashi, can you pick the fix for 6.7 (it is in -next)? I think we
> might have time for it to land?

Oh that landed to Mark's for-next branch, i.e. only for 6.8.
Mark, please cherry-pick and send a PR before 6.7 final.

Meanwhile, Peter, please update the bugzilla entry to let people try
the patch.


thanks,

Takashi
