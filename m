Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02126822247
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jan 2024 20:50:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FB01EB6;
	Tue,  2 Jan 2024 20:50:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FB01EB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704225042;
	bh=xXq3622DPUTYmXiLjYefHJ02P4X9CRfBreceetN466A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ejrhBQ7E2WFUUm31F6DbCOOfuO27HG9Rb+VojNn6kHSAKcYjqwWFVeTQRFuKd7Zyt
	 d0WRKZc7SyQoanXfAGdT3NZlRdAT+MwFwDA65are33L2OpyqkgD2u+FDCmFkY2OxYT
	 VP12/ucZwOufW3KinwO4arfo6BLYv/eQJ+7aPHno=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DFCEF805A9; Tue,  2 Jan 2024 20:50:04 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 57974F805AD;
	Tue,  2 Jan 2024 20:50:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4BDAF80551; Tue,  2 Jan 2024 20:49:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0BF0AF80424
	for <alsa-devel@alsa-project.org>; Tue,  2 Jan 2024 20:49:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BF0AF80424
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=bf4NxG2c;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=HzUos/6b;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=bf4NxG2c;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=HzUos/6b
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 720B01F802;
	Sat, 30 Dec 2023 10:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1703930617;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gcV5OU5SfV1BLtRf/EedR9E5OkftoptDTaAhrFBDOoM=;
	b=bf4NxG2cGncc0PtqMEY+4pb7JVTvB7R5ob0fOUCe64TO3zeBOH3nFkvwtyT7RuUNmWNYs7
	lk27j55tP8Ci+Fh1NKEpT2LEynHBo3XO6nJvjkeZCQXETt75v5CQ1+t2eTHBHkEZu5hGTf
	sp2j5ecfi2FtxIl4OvKhnqLrnA4BakM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1703930617;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gcV5OU5SfV1BLtRf/EedR9E5OkftoptDTaAhrFBDOoM=;
	b=HzUos/6bV6cJcGoq6zsFmUcqrSCN7tH/mHfxFLE25u10gM75cdcPmZHegvD7iZ92xzwOsx
	ux+Iq181mjHxuxBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1703930617;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gcV5OU5SfV1BLtRf/EedR9E5OkftoptDTaAhrFBDOoM=;
	b=bf4NxG2cGncc0PtqMEY+4pb7JVTvB7R5ob0fOUCe64TO3zeBOH3nFkvwtyT7RuUNmWNYs7
	lk27j55tP8Ci+Fh1NKEpT2LEynHBo3XO6nJvjkeZCQXETt75v5CQ1+t2eTHBHkEZu5hGTf
	sp2j5ecfi2FtxIl4OvKhnqLrnA4BakM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1703930617;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gcV5OU5SfV1BLtRf/EedR9E5OkftoptDTaAhrFBDOoM=;
	b=HzUos/6bV6cJcGoq6zsFmUcqrSCN7tH/mHfxFLE25u10gM75cdcPmZHegvD7iZ92xzwOsx
	ux+Iq181mjHxuxBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 16442136D1;
	Sat, 30 Dec 2023 10:03:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id uoEgBPnqj2WwPQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 30 Dec 2023 10:03:37 +0000
Date: Sat, 30 Dec 2023 11:03:36 +0100
Message-ID: <87plyovwg7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: peter.ujfalusi@linux.intel.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
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
In-Reply-To: <ZY_Gb8-rncuOjRq-@shine.dominikbrodowski.net>
References: <ZYvUIxtrqBQZbNlC@shine.dominikbrodowski.net>
	<87sf3lxiet.wl-tiwai@suse.de>
	<ZY7kosArPqhlCfOA@shine.dominikbrodowski.net>
	<874jg1x7ao.wl-tiwai@suse.de>
	<ZY_Gb8-rncuOjRq-@shine.dominikbrodowski.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-2.31 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DKIM_TRACE(0.00)[suse.de:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_TWELVE(0.00)[13];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,kernel.org,perex.cz,suse.com,alsa-project.org,vger.kernel.org,lists.linux.dev];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=bf4NxG2c;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="HzUos/6b"
X-Rspamd-Queue-Id: 720B01F802
Message-ID-Hash: XSZTLT5KGXWWA7IDCOD5ZYKC5WGBCYYX
X-Message-ID-Hash: XSZTLT5KGXWWA7IDCOD5ZYKC5WGBCYYX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XSZTLT5KGXWWA7IDCOD5ZYKC5WGBCYYX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 30 Dec 2023 08:27:43 +0100,
Dominik Brodowski wrote:
> 
> Am Fri, Dec 29, 2023 at 06:11:43PM +0100 schrieb Takashi Iwai:
> > On Fri, 29 Dec 2023 16:24:18 +0100,
> > Dominik Brodowski wrote:
> > > 
> > > Hi Takashi,
> > > 
> > > many thanks for your response. Your patch helps half-way: the oops goes
> > > away, but so does the sound... With your patch, the decisive lines in dmesg
> > > are:
> > > 
> > > 	sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware info: version 2:2:0-57864
> > > 	sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware: ABI 3:22:1 Kernel ABI 3:23:0
> > > 	sof_sdw sof_sdw: ASoC: CODEC DAI intel-hdmi-hifi1 not registered
> > > 	sof_sdw sof_sdw: snd_soc_register_card failed -517
> > > 	sof_sdw sof_sdw: ASoC: CODEC DAI intel-hdmi-hifi1 not registered
> > > 	sof_sdw sof_sdw: snd_soc_register_card failed -517
> > > 	platform sof_sdw: deferred probe pending
> > > 
> > > With a revert of the a0575b4add21, it is:
> > > 
> > > 	sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware info: version 2:2:0-57864
> > > 	sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware: ABI 3:22:1 Kernel ABI 3:23:0
> > > 	sof-audio-pci-intel-tgl 0000:00:1f.3: Topology: ABI 3:22:1 Kernel ABI 3:23:0
> > > 	sof_sdw sof_sdw: ASoC: Parent card not yet available, widget card binding deferred
> > > 	sof_sdw sof_sdw: hda_dsp_hdmi_build_controls: no PCM in topology for HDMI converter 3
> > > 	input: sof-soundwire HDMI/DP,pcm=5 as /devices/pci0000:00/0000:00:1f.3/sof_sdw/sound/card0/input14
> > > 	input: sof-soundwire HDMI/DP,pcm=6 as /devices/pci0000:00/0000:00:1f.3/sof_sdw/sound/card0/input15
> > > 	input: sof-soundwire HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:1f.3/sof_sdw/sound/card0/input16
> > > 
> > > Maybe this helps a bit further?
> > 
> > Thanks for quick testing.
> > It shows at least that my guess wasn't wrong.
> > 
> > The problem could be the initialization order in the caller side.
> > Can the patch below work instead?
> 
> Unfortunately, no:
> 
> sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware info: version 2:2:0-57864
> sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware: ABI 3:22:1 Kernel ABI 3:23:0
> sof_sdw sof_sdw: ASoC: CODEC DAI intel-hdmi-hifi1 not registered
> sof_sdw sof_sdw: snd_soc_register_card failed -517
> sof_sdw sof_sdw: ASoC: CODEC DAI intel-hdmi-hifi1 not registered
> sof_sdw sof_sdw: snd_soc_register_card failed -517
> platform sof_sdw: deferred probe pending

Hm, then it might be the logical failure of that commit.
Peter?

Without a fix in the next few days, we'll have to revert it before
6.7.


thanks,

Takashi
