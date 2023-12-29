Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BAE82225D
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jan 2024 21:00:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45C27E72;
	Tue,  2 Jan 2024 21:00:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45C27E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704225636;
	bh=tAeumU5W3mfjcjmK1+IrYypnAzVaSGS2jDS8EWF1Nmg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T1sCJEUtw8D9QFY+IwvXxOWIdJIm2NtbULv9UCj+VIV/nBx+aOb9lj/dPP++doHBz
	 cLQPhL2nRBx8V2tLifo99F7FngaeGAXgmsnTTKdG9h8OMScIWv3AXAFFfEjbkIQ+bN
	 dNPInuNb/lJUFmLZdCcrM7ZRWQLG/P31OPYiKbmQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 654CDF80549; Tue,  2 Jan 2024 21:00:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D9D4AF80224;
	Tue,  2 Jan 2024 21:00:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E454F80224; Tue,  2 Jan 2024 20:59:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8331FF80051
	for <alsa-devel@alsa-project.org>; Tue,  2 Jan 2024 20:59:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8331FF80051
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=UpNxwBNU;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=xoXxYk3N;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=UpNxwBNU;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=xoXxYk3N
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B7AA7210E8;
	Fri, 29 Dec 2023 13:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1703855499;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1SMttDN0tPAZBYaY00M7P3J2vnCq4aqJ9U0hr67XHeo=;
	b=UpNxwBNU9zhPLNuIVKFlk+vkvMho33GBdtTR79bS8LlYqRrxubHisi2+UdvKJukIWPcsyC
	LHpG6tjYdk4pdDuMiLPAg7dbMnd3I9ufG2xjZV2jW/eC5TlW452A6RR/rDslgh/hQeYvqx
	0CCnBb/HXRasfIsZwwegC9PvuMq5vE0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1703855499;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1SMttDN0tPAZBYaY00M7P3J2vnCq4aqJ9U0hr67XHeo=;
	b=xoXxYk3NZWWa0fMaP2msG8hROkLT74zrpL2DYnS/qIe8MLg705eYAZ7BEuqAsOqH76bzPR
	EUETOPMGAxVYqxAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1703855499;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1SMttDN0tPAZBYaY00M7P3J2vnCq4aqJ9U0hr67XHeo=;
	b=UpNxwBNU9zhPLNuIVKFlk+vkvMho33GBdtTR79bS8LlYqRrxubHisi2+UdvKJukIWPcsyC
	LHpG6tjYdk4pdDuMiLPAg7dbMnd3I9ufG2xjZV2jW/eC5TlW452A6RR/rDslgh/hQeYvqx
	0CCnBb/HXRasfIsZwwegC9PvuMq5vE0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1703855499;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1SMttDN0tPAZBYaY00M7P3J2vnCq4aqJ9U0hr67XHeo=;
	b=xoXxYk3NZWWa0fMaP2msG8hROkLT74zrpL2DYnS/qIe8MLg705eYAZ7BEuqAsOqH76bzPR
	EUETOPMGAxVYqxAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4597F133E5;
	Fri, 29 Dec 2023 13:11:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id vH6YDovFjmXpbAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 29 Dec 2023 13:11:39 +0000
Date: Fri, 29 Dec 2023 14:11:38 +0100
Message-ID: <87sf3lxiet.wl-tiwai@suse.de>
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
In-Reply-To: <ZYvUIxtrqBQZbNlC@shine.dominikbrodowski.net>
References: <ZYvUIxtrqBQZbNlC@shine.dominikbrodowski.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
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
	 FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,kernel.org,perex.cz,suse.com,alsa-project.org,vger.kernel.org,lists.linux.dev];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
Authentication-Results: smtp-out1.suse.de;
	none
Message-ID-Hash: LBMIIFKG2AGCRVGXK4AM7YVFT5RV53ZR
X-Message-ID-Hash: LBMIIFKG2AGCRVGXK4AM7YVFT5RV53ZR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LBMIIFKG2AGCRVGXK4AM7YVFT5RV53ZR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 27 Dec 2023 08:37:07 +0100,
Dominik Brodowski wrote:
> 
> Hi,
> 
> unfortunately, the latest 6.7.0-rc7 and the two previous rc kernels cause an
> oops in hdac_hda_dev_probe(); sound and resume-from-suspend subsequently do
> not work:
> 
> 
> BUG: kernel NULL pointer dereference, address: 0000000000000078
> #PF: supervisor read access in kernel mode
> #PF: error_code(0x0000) - not-present page
> PGD 0
> P4D 0
> Oops: 0000 [#1] PREEMPT SMP NOPTI
> Hardware name: Dell Inc. XPS 9315/00KRKP, BIOS 1.1.3 05/11/2022
> Workqueue: events sof_probe_work
> 
> RIP: 0010:hdac_hda_dev_probe+0x42/0xf0
> Code: 48 8b 37 48 8b bb c8 04 00 00 e8 09 9b 0a 00 48 85 c0 48 89 c5 0f 84 a6 00 00 00 48 8b bb c8 04 00 00 48 89 c6 e8 1e 9a 0a 00 <41> 80 7c 24 78 00 75 46 b9 03 00 00 00 48 c7 c2 c0 b2 a1 ac 48 c7
> RSP: 0000:ffffc90000207b50 EFLAGS: 00010246
> 
> RAX: 0000000000000000 RBX: ffff88811495d000 RCX: 0000000000000000
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> RBP: ffff888108691600 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
> R13: 0000000000000000 R14: 0000000000000000 R15: ffff88811400b028
> FS:  0000000000000000(0000) GS:ffff88886f500000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000078 CR3: 00000002b7a5a000 CR4: 0000000000f50ef0
> PKRU: 55555554
> Call Trace:
>  <TASK>
>  ? __die+0x1e/0x70
>  ? page_fault_oops+0x17c/0x4b0
>  ? snd_hdac_ext_bus_link_get+0x24/0xc0
>  ? exc_page_fault+0x462/0x8e0
>  ? asm_exc_page_fault+0x26/0x30
>  ? hdac_hda_dev_probe+0x42/0xf0
>  really_probe+0x166/0x300
>  ? __pfx___device_attach_driver+0x10/0x10
>  __driver_probe_device+0x6e/0x120
>  driver_probe_device+0x1a/0x90
>  __device_attach_driver+0x8e/0xd0
>  bus_for_each_drv+0x90/0xf0
>  __device_attach+0xac/0x1a0
>  bus_probe_device+0x93/0xb0
>  device_add+0x669/0x860
>  snd_hdac_device_register+0x10/0x60
>  hda_codec_probe_bus+0x189/0x290
>  hda_dsp_probe+0x211/0x550
>  sof_probe_work+0x2c/0x430
>  ? process_one_work+0x19c/0x500
>  process_one_work+0x205/0x500
>  worker_thread+0x1dc/0x3e0
> 
>  ? __pfx_worker_thread+0x10/0x10
>  kthread+0xea/0x120
>  ? __pfx_kthread+0x10/0x10
>  ret_from_fork+0x2c/0x50
>  ? __pfx_kthread+0x10/0x10
>  ret_from_fork_asm+0x1b/0x30
>  </TASK>
> Modules linked in:
> CR2: 0000000000000078
> ---[ end trace 0000000000000000 ]---
> RIP: 0010:hdac_hda_dev_probe+0x42/0xf0
> Code: 48 8b 37 48 8b bb c8 04 00 00 e8 09 9b 0a 00 48 85 c0 48 89 c5 0f 84 a6 00 00 00 48 8b bb c8 04 00 00 48 89 c6 e8 1e 9a 0a 00 <41> 80 7c 24 78 00 75 46 b9 03 00 00 00 48 c7 c2 c0 b2 a1 ac 48 c7
> RSP: 0000:ffffc90000207b50 EFLAGS: 00010246
> RAX: 0000000000000000 RBX: ffff88811495d000 RCX: 0000000000000000
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> RBP: ffff888108691600 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
> R13: 0000000000000000 R14: 0000000000000000 R15: ffff88811400b028
> FS:  0000000000000000(0000) GS:ffff88886f500000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000078 CR3: 00000002b7a5a000 CR4: 0000000000f50ef0
> PKRU: 55555554
> note: kworker/2:0[24] exited with irqs disabled
> 
> 
> I was able to bisect the issue to commit a0575b4add21 ("ASoC: hdac_hda:
> Conditionally register dais for HDMI and Analog"). Reverting that patch on
> top of mainline fixes it.

As I've been (and still am) off, I had too little time for taking a
deeper look now, unfortunately.  But my wild guess is that it's a NULL
dereference of the hdac_hda_priv referred via hdac dev.  If it's
correct, a oneliner like below should work around the crash.
Could you give it a try?


thanks,

Takashi

-- 8< --
--- a/sound/soc/codecs/hdac_hda.c
+++ b/sound/soc/codecs/hdac_hda.c
@@ -630,7 +630,7 @@ static int hdac_hda_dev_probe(struct hdac_device *hdev)
 	snd_hdac_ext_bus_link_get(hdev->bus, hlink);
 
 	/* ASoC specific initialization */
-	if (hda_pvt->need_display_power)
+	if (hda_pvt && hda_pvt->need_display_power)
 		ret = devm_snd_soc_register_component(&hdev->dev,
 						&hdac_hda_hdmi_codec, hdac_hda_hdmi_dais,
 						ARRAY_SIZE(hdac_hda_hdmi_dais));
