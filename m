Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AE6A14CF8
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jan 2025 11:07:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F390660403;
	Fri, 17 Jan 2025 11:07:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F390660403
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1737108475;
	bh=4nmBK5Y10xZcj6H4h/c/lxSMWMkz9xO5YfSG5O3ExHM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hGtQBFFznMtcL8MAxQlOGYSfrYHGn7C3OcvhJz+rTql0h1N7C0/FzLuHiO++/dOkC
	 eqzZ0Scc2iLfhBZCWcMhMT2FuxvsNkLz6URE+2ooQN3/qHFav/kAObn8yIN59VnRGT
	 YTcKIFFqXTLoTx2oiGd92x71FMG7xn4mF/jfsbf4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44B75F805BB; Fri, 17 Jan 2025 11:07:26 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E926FF805B6;
	Fri, 17 Jan 2025 11:07:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A089DF8028B; Fri, 17 Jan 2025 11:07:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E62F6F800B6
	for <alsa-devel@alsa-project.org>; Fri, 17 Jan 2025 11:06:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E62F6F800B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=u59TjU+P;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=tL2UeiCe;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=u59TjU+P;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=tL2UeiCe
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8CF7321181;
	Fri, 17 Jan 2025 10:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1737108413;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UMbQBTLczLBM3YAodIMvkUZ6q1XFlIgUXFPXCY2jW40=;
	b=u59TjU+PshWxLnSittsY8jJbcga7yZ385D1Ga8jtFzfV2CgvnpYKpGGtsbCEE1CBlah/hG
	RJRv162tjmkfv1jG+VVg78iN47UCh2YN9WRAF5FaazSRkJn7YIQKgZ7i2lg4zwszj8p4Q5
	/NLaLPOZPt7LGCwi2PJItHYuMeOtF5E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737108413;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UMbQBTLczLBM3YAodIMvkUZ6q1XFlIgUXFPXCY2jW40=;
	b=tL2UeiCevAzEif/xvSfjBLr9borSzqHVokFruugqPuPfD4MVkYWtvPhoBbTFHChcKbHMaE
	mJdw1gFzwtZ+tNDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=u59TjU+P;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=tL2UeiCe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1737108413;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UMbQBTLczLBM3YAodIMvkUZ6q1XFlIgUXFPXCY2jW40=;
	b=u59TjU+PshWxLnSittsY8jJbcga7yZ385D1Ga8jtFzfV2CgvnpYKpGGtsbCEE1CBlah/hG
	RJRv162tjmkfv1jG+VVg78iN47UCh2YN9WRAF5FaazSRkJn7YIQKgZ7i2lg4zwszj8p4Q5
	/NLaLPOZPt7LGCwi2PJItHYuMeOtF5E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1737108413;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UMbQBTLczLBM3YAodIMvkUZ6q1XFlIgUXFPXCY2jW40=;
	b=tL2UeiCevAzEif/xvSfjBLr9borSzqHVokFruugqPuPfD4MVkYWtvPhoBbTFHChcKbHMaE
	mJdw1gFzwtZ+tNDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5C16C139CB;
	Fri, 17 Jan 2025 10:06:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8d0sFb0rimd2HQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 17 Jan 2025 10:06:53 +0000
Date: Fri, 17 Jan 2025 11:06:52 +0100
Message-ID: <87tt9xsqir.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: Evgeny Kapun <abacabadabacaba@gmail.com>,
	Linux Sound Mailing List <linux-sound@vger.kernel.org>,
	"Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
	Linux Regressions Mailing List
	<regressions@lists.linux.dev>,
	Linux Stable Mailing List
	<stable@vger.kernel.org>,
	" (alsa-devel@alsa-project.org)"
	<alsa-devel@alsa-project.org>
Subject: Re: [REGRESSION] Distorted sound on Acer Aspire A115-31 laptop
In-Reply-To: <0a89b6c18ed94378a105fa61e9f290e4@realtek.com>
References: <e142749b-7714-4733-9452-918fbe328c8f@gmail.com>
	<8734ijwru5.wl-tiwai@suse.de>
	<57883f2e-49cd-4aa4-9879-7dcdf7fec6df@gmail.com>
	<87ldw89l7e.wl-tiwai@suse.de>
	<fc506097-9d04-442c-9efd-c9e7ce0f3ace@gmail.com>
	<58300a2a06e34f3e89bf7a097b3cd4ca@realtek.com>
	<0494014b-3aa2-4102-8b5b-7625d8c864e2@gmail.com>
	<87a5bqj0mb.wl-tiwai@suse.de>
	<0a89b6c18ed94378a105fa61e9f290e4@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 8CF7321181
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid,suse.de:email,linux.dev:email,realtek.com:email];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.linux.dev,alsa-project.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,linux.dev:email,suse.de:dkim,suse.de:mid,suse.de:email]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: AYFIW2ROBSBDDGV6PH6EAIHYDMCR3ODT
X-Message-ID-Hash: AYFIW2ROBSBDDGV6PH6EAIHYDMCR3ODT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AYFIW2ROBSBDDGV6PH6EAIHYDMCR3ODT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 17 Jan 2025 08:48:46 +0100,
Kailang wrote:
> 
> Attached.

Thanks, now applied.


Takashi

> 
> > -----Original Message-----
> > From: Takashi Iwai <tiwai@suse.de>
> > Sent: Thursday, January 16, 2025 10:27 PM
> > To: Evgeny Kapun <abacabadabacaba@gmail.com>
> > Cc: Kailang <kailang@realtek.com>; Takashi Iwai <tiwai@suse.de>; Linux
> > Sound Mailing List <linux-sound@vger.kernel.org>; Linux Kernel Mailing List
> > <linux-kernel@vger.kernel.org>; Linux Regressions Mailing List
> > <regressions@lists.linux.dev>; Linux Stable Mailing List
> > <stable@vger.kernel.org>
> > Subject: Re: [REGRESSION] Distorted sound on Acer Aspire A115-31 laptop
> > 
> > 
> > External mail.
> > 
> > 
> > 
> > On Sat, 11 Jan 2025 16:00:33 +0100,
> > Evgeny Kapun wrote:
> > >
> > > On 12/24/24 04:54, Kailang wrote:
> > > > Please test attach patch.
> > >
> > > This patch, when applied to kernel version 6.12.8, appears to fix the
> > > issue. There are no distortions, and the left and the right channel
> > > can be controlled independently.
> > 
> > Good to hear.
> > 
> > Kailang, care to submit a proper patch for merging?
> > 
> > 
> > thanks,
> > 
> > Takashi
> 
