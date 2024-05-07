Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C268E8BE2EF
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2024 15:05:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D612D826;
	Tue,  7 May 2024 15:05:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D612D826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715087138;
	bh=1dBXOfKIqa1iWTt+dKLPUl5EtlG+zkg8uA7QiORazBE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pTyMe6eQ7bCjs7D/TIT4sAOoq0/WN6jay8fM8PqeHrVVWkGA4vfmKlY2HYbJkaG7q
	 iFjAXSlrGTZAzCl59WGxcrEi5b85n/pp7RgDUB/vrTdYH4U0AMm1Hlht+Qp6UhcSx6
	 TwC2NBFr/QIq6PXrVlU7A+gR7f6Bpf0O4LzdyOFU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 409CCF804E7; Tue,  7 May 2024 15:05:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FBECF80580;
	Tue,  7 May 2024 15:05:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 678A4F8049C; Tue,  7 May 2024 15:05:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 171D4F80152
	for <alsa-devel@alsa-project.org>; Tue,  7 May 2024 15:04:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 171D4F80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=KN7qjhQo;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=MIuc94hQ;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=KN7qjhQo;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=MIuc94hQ
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 378AE33F07;
	Tue,  7 May 2024 13:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1715087094;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+576eNXIXH7acYOv5kAfJsPPJ6gfQZfnrCWYRgf0fCM=;
	b=KN7qjhQok1Rgk5eCnHvOO1G7k1FDIEqhl/YLpBTSEhS6Jo0RqUjs1jD+Pcn3qZxmmwlKqw
	6+us6hC1Ngj444QwL/M31BqqkNF9bxaMShjpK79i9B2DspWaLmMMcOW79MCawIh2EQZ3WD
	sFQRHnDgAr6CoJVoaDzaokxhMoHOZ4E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715087094;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+576eNXIXH7acYOv5kAfJsPPJ6gfQZfnrCWYRgf0fCM=;
	b=MIuc94hQmcpaL8AtmDPYt8dIkE4u76HH2Xlw8MP1Z9o1wvsEtkuHTlUyyo6WQQvyaSmIzB
	NilNYFF9TngpRYBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=KN7qjhQo;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=MIuc94hQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1715087094;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+576eNXIXH7acYOv5kAfJsPPJ6gfQZfnrCWYRgf0fCM=;
	b=KN7qjhQok1Rgk5eCnHvOO1G7k1FDIEqhl/YLpBTSEhS6Jo0RqUjs1jD+Pcn3qZxmmwlKqw
	6+us6hC1Ngj444QwL/M31BqqkNF9bxaMShjpK79i9B2DspWaLmMMcOW79MCawIh2EQZ3WD
	sFQRHnDgAr6CoJVoaDzaokxhMoHOZ4E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1715087094;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+576eNXIXH7acYOv5kAfJsPPJ6gfQZfnrCWYRgf0fCM=;
	b=MIuc94hQmcpaL8AtmDPYt8dIkE4u76HH2Xlw8MP1Z9o1wvsEtkuHTlUyyo6WQQvyaSmIzB
	NilNYFF9TngpRYBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F3C84139CB;
	Tue,  7 May 2024 13:04:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yVP7OvUmOmaFIAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 07 May 2024 13:04:53 +0000
Date: Tue, 07 May 2024 15:05:08 +0200
Message-ID: <87cypxeprv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Baojun Xu <baojun.xu@ti.com>,
	robh+dt@kernel.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	pierre-louis.bossart@linux.intel.com,
	kevin-lu@ti.com,
	shenghao-ding@ti.com,
	navada@ti.com,
	13916275206@139.com,
	v-po@ti.com,
	niranjan.hy@ti.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	liam.r.girdwood@intel.com,
	yung-chuan.liao@linux.intel.com,
	broonie@kernel.org,
	soyer@irl.hu
Subject: Re: [PATCH v4 1/3] ALSA: hda/tas2781: Add tas2781 hda driver based on
 SPI
In-Reply-To: <ZjD1-NSC3X_7JcQg@smile.fi.intel.com>
References: <20240430072544.1877-1-baojun.xu@ti.com>
	<20240430072544.1877-2-baojun.xu@ti.com>
	<87jzkfm2hp.wl-tiwai@suse.de>
	<ZjD1-NSC3X_7JcQg@smile.fi.intel.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 378AE33F07
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[139.com,gmail.com];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,gmail.com,perex.cz,linux.intel.com,139.com,alsa-project.org,vger.kernel.org,intel.com,irl.hu];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
Message-ID-Hash: SIEUHGKHDVAJEZVL6ZPSZDJQVEHRVVTH
X-Message-ID-Hash: SIEUHGKHDVAJEZVL6ZPSZDJQVEHRVVTH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SIEUHGKHDVAJEZVL6ZPSZDJQVEHRVVTH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 30 Apr 2024 15:45:28 +0200,
Andy Shevchenko wrote:
> 
> On Tue, Apr 30, 2024 at 02:58:10PM +0200, Takashi Iwai wrote:
> > On Tue, 30 Apr 2024 09:25:42 +0200, Baojun Xu wrote:
> 
> ...
> 
> > >  snd-hda-cs-dsp-ctls-objs :=		hda_cs_dsp_ctl.o
> > >  snd-hda-scodec-component-objs :=	hda_component.o
> > >  snd-hda-scodec-tas2781-i2c-objs :=	tas2781_hda_i2c.o
> > > +snd-hda-scodec-tas2781-spi-y :=	tas2781_hda_spi.o tas2781_spi_fwlib.o
> > 
> > A nitpicking: better to align with other lines (i.e. with *-objs
> > instead of *-y).
> 
> I object this. The better approach is to have a precursor patch that switches
> to y over objs (the latter is for user space code / tools).

Indeed it can be a good cleanup, yeah.  Let me try.


thanks,

Takashi
