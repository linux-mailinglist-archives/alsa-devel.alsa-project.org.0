Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3108ACB41D
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Jun 2025 16:48:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D79F601E6;
	Mon,  2 Jun 2025 16:48:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D79F601E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1748875712;
	bh=Wj6YL7lFPgWchDxVtC2mSZmKreUprD0S0huqwE7ccNs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CC/HoIhglsW9g7rprjCItD0U1li8qfztyMbW93ps77yaJxfmmcE2VfWryw+YBJD3x
	 kXvGMjAwNipqLMc/+AMRvCCnz6mhxQOcBYz910uNAjqec5o04uo4llwCGgJ/JRH3Aj
	 zIcr0LsbKPfPUNc8832ZaNoXLIQHWXLIvD8m7ivs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0432DF805BE; Mon,  2 Jun 2025 16:47:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EC0E3F805BD;
	Mon,  2 Jun 2025 16:47:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 717E8F80533; Mon,  2 Jun 2025 16:47:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F1913F8016E
	for <alsa-devel@alsa-project.org>; Mon,  2 Jun 2025 16:47:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1913F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=TK5OBG0s;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=oaZptSvc;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=1tQT6AZa;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=gbycWsQ9
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CF23D2128B;
	Mon,  2 Jun 2025 14:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1748875667;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aqEsf6q70H30o4xbnY9EWsifgP82PL0AbdPvEThMh6A=;
	b=TK5OBG0s22EdxueBDi/6kqgpSdZiFJAnU1Z7L2/q54W+FTm7wuDVsQURDV1HE9LbrYEa/W
	CSKIF0IPROpEEgCSAMK7NP9IRzFl7A6LCDgJ1ihOaCbcprRaZNsUYGDBJl7EAa2NjtlD0p
	Vgt4Zr1CSUX1l9LTKgJrHPbZYsxTsKs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748875667;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aqEsf6q70H30o4xbnY9EWsifgP82PL0AbdPvEThMh6A=;
	b=oaZptSvcCT+8qlflnWurF0KrVBBO08ePnTub9wIVH/Niek82JPPfRfybZe4XjvlrGdEt/Z
	QlBbnf+8tNb7PMAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1tQT6AZa;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=gbycWsQ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1748875666;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aqEsf6q70H30o4xbnY9EWsifgP82PL0AbdPvEThMh6A=;
	b=1tQT6AZar8wUkyV5mzET33diW1T71TnReYuKI3rIcJ5T60BuFssH23qwEGRJ7UieW0VOo9
	kCAshZYhgQtZvZr2yqoQumPRtSx6mTm0r5ObxkmiQeBdVeZLlk+S5zZkR0PV9GUJyMcl2w
	dFGHhVSP3nl3EPuQieoLhmx3OclFZE0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1748875666;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aqEsf6q70H30o4xbnY9EWsifgP82PL0AbdPvEThMh6A=;
	b=gbycWsQ9Zbk2OlSbgu6n0TP7YfPfs5lDTtvJ+A/ymm4kxBCSSpHEJCOFNy22pdRLPlKn7v
	rILDamCS162GAiBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D0F3D13AE0;
	Mon,  2 Jun 2025 14:47:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VEAXMZG5PWgLXgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 02 Jun 2025 14:47:45 +0000
Date: Mon, 02 Jun 2025 16:47:45 +0200
Message-ID: <87tt4yxkry.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Cc: "Mukunda, Vijendar" <Vijendar.Mukunda@amd.com>,
	"perex@perex.cz"
	<perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
	"linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ALSA: hda: Add new pci id for AMD GPU display HD audio
 controller
In-Reply-To: 
 <BL1PR12MB51449240DD771DB4C8005890F766A@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20250529053838.2350071-1-Vijendar.Mukunda@amd.com>
	<BL1PR12MB51449240DD771DB4C8005890F766A@BL1PR12MB5144.namprd12.prod.outlook.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: CF23D2128B
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,suse.de:dkim,suse.de:mid,suse.com:email,alsa-project.org:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
Message-ID-Hash: BD5UAVRRVBHE3IPLA75C2SH3J6GRJEA7
X-Message-ID-Hash: BD5UAVRRVBHE3IPLA75C2SH3J6GRJEA7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BD5UAVRRVBHE3IPLA75C2SH3J6GRJEA7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 29 May 2025 22:26:07 +0200,
Deucher, Alexander wrote:
> 
> [Public]
> 
> > -----Original Message-----
> > From: Mukunda, Vijendar <Vijendar.Mukunda@amd.com>
> > Sent: Thursday, May 29, 2025 1:38 AM
> > To: perex@perex.cz; tiwai@suse.com
> > Cc: alsa-devel@alsa-project.org; Dommati, Sunil-kumar <Sunil-
> > kumar.Dommati@amd.com>; Deucher, Alexander
> > <Alexander.Deucher@amd.com>; linux-sound@vger.kernel.org; linux-
> > kernel@vger.kernel.org; Mukunda, Vijendar <Vijendar.Mukunda@amd.com>
> > Subject: [PATCH] ALSA: hda: Add new pci id for AMD GPU display HD audio
> > controller
> >
> > Add new pci id for AMD GPU display HD audio controller(device id- 0xab40).
> >
> > Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> 
> Is there a way we can just add a default entry for all ATI HDMI HDA
> endpoints?  It would avoid then need to add an entry every time we
> release a new endpoint DID.

We have already catch-all entries for ATI and AMD vendors, but those
are setup without AZX_DRIVER_ATIHDMI_NS, that is, for older chip
models.


Takashi
