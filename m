Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3E0AFA3A3
	for <lists+alsa-devel@lfdr.de>; Sun,  6 Jul 2025 10:22:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 542C3601FD;
	Sun,  6 Jul 2025 10:22:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 542C3601FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1751790172;
	bh=yKHTUzkMRD/ZbcIS6Da8x1PhdCbAr9s1IP9CUSF7XL4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=P9DJh+LRtpHQOpwDd25EztWcAa8ld4/dkMBIKwUbqSQtR2VMDKit7SQlT0KODUIx1
	 PRUSHgvfpZ9+/kGH6bIXJhbY+P5Zv4RdzwceItaQ7Xu3BSQa/CD5NaCgOI8/mqeFYa
	 Mon3l6rxaTx+0p09GZkefd62cIfD45yrIyw+eyY8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49D3CF805C5; Sun,  6 Jul 2025 10:22:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 230D4F805C6;
	Sun,  6 Jul 2025 10:22:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E4B0F804B3; Sun,  6 Jul 2025 10:22:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9786DF800B6
	for <alsa-devel@alsa-project.org>; Sun,  6 Jul 2025 10:22:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9786DF800B6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=wEanTL1T;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=YLI61KKj;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.a=rsa-sha256 header.s=susede2_rsa header.b=wEanTL1T;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=YLI61KKj
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4ADCE1F388;
	Sun,  6 Jul 2025 08:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1751790129;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r8S0lBmASZZL78tqk4ub0Y7rTMGUKgNcqPQuidlP1Pk=;
	b=wEanTL1TtydfJPW95pNjRNSzJ0B3ox/Sm9r4RREO89KhESP/r2oVGWl0BAVBGXNLQFffXo
	vbdcgvtrZyhnyoVJ+qsTPnoXA68xhqZJn5Wewtb5QCZwitKARYrzqXuNjDQl6dXBLuXnj1
	alZ+FVn//WvfXuV8qRCB0Rw6v6gt6PQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751790129;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r8S0lBmASZZL78tqk4ub0Y7rTMGUKgNcqPQuidlP1Pk=;
	b=YLI61KKjtO4Q49pvSXAmOYMS6+ZJET+LSqBtUKSWxpLtG5g4CqLv2vX7JCjLrCLIWW/BUF
	mTwNYaymG0cLMxAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=wEanTL1T;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=YLI61KKj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1751790129;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r8S0lBmASZZL78tqk4ub0Y7rTMGUKgNcqPQuidlP1Pk=;
	b=wEanTL1TtydfJPW95pNjRNSzJ0B3ox/Sm9r4RREO89KhESP/r2oVGWl0BAVBGXNLQFffXo
	vbdcgvtrZyhnyoVJ+qsTPnoXA68xhqZJn5Wewtb5QCZwitKARYrzqXuNjDQl6dXBLuXnj1
	alZ+FVn//WvfXuV8qRCB0Rw6v6gt6PQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1751790129;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r8S0lBmASZZL78tqk4ub0Y7rTMGUKgNcqPQuidlP1Pk=;
	b=YLI61KKjtO4Q49pvSXAmOYMS6+ZJET+LSqBtUKSWxpLtG5g4CqLv2vX7JCjLrCLIWW/BUF
	mTwNYaymG0cLMxAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DE70913A29;
	Sun,  6 Jul 2025 08:22:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VruUNDAyamhnWwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 06 Jul 2025 08:22:08 +0000
Date: Sun, 06 Jul 2025 10:22:08 +0200
Message-ID: <87zfdhn2z3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Baojun Xu <baojun.xu@ti.com>
Cc: <broonie@kernel.org>,
	<andriy.shevchenko@linux.intel.com>,
	<alsa-devel@alsa-project.org>,
	<shenghao-ding@ti.com>,
	<navada@ti.com>,
	<13916275206@139.com>,
	<v-hampiholi@ti.com>,
	<v-po@ti.com>,
	<linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] ALSA: hda/tas2781: Add bus name in device name check
In-Reply-To: <20250705025333.24346-1-baojun.xu@ti.com>
References: <20250705025333.24346-1-baojun.xu@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Queue-Id: 4ADCE1F388
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[139.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,alsa-project.org,ti.com,139.com,vger.kernel.org];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[11];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid]
Message-ID-Hash: 4ZGLYNQQJMHI2WGWB4YHDC3S2IKET5JW
X-Message-ID-Hash: 4ZGLYNQQJMHI2WGWB4YHDC3S2IKET5JW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4ZGLYNQQJMHI2WGWB4YHDC3S2IKET5JW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 05 Jul 2025 04:53:33 +0200,
Baojun Xu wrote:
> 
> Device name start from bus name, as we use strstarts()
> to do compare, need add it for TXNW2781 device.
> 
> Fixes: b2904df0a347 ("ALSA: hda/tas2781: Add compatible for hardware id TIAS2781 and TXNW2781")
> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>

Applied now.  Thanks.


Takashi
