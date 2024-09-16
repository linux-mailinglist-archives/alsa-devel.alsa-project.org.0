Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5421B979C07
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Sep 2024 09:30:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1BE0E8E;
	Mon, 16 Sep 2024 09:29:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1BE0E8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726471801;
	bh=j9e8m4a1T6VTfjH18wvCXIvvnpn+FoPe5QeLbmyqI1A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gvffuwFXryZ/LbonnIr0a4ONmrr5Z8k41rw0wJoW2EQ3j+kWZdZ6xGTZaQleQ7x2V
	 gueTZoqj+qZu1WLhUQU0tG4p4dMPpEO2DApRGung7+xfuBIVohpqXpW91kWAWfrB0o
	 p8O0Y3q3xAFyAehJgfZUsGcC8RgyJyj5+cmjdDSA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6D5DEF805B3; Mon, 16 Sep 2024 09:29:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 55B79F80269;
	Mon, 16 Sep 2024 09:29:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 080D4F8020D; Mon, 16 Sep 2024 09:29:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 57669F80107
	for <alsa-devel@alsa-project.org>; Mon, 16 Sep 2024 09:29:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57669F80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Q9gS+DeN;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=CgOAiH2b;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=Q9gS+DeN;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=CgOAiH2b
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 444DE1F86B;
	Mon, 16 Sep 2024 07:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1726471762;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1bBgueuxUZvbQExAimI3tYuObMSYYaUPWGJbo808X5w=;
	b=Q9gS+DeNuTBVDoSXv6QxXSr1eThAyx5aEZnDZEJuuKHrSE5OEPbVIsO6kDx7ptXFlDecMP
	IDSC+9aNkK+JmDfeVKVD9g3XpCQOXmC0NMZez+QS76IDVwTUqLLUeaJytzQShxIJUVpXKE
	HQjQjeRmsIlSj0dbkyu7AAXXDQHnN68=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1726471762;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1bBgueuxUZvbQExAimI3tYuObMSYYaUPWGJbo808X5w=;
	b=CgOAiH2btemuKf2o+pnnQ3tlOo8Pvxu42HlYSl9wmUSSEEl8wiEn/c5A8oBfG6hTNi0+en
	VKi7+rjeOZ8UJCAw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Q9gS+DeN;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=CgOAiH2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1726471762;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1bBgueuxUZvbQExAimI3tYuObMSYYaUPWGJbo808X5w=;
	b=Q9gS+DeNuTBVDoSXv6QxXSr1eThAyx5aEZnDZEJuuKHrSE5OEPbVIsO6kDx7ptXFlDecMP
	IDSC+9aNkK+JmDfeVKVD9g3XpCQOXmC0NMZez+QS76IDVwTUqLLUeaJytzQShxIJUVpXKE
	HQjQjeRmsIlSj0dbkyu7AAXXDQHnN68=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1726471762;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1bBgueuxUZvbQExAimI3tYuObMSYYaUPWGJbo808X5w=;
	b=CgOAiH2btemuKf2o+pnnQ3tlOo8Pvxu42HlYSl9wmUSSEEl8wiEn/c5A8oBfG6hTNi0+en
	VKi7+rjeOZ8UJCAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0B2831397F;
	Mon, 16 Sep 2024 07:29:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id s2UjAVLe52YALQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 16 Sep 2024 07:29:22 +0000
Date: Mon, 16 Sep 2024 09:30:11 +0200
Message-ID: <87wmjc8398.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Christoph Hellwig <hch@infradead.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Ariadne Conill <ariadne@ariadne.space>,
	xen-devel@lists.xenproject.org,
	alsa-devel@alsa-project.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] Revert "ALSA: memalloc: Workaround for Xen PV"
In-Reply-To: <ZufdOjFCdqQQX7tz@infradead.org>
References: <20240906184209.25423-1-ariadne@ariadne.space>
	<877cbnewib.wl-tiwai@suse.de>
	<9eda21ac-2ce7-47d5-be49-65b941e76340@citrix.com>
	<ZuK6xcmAE4sngFqk@infradead.org>
	<874j6g9ifp.wl-tiwai@suse.de>
	<ZufdOjFCdqQQX7tz@infradead.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 444DE1F86B
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
Message-ID-Hash: R3NWAD2GSVORCCTG7NIVTXD3C262Y4YP
X-Message-ID-Hash: R3NWAD2GSVORCCTG7NIVTXD3C262Y4YP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R3NWAD2GSVORCCTG7NIVTXD3C262Y4YP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 16 Sep 2024 09:24:42 +0200,
Christoph Hellwig wrote:
> 
> On Mon, Sep 16, 2024 at 09:16:58AM +0200, Takashi Iwai wrote:
> > Yes, all those are really ugly hacks and have been already removed for
> > 6.12.  Let's hope everything works as expected with it.
> 
> The code currently in linux-next will not work as explained in my
> previous mail, because it tries to side step the DMA API and abuses
> get_dma_ops in an unsupported way.

Those should have been removed since the last week.
Could you check the today's linux-next tree?


thanks,

Takashi
